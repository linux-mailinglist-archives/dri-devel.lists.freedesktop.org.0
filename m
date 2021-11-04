Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3824844573D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 17:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B336FA8B;
	Thu,  4 Nov 2021 16:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404C66FA8A;
 Thu,  4 Nov 2021 16:24:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="317940202"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="317940202"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 09:24:12 -0700
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="501602671"
Received: from mihaelac-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.32.21])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 09:24:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm: Add a drm_drv_enabled() to check if drivers
 should be enabled
In-Reply-To: <20211104160707.1407052-2-javierm@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-2-javierm@redhat.com>
Date: Thu, 04 Nov 2021 18:24:01 +0200
Message-ID: <87zgqjanz2.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 04 Nov 2021, Javier Martinez Canillas <javierm@redhat.com> wrote:
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
> Changes in v2:
> - Squash patch to add drm_drv_enabled() and make drivers use it.
> - Make the drivers changes before moving nomodeset logic to DRM.
> - Make drm_drv_enabled() return an errno and -ENODEV if nomodeset.
> - Remove debug and error messages in drivers.
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  7 +++----
>  drivers/gpu/drm/ast/ast_drv.c           |  7 +++++--
>  drivers/gpu/drm/drm_drv.c               | 20 ++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_module.c      |  6 +++++-
>  drivers/gpu/drm/mgag200/mgag200_drv.c   |  7 +++++--
>  drivers/gpu/drm/nouveau/nouveau_drm.c   |  5 ++++-
>  drivers/gpu/drm/qxl/qxl_drv.c           |  7 +++++--
>  drivers/gpu/drm/radeon/radeon_drv.c     |  6 ++++--
>  drivers/gpu/drm/tiny/bochs.c            |  7 +++++--
>  drivers/gpu/drm/tiny/cirrus.c           |  8 ++++++--
>  drivers/gpu/drm/vboxvideo/vbox_drv.c    |  9 +++++----
>  drivers/gpu/drm/virtio/virtgpu_drv.c    |  5 +++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  5 +++--
>  include/drm/drm_drv.h                   |  1 +
>  14 files changed, 74 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index c718fb5f3f8a..7fde40d06181 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2514,10 +2514,9 @@ static int __init amdgpu_init(void)
>  {
>  	int r;
>  
> -	if (vgacon_text_force()) {
> -		DRM_ERROR("VGACON disables amdgpu kernel modesetting.\n");
> -		return -EINVAL;
> -	}
> +	r = drm_drv_enabled(&amdgpu_kms_driver)
> +	if (r)
> +		return r;
>  
>  	r = amdgpu_sync_init();
>  	if (r)
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 86d5cd7b6318..802063279b86 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -233,8 +233,11 @@ static struct pci_driver ast_pci_driver = {
>  
>  static int __init ast_init(void)
>  {
> -	if (vgacon_text_force() && ast_modeset == -1)
> -		return -EINVAL;
> +	int ret;
> +
> +	ret = drm_drv_enabled(&ast_driver);
> +	if (ret && ast_modeset == -1)
> +		return ret;
>  
>  	if (ast_modeset == 0)
>  		return -EINVAL;
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
> +

No, this makes absolutely no sense, and will also oops on nomodeset.

BR,
Jani.


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
> +	if (ret && i915_modparams.modeset == -1)
>  		use_kms = false;
>  
>  	if (!use_kms) {
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 6b9243713b3c..2a581094ba2b 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -378,8 +378,11 @@ static struct pci_driver mgag200_pci_driver = {
>  
>  static int __init mgag200_init(void)
>  {
> -	if (vgacon_text_force() && mgag200_modeset == -1)
> -		return -EINVAL;
> +	int ret;
> +
> +	ret = drm_drv_enabled(&mgag200_driver);
> +	if (ret && mgag200_modeset == -1)
> +		return ret;
>  
>  	if (mgag200_modeset == 0)
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 1f828c9f691c..8844d3602d87 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1316,13 +1316,16 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>  static int __init
>  nouveau_drm_init(void)
>  {
> +	int ret;
> +
>  	driver_pci = driver_stub;
>  	driver_platform = driver_stub;
>  
>  	nouveau_display_options();
>  
>  	if (nouveau_modeset == -1) {
> -		if (vgacon_text_force())
> +		ret = drm_drv_enabled(&driver_stub);
> +		if (ret)
>  			nouveau_modeset = 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> index fc47b0deb021..3ac2ef2bf545 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -295,8 +295,11 @@ static struct drm_driver qxl_driver = {
>  
>  static int __init qxl_init(void)
>  {
> -	if (vgacon_text_force() && qxl_modeset == -1)
> -		return -EINVAL;
> +	int ret;
> +
> +	ret = drm_drv_enabled(&qxl_driver);
> +	if (ret && qxl_modeset == -1)
> +		return ret;
>  
>  	if (qxl_modeset == 0)
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index b74cebca1f89..56d688c04346 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -637,8 +637,10 @@ static struct pci_driver radeon_kms_pci_driver = {
>  
>  static int __init radeon_module_init(void)
>  {
> -	if (vgacon_text_force() && radeon_modeset == -1) {
> -		DRM_INFO("VGACON disable radeon kernel modesetting.\n");
> +	int ret;
> +
> +	ret = drm_drv_enabled(&kms_driver)
> +	if (ret && radeon_modeset == -1) {
>  		radeon_modeset = 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 2ce3bd903b70..ee6b1ff9128b 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -719,8 +719,11 @@ static struct pci_driver bochs_pci_driver = {
>  
>  static int __init bochs_init(void)
>  {
> -	if (vgacon_text_force() && bochs_modeset == -1)
> -		return -EINVAL;
> +	int ret;
> +
> +	ret = drm_drv_enabled(&bochs_driver);
> +	if (ret && bochs_modeset == -1)
> +		return ret;
>  
>  	if (bochs_modeset == 0)
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> index 4611ec408506..4706c5bc3067 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -636,8 +636,12 @@ static struct pci_driver cirrus_pci_driver = {
>  
>  static int __init cirrus_init(void)
>  {
> -	if (vgacon_text_force())
> -		return -EINVAL;
> +	int ret;
> +
> +	ret = drm_drv_enabled(&cirrus_driver);
> +	if (ret)
> +		return ret;
> +
>  	return pci_register_driver(&cirrus_pci_driver);
>  }
>  
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> index a6c81af37345..e4377c37cf33 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -193,10 +193,11 @@ static const struct drm_driver driver = {
>  
>  static int __init vbox_init(void)
>  {
> -#ifdef CONFIG_VGA_CONSOLE
> -	if (vgacon_text_force() && vbox_modeset == -1)
> -		return -EINVAL;
> -#endif
> +	int ret;
> +
> +	ret = drm_drv_enabled(&driver);
> +	if (ret && vbox_modeset == -1)
> +		return ret;
>  
>  	if (vbox_modeset == 0)
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 749db18dcfa2..28200dfba2d1 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -104,8 +104,9 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
>  	struct drm_device *dev;
>  	int ret;
>  
> -	if (vgacon_text_force() && virtio_gpu_modeset == -1)
> -		return -EINVAL;
> +	ret = drm_drv_enabled(&driver);
> +	if (ret && virtio_gpu_modeset == -1)
> +		return ret;
>  
>  	if (virtio_gpu_modeset == 0)
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index ab9a1750e1df..05e9949293d5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1651,8 +1651,9 @@ static int __init vmwgfx_init(void)
>  {
>  	int ret;
>  
> -	if (vgacon_text_force())
> -		return -EINVAL;
> +	ret = drm_drv_enabled(&driver);
> +	if (ret)
> +		return ret;
>  
>  	ret = pci_register_driver(&vmw_pci_driver);
>  	if (ret)
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 0cd95953cdf5..77abfc7e078b 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -598,5 +598,6 @@ static inline bool drm_drv_uses_atomic_modeset(struct drm_device *dev)
>  
>  int drm_dev_set_unique(struct drm_device *dev, const char *name);
>  
> +int drm_drv_enabled(const struct drm_driver *driver);
>  
>  #endif

-- 
Jani Nikula, Intel Open Source Graphics Center
