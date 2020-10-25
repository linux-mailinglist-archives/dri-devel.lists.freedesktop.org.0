Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8CF298468
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 23:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEA76E192;
	Sun, 25 Oct 2020 22:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B85B6E0CA;
 Sun, 25 Oct 2020 22:23:07 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 890DE80617;
 Sun, 25 Oct 2020 23:23:04 +0100 (CET)
Date: Sun, 25 Oct 2020 23:23:03 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/<drivers>: Constify struct drm_driver
Message-ID: <20201025222303.GC13779@ravnborg.org>
References: <20201023122811.2374118-5-daniel.vetter@ffwll.ch>
 <20201023160444.2465340-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023160444.2465340-1-daniel.vetter@ffwll.ch>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=Z4Rwk6OoAAAA:8 a=zd2uoN0lAAAA:8 a=-VAfIpHNAAAA:8
 a=e5mUnYsNAAAA:8 a=fLIKNa0IfpaR454oFnEA:9 a=dFbw1gzEVroshRA1:21
 a=HkR1fkZi_cuvAmkX:21 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=AjGcO6oz07-iQ99wixmX:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=srlwD-8ojaedGGhPAyx8:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: kernel test robot <lkp@intel.com>, Leo Li <sunpeng.li@amd.com>,
 nouveau@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Fri, Oct 23, 2020 at 06:04:44PM +0200, Daniel Vetter wrote:
> Only the following drivers aren't converted:
> - amdgpu, because of the driver_feature mangling due to virt support
> - nouveau, because DRIVER_ATOMIC uapi is still not the default on the
>   platforms where it's supported (i.e. again driver_feature mangling)
> - vc4, again because of driver_feature mangling
> - qxl, because the ioctl table is somewhere else and moving that is
>   maybe a bit too much, hence the num_ioctls assignment prevents a
>   const driver structure.
My grepping turned up the following:
- The example in drm_drv needs to be updated
- legacy drivers, that are obviously not converted - but worth to
  mention above
- arc is not converted and it is not legacy  =

  Maybe you have it covered in your big arc conversion patch?

With the above fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> =

> Note that for armada I also went ahead and made the ioctl array const.
> =

> Only cc'ing the driver people who've not been converted (everyone else
> is way too much).
> =

> v2: Fix one misplaced const static, should be static const (0day)
> =

> Cc: kernel test robot <lkp@intel.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Hmm, so we have more than one Daniel in play here.
Both the Intel guy and the ffwll guy - looks funny.

	Sam

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c  | 2 +-
>  drivers/gpu/drm/arm/hdlcd_drv.c                  | 2 +-
>  drivers/gpu/drm/arm/malidp_drv.c                 | 2 +-
>  drivers/gpu/drm/armada/armada_drv.c              | 7 +++----
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c          | 2 +-
>  drivers/gpu/drm/ast/ast_drv.c                    | 2 +-
>  drivers/gpu/drm/ast/ast_drv.h                    | 2 +-
>  drivers/gpu/drm/ast/ast_main.c                   | 2 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c     | 2 +-
>  drivers/gpu/drm/bochs/bochs_drv.c                | 2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c            | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.c          | 2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c        | 5 ++---
>  drivers/gpu/drm/gma500/psb_drv.c                 | 4 ++--
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  | 2 +-
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c  | 2 +-
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h  | 2 +-
>  drivers/gpu/drm/i915/i915_drv.c                  | 4 ++--
>  drivers/gpu/drm/i915/selftests/mock_gem_device.c | 2 +-
>  drivers/gpu/drm/imx/dcss/dcss-kms.c              | 2 +-
>  drivers/gpu/drm/imx/imx-drm-core.c               | 2 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c        | 2 +-
>  drivers/gpu/drm/lima/lima_drv.c                  | 2 +-
>  drivers/gpu/drm/mcde/mcde_drv.c                  | 2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c           | 2 +-
>  drivers/gpu/drm/meson/meson_drv.c                | 2 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.c            | 2 +-
>  drivers/gpu/drm/msm/msm_drv.c                    | 4 ++--
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c                | 2 +-
>  drivers/gpu/drm/omapdrm/omap_drv.c               | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c          | 2 +-
>  drivers/gpu/drm/pl111/pl111_drv.c                | 2 +-
>  drivers/gpu/drm/radeon/radeon_drv.c              | 4 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c            | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c      | 4 ++--
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c         | 2 +-
>  drivers/gpu/drm/sti/sti_drv.c                    | 2 +-
>  drivers/gpu/drm/stm/drv.c                        | 2 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c                | 2 +-
>  drivers/gpu/drm/tegra/drm.c                      | 5 ++---
>  drivers/gpu/drm/tidss/tidss_drv.c                | 2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c              | 4 ++--
>  drivers/gpu/drm/tiny/cirrus.c                    | 2 +-
>  drivers/gpu/drm/tiny/gm12u320.c                  | 2 +-
>  drivers/gpu/drm/tiny/hx8357d.c                   | 2 +-
>  drivers/gpu/drm/tiny/ili9225.c                   | 2 +-
>  drivers/gpu/drm/tiny/ili9341.c                   | 2 +-
>  drivers/gpu/drm/tiny/ili9486.c                   | 2 +-
>  drivers/gpu/drm/tiny/mi0283qt.c                  | 2 +-
>  drivers/gpu/drm/tiny/repaper.c                   | 2 +-
>  drivers/gpu/drm/tiny/st7586.c                    | 2 +-
>  drivers/gpu/drm/tiny/st7735r.c                   | 2 +-
>  drivers/gpu/drm/tve200/tve200_drv.c              | 2 +-
>  drivers/gpu/drm/udl/udl_drv.c                    | 2 +-
>  drivers/gpu/drm/v3d/v3d_drv.c                    | 2 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.c             | 4 ++--
>  drivers/gpu/drm/vgem/vgem_drv.c                  | 2 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c             | 4 ++--
>  drivers/gpu/drm/vkms/vkms_drv.c                  | 2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c              | 2 +-
>  drivers/gpu/drm/xen/xen_drm_front.c              | 2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c              | 2 +-
>  drivers/gpu/drm/zte/zx_drm_drv.c                 | 2 +-
>  63 files changed, 75 insertions(+), 78 deletions(-)
> =

> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gp=
u/drm/arm/display/komeda/komeda_kms.c
> index cc5b5915bc5e..d04008f3e31a 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -58,7 +58,7 @@ static irqreturn_t komeda_kms_irq_handler(int irq, void=
 *data)
>  	return status;
>  }
>  =

> -static struct drm_driver komeda_kms_driver =3D {
> +static const struct drm_driver komeda_kms_driver =3D {
>  	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.lastclose			=3D drm_fb_helper_lastclose,
>  	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(komeda_gem_cma_dumb_create),
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_=
drv.c
> index faa8a5a752da..81ae92390736 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -234,7 +234,7 @@ static void hdlcd_debugfs_init(struct drm_minor *mino=
r)
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(fops);
>  =

> -static struct drm_driver hdlcd_driver =3D {
> +static const struct drm_driver hdlcd_driver =3D {
>  	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.irq_handler =3D hdlcd_irq,
>  	.irq_preinstall =3D hdlcd_irq_preinstall,
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malid=
p_drv.c
> index 26e60401a8e1..d83c7366b348 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -564,7 +564,7 @@ static void malidp_debugfs_init(struct drm_minor *min=
or)
>  =

>  #endif //CONFIG_DEBUG_FS
>  =

> -static struct drm_driver malidp_driver =3D {
> +static const struct drm_driver malidp_driver =3D {
>  	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(malidp_dumb_create),
>  #ifdef CONFIG_DEBUG_FS
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada=
/armada_drv.c
> index 22247cfce80b..44fe9f994fc5 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -27,7 +27,7 @@
>  #include <drm/armada_drm.h>
>  #include "armada_ioctlP.h"
>  =

> -static struct drm_ioctl_desc armada_ioctls[] =3D {
> +static const struct drm_ioctl_desc armada_ioctls[] =3D {
>  	DRM_IOCTL_DEF_DRV(ARMADA_GEM_CREATE, armada_gem_create_ioctl,0),
>  	DRM_IOCTL_DEF_DRV(ARMADA_GEM_MMAP, armada_gem_mmap_ioctl, 0),
>  	DRM_IOCTL_DEF_DRV(ARMADA_GEM_PWRITE, armada_gem_pwrite_ioctl, 0),
> @@ -35,7 +35,7 @@ static struct drm_ioctl_desc armada_ioctls[] =3D {
>  =

>  DEFINE_DRM_GEM_FOPS(armada_drm_fops);
>  =

> -static struct drm_driver armada_drm_driver =3D {
> +static const struct drm_driver armada_drm_driver =3D {
>  	.lastclose		=3D drm_fb_helper_lastclose,
>  	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
> @@ -48,6 +48,7 @@ static struct drm_driver armada_drm_driver =3D {
>  	.date			=3D "20120730",
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.ioctls			=3D armada_ioctls,
> +	.num_ioctls =3D ARRAY_SIZE(armada_ioctls),
>  	.fops			=3D &armada_drm_fops,
>  };
>  =

> @@ -275,8 +276,6 @@ static int __init armada_drm_init(void)
>  {
>  	int ret;
>  =

> -	armada_drm_driver.num_ioctls =3D ARRAY_SIZE(armada_ioctls);
> -
>  	ret =3D platform_driver_register(&armada_lcd_platform_driver);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/as=
peed/aspeed_gfx_drv.c
> index 771ad71cd340..457ec04950f7 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -191,7 +191,7 @@ static void aspeed_gfx_unload(struct drm_device *drm)
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(fops);
>  =

> -static struct drm_driver aspeed_gfx_driver =3D {
> +static const struct drm_driver aspeed_gfx_driver =3D {
>  	.driver_features        =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	DRM_GEM_CMA_DRIVER_OPS,
>  	.fops =3D &fops,
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index f0b4af1c390a..667b450606ef 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -49,7 +49,7 @@ module_param_named(modeset, ast_modeset, int, 0400);
>  =

>  DEFINE_DRM_GEM_FOPS(ast_fops);
>  =

> -static struct drm_driver ast_driver =3D {
> +static const struct drm_driver ast_driver =3D {
>  	.driver_features =3D DRIVER_ATOMIC |
>  			   DRIVER_GEM |
>  			   DRIVER_MODESET,
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 467049ca8430..33e596a4f042 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -159,7 +159,7 @@ static inline struct ast_private *to_ast_private(stru=
ct drm_device *dev)
>  	return container_of(dev, struct ast_private, base);
>  }
>  =

> -struct ast_private *ast_device_create(struct drm_driver *drv,
> +struct ast_private *ast_device_create(const struct drm_driver *drv,
>  				      struct pci_dev *pdev,
>  				      unsigned long flags);
>  =

> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_mai=
n.c
> index 77066bca8793..45dd8185a488 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -392,7 +392,7 @@ static void ast_device_release(void *data)
>  	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
>  }
>  =

> -struct ast_private *ast_device_create(struct drm_driver *drv,
> +struct ast_private *ast_device_create(const struct drm_driver *drv,
>  				      struct pci_dev *pdev,
>  				      unsigned long flags)
>  {
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/d=
rm/atmel-hlcdc/atmel_hlcdc_dc.c
> index 03984932d174..65af56e47129 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -712,7 +712,7 @@ static void atmel_hlcdc_dc_irq_uninstall(struct drm_d=
evice *dev)
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(fops);
>  =

> -static struct drm_driver atmel_hlcdc_dc_driver =3D {
> +static const struct drm_driver atmel_hlcdc_dc_driver =3D {
>  	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.irq_handler =3D atmel_hlcdc_dc_irq_handler,
>  	.irq_preinstall =3D atmel_hlcdc_dc_irq_uninstall,
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bo=
chs_drv.c
> index e18c51de1196..fd454225fd19 100644
> --- a/drivers/gpu/drm/bochs/bochs_drv.c
> +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> @@ -57,7 +57,7 @@ static int bochs_load(struct drm_device *dev)
>  =

>  DEFINE_DRM_GEM_FOPS(bochs_fops);
>  =

> -static struct drm_driver bochs_driver =3D {
> +static const struct drm_driver bochs_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &bochs_fops,
>  	.name			=3D "bochs-drm",
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index aa270b79e585..7604e3c07973 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -480,7 +480,7 @@ static const struct file_operations fops =3D {
>  	.mmap               =3D etnaviv_gem_mmap,
>  };
>  =

> -static struct drm_driver etnaviv_drm_driver =3D {
> +static const struct drm_driver etnaviv_drm_driver =3D {
>  	.driver_features    =3D DRIVER_GEM | DRIVER_RENDER,
>  	.open               =3D etnaviv_open,
>  	.postclose           =3D etnaviv_postclose,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index fe46680ca208..e60257f1f24b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -113,7 +113,7 @@ static const struct file_operations exynos_drm_driver=
_fops =3D {
>  	.release	=3D drm_release,
>  };
>  =

> -static struct drm_driver exynos_drm_driver =3D {
> +static const struct drm_driver exynos_drm_driver =3D {
>  	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM
>  				  | DRIVER_ATOMIC | DRIVER_RENDER,
>  	.open			=3D exynos_drm_open,
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/=
fsl-dcu/fsl_dcu_drm_drv.c
> index ae584f62aa19..75b58d55a940 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -124,7 +124,7 @@ static irqreturn_t fsl_dcu_drm_irq(int irq, void *arg)
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(fsl_dcu_drm_fops);
>  =

> -static struct drm_driver fsl_dcu_drm_driver =3D {
> +static const struct drm_driver fsl_dcu_drm_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.load			=3D fsl_dcu_load,
>  	.unload			=3D fsl_dcu_unload,
> @@ -224,7 +224,6 @@ static int fsl_dcu_drm_probe(struct platform_device *=
pdev)
>  	struct device *dev =3D &pdev->dev;
>  	struct resource *res;
>  	void __iomem *base;
> -	struct drm_driver *driver =3D &fsl_dcu_drm_driver;
>  	struct clk *pix_clk_in;
>  	char pix_clk_name[32];
>  	const char *pix_clk_in_name;
> @@ -294,7 +293,7 @@ static int fsl_dcu_drm_probe(struct platform_device *=
pdev)
>  =

>  	fsl_dev->tcon =3D fsl_tcon_init(dev);
>  =

> -	drm =3D drm_dev_alloc(driver, dev);
> +	drm =3D drm_dev_alloc(&fsl_dcu_drm_driver, dev);
>  	if (IS_ERR(drm)) {
>  		ret =3D PTR_ERR(drm);
>  		goto unregister_pix_clk;
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/ps=
b_drv.c
> index b13376a6fb91..6e7197d89463 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -34,7 +34,7 @@
>  #include "psb_intel_reg.h"
>  #include "psb_reg.h"
>  =

> -static struct drm_driver driver;
> +static const struct drm_driver driver;
>  static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_i=
d *ent);
>  =

>  /*
> @@ -491,7 +491,7 @@ static const struct file_operations psb_gem_fops =3D {
>  	.read =3D drm_read,
>  };
>  =

> -static struct drm_driver driver =3D {
> +static const struct drm_driver driver =3D {
>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM,
>  	.lastclose =3D drm_fb_helper_lastclose,
>  =

> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gp=
u/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index a684814927cd..27205aa907f4 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -43,7 +43,7 @@ static irqreturn_t hibmc_drm_interrupt(int irq, void *a=
rg)
>  	return IRQ_HANDLED;
>  }
>  =

> -static struct drm_driver hibmc_driver =3D {
> +static const struct drm_driver hibmc_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &hibmc_fops,
>  	.name			=3D "hibmc",
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gp=
u/drm/hisilicon/kirin/kirin_drm_ade.c
> index cfe8ff596d55..aa9641a6a7d8 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> @@ -918,7 +918,7 @@ static const struct drm_mode_config_funcs ade_mode_co=
nfig_funcs =3D {
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(ade_fops);
>  =

> -static struct drm_driver ade_driver =3D {
> +static const struct drm_driver ade_driver =3D {
>  	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops =3D &ade_fops,
>  	DRM_GEM_CMA_DRIVER_OPS,
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h b/drivers/gp=
u/drm/hisilicon/kirin/kirin_drm_drv.h
> index dee8ec2f7f2e..386d137f29e5 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
> @@ -40,7 +40,7 @@ struct kirin_drm_data {
>  	u32 num_planes;
>  	u32 prim_plane;
>  =

> -	struct drm_driver *driver;
> +	const struct drm_driver *driver;
>  	const struct drm_crtc_helper_funcs *crtc_helper_funcs;
>  	const struct drm_crtc_funcs *crtc_funcs;
>  	const struct drm_plane_helper_funcs *plane_helper_funcs;
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_=
drv.c
> index d3237b0d821d..27249b5e2729 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -87,7 +87,7 @@
>  #include "intel_sideband.h"
>  #include "vlv_suspend.h"
>  =

> -static struct drm_driver driver;
> +static const struct drm_driver driver;
>  =

>  static int i915_get_bridge_dev(struct drm_i915_private *dev_priv)
>  {
> @@ -1758,7 +1758,7 @@ static const struct drm_ioctl_desc i915_ioctls[] =
=3D {
>  	DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl, DRM_R=
ENDER_ALLOW),
>  };
>  =

> -static struct drm_driver driver =3D {
> +static const struct drm_driver driver =3D {
>  	/* Don't use MTRRs here; the Xserver or userspace app should
>  	 * deal with them for Intel hardware.
>  	 */
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/g=
pu/drm/i915/selftests/mock_gem_device.c
> index 9220c9d1a4b7..e946bd2087d8 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -81,7 +81,7 @@ static void mock_device_release(struct drm_device *dev)
>  	i915_params_free(&i915->params);
>  }
>  =

> -static struct drm_driver mock_driver =3D {
> +static const struct drm_driver mock_driver =3D {
>  	.name =3D "mock",
>  	.driver_features =3D DRIVER_GEM,
>  	.release =3D mock_device_release,
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dc=
ss/dcss-kms.c
> index b72e5cef7e40..b549ce5e7607 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -26,7 +26,7 @@ static const struct drm_mode_config_funcs dcss_drm_mode=
_config_funcs =3D {
>  	.atomic_commit =3D drm_atomic_helper_commit,
>  };
>  =

> -static struct drm_driver dcss_kms_driver =3D {
> +static const struct drm_driver dcss_kms_driver =3D {
>  	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	DRM_GEM_CMA_DRIVER_OPS,
>  	.fops			=3D &dcss_cma_fops,
> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx=
-drm-core.c
> index 183f2e91881d..7090b82e7ea2 100644
> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> @@ -143,7 +143,7 @@ static const struct drm_ioctl_desc imx_drm_ioctls[] =
=3D {
>  	/* none so far */
>  };
>  =

> -static struct drm_driver imx_drm_driver =3D {
> +static const struct drm_driver imx_drm_driver =3D {
>  	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	DRM_GEM_CMA_DRIVER_OPS,
>  	.ioctls			=3D imx_drm_ioctls,
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/=
ingenic/ingenic-drm-drv.c
> index 2329754af116..082cb9e45908 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -710,7 +710,7 @@ static void ingenic_drm_disable_vblank(struct drm_crt=
c *crtc)
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(ingenic_drm_fops);
>  =

> -static struct drm_driver ingenic_drm_driver_data =3D {
> +static const struct drm_driver ingenic_drm_driver_data =3D {
>  	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.name			=3D "ingenic-drm",
>  	.desc			=3D "DRM module for Ingenic SoCs",
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_=
drv.c
> index ab460121fd52..d497af91d850 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -261,7 +261,7 @@ DEFINE_DRM_GEM_FOPS(lima_drm_driver_fops);
>   * - 1.1.0 - add heap buffer support
>   */
>  =

> -static struct drm_driver lima_drm_driver =3D {
> +static const struct drm_driver lima_drm_driver =3D {
>  	.driver_features    =3D DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
>  	.open               =3D lima_drm_driver_open,
>  	.postclose          =3D lima_drm_driver_postclose,
> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_=
drv.c
> index f9b5f450a9cb..870626e04ec0 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -178,7 +178,7 @@ static int mcde_modeset_init(struct drm_device *drm)
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(drm_fops);
>  =

> -static struct drm_driver mcde_drm_driver =3D {
> +static const struct drm_driver mcde_drm_driver =3D {
>  	.driver_features =3D
>  		DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.lastclose =3D drm_fb_helper_lastclose,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 7f3398a7c2b0..2e8065b1e2bb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -321,7 +321,7 @@ struct drm_gem_object *mtk_drm_gem_prime_import(struc=
t drm_device *dev,
>  	return drm_gem_prime_import_dev(dev, dma_buf, private->dma_dev);
>  }
>  =

> -static struct drm_driver mtk_drm_driver =3D {
> +static const struct drm_driver mtk_drm_driver =3D {
>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  =

>  	.dumb_create =3D mtk_drm_gem_dumb_create,
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/me=
son_drv.c
> index 8b9c8dd788c4..dc8509ceb787 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -90,7 +90,7 @@ static int meson_dumb_create(struct drm_file *file, str=
uct drm_device *dev,
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(fops);
>  =

> -static struct drm_driver meson_driver =3D {
> +static const struct drm_driver meson_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  =

>  	/* IRQ */
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag=
200/mgag200_drv.c
> index 771b26aeee19..0f07f259503d 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -28,7 +28,7 @@ module_param_named(modeset, mgag200_modeset, int, 0400);
>  =

>  DEFINE_DRM_GEM_FOPS(mgag200_driver_fops);
>  =

> -static struct drm_driver mgag200_driver =3D {
> +static const struct drm_driver mgag200_driver =3D {
>  	.driver_features =3D DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
>  	.fops =3D &mgag200_driver_fops,
>  	.name =3D DRIVER_NAME,
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index aa4509766d64..f8fd31e709bb 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -393,7 +393,7 @@ static int msm_init_vram(struct drm_device *dev)
>  	return ret;
>  }
>  =

> -static int msm_drm_init(struct device *dev, struct drm_driver *drv)
> +static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>  {
>  	struct platform_device *pdev =3D to_platform_device(dev);
>  	struct drm_device *ddev;
> @@ -984,7 +984,7 @@ static const struct file_operations fops =3D {
>  	.mmap               =3D msm_gem_mmap,
>  };
>  =

> -static struct drm_driver msm_driver =3D {
> +static const struct drm_driver msm_driver =3D {
>  	.driver_features    =3D DRIVER_GEM |
>  				DRIVER_RENDER |
>  				DRIVER_ATOMIC |
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mx=
sfb_drv.c
> index 35122aef037b..6faf17b6408d 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -289,7 +289,7 @@ static irqreturn_t mxsfb_irq_handler(int irq, void *d=
ata)
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(fops);
>  =

> -static struct drm_driver mxsfb_driver =3D {
> +static const struct drm_driver mxsfb_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.irq_handler		=3D mxsfb_irq_handler,
>  	.irq_preinstall		=3D mxsfb_irq_disable,
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm=
/omap_drv.c
> index 2b82a708eca6..21a6cd3f5473 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -534,7 +534,7 @@ static const struct file_operations omapdriver_fops =
=3D {
>  	.llseek =3D noop_llseek,
>  };
>  =

> -static struct drm_driver omap_drm_driver =3D {
> +static const struct drm_driver omap_drm_driver =3D {
>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM  |
>  		DRIVER_ATOMIC | DRIVER_RENDER,
>  	.open =3D dev_open,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 37d4cb7a5491..ed116bd3d6d6 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -548,7 +548,7 @@ DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
>   * - 1.0 - initial interface
>   * - 1.1 - adds HEAP and NOEXEC flags for CREATE_BO
>   */
> -static struct drm_driver panfrost_drm_driver =3D {
> +static const struct drm_driver panfrost_drm_driver =3D {
>  	.driver_features	=3D DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
>  	.open			=3D panfrost_open,
>  	.postclose		=3D panfrost_postclose,
> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl=
111_drv.c
> index 3899c28f428d..10d9a12be672 100644
> --- a/drivers/gpu/drm/pl111/pl111_drv.c
> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
> @@ -213,7 +213,7 @@ pl111_gem_import_sg_table(struct drm_device *dev,
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(drm_fops);
>  =

> -static struct drm_driver pl111_drm_driver =3D {
> +static const struct drm_driver pl111_drm_driver =3D {
>  	.driver_features =3D
>  		DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.ioctls =3D NULL,
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon=
/radeon_drv.c
> index 9c11e36ad33a..bfadb799d6a3 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -297,7 +297,7 @@ static struct pci_device_id pciidlist[] =3D {
>  =

>  MODULE_DEVICE_TABLE(pci, pciidlist);
>  =

> -static struct drm_driver kms_driver;
> +static const struct drm_driver kms_driver;
>  =

>  bool radeon_device_is_virtual(void);
>  =

> @@ -629,7 +629,7 @@ static const struct drm_ioctl_desc radeon_ioctls_kms[=
] =3D {
>  	DRM_IOCTL_DEF_DRV(RADEON_GEM_USERPTR, radeon_gem_userptr_ioctl, DRM_AUT=
H|DRM_RENDER_ALLOW),
>  };
>  =

> -static struct drm_driver kms_driver =3D {
> +static const struct drm_driver kms_driver =3D {
>  	.driver_features =3D
>  	    DRIVER_GEM | DRIVER_RENDER | DRIVER_MODESET,
>  	.load =3D radeon_driver_load_kms,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar=
-du/rcar_du_drv.c
> index 447be991fa25..600056dff374 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -507,7 +507,7 @@ MODULE_DEVICE_TABLE(of, rcar_du_of_table);
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
>  =

> -static struct drm_driver rcar_du_driver =3D {
> +static const struct drm_driver rcar_du_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(rcar_du_dumb_create),
>  	.fops			=3D &rcar_du_fops,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_drv.c
> index b7654f5e4225..212bd87c0c4a 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -35,7 +35,7 @@
>  #define DRIVER_MINOR	0
>  =

>  static bool is_support_iommu =3D true;
> -static struct drm_driver rockchip_drm_driver;
> +static const struct drm_driver rockchip_drm_driver;
>  =

>  /*
>   * Attach a (component) device to the shared drm dma mapping from master=
 drm
> @@ -209,7 +209,7 @@ static const struct file_operations rockchip_drm_driv=
er_fops =3D {
>  	.release =3D drm_release,
>  };
>  =

> -static struct drm_driver rockchip_drm_driver =3D {
> +static const struct drm_driver rockchip_drm_driver =3D {
>  	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.lastclose		=3D drm_fb_helper_lastclose,
>  	.dumb_create		=3D rockchip_gem_dumb_create,
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/s=
hmobile/shmob_drm_drv.c
> index 26a15c214bd3..0a02b7092c04 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -128,7 +128,7 @@ static irqreturn_t shmob_drm_irq(int irq, void *arg)
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(shmob_drm_fops);
>  =

> -static struct drm_driver shmob_drm_driver =3D {
> +static const struct drm_driver shmob_drm_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET,
>  	.irq_handler		=3D shmob_drm_irq,
>  	DRM_GEM_CMA_DRIVER_OPS,
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index 3f54efa36098..c7efb43b83ee 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -130,7 +130,7 @@ static void sti_mode_config_init(struct drm_device *d=
ev)
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(sti_driver_fops);
>  =

> -static struct drm_driver sti_driver =3D {
> +static const struct drm_driver sti_driver =3D {
>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.fops =3D &sti_driver_fops,
>  	DRM_GEM_CMA_DRIVER_OPS,
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index 411103f013e2..222869b232ae 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -53,7 +53,7 @@ static int stm_gem_cma_dumb_create(struct drm_file *fil=
e,
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(drv_driver_fops);
>  =

> -static struct drm_driver drv_driver =3D {
> +static const struct drm_driver drv_driver =3D {
>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.name =3D "stm",
>  	.desc =3D "STMicroelectronics SoC DRM",
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/su=
n4i_drv.c
> index 29861fc81b35..91502937f26d 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -40,7 +40,7 @@ static int drm_sun4i_gem_dumb_create(struct drm_file *f=
ile_priv,
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(sun4i_drv_fops);
>  =

> -static struct drm_driver sun4i_drv_driver =3D {
> +static const struct drm_driver sun4i_drv_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  =

>  	/* Generic Operations */
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 24f353c1cee8..ae13a3ff8a87 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -850,7 +850,7 @@ static void tegra_debugfs_init(struct drm_minor *mino=
r)
>  }
>  #endif
>  =

> -static struct drm_driver tegra_drm_driver =3D {
> +static const struct drm_driver tegra_drm_driver =3D {
>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM |
>  			   DRIVER_ATOMIC | DRIVER_RENDER,
>  	.open =3D tegra_drm_open,
> @@ -1084,12 +1084,11 @@ static bool host1x_drm_wants_iommu(struct host1x_=
device *dev)
>  =

>  static int host1x_drm_probe(struct host1x_device *dev)
>  {
> -	struct drm_driver *driver =3D &tegra_drm_driver;
>  	struct tegra_drm *tegra;
>  	struct drm_device *drm;
>  	int err;
>  =

> -	drm =3D drm_dev_alloc(driver, &dev->dev);
> +	drm =3D drm_dev_alloc(&tegra_drm_driver, &dev->dev);
>  	if (IS_ERR(drm))
>  		return PTR_ERR(drm);
>  =

> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/ti=
dss_drv.c
> index 9179ea18f625..66e3c86eb5c7 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -108,7 +108,7 @@ static void tidss_release(struct drm_device *ddev)
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(tidss_fops);
>  =

> -static struct drm_driver tidss_driver =3D {
> +static const struct drm_driver tidss_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &tidss_fops,
>  	.release		=3D tidss_release,
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc=
/tilcdc_drv.c
> index c5f82e693f1a..137f74f613ab 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -166,7 +166,7 @@ static void tilcdc_fini(struct drm_device *dev)
>  	drm_dev_put(dev);
>  }
>  =

> -static int tilcdc_init(struct drm_driver *ddrv, struct device *dev)
> +static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
>  {
>  	struct drm_device *ddev;
>  	struct platform_device *pdev =3D to_platform_device(dev);
> @@ -452,7 +452,7 @@ static void tilcdc_debugfs_init(struct drm_minor *min=
or)
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(fops);
>  =

> -static struct drm_driver tilcdc_driver =3D {
> +static const struct drm_driver tilcdc_driver =3D {
>  	.driver_features    =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.irq_handler        =3D tilcdc_irq,
>  	DRM_GEM_CMA_DRIVER_OPS,
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> index 759a5a66dd0b..e5641969c181 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -536,7 +536,7 @@ static int cirrus_mode_config_init(struct cirrus_devi=
ce *cirrus)
>  =

>  DEFINE_DRM_GEM_FOPS(cirrus_fops);
>  =

> -static struct drm_driver cirrus_driver =3D {
> +static const struct drm_driver cirrus_driver =3D {
>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  =

>  	.name		 =3D DRIVER_NAME,
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u=
320.c
> index cc397671f689..5a953c4ce265 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -600,7 +600,7 @@ static const uint64_t gm12u320_pipe_modifiers[] =3D {
>  =

>  DEFINE_DRM_GEM_FOPS(gm12u320_fops);
>  =

> -static struct drm_driver gm12u320_drm_driver =3D {
> +static const struct drm_driver gm12u320_drm_driver =3D {
>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  =

>  	.name		 =3D DRIVER_NAME,
> diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357=
d.c
> index 0998309b0d95..c6525cd02bc2 100644
> --- a/drivers/gpu/drm/tiny/hx8357d.c
> +++ b/drivers/gpu/drm/tiny/hx8357d.c
> @@ -193,7 +193,7 @@ static const struct drm_display_mode yx350hv15_mode =
=3D {
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(hx8357d_fops);
>  =

> -static struct drm_driver hx8357d_driver =3D {
> +static const struct drm_driver hx8357d_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &hx8357d_fops,
>  	DRM_GEM_CMA_DRIVER_OPS_VMAP,
> diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili922=
5.c
> index 97a77262d791..8e98962db5a2 100644
> --- a/drivers/gpu/drm/tiny/ili9225.c
> +++ b/drivers/gpu/drm/tiny/ili9225.c
> @@ -337,7 +337,7 @@ static const struct drm_display_mode ili9225_mode =3D=
 {
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(ili9225_fops);
>  =

> -static struct drm_driver ili9225_driver =3D {
> +static const struct drm_driver ili9225_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &ili9225_fops,
>  	DRM_GEM_CMA_DRIVER_OPS_VMAP,
> diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili934=
1.c
> index d39c39df56ad..6ce97f0698eb 100644
> --- a/drivers/gpu/drm/tiny/ili9341.c
> +++ b/drivers/gpu/drm/tiny/ili9341.c
> @@ -149,7 +149,7 @@ static const struct drm_display_mode yx240qv29_mode =
=3D {
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(ili9341_fops);
>  =

> -static struct drm_driver ili9341_driver =3D {
> +static const struct drm_driver ili9341_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &ili9341_fops,
>  	DRM_GEM_CMA_DRIVER_OPS_VMAP,
> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili948=
6.c
> index 403af68fa440..d7ce40eb166a 100644
> --- a/drivers/gpu/drm/tiny/ili9486.c
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -162,7 +162,7 @@ static const struct drm_display_mode waveshare_mode =
=3D {
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(ili9486_fops);
>  =

> -static struct drm_driver ili9486_driver =3D {
> +static const struct drm_driver ili9486_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &ili9486_fops,
>  	DRM_GEM_CMA_DRIVER_OPS_VMAP,
> diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi028=
3qt.c
> index 2131b4268c00..ff77f983f803 100644
> --- a/drivers/gpu/drm/tiny/mi0283qt.c
> +++ b/drivers/gpu/drm/tiny/mi0283qt.c
> @@ -153,7 +153,7 @@ static const struct drm_display_mode mi0283qt_mode =
=3D {
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(mi0283qt_fops);
>  =

> -static struct drm_driver mi0283qt_driver =3D {
> +static const struct drm_driver mi0283qt_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &mi0283qt_fops,
>  	DRM_GEM_CMA_DRIVER_OPS_VMAP,
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repape=
r.c
> index 2e01cf0a9876..11c602fc9897 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -936,7 +936,7 @@ static const u8 repaper_e2271cs021_cs[] =3D { 0x00, 0=
x00, 0x00, 0x7f,
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(repaper_fops);
>  =

> -static struct drm_driver repaper_driver =3D {
> +static const struct drm_driver repaper_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &repaper_fops,
>  	DRM_GEM_CMA_DRIVER_OPS_VMAP,
> diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
> index d05de03891f8..ff5cf60f4bd7 100644
> --- a/drivers/gpu/drm/tiny/st7586.c
> +++ b/drivers/gpu/drm/tiny/st7586.c
> @@ -277,7 +277,7 @@ static const struct drm_display_mode st7586_mode =3D {
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(st7586_fops);
>  =

> -static struct drm_driver st7586_driver =3D {
> +static const struct drm_driver st7586_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &st7586_fops,
>  	DRM_GEM_CMA_DRIVER_OPS_VMAP,
> diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735=
r.c
> index a0f688f0d050..2c77d9ab7e8d 100644
> --- a/drivers/gpu/drm/tiny/st7735r.c
> +++ b/drivers/gpu/drm/tiny/st7735r.c
> @@ -154,7 +154,7 @@ static const struct st7735r_cfg rh128128t_cfg =3D {
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(st7735r_fops);
>  =

> -static struct drm_driver st7735r_driver =3D {
> +static const struct drm_driver st7735r_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &st7735r_fops,
>  	DRM_GEM_CMA_DRIVER_OPS_VMAP,
> diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200=
/tve200_drv.c
> index b5259cb1383f..07140e0b90a3 100644
> --- a/drivers/gpu/drm/tve200/tve200_drv.c
> +++ b/drivers/gpu/drm/tve200/tve200_drv.c
> @@ -137,7 +137,7 @@ static int tve200_modeset_init(struct drm_device *dev)
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(drm_fops);
>  =

> -static struct drm_driver tve200_drm_driver =3D {
> +static const struct drm_driver tve200_drm_driver =3D {
>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.ioctls =3D NULL,
>  	.fops =3D &drm_fops,
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 96d4317a2c1b..46df4d07bd7b 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -34,7 +34,7 @@ static int udl_usb_resume(struct usb_interface *interfa=
ce)
>  =

>  DEFINE_DRM_GEM_FOPS(udl_driver_fops);
>  =

> -static struct drm_driver driver =3D {
> +static const struct drm_driver driver =3D {
>  	.driver_features =3D DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
>  =

>  	/* GEM hooks */
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 9f7c26193831..2da0c1180bc6 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -194,7 +194,7 @@ static const struct drm_ioctl_desc v3d_drm_ioctls[] =
=3D {
>  	DRM_IOCTL_DEF_DRV(V3D_SUBMIT_CSD, v3d_submit_csd_ioctl, DRM_RENDER_ALLO=
W | DRM_AUTH),
>  };
>  =

> -static struct drm_driver v3d_drm_driver =3D {
> +static const struct drm_driver v3d_drm_driver =3D {
>  	.driver_features =3D (DRIVER_GEM |
>  			    DRIVER_RENDER |
>  			    DRIVER_SYNCOBJ),
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxv=
ideo/vbox_drv.c
> index cf2e3e6a2388..f3eac72cb46e 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -26,7 +26,7 @@ static int vbox_modeset =3D -1;
>  MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
>  module_param_named(modeset, vbox_modeset, int, 0400);
>  =

> -static struct drm_driver driver;
> +static const struct drm_driver driver;
>  =

>  static const struct pci_device_id pciidlist[] =3D {
>  	{ PCI_DEVICE(0x80ee, 0xbeef) },
> @@ -175,7 +175,7 @@ static struct pci_driver vbox_pci_driver =3D {
>  =

>  DEFINE_DRM_GEM_FOPS(vbox_fops);
>  =

> -static struct drm_driver driver =3D {
> +static const struct drm_driver driver =3D {
>  	.driver_features =3D
>  	    DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  =

> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_=
drv.c
> index fa54a6d1403d..3e9b7a4c30ce 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -415,7 +415,7 @@ static const struct drm_gem_object_funcs vgem_gem_obj=
ect_funcs =3D {
>  	.vm_ops =3D &vgem_gem_vm_ops,
>  };
>  =

> -static struct drm_driver vgem_driver =3D {
> +static const struct drm_driver vgem_driver =3D {
>  	.driver_features		=3D DRIVER_GEM | DRIVER_RENDER,
>  	.open				=3D vgem_open,
>  	.postclose			=3D vgem_postclose,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virti=
o/virtgpu_drv.c
> index 86330f1ade72..27f13bd29c13 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -37,7 +37,7 @@
>  =

>  #include "virtgpu_drv.h"
>  =

> -static struct drm_driver driver;
> +static const struct drm_driver driver;
>  =

>  static int virtio_gpu_modeset =3D -1;
>  =

> @@ -190,7 +190,7 @@ MODULE_AUTHOR("Alon Levy");
>  =

>  DEFINE_DRM_GEM_FOPS(virtio_gpu_driver_fops);
>  =

> -static struct drm_driver driver =3D {
> +static const struct drm_driver driver =3D {
>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIV=
ER_ATOMIC,
>  	.open =3D virtio_gpu_driver_open,
>  	.postclose =3D virtio_gpu_driver_postclose,
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 98ba844ae77d..8056b3d1ff6a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -78,7 +78,7 @@ static void vkms_atomic_commit_tail(struct drm_atomic_s=
tate *old_state)
>  	drm_atomic_helper_cleanup_planes(dev, old_state);
>  }
>  =

> -static struct drm_driver vkms_driver =3D {
> +static const struct drm_driver vkms_driver =3D {
>  	.driver_features	=3D DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
>  	.release		=3D vkms_release,
>  	.fops			=3D &vkms_driver_fops,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index 68206d0a1237..e66b252e3923 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1465,7 +1465,7 @@ static const struct file_operations vmwgfx_driver_f=
ops =3D {
>  	.get_unmapped_area =3D vmw_get_unmapped_area,
>  };
>  =

> -static struct drm_driver driver =3D {
> +static const struct drm_driver driver =3D {
>  	.driver_features =3D
>  	DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC,
>  	.ioctls =3D vmw_ioctls,
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xe=
n_drm_front.c
> index 98b6d2ba088a..30d9adf31c84 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -483,7 +483,7 @@ static const struct file_operations xen_drm_dev_fops =
=3D {
>  	.mmap           =3D xen_drm_front_gem_mmap,
>  };
>  =

> -static struct drm_driver xen_drm_driver =3D {
> +static const struct drm_driver xen_drm_driver =3D {
>  	.driver_features           =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATO=
MIC,
>  	.release                   =3D xen_drm_drv_release,
>  	.prime_handle_to_fd        =3D drm_gem_prime_handle_to_fd,
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/z=
ynqmp_dpsub.c
> index f3ffc3703a0e..0c1c50271a88 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -76,7 +76,7 @@ static const struct drm_mode_config_funcs zynqmp_dpsub_=
mode_config_funcs =3D {
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(zynqmp_dpsub_drm_fops);
>  =

> -static struct drm_driver zynqmp_dpsub_drm_driver =3D {
> +static const struct drm_driver zynqmp_dpsub_drm_driver =3D {
>  	.driver_features		=3D DRIVER_MODESET | DRIVER_GEM |
>  					  DRIVER_ATOMIC,
>  =

> diff --git a/drivers/gpu/drm/zte/zx_drm_drv.c b/drivers/gpu/drm/zte/zx_dr=
m_drv.c
> index 31014a451f8b..5506336594e2 100644
> --- a/drivers/gpu/drm/zte/zx_drm_drv.c
> +++ b/drivers/gpu/drm/zte/zx_drm_drv.c
> @@ -34,7 +34,7 @@ static const struct drm_mode_config_funcs zx_drm_mode_c=
onfig_funcs =3D {
>  =

>  DEFINE_DRM_GEM_CMA_FOPS(zx_drm_fops);
>  =

> -static struct drm_driver zx_drm_driver =3D {
> +static const struct drm_driver zx_drm_driver =3D {
>  	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	DRM_GEM_CMA_DRIVER_OPS,
>  	.fops =3D &zx_drm_fops,
> -- =

> 2.28.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
