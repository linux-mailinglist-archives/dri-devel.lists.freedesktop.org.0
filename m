Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9942409D66
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 21:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E8F6E233;
	Mon, 13 Sep 2021 19:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274DE6E233
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 19:49:15 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id a5040253-14cb-11ec-9416-0050568cd888;
 Mon, 13 Sep 2021 19:49:02 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id AB861194BCB;
 Mon, 13 Sep 2021 21:49:03 +0200 (CEST)
Date: Mon, 13 Sep 2021 21:49:09 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Emma Anholt <emma@anholt.net>, linux-rpi-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/probe-helper: Create a HPD IRQ event helper
 for a single connector
Message-ID: <YT+rNWslVgmEp8BC@ravnborg.org>
References: <20210830094910.150713-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830094910.150713-1-maxime@cerno.tech>
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

Hi Maxime,

thanks for the ping on irc. I had accidently deleted v2 of this patch.

	Sam

On Mon, Aug 30, 2021 at 11:49:09AM +0200, Maxime Ripard wrote:
> The drm_helper_hpd_irq_event() function is iterating over all the
> connectors when an hotplug event is detected.
> 
> During that iteration, it will call each connector detect function and
> figure out if its status changed.
> 
> Finally, if any connector changed, it will notify the user-space and the
> clients that something changed on the DRM device.
> 
> This is supposed to be used for drivers that don't have a hotplug
> interrupt for individual connectors. However, drivers that can use an
> interrupt for a single connector are left in the dust and can either
> reimplement the logic used during the iteration for each connector or
> use that helper and iterate over all connectors all the time.
> 
> Since both are suboptimal, let's create a helper that will only perform
> the status detection on a single connector.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

A few comments in the following.

	Sam

> 
> ---
> 
> Changes from v1:
>   - Rename the shared function
>   - Move the hotplug event notification out of the shared function
>   - Added missing locks
>   - Improve the documentation
>   - Switched to drm_dbg_kms
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 120 ++++++++++++++++++++---------
>  include/drm/drm_probe_helper.h     |   1 +
>  2 files changed, 86 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 5606bca3caa8..fcf32ec0b0c8 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -795,6 +795,86 @@ void drm_kms_helper_poll_fini(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_kms_helper_poll_fini);
>  
> +static bool check_connector_changed(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	enum drm_connector_status old_status;
> +	u64 old_epoch_counter;
> +	bool changed = false;
> +
> +	/* Only handle HPD capable connectors. */
> +	drm_WARN_ON(dev, !(connector->polled & DRM_CONNECTOR_POLL_HPD));
> +
> +	drm_WARN_ON(dev, !mutex_is_locked(&dev->mode_config.mutex));
> +
> +	old_status = connector->status;
> +	old_epoch_counter = connector->epoch_counter;
> +
> +	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Old epoch counter %llu\n",
> +		    connector->base.id,
> +		    connector->name,
> +		    old_epoch_counter);
> +
> +	connector->status = drm_helper_probe_detect(connector, NULL, false);
> +	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] status updated from %s to %s\n",
> +		    connector->base.id,
> +		    connector->name,
> +		    drm_get_connector_status_name(old_status),
> +		    drm_get_connector_status_name(connector->status));
> +
> +	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] New epoch counter %llu\n",
> +		    connector->base.id,
> +		    connector->name,
> +		    connector->epoch_counter);
> +
> +	/*
> +	 * Check if epoch counter had changed, meaning that we need
> +	 * to send a uevent.
> +	 */
> +	if (old_epoch_counter != connector->epoch_counter)
> +		changed = true;

If logging is included here we could do it like:
   	if (old_epoch_counter != connector->epoch_counter) {
		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Changed epoch counter %llu => %llu\n",
                    connector->base.id,
                    connector->name,
		    old_epoch_counter,
                    connector->epoch_counter);
		return true;
	} else {
		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Same epoch counter %llu\n",
                    connector->base.id,
                    connector->name,
                    connector->epoch_counter);
		return false;
	}
}	

So we only log epoch counter once.
And the changed local variable is gone.

Just a suggestion.

