Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0B18C24B2
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 14:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636D510E147;
	Fri, 10 May 2024 12:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUMsSSt8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDBE10E147
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 12:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715343640; x=1746879640;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uyCrPXG3qlIXXNh1Ld6iws3SNXWyilOo4tmzNxrl1Z8=;
 b=ZUMsSSt8egF95x+akBqCNKzcymP5pR9WHg623FXVRQk6km5cI5um9IDb
 hCgKEMGtXwfnCkiRSv6Kb1DXFZjMdQ+elSDHQEK/q0qNZVhAE9qujZVv1
 KGq58Qi5KLFdxFPX4uj7GWXuvsQ+P+6P5VHYB+ekv2R9leLALtxIqa1JF
 oa/6MSWuOwXLT23QUxRD/bhZD587R2CJ040zJiaPx4e7H9aoZiL+eA58z
 6t0t/T79qLSfPzoeANxuMOPSJNksfYJhz/Em/J/pGNXdfYB0zRLmCdVwI
 aEV4x2M0Jm6jit+iV7tq/W3az9OWYKzjlAasJhAxocH/nTbwscdnvhw0w g==;
X-CSE-ConnectionGUID: vV+TxQmkSOS9AJ4vBdfP6g==
X-CSE-MsgGUID: /KMuOjCCT0mdoz9J53/6NA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15155598"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="15155598"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:20:39 -0700
X-CSE-ConnectionGUID: wL6wdWSqTN6JyNMmhY6Frw==
X-CSE-MsgGUID: OXQC/TH9RvKa7tfqx8dMRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="52808369"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:20:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@redhat.com, sean@poorly.run
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 5/5] drm/udl: Remove struct udl_connector
In-Reply-To: <20240410120928.26487-6-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240410120928.26487-1-tzimmermann@suse.de>
 <20240410120928.26487-6-tzimmermann@suse.de>
Date: Fri, 10 May 2024 15:20:33 +0300
Message-ID: <87r0e9hn8u.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 10 Apr 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Udl's struct udl_connector is an empty wrapper around struct
> drm_connector. Remove it. Allocate the connector as part of struct
> udl_device and inline the init function into its only caller.
>
> v2:
> - fix return value in udl_modeset_init() (Dan)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

The patch does what it says on the box, but I don't know the driver
enough to say if this is the reasonable thing to do. With that,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/udl/udl_drv.h     | 10 +------
>  drivers/gpu/drm/udl/udl_modeset.c | 49 +++++++------------------------
>  2 files changed, 11 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
> index f112cfb270f31..1eb716d9dad57 100644
> --- a/drivers/gpu/drm/udl/udl_drv.h
> +++ b/drivers/gpu/drm/udl/udl_drv.h
> @@ -49,15 +49,6 @@ struct urb_list {
>  	size_t size;
>  };
>  
> -struct udl_connector {
> -	struct drm_connector connector;
> -};
> -
> -static inline struct udl_connector *to_udl_connector(struct drm_connector *connector)
> -{
> -	return container_of(connector, struct udl_connector, connector);
> -}
> -
>  struct udl_device {
>  	struct drm_device drm;
>  	struct device *dev;
> @@ -66,6 +57,7 @@ struct udl_device {
>  	struct drm_plane primary_plane;
>  	struct drm_crtc crtc;
>  	struct drm_encoder encoder;
> +	struct drm_connector connector;
>  
>  	struct mutex gem_lock;
>  
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index 4236ce57f5945..bbb04f98886a2 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -444,49 +444,14 @@ static const struct drm_connector_helper_funcs udl_connector_helper_funcs = {
>  	.detect_ctx = udl_connector_helper_detect_ctx,
>  };
>  
> -static void udl_connector_destroy(struct drm_connector *connector)
> -{
> -	struct udl_connector *udl_connector = to_udl_connector(connector);
> -
> -	drm_connector_cleanup(connector);
> -	kfree(udl_connector);
> -}
> -
>  static const struct drm_connector_funcs udl_connector_funcs = {
>  	.reset = drm_atomic_helper_connector_reset,
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = udl_connector_destroy,
> +	.destroy = drm_connector_cleanup,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> -struct drm_connector *udl_connector_init(struct drm_device *dev)
> -{
> -	struct udl_connector *udl_connector;
> -	struct drm_connector *connector;
> -	int ret;
> -
> -	udl_connector = kzalloc(sizeof(*udl_connector), GFP_KERNEL);
> -	if (!udl_connector)
> -		return ERR_PTR(-ENOMEM);
> -
> -	connector = &udl_connector->connector;
> -	ret = drm_connector_init(dev, connector, &udl_connector_funcs, DRM_MODE_CONNECTOR_VGA);
> -	if (ret)
> -		goto err_kfree;
> -
> -	drm_connector_helper_add(connector, &udl_connector_helper_funcs);
> -
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
> -			    DRM_CONNECTOR_POLL_DISCONNECT;
> -
> -	return connector;
> -
> -err_kfree:
> -	kfree(udl_connector);
> -	return ERR_PTR(ret);
> -}
> -
>  /*
>   * Modesetting
>   */
> @@ -556,9 +521,15 @@ int udl_modeset_init(struct drm_device *dev)
>  		return ret;
>  	encoder->possible_crtcs = drm_crtc_mask(crtc);
>  
> -	connector = udl_connector_init(dev);
> -	if (IS_ERR(connector))
> -		return PTR_ERR(connector);
> +	connector = &udl->connector;
> +	ret = drm_connector_init(dev, connector, &udl_connector_funcs, DRM_MODE_CONNECTOR_VGA);
> +	if (ret)
> +		return ret;
> +	drm_connector_helper_add(connector, &udl_connector_helper_funcs);
> +
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
> +			    DRM_CONNECTOR_POLL_DISCONNECT;
> +
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret)
>  		return ret;

-- 
Jani Nikula, Intel
