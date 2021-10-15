Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C642FC52
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 21:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F52A6E3CE;
	Fri, 15 Oct 2021 19:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CC16E3CE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 19:42:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="291456607"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="291456607"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 12:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="442632449"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 15 Oct 2021 12:41:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Oct 2021 22:41:57 +0300
Date: Fri, 15 Oct 2021 22:41:57 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] drm/probe-helper: use
 drm_kms_helper_connector_hotplug_event
Message-ID: <YWnZhWxamYafxNd2@intel.com>
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-6-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211015163336.95188-6-contact@emersion.fr>
X-Patchwork-Hint: comment
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 15, 2021 at 04:33:45PM +0000, Simon Ser wrote:
> If an hotplug event only updates a single connector, use
> drm_kms_helper_connector_hotplug_event instead of
> drm_kms_helper_hotplug_event.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 3aef3b188c99..6049dc92324b 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -927,7 +927,7 @@ EXPORT_SYMBOL(drm_connector_helper_hpd_irq_event);
>   */
>  bool drm_helper_hpd_irq_event(struct drm_device *dev)
>  {
> -	struct drm_connector *connector;
> +	struct drm_connector *connector, *changed_connector = NULL;
>  	struct drm_connector_list_iter conn_iter;
>  	bool changed = false;
>  
> @@ -941,15 +941,27 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
>  		if (!(connector->polled & DRM_CONNECTOR_POLL_HPD))
>  			continue;
>  
> -		if (check_connector_changed(connector))
> +		if (check_connector_changed(connector)) {
> +			if (changed) {
> +				if (changed_connector)
> +					drm_connector_put(changed_connector);
> +				changed_connector = NULL;
> +			} else {
> +				drm_connector_get(connector);
> +				changed_connector = connector;
> +			}
> +
>  			changed = true;

So many things that "changed". Would it not be simpler to just grab the
first changed connector always, and count how many there were in total?

> +		}
>  	}
>  	drm_connector_list_iter_end(&conn_iter);
>  	mutex_unlock(&dev->mode_config.mutex);
>  
> -	if (changed) {
> +	if (changed_connector) {
> +		drm_kms_helper_connector_hotplug_event(changed_connector);
> +		drm_connector_put(changed_connector);
> +	} else if (changed) {
>  		drm_kms_helper_hotplug_event(dev);
> -		DRM_DEBUG_KMS("Sent hotplug event\n");
>  	}
>  
>  	return changed;
> -- 
> 2.33.1
> 

-- 
Ville Syrjälä
Intel