> +
> +	return changed;
> +}
> +
> +/**
> + * drm_connector_helper_hpd_irq_event - hotplug processing
> + * @connector: drm_connector
> + *
> + * Drivers can use this helper function to run a detect cycle on a connector
> + * which has the DRM_CONNECTOR_POLL_HPD flag set in its &polled member.
> + *
> + * This helper function is useful for drivers which can track hotplug
> + * interrupts for a single connector. Drivers that want to send a
> + * hotplug event for all connectors or can't track hotplug interrupts
> + * per connector need to use drm_helper_hpd_irq_event().
> + *
> + * This function must be called from process context with no mode
> + * setting locks held.
> + *
> + * Note that a connector can be both polled and probed from the hotplug
> + * handler, in case the hotplug interrupt is known to be unreliable.

Documentation of the return value would be nice.

> + */
> +bool drm_connector_helper_hpd_irq_event(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	bool changed;
> +
> +	mutex_lock(&dev->mode_config.mutex);
> +	changed = check_connector_changed(connector);
> +	mutex_unlock(&dev->mode_config.mutex);
> +
> +	if (changed) {
> +		drm_kms_helper_hotplug_event(dev);
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Sent hotplug event\n",
> +			    connector->base.id,
> +			    connector->name);
> +	}
> +
> +	return changed;
> +}
> +EXPORT_SYMBOL(drm_connector_helper_hpd_irq_event);
> +
>  /**
>   * drm_helper_hpd_irq_event - hotplug processing
>   * @dev: drm_device
> @@ -808,9 +888,10 @@ EXPORT_SYMBOL(drm_kms_helper_poll_fini);
>   * interrupts for each connector.
>   *
>   * Drivers which support hotplug interrupts for each connector individually and
> - * which have a more fine-grained detect logic should bypass this code and
> - * directly call drm_kms_helper_hotplug_event() in case the connector state
> - * changed.
> + * which have a more fine-grained detect logic can use
> + * drm_connector_helper_hpd_irq_event(). Alternatively, they should bypass this
> + * code and directly call drm_kms_helper_hotplug_event() in case the connector
> + * state changed.
>   *
>   * This function must be called from process context with no mode
>   * setting locks held.

Documentation of the return value would also be nice here.
There are a few uses of the return value so we cannot just ignore it.

> @@ -822,9 +903,7 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
>  {
>  	struct drm_connector *connector;
>  	struct drm_connector_list_iter conn_iter;
> -	enum drm_connector_status old_status;
>  	bool changed = false;
> -	u64 old_epoch_counter;
>  
>  	if (!dev->mode_config.poll_enabled)
>  		return false;
> @@ -832,37 +911,8 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
>  	mutex_lock(&dev->mode_config.mutex);
>  	drm_connector_list_iter_begin(dev, &conn_iter);
>  	drm_for_each_connector_iter(connector, &conn_iter) {
> -		/* Only handle HPD capable connectors. */
> -		if (!(connector->polled & DRM_CONNECTOR_POLL_HPD))
> -			continue;
The old code skips connectors without DRM_CONNECTOR_POLL_HPD,
where the new code will WARN is DRM_CONNECTOR_POLL_HPD is not set.
This seems like a bigger change than what is intended.

> -
> -		old_status = connector->status;
> -
> -		old_epoch_counter = connector->epoch_counter;
> -
> -		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Old epoch counter %llu\n", connector->base.id,
> -			      connector->name,
> -			      old_epoch_counter);
> -
> -		connector->status = drm_helper_probe_detect(connector, NULL, false);
> -		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] status updated from %s to %s\n",
> -			      connector->base.id,
> -			      connector->name,
> -			      drm_get_connector_status_name(old_status),
> -			      drm_get_connector_status_name(connector->status));
> -
> -		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] New epoch counter %llu\n",
> -			      connector->base.id,
> -			      connector->name,
> -			      connector->epoch_counter);
> -
> -		/*
> -		 * Check if epoch counter had changed, meaning that we need
> -		 * to send a uevent.
> -		 */
> -		if (old_epoch_counter != connector->epoch_counter)
> +		if (check_connector_changed(connector))
>  			changed = true;
> -
>  	}
>  	drm_connector_list_iter_end(&conn_iter);
>  	mutex_unlock(&dev->mode_config.mutex);
> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
> index 8d3ed2834d34..04c57564c397 100644
> --- a/include/drm/drm_probe_helper.h
> +++ b/include/drm/drm_probe_helper.h
> @@ -18,6 +18,7 @@ int drm_helper_probe_detect(struct drm_connector *connector,
>  void drm_kms_helper_poll_init(struct drm_device *dev);
>  void drm_kms_helper_poll_fini(struct drm_device *dev);
>  bool drm_helper_hpd_irq_event(struct drm_device *dev);
> +bool drm_connector_helper_hpd_irq_event(struct drm_connector *connector);
>  void drm_kms_helper_hotplug_event(struct drm_device *dev);
>  
>  void drm_kms_helper_poll_disable(struct drm_device *dev);
> -- 
> 2.31.1
> 
