Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6CF42FC65
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 21:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742C16EDDB;
	Fri, 15 Oct 2021 19:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C926EDDB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 19:44:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="288838290"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="288838290"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 12:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="525533566"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 15 Oct 2021 12:44:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Oct 2021 22:44:47 +0300
Date: Fri, 15 Oct 2021 22:44:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 6/6] i915/display/dp: send a more fine-grained
 link-status uevent
Message-ID: <YWnaL4WtISzv4msR@intel.com>
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-7-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211015163336.95188-7-contact@emersion.fr>
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

On Fri, Oct 15, 2021 at 04:33:46PM +0000, Simon Ser wrote:
> When link-status changes, send a hotplug uevent which contains the
> connector and property ID. That way, user-space can more easily
> figure out that only the link-status property of this connector has
> been updated.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 04175f359fd6..afbe34b6e5be 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5264,6 +5264,8 @@ static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
>  	mutex_unlock(&connector->dev->mode_config.mutex);
>  	/* Send Hotplug uevent so userspace can reprobe */
>  	drm_kms_helper_hotplug_event(connector->dev);
> +	drm_sysfs_connector_status_event(connector,
> +					 connector->dev->mode_config.link_status_property);

So we're now doing two uevents back to back? Is one not enough?

>  }
>  
>  bool
> -- 
> 2.33.1
> 

-- 
Ville Syrjälä
Intel
