Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4653E932340
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 11:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16DD10E616;
	Tue, 16 Jul 2024 09:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="FEVxjmCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2523A10E616
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 09:46:09 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-426719e2efeso5964465e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 02:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721123167; x=1721727967; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=G+JTP1BLzEgn3LTiaV90rOPtpqtMkHtveC+CtZwmaO0=;
 b=FEVxjmCH0BvZgTqClpeTSAIZilW74okJVXVKbguw/Qi4a0vGISndKGcbOCLdtrkiuJ
 XhIMgWvhMDPUnCzRbFPwmhT1qzCXP+Z9cfCwUIBLhHL+WFGAsFycnd7eS2JpSOiuS0gU
 hoSk3W1tvJohwy1d+u5D0MP2J8KZ9CPVHJZRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721123167; x=1721727967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G+JTP1BLzEgn3LTiaV90rOPtpqtMkHtveC+CtZwmaO0=;
 b=EtwGYK7Kh/7kcVVEgI25R/NWXntE98UivoDkfYjXQnn25AQhjcGRT4hCBYssvC/8eG
 7hth7AQDVwqPf6abj7KUk78J3LITFgv5SKjOSE7XoMcnyWllsVvmjdEVwbllMEi2RQkd
 +j2HWzSK4xKlA4R4HalVP34mr8xkjOVbq3rcSVVECqxTmOi1QMKXL+2We+V5YPNC/OP8
 Z9T5oqjPmD0OaYRJTvcqtpJtfO6B09m4VknzIQv24AEKxGzH74sRTKwu9BDjuSHeE5ui
 aHn0VlwhR74TUcW7nd3xRWr/4JnGhgfH+mhFOHYNF/tzZ2pehF2d05ILchwzWRj+M5js
 Zcaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXhqy3U15njjazP5UW4Axq8K5iOzMX/E73Mmw5lIYmHvbUKUpVUL1pgbSxmGMBmfk20FhuEnsQD2EzUIyLgs8L7igjwqvFHG6hcWxz9Yor
X-Gm-Message-State: AOJu0YzyDLr9/nQDCTlcwXRSTAROp52WmZqokHBWKngiwvgCRZHfsLIT
 9939izSS/2sL7ZxluZIQq/P0N9/0lcnwhIXBgdLD6sy44RsCBcmOAVHqPGsoEl0=
X-Google-Smtp-Source: AGHT+IEs8RaCbbZEvyQwVBKvOLx+NC1GlylBG6MJMV9FxwaKCRD1lAyuI+9PEigjEmd04Adi20L7Yw==
X-Received: by 2002:a05:600c:1d1e:b0:426:668f:5ed7 with SMTP id
 5b1f17b1804b1-427b889bd2dmr9739025e9.2.1721123167431; 
 Tue, 16 Jul 2024 02:46:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427ba20aaf8sm16427065e9.0.2024.07.16.02.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 02:46:06 -0700 (PDT)
Date: Tue, 16 Jul 2024 11:46:05 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/7] drm/probe-helper: Optionally report single connected
 output per CRTC
Message-ID: <ZpZBXXMf1KRCn1hd@phenom.ffwll.local>
References: <20240715093936.793552-1-tzimmermann@suse.de>
 <20240715093936.793552-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715093936.793552-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Mon, Jul 15, 2024 at 11:38:58AM +0200, Thomas Zimmermann wrote:
