Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B91242FCBA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 22:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94DA6E25B;
	Fri, 15 Oct 2021 20:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036956E25B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 20:03:20 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id f678bbef-2df2-11ec-ac3c-0050568cd888;
 Fri, 15 Oct 2021 20:03:28 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 07238194B53;
 Fri, 15 Oct 2021 22:03:26 +0200 (CEST)
Date: Fri, 15 Oct 2021 22:03:17 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] drm/probe-helper: use
 drm_kms_helper_connector_hotplug_event
Message-ID: <YWnehSIgW1YOrOba@ravnborg.org>
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-6-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015163336.95188-6-contact@emersion.fr>
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

Hi Simon,

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
This code is a little confusing to read.

In case we have only one connector with a change we hit the else part.
What we really want to find out is if we have one or more connectors
with a change.
We could do something like:

	struct drm_connector *changed_connector = NULL;
	int changes = 0;


	...

	/* Find if we have one or more changed connectors */
	drm_for_each_connector_iter(connector, &conn_iter) {
		if (!(connector->polled & DRM_CONNECTOR_POLL_HPD))
			continue;

		if (check_connector_changed(connector)) {
			if (!changes) {
				changed_connector = connector;
				drm_connector_get(changed_connector);
			}

			changes++;
		}
	}
	drm_connector_list_iter_end(&conn_iter);
	mutex_unlock(&dev->mode_config.mutex);

	if (changes == 1)
		drm_kms_helper_connector_hotplug_event(changed_connector);
	else if (changes > 1)
		drm_kms_helper_hotplug_event(dev);

	if (changed_connector)
		drm_connector_put(changed_connector);


Maybe the only reason why I think this is better is bc I wrote it?!?

	Sam
