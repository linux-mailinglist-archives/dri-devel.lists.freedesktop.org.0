Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D099E9B62
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 17:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D99E10E27B;
	Mon,  9 Dec 2024 16:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LEC0ALmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCAB10E27B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 16:17:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 895801C0005;
 Mon,  9 Dec 2024 16:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1733761049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=919IoHK8fqPsTQmbz5S8HS0P7OaLW9n/0ZAheVWxu1o=;
 b=LEC0ALmzfvNTu5X1bkuR3j2VHKj4LxPzirtcvPZKrnqGWcAdbLG0FqFScs51NQPhM/gwsG
 TWjk4HSzlFRNYUZVOcgfsdgsLOEFtYw8A+76ZARDo3TwwkfMegMEuo8C8s8J4xpk9w+xq6
 GDZ4CXzd5v5vCZ8INJ/UliSm6U2zWQleZjSMuz28b6bb/rs5X91vsnc5178GTx4a0VEX6U
 BUS9eR7l8rEqm/i83L6Z98Nbxx/Ihb9QXLdcj0ZvMrvIJaLdL/YvRxdJ4sJAriTjl6ci3D
 iGX1qOhRFwyJ8WnM8jEDcs7cauBCYIEbHFiBAL7PTbEWGNFK+ohXaQC1rKEKsg==
Date: Mon, 9 Dec 2024 17:17:27 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Simon Ser <contact@emersion.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, David Airlie <airlied@gmail.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] drm: remove driver date from struct drm_driver
 and all drivers
Message-ID: <Z1cYFxDjDTEBtz_C@louis-chauvet-laptop>
References: <cover.1733322525.git.jani.nikula@intel.com>
 <1f2bf2543aed270a06f6c707fd6ed1b78bf16712.1733322525.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f2bf2543aed270a06f6c707fd6ed1b78bf16712.1733322525.git.jani.nikula@intel.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 04/12/24 - 16:31, Jani Nikula wrote:
> We stopped using the driver initialized date in commit 7fb8af6798e8
> ("drm: deprecate driver date") and (eventually) started returning "0"
> for drm_version ioctl instead.
> 
> Finish the job, and remove the unused date member from struct
> drm_driver, its initialization from drivers, along with the common
> DRIVER_DATE macros.
> 
> v2: Also update drivers/accel (kernel test robot)
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Simon Ser <contact@emersion.fr>
> Acked-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
 