> For CRTCs with multiple outputs (i.e., encoders plus connectors),
> only report at most a single connected output to userspace. Make
> this configurable via CONFIG_DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT.
> 
> Having multiple connected outputs on the same CRTC complicates
> display-mode and format selection, so most userspace does not
> support this. This is mostly not a problem in practice, as modern
> display hardware provides a separate CRTC for each output. On
> old hardware or hardware with BMCs, a single CRTC often drives
> multiple displays. Only reporting one of them as connected makes
> the hardware compatible with common userspace.
> 
> Add the field prioritized_connectors to struct drm_connector. The
> bitmask signals which other connectors have priority. Also provide
> the helper drm_probe_helper_prioritize_connectors() that sets
> default priorities for a given set of connectors. Calling the
> helper should be enough to set up the functionality for most drivers.
> 
> With the prioritization bits in place, update connector-status
> detection to test against prioritized conenctors. So when the probe
> helpers detect a connector as connected, test against the prioritized
> connectors. If any is also connected, set the connector status to
> disconnected.
> 
> Please note that this functionality is a workaround for limitations
> in userspace. If your compositor supports multiple outputs per CRTC,
> CONFIG_DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT should be disabled.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/Kconfig            |  15 +++++
>  drivers/gpu/drm/drm_probe_helper.c | 104 +++++++++++++++++++++++++++++
>  include/drm/drm_connector.h        |   2 +
>  include/drm/drm_probe_helper.h     |   2 +
>  4 files changed, 123 insertions(+)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index fd0749c0c630..d1afdbd2d93b 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -105,6 +105,21 @@ config DRM_KMS_HELPER
>  	help
>  	  CRTC helpers for KMS drivers.
>  
> +config DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT
> +       bool "Report only a single connected output per CRTC"
> +       depends on DRM
> +       default n
> +       help
> +         CRTCs can support multiple encoders and connectors for output.
> +         More than one pair can be connected to a display at a time. Most
> +         userspace only supports at most one connected output per CRTC at a
> +	 time. Enable this option to let DRM report at most one connected
> +	 output per CRTC. This is mostly relevant for low-end and old
> +	 hardware. Most modern graphics hardware supports a separate CRTC
> +	 per output and won't be affected by this setting.
> +
> +         If in doubt, say "Y".

Uh I think this is way too much, because this defacto makes this uapi for
all drivers, forever.

The reason we added the hacks for the bmc connectors was the old "no
regressions" rule: Adding the BMC connectors broke the setup for existing
users, we can't have that, hence why the hack was needed. For any new
driver, or for new platforms, we don't have this regression problem.

So I think the better way to lift this code from ast/mga is if we a lot
more focused workaround:

- Add a new probe helper for subordinate connectors, they will report
  disconnected if any other connector is connected.

- Put a really big warning onto that function that it should only be used
  as a workaround for the regression case, not anywhere else.

- Ideally drivers also don't use that for any new chips where the "no
  regression" rule doesn't apply.

- I wouldn't bother with the Kconfig, because if we make it a global
  option we cannot ever change it anyway. The only way to phase this out
  is by never applying this hack to new hardware support.

I think it would be also good to link to the specific userspace that falls
over, and how it falls over. At least hunting around in git history for
ast/mga200 didn't reveal anything.

