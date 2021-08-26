Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051BB3F8467
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 11:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CA16E5C0;
	Thu, 26 Aug 2021 09:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F387A6E5C8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 09:20:31 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id m2so1425391wmm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=yHlALSnGxG8uye35vQfKyHqGGuQzjJ2VTRjhnXVE/3U=;
 b=jkNlzmUQI/DJWQNiufrA3luKsFs32TWojUQ6iY6DQ0tZpEiDxn8xQsWHyu7UF+MZQB
 gfA+sKoxeoavHK7gg60pt110z/CxmQqbmfT1GOUaS8CXZHDlDzUFU1F8lYj7G/pW12BF
 AtEClydR1IS6AM77VknxvgkLlKZTpyqwYyBOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=yHlALSnGxG8uye35vQfKyHqGGuQzjJ2VTRjhnXVE/3U=;
 b=LcC2I1Gp1XKwdGzZ9fIPomjh23+wRcJe92qdXT+BUC+I+tVKCsETwelupM6nL9Ejc6
 60vYW62IyDOsZs6/kxP5PJYQqUms73BS3+4b+oB326S4GlBQvXx6sNvcUf69E0yzQEwt
 uYd3gJdI9wsg2MCrbuIlaEzOuYLWlzXAJRYwlkLQMIEb37cCv9TfOoJXGQ1tUXCN15Yy
 fUcnmu4e+AUHxYOIxOUitIW8PCikbgmfOJIwcrPlp+usKQ2EBltloTGq/zALOLK5MmTf
 zdBOTpnYz32PYNObjvMGWSUlj/f6w+1W5vaqoqOGXD8y1i1vkOvPBy/MGA6PO3mS0kfx
 1yfQ==
X-Gm-Message-State: AOAM530UT3Ws0SxKXlFeNHgsaEUcjkeCFyf9Rb/XN+tugHBobaFKryFt
 6IRMa/9O8TR4vwx7IR1QujGCvA==
X-Google-Smtp-Source: ABdhPJwJRdtLA+a/UfV0ThWE1EetugzWtrrdBk+ckywRYYQSWoc8wPbrlqqg2jYcKqIAY0naNQ0WOA==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr2601769wmq.101.1629969630463; 
 Thu, 26 Aug 2021 02:20:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y1sm2177118wmq.43.2021.08.26.02.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 02:20:29 -0700 (PDT)
Date: Thu, 26 Aug 2021 11:20:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-rpi-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/probe-helper: Create a HPD IRQ event helper for
 a single connector
Message-ID: <YSdc3O7u5Z9J28t+@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-rpi-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org
References: <20210819134454.850031-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819134454.850031-1-maxime@cerno.tech>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Thu, Aug 19, 2021 at 03:44:53PM +0200, Maxime Ripard wrote:
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
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 105 ++++++++++++++++++++---------
>  include/drm/drm_probe_helper.h     |   1 +
>  2 files changed, 74 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 5606bca3caa8..7e3cbb4333ce 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -795,6 +795,77 @@ void drm_kms_helper_poll_fini(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_kms_helper_poll_fini);
>  
> +static bool
> +_drm_connector_helper_hpd_irq_event(struct drm_connector *connector,
> +				    bool notify)
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
> +	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Old epoch counter %llu\n",
> +		      connector->base.id,
> +		      connector->name,
> +		      old_epoch_counter);
> +
> +	connector->status = drm_helper_probe_detect(connector, NULL,
> +						    false);
> +	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] status updated from %s to %s\n",
> +		      connector->base.id,
> +		      connector->name,
> +		      drm_get_connector_status_name(old_status),
> +		      drm_get_connector_status_name(connector->status));
> +
> +	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] New epoch counter %llu\n",
> +		      connector->base.id,
> +		      connector->name,
> +		      connector->epoch_counter);
> +
> +	/*
> +	 * Check if epoch counter had changed, meaning that we need
> +	 * to send a uevent.
> +	 */
> +	if (old_epoch_counter != connector->epoch_counter)
> +		changed = true;
> +
> +	if (changed && notify) {
> +		drm_kms_helper_hotplug_event(dev);
> +		DRM_DEBUG_KMS("Sent hotplug event\n");
> +	}
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
> + * interrupts for a single connector.
> + *
> + * This function must be called with the mode setting locks held.
> + *
> + * Note that a connector can be both polled and probed from the hotplug
> + * handler, in case the hotplug interrupt is known to be unreliable.
> + */

Adding a sentence here to point to the other helper for global hpd irq and
vice versa would be neat.
-Daniel

> +bool drm_connector_helper_hpd_irq_event(struct drm_connector *connector)
> +{
> +	return _drm_connector_helper_hpd_irq_event(connector, true);
> +}
> +EXPORT_SYMBOL(drm_connector_helper_hpd_irq_event);
> +
>  /**
>   * drm_helper_hpd_irq_event - hotplug processing
>   * @dev: drm_device
> @@ -822,9 +893,7 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
>  {
>  	struct drm_connector *connector;
>  	struct drm_connector_list_iter conn_iter;
> -	enum drm_connector_status old_status;
>  	bool changed = false;
> -	u64 old_epoch_counter;
>  
>  	if (!dev->mode_config.poll_enabled)
>  		return false;
> @@ -832,37 +901,9 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
>  	mutex_lock(&dev->mode_config.mutex);
>  	drm_connector_list_iter_begin(dev, &conn_iter);
>  	drm_for_each_connector_iter(connector, &conn_iter) {
> -		/* Only handle HPD capable connectors. */
> -		if (!(connector->polled & DRM_CONNECTOR_POLL_HPD))
> -			continue;
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
> +		if (_drm_connector_helper_hpd_irq_event(connector,
> +							false))
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

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
