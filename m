Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7114458C4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 18:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE86D736B7;
	Thu,  4 Nov 2021 17:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2AA736B7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 17:37:49 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id f930fe11-3d95-11ec-ac3c-0050568cd888;
 Thu, 04 Nov 2021 17:38:08 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 0354C194B43;
 Thu,  4 Nov 2021 18:37:40 +0100 (CET)
Date: Thu, 4 Nov 2021 18:37:38 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 1/2] drm: Add a drm_drv_enabled() to check if drivers
 should be enabled
Message-ID: <YYQaYsCr+piMlRpS@ravnborg.org>
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104160707.1407052-2-javierm@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Thu, Nov 04, 2021 at 05:07:06PM +0100, Javier Martinez Canillas wrote:
> Some DRM drivers check the vgacon_text_force() function return value as an
> indication on whether they should be allowed to be enabled or not.
> 
> This function returns true if the nomodeset kernel command line parameter
> was set. But there may be other conditions besides this to determine if a
> driver should be enabled.
> 
> Let's add a drm_drv_enabled() helper function to encapsulate that logic so
> can be later extended if needed, without having to modify all the drivers.
> 
> Also, while being there do some cleanup. The vgacon_text_force() function
> is guarded by CONFIG_VGA_CONSOLE and there's no need for callers to do it.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 8214a0b1ab7f..3fb567d62881 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -975,6 +975,26 @@ int drm_dev_set_unique(struct drm_device *dev, const char *name)
>  }
>  EXPORT_SYMBOL(drm_dev_set_unique);
>  
> +/**
> + * drm_drv_enabled - Checks if a DRM driver can be enabled
> + * @driver: DRM driver to check
> + *
> + * Checks whether a DRM driver can be enabled or not. This may be the case
> + * if the "nomodeset" kernel command line parameter is used.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_drv_enabled(const struct drm_driver *driver)
> +{
> +	if (vgacon_text_force()) {
> +		DRM_INFO("%s driver is disabled\n", driver->name);

DRM_INFO is deprecated, please do not use it in new code.
Also other users had an error message and not just info - is info
enough?


> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_drv_enabled);
> +
>  /*
>   * DRM Core
>   * The DRM core module initializes all global DRM objects and makes them
> diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
> index ab2295dd4500..45cb3e540eff 100644
> --- a/drivers/gpu/drm/i915/i915_module.c
> +++ b/drivers/gpu/drm/i915/i915_module.c
> @@ -18,9 +18,12 @@
>  #include "i915_selftest.h"
>  #include "i915_vma.h"
>  
> +static const struct drm_driver driver;
Hmmm...

> +
>  static int i915_check_nomodeset(void)
>  {
>  	bool use_kms = true;
> +	int ret;
>  
>  	/*
>  	 * Enable KMS by default, unless explicitly overriden by
> @@ -31,7 +34,8 @@ static int i915_check_nomodeset(void)
>  	if (i915_modparams.modeset == 0)
>  		use_kms = false;
>  
> -	if (vgacon_text_force() && i915_modparams.modeset == -1)
> +	ret = drm_drv_enabled(&driver);

You pass the local driver variable here - which looks wrong as this is
not the same as the driver variable declared in another file.

Maybe move the check to new function you can add to init_funcs,
and locate the new function in i915_drv - so it has access to driver?


	Sam