Cheers, Sima
> +
>  config DRM_PANIC
>  	bool "Display a user-friendly message when a kernel panic occurs"
>  	depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index f14301abf53f..fc0652635148 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -352,6 +352,74 @@ static int detect_connector_status(struct drm_connector *connector,
>  	return connector_status_connected;
>  }
>  
> +static int reported_connector_status(struct drm_connector *connector, int detected_status,
> +				     struct drm_modeset_acquire_ctx *ctx, bool force)
> +{
> +#if defined(CONFIG_DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT)
> +	struct drm_connector *prio_connector = connector;
> +	struct drm_device *dev = connector->dev;
> +	struct drm_connector_list_iter iter;
> +	struct drm_connector *pos;
> +	u32 connector_mask;
> +	int ret = 0;
> +
> +	if (!connector->prioritized_connectors)
> +		return detected_status;
> +
> +	if (detected_status != connector_status_connected)
> +		return detected_status;
> +
> +	connector_mask = drm_connector_mask(connector);
> +
> +	/*
> +	 * Find the connector with status 'connected' and a higher
> +	 * priority.
> +	 */
> +	drm_connector_list_iter_begin(dev, &iter);
> +	drm_for_each_connector_iter(pos, &iter) {
> +		if (!(drm_connector_mask(pos) & connector->prioritized_connectors))
> +			continue;
> +
> +		/*
> +		 * Warn if connector has priority over itself.
> +		 */
> +		if (drm_WARN_ON_ONCE(dev, pos == connector))
> +			continue;
> +
> +		/*
> +		 * Warn if both connectors have priority over each other. Pick the
> +		 * one with the lower index.
> +		 */
> +		if (drm_WARN_ON_ONCE(dev, pos->prioritized_connectors & connector_mask)) {
> +			if (pos->index > connector->index)
> +				continue;
> +		}
> +
> +		ret = detect_connector_status(pos, ctx, force);
> +		if (ret < 0)
> +			break;
> +		if (ret == connector_status_disconnected)
> +			continue;
> +
> +		prio_connector = pos;
> +		break;
> +	}
> +	drm_connector_list_iter_end(&iter);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * We've found another connected connector. Report our connector
> +	 * as 'disconnected'.
> +	 */
> +	if (prio_connector != connector)
> +		detected_status = connector_status_disconnected;
> +#endif
> +
> +	return detected_status;
> +}
> +
>  static enum drm_connector_status
>  drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
>  {
> @@ -373,6 +441,12 @@ drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
>  	if (WARN_ON(ret < 0))
>  		ret = connector_status_unknown;
>  
> +	ret = reported_connector_status(connector, ret, &ctx, force);
> +	if (ret == -EDEADLK) {
> +		drm_modeset_backoff(&ctx);
> +		goto retry;
> +	}
> +
>  	if (ret != connector->status)
>  		connector->epoch_counter += 1;
>  
> @@ -408,6 +482,7 @@ drm_helper_probe_detect(struct drm_connector *connector,
>  		return ret;
>  
>  	ret = detect_connector_status(connector, ctx, force);
> +	ret = reported_connector_status(connector, ret, ctx, force);
>  
>  	if (ret != connector->status)
>  		connector->epoch_counter += 1;
> @@ -416,6 +491,35 @@ drm_helper_probe_detect(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_helper_probe_detect);
>  
> +/**
> + * drm_probe_helper_prioritize_connectors - Set connector priorities
> + * @dev: the DRM device with connectors
> + * @connector_mask: Bitmask connector indices
> + *
> + * drm_probe_helper_prioritize_connectors() prioritizes all connectors
> + * specified in @connector_mask. All given connectors are assumed to
> + * interfere with each other. Connectors with a lower index have priority
> + * over connectors with a higher index.
> + */
> +void drm_probe_helper_prioritize_connectors(struct drm_device *dev, u32 connector_mask)
> +{
> +	struct drm_connector_list_iter iter;
> +	struct drm_connector *connector;
> +	u32 prioritized_connectors = 0;
> +
> +	drm_connector_list_iter_begin(dev, &iter);
> +	drm_for_each_connector_iter(connector, &iter) {
> +		u32 mask = drm_connector_mask(connector);
> +
> +		if (!(mask & connector_mask))
> +			continue;
> +		connector->prioritized_connectors = prioritized_connectors;
> +		prioritized_connectors |= mask;
> +	}
> +	drm_connector_list_iter_end(&iter);
> +}
> +EXPORT_SYMBOL(drm_probe_helper_prioritize_connectors);
> +
>  static int drm_helper_probe_get_modes(struct drm_connector *connector)
>  {
>  	const struct drm_connector_helper_funcs *connector_funcs =
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 5ad735253413..e3039478e928 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1985,6 +1985,8 @@ struct drm_connector {
>  	/** @epoch_counter: used to detect any other changes in connector, besides status */
>  	u64 epoch_counter;
>  
> +	u32 prioritized_connectors;
> +
>  	/**
>  	 * @possible_encoders: Bit mask of encoders that can drive this
>  	 * connector, drm_encoder_index() determines the index into the bitfield
> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
> index d6ce7b218b77..05e23485550d 100644
> --- a/include/drm/drm_probe_helper.h
> +++ b/include/drm/drm_probe_helper.h
> @@ -17,6 +17,8 @@ int drm_helper_probe_detect(struct drm_connector *connector,
>  			    struct drm_modeset_acquire_ctx *ctx,
>  			    bool force);
>  
> +void drm_probe_helper_prioritize_connectors(struct drm_device *dev, u32 connector_mask);
> +
>  int drmm_kms_helper_poll_init(struct drm_device *dev);
>  void drm_kms_helper_poll_init(struct drm_device *dev);
>  void drm_kms_helper_poll_fini(struct drm_device *dev);
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