> ---
> 
> Cc: David Airlie <airlied@gmail.com>
> Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ville Syrj�l� <ville.syrjala@linux.intel.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: nouveau@lists.freedesktop.org
> Cc: xen-devel@lists.xenproject.org
> ---
>  drivers/accel/habanalabs/common/habanalabs_drv.c | 1 -
>  drivers/accel/ivpu/ivpu_drv.c                    | 1 -
>  drivers/accel/qaic/qaic_drv.c                    | 1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          | 2 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h          | 1 -
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c  | 1 -
>  drivers/gpu/drm/arm/hdlcd_drv.c                  | 1 -
>  drivers/gpu/drm/arm/malidp_drv.c                 | 1 -
>  drivers/gpu/drm/armada/armada_drv.c              | 1 -
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c          | 1 -
>  drivers/gpu/drm/ast/ast_drv.c                    | 1 -
>  drivers/gpu/drm/ast/ast_drv.h                    | 1 -
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c     | 1 -
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c            | 1 -
>  drivers/gpu/drm/exynos/exynos_drm_drv.c          | 2 --
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c        | 1 -
>  drivers/gpu/drm/gma500/psb_drv.c                 | 1 -
>  drivers/gpu/drm/gma500/psb_drv.h                 | 1 -
>  drivers/gpu/drm/gud/gud_drv.c                    | 1 -
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  | 1 -
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c  | 1 -
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c          | 2 --
>  drivers/gpu/drm/i915/i915_driver.c               | 1 -
>  drivers/gpu/drm/i915/i915_driver.h               | 1 -
>  drivers/gpu/drm/i915/i915_gpu_error.c            | 1 -
>  drivers/gpu/drm/imagination/pvr_drv.c            | 1 -
>  drivers/gpu/drm/imagination/pvr_drv.h            | 1 -
>  drivers/gpu/drm/imx/dcss/dcss-kms.c              | 1 -
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c         | 1 -
>  drivers/gpu/drm/imx/lcdc/imx-lcdc.c              | 1 -
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c        | 1 -
>  drivers/gpu/drm/kmb/kmb_drv.c                    | 1 -
>  drivers/gpu/drm/kmb/kmb_drv.h                    | 1 -
>  drivers/gpu/drm/lima/lima_drv.c                  | 1 -
>  drivers/gpu/drm/logicvc/logicvc_drm.c            | 1 -
>  drivers/gpu/drm/loongson/lsdc_drv.c              | 2 --
>  drivers/gpu/drm/mcde/mcde_drv.c                  | 1 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c           | 2 --
>  drivers/gpu/drm/meson/meson_drv.c                | 1 -
>  drivers/gpu/drm/mgag200/mgag200_drv.c            | 1 -
>  drivers/gpu/drm/mgag200/mgag200_drv.h            | 1 -
>  drivers/gpu/drm/msm/msm_drv.c                    | 1 -
>  drivers/gpu/drm/mxsfb/lcdif_drv.c                | 1 -
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c                | 1 -
>  drivers/gpu/drm/nouveau/nouveau_drm.c            | 5 -----
>  drivers/gpu/drm/nouveau/nouveau_drv.h            | 1 -
>  drivers/gpu/drm/omapdrm/omap_drv.c               | 2 --
>  drivers/gpu/drm/panfrost/panfrost_drv.c          | 1 -
>  drivers/gpu/drm/panthor/panthor_drv.c            | 1 -
>  drivers/gpu/drm/pl111/pl111_drv.c                | 1 -
>  drivers/gpu/drm/qxl/qxl_drv.c                    | 1 -
>  drivers/gpu/drm/qxl/qxl_drv.h                    | 1 -
>  drivers/gpu/drm/radeon/radeon_drv.c              | 1 -
>  drivers/gpu/drm/radeon/radeon_drv.h              | 1 -
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c    | 1 -
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 1 -
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 1 -
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c      | 2 --
>  drivers/gpu/drm/solomon/ssd130x.c                | 2 --
>  drivers/gpu/drm/sprd/sprd_drm.c                  | 2 --
>  drivers/gpu/drm/sti/sti_drv.c                    | 2 --
>  drivers/gpu/drm/stm/drv.c                        | 1 -
>  drivers/gpu/drm/sun4i/sun4i_drv.c                | 1 -
>  drivers/gpu/drm/tegra/drm.c                      | 2 --
>  drivers/gpu/drm/tidss/tidss_drv.c                | 1 -
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c              | 1 -
>  drivers/gpu/drm/tiny/arcpgu.c                    | 1 -
>  drivers/gpu/drm/tiny/bochs.c                     | 1 -
>  drivers/gpu/drm/tiny/cirrus-qemu.c               | 2 --
>  drivers/gpu/drm/tiny/gm12u320.c                  | 2 --
>  drivers/gpu/drm/tiny/hx8357d.c                   | 1 -
>  drivers/gpu/drm/tiny/ili9163.c                   | 1 -
>  drivers/gpu/drm/tiny/ili9225.c                   | 1 -
>  drivers/gpu/drm/tiny/ili9341.c                   | 1 -
>  drivers/gpu/drm/tiny/ili9486.c                   | 1 -
>  drivers/gpu/drm/tiny/mi0283qt.c                  | 1 -
>  drivers/gpu/drm/tiny/ofdrm.c                     | 2 --
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c            | 1 -
>  drivers/gpu/drm/tiny/repaper.c                   | 1 -
>  drivers/gpu/drm/tiny/sharp-memory.c              | 1 -
>  drivers/gpu/drm/tiny/simpledrm.c                 | 2 --
>  drivers/gpu/drm/tiny/st7586.c                    | 1 -
>  drivers/gpu/drm/tiny/st7735r.c                   | 1 -
>  drivers/gpu/drm/tve200/tve200_drv.c              | 1 -
>  drivers/gpu/drm/udl/udl_drv.c                    | 1 -
>  drivers/gpu/drm/udl/udl_drv.h                    | 1 -
>  drivers/gpu/drm/v3d/v3d_drv.c                    | 2 --
>  drivers/gpu/drm/vboxvideo/vbox_drv.c             | 1 -
>  drivers/gpu/drm/vboxvideo/vbox_drv.h             | 1 -
>  drivers/gpu/drm/vc4/vc4_drv.c                    | 3 ---
>  drivers/gpu/drm/vgem/vgem_drv.c                  | 2 --
>  drivers/gpu/drm/virtio/virtgpu_drv.c             | 1 -
>  drivers/gpu/drm/virtio/virtgpu_drv.h             | 1 -
>  drivers/gpu/drm/vkms/vkms_drv.c                  | 2 --
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c              | 1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h              | 1 -
>  drivers/gpu/drm/xe/xe_device.c                   | 1 -
>  drivers/gpu/drm/xe/xe_drv.h                      | 1 -
>  drivers/gpu/drm/xen/xen_drm_front.c              | 1 -
>  drivers/gpu/drm/xlnx/zynqmp_kms.c                | 1 -
>  include/drm/drm_drv.h                            | 2 --
>  101 files changed, 126 deletions(-)
> 
> diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
> index 708dfd10f39c..5409b2c656c8 100644
> --- a/drivers/accel/habanalabs/common/habanalabs_drv.c
> +++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
> @@ -101,7 +101,6 @@ static const struct drm_driver hl_driver = {
>  	.major = LINUX_VERSION_MAJOR,
>  	.minor = LINUX_VERSION_PATCHLEVEL,
>  	.patchlevel = LINUX_VERSION_SUBLEVEL,
> -	.date = "20190505",
>  
>  	.fops = &hl_fops,
>  	.open = hl_device_open,
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 1f359dbe5150..1e8ffbe25eee 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -458,7 +458,6 @@ static const struct drm_driver driver = {
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
>  
> -	.date = UTS_RELEASE,
>  	.major = 1,
>  };
>  
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 3575e0c984d6..542c5d24e499 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -208,7 +208,6 @@ static const struct drm_driver qaic_accel_driver = {
>  
>  	.name			= QAIC_NAME,
>  	.desc			= QAIC_DESC,
> -	.date			= "20190618",
>  
>  	.fops			= &qaic_accel_fops,
>  	.open			= qaic_open,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 346746d6c233..eaeaaddb32cd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2916,7 +2916,6 @@ static const struct drm_driver amdgpu_kms_driver = {
>  
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = KMS_DRIVER_MAJOR,
>  	.minor = KMS_DRIVER_MINOR,
>  	.patchlevel = KMS_DRIVER_PATCHLEVEL,
> @@ -2940,7 +2939,6 @@ const struct drm_driver amdgpu_partition_driver = {
>  
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = KMS_DRIVER_MAJOR,
>  	.minor = KMS_DRIVER_MINOR,
>  	.patchlevel = KMS_DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h
> index 5bc2cb661af7..2d86cc6f7f4d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h
> @@ -40,7 +40,6 @@
>  
>  #define DRIVER_NAME		"amdgpu"
>  #define DRIVER_DESC		"AMD GPU"
> -#define DRIVER_DATE		"20150101"
>  
>  extern const struct drm_driver amdgpu_partition_driver;
>  
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> index 1e7b1fcb2848..6ed504099188 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -63,7 +63,6 @@ static const struct drm_driver komeda_kms_driver = {
>  	.fops = &komeda_cma_fops,
>  	.name = "komeda",
>  	.desc = "Arm Komeda Display Processor driver",
> -	.date = "20181101",
>  	.major = 0,
>  	.minor = 1,
>  };
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index 4af8fce7dab7..8617d10940d8 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -233,7 +233,6 @@ static const struct drm_driver hdlcd_driver = {
>  	.fops = &fops,
>  	.name = "hdlcd",
>  	.desc = "ARM HDLCD Controller DRM",
> -	.date = "20151021",
>  	.major = 1,
>  	.minor = 0,
>  };
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index 38b1b5b6bf69..3abc9339464b 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -570,7 +570,6 @@ static const struct drm_driver malidp_driver = {
>  	.fops = &fops,
>  	.name = "mali-dp",
>  	.desc = "ARM Mali Display Processor driver",
> -	.date = "20160106",
>  	.major = 1,
>  	.minor = 0,
>  };
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> index ddf0eaf546a6..5d5b7435970a 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -45,7 +45,6 @@ static const struct drm_driver armada_drm_driver = {
>  	.minor			= 0,
>  	.name			= "armada-drm",
>  	.desc			= "Armada SoC DRM",
> -	.date			= "20120730",
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.ioctls			= armada_ioctls,
>  	.num_ioctls = ARRAY_SIZE(armada_ioctls),
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index 55e90ab9b231..90189a3cf886 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -252,7 +252,6 @@ static const struct drm_driver aspeed_gfx_driver = {
>  	.fops = &fops,
>  	.name = "aspeed-gfx-drm",
>  	.desc = "ASPEED GFX DRM",
> -	.date = "20180319",
>  	.major = 1,
>  	.minor = 0,
>  };
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 8e9c9cb89a50..ff3bcdd1cff2 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -60,7 +60,6 @@ static const struct drm_driver ast_driver = {
>  	.fops = &ast_fops,
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 21ce3769bf0d..6b4305ac07d4 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -43,7 +43,6 @@
>  
>  #define DRIVER_NAME		"ast"
>  #define DRIVER_DESC		"AST"
> -#define DRIVER_DATE		"20120228"
>  
>  #define DRIVER_MAJOR		0
>  #define DRIVER_MINOR		1
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index 506289a937e2..b51528b2166c 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -846,7 +846,6 @@ static const struct drm_driver atmel_hlcdc_dc_driver = {
>  	.fops = &fops,
>  	.name = "atmel-hlcdc",
>  	.desc = "Atmel HLCD Controller DRM",
> -	.date = "20141504",
>  	.major = 1,
>  	.minor = 0,
>  };
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 9b4e2f4b1bc7..c4ddabe3cabd 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -503,7 +503,6 @@ static const struct drm_driver etnaviv_drm_driver = {
>  	.fops               = &fops,
>  	.name               = "etnaviv",
>  	.desc               = "etnaviv DRM",
> -	.date               = "20151214",
>  	.major              = 1,
>  	.minor              = 4,
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 7e517a2ec681..91ab42b56716 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -35,7 +35,6 @@
>  
>  #define DRIVER_NAME	"exynos"
>  #define DRIVER_DESC	"Samsung SoC DRM"
> -#define DRIVER_DATE	"20180330"
>  
>  /*
>   * Interface history:
> @@ -118,7 +117,6 @@ static const struct drm_driver exynos_drm_driver = {
>  	.fops			= &exynos_drm_driver_fops,
>  	.name	= DRIVER_NAME,
>  	.desc	= DRIVER_DESC,
> -	.date	= DRIVER_DATE,
>  	.major	= DRIVER_MAJOR,
>  	.minor	= DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> index 12b2096b6c9d..e1183644ec39 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -174,7 +174,6 @@ static const struct drm_driver fsl_dcu_drm_driver = {
>  	.fops			= &fsl_dcu_drm_fops,
>  	.name			= "fsl-dcu-drm",
>  	.desc			= "Freescale DCU DRM",
> -	.date			= "20160425",
>  	.major			= 1,
>  	.minor			= 1,
>  };
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 2c56ece17d71..85d3557c2eb9 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -513,7 +513,6 @@ static const struct drm_driver driver = {
>  	.fops = &psb_gem_fops,
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index de62cbfcdc72..7f77cb2b2751 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -26,7 +26,6 @@
>  
>  #define DRIVER_NAME "gma500"
>  #define DRIVER_DESC "DRM driver for the Intel GMA500, GMA600, GMA3600, GMA3650"
> -#define DRIVER_DATE "20140314"
>  
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
> index 65a16f009ea6..cb405771d6e2 100644
> --- a/drivers/gpu/drm/gud/gud_drv.c
> +++ b/drivers/gpu/drm/gud/gud_drv.c
> @@ -381,7 +381,6 @@ static const struct drm_driver gud_drm_driver = {
>  
>  	.name			= "gud",
>  	.desc			= "Generic USB Display",
> -	.date			= "20200422",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 69bdae604982..7f814c32ed34 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -57,7 +57,6 @@ static const struct drm_driver hibmc_driver = {
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			= &hibmc_fops,
>  	.name			= "hibmc",
> -	.date			= "20160828",
>  	.desc			= "hibmc drm driver",
>  	.major			= 1,
>  	.minor			= 0,
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> index 5616c3917c03..2eb49177ac42 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> @@ -929,7 +929,6 @@ static const struct drm_driver ade_driver = {
>  	DRM_FBDEV_DMA_DRIVER_OPS,
>  	.name = "kirin",
>  	.desc = "Hisilicon Kirin620 SoC DRM Driver",
> -	.date = "20150718",
>  	.major = 1,
>  	.minor = 0,
>  };
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index c5ac240f7a7a..f59abfa7622a 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -20,7 +20,6 @@
>  
>  #define DRIVER_NAME "hyperv_drm"
>  #define DRIVER_DESC "DRM driver for Hyper-V synthetic video device"
> -#define DRIVER_DATE "2020"
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
>  
> @@ -31,7 +30,6 @@ static struct drm_driver hyperv_driver = {
>  
>  	.name		 = DRIVER_NAME,
>  	.desc		 = DRIVER_DESC,
> -	.date		 = DRIVER_DATE,
>  	.major		 = DRIVER_MAJOR,
>  	.minor		 = DRIVER_MINOR,
>  
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index c1edf5e1f61e..e35aa0274d76 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1797,7 +1797,6 @@ static const struct drm_driver i915_drm_driver = {
>  	.fops = &i915_driver_fops,
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/i915/i915_driver.h b/drivers/gpu/drm/i915/i915_driver.h
> index 94a70d8ec5d5..4b67ad9a61cd 100644
> --- a/drivers/gpu/drm/i915/i915_driver.h
> +++ b/drivers/gpu/drm/i915/i915_driver.h
> @@ -15,7 +15,6 @@ struct drm_printer;
>  
>  #define DRIVER_NAME		"i915"
>  #define DRIVER_DESC		"Intel Graphics"
> -#define DRIVER_DATE		"20230929"
>  #define DRIVER_TIMESTAMP	1695980603
>  
>  extern const struct dev_pm_ops i915_pm_ops;
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 4eb58887819a..eb975b3815df 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -841,7 +841,6 @@ static void __err_print_to_sgl(struct drm_i915_error_state_buf *m,
>  	err_printf(m, "Kernel: %s %s\n",
>  		   init_utsname()->release,
>  		   init_utsname()->machine);
> -	err_printf(m, "Driver: %s\n", DRIVER_DATE);
>  	ts = ktime_to_timespec64(error->time);
>  	err_printf(m, "Time: %lld s %ld us\n",
>  		   (s64)ts.tv_sec, ts.tv_nsec / NSEC_PER_USEC);
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
> index 36c0e768698e..6ab023593476 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1387,7 +1387,6 @@ static struct drm_driver pvr_drm_driver = {
>  
>  	.name = PVR_DRIVER_NAME,
>  	.desc = PVR_DRIVER_DESC,
> -	.date = PVR_DRIVER_DATE,
>  	.major = PVR_DRIVER_MAJOR,
>  	.minor = PVR_DRIVER_MINOR,
>  	.patchlevel = PVR_DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.h b/drivers/gpu/drm/imagination/pvr_drv.h
> index 378fe477b759..7fa147312dd1 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.h
> +++ b/drivers/gpu/drm/imagination/pvr_drv.h
> @@ -9,7 +9,6 @@
>  
>  #define PVR_DRIVER_NAME "powervr"
>  #define PVR_DRIVER_DESC "Imagination PowerVR (Series 6 and later) & IMG Graphics"
> -#define PVR_DRIVER_DATE "20230904"
>  
>  /*
>   * Driver interface version:
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> index 490b5c269f39..3633e8f3aff6 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -34,7 +34,6 @@ static const struct drm_driver dcss_kms_driver = {
>  	.fops			= &dcss_cma_fops,
>  	.name			= "imx-dcss",
>  	.desc			= "i.MX8MQ Display Subsystem",
> -	.date			= "20190917",
>  	.major			= 1,
>  	.minor			= 0,
>  	.patchlevel		= 0,
> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
> index 6b84429735d6..bcb35ba670fc 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
> @@ -163,7 +163,6 @@ static const struct drm_driver imx_drm_driver = {
>  	.fops			= &imx_drm_driver_fops,
>  	.name			= "imx-drm",
>  	.desc			= "i.MX DRM graphics",
> -	.date			= "20120507",
>  	.major			= 1,
>  	.minor			= 0,
>  	.patchlevel		= 0,
> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> index c5121fed80fd..d70981295f88 100644
> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> @@ -352,7 +352,6 @@ static struct drm_driver imx_lcdc_drm_driver = {
>  	DRM_FBDEV_DMA_DRIVER_OPS,
>  	.name = "imx-lcdc",
>  	.desc = "i.MX LCDC driver",
> -	.date = "20200716",
>  };
>  
>  static const struct of_device_id imx_lcdc_of_dev_id[] = {
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 0a4eb3994cd6..6546d9ec410a 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -953,7 +953,6 @@ static const struct drm_driver ingenic_drm_driver_data = {
>  	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.name			= "ingenic-drm",
>  	.desc			= "DRM module for Ingenic SoCs",
> -	.date			= "20200716",
>  	.major			= 1,
>  	.minor			= 1,
>  	.patchlevel		= 0,
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
> index 4173344ba32c..c340b4c6a74b 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -445,7 +445,6 @@ static const struct drm_driver kmb_driver = {
>  	DRM_FBDEV_DMA_DRIVER_OPS,
>  	.name = "kmb-drm",
>  	.desc = "KEEMBAY DISPLAY DRIVER",
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
> index bf085e95b28f..1f0c10d317fe 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.h
> +++ b/drivers/gpu/drm/kmb/kmb_drv.h
> @@ -16,7 +16,6 @@
>  #define KMB_MIN_WIDTH                   1920 /*Max width in pixels */
>  #define KMB_MIN_HEIGHT                  1080 /*Max height in pixels */
>  
> -#define DRIVER_DATE			"20210223"
>  #define DRIVER_MAJOR			1
>  #define DRIVER_MINOR			1
>  
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
> index 10bce18b7c31..4b70c5189f7c 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -271,7 +271,6 @@ static const struct drm_driver lima_drm_driver = {
>  	.fops               = &lima_drm_driver_fops,
>  	.name               = "lima",
>  	.desc               = "lima DRM",
> -	.date               = "20191231",
>  	.major              = 1,
>  	.minor              = 1,
>  	.patchlevel         = 0,
> diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
> index 9152034e54a3..bda2a689d928 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_drm.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
> @@ -52,7 +52,6 @@ static struct drm_driver logicvc_drm_driver = {
>  	.fops				= &logicvc_drm_fops,
>  	.name				= "logicvc-drm",
>  	.desc				= "Xylon LogiCVC DRM driver",
> -	.date				= "20200403",
>  	.major				= 1,
>  	.minor				= 0,
>  
> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
> index a55aa1fe2c21..12193d2a301a 100644
> --- a/drivers/gpu/drm/loongson/lsdc_drv.c
> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
> @@ -26,7 +26,6 @@
>  #define DRIVER_AUTHOR               "Sui Jingfeng <suijingfeng@loongson.cn>"
>  #define DRIVER_NAME                 "loongson"
>  #define DRIVER_DESC                 "drm driver for loongson graphics"
> -#define DRIVER_DATE                 "20220701"
>  #define DRIVER_MAJOR                1
>  #define DRIVER_MINOR                0
>  #define DRIVER_PATCHLEVEL           0
> @@ -39,7 +38,6 @@ static const struct drm_driver lsdc_drm_driver = {
>  
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
> index f8c7aa9d7f33..324a95d7f15b 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -208,7 +208,6 @@ static const struct drm_driver mcde_drm_driver = {
>  	.fops = &drm_fops,
>  	.name = "mcde",
>  	.desc = DRIVER_DESC,
> -	.date = "20180529",
>  	.major = 1,
>  	.minor = 0,
>  	.patchlevel = 0,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 38297d705df6..723782e75c55 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -33,7 +33,6 @@
>  
>  #define DRIVER_NAME "mediatek"
>  #define DRIVER_DESC "Mediatek SoC DRM"
> -#define DRIVER_DATE "20150513"
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
>  
> @@ -615,7 +614,6 @@ static const struct drm_driver mtk_drm_driver = {
>  
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 83ee18024682..64c8c4bb60f1 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -105,7 +105,6 @@ static const struct drm_driver meson_driver = {
>  	.fops			= &fops,
>  	.name			= DRIVER_NAME,
>  	.desc			= DRIVER_DESC,
> -	.date			= "20161109",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index b7ed763addfa..069fdd2dc8f6 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -97,7 +97,6 @@ static const struct drm_driver mgag200_driver = {
>  	.fops = &mgag200_driver_fops,
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 988967eafbf2..0608fc63e588 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -25,7 +25,6 @@
>  
>  #define DRIVER_NAME		"mgag200"
>  #define DRIVER_DESC		"MGA G200 SE"
> -#define DRIVER_DATE		"20110418"
>  
>  #define DRIVER_MAJOR		1
>  #define DRIVER_MINOR		0
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index b5fa715cbfb0..73e72aee6ec5 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -910,7 +910,6 @@ static const struct drm_driver msm_driver = {
>  	.fops               = &fops,
>  	.name               = "msm",
>  	.desc               = "MSM Snapdragon DRM",
> -	.date               = "20130625",
>  	.major              = MSM_VERSION_MAJOR,
>  	.minor              = MSM_VERSION_MINOR,
>  	.patchlevel         = MSM_VERSION_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index 81ec91cef66c..02fe6b89f3aa 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -248,7 +248,6 @@ static const struct drm_driver lcdif_driver = {
>  	.fops	= &fops,
>  	.name	= "imx-lcdif",
>  	.desc	= "i.MX LCDIF Controller DRM",
> -	.date	= "20220417",
>  	.major	= 1,
>  	.minor	= 0,
>  };
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 1c27a97dce03..129cc3fb4448 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -336,7 +336,6 @@ static const struct drm_driver mxsfb_driver = {
>  	.fops	= &fops,
>  	.name	= "mxsfb-drm",
>  	.desc	= "MXSFB Controller DRM",
> -	.date	= "20160824",
>  	.major	= 1,
>  	.minor	= 0,
>  };
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index a99c1d9855c9..744ae9d3305d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1326,11 +1326,6 @@ driver_stub = {
>  
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -#ifdef GIT_REVISION
> -	.date = GIT_REVISION,
> -#else
> -	.date = DRIVER_DATE,
> -#endif
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 685d6ca3d8aa..55abc510067b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -7,7 +7,6 @@
>  
>  #define DRIVER_NAME		"nouveau"
>  #define DRIVER_DESC		"nVidia Riva/TNT/GeForce/Quadro/Tesla/Tegra K1+"
> -#define DRIVER_DATE		"20120801"
>  
>  #define DRIVER_MAJOR		1
>  #define DRIVER_MINOR		4
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index 1796cd20a877..a80e0f375a0e 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -28,7 +28,6 @@
>  
>  #define DRIVER_NAME		MODULE_NAME
>  #define DRIVER_DESC		"OMAP DRM"
> -#define DRIVER_DATE		"20110917"
>  #define DRIVER_MAJOR		1
>  #define DRIVER_MINOR		0
>  #define DRIVER_PATCHLEVEL	0
> @@ -653,7 +652,6 @@ static const struct drm_driver omap_drm_driver = {
>  	.fops = &omapdriver_fops,
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 04d615df5259..fbaef3afcd66 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -636,7 +636,6 @@ static const struct drm_driver panfrost_drm_driver = {
>  	.fops			= &panfrost_drm_driver_fops,
>  	.name			= "panfrost",
>  	.desc			= "panfrost DRM",
> -	.date			= "20180908",
>  	.major			= 1,
>  	.minor			= 3,
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index ac7e53f6e3f0..ad46a40ed9e1 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1505,7 +1505,6 @@ static const struct drm_driver panthor_drm_driver = {
>  	.fops = &panthor_drm_driver_fops,
>  	.name = "panthor",
>  	.desc = "Panthor DRM driver",
> -	.date = "20230801",
>  	.major = 1,
>  	.minor = 2,
>  
> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
> index 4b96f48cf630..56ff6a3fb483 100644
> --- a/drivers/gpu/drm/pl111/pl111_drv.c
> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
> @@ -220,7 +220,6 @@ static const struct drm_driver pl111_drm_driver = {
>  	.fops = &drm_fops,
>  	.name = "pl111",
>  	.desc = DRIVER_DESC,
> -	.date = "20170317",
>  	.major = 1,
>  	.minor = 0,
>  	.patchlevel = 0,
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> index f15e9583b098..417061ae59eb 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -300,7 +300,6 @@ static struct drm_driver qxl_driver = {
>  	.num_ioctls = ARRAY_SIZE(qxl_ioctls),
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = 0,
>  	.minor = 1,
>  	.patchlevel = 0,
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
> index b5fc14c9525d..cc02b5f10ad9 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.h
> +++ b/drivers/gpu/drm/qxl/qxl_drv.h
> @@ -54,7 +54,6 @@ struct iosys_map;
>  
>  #define DRIVER_NAME		"qxl"
>  #define DRIVER_DESC		"RH QXL"
> -#define DRIVER_DATE		"20120117"
>  
>  #define DRIVER_MAJOR 0
>  #define DRIVER_MINOR 1
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index 5ce7e91bedad..267f082bc430 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -603,7 +603,6 @@ static const struct drm_driver kms_driver = {
>  
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = KMS_DRIVER_MAJOR,
>  	.minor = KMS_DRIVER_MINOR,
>  	.patchlevel = KMS_DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.h b/drivers/gpu/drm/radeon/radeon_drv.h
> index 02a65971d140..0f3dbffc492d 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.h
> +++ b/drivers/gpu/drm/radeon/radeon_drv.h
> @@ -43,7 +43,6 @@
>  
>  #define DRIVER_NAME		"radeon"
>  #define DRIVER_DESC		"ATI Radeon"
> -#define DRIVER_DATE		"20080528"
>  
>  /* Interface history:
>   *
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> index 0f5204ef996e..be39b107b98c 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -611,7 +611,6 @@ static const struct drm_driver rcar_du_driver = {
>  	.fops			= &rcar_du_fops,
>  	.name			= "rcar-du",
>  	.desc			= "Renesas R-Car Display Unit",
> -	.date			= "20130110",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> index 0a03a20f663b..9bbdc4d63d88 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -84,7 +84,6 @@ static const struct drm_driver rzg2l_du_driver = {
>  	.fops			= &rzg2l_du_fops,
>  	.name			= "rzg2l-du",
>  	.desc			= "Renesas RZ/G2L Display Unit",
> -	.date			= "20230410",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index 40b582ee178e..387eb602dadf 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -107,7 +107,6 @@ static const struct drm_driver shmob_drm_driver = {
>  	.fops			= &shmob_drm_fops,
>  	.name			= "shmob-drm",
>  	.desc			= "Renesas SH Mobile DRM",
> -	.date			= "20120424",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index 0393b48ad65b..1fe4399d6901 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -39,7 +39,6 @@
>  
>  #define DRIVER_NAME	"rockchip"
>  #define DRIVER_DESC	"RockChip Soc DRM"
> -#define DRIVER_DATE	"20140818"
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> @@ -235,7 +234,6 @@ static const struct drm_driver rockchip_drm_driver = {
>  	.fops			= &rockchip_drm_driver_fops,
>  	.name	= DRIVER_NAME,
>  	.desc	= DRIVER_DESC,
> -	.date	= DRIVER_DATE,
>  	.major	= DRIVER_MAJOR,
>  	.minor	= DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index a737f650c2bc..7b9f8fc193ac 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -39,7 +39,6 @@
>  
>  #define DRIVER_NAME	"ssd130x"
>  #define DRIVER_DESC	"DRM driver for Solomon SSD13xx OLED displays"
> -#define DRIVER_DATE	"20220131"
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> @@ -1784,7 +1783,6 @@ static const struct drm_driver ssd130x_drm_driver = {
>  	DRM_FBDEV_SHMEM_DRIVER_OPS,
>  	.name			= DRIVER_NAME,
>  	.desc			= DRIVER_DESC,
> -	.date			= DRIVER_DATE,
>  	.major			= DRIVER_MAJOR,
>  	.minor			= DRIVER_MINOR,
>  	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
> index a74cd0caf645..867ee2d8997f 100644
> --- a/drivers/gpu/drm/sprd/sprd_drm.c
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> @@ -23,7 +23,6 @@
>  
>  #define DRIVER_NAME	"sprd"
>  #define DRIVER_DESC	"Spreadtrum SoCs' DRM Driver"
> -#define DRIVER_DATE	"20200201"
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> @@ -59,7 +58,6 @@ static struct drm_driver sprd_drm_drv = {
>  
>  	.name			= DRIVER_NAME,
>  	.desc			= DRIVER_DESC,
> -	.date			= DRIVER_DATE,
>  	.major			= DRIVER_MAJOR,
>  	.minor			= DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index a6c13318aa0b..46e6b674fa54 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -29,7 +29,6 @@
>  
>  #define DRIVER_NAME	"sti"
>  #define DRIVER_DESC	"STMicroelectronics SoC DRM"
> -#define DRIVER_DATE	"20140601"
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> @@ -143,7 +142,6 @@ static const struct drm_driver sti_driver = {
>  
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index d181d11b277b..40a62c57e04c 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -62,7 +62,6 @@ static const struct drm_driver drv_driver = {
>  	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.name = "stm",
>  	.desc = "STMicroelectronics SoC DRM",
> -	.date = "20170330",
>  	.major = 1,
>  	.minor = 0,
>  	.patchlevel = 0,
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
> index a7c11b795e98..025b0bdcbfd9 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -50,7 +50,6 @@ static const struct drm_driver sun4i_drv_driver = {
>  	.fops			= &sun4i_drv_fops,
>  	.name			= "sun4i-drm",
>  	.desc			= "Allwinner sun4i Display Engine",
> -	.date			= "20150629",
>  	.major			= 1,
>  	.minor			= 0,
>  
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 34878f5d2918..4596073fe28f 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -35,7 +35,6 @@
>  
>  #define DRIVER_NAME "tegra"
>  #define DRIVER_DESC "NVIDIA Tegra graphics"
> -#define DRIVER_DATE "20120330"
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
>  #define DRIVER_PATCHLEVEL 0
> @@ -901,7 +900,6 @@ static const struct drm_driver tegra_drm_driver = {
>  
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 53bc219c097f..ee1132d581f5 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -113,7 +113,6 @@ static const struct drm_driver tidss_driver = {
>  	DRM_FBDEV_DMA_DRIVER_OPS,
>  	.name			= "tidss",
>  	.desc			= "TI Keystone DSS",
> -	.date			= "20180215",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index 821d0ba26287..8013f01dbdf0 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -481,7 +481,6 @@ static const struct drm_driver tilcdc_driver = {
>  	.fops               = &fops,
>  	.name               = "tilcdc",
>  	.desc               = "TI LCD Controller DRM",
> -	.date               = "20121205",
>  	.major              = 1,
>  	.minor              = 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
> index 5a0c8a874421..1e570f6f639f 100644
> --- a/drivers/gpu/drm/tiny/arcpgu.c
> +++ b/drivers/gpu/drm/tiny/arcpgu.c
> @@ -367,7 +367,6 @@ static const struct drm_driver arcpgu_drm_driver = {
>  	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.name = "arcpgu",
>  	.desc = "ARC PGU Controller",
> -	.date = "20160219",
>  	.major = 1,
>  	.minor = 0,
>  	.patchlevel = 0,
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 71a1f15d6ac9..89a699370a59 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -680,7 +680,6 @@ static const struct drm_driver bochs_driver = {
>  	.fops			= &bochs_fops,
>  	.name			= "bochs-drm",
>  	.desc			= "bochs dispi vga interface (qemu stdvga)",
> -	.date			= "20130925",
>  	.major			= 1,
>  	.minor			= 0,
>  	DRM_GEM_SHMEM_DRIVER_OPS,
> diff --git a/drivers/gpu/drm/tiny/cirrus-qemu.c b/drivers/gpu/drm/tiny/cirrus-qemu.c
> index c0ae316888e2..52ec1e4ea9e5 100644
> --- a/drivers/gpu/drm/tiny/cirrus-qemu.c
> +++ b/drivers/gpu/drm/tiny/cirrus-qemu.c
> @@ -48,7 +48,6 @@
>  
>  #define DRIVER_NAME "cirrus-qemu"
>  #define DRIVER_DESC "qemu cirrus vga"
> -#define DRIVER_DATE "2019"
>  #define DRIVER_MAJOR 2
>  #define DRIVER_MINOR 0
>  
> @@ -659,7 +658,6 @@ static const struct drm_driver cirrus_driver = {
>  
>  	.name		 = DRIVER_NAME,
>  	.desc		 = DRIVER_DESC,
> -	.date		 = DRIVER_DATE,
>  	.major		 = DRIVER_MAJOR,
>  	.minor		 = DRIVER_MINOR,
>  
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index 47dbee84d58b..41e9bfb2e2ff 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -34,7 +34,6 @@ MODULE_PARM_DESC(eco_mode, "Turn on Eco mode (less bright, more silent)");
>  
>  #define DRIVER_NAME		"gm12u320"
>  #define DRIVER_DESC		"Grain Media GM12U320 USB projector display"
> -#define DRIVER_DATE		"2019"
>  #define DRIVER_MAJOR		1
>  #define DRIVER_MINOR		0
>  
> @@ -626,7 +625,6 @@ static const struct drm_driver gm12u320_drm_driver = {
>  
>  	.name		 = DRIVER_NAME,
>  	.desc		 = DRIVER_DESC,
> -	.date		 = DRIVER_DATE,
>  	.major		 = DRIVER_MAJOR,
>  	.minor		 = DRIVER_MINOR,
>  
> diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
> index 910279ebbbaa..df263818f45f 100644
> --- a/drivers/gpu/drm/tiny/hx8357d.c
> +++ b/drivers/gpu/drm/tiny/hx8357d.c
> @@ -199,7 +199,6 @@ static const struct drm_driver hx8357d_driver = {
>  	.debugfs_init		= mipi_dbi_debugfs_init,
>  	.name			= "hx8357d",
>  	.desc			= "HX8357D",
> -	.date			= "20181023",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
> index e54ce120692f..62cadf5e033d 100644
> --- a/drivers/gpu/drm/tiny/ili9163.c
> +++ b/drivers/gpu/drm/tiny/ili9163.c
> @@ -118,7 +118,6 @@ static struct drm_driver ili9163_driver = {
>  	.debugfs_init		= mipi_dbi_debugfs_init,
>  	.name			= "ili9163",
>  	.desc			= "Ilitek ILI9163",
> -	.date			= "20210208",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
> index f322e67f473a..6de44ff69b51 100644
> --- a/drivers/gpu/drm/tiny/ili9225.c
> +++ b/drivers/gpu/drm/tiny/ili9225.c
> @@ -364,7 +364,6 @@ static const struct drm_driver ili9225_driver = {
>  	DRM_FBDEV_DMA_DRIVER_OPS,
>  	.name			= "ili9225",
>  	.desc			= "Ilitek ILI9225",
> -	.date			= "20171106",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
> index 356c7f107c3e..e55029433509 100644
> --- a/drivers/gpu/drm/tiny/ili9341.c
> +++ b/drivers/gpu/drm/tiny/ili9341.c
> @@ -155,7 +155,6 @@ static const struct drm_driver ili9341_driver = {
>  	.debugfs_init		= mipi_dbi_debugfs_init,
>  	.name			= "ili9341",
>  	.desc			= "Ilitek ILI9341",
> -	.date			= "20180514",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
> index f5b1d21f7109..093661c771a0 100644
> --- a/drivers/gpu/drm/tiny/ili9486.c
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -177,7 +177,6 @@ static const struct drm_driver ili9486_driver = {
>  	.debugfs_init		= mipi_dbi_debugfs_init,
>  	.name			= "ili9486",
>  	.desc			= "Ilitek ILI9486",
> -	.date			= "20200118",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
> index 61e33376fbc9..b6b4664908ae 100644
> --- a/drivers/gpu/drm/tiny/mi0283qt.c
> +++ b/drivers/gpu/drm/tiny/mi0283qt.c
> @@ -159,7 +159,6 @@ static const struct drm_driver mi0283qt_driver = {
>  	.debugfs_init		= mipi_dbi_debugfs_init,
>  	.name			= "mi0283qt",
>  	.desc			= "Multi-Inno MI0283QT",
> -	.date			= "20160614",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> index b27ed3677bfd..cd5916752507 100644
> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -25,7 +25,6 @@
>  
>  #define DRIVER_NAME	"ofdrm"
>  #define DRIVER_DESC	"DRM driver for OF platform devices"
> -#define DRIVER_DATE	"20220501"
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> @@ -1348,7 +1347,6 @@ static struct drm_driver ofdrm_driver = {
>  	DRM_FBDEV_SHMEM_DRIVER_OPS,
>  	.name			= DRIVER_NAME,
>  	.desc			= DRIVER_DESC,
> -	.date			= DRIVER_DATE,
>  	.major			= DRIVER_MAJOR,
>  	.minor			= DRIVER_MINOR,
>  	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
> diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> index 79d5818cbbe6..4786b8144a9f 100644
> --- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> +++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> @@ -269,7 +269,6 @@ static const struct drm_driver panel_mipi_dbi_driver = {
>  	.debugfs_init		= mipi_dbi_debugfs_init,
>  	.name			= "panel-mipi-dbi",
>  	.desc			= "MIPI DBI compatible display panel",
> -	.date			= "20220103",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 9373063a13fc..52ba6c699bc8 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -917,7 +917,6 @@ static const struct drm_driver repaper_driver = {
>  	DRM_FBDEV_DMA_DRIVER_OPS,
>  	.name			= "repaper",
>  	.desc			= "Pervasive Displays RePaper e-ink panels",
> -	.date			= "20170405",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
> index d87068126f9b..03d2850310c4 100644
> --- a/drivers/gpu/drm/tiny/sharp-memory.c
> +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> @@ -107,7 +107,6 @@ static const struct drm_driver sharp_memory_drm_driver = {
>  	DRM_FBDEV_DMA_DRIVER_OPS,
>  	.name			= "sharp_memory_display",
>  	.desc			= "Sharp Display Memory LCD",
> -	.date			= "20231129",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index b3a2fc11dcf0..b47ca2d902d9 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -31,7 +31,6 @@
>  
>  #define DRIVER_NAME	"simpledrm"
>  #define DRIVER_DESC	"DRM driver for simple-framebuffer platform devices"
> -#define DRIVER_DATE	"20200625"
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> @@ -1015,7 +1014,6 @@ static struct drm_driver simpledrm_driver = {
>  	DRM_FBDEV_SHMEM_DRIVER_OPS,
>  	.name			= DRIVER_NAME,
>  	.desc			= DRIVER_DESC,
> -	.date			= DRIVER_DATE,
>  	.major			= DRIVER_MAJOR,
>  	.minor			= DRIVER_MINOR,
>  	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
> diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
> index 7bfd4296c1c9..a29672d84ede 100644
> --- a/drivers/gpu/drm/tiny/st7586.c
> +++ b/drivers/gpu/drm/tiny/st7586.c
> @@ -295,7 +295,6 @@ static const struct drm_driver st7586_driver = {
>  	.debugfs_init		= mipi_dbi_debugfs_init,
>  	.name			= "st7586",
>  	.desc			= "Sitronix ST7586",
> -	.date			= "20170801",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
> index 6832ca590127..1d60f6e5b3bc 100644
> --- a/drivers/gpu/drm/tiny/st7735r.c
> +++ b/drivers/gpu/drm/tiny/st7735r.c
> @@ -160,7 +160,6 @@ static const struct drm_driver st7735r_driver = {
>  	.debugfs_init		= mipi_dbi_debugfs_init,
>  	.name			= "st7735r",
>  	.desc			= "Sitronix ST7735R",
> -	.date			= "20171128",
>  	.major			= 1,
>  	.minor			= 0,
>  };
> diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
> index cb66dbbe2801..65a0d4301160 100644
> --- a/drivers/gpu/drm/tve200/tve200_drv.c
> +++ b/drivers/gpu/drm/tve200/tve200_drv.c
> @@ -146,7 +146,6 @@ static const struct drm_driver tve200_drm_driver = {
>  	.fops = &drm_fops,
>  	.name = "tve200",
>  	.desc = DRIVER_DESC,
> -	.date = "20170703",
>  	.major = 1,
>  	.minor = 0,
>  	.patchlevel = 0,
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 6c182b21028e..05b3a152cc33 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -78,7 +78,6 @@ static const struct drm_driver driver = {
>  
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
> index 1eb716d9dad5..be00dc1d87a1 100644
> --- a/drivers/gpu/drm/udl/udl_drv.h
> +++ b/drivers/gpu/drm/udl/udl_drv.h
> @@ -26,7 +26,6 @@ struct drm_mode_create_dumb;
>  
>  #define DRIVER_NAME		"udl"
>  #define DRIVER_DESC		"DisplayLink"
> -#define DRIVER_DATE		"20120220"
>  
>  #define DRIVER_MAJOR		0
>  #define DRIVER_MINOR		0
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index fb35c5c3f1a7..9d8de9146cb0 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -31,7 +31,6 @@
>  
>  #define DRIVER_NAME "v3d"
>  #define DRIVER_DESC "Broadcom V3D graphics"
> -#define DRIVER_DATE "20180419"
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
>  #define DRIVER_PATCHLEVEL 0
> @@ -248,7 +247,6 @@ static const struct drm_driver v3d_drm_driver = {
>  
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> index d9d884aad97f..bb861f0a0a31 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -189,7 +189,6 @@ static const struct drm_driver driver = {
>  	.fops = &vbox_fops,
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vboxvideo/vbox_drv.h
> index e77bd6512eb1..dfa935f381a6 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
> @@ -25,7 +25,6 @@
>  
>  #define DRIVER_NAME         "vboxvideo"
>  #define DRIVER_DESC         "Oracle VM VirtualBox Graphics Card"
> -#define DRIVER_DATE         "20130823"
>  
>  #define DRIVER_MAJOR        1
>  #define DRIVER_MINOR        0
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index ee5df153c2a6..e88a7ee486c6 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -47,7 +47,6 @@
>  
>  #define DRIVER_NAME "vc4"
>  #define DRIVER_DESC "Broadcom VC4 graphics"
> -#define DRIVER_DATE "20140616"
>  #define DRIVER_MAJOR 0
>  #define DRIVER_MINOR 0
>  #define DRIVER_PATCHLEVEL 0
> @@ -222,7 +221,6 @@ const struct drm_driver vc4_drm_driver = {
>  
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> @@ -244,7 +242,6 @@ const struct drm_driver vc5_drm_driver = {
>  
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index c5e3e5457737..2752ab4f1c97 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -47,7 +47,6 @@
>  
>  #define DRIVER_NAME	"vgem"
>  #define DRIVER_DESC	"Virtual GEM provider"
> -#define DRIVER_DATE	"20120112"
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> @@ -121,7 +120,6 @@ static const struct drm_driver vgem_driver = {
>  
>  	.name	= DRIVER_NAME,
>  	.desc	= DRIVER_DESC,
> -	.date	= DRIVER_DATE,
>  	.major	= DRIVER_MAJOR,
>  	.minor	= DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index e216123ce6a5..6a67c6297d58 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -201,7 +201,6 @@ static const struct drm_driver driver = {
>  
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 8328107edf78..f42ca9d8ed10 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -45,7 +45,6 @@
>  
>  #define DRIVER_NAME "virtio_gpu"
>  #define DRIVER_DESC "virtio GPU"
> -#define DRIVER_DATE "0"
>  
>  #define DRIVER_MAJOR 0
>  #define DRIVER_MINOR 1
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index fa3331f612e3..e0409aba9349 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -34,7 +34,6 @@
>  
>  #define DRIVER_NAME	"vkms"
>  #define DRIVER_DESC	"Virtual Kernel Mode Setting"
> -#define DRIVER_DATE	"20180514"
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> @@ -116,7 +115,6 @@ static const struct drm_driver vkms_driver = {
>  
>  	.name			= DRIVER_NAME,
>  	.desc			= DRIVER_DESC,
> -	.date			= DRIVER_DATE,
>  	.major			= DRIVER_MAJOR,
>  	.minor			= DRIVER_MINOR,
>  };
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index ded48554568a..1699236fca5a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1634,7 +1634,6 @@ static const struct drm_driver driver = {
>  	.fops = &vmwgfx_driver_fops,
>  	.name = VMWGFX_DRIVER_NAME,
>  	.desc = VMWGFX_DRIVER_DESC,
> -	.date = VMWGFX_DRIVER_DATE,
>  	.major = VMWGFX_DRIVER_MAJOR,
>  	.minor = VMWGFX_DRIVER_MINOR,
>  	.patchlevel = VMWGFX_DRIVER_PATCHLEVEL
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index b21831ef214a..5275ef632d4b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -57,7 +57,6 @@
>  
>  
>  #define VMWGFX_DRIVER_NAME "vmwgfx"
> -#define VMWGFX_DRIVER_DATE "20211206"
>  #define VMWGFX_DRIVER_MAJOR 2
>  #define VMWGFX_DRIVER_MINOR 20
>  #define VMWGFX_DRIVER_PATCHLEVEL 0
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d6fccea1e083..56d4ffb650da 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -271,7 +271,6 @@ static struct drm_driver driver = {
>  	.fops = &xe_driver_fops,
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -	.date = DRIVER_DATE,
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> diff --git a/drivers/gpu/drm/xe/xe_drv.h b/drivers/gpu/drm/xe/xe_drv.h
> index d45b71426cc8..d61650d4aa0b 100644
> --- a/drivers/gpu/drm/xe/xe_drv.h
> +++ b/drivers/gpu/drm/xe/xe_drv.h
> @@ -10,7 +10,6 @@
>  
>  #define DRIVER_NAME		"xe"
>  #define DRIVER_DESC		"Intel Xe Graphics"
> -#define DRIVER_DATE		"20201103"
>  
>  /* Interface history:
>   *
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
> index 931d855bfbe8..1bda7ef606cc 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -478,7 +478,6 @@ static const struct drm_driver xen_drm_driver = {
>  	.fops                      = &xen_drm_dev_fops,
>  	.name                      = "xendrm-du",
>  	.desc                      = "Xen PV DRM Display Unit",
> -	.date                      = "20180221",
>  	.major                     = 1,
>  	.minor                     = 0,
>  
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index e272ecbce78d..b47463473472 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -409,7 +409,6 @@ static const struct drm_driver zynqmp_dpsub_drm_driver = {
>  
>  	.name				= "zynqmp-dpsub",
>  	.desc				= "Xilinx DisplayPort Subsystem Driver",
> -	.date				= "20130509",
>  	.major				= 1,
>  	.minor				= 0,
>  };
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 1bbbcb8e2d23..1b6e59139e6c 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -401,8 +401,6 @@ struct drm_driver {
>  	char *name;
>  	/** @desc: driver description */
>  	char *desc;
> -	/** @date: driver date, unused, to be removed */
> -	char *date;
>  
>  	/**
>  	 * @driver_features:
> -- 
> 2.39.5
> 
