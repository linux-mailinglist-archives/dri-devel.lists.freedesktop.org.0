Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAFE2341A7
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 10:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63716EA2E;
	Fri, 31 Jul 2020 08:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED0E6EA2C
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 08:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 831CBFB02;
 Fri, 31 Jul 2020 10:56:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0d_ZWHXTWEQQ; Fri, 31 Jul 2020 10:56:09 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id B020F4537D; Fri, 31 Jul 2020 10:56:08 +0200 (CEST)
Date: Fri, 31 Jul 2020 10:56:08 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v9 2/5] drm/imx: Add initial support for DCSS on iMX8MQ
Message-ID: <20200731085608.GA13342@bogon.m.sigxcpu.org>
References: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
 <20200731081836.3048-3-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731081836.3048-3-laurentiu.palcu@oss.nxp.com>
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 lukas@mntmn.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Fri, Jul 31, 2020 at 11:18:30AM +0300, Laurentiu Palcu wrote:
> From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> =

> This adds initial support for iMX8MQ's Display Controller Subsystem (DCSS=
).
> Some of its capabilities include:
>  * 4K@60fps;
>  * HDR10;
>  * one graphics and 2 video pipelines;
>  * on-the-fly decompression of compressed video and graphics;
> =

> The reference manual can be found here:
> https://www.nxp.com/webapp/Download?colCode=3DIMX8MDQLQRM
> =

> The current patch adds only basic functionality: one primary plane for
> graphics, linear, tiled and super-tiled buffers support (no graphics
> decompression yet), no HDR10 and no video planes.
> =

> Video planes support and HDR10 will be added in subsequent patches once
> per-plane de-gamma/CSC/gamma support is in.
> =

> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

I'm putting a

Acked-by: Guido G=FCnther <agx@sigxcpu.org>

since it fixes the build for me and it looks good to me from what i know
about DCSS.
Cheers,
 -- Guido

> ---
>  drivers/gpu/drm/imx/Kconfig            |   2 +
>  drivers/gpu/drm/imx/Makefile           |   1 +
>  drivers/gpu/drm/imx/dcss/Kconfig       |   9 +
>  drivers/gpu/drm/imx/dcss/Makefile      |   6 +
>  drivers/gpu/drm/imx/dcss/dcss-blkctl.c |  70 +++
>  drivers/gpu/drm/imx/dcss/dcss-crtc.c   | 219 +++++++
>  drivers/gpu/drm/imx/dcss/dcss-ctxld.c  | 424 +++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-dev.c    | 314 ++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-dev.h    | 177 ++++++
>  drivers/gpu/drm/imx/dcss/dcss-dpr.c    | 562 +++++++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-drv.c    | 138 +++++
>  drivers/gpu/drm/imx/dcss/dcss-dtg.c    | 409 ++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-kms.c    | 177 ++++++
>  drivers/gpu/drm/imx/dcss/dcss-kms.h    |  43 ++
>  drivers/gpu/drm/imx/dcss/dcss-plane.c  | 405 ++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-scaler.c | 826 +++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-ss.c     | 180 ++++++
>  17 files changed, 3962 insertions(+)
>  create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c
> =

> diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
> index 207bf7409dfb..6231048aa5aa 100644
> --- a/drivers/gpu/drm/imx/Kconfig
> +++ b/drivers/gpu/drm/imx/Kconfig
> @@ -39,3 +39,5 @@ config DRM_IMX_HDMI
>  	depends on DRM_IMX
>  	help
>  	  Choose this if you want to use HDMI on i.MX6.
> +
> +source "drivers/gpu/drm/imx/dcss/Kconfig"
> diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
> index 21cdcc2faabc..b644deffe948 100644
> --- a/drivers/gpu/drm/imx/Makefile
> +++ b/drivers/gpu/drm/imx/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_DRM_IMX_TVE) +=3D imx-tve.o
>  obj-$(CONFIG_DRM_IMX_LDB) +=3D imx-ldb.o
>  =

>  obj-$(CONFIG_DRM_IMX_HDMI) +=3D dw_hdmi-imx.o
> +obj-$(CONFIG_DRM_IMX_DCSS) +=3D dcss/
> diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/=
Kconfig
> new file mode 100644
> index 000000000000..69860de8861f
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/Kconfig
> @@ -0,0 +1,9 @@
> +config DRM_IMX_DCSS
> +	tristate "i.MX8MQ DCSS"
> +	select IMX_IRQSTEER
> +	select DRM_KMS_CMA_HELPER
> +	select VIDEOMODE_HELPERS
> +	depends on DRM && ARCH_MXC
> +	help
> +	  Choose this if you have a NXP i.MX8MQ based system and want to use the
> +	  Display Controller Subsystem. This option enables DCSS support.
> diff --git a/drivers/gpu/drm/imx/dcss/Makefile b/drivers/gpu/drm/imx/dcss=
/Makefile
> new file mode 100644
> index 000000000000..8c7c8da42792
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/Makefile
> @@ -0,0 +1,6 @@
> +imx-dcss-objs :=3D dcss-drv.o dcss-dev.o dcss-blkctl.o dcss-ctxld.o dcss=
-dtg.o \
> +				 dcss-ss.o dcss-dpr.o dcss-scaler.o dcss-kms.o dcss-crtc.o \
> +				 dcss-plane.o
> +
> +obj-$(CONFIG_DRM_IMX_DCSS) +=3D imx-dcss.o
> +
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-blkctl.c b/drivers/gpu/drm/imx=
/dcss/dcss-blkctl.c
> new file mode 100644
> index 000000000000..c9b54bb2692d
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/dcss-blkctl.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +
> +#include "dcss-dev.h"
> +
> +#define DCSS_BLKCTL_RESET_CTRL		0x00
> +#define   B_CLK_RESETN			BIT(0)
> +#define   APB_CLK_RESETN		BIT(1)
> +#define   P_CLK_RESETN			BIT(2)
> +#define   RTR_CLK_RESETN		BIT(4)
> +#define DCSS_BLKCTL_CONTROL0		0x10
> +#define   HDMI_MIPI_CLK_SEL		BIT(0)
> +#define   DISPMIX_REFCLK_SEL_POS	4
> +#define   DISPMIX_REFCLK_SEL_MASK	GENMASK(5, 4)
> +#define   DISPMIX_PIXCLK_SEL		BIT(8)
> +#define   HDMI_SRC_SECURE_EN		BIT(16)
> +
> +struct dcss_blkctl {
> +	struct dcss_dev *dcss;
> +	void __iomem *base_reg;
> +};
> +
> +void dcss_blkctl_cfg(struct dcss_blkctl *blkctl)
> +{
> +	if (blkctl->dcss->hdmi_output)
> +		dcss_writel(0, blkctl->base_reg + DCSS_BLKCTL_CONTROL0);
> +	else
> +		dcss_writel(DISPMIX_PIXCLK_SEL,
> +			    blkctl->base_reg + DCSS_BLKCTL_CONTROL0);
> +
> +	dcss_set(B_CLK_RESETN | APB_CLK_RESETN | P_CLK_RESETN | RTR_CLK_RESETN,
> +		 blkctl->base_reg + DCSS_BLKCTL_RESET_CTRL);
> +}
> +
> +int dcss_blkctl_init(struct dcss_dev *dcss, unsigned long blkctl_base)
> +{
> +	struct dcss_blkctl *blkctl;
> +
> +	blkctl =3D kzalloc(sizeof(*blkctl), GFP_KERNEL);
> +	if (!blkctl)
> +		return -ENOMEM;
> +
> +	blkctl->base_reg =3D ioremap(blkctl_base, SZ_4K);
> +	if (!blkctl->base_reg) {
> +		dev_err(dcss->dev, "unable to remap BLK CTRL base\n");
> +		kfree(blkctl);
> +		return -ENOMEM;
> +	}
> +
> +	dcss->blkctl =3D blkctl;
> +	blkctl->dcss =3D dcss;
> +
> +	dcss_blkctl_cfg(blkctl);
> +
> +	return 0;
> +}
> +
> +void dcss_blkctl_exit(struct dcss_blkctl *blkctl)
> +{
> +	if (blkctl->base_reg)
> +		iounmap(blkctl->base_reg);
> +
> +	kfree(blkctl);
> +}
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-crtc.c b/drivers/gpu/drm/imx/d=
css/dcss-crtc.c
> new file mode 100644
> index 000000000000..36abff0890b2
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_vblank.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "dcss-dev.h"
> +#include "dcss-kms.h"
> +
> +static int dcss_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct dcss_crtc *dcss_crtc =3D container_of(crtc, struct dcss_crtc,
> +						   base);
> +	struct dcss_dev *dcss =3D crtc->dev->dev_private;
> +
> +	dcss_dtg_vblank_irq_enable(dcss->dtg, true);
> +
> +	dcss_dtg_ctxld_kick_irq_enable(dcss->dtg, true);
> +
> +	enable_irq(dcss_crtc->irq);
> +
> +	return 0;
> +}
> +
> +static void dcss_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct dcss_crtc *dcss_crtc =3D container_of(crtc, struct dcss_crtc,
> +						   base);
> +	struct dcss_dev *dcss =3D dcss_crtc->base.dev->dev_private;
> +
> +	disable_irq_nosync(dcss_crtc->irq);
> +
> +	dcss_dtg_vblank_irq_enable(dcss->dtg, false);
> +
> +	if (dcss_crtc->disable_ctxld_kick_irq)
> +		dcss_dtg_ctxld_kick_irq_enable(dcss->dtg, false);
> +}
> +
> +static const struct drm_crtc_funcs dcss_crtc_funcs =3D {
> +	.set_config =3D drm_atomic_helper_set_config,
> +	.destroy =3D drm_crtc_cleanup,
> +	.page_flip =3D drm_atomic_helper_page_flip,
> +	.reset =3D drm_atomic_helper_crtc_reset,
> +	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank =3D dcss_enable_vblank,
> +	.disable_vblank =3D dcss_disable_vblank,
> +};
> +
> +static void dcss_crtc_atomic_begin(struct drm_crtc *crtc,
> +				   struct drm_crtc_state *old_crtc_state)
> +{
> +	drm_crtc_vblank_on(crtc);
> +}
> +
> +static void dcss_crtc_atomic_flush(struct drm_crtc *crtc,
> +				   struct drm_crtc_state *old_crtc_state)
> +{
> +	struct dcss_crtc *dcss_crtc =3D container_of(crtc, struct dcss_crtc,
> +						   base);
> +	struct dcss_dev *dcss =3D dcss_crtc->base.dev->dev_private;
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (crtc->state->event) {
> +		WARN_ON(drm_crtc_vblank_get(crtc));
> +		drm_crtc_arm_vblank_event(crtc, crtc->state->event);
> +		crtc->state->event =3D NULL;
> +	}
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +
> +	if (dcss_dtg_is_enabled(dcss->dtg))
> +		dcss_ctxld_enable(dcss->ctxld);
> +}
> +
> +static void dcss_crtc_atomic_enable(struct drm_crtc *crtc,
> +				    struct drm_crtc_state *old_crtc_state)
> +{
> +	struct dcss_crtc *dcss_crtc =3D container_of(crtc, struct dcss_crtc,
> +						   base);
> +	struct dcss_dev *dcss =3D dcss_crtc->base.dev->dev_private;
> +	struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> +	struct drm_display_mode *old_mode =3D &old_crtc_state->adjusted_mode;
> +	struct videomode vm;
> +
> +	drm_display_mode_to_videomode(mode, &vm);
> +
> +	pm_runtime_get_sync(dcss->dev);
> +
> +	vm.pixelclock =3D mode->crtc_clock * 1000;
> +
> +	dcss_ss_subsam_set(dcss->ss);
> +	dcss_dtg_css_set(dcss->dtg);
> +
> +	if (!drm_mode_equal(mode, old_mode) || !old_crtc_state->active) {
> +		dcss_dtg_sync_set(dcss->dtg, &vm);
> +		dcss_ss_sync_set(dcss->ss, &vm,
> +				 mode->flags & DRM_MODE_FLAG_PHSYNC,
> +				 mode->flags & DRM_MODE_FLAG_PVSYNC);
> +	}
> +
> +	dcss_enable_dtg_and_ss(dcss);
> +
> +	dcss_ctxld_enable(dcss->ctxld);
> +
> +	/* Allow CTXLD kick interrupt to be disabled when VBLANK is disabled. */
> +	dcss_crtc->disable_ctxld_kick_irq =3D true;
> +}
> +
> +static void dcss_crtc_atomic_disable(struct drm_crtc *crtc,
> +				     struct drm_crtc_state *old_crtc_state)
> +{
> +	struct dcss_crtc *dcss_crtc =3D container_of(crtc, struct dcss_crtc,
> +						   base);
> +	struct dcss_dev *dcss =3D dcss_crtc->base.dev->dev_private;
> +	struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> +	struct drm_display_mode *old_mode =3D &old_crtc_state->adjusted_mode;
> +
> +	drm_atomic_helper_disable_planes_on_crtc(old_crtc_state, false);
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (crtc->state->event) {
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		crtc->state->event =3D NULL;
> +	}
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +
> +	dcss_dtg_ctxld_kick_irq_enable(dcss->dtg, true);
> +
> +	reinit_completion(&dcss->disable_completion);
> +
> +	dcss_disable_dtg_and_ss(dcss);
> +
> +	dcss_ctxld_enable(dcss->ctxld);
> +
> +	if (!drm_mode_equal(mode, old_mode) || !crtc->state->active)
> +		if (!wait_for_completion_timeout(&dcss->disable_completion,
> +						 msecs_to_jiffies(100)))
> +			dev_err(dcss->dev, "Shutting off DTG timed out.\n");
> +
> +	/*
> +	 * Do not shut off CTXLD kick interrupt when shutting VBLANK off. It
> +	 * will be needed to commit the last changes, before going to suspend.
> +	 */
> +	dcss_crtc->disable_ctxld_kick_irq =3D false;
> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	pm_runtime_mark_last_busy(dcss->dev);
> +	pm_runtime_put_autosuspend(dcss->dev);
> +}
> +
> +static const struct drm_crtc_helper_funcs dcss_helper_funcs =3D {
> +	.atomic_begin =3D dcss_crtc_atomic_begin,
> +	.atomic_flush =3D dcss_crtc_atomic_flush,
> +	.atomic_enable =3D dcss_crtc_atomic_enable,
> +	.atomic_disable =3D dcss_crtc_atomic_disable,
> +};
> +
> +static irqreturn_t dcss_crtc_irq_handler(int irq, void *dev_id)
> +{
> +	struct dcss_crtc *dcss_crtc =3D dev_id;
> +	struct dcss_dev *dcss =3D dcss_crtc->base.dev->dev_private;
> +
> +	if (!dcss_dtg_vblank_irq_valid(dcss->dtg))
> +		return IRQ_NONE;
> +
> +	if (dcss_ctxld_is_flushed(dcss->ctxld))
> +		drm_crtc_handle_vblank(&dcss_crtc->base);
> +
> +	dcss_dtg_vblank_irq_clear(dcss->dtg);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +int dcss_crtc_init(struct dcss_crtc *crtc, struct drm_device *drm)
> +{
> +	struct dcss_dev *dcss =3D drm->dev_private;
> +	struct platform_device *pdev =3D to_platform_device(dcss->dev);
> +	int ret;
> +
> +	crtc->plane[0] =3D dcss_plane_init(drm, drm_crtc_mask(&crtc->base),
> +					 DRM_PLANE_TYPE_PRIMARY, 0);
> +	if (IS_ERR(crtc->plane[0]))
> +		return PTR_ERR(crtc->plane[0]);
> +
> +	crtc->base.port =3D dcss->of_port;
> +
> +	drm_crtc_helper_add(&crtc->base, &dcss_helper_funcs);
> +	ret =3D drm_crtc_init_with_planes(drm, &crtc->base, &crtc->plane[0]->ba=
se,
> +					NULL, &dcss_crtc_funcs, NULL);
> +	if (ret) {
> +		dev_err(dcss->dev, "failed to init crtc\n");
> +		return ret;
> +	}
> +
> +	crtc->irq =3D platform_get_irq_byname(pdev, "vblank");
> +	if (crtc->irq < 0)
> +		return crtc->irq;
> +
> +	ret =3D request_irq(crtc->irq, dcss_crtc_irq_handler,
> +			  0, "dcss_drm", crtc);
> +	if (ret) {
> +		dev_err(dcss->dev, "irq request failed with %d.\n", ret);
> +		return ret;
> +	}
> +
> +	disable_irq(crtc->irq);
> +
> +	return 0;
> +}
> +
> +void dcss_crtc_deinit(struct dcss_crtc *crtc, struct drm_device *drm)
> +{
> +	free_irq(crtc->irq, crtc);
> +}
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-ctxld.c b/drivers/gpu/drm/imx/=
dcss/dcss-ctxld.c
> new file mode 100644
> index 000000000000..3a84cb3209c4
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/dcss-ctxld.c
> @@ -0,0 +1,424 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "dcss-dev.h"
> +
> +#define DCSS_CTXLD_CONTROL_STATUS	0x0
> +#define   CTXLD_ENABLE			BIT(0)
> +#define   ARB_SEL			BIT(1)
> +#define   RD_ERR_EN			BIT(2)
> +#define   DB_COMP_EN			BIT(3)
> +#define   SB_HP_COMP_EN			BIT(4)
> +#define   SB_LP_COMP_EN			BIT(5)
> +#define   DB_PEND_SB_REC_EN		BIT(6)
> +#define   SB_PEND_DISP_ACTIVE_EN	BIT(7)
> +#define   AHB_ERR_EN			BIT(8)
> +#define   RD_ERR			BIT(16)
> +#define   DB_COMP			BIT(17)
> +#define   SB_HP_COMP			BIT(18)
> +#define   SB_LP_COMP			BIT(19)
> +#define   DB_PEND_SB_REC		BIT(20)
> +#define   SB_PEND_DISP_ACTIVE		BIT(21)
> +#define   AHB_ERR			BIT(22)
> +#define DCSS_CTXLD_DB_BASE_ADDR		0x10
> +#define DCSS_CTXLD_DB_COUNT		0x14
> +#define DCSS_CTXLD_SB_BASE_ADDR		0x18
> +#define DCSS_CTXLD_SB_COUNT		0x1C
> +#define   SB_HP_COUNT_POS		0
> +#define   SB_HP_COUNT_MASK		0xffff
> +#define   SB_LP_COUNT_POS		16
> +#define   SB_LP_COUNT_MASK		0xffff0000
> +#define DCSS_AHB_ERR_ADDR		0x20
> +
> +#define CTXLD_IRQ_COMPLETION		(DB_COMP | SB_HP_COMP | SB_LP_COMP)
> +#define CTXLD_IRQ_ERROR			(RD_ERR | DB_PEND_SB_REC | AHB_ERR)
> +
> +/* The following sizes are in context loader entries, 8 bytes each. */
> +#define CTXLD_DB_CTX_ENTRIES		1024	/* max 65536 */
> +#define CTXLD_SB_LP_CTX_ENTRIES		10240	/* max 65536 */
> +#define CTXLD_SB_HP_CTX_ENTRIES		20000	/* max 65536 */
> +#define CTXLD_SB_CTX_ENTRIES		(CTXLD_SB_LP_CTX_ENTRIES + \
> +					 CTXLD_SB_HP_CTX_ENTRIES)
> +
> +/* Sizes, in entries, of the DB, SB_HP and SB_LP context regions. */
> +static u16 dcss_ctxld_ctx_size[3] =3D {
> +	CTXLD_DB_CTX_ENTRIES,
> +	CTXLD_SB_HP_CTX_ENTRIES,
> +	CTXLD_SB_LP_CTX_ENTRIES
> +};
> +
> +/* this represents an entry in the context loader map */
> +struct dcss_ctxld_item {
> +	u32 val;
> +	u32 ofs;
> +};
> +
> +#define CTX_ITEM_SIZE			sizeof(struct dcss_ctxld_item)
> +
> +struct dcss_ctxld {
> +	struct device *dev;
> +	void __iomem *ctxld_reg;
> +	int irq;
> +	bool irq_en;
> +
> +	struct dcss_ctxld_item *db[2];
> +	struct dcss_ctxld_item *sb_hp[2];
> +	struct dcss_ctxld_item *sb_lp[2];
> +
> +	dma_addr_t db_paddr[2];
> +	dma_addr_t sb_paddr[2];
> +
> +	u16 ctx_size[2][3]; /* holds the sizes of DB, SB_HP and SB_LP ctx */
> +	u8 current_ctx;
> +
> +	bool in_use;
> +	bool armed;
> +
> +	spinlock_t lock; /* protects concurent access to private data */
> +};
> +
> +static irqreturn_t dcss_ctxld_irq_handler(int irq, void *data)
> +{
> +	struct dcss_ctxld *ctxld =3D data;
> +	struct dcss_dev *dcss =3D dcss_drv_dev_to_dcss(ctxld->dev);
> +	u32 irq_status;
> +
> +	irq_status =3D dcss_readl(ctxld->ctxld_reg + DCSS_CTXLD_CONTROL_STATUS);
> +
> +	if (irq_status & CTXLD_IRQ_COMPLETION &&
> +	    !(irq_status & CTXLD_ENABLE) && ctxld->in_use) {
> +		ctxld->in_use =3D false;
> +
> +		if (dcss && dcss->disable_callback)
> +			dcss->disable_callback(dcss);
> +	} else if (irq_status & CTXLD_IRQ_ERROR) {
> +		/*
> +		 * Except for throwing an error message and clearing the status
> +		 * register, there's not much we can do here.
> +		 */
> +		dev_err(ctxld->dev, "ctxld: error encountered: %08x\n",
> +			irq_status);
> +		dev_err(ctxld->dev, "ctxld: db=3D%d, sb_hp=3D%d, sb_lp=3D%d\n",
> +			ctxld->ctx_size[ctxld->current_ctx ^ 1][CTX_DB],
> +			ctxld->ctx_size[ctxld->current_ctx ^ 1][CTX_SB_HP],
> +			ctxld->ctx_size[ctxld->current_ctx ^ 1][CTX_SB_LP]);
> +	}
> +
> +	dcss_clr(irq_status & (CTXLD_IRQ_ERROR | CTXLD_IRQ_COMPLETION),
> +		 ctxld->ctxld_reg + DCSS_CTXLD_CONTROL_STATUS);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int dcss_ctxld_irq_config(struct dcss_ctxld *ctxld,
> +				 struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ctxld->irq =3D platform_get_irq_byname(pdev, "ctxld");
> +	if (ctxld->irq < 0)
> +		return ctxld->irq;
> +
> +	ret =3D request_irq(ctxld->irq, dcss_ctxld_irq_handler,
> +			  0, "dcss_ctxld", ctxld);
> +	if (ret) {
> +		dev_err(ctxld->dev, "ctxld: irq request failed.\n");
> +		return ret;
> +	}
> +
> +	ctxld->irq_en =3D true;
> +
> +	return 0;
> +}
> +
> +static void dcss_ctxld_hw_cfg(struct dcss_ctxld *ctxld)
> +{
> +	dcss_writel(RD_ERR_EN | SB_HP_COMP_EN |
> +		    DB_PEND_SB_REC_EN | AHB_ERR_EN | RD_ERR | AHB_ERR,
> +		    ctxld->ctxld_reg + DCSS_CTXLD_CONTROL_STATUS);
> +}
> +
> +static void dcss_ctxld_free_ctx(struct dcss_ctxld *ctxld)
> +{
> +	struct dcss_ctxld_item *ctx;
> +	int i;
> +
> +	for (i =3D 0; i < 2; i++) {
> +		if (ctxld->db[i]) {
> +			dma_free_coherent(ctxld->dev,
> +					  CTXLD_DB_CTX_ENTRIES * sizeof(*ctx),
> +					  ctxld->db[i], ctxld->db_paddr[i]);
> +			ctxld->db[i] =3D NULL;
> +			ctxld->db_paddr[i] =3D 0;
> +		}
> +
> +		if (ctxld->sb_hp[i]) {
> +			dma_free_coherent(ctxld->dev,
> +					  CTXLD_SB_CTX_ENTRIES * sizeof(*ctx),
> +					  ctxld->sb_hp[i], ctxld->sb_paddr[i]);
> +			ctxld->sb_hp[i] =3D NULL;
> +			ctxld->sb_paddr[i] =3D 0;
> +		}
> +	}
> +}
> +
> +static int dcss_ctxld_alloc_ctx(struct dcss_ctxld *ctxld)
> +{
> +	struct dcss_ctxld_item *ctx;
> +	int i;
> +
> +	for (i =3D 0; i < 2; i++) {
> +		ctx =3D dma_alloc_coherent(ctxld->dev,
> +					 CTXLD_DB_CTX_ENTRIES * sizeof(*ctx),
> +					 &ctxld->db_paddr[i], GFP_KERNEL);
> +		if (!ctx)
> +			return -ENOMEM;
> +
> +		ctxld->db[i] =3D ctx;
> +
> +		ctx =3D dma_alloc_coherent(ctxld->dev,
> +					 CTXLD_SB_CTX_ENTRIES * sizeof(*ctx),
> +					 &ctxld->sb_paddr[i], GFP_KERNEL);
> +		if (!ctx)
> +			return -ENOMEM;
> +
> +		ctxld->sb_hp[i] =3D ctx;
> +		ctxld->sb_lp[i] =3D ctx + CTXLD_SB_HP_CTX_ENTRIES;
> +	}
> +
> +	return 0;
> +}
> +
> +int dcss_ctxld_init(struct dcss_dev *dcss, unsigned long ctxld_base)
> +{
> +	struct dcss_ctxld *ctxld;
> +	int ret;
> +
> +	ctxld =3D kzalloc(sizeof(*ctxld), GFP_KERNEL);
> +	if (!ctxld)
> +		return -ENOMEM;
> +
> +	dcss->ctxld =3D ctxld;
> +	ctxld->dev =3D dcss->dev;
> +
> +	spin_lock_init(&ctxld->lock);
> +
> +	ret =3D dcss_ctxld_alloc_ctx(ctxld);
> +	if (ret) {
> +		dev_err(dcss->dev, "ctxld: cannot allocate context memory.\n");
> +		goto err;
> +	}
> +
> +	ctxld->ctxld_reg =3D ioremap(ctxld_base, SZ_4K);
> +	if (!ctxld->ctxld_reg) {
> +		dev_err(dcss->dev, "ctxld: unable to remap ctxld base\n");
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +
> +	ret =3D dcss_ctxld_irq_config(ctxld, to_platform_device(dcss->dev));
> +	if (ret)
> +		goto err_irq;
> +
> +	dcss_ctxld_hw_cfg(ctxld);
> +
> +	return 0;
> +
> +err_irq:
> +	iounmap(ctxld->ctxld_reg);
> +
> +err:
> +	dcss_ctxld_free_ctx(ctxld);
> +	kfree(ctxld);
> +
> +	return ret;
> +}
> +
> +void dcss_ctxld_exit(struct dcss_ctxld *ctxld)
> +{
> +	free_irq(ctxld->irq, ctxld);
> +
> +	if (ctxld->ctxld_reg)
> +		iounmap(ctxld->ctxld_reg);
> +
> +	dcss_ctxld_free_ctx(ctxld);
> +	kfree(ctxld);
> +}
> +
> +static int dcss_ctxld_enable_locked(struct dcss_ctxld *ctxld)
> +{
> +	int curr_ctx =3D ctxld->current_ctx;
> +	u32 db_base, sb_base, sb_count;
> +	u32 sb_hp_cnt, sb_lp_cnt, db_cnt;
> +	struct dcss_dev *dcss =3D dcss_drv_dev_to_dcss(ctxld->dev);
> +
> +	if (!dcss)
> +		return 0;
> +
> +	dcss_dpr_write_sysctrl(dcss->dpr);
> +
> +	dcss_scaler_write_sclctrl(dcss->scaler);
> +
> +	sb_hp_cnt =3D ctxld->ctx_size[curr_ctx][CTX_SB_HP];
> +	sb_lp_cnt =3D ctxld->ctx_size[curr_ctx][CTX_SB_LP];
> +	db_cnt =3D ctxld->ctx_size[curr_ctx][CTX_DB];
> +
> +	/* make sure SB_LP context area comes after SB_HP */
> +	if (sb_lp_cnt &&
> +	    ctxld->sb_lp[curr_ctx] !=3D ctxld->sb_hp[curr_ctx] + sb_hp_cnt) {
> +		struct dcss_ctxld_item *sb_lp_adjusted;
> +
> +		sb_lp_adjusted =3D ctxld->sb_hp[curr_ctx] + sb_hp_cnt;
> +
> +		memcpy(sb_lp_adjusted, ctxld->sb_lp[curr_ctx],
> +		       sb_lp_cnt * CTX_ITEM_SIZE);
> +	}
> +
> +	db_base =3D db_cnt ? ctxld->db_paddr[curr_ctx] : 0;
> +
> +	dcss_writel(db_base, ctxld->ctxld_reg + DCSS_CTXLD_DB_BASE_ADDR);
> +	dcss_writel(db_cnt, ctxld->ctxld_reg + DCSS_CTXLD_DB_COUNT);
> +
> +	if (sb_hp_cnt)
> +		sb_count =3D ((sb_hp_cnt << SB_HP_COUNT_POS) & SB_HP_COUNT_MASK) |
> +			   ((sb_lp_cnt << SB_LP_COUNT_POS) & SB_LP_COUNT_MASK);
> +	else
> +		sb_count =3D (sb_lp_cnt << SB_HP_COUNT_POS) & SB_HP_COUNT_MASK;
> +
> +	sb_base =3D sb_count ? ctxld->sb_paddr[curr_ctx] : 0;
> +
> +	dcss_writel(sb_base, ctxld->ctxld_reg + DCSS_CTXLD_SB_BASE_ADDR);
> +	dcss_writel(sb_count, ctxld->ctxld_reg + DCSS_CTXLD_SB_COUNT);
> +
> +	/* enable the context loader */
> +	dcss_set(CTXLD_ENABLE, ctxld->ctxld_reg + DCSS_CTXLD_CONTROL_STATUS);
> +
> +	ctxld->in_use =3D true;
> +
> +	/*
> +	 * Toggle the current context to the alternate one so that any updates
> +	 * in the modules' settings take place there.
> +	 */
> +	ctxld->current_ctx ^=3D 1;
> +
> +	ctxld->ctx_size[ctxld->current_ctx][CTX_DB] =3D 0;
> +	ctxld->ctx_size[ctxld->current_ctx][CTX_SB_HP] =3D 0;
> +	ctxld->ctx_size[ctxld->current_ctx][CTX_SB_LP] =3D 0;
> +
> +	return 0;
> +}
> +
> +int dcss_ctxld_enable(struct dcss_ctxld *ctxld)
> +{
> +	spin_lock_irq(&ctxld->lock);
> +	ctxld->armed =3D true;
> +	spin_unlock_irq(&ctxld->lock);
> +
> +	return 0;
> +}
> +
> +void dcss_ctxld_kick(struct dcss_ctxld *ctxld)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ctxld->lock, flags);
> +	if (ctxld->armed && !ctxld->in_use) {
> +		ctxld->armed =3D false;
> +		dcss_ctxld_enable_locked(ctxld);
> +	}
> +	spin_unlock_irqrestore(&ctxld->lock, flags);
> +}
> +
> +void dcss_ctxld_write_irqsafe(struct dcss_ctxld *ctxld, u32 ctx_id, u32 =
val,
> +			      u32 reg_ofs)
> +{
> +	int curr_ctx =3D ctxld->current_ctx;
> +	struct dcss_ctxld_item *ctx[] =3D {
> +		[CTX_DB] =3D ctxld->db[curr_ctx],
> +		[CTX_SB_HP] =3D ctxld->sb_hp[curr_ctx],
> +		[CTX_SB_LP] =3D ctxld->sb_lp[curr_ctx]
> +	};
> +	int item_idx =3D ctxld->ctx_size[curr_ctx][ctx_id];
> +
> +	if (item_idx + 1 > dcss_ctxld_ctx_size[ctx_id]) {
> +		WARN_ON(1);
> +		return;
> +	}
> +
> +	ctx[ctx_id][item_idx].val =3D val;
> +	ctx[ctx_id][item_idx].ofs =3D reg_ofs;
> +	ctxld->ctx_size[curr_ctx][ctx_id] +=3D 1;
> +}
> +
> +void dcss_ctxld_write(struct dcss_ctxld *ctxld, u32 ctx_id,
> +		      u32 val, u32 reg_ofs)
> +{
> +	spin_lock_irq(&ctxld->lock);
> +	dcss_ctxld_write_irqsafe(ctxld, ctx_id, val, reg_ofs);
> +	spin_unlock_irq(&ctxld->lock);
> +}
> +
> +bool dcss_ctxld_is_flushed(struct dcss_ctxld *ctxld)
> +{
> +	return ctxld->ctx_size[ctxld->current_ctx][CTX_DB] =3D=3D 0 &&
> +		ctxld->ctx_size[ctxld->current_ctx][CTX_SB_HP] =3D=3D 0 &&
> +		ctxld->ctx_size[ctxld->current_ctx][CTX_SB_LP] =3D=3D 0;
> +}
> +
> +int dcss_ctxld_resume(struct dcss_ctxld *ctxld)
> +{
> +	dcss_ctxld_hw_cfg(ctxld);
> +
> +	if (!ctxld->irq_en) {
> +		enable_irq(ctxld->irq);
> +		ctxld->irq_en =3D true;
> +	}
> +
> +	return 0;
> +}
> +
> +int dcss_ctxld_suspend(struct dcss_ctxld *ctxld)
> +{
> +	int ret =3D 0;
> +	unsigned long timeout =3D jiffies + msecs_to_jiffies(500);
> +
> +	if (!dcss_ctxld_is_flushed(ctxld)) {
> +		dcss_ctxld_kick(ctxld);
> +
> +		while (!time_after(jiffies, timeout) && ctxld->in_use)
> +			msleep(20);
> +
> +		if (time_after(jiffies, timeout))
> +			return -ETIMEDOUT;
> +	}
> +
> +	spin_lock_irq(&ctxld->lock);
> +
> +	if (ctxld->irq_en) {
> +		disable_irq_nosync(ctxld->irq);
> +		ctxld->irq_en =3D false;
> +	}
> +
> +	/* reset context region and sizes */
> +	ctxld->current_ctx =3D 0;
> +	ctxld->ctx_size[0][CTX_DB] =3D 0;
> +	ctxld->ctx_size[0][CTX_SB_HP] =3D 0;
> +	ctxld->ctx_size[0][CTX_SB_LP] =3D 0;
> +
> +	spin_unlock_irq(&ctxld->lock);
> +
> +	return ret;
> +}
> +
> +void dcss_ctxld_assert_locked(struct dcss_ctxld *ctxld)
> +{
> +	lockdep_assert_held(&ctxld->lock);
> +}
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dc=
ss/dcss-dev.c
> new file mode 100644
> index 000000000000..83a4840435cf
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> @@ -0,0 +1,314 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <drm/drm_modeset_helper.h>
> +
> +#include "dcss-dev.h"
> +
> +static void dcss_clocks_enable(struct dcss_dev *dcss)
> +{
> +	clk_prepare_enable(dcss->axi_clk);
> +	clk_prepare_enable(dcss->apb_clk);
> +	clk_prepare_enable(dcss->rtrm_clk);
> +	clk_prepare_enable(dcss->dtrc_clk);
> +	clk_prepare_enable(dcss->pix_clk);
> +}
> +
> +static void dcss_clocks_disable(struct dcss_dev *dcss)
> +{
> +	clk_disable_unprepare(dcss->pix_clk);
> +	clk_disable_unprepare(dcss->dtrc_clk);
> +	clk_disable_unprepare(dcss->rtrm_clk);
> +	clk_disable_unprepare(dcss->apb_clk);
> +	clk_disable_unprepare(dcss->axi_clk);
> +}
> +
> +static void dcss_disable_dtg_and_ss_cb(void *data)
> +{
> +	struct dcss_dev *dcss =3D data;
> +
> +	dcss->disable_callback =3D NULL;
> +
> +	dcss_ss_shutoff(dcss->ss);
> +	dcss_dtg_shutoff(dcss->dtg);
> +
> +	complete(&dcss->disable_completion);
> +}
> +
> +void dcss_disable_dtg_and_ss(struct dcss_dev *dcss)
> +{
> +	dcss->disable_callback =3D dcss_disable_dtg_and_ss_cb;
> +}
> +
> +void dcss_enable_dtg_and_ss(struct dcss_dev *dcss)
> +{
> +	if (dcss->disable_callback)
> +		dcss->disable_callback =3D NULL;
> +
> +	dcss_dtg_enable(dcss->dtg);
> +	dcss_ss_enable(dcss->ss);
> +}
> +
> +static int dcss_submodules_init(struct dcss_dev *dcss)
> +{
> +	int ret =3D 0;
> +	u32 base_addr =3D dcss->start_addr;
> +	const struct dcss_type_data *devtype =3D dcss->devtype;
> +
> +	dcss_clocks_enable(dcss);
> +
> +	ret =3D dcss_blkctl_init(dcss, base_addr + devtype->blkctl_ofs);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dcss_ctxld_init(dcss, base_addr + devtype->ctxld_ofs);
> +	if (ret)
> +		goto ctxld_err;
> +
> +	ret =3D dcss_dtg_init(dcss, base_addr + devtype->dtg_ofs);
> +	if (ret)
> +		goto dtg_err;
> +
> +	ret =3D dcss_ss_init(dcss, base_addr + devtype->ss_ofs);
> +	if (ret)
> +		goto ss_err;
> +
> +	ret =3D dcss_dpr_init(dcss, base_addr + devtype->dpr_ofs);
> +	if (ret)
> +		goto dpr_err;
> +
> +	ret =3D dcss_scaler_init(dcss, base_addr + devtype->scaler_ofs);
> +	if (ret)
> +		goto scaler_err;
> +
> +	dcss_clocks_disable(dcss);
> +
> +	return 0;
> +
> +scaler_err:
> +	dcss_dpr_exit(dcss->dpr);
> +
> +dpr_err:
> +	dcss_ss_exit(dcss->ss);
> +
> +ss_err:
> +	dcss_dtg_exit(dcss->dtg);
> +
> +dtg_err:
> +	dcss_ctxld_exit(dcss->ctxld);
> +
> +ctxld_err:
> +	dcss_blkctl_exit(dcss->blkctl);
> +
> +	dcss_clocks_disable(dcss);
> +
> +	return ret;
> +}
> +
> +static void dcss_submodules_stop(struct dcss_dev *dcss)
> +{
> +	dcss_clocks_enable(dcss);
> +	dcss_scaler_exit(dcss->scaler);
> +	dcss_dpr_exit(dcss->dpr);
> +	dcss_ss_exit(dcss->ss);
> +	dcss_dtg_exit(dcss->dtg);
> +	dcss_ctxld_exit(dcss->ctxld);
> +	dcss_blkctl_exit(dcss->blkctl);
> +	dcss_clocks_disable(dcss);
> +}
> +
> +static int dcss_clks_init(struct dcss_dev *dcss)
> +{
> +	int i;
> +	struct {
> +		const char *id;
> +		struct clk **clk;
> +	} clks[] =3D {
> +		{"apb",   &dcss->apb_clk},
> +		{"axi",   &dcss->axi_clk},
> +		{"pix",   &dcss->pix_clk},
> +		{"rtrm",  &dcss->rtrm_clk},
> +		{"dtrc",  &dcss->dtrc_clk},
> +	};
> +
> +	for (i =3D 0; i < ARRAY_SIZE(clks); i++) {
> +		*clks[i].clk =3D devm_clk_get(dcss->dev, clks[i].id);
> +		if (IS_ERR(*clks[i].clk)) {
> +			dev_err(dcss->dev, "failed to get %s clock\n",
> +				clks[i].id);
> +			return PTR_ERR(*clks[i].clk);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void dcss_clks_release(struct dcss_dev *dcss)
> +{
> +	devm_clk_put(dcss->dev, dcss->dtrc_clk);
> +	devm_clk_put(dcss->dev, dcss->rtrm_clk);
> +	devm_clk_put(dcss->dev, dcss->pix_clk);
> +	devm_clk_put(dcss->dev, dcss->axi_clk);
> +	devm_clk_put(dcss->dev, dcss->apb_clk);
> +}
> +
> +struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
> +{
> +	struct platform_device *pdev =3D to_platform_device(dev);
> +	int ret;
> +	struct resource *res;
> +	struct dcss_dev *dcss;
> +	const struct dcss_type_data *devtype;
> +
> +	devtype =3D of_device_get_match_data(dev);
> +	if (!devtype) {
> +		dev_err(dev, "no device match found\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(dev, "cannot get memory resource\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	dcss =3D kzalloc(sizeof(*dcss), GFP_KERNEL);
> +	if (!dcss)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dcss->dev =3D dev;
> +	dcss->devtype =3D devtype;
> +	dcss->hdmi_output =3D hdmi_output;
> +
> +	ret =3D dcss_clks_init(dcss);
> +	if (ret) {
> +		dev_err(dev, "clocks initialization failed\n");
> +		goto err;
> +	}
> +
> +	dcss->of_port =3D of_graph_get_port_by_id(dev->of_node, 0);
> +	if (!dcss->of_port) {
> +		dev_err(dev, "no port@0 node in %s\n", dev->of_node->full_name);
> +		ret =3D -ENODEV;
> +		goto clks_err;
> +	}
> +
> +	dcss->start_addr =3D res->start;
> +
> +	ret =3D dcss_submodules_init(dcss);
> +	if (ret) {
> +		dev_err(dev, "submodules initialization failed\n");
> +		goto clks_err;
> +	}
> +
> +	init_completion(&dcss->disable_completion);
> +
> +	pm_runtime_set_autosuspend_delay(dev, 100);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_allow(dev);
> +	pm_runtime_enable(dev);
> +
> +	return dcss;
> +
> +clks_err:
> +	dcss_clks_release(dcss);
> +
> +err:
> +	kfree(dcss);
> +
> +	return ERR_PTR(ret);
> +}
> +
> +void dcss_dev_destroy(struct dcss_dev *dcss)
> +{
> +	if (!pm_runtime_suspended(dcss->dev)) {
> +		dcss_ctxld_suspend(dcss->ctxld);
> +		dcss_clocks_disable(dcss);
> +	}
> +
> +	pm_runtime_disable(dcss->dev);
> +
> +	dcss_submodules_stop(dcss);
> +
> +	dcss_clks_release(dcss);
> +
> +	kfree(dcss);
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +int dcss_dev_suspend(struct device *dev)
> +{
> +	struct dcss_dev *dcss =3D dcss_drv_dev_to_dcss(dev);
> +	int ret;
> +
> +	drm_mode_config_helper_suspend(dcss_drv_dev_to_drm(dev));
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	ret =3D dcss_ctxld_suspend(dcss->ctxld);
> +	if (ret)
> +		return ret;
> +
> +	dcss_clocks_disable(dcss);
> +
> +	return 0;
> +}
> +
> +int dcss_dev_resume(struct device *dev)
> +{
> +	struct dcss_dev *dcss =3D dcss_drv_dev_to_dcss(dev);
> +
> +	if (pm_runtime_suspended(dev)) {
> +		drm_mode_config_helper_resume(dcss_drv_dev_to_drm(dev));
> +		return 0;
> +	}
> +
> +	dcss_clocks_enable(dcss);
> +
> +	dcss_blkctl_cfg(dcss->blkctl);
> +
> +	dcss_ctxld_resume(dcss->ctxld);
> +
> +	drm_mode_config_helper_resume(dcss_drv_dev_to_drm(dev));
> +
> +	return 0;
> +}
> +#endif /* CONFIG_PM_SLEEP */
> +
> +#ifdef CONFIG_PM
> +int dcss_dev_runtime_suspend(struct device *dev)
> +{
> +	struct dcss_dev *dcss =3D dcss_drv_dev_to_dcss(dev);
> +	int ret;
> +
> +	ret =3D dcss_ctxld_suspend(dcss->ctxld);
> +	if (ret)
> +		return ret;
> +
> +	dcss_clocks_disable(dcss);
> +
> +	return 0;
> +}
> +
> +int dcss_dev_runtime_resume(struct device *dev)
> +{
> +	struct dcss_dev *dcss =3D dcss_drv_dev_to_dcss(dev);
> +
> +	dcss_clocks_enable(dcss);
> +
> +	dcss_blkctl_cfg(dcss->blkctl);
> +
> +	dcss_ctxld_resume(dcss->ctxld);
> +
> +	return 0;
> +}
> +#endif /* CONFIG_PM */
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.h b/drivers/gpu/drm/imx/dc=
ss/dcss-dev.h
> new file mode 100644
> index 000000000000..c642ae17837f
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.h
> @@ -0,0 +1,177 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#ifndef __DCSS_PRV_H__
> +#define __DCSS_PRV_H__
> +
> +#include <drm/drm_fourcc.h>
> +#include <linux/io.h>
> +#include <video/videomode.h>
> +
> +#define SET			0x04
> +#define CLR			0x08
> +#define TGL			0x0C
> +
> +#define dcss_writel(v, c)	writel((v), (c))
> +#define dcss_readl(c)		readl(c)
> +#define dcss_set(v, c)		writel((v), (c) + SET)
> +#define dcss_clr(v, c)		writel((v), (c) + CLR)
> +#define dcss_toggle(v, c)	writel((v), (c) + TGL)
> +
> +static inline void dcss_update(u32 v, u32 m, void __iomem *c)
> +{
> +	writel((readl(c) & ~(m)) | (v), (c));
> +}
> +
> +#define DCSS_DBG_REG(reg)	{.name =3D #reg, .ofs =3D reg}
> +
> +enum {
> +	DCSS_IMX8MQ =3D 0,
> +};
> +
> +struct dcss_type_data {
> +	const char *name;
> +	u32 blkctl_ofs;
> +	u32 ctxld_ofs;
> +	u32 rdsrc_ofs;
> +	u32 wrscl_ofs;
> +	u32 dtg_ofs;
> +	u32 scaler_ofs;
> +	u32 ss_ofs;
> +	u32 dpr_ofs;
> +	u32 dtrc_ofs;
> +	u32 dec400d_ofs;
> +	u32 hdr10_ofs;
> +};
> +
> +struct dcss_debug_reg {
> +	char *name;
> +	u32 ofs;
> +};
> +
> +enum dcss_ctxld_ctx_type {
> +	CTX_DB,
> +	CTX_SB_HP, /* high-priority */
> +	CTX_SB_LP, /* low-priority  */
> +};
> +
> +struct dcss_dev {
> +	struct device *dev;
> +	const struct dcss_type_data *devtype;
> +	struct device_node *of_port;
> +
> +	u32 start_addr;
> +
> +	struct dcss_blkctl *blkctl;
> +	struct dcss_ctxld *ctxld;
> +	struct dcss_dpr *dpr;
> +	struct dcss_dtg *dtg;
> +	struct dcss_ss *ss;
> +	struct dcss_hdr10 *hdr10;
> +	struct dcss_scaler *scaler;
> +	struct dcss_dtrc *dtrc;
> +	struct dcss_dec400d *dec400d;
> +	struct dcss_wrscl *wrscl;
> +	struct dcss_rdsrc *rdsrc;
> +
> +	struct clk *apb_clk;
> +	struct clk *axi_clk;
> +	struct clk *pix_clk;
> +	struct clk *rtrm_clk;
> +	struct clk *dtrc_clk;
> +	struct clk *pll_src_clk;
> +	struct clk *pll_phy_ref_clk;
> +
> +	bool hdmi_output;
> +
> +	void (*disable_callback)(void *data);
> +	struct completion disable_completion;
> +};
> +
> +struct dcss_dev *dcss_drv_dev_to_dcss(struct device *dev);
> +struct drm_device *dcss_drv_dev_to_drm(struct device *dev);
> +struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output);
> +void dcss_dev_destroy(struct dcss_dev *dcss);
> +int dcss_dev_runtime_suspend(struct device *dev);
> +int dcss_dev_runtime_resume(struct device *dev);
> +int dcss_dev_suspend(struct device *dev);
> +int dcss_dev_resume(struct device *dev);
> +void dcss_enable_dtg_and_ss(struct dcss_dev *dcss);
> +void dcss_disable_dtg_and_ss(struct dcss_dev *dcss);
> +
> +/* BLKCTL */
> +int dcss_blkctl_init(struct dcss_dev *dcss, unsigned long blkctl_base);
> +void dcss_blkctl_cfg(struct dcss_blkctl *blkctl);
> +void dcss_blkctl_exit(struct dcss_blkctl *blkctl);
> +
> +/* CTXLD */
> +int dcss_ctxld_init(struct dcss_dev *dcss, unsigned long ctxld_base);
> +void dcss_ctxld_exit(struct dcss_ctxld *ctxld);
> +void dcss_ctxld_write(struct dcss_ctxld *ctxld, u32 ctx_id,
> +		      u32 val, u32 reg_idx);
> +int dcss_ctxld_resume(struct dcss_ctxld *dcss_ctxld);
> +int dcss_ctxld_suspend(struct dcss_ctxld *dcss_ctxld);
> +void dcss_ctxld_write_irqsafe(struct dcss_ctxld *ctlxd, u32 ctx_id, u32 =
val,
> +			      u32 reg_ofs);
> +void dcss_ctxld_kick(struct dcss_ctxld *ctxld);
> +bool dcss_ctxld_is_flushed(struct dcss_ctxld *ctxld);
> +int dcss_ctxld_enable(struct dcss_ctxld *ctxld);
> +void dcss_ctxld_register_completion(struct dcss_ctxld *ctxld,
> +				    struct completion *dis_completion);
> +void dcss_ctxld_assert_locked(struct dcss_ctxld *ctxld);
> +
> +/* DPR */
> +int dcss_dpr_init(struct dcss_dev *dcss, unsigned long dpr_base);
> +void dcss_dpr_exit(struct dcss_dpr *dpr);
> +void dcss_dpr_write_sysctrl(struct dcss_dpr *dpr);
> +void dcss_dpr_set_res(struct dcss_dpr *dpr, int ch_num, u32 xres, u32 yr=
es);
> +void dcss_dpr_addr_set(struct dcss_dpr *dpr, int ch_num, u32 luma_base_a=
ddr,
> +		       u32 chroma_base_addr, u16 pitch);
> +void dcss_dpr_enable(struct dcss_dpr *dpr, int ch_num, bool en);
> +void dcss_dpr_format_set(struct dcss_dpr *dpr, int ch_num,
> +			 const struct drm_format_info *format, u64 modifier);
> +void dcss_dpr_set_rotation(struct dcss_dpr *dpr, int ch_num, u32 rotatio=
n);
> +
> +/* DTG */
> +int dcss_dtg_init(struct dcss_dev *dcss, unsigned long dtg_base);
> +void dcss_dtg_exit(struct dcss_dtg *dtg);
> +bool dcss_dtg_vblank_irq_valid(struct dcss_dtg *dtg);
> +void dcss_dtg_vblank_irq_enable(struct dcss_dtg *dtg, bool en);
> +void dcss_dtg_vblank_irq_clear(struct dcss_dtg *dtg);
> +void dcss_dtg_sync_set(struct dcss_dtg *dtg, struct videomode *vm);
> +void dcss_dtg_css_set(struct dcss_dtg *dtg);
> +void dcss_dtg_enable(struct dcss_dtg *dtg);
> +void dcss_dtg_shutoff(struct dcss_dtg *dtg);
> +bool dcss_dtg_is_enabled(struct dcss_dtg *dtg);
> +void dcss_dtg_ctxld_kick_irq_enable(struct dcss_dtg *dtg, bool en);
> +bool dcss_dtg_global_alpha_changed(struct dcss_dtg *dtg, int ch_num, int=
 alpha);
> +void dcss_dtg_plane_alpha_set(struct dcss_dtg *dtg, int ch_num,
> +			      const struct drm_format_info *format, int alpha);
> +void dcss_dtg_plane_pos_set(struct dcss_dtg *dtg, int ch_num,
> +			    int px, int py, int pw, int ph);
> +void dcss_dtg_ch_enable(struct dcss_dtg *dtg, int ch_num, bool en);
> +
> +/* SUBSAM */
> +int dcss_ss_init(struct dcss_dev *dcss, unsigned long subsam_base);
> +void dcss_ss_exit(struct dcss_ss *ss);
> +void dcss_ss_enable(struct dcss_ss *ss);
> +void dcss_ss_shutoff(struct dcss_ss *ss);
> +void dcss_ss_subsam_set(struct dcss_ss *ss);
> +void dcss_ss_sync_set(struct dcss_ss *ss, struct videomode *vm,
> +		      bool phsync, bool pvsync);
> +
> +/* SCALER */
> +int dcss_scaler_init(struct dcss_dev *dcss, unsigned long scaler_base);
> +void dcss_scaler_exit(struct dcss_scaler *scl);
> +void dcss_scaler_setup(struct dcss_scaler *scl, int ch_num,
> +		       const struct drm_format_info *format,
> +		       int src_xres, int src_yres, int dst_xres, int dst_yres,
> +		       u32 vrefresh_hz);
> +void dcss_scaler_ch_enable(struct dcss_scaler *scl, int ch_num, bool en);
> +int dcss_scaler_get_min_max_ratios(struct dcss_scaler *scl, int ch_num,
> +				   int *min, int *max);
> +void dcss_scaler_write_sclctrl(struct dcss_scaler *scl);
> +
> +#endif /* __DCSS_PRV_H__ */
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dpr.c b/drivers/gpu/drm/imx/dc=
ss/dcss-dpr.c
> new file mode 100644
> index 000000000000..df9dab949bf2
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dpr.c
> @@ -0,0 +1,562 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/slab.h>
> +
> +#include "dcss-dev.h"
> +
> +#define DCSS_DPR_SYSTEM_CTRL0			0x000
> +#define   RUN_EN				BIT(0)
> +#define   SOFT_RESET				BIT(1)
> +#define   REPEAT_EN				BIT(2)
> +#define   SHADOW_LOAD_EN			BIT(3)
> +#define   SW_SHADOW_LOAD_SEL			BIT(4)
> +#define   BCMD2AXI_MSTR_ID_CTRL			BIT(16)
> +#define DCSS_DPR_IRQ_MASK			0x020
> +#define DCSS_DPR_IRQ_MASK_STATUS		0x030
> +#define DCSS_DPR_IRQ_NONMASK_STATUS		0x040
> +#define   IRQ_DPR_CTRL_DONE			BIT(0)
> +#define   IRQ_DPR_RUN				BIT(1)
> +#define   IRQ_DPR_SHADOW_LOADED			BIT(2)
> +#define   IRQ_AXI_READ_ERR			BIT(3)
> +#define   DPR2RTR_YRGB_FIFO_OVFL		BIT(4)
> +#define   DPR2RTR_UV_FIFO_OVFL			BIT(5)
> +#define   DPR2RTR_FIFO_LD_BUF_RDY_YRGB_ERR	BIT(6)
> +#define   DPR2RTR_FIFO_LD_BUF_RDY_UV_ERR	BIT(7)
> +#define DCSS_DPR_MODE_CTRL0			0x050
> +#define   RTR_3BUF_EN				BIT(0)
> +#define   RTR_4LINE_BUF_EN			BIT(1)
> +#define   TILE_TYPE_POS				2
> +#define   TILE_TYPE_MASK			GENMASK(4, 2)
> +#define   YUV_EN				BIT(6)
> +#define   COMP_2PLANE_EN			BIT(7)
> +#define   PIX_SIZE_POS				8
> +#define   PIX_SIZE_MASK				GENMASK(9, 8)
> +#define   PIX_LUMA_UV_SWAP			BIT(10)
> +#define   PIX_UV_SWAP				BIT(11)
> +#define   B_COMP_SEL_POS			12
> +#define   B_COMP_SEL_MASK			GENMASK(13, 12)
> +#define   G_COMP_SEL_POS			14
> +#define   G_COMP_SEL_MASK			GENMASK(15, 14)
> +#define   R_COMP_SEL_POS			16
> +#define   R_COMP_SEL_MASK			GENMASK(17, 16)
> +#define   A_COMP_SEL_POS			18
> +#define   A_COMP_SEL_MASK			GENMASK(19, 18)
> +#define DCSS_DPR_FRAME_CTRL0			0x070
> +#define   HFLIP_EN				BIT(0)
> +#define   VFLIP_EN				BIT(1)
> +#define   ROT_ENC_POS				2
> +#define   ROT_ENC_MASK				GENMASK(3, 2)
> +#define   ROT_FLIP_ORDER_EN			BIT(4)
> +#define   PITCH_POS				16
> +#define   PITCH_MASK				GENMASK(31, 16)
> +#define DCSS_DPR_FRAME_1P_CTRL0			0x090
> +#define DCSS_DPR_FRAME_1P_PIX_X_CTRL		0x0A0
> +#define DCSS_DPR_FRAME_1P_PIX_Y_CTRL		0x0B0
> +#define DCSS_DPR_FRAME_1P_BASE_ADDR		0x0C0
> +#define DCSS_DPR_FRAME_2P_CTRL0			0x0E0
> +#define DCSS_DPR_FRAME_2P_PIX_X_CTRL		0x0F0
> +#define DCSS_DPR_FRAME_2P_PIX_Y_CTRL		0x100
> +#define DCSS_DPR_FRAME_2P_BASE_ADDR		0x110
> +#define DCSS_DPR_STATUS_CTRL0			0x130
> +#define   STATUS_MUX_SEL_MASK			GENMASK(2, 0)
> +#define   STATUS_SRC_SEL_POS			16
> +#define   STATUS_SRC_SEL_MASK			GENMASK(18, 16)
> +#define DCSS_DPR_STATUS_CTRL1			0x140
> +#define DCSS_DPR_RTRAM_CTRL0			0x200
> +#define   NUM_ROWS_ACTIVE			BIT(0)
> +#define   THRES_HIGH_POS			1
> +#define   THRES_HIGH_MASK			GENMASK(3, 1)
> +#define   THRES_LOW_POS				4
> +#define   THRES_LOW_MASK			GENMASK(6, 4)
> +#define   ABORT_SEL				BIT(7)
> +
> +enum dcss_tile_type {
> +	TILE_LINEAR =3D 0,
> +	TILE_GPU_STANDARD,
> +	TILE_GPU_SUPER,
> +	TILE_VPU_YUV420,
> +	TILE_VPU_VP9,
> +};
> +
> +enum dcss_pix_size {
> +	PIX_SIZE_8,
> +	PIX_SIZE_16,
> +	PIX_SIZE_32,
> +};
> +
> +struct dcss_dpr_ch {
> +	struct dcss_dpr *dpr;
> +	void __iomem *base_reg;
> +	u32 base_ofs;
> +
> +	struct drm_format_info format;
> +	enum dcss_pix_size pix_size;
> +	enum dcss_tile_type tile;
> +	bool rtram_4line_en;
> +	bool rtram_3buf_en;
> +
> +	u32 frame_ctrl;
> +	u32 mode_ctrl;
> +	u32 sys_ctrl;
> +	u32 rtram_ctrl;
> +
> +	bool sys_ctrl_chgd;
> +
> +	int ch_num;
> +	int irq;
> +};
> +
> +struct dcss_dpr {
> +	struct device *dev;
> +	struct dcss_ctxld *ctxld;
> +	u32  ctx_id;
> +
> +	struct dcss_dpr_ch ch[3];
> +};
> +
> +static void dcss_dpr_write(struct dcss_dpr_ch *ch, u32 val, u32 ofs)
> +{
> +	struct dcss_dpr *dpr =3D ch->dpr;
> +
> +	dcss_ctxld_write(dpr->ctxld, dpr->ctx_id, val, ch->base_ofs + ofs);
> +}
> +
> +static int dcss_dpr_ch_init_all(struct dcss_dpr *dpr, unsigned long dpr_=
base)
> +{
> +	struct dcss_dpr_ch *ch;
> +	int i;
> +
> +	for (i =3D 0; i < 3; i++) {
> +		ch =3D &dpr->ch[i];
> +
> +		ch->base_ofs =3D dpr_base + i * 0x1000;
> +
> +		ch->base_reg =3D ioremap(ch->base_ofs, SZ_4K);
> +		if (!ch->base_reg) {
> +			dev_err(dpr->dev, "dpr: unable to remap ch %d base\n",
> +				i);
> +			return -ENOMEM;
> +		}
> +
> +		ch->dpr =3D dpr;
> +		ch->ch_num =3D i;
> +
> +		dcss_writel(0xff, ch->base_reg + DCSS_DPR_IRQ_MASK);
> +	}
> +
> +	return 0;
> +}
> +
> +int dcss_dpr_init(struct dcss_dev *dcss, unsigned long dpr_base)
> +{
> +	struct dcss_dpr *dpr;
> +
> +	dpr =3D kzalloc(sizeof(*dpr), GFP_KERNEL);
> +	if (!dpr)
> +		return -ENOMEM;
> +
> +	dcss->dpr =3D dpr;
> +	dpr->dev =3D dcss->dev;
> +	dpr->ctxld =3D dcss->ctxld;
> +	dpr->ctx_id =3D CTX_SB_HP;
> +
> +	if (dcss_dpr_ch_init_all(dpr, dpr_base)) {
> +		int i;
> +
> +		for (i =3D 0; i < 3; i++) {
> +			if (dpr->ch[i].base_reg)
> +				iounmap(dpr->ch[i].base_reg);
> +		}
> +
> +		kfree(dpr);
> +
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +void dcss_dpr_exit(struct dcss_dpr *dpr)
> +{
> +	int ch_no;
> +
> +	/* stop DPR on all channels */
> +	for (ch_no =3D 0; ch_no < 3; ch_no++) {
> +		struct dcss_dpr_ch *ch =3D &dpr->ch[ch_no];
> +
> +		dcss_writel(0, ch->base_reg + DCSS_DPR_SYSTEM_CTRL0);
> +
> +		if (ch->base_reg)
> +			iounmap(ch->base_reg);
> +	}
> +
> +	kfree(dpr);
> +}
> +
> +static u32 dcss_dpr_x_pix_wide_adjust(struct dcss_dpr_ch *ch, u32 pix_wi=
de,
> +				      u32 pix_format)
> +{
> +	u8 pix_in_64byte_map[3][5] =3D {
> +		/* LIN, GPU_STD, GPU_SUP, VPU_YUV420, VPU_VP9 */
> +		{   64,       8,       8,          8,     16}, /* PIX_SIZE_8  */
> +		{   32,       8,       8,          8,      8}, /* PIX_SIZE_16 */
> +		{   16,       4,       4,          8,      8}, /* PIX_SIZE_32 */
> +	};
> +	u32 offset;
> +	u32 div_64byte_mod, pix_in_64byte;
> +
> +	pix_in_64byte =3D pix_in_64byte_map[ch->pix_size][ch->tile];
> +
> +	div_64byte_mod =3D pix_wide % pix_in_64byte;
> +	offset =3D (div_64byte_mod =3D=3D 0) ? 0 : (pix_in_64byte - div_64byte_=
mod);
> +
> +	return pix_wide + offset;
> +}
> +
> +static u32 dcss_dpr_y_pix_high_adjust(struct dcss_dpr_ch *ch, u32 pix_hi=
gh,
> +				      u32 pix_format)
> +{
> +	u8 num_rows_buf =3D ch->rtram_4line_en ? 4 : 8;
> +	u32 offset, pix_y_mod;
> +
> +	pix_y_mod =3D pix_high % num_rows_buf;
> +	offset =3D pix_y_mod ? (num_rows_buf - pix_y_mod) : 0;
> +
> +	return pix_high + offset;
> +}
> +
> +void dcss_dpr_set_res(struct dcss_dpr *dpr, int ch_num, u32 xres, u32 yr=
es)
> +{
> +	struct dcss_dpr_ch *ch =3D &dpr->ch[ch_num];
> +	u32 pix_format =3D ch->format.format;
> +	u32 gap =3D DCSS_DPR_FRAME_2P_BASE_ADDR - DCSS_DPR_FRAME_1P_BASE_ADDR;
> +	int plane, max_planes =3D 1;
> +	u32 pix_x_wide, pix_y_high;
> +
> +	if (pix_format =3D=3D DRM_FORMAT_NV12 ||
> +	    pix_format =3D=3D DRM_FORMAT_NV21)
> +		max_planes =3D 2;
> +
> +	for (plane =3D 0; plane < max_planes; plane++) {
> +		yres =3D plane =3D=3D 1 ? yres >> 1 : yres;
> +
> +		pix_x_wide =3D dcss_dpr_x_pix_wide_adjust(ch, xres, pix_format);
> +		pix_y_high =3D dcss_dpr_y_pix_high_adjust(ch, yres, pix_format);
> +
> +		dcss_dpr_write(ch, pix_x_wide,
> +			       DCSS_DPR_FRAME_1P_PIX_X_CTRL + plane * gap);
> +		dcss_dpr_write(ch, pix_y_high,
> +			       DCSS_DPR_FRAME_1P_PIX_Y_CTRL + plane * gap);
> +
> +		dcss_dpr_write(ch, 2, DCSS_DPR_FRAME_1P_CTRL0 + plane * gap);
> +	}
> +}
> +
> +void dcss_dpr_addr_set(struct dcss_dpr *dpr, int ch_num, u32 luma_base_a=
ddr,
> +		       u32 chroma_base_addr, u16 pitch)
> +{
> +	struct dcss_dpr_ch *ch =3D &dpr->ch[ch_num];
> +
> +	dcss_dpr_write(ch, luma_base_addr, DCSS_DPR_FRAME_1P_BASE_ADDR);
> +
> +	dcss_dpr_write(ch, chroma_base_addr, DCSS_DPR_FRAME_2P_BASE_ADDR);
> +
> +	ch->frame_ctrl &=3D ~PITCH_MASK;
> +	ch->frame_ctrl |=3D (((u32)pitch << PITCH_POS) & PITCH_MASK);
> +}
> +
> +static void dcss_dpr_argb_comp_sel(struct dcss_dpr_ch *ch, int a_sel, in=
t r_sel,
> +				   int g_sel, int b_sel)
> +{
> +	u32 sel;
> +
> +	sel =3D ((a_sel << A_COMP_SEL_POS) & A_COMP_SEL_MASK) |
> +	      ((r_sel << R_COMP_SEL_POS) & R_COMP_SEL_MASK) |
> +	      ((g_sel << G_COMP_SEL_POS) & G_COMP_SEL_MASK) |
> +	      ((b_sel << B_COMP_SEL_POS) & B_COMP_SEL_MASK);
> +
> +	ch->mode_ctrl &=3D ~(A_COMP_SEL_MASK | R_COMP_SEL_MASK |
> +			   G_COMP_SEL_MASK | B_COMP_SEL_MASK);
> +	ch->mode_ctrl |=3D sel;
> +}
> +
> +static void dcss_dpr_pix_size_set(struct dcss_dpr_ch *ch,
> +				  const struct drm_format_info *format)
> +{
> +	u32 val;
> +
> +	switch (format->format) {
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV21:
> +		val =3D PIX_SIZE_8;
> +		break;
> +
> +	case DRM_FORMAT_UYVY:
> +	case DRM_FORMAT_VYUY:
> +	case DRM_FORMAT_YUYV:
> +	case DRM_FORMAT_YVYU:
> +		val =3D PIX_SIZE_16;
> +		break;
> +
> +	default:
> +		val =3D PIX_SIZE_32;
> +		break;
> +	}
> +
> +	ch->pix_size =3D val;
> +
> +	ch->mode_ctrl &=3D ~PIX_SIZE_MASK;
> +	ch->mode_ctrl |=3D ((val << PIX_SIZE_POS) & PIX_SIZE_MASK);
> +}
> +
> +static void dcss_dpr_uv_swap(struct dcss_dpr_ch *ch, bool swap)
> +{
> +	ch->mode_ctrl &=3D ~PIX_UV_SWAP;
> +	ch->mode_ctrl |=3D (swap ? PIX_UV_SWAP : 0);
> +}
> +
> +static void dcss_dpr_y_uv_swap(struct dcss_dpr_ch *ch, bool swap)
> +{
> +	ch->mode_ctrl &=3D ~PIX_LUMA_UV_SWAP;
> +	ch->mode_ctrl |=3D (swap ? PIX_LUMA_UV_SWAP : 0);
> +}
> +
> +static void dcss_dpr_2plane_en(struct dcss_dpr_ch *ch, bool en)
> +{
> +	ch->mode_ctrl &=3D ~COMP_2PLANE_EN;
> +	ch->mode_ctrl |=3D (en ? COMP_2PLANE_EN : 0);
> +}
> +
> +static void dcss_dpr_yuv_en(struct dcss_dpr_ch *ch, bool en)
> +{
> +	ch->mode_ctrl &=3D ~YUV_EN;
> +	ch->mode_ctrl |=3D (en ? YUV_EN : 0);
> +}
> +
> +void dcss_dpr_enable(struct dcss_dpr *dpr, int ch_num, bool en)
> +{
> +	struct dcss_dpr_ch *ch =3D &dpr->ch[ch_num];
> +	u32 sys_ctrl;
> +
> +	sys_ctrl =3D (en ? REPEAT_EN | RUN_EN : 0);
> +
> +	if (en) {
> +		dcss_dpr_write(ch, ch->mode_ctrl, DCSS_DPR_MODE_CTRL0);
> +		dcss_dpr_write(ch, ch->frame_ctrl, DCSS_DPR_FRAME_CTRL0);
> +		dcss_dpr_write(ch, ch->rtram_ctrl, DCSS_DPR_RTRAM_CTRL0);
> +	}
> +
> +	if (ch->sys_ctrl !=3D sys_ctrl)
> +		ch->sys_ctrl_chgd =3D true;
> +
> +	ch->sys_ctrl =3D sys_ctrl;
> +}
> +
> +struct rgb_comp_sel {
> +	u32 drm_format;
> +	int a_sel;
> +	int r_sel;
> +	int g_sel;
> +	int b_sel;
> +};
> +
> +static struct rgb_comp_sel comp_sel_map[] =3D {
> +	{DRM_FORMAT_ARGB8888, 3, 2, 1, 0},
> +	{DRM_FORMAT_XRGB8888, 3, 2, 1, 0},
> +	{DRM_FORMAT_ABGR8888, 3, 0, 1, 2},
> +	{DRM_FORMAT_XBGR8888, 3, 0, 1, 2},
> +	{DRM_FORMAT_RGBA8888, 0, 3, 2, 1},
> +	{DRM_FORMAT_RGBX8888, 0, 3, 2, 1},
> +	{DRM_FORMAT_BGRA8888, 0, 1, 2, 3},
> +	{DRM_FORMAT_BGRX8888, 0, 1, 2, 3},
> +};
> +
> +static int to_comp_sel(u32 pix_fmt, int *a_sel, int *r_sel, int *g_sel,
> +		       int *b_sel)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(comp_sel_map); i++) {
> +		if (comp_sel_map[i].drm_format =3D=3D pix_fmt) {
> +			*a_sel =3D comp_sel_map[i].a_sel;
> +			*r_sel =3D comp_sel_map[i].r_sel;
> +			*g_sel =3D comp_sel_map[i].g_sel;
> +			*b_sel =3D comp_sel_map[i].b_sel;
> +
> +			return 0;
> +		}
> +	}
> +
> +	return -1;
> +}
> +
> +static void dcss_dpr_rtram_set(struct dcss_dpr_ch *ch, u32 pix_format)
> +{
> +	u32 val, mask;
> +
> +	switch (pix_format) {
> +	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV12:
> +		ch->rtram_3buf_en =3D true;
> +		ch->rtram_4line_en =3D false;
> +		break;
> +
> +	default:
> +		ch->rtram_3buf_en =3D true;
> +		ch->rtram_4line_en =3D true;
> +		break;
> +	}
> +
> +	val =3D (ch->rtram_4line_en ? RTR_4LINE_BUF_EN : 0);
> +	val |=3D (ch->rtram_3buf_en ? RTR_3BUF_EN : 0);
> +	mask =3D RTR_4LINE_BUF_EN | RTR_3BUF_EN;
> +
> +	ch->mode_ctrl &=3D ~mask;
> +	ch->mode_ctrl |=3D (val & mask);
> +
> +	val =3D (ch->rtram_4line_en ? 0 : NUM_ROWS_ACTIVE);
> +	val |=3D (3 << THRES_LOW_POS) & THRES_LOW_MASK;
> +	val |=3D (4 << THRES_HIGH_POS) & THRES_HIGH_MASK;
> +	mask =3D THRES_LOW_MASK | THRES_HIGH_MASK | NUM_ROWS_ACTIVE;
> +
> +	ch->rtram_ctrl &=3D ~mask;
> +	ch->rtram_ctrl |=3D (val & mask);
> +}
> +
> +static void dcss_dpr_setup_components(struct dcss_dpr_ch *ch,
> +				      const struct drm_format_info *format)
> +{
> +	int a_sel, r_sel, g_sel, b_sel;
> +	bool uv_swap, y_uv_swap;
> +
> +	switch (format->format) {
> +	case DRM_FORMAT_YVYU:
> +		uv_swap =3D true;
> +		y_uv_swap =3D true;
> +		break;
> +
> +	case DRM_FORMAT_VYUY:
> +	case DRM_FORMAT_NV21:
> +		uv_swap =3D true;
> +		y_uv_swap =3D false;
> +		break;
> +
> +	case DRM_FORMAT_YUYV:
> +		uv_swap =3D false;
> +		y_uv_swap =3D true;
> +		break;
> +
> +	default:
> +		uv_swap =3D false;
> +		y_uv_swap =3D false;
> +		break;
> +	}
> +
> +	dcss_dpr_uv_swap(ch, uv_swap);
> +
> +	dcss_dpr_y_uv_swap(ch, y_uv_swap);
> +
> +	if (!format->is_yuv) {
> +		if (!to_comp_sel(format->format, &a_sel, &r_sel,
> +				 &g_sel, &b_sel)) {
> +			dcss_dpr_argb_comp_sel(ch, a_sel, r_sel, g_sel, b_sel);
> +		} else {
> +			dcss_dpr_argb_comp_sel(ch, 3, 2, 1, 0);
> +		}
> +	} else {
> +		dcss_dpr_argb_comp_sel(ch, 0, 0, 0, 0);
> +	}
> +}
> +
> +static void dcss_dpr_tile_set(struct dcss_dpr_ch *ch, uint64_t modifier)
> +{
> +	switch (ch->ch_num) {
> +	case 0:
> +		switch (modifier) {
> +		case DRM_FORMAT_MOD_LINEAR:
> +			ch->tile =3D TILE_LINEAR;
> +			break;
> +		case DRM_FORMAT_MOD_VIVANTE_TILED:
> +			ch->tile =3D TILE_GPU_STANDARD;
> +			break;
> +		case DRM_FORMAT_MOD_VIVANTE_SUPER_TILED:
> +			ch->tile =3D TILE_GPU_SUPER;
> +			break;
> +		default:
> +			WARN_ON(1);
> +			break;
> +		}
> +		break;
> +	case 1:
> +	case 2:
> +		ch->tile =3D TILE_LINEAR;
> +		break;
> +	default:
> +		WARN_ON(1);
> +		return;
> +	}
> +
> +	ch->mode_ctrl &=3D ~TILE_TYPE_MASK;
> +	ch->mode_ctrl |=3D ((ch->tile << TILE_TYPE_POS) & TILE_TYPE_MASK);
> +}
> +
> +void dcss_dpr_format_set(struct dcss_dpr *dpr, int ch_num,
> +			 const struct drm_format_info *format, u64 modifier)
> +{
> +	struct dcss_dpr_ch *ch =3D &dpr->ch[ch_num];
> +
> +	ch->format =3D *format;
> +
> +	dcss_dpr_yuv_en(ch, format->is_yuv);
> +
> +	dcss_dpr_pix_size_set(ch, format);
> +
> +	dcss_dpr_setup_components(ch, format);
> +
> +	dcss_dpr_2plane_en(ch, format->num_planes =3D=3D 2);
> +
> +	dcss_dpr_rtram_set(ch, format->format);
> +
> +	dcss_dpr_tile_set(ch, modifier);
> +}
> +
> +/* This function will be called from interrupt context. */
> +void dcss_dpr_write_sysctrl(struct dcss_dpr *dpr)
> +{
> +	int chnum;
> +
> +	dcss_ctxld_assert_locked(dpr->ctxld);
> +
> +	for (chnum =3D 0; chnum < 3; chnum++) {
> +		struct dcss_dpr_ch *ch =3D &dpr->ch[chnum];
> +
> +		if (ch->sys_ctrl_chgd) {
> +			dcss_ctxld_write_irqsafe(dpr->ctxld, dpr->ctx_id,
> +						 ch->sys_ctrl,
> +						 ch->base_ofs +
> +						 DCSS_DPR_SYSTEM_CTRL0);
> +			ch->sys_ctrl_chgd =3D false;
> +		}
> +	}
> +}
> +
> +void dcss_dpr_set_rotation(struct dcss_dpr *dpr, int ch_num, u32 rotatio=
n)
> +{
> +	struct dcss_dpr_ch *ch =3D &dpr->ch[ch_num];
> +
> +	ch->frame_ctrl &=3D ~(HFLIP_EN | VFLIP_EN | ROT_ENC_MASK);
> +
> +	ch->frame_ctrl |=3D rotation & DRM_MODE_REFLECT_X ? HFLIP_EN : 0;
> +	ch->frame_ctrl |=3D rotation & DRM_MODE_REFLECT_Y ? VFLIP_EN : 0;
> +
> +	if (rotation & DRM_MODE_ROTATE_90)
> +		ch->frame_ctrl |=3D 1 << ROT_ENC_POS;
> +	else if (rotation & DRM_MODE_ROTATE_180)
> +		ch->frame_ctrl |=3D 2 << ROT_ENC_POS;
> +	else if (rotation & DRM_MODE_ROTATE_270)
> +		ch->frame_ctrl |=3D 3 << ROT_ENC_POS;
> +}
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dc=
ss/dcss-drv.c
> new file mode 100644
> index 000000000000..8dc2f85c514b
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <drm/drm_of.h>
> +
> +#include "dcss-dev.h"
> +#include "dcss-kms.h"
> +
> +struct dcss_drv {
> +	struct dcss_dev *dcss;
> +	struct dcss_kms_dev *kms;
> +};
> +
> +struct dcss_dev *dcss_drv_dev_to_dcss(struct device *dev)
> +{
> +	struct dcss_drv *mdrv =3D dev_get_drvdata(dev);
> +
> +	return mdrv ? mdrv->dcss : NULL;
> +}
> +
> +struct drm_device *dcss_drv_dev_to_drm(struct device *dev)
> +{
> +	struct dcss_drv *mdrv =3D dev_get_drvdata(dev);
> +
> +	return mdrv ? &mdrv->kms->base : NULL;
> +}
> +
> +static int dcss_drv_platform_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *remote;
> +	struct dcss_drv *mdrv;
> +	int err =3D 0;
> +	bool hdmi_output =3D true;
> +
> +	if (!dev->of_node)
> +		return -ENODEV;
> +
> +	remote =3D of_graph_get_remote_node(dev->of_node, 0, 0);
> +	if (!remote)
> +		return -ENODEV;
> +
> +	hdmi_output =3D !of_device_is_compatible(remote, "fsl,imx8mq-nwl-dsi");
> +
> +	of_node_put(remote);
> +
> +	mdrv =3D kzalloc(sizeof(*mdrv), GFP_KERNEL);
> +	if (!mdrv)
> +		return -ENOMEM;
> +
> +	mdrv->dcss =3D dcss_dev_create(dev, hdmi_output);
> +	if (IS_ERR(mdrv->dcss)) {
> +		err =3D PTR_ERR(mdrv->dcss);
> +		goto err;
> +	}
> +
> +	dev_set_drvdata(dev, mdrv);
> +
> +	mdrv->kms =3D dcss_kms_attach(mdrv->dcss);
> +	if (IS_ERR(mdrv->kms)) {
> +		err =3D PTR_ERR(mdrv->kms);
> +		goto dcss_shutoff;
> +	}
> +
> +	return 0;
> +
> +dcss_shutoff:
> +	dcss_dev_destroy(mdrv->dcss);
> +
> +	dev_set_drvdata(dev, NULL);
> +
> +err:
> +	kfree(mdrv);
> +	return err;
> +}
> +
> +static int dcss_drv_platform_remove(struct platform_device *pdev)
> +{
> +	struct dcss_drv *mdrv =3D dev_get_drvdata(&pdev->dev);
> +
> +	if (!mdrv)
> +		return 0;
> +
> +	dcss_kms_detach(mdrv->kms);
> +	dcss_dev_destroy(mdrv->dcss);
> +
> +	dev_set_drvdata(&pdev->dev, NULL);
> +
> +	kfree(mdrv);
> +
> +	return 0;
> +}
> +
> +static struct dcss_type_data dcss_types[] =3D {
> +	[DCSS_IMX8MQ] =3D {
> +		.name =3D "DCSS_IMX8MQ",
> +		.blkctl_ofs =3D 0x2F000,
> +		.ctxld_ofs =3D 0x23000,
> +		.dtg_ofs =3D 0x20000,
> +		.scaler_ofs =3D 0x1C000,
> +		.ss_ofs =3D 0x1B000,
> +		.dpr_ofs =3D 0x18000,
> +	},
> +};
> +
> +static const struct of_device_id dcss_of_match[] =3D {
> +	{ .compatible =3D "nxp,imx8mq-dcss", .data =3D &dcss_types[DCSS_IMX8MQ]=
, },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, dcss_of_match);
> +
> +static const struct dev_pm_ops dcss_dev_pm =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(dcss_dev_suspend, dcss_dev_resume)
> +	SET_RUNTIME_PM_OPS(dcss_dev_runtime_suspend,
> +			   dcss_dev_runtime_resume, NULL)
> +};
> +
> +static struct platform_driver dcss_platform_driver =3D {
> +	.probe	=3D dcss_drv_platform_probe,
> +	.remove	=3D dcss_drv_platform_remove,
> +	.driver	=3D {
> +		.name =3D "imx-dcss",
> +		.of_match_table	=3D dcss_of_match,
> +		.pm =3D &dcss_dev_pm,
> +	},
> +};
> +
> +module_platform_driver(dcss_platform_driver);
> +
> +MODULE_AUTHOR("Laurentiu Palcu <laurentiu.palcu@nxp.com>");
> +MODULE_DESCRIPTION("DCSS driver for i.MX8MQ");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dtg.c b/drivers/gpu/drm/imx/dc=
ss/dcss-dtg.c
> new file mode 100644
> index 000000000000..30de00540f63
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dtg.c
> @@ -0,0 +1,409 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "dcss-dev.h"
> +
> +#define DCSS_DTG_TC_CONTROL_STATUS			0x00
> +#define   CH3_EN					BIT(0)
> +#define   CH2_EN					BIT(1)
> +#define   CH1_EN					BIT(2)
> +#define   OVL_DATA_MODE					BIT(3)
> +#define   BLENDER_VIDEO_ALPHA_SEL			BIT(7)
> +#define   DTG_START					BIT(8)
> +#define   DBY_MODE_EN					BIT(9)
> +#define   CH1_ALPHA_SEL					BIT(10)
> +#define   CSS_PIX_COMP_SWAP_POS				12
> +#define   CSS_PIX_COMP_SWAP_MASK			GENMASK(14, 12)
> +#define   DEFAULT_FG_ALPHA_POS				24
> +#define   DEFAULT_FG_ALPHA_MASK				GENMASK(31, 24)
> +#define DCSS_DTG_TC_DTG					0x04
> +#define DCSS_DTG_TC_DISP_TOP				0x08
> +#define DCSS_DTG_TC_DISP_BOT				0x0C
> +#define DCSS_DTG_TC_CH1_TOP				0x10
> +#define DCSS_DTG_TC_CH1_BOT				0x14
> +#define DCSS_DTG_TC_CH2_TOP				0x18
> +#define DCSS_DTG_TC_CH2_BOT				0x1C
> +#define DCSS_DTG_TC_CH3_TOP				0x20
> +#define DCSS_DTG_TC_CH3_BOT				0x24
> +#define   TC_X_POS					0
> +#define   TC_X_MASK					GENMASK(12, 0)
> +#define   TC_Y_POS					16
> +#define   TC_Y_MASK					GENMASK(28, 16)
> +#define DCSS_DTG_TC_CTXLD				0x28
> +#define   TC_CTXLD_DB_Y_POS				0
> +#define   TC_CTXLD_DB_Y_MASK				GENMASK(12, 0)
> +#define   TC_CTXLD_SB_Y_POS				16
> +#define   TC_CTXLD_SB_Y_MASK				GENMASK(28, 16)
> +#define DCSS_DTG_TC_CH1_BKRND				0x2C
> +#define DCSS_DTG_TC_CH2_BKRND				0x30
> +#define   BKRND_R_Y_COMP_POS				20
> +#define   BKRND_R_Y_COMP_MASK				GENMASK(29, 20)
> +#define   BKRND_G_U_COMP_POS				10
> +#define   BKRND_G_U_COMP_MASK				GENMASK(19, 10)
> +#define   BKRND_B_V_COMP_POS				0
> +#define   BKRND_B_V_COMP_MASK				GENMASK(9, 0)
> +#define DCSS_DTG_BLENDER_DBY_RANGEINV			0x38
> +#define DCSS_DTG_BLENDER_DBY_RANGEMIN			0x3C
> +#define DCSS_DTG_BLENDER_DBY_BDP			0x40
> +#define DCSS_DTG_BLENDER_BKRND_I			0x44
> +#define DCSS_DTG_BLENDER_BKRND_P			0x48
> +#define DCSS_DTG_BLENDER_BKRND_T			0x4C
> +#define DCSS_DTG_LINE0_INT				0x50
> +#define DCSS_DTG_LINE1_INT				0x54
> +#define DCSS_DTG_BG_ALPHA_DEFAULT			0x58
> +#define DCSS_DTG_INT_STATUS				0x5C
> +#define DCSS_DTG_INT_CONTROL				0x60
> +#define DCSS_DTG_TC_CH3_BKRND				0x64
> +#define DCSS_DTG_INT_MASK				0x68
> +#define   LINE0_IRQ					BIT(0)
> +#define   LINE1_IRQ					BIT(1)
> +#define   LINE2_IRQ					BIT(2)
> +#define   LINE3_IRQ					BIT(3)
> +#define DCSS_DTG_LINE2_INT				0x6C
> +#define DCSS_DTG_LINE3_INT				0x70
> +#define DCSS_DTG_DBY_OL					0x74
> +#define DCSS_DTG_DBY_BL					0x78
> +#define DCSS_DTG_DBY_EL					0x7C
> +
> +struct dcss_dtg {
> +	struct device *dev;
> +	struct dcss_ctxld *ctxld;
> +	void __iomem *base_reg;
> +	u32 base_ofs;
> +
> +	u32 ctx_id;
> +
> +	bool in_use;
> +
> +	u32 dis_ulc_x;
> +	u32 dis_ulc_y;
> +
> +	u32 control_status;
> +	u32 alpha;
> +	u32 alpha_cfg;
> +
> +	int ctxld_kick_irq;
> +	bool ctxld_kick_irq_en;
> +};
> +
> +static void dcss_dtg_write(struct dcss_dtg *dtg, u32 val, u32 ofs)
> +{
> +	if (!dtg->in_use)
> +		dcss_writel(val, dtg->base_reg + ofs);
> +
> +	dcss_ctxld_write(dtg->ctxld, dtg->ctx_id,
> +			 val, dtg->base_ofs + ofs);
> +}
> +
> +static irqreturn_t dcss_dtg_irq_handler(int irq, void *data)
> +{
> +	struct dcss_dtg *dtg =3D data;
> +	u32 status;
> +
> +	status =3D dcss_readl(dtg->base_reg + DCSS_DTG_INT_STATUS);
> +
> +	if (!(status & LINE0_IRQ))
> +		return IRQ_NONE;
> +
> +	dcss_ctxld_kick(dtg->ctxld);
> +
> +	dcss_writel(status & LINE0_IRQ, dtg->base_reg + DCSS_DTG_INT_CONTROL);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int dcss_dtg_irq_config(struct dcss_dtg *dtg,
> +			       struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	dtg->ctxld_kick_irq =3D platform_get_irq_byname(pdev, "ctxld_kick");
> +	if (dtg->ctxld_kick_irq < 0)
> +		return dtg->ctxld_kick_irq;
> +
> +	dcss_update(0, LINE0_IRQ | LINE1_IRQ,
> +		    dtg->base_reg + DCSS_DTG_INT_MASK);
> +
> +	ret =3D request_irq(dtg->ctxld_kick_irq, dcss_dtg_irq_handler,
> +			  0, "dcss_ctxld_kick", dtg);
> +	if (ret) {
> +		dev_err(dtg->dev, "dtg: irq request failed.\n");
> +		return ret;
> +	}
> +
> +	disable_irq(dtg->ctxld_kick_irq);
> +
> +	dtg->ctxld_kick_irq_en =3D false;
> +
> +	return 0;
> +}
> +
> +int dcss_dtg_init(struct dcss_dev *dcss, unsigned long dtg_base)
> +{
> +	int ret =3D 0;
> +	struct dcss_dtg *dtg;
> +
> +	dtg =3D kzalloc(sizeof(*dtg), GFP_KERNEL);
> +	if (!dtg)
> +		return -ENOMEM;
> +
> +	dcss->dtg =3D dtg;
> +	dtg->dev =3D dcss->dev;
> +	dtg->ctxld =3D dcss->ctxld;
> +
> +	dtg->base_reg =3D ioremap(dtg_base, SZ_4K);
> +	if (!dtg->base_reg) {
> +		dev_err(dcss->dev, "dtg: unable to remap dtg base\n");
> +		ret =3D -ENOMEM;
> +		goto err_ioremap;
> +	}
> +
> +	dtg->base_ofs =3D dtg_base;
> +	dtg->ctx_id =3D CTX_DB;
> +
> +	dtg->alpha =3D 255;
> +
> +	dtg->control_status |=3D OVL_DATA_MODE | BLENDER_VIDEO_ALPHA_SEL |
> +		((dtg->alpha << DEFAULT_FG_ALPHA_POS) & DEFAULT_FG_ALPHA_MASK);
> +
> +	ret =3D dcss_dtg_irq_config(dtg, to_platform_device(dcss->dev));
> +	if (ret)
> +		goto err_irq;
> +
> +	return 0;
> +
> +err_irq:
> +	iounmap(dtg->base_reg);
> +
> +err_ioremap:
> +	kfree(dtg);
> +
> +	return ret;
> +}
> +
> +void dcss_dtg_exit(struct dcss_dtg *dtg)
> +{
> +	free_irq(dtg->ctxld_kick_irq, dtg);
> +
> +	if (dtg->base_reg)
> +		iounmap(dtg->base_reg);
> +
> +	kfree(dtg);
> +}
> +
> +void dcss_dtg_sync_set(struct dcss_dtg *dtg, struct videomode *vm)
> +{
> +	struct dcss_dev *dcss =3D dcss_drv_dev_to_dcss(dtg->dev);
> +	u16 dtg_lrc_x, dtg_lrc_y;
> +	u16 dis_ulc_x, dis_ulc_y;
> +	u16 dis_lrc_x, dis_lrc_y;
> +	u32 sb_ctxld_trig, db_ctxld_trig;
> +	u32 pixclock =3D vm->pixelclock;
> +	u32 actual_clk;
> +
> +	dtg_lrc_x =3D vm->hfront_porch + vm->hback_porch + vm->hsync_len +
> +		    vm->hactive - 1;
> +	dtg_lrc_y =3D vm->vfront_porch + vm->vback_porch + vm->vsync_len +
> +		    vm->vactive - 1;
> +	dis_ulc_x =3D vm->hsync_len + vm->hback_porch - 1;
> +	dis_ulc_y =3D vm->vsync_len + vm->vfront_porch + vm->vback_porch - 1;
> +	dis_lrc_x =3D vm->hsync_len + vm->hback_porch + vm->hactive - 1;
> +	dis_lrc_y =3D vm->vsync_len + vm->vfront_porch + vm->vback_porch +
> +		    vm->vactive - 1;
> +
> +	clk_disable_unprepare(dcss->pix_clk);
> +	clk_set_rate(dcss->pix_clk, vm->pixelclock);
> +	clk_prepare_enable(dcss->pix_clk);
> +
> +	actual_clk =3D clk_get_rate(dcss->pix_clk);
> +	if (pixclock !=3D actual_clk) {
> +		dev_info(dtg->dev,
> +			 "Pixel clock set to %u kHz instead of %u kHz.\n",
> +			 (actual_clk / 1000), (pixclock / 1000));
> +	}
> +
> +	dcss_dtg_write(dtg, ((dtg_lrc_y << TC_Y_POS) | dtg_lrc_x),
> +		       DCSS_DTG_TC_DTG);
> +	dcss_dtg_write(dtg, ((dis_ulc_y << TC_Y_POS) | dis_ulc_x),
> +		       DCSS_DTG_TC_DISP_TOP);
> +	dcss_dtg_write(dtg, ((dis_lrc_y << TC_Y_POS) | dis_lrc_x),
> +		       DCSS_DTG_TC_DISP_BOT);
> +
> +	dtg->dis_ulc_x =3D dis_ulc_x;
> +	dtg->dis_ulc_y =3D dis_ulc_y;
> +
> +	sb_ctxld_trig =3D ((0 * dis_lrc_y / 100) << TC_CTXLD_SB_Y_POS) &
> +							TC_CTXLD_SB_Y_MASK;
> +	db_ctxld_trig =3D ((99 * dis_lrc_y / 100) << TC_CTXLD_DB_Y_POS) &
> +							TC_CTXLD_DB_Y_MASK;
> +
> +	dcss_dtg_write(dtg, sb_ctxld_trig | db_ctxld_trig, DCSS_DTG_TC_CTXLD);
> +
> +	/* vblank trigger */
> +	dcss_dtg_write(dtg, 0, DCSS_DTG_LINE1_INT);
> +
> +	/* CTXLD trigger */
> +	dcss_dtg_write(dtg, ((90 * dis_lrc_y) / 100) << 16, DCSS_DTG_LINE0_INT);
> +}
> +
> +void dcss_dtg_plane_pos_set(struct dcss_dtg *dtg, int ch_num,
> +			    int px, int py, int pw, int ph)
> +{
> +	u16 p_ulc_x, p_ulc_y;
> +	u16 p_lrc_x, p_lrc_y;
> +
> +	p_ulc_x =3D dtg->dis_ulc_x + px;
> +	p_ulc_y =3D dtg->dis_ulc_y + py;
> +	p_lrc_x =3D p_ulc_x + pw;
> +	p_lrc_y =3D p_ulc_y + ph;
> +
> +	if (!px && !py && !pw && !ph) {
> +		dcss_dtg_write(dtg, 0, DCSS_DTG_TC_CH1_TOP + 0x8 * ch_num);
> +		dcss_dtg_write(dtg, 0, DCSS_DTG_TC_CH1_BOT + 0x8 * ch_num);
> +	} else {
> +		dcss_dtg_write(dtg, ((p_ulc_y << TC_Y_POS) | p_ulc_x),
> +			       DCSS_DTG_TC_CH1_TOP + 0x8 * ch_num);
> +		dcss_dtg_write(dtg, ((p_lrc_y << TC_Y_POS) | p_lrc_x),
> +			       DCSS_DTG_TC_CH1_BOT + 0x8 * ch_num);
> +	}
> +}
> +
> +bool dcss_dtg_global_alpha_changed(struct dcss_dtg *dtg, int ch_num, int=
 alpha)
> +{
> +	if (ch_num)
> +		return false;
> +
> +	return alpha !=3D dtg->alpha;
> +}
> +
> +void dcss_dtg_plane_alpha_set(struct dcss_dtg *dtg, int ch_num,
> +			      const struct drm_format_info *format, int alpha)
> +{
> +	/* we care about alpha only when channel 0 is concerned */
> +	if (ch_num)
> +		return;
> +
> +	/*
> +	 * Use global alpha if pixel format does not have alpha channel or the
> +	 * user explicitly chose to use global alpha (i.e. alpha is not OPAQUE).
> +	 */
> +	if (!format->has_alpha || alpha !=3D 255)
> +		dtg->alpha_cfg =3D (alpha << DEFAULT_FG_ALPHA_POS) & DEFAULT_FG_ALPHA_=
MASK;
> +	else /* use per-pixel alpha otherwise */
> +		dtg->alpha_cfg =3D CH1_ALPHA_SEL;
> +
> +	dtg->alpha =3D alpha;
> +}
> +
> +void dcss_dtg_css_set(struct dcss_dtg *dtg)
> +{
> +	dtg->control_status |=3D
> +			(0x5 << CSS_PIX_COMP_SWAP_POS) & CSS_PIX_COMP_SWAP_MASK;
> +}
> +
> +void dcss_dtg_enable(struct dcss_dtg *dtg)
> +{
> +	dtg->control_status |=3D DTG_START;
> +
> +	dtg->control_status &=3D ~(CH1_ALPHA_SEL | DEFAULT_FG_ALPHA_MASK);
> +	dtg->control_status |=3D dtg->alpha_cfg;
> +
> +	dcss_dtg_write(dtg, dtg->control_status, DCSS_DTG_TC_CONTROL_STATUS);
> +
> +	dtg->in_use =3D true;
> +}
> +
> +void dcss_dtg_shutoff(struct dcss_dtg *dtg)
> +{
> +	dtg->control_status &=3D ~DTG_START;
> +
> +	dcss_writel(dtg->control_status,
> +		    dtg->base_reg + DCSS_DTG_TC_CONTROL_STATUS);
> +
> +	dtg->in_use =3D false;
> +}
> +
> +bool dcss_dtg_is_enabled(struct dcss_dtg *dtg)
> +{
> +	return dtg->in_use;
> +}
> +
> +void dcss_dtg_ch_enable(struct dcss_dtg *dtg, int ch_num, bool en)
> +{
> +	u32 ch_en_map[] =3D {CH1_EN, CH2_EN, CH3_EN};
> +	u32 control_status;
> +
> +	control_status =3D dtg->control_status & ~ch_en_map[ch_num];
> +	control_status |=3D en ? ch_en_map[ch_num] : 0;
> +
> +	control_status &=3D ~(CH1_ALPHA_SEL | DEFAULT_FG_ALPHA_MASK);
> +	control_status |=3D dtg->alpha_cfg;
> +
> +	if (dtg->control_status !=3D control_status)
> +		dcss_dtg_write(dtg, control_status, DCSS_DTG_TC_CONTROL_STATUS);
> +
> +	dtg->control_status =3D control_status;
> +}
> +
> +void dcss_dtg_vblank_irq_enable(struct dcss_dtg *dtg, bool en)
> +{
> +	u32 status;
> +	u32 mask =3D en ? LINE1_IRQ : 0;
> +
> +	if (en) {
> +		status =3D dcss_readl(dtg->base_reg + DCSS_DTG_INT_STATUS);
> +		dcss_writel(status & LINE1_IRQ,
> +			    dtg->base_reg + DCSS_DTG_INT_CONTROL);
> +	}
> +
> +	dcss_update(mask, LINE1_IRQ, dtg->base_reg + DCSS_DTG_INT_MASK);
> +}
> +
> +void dcss_dtg_ctxld_kick_irq_enable(struct dcss_dtg *dtg, bool en)
> +{
> +	u32 status;
> +	u32 mask =3D en ? LINE0_IRQ : 0;
> +
> +	if (en) {
> +		status =3D dcss_readl(dtg->base_reg + DCSS_DTG_INT_STATUS);
> +
> +		if (!dtg->ctxld_kick_irq_en) {
> +			dcss_writel(status & LINE0_IRQ,
> +				    dtg->base_reg + DCSS_DTG_INT_CONTROL);
> +			enable_irq(dtg->ctxld_kick_irq);
> +			dtg->ctxld_kick_irq_en =3D true;
> +			dcss_update(mask, LINE0_IRQ,
> +				    dtg->base_reg + DCSS_DTG_INT_MASK);
> +		}
> +
> +		return;
> +	}
> +
> +	if (!dtg->ctxld_kick_irq_en)
> +		return;
> +
> +	disable_irq_nosync(dtg->ctxld_kick_irq);
> +	dtg->ctxld_kick_irq_en =3D false;
> +
> +	dcss_update(mask, LINE0_IRQ, dtg->base_reg + DCSS_DTG_INT_MASK);
> +}
> +
> +void dcss_dtg_vblank_irq_clear(struct dcss_dtg *dtg)
> +{
> +	dcss_update(LINE1_IRQ, LINE1_IRQ, dtg->base_reg + DCSS_DTG_INT_CONTROL);
> +}
> +
> +bool dcss_dtg_vblank_irq_valid(struct dcss_dtg *dtg)
> +{
> +	return !!(dcss_readl(dtg->base_reg + DCSS_DTG_INT_STATUS) & LINE1_IRQ);
> +}
> +
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dc=
ss/dcss-kms.c
> new file mode 100644
> index 000000000000..3ca49d0a3e61
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -0,0 +1,177 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "dcss-dev.h"
> +#include "dcss-kms.h"
> +
> +DEFINE_DRM_GEM_CMA_FOPS(dcss_cma_fops);
> +
> +static const struct drm_mode_config_funcs dcss_drm_mode_config_funcs =3D=
 {
> +	.fb_create =3D drm_gem_fb_create,
> +	.output_poll_changed =3D drm_fb_helper_output_poll_changed,
> +	.atomic_check =3D drm_atomic_helper_check,
> +	.atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +static struct drm_driver dcss_kms_driver =3D {
> +	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> +	.gem_free_object_unlocked =3D drm_gem_cma_free_object,
> +	.gem_vm_ops		=3D &drm_gem_cma_vm_ops,
> +	.dumb_create		=3D drm_gem_cma_dumb_create,
> +
> +	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd,
> +	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
> +	.gem_prime_import	=3D drm_gem_prime_import,
> +	.gem_prime_export	=3D drm_gem_prime_export,
> +	.gem_prime_get_sg_table	=3D drm_gem_cma_prime_get_sg_table,
> +	.gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table,
> +	.gem_prime_vmap		=3D drm_gem_cma_prime_vmap,
> +	.gem_prime_vunmap	=3D drm_gem_cma_prime_vunmap,
> +	.gem_prime_mmap		=3D drm_gem_cma_prime_mmap,
> +	.fops			=3D &dcss_cma_fops,
> +	.name			=3D "imx-dcss",
> +	.desc			=3D "i.MX8MQ Display Subsystem",
> +	.date			=3D "20190917",
> +	.major			=3D 1,
> +	.minor			=3D 0,
> +	.patchlevel		=3D 0,
> +};
> +
> +static const struct drm_mode_config_helper_funcs dcss_mode_config_helper=
s =3D {
> +	.atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +static void dcss_kms_mode_config_init(struct dcss_kms_dev *kms)
> +{
> +	struct drm_mode_config *config =3D &kms->base.mode_config;
> +
> +	drm_mode_config_init(&kms->base);
> +
> +	config->min_width =3D 1;
> +	config->min_height =3D 1;
> +	config->max_width =3D 4096;
> +	config->max_height =3D 4096;
> +	config->allow_fb_modifiers =3D true;
> +	config->normalize_zpos =3D true;
> +
> +	config->funcs =3D &dcss_drm_mode_config_funcs;
> +	config->helper_private =3D &dcss_mode_config_helpers;
> +}
> +
> +static const struct drm_encoder_funcs dcss_kms_simple_encoder_funcs =3D {
> +	.destroy =3D drm_encoder_cleanup,
> +};
> +
> +static int dcss_kms_setup_encoder(struct dcss_kms_dev *kms)
> +{
> +	struct drm_device *ddev =3D &kms->base;
> +	struct drm_encoder *encoder =3D &kms->encoder;
> +	struct drm_crtc *crtc =3D (struct drm_crtc *)&kms->crtc;
> +	struct drm_panel *panel;
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	ret =3D drm_of_find_panel_or_bridge(ddev->dev->of_node, 0, 0,
> +					  &panel, &bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (!bridge) {
> +		dev_err(ddev->dev, "No bridge found %d.\n", ret);
> +		return -ENODEV;
> +	}
> +
> +	encoder->possible_crtcs =3D drm_crtc_mask(crtc);
> +
> +	ret =3D drm_encoder_init(&kms->base, encoder,
> +			       &dcss_kms_simple_encoder_funcs,
> +			       DRM_MODE_ENCODER_NONE, NULL);
> +	if (ret) {
> +		dev_err(ddev->dev, "Failed initializing encoder %d.\n", ret);
> +		return ret;
> +	}
> +
> +	return drm_bridge_attach(encoder, bridge, NULL, 0);
> +}
> +
> +struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
> +{
> +	struct dcss_kms_dev *kms;
> +	struct drm_device *drm;
> +	struct dcss_crtc *crtc;
> +	int ret;
> +
> +	kms =3D devm_drm_dev_alloc(dcss->dev, &dcss_kms_driver,
> +				 struct dcss_kms_dev, base);
> +	if (IS_ERR(kms))
> +		return kms;
> +
> +	drm =3D &kms->base;
> +	crtc =3D &kms->crtc;
> +
> +	drm->dev_private =3D dcss;
> +
> +	dcss_kms_mode_config_init(kms);
> +
> +	ret =3D drm_vblank_init(drm, 1);
> +	if (ret)
> +		goto cleanup_mode_config;
> +
> +	drm->irq_enabled =3D true;
> +
> +	ret =3D dcss_crtc_init(crtc, drm);
> +	if (ret)
> +		goto cleanup_mode_config;
> +
> +	ret =3D dcss_kms_setup_encoder(kms);
> +	if (ret)
> +		goto cleanup_crtc;
> +
> +	drm_mode_config_reset(drm);
> +
> +	drm_kms_helper_poll_init(drm);
> +
> +	ret =3D drm_dev_register(drm, 0);
> +	if (ret)
> +		goto cleanup_crtc;
> +
> +	drm_fbdev_generic_setup(drm, 32);
> +
> +	return kms;
> +
> +cleanup_crtc:
> +	drm_kms_helper_poll_fini(drm);
> +	dcss_crtc_deinit(crtc, drm);
> +
> +cleanup_mode_config:
> +	drm_mode_config_cleanup(drm);
> +	drm->dev_private =3D NULL;
> +
> +	return ERR_PTR(ret);
> +}
> +
> +void dcss_kms_detach(struct dcss_kms_dev *kms)
> +{
> +	struct drm_device *drm =3D &kms->base;
> +
> +	drm_dev_unregister(drm);
> +	drm_kms_helper_poll_fini(drm);
> +	drm_atomic_helper_shutdown(drm);
> +	drm_crtc_vblank_off(&kms->crtc.base);
> +	drm->irq_enabled =3D false;
> +	drm_mode_config_cleanup(drm);
> +	dcss_crtc_deinit(&kms->crtc, drm);
> +	drm->dev_private =3D NULL;
> +}
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.h b/drivers/gpu/drm/imx/dc=
ss/dcss-kms.h
> new file mode 100644
> index 000000000000..1f51c86c6986
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#ifndef _DCSS_KMS_H_
> +#define _DCSS_KMS_H_
> +
> +#include <drm/drm_encoder.h>
> +
> +struct dcss_plane {
> +	struct drm_plane base;
> +
> +	int ch_num;
> +};
> +
> +struct dcss_crtc {
> +	struct drm_crtc		base;
> +	struct drm_crtc_state	*state;
> +
> +	struct dcss_plane	*plane[3];
> +
> +	int			irq;
> +
> +	bool disable_ctxld_kick_irq;
> +};
> +
> +struct dcss_kms_dev {
> +	struct drm_device base;
> +	struct dcss_crtc crtc;
> +	struct drm_encoder encoder;
> +};
> +
> +struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss);
> +void dcss_kms_detach(struct dcss_kms_dev *kms);
> +int dcss_crtc_init(struct dcss_crtc *crtc, struct drm_device *drm);
> +void dcss_crtc_deinit(struct dcss_crtc *crtc, struct drm_device *drm);
> +struct dcss_plane *dcss_plane_init(struct drm_device *drm,
> +				   unsigned int possible_crtcs,
> +				   enum drm_plane_type type,
> +				   unsigned int zpos);
> +
> +#endif
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/=
dcss/dcss-plane.c
> new file mode 100644
> index 000000000000..961d671f171b
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
> @@ -0,0 +1,405 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +
> +#include "dcss-dev.h"
> +#include "dcss-kms.h"
> +
> +static const u32 dcss_common_formats[] =3D {
> +	/* RGB */
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_RGBA8888,
> +	DRM_FORMAT_RGBX8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_XRGB2101010,
> +	DRM_FORMAT_XBGR2101010,
> +	DRM_FORMAT_RGBX1010102,
> +	DRM_FORMAT_BGRX1010102,
> +	DRM_FORMAT_ARGB2101010,
> +	DRM_FORMAT_ABGR2101010,
> +	DRM_FORMAT_RGBA1010102,
> +	DRM_FORMAT_BGRA1010102,
> +};
> +
> +static const u64 dcss_video_format_modifiers[] =3D {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID,
> +};
> +
> +static const u64 dcss_graphics_format_modifiers[] =3D {
> +	DRM_FORMAT_MOD_VIVANTE_TILED,
> +	DRM_FORMAT_MOD_VIVANTE_SUPER_TILED,
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID,
> +};
> +
> +static inline struct dcss_plane *to_dcss_plane(struct drm_plane *p)
> +{
> +	return container_of(p, struct dcss_plane, base);
> +}
> +
> +static inline bool dcss_plane_fb_is_linear(const struct drm_framebuffer =
*fb)
> +{
> +	return ((fb->flags & DRM_MODE_FB_MODIFIERS) =3D=3D 0) ||
> +	       ((fb->flags & DRM_MODE_FB_MODIFIERS) !=3D 0 &&
> +		fb->modifier =3D=3D DRM_FORMAT_MOD_LINEAR);
> +}
> +
> +static void dcss_plane_destroy(struct drm_plane *plane)
> +{
> +	struct dcss_plane *dcss_plane =3D container_of(plane, struct dcss_plane,
> +						     base);
> +
> +	drm_plane_cleanup(plane);
> +	kfree(dcss_plane);
> +}
> +
> +static bool dcss_plane_format_mod_supported(struct drm_plane *plane,
> +					    u32 format,
> +					    u64 modifier)
> +{
> +	switch (plane->type) {
> +	case DRM_PLANE_TYPE_PRIMARY:
> +		switch (format) {
> +		case DRM_FORMAT_ARGB8888:
> +		case DRM_FORMAT_XRGB8888:
> +		case DRM_FORMAT_ARGB2101010:
> +			return modifier =3D=3D DRM_FORMAT_MOD_LINEAR ||
> +			       modifier =3D=3D DRM_FORMAT_MOD_VIVANTE_TILED ||
> +			       modifier =3D=3D DRM_FORMAT_MOD_VIVANTE_SUPER_TILED;
> +		default:
> +			return modifier =3D=3D DRM_FORMAT_MOD_LINEAR;
> +		}
> +		break;
> +	case DRM_PLANE_TYPE_OVERLAY:
> +		return modifier =3D=3D DRM_FORMAT_MOD_LINEAR;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct drm_plane_funcs dcss_plane_funcs =3D {
> +	.update_plane		=3D drm_atomic_helper_update_plane,
> +	.disable_plane		=3D drm_atomic_helper_disable_plane,
> +	.destroy		=3D dcss_plane_destroy,
> +	.reset			=3D drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state	=3D drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state	=3D drm_atomic_helper_plane_destroy_state,
> +	.format_mod_supported	=3D dcss_plane_format_mod_supported,
> +};
> +
> +static bool dcss_plane_can_rotate(const struct drm_format_info *format,
> +				  bool mod_present, u64 modifier,
> +				  unsigned int rotation)
> +{
> +	bool linear_format =3D !mod_present ||
> +			     (mod_present && modifier =3D=3D DRM_FORMAT_MOD_LINEAR);
> +	u32 supported_rotation =3D DRM_MODE_ROTATE_0;
> +
> +	if (!format->is_yuv && linear_format)
> +		supported_rotation =3D DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
> +				     DRM_MODE_REFLECT_MASK;
> +	else if (!format->is_yuv &&
> +		 modifier =3D=3D DRM_FORMAT_MOD_VIVANTE_TILED)
> +		supported_rotation =3D DRM_MODE_ROTATE_MASK |
> +				     DRM_MODE_REFLECT_MASK;
> +	else if (format->is_yuv && linear_format &&
> +		 (format->format =3D=3D DRM_FORMAT_NV12 ||
> +		  format->format =3D=3D DRM_FORMAT_NV21))
> +		supported_rotation =3D DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
> +				     DRM_MODE_REFLECT_MASK;
> +
> +	return !!(rotation & supported_rotation);
> +}
> +
> +static bool dcss_plane_is_source_size_allowed(u16 src_w, u16 src_h, u32 =
pix_fmt)
> +{
> +	if (src_w < 64 &&
> +	    (pix_fmt =3D=3D DRM_FORMAT_NV12 || pix_fmt =3D=3D DRM_FORMAT_NV21))
> +		return false;
> +	else if (src_w < 32 &&
> +		 (pix_fmt =3D=3D DRM_FORMAT_UYVY || pix_fmt =3D=3D DRM_FORMAT_VYUY ||
> +		  pix_fmt =3D=3D DRM_FORMAT_YUYV || pix_fmt =3D=3D DRM_FORMAT_YVYU))
> +		return false;
> +
> +	return src_w >=3D 16 && src_h >=3D 8;
> +}
> +
> +static int dcss_plane_atomic_check(struct drm_plane *plane,
> +				   struct drm_plane_state *state)
> +{
> +	struct dcss_plane *dcss_plane =3D to_dcss_plane(plane);
> +	struct dcss_dev *dcss =3D plane->dev->dev_private;
> +	struct drm_framebuffer *fb =3D state->fb;
> +	bool is_primary_plane =3D plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY;
> +	struct drm_gem_cma_object *cma_obj;
> +	struct drm_crtc_state *crtc_state;
> +	int hdisplay, vdisplay;
> +	int min, max;
> +	int ret;
> +
> +	if (!fb || !state->crtc)
> +		return 0;
> +
> +	cma_obj =3D drm_fb_cma_get_gem_obj(fb, 0);
> +	WARN_ON(!cma_obj);
> +
> +	crtc_state =3D drm_atomic_get_existing_crtc_state(state->state,
> +							state->crtc);
> +
> +	hdisplay =3D crtc_state->adjusted_mode.hdisplay;
> +	vdisplay =3D crtc_state->adjusted_mode.vdisplay;
> +
> +	if (!dcss_plane_is_source_size_allowed(state->src_w >> 16,
> +					       state->src_h >> 16,
> +					       fb->format->format)) {
> +		DRM_DEBUG_KMS("Source plane size is not allowed!\n");
> +		return -EINVAL;
> +	}
> +
> +	dcss_scaler_get_min_max_ratios(dcss->scaler, dcss_plane->ch_num,
> +				       &min, &max);
> +
> +	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> +						  min, max, !is_primary_plane,
> +						  false);
> +	if (ret)
> +		return ret;
> +
> +	if (!state->visible)
> +		return 0;
> +
> +	if (!dcss_plane_can_rotate(fb->format,
> +				   !!(fb->flags & DRM_MODE_FB_MODIFIERS),
> +				   fb->modifier,
> +				   state->rotation)) {
> +		DRM_DEBUG_KMS("requested rotation is not allowed!\n");
> +		return -EINVAL;
> +	}
> +
> +	if ((state->crtc_x < 0 || state->crtc_y < 0 ||
> +	     state->crtc_x + state->crtc_w > hdisplay ||
> +	     state->crtc_y + state->crtc_h > vdisplay) &&
> +	    !dcss_plane_fb_is_linear(fb)) {
> +		DRM_DEBUG_KMS("requested cropping operation is not allowed!\n");
> +		return -EINVAL;
> +	}
> +
> +	if ((fb->flags & DRM_MODE_FB_MODIFIERS) &&
> +	    !plane->funcs->format_mod_supported(plane,
> +				fb->format->format,
> +				fb->modifier)) {
> +		DRM_DEBUG_KMS("Invalid modifier: %llx", fb->modifier);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void dcss_plane_atomic_set_base(struct dcss_plane *dcss_plane)
> +{
> +	struct drm_plane *plane =3D &dcss_plane->base;
> +	struct drm_plane_state *state =3D plane->state;
> +	struct dcss_dev *dcss =3D plane->dev->dev_private;
> +	struct drm_framebuffer *fb =3D state->fb;
> +	const struct drm_format_info *format =3D fb->format;
> +	struct drm_gem_cma_object *cma_obj =3D drm_fb_cma_get_gem_obj(fb, 0);
> +	unsigned long p1_ba =3D 0, p2_ba =3D 0;
> +
> +	if (!format->is_yuv ||
> +	    format->format =3D=3D DRM_FORMAT_NV12 ||
> +	    format->format =3D=3D DRM_FORMAT_NV21)
> +		p1_ba =3D cma_obj->paddr + fb->offsets[0] +
> +			fb->pitches[0] * (state->src.y1 >> 16) +
> +			format->char_per_block[0] * (state->src.x1 >> 16);
> +	else if (format->format =3D=3D DRM_FORMAT_UYVY ||
> +		 format->format =3D=3D DRM_FORMAT_VYUY ||
> +		 format->format =3D=3D DRM_FORMAT_YUYV ||
> +		 format->format =3D=3D DRM_FORMAT_YVYU)
> +		p1_ba =3D cma_obj->paddr + fb->offsets[0] +
> +			fb->pitches[0] * (state->src.y1 >> 16) +
> +			2 * format->char_per_block[0] * (state->src.x1 >> 17);
> +
> +	if (format->format =3D=3D DRM_FORMAT_NV12 ||
> +	    format->format =3D=3D DRM_FORMAT_NV21)
> +		p2_ba =3D cma_obj->paddr + fb->offsets[1] +
> +			(((fb->pitches[1] >> 1) * (state->src.y1 >> 17) +
> +			(state->src.x1 >> 17)) << 1);
> +
> +	dcss_dpr_addr_set(dcss->dpr, dcss_plane->ch_num, p1_ba, p2_ba,
> +			  fb->pitches[0]);
> +}
> +
> +static bool dcss_plane_needs_setup(struct drm_plane_state *state,
> +				   struct drm_plane_state *old_state)
> +{
> +	struct drm_framebuffer *fb =3D state->fb;
> +	struct drm_framebuffer *old_fb =3D old_state->fb;
> +
> +	return state->crtc_x !=3D old_state->crtc_x ||
> +	       state->crtc_y !=3D old_state->crtc_y ||
> +	       state->crtc_w !=3D old_state->crtc_w ||
> +	       state->crtc_h !=3D old_state->crtc_h ||
> +	       state->src_x  !=3D old_state->src_x  ||
> +	       state->src_y  !=3D old_state->src_y  ||
> +	       state->src_w  !=3D old_state->src_w  ||
> +	       state->src_h  !=3D old_state->src_h  ||
> +	       fb->format->format !=3D old_fb->format->format ||
> +	       fb->modifier  !=3D old_fb->modifier ||
> +	       state->rotation !=3D old_state->rotation;
> +}
> +
> +static void dcss_plane_atomic_update(struct drm_plane *plane,
> +				     struct drm_plane_state *old_state)
> +{
> +	struct drm_plane_state *state =3D plane->state;
> +	struct dcss_plane *dcss_plane =3D to_dcss_plane(plane);
> +	struct dcss_dev *dcss =3D plane->dev->dev_private;
> +	struct drm_framebuffer *fb =3D state->fb;
> +	u32 pixel_format;
> +	struct drm_crtc_state *crtc_state;
> +	bool modifiers_present;
> +	u32 src_w, src_h, dst_w, dst_h;
> +	struct drm_rect src, dst;
> +	bool enable =3D true;
> +
> +	if (!fb || !state->crtc || !state->visible)
> +		return;
> +
> +	pixel_format =3D state->fb->format->format;
> +	crtc_state =3D state->crtc->state;
> +	modifiers_present =3D !!(fb->flags & DRM_MODE_FB_MODIFIERS);
> +
> +	if (old_state->fb && !drm_atomic_crtc_needs_modeset(crtc_state) &&
> +	    !dcss_plane_needs_setup(state, old_state)) {
> +		dcss_plane_atomic_set_base(dcss_plane);
> +		return;
> +	}
> +
> +	src =3D plane->state->src;
> +	dst =3D plane->state->dst;
> +
> +	/*
> +	 * The width and height after clipping.
> +	 */
> +	src_w =3D drm_rect_width(&src) >> 16;
> +	src_h =3D drm_rect_height(&src) >> 16;
> +	dst_w =3D drm_rect_width(&dst);
> +	dst_h =3D drm_rect_height(&dst);
> +
> +	if (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY &&
> +	    modifiers_present && fb->modifier =3D=3D DRM_FORMAT_MOD_LINEAR)
> +		modifiers_present =3D false;
> +
> +	dcss_dpr_format_set(dcss->dpr, dcss_plane->ch_num, state->fb->format,
> +			    modifiers_present ? fb->modifier :
> +						DRM_FORMAT_MOD_LINEAR);
> +	dcss_dpr_set_res(dcss->dpr, dcss_plane->ch_num, src_w, src_h);
> +	dcss_dpr_set_rotation(dcss->dpr, dcss_plane->ch_num,
> +			      state->rotation);
> +
> +	dcss_plane_atomic_set_base(dcss_plane);
> +
> +	dcss_scaler_setup(dcss->scaler, dcss_plane->ch_num,
> +			  state->fb->format, src_w, src_h,
> +			  dst_w, dst_h,
> +			  drm_mode_vrefresh(&crtc_state->mode));
> +
> +	dcss_dtg_plane_pos_set(dcss->dtg, dcss_plane->ch_num,
> +			       dst.x1, dst.y1, dst_w, dst_h);
> +	dcss_dtg_plane_alpha_set(dcss->dtg, dcss_plane->ch_num,
> +				 fb->format, state->alpha >> 8);
> +
> +	if (!dcss_plane->ch_num && (state->alpha >> 8) =3D=3D 0)
> +		enable =3D false;
> +
> +	dcss_dpr_enable(dcss->dpr, dcss_plane->ch_num, enable);
> +	dcss_scaler_ch_enable(dcss->scaler, dcss_plane->ch_num, enable);
> +
> +	if (!enable)
> +		dcss_dtg_plane_pos_set(dcss->dtg, dcss_plane->ch_num,
> +				       0, 0, 0, 0);
> +
> +	dcss_dtg_ch_enable(dcss->dtg, dcss_plane->ch_num, enable);
> +}
> +
> +static void dcss_plane_atomic_disable(struct drm_plane *plane,
> +				      struct drm_plane_state *old_state)
> +{
> +	struct dcss_plane *dcss_plane =3D to_dcss_plane(plane);
> +	struct dcss_dev *dcss =3D plane->dev->dev_private;
> +
> +	dcss_dpr_enable(dcss->dpr, dcss_plane->ch_num, false);
> +	dcss_scaler_ch_enable(dcss->scaler, dcss_plane->ch_num, false);
> +	dcss_dtg_plane_pos_set(dcss->dtg, dcss_plane->ch_num, 0, 0, 0, 0);
> +	dcss_dtg_ch_enable(dcss->dtg, dcss_plane->ch_num, false);
> +}
> +
> +static const struct drm_plane_helper_funcs dcss_plane_helper_funcs =3D {
> +	.prepare_fb =3D drm_gem_fb_prepare_fb,
> +	.atomic_check =3D dcss_plane_atomic_check,
> +	.atomic_update =3D dcss_plane_atomic_update,
> +	.atomic_disable =3D dcss_plane_atomic_disable,
> +};
> +
> +struct dcss_plane *dcss_plane_init(struct drm_device *drm,
> +				   unsigned int possible_crtcs,
> +				   enum drm_plane_type type,
> +				   unsigned int zpos)
> +{
> +	struct dcss_plane *dcss_plane;
> +	const u64 *format_modifiers =3D dcss_video_format_modifiers;
> +	int ret;
> +
> +	if (zpos > 2)
> +		return ERR_PTR(-EINVAL);
> +
> +	dcss_plane =3D kzalloc(sizeof(*dcss_plane), GFP_KERNEL);
> +	if (!dcss_plane) {
> +		DRM_ERROR("failed to allocate plane\n");
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +		format_modifiers =3D dcss_graphics_format_modifiers;
> +
> +	ret =3D drm_universal_plane_init(drm, &dcss_plane->base, possible_crtcs,
> +				       &dcss_plane_funcs, dcss_common_formats,
> +				       ARRAY_SIZE(dcss_common_formats),
> +				       format_modifiers, type, NULL);
> +	if (ret) {
> +		DRM_ERROR("failed to initialize plane\n");
> +		kfree(dcss_plane);
> +		return ERR_PTR(ret);
> +	}
> +
> +	drm_plane_helper_add(&dcss_plane->base, &dcss_plane_helper_funcs);
> +
> +	ret =3D drm_plane_create_zpos_immutable_property(&dcss_plane->base, zpo=
s);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	drm_plane_create_rotation_property(&dcss_plane->base,
> +					   DRM_MODE_ROTATE_0,
> +					   DRM_MODE_ROTATE_0   |
> +					   DRM_MODE_ROTATE_90  |
> +					   DRM_MODE_ROTATE_180 |
> +					   DRM_MODE_ROTATE_270 |
> +					   DRM_MODE_REFLECT_X  |
> +					   DRM_MODE_REFLECT_Y);
> +
> +	dcss_plane->ch_num =3D zpos;
> +
> +	return dcss_plane;
> +}
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-scaler.c b/drivers/gpu/drm/imx=
/dcss/dcss-scaler.c
> new file mode 100644
> index 000000000000..cd21905de580
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
> @@ -0,0 +1,826 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 NXP.
> + *
> + * Scaling algorithms were contributed by Dzung Hoang <dzung.hoang@nxp.c=
om>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/slab.h>
> +
> +#include "dcss-dev.h"
> +
> +#define DCSS_SCALER_CTRL			0x00
> +#define   SCALER_EN				BIT(0)
> +#define   REPEAT_EN				BIT(4)
> +#define   SCALE2MEM_EN				BIT(8)
> +#define   MEM2OFIFO_EN				BIT(12)
> +#define DCSS_SCALER_OFIFO_CTRL			0x04
> +#define   OFIFO_LOW_THRES_POS			0
> +#define   OFIFO_LOW_THRES_MASK			GENMASK(9, 0)
> +#define   OFIFO_HIGH_THRES_POS			16
> +#define   OFIFO_HIGH_THRES_MASK			GENMASK(25, 16)
> +#define   UNDERRUN_DETECT_CLR			BIT(26)
> +#define   LOW_THRES_DETECT_CLR			BIT(27)
> +#define   HIGH_THRES_DETECT_CLR			BIT(28)
> +#define   UNDERRUN_DETECT_EN			BIT(29)
> +#define   LOW_THRES_DETECT_EN			BIT(30)
> +#define   HIGH_THRES_DETECT_EN			BIT(31)
> +#define DCSS_SCALER_SDATA_CTRL			0x08
> +#define   YUV_EN				BIT(0)
> +#define   RTRAM_8LINES				BIT(1)
> +#define   Y_UV_BYTE_SWAP			BIT(4)
> +#define   A2R10G10B10_FORMAT_POS		8
> +#define   A2R10G10B10_FORMAT_MASK		GENMASK(11, 8)
> +#define DCSS_SCALER_BIT_DEPTH			0x0C
> +#define   LUM_BIT_DEPTH_POS			0
> +#define   LUM_BIT_DEPTH_MASK			GENMASK(1, 0)
> +#define   CHR_BIT_DEPTH_POS			4
> +#define   CHR_BIT_DEPTH_MASK			GENMASK(5, 4)
> +#define DCSS_SCALER_SRC_FORMAT			0x10
> +#define DCSS_SCALER_DST_FORMAT			0x14
> +#define   FORMAT_MASK				GENMASK(1, 0)
> +#define DCSS_SCALER_SRC_LUM_RES			0x18
> +#define DCSS_SCALER_SRC_CHR_RES			0x1C
> +#define DCSS_SCALER_DST_LUM_RES			0x20
> +#define DCSS_SCALER_DST_CHR_RES			0x24
> +#define   WIDTH_POS				0
> +#define   WIDTH_MASK				GENMASK(11, 0)
> +#define   HEIGHT_POS				16
> +#define   HEIGHT_MASK				GENMASK(27, 16)
> +#define DCSS_SCALER_V_LUM_START			0x48
> +#define   V_START_MASK				GENMASK(15, 0)
> +#define DCSS_SCALER_V_LUM_INC			0x4C
> +#define   V_INC_MASK				GENMASK(15, 0)
> +#define DCSS_SCALER_H_LUM_START			0x50
> +#define   H_START_MASK				GENMASK(18, 0)
> +#define DCSS_SCALER_H_LUM_INC			0x54
> +#define   H_INC_MASK				GENMASK(15, 0)
> +#define DCSS_SCALER_V_CHR_START			0x58
> +#define DCSS_SCALER_V_CHR_INC			0x5C
> +#define DCSS_SCALER_H_CHR_START			0x60
> +#define DCSS_SCALER_H_CHR_INC			0x64
> +#define DCSS_SCALER_COEF_VLUM			0x80
> +#define DCSS_SCALER_COEF_HLUM			0x140
> +#define DCSS_SCALER_COEF_VCHR			0x200
> +#define DCSS_SCALER_COEF_HCHR			0x300
> +
> +struct dcss_scaler_ch {
> +	void __iomem *base_reg;
> +	u32 base_ofs;
> +	struct dcss_scaler *scl;
> +
> +	u32 sdata_ctrl;
> +	u32 scaler_ctrl;
> +
> +	bool scaler_ctrl_chgd;
> +
> +	u32 c_vstart;
> +	u32 c_hstart;
> +};
> +
> +struct dcss_scaler {
> +	struct device *dev;
> +
> +	struct dcss_ctxld *ctxld;
> +	u32 ctx_id;
> +
> +	struct dcss_scaler_ch ch[3];
> +};
> +
> +/* scaler coefficients generator */
> +#define PSC_FRAC_BITS 30
> +#define PSC_FRAC_SCALE BIT(PSC_FRAC_BITS)
> +#define PSC_BITS_FOR_PHASE 4
> +#define PSC_NUM_PHASES 16
> +#define PSC_STORED_PHASES (PSC_NUM_PHASES / 2 + 1)
> +#define PSC_NUM_TAPS 7
> +#define PSC_NUM_TAPS_RGBA 5
> +#define PSC_COEFF_PRECISION 10
> +#define PSC_PHASE_FRACTION_BITS 13
> +#define PSC_PHASE_MASK (PSC_NUM_PHASES - 1)
> +#define PSC_Q_FRACTION 19
> +#define PSC_Q_ROUND_OFFSET (1 << (PSC_Q_FRACTION - 1))
> +
> +/**
> + * mult_q() - Performs fixed-point multiplication.
> + * @A: multiplier
> + * @B: multiplicand
> + */
> +static int mult_q(int A, int B)
> +{
> +	int result;
> +	s64 temp;
> +
> +	temp =3D (int64_t)A * (int64_t)B;
> +	temp +=3D PSC_Q_ROUND_OFFSET;
> +	result =3D (int)(temp >> PSC_Q_FRACTION);
> +	return result;
> +}
> +
> +/**
> + * div_q() - Performs fixed-point division.
> + * @A: dividend
> + * @B: divisor
> + */
> +static int div_q(int A, int B)
> +{
> +	int result;
> +	s64 temp;
> +
> +	temp =3D (int64_t)A << PSC_Q_FRACTION;
> +	if ((temp >=3D 0 && B >=3D 0) || (temp < 0 && B < 0))
> +		temp +=3D B / 2;
> +	else
> +		temp -=3D B / 2;
> +
> +	result =3D (int)(temp / B);
> +	return result;
> +}
> +
> +/**
> + * exp_approx_q() - Compute approximation to exp(x) function using Taylor
> + *		    series.
> + * @x: fixed-point argument of exp function
> + */
> +static int exp_approx_q(int x)
> +{
> +	int sum =3D 1 << PSC_Q_FRACTION;
> +	int term =3D 1 << PSC_Q_FRACTION;
> +
> +	term =3D mult_q(term, div_q(x, 1 << PSC_Q_FRACTION));
> +	sum +=3D term;
> +	term =3D mult_q(term, div_q(x, 2 << PSC_Q_FRACTION));
> +	sum +=3D term;
> +	term =3D mult_q(term, div_q(x, 3 << PSC_Q_FRACTION));
> +	sum +=3D term;
> +	term =3D mult_q(term, div_q(x, 4 << PSC_Q_FRACTION));
> +	sum +=3D term;
> +
> +	return sum;
> +}
> +
> +/**
> + * dcss_scaler_gaussian_filter() - Generate gaussian prototype filter.
> + * @fc_q: fixed-point cutoff frequency normalized to range [0, 1]
> + * @use_5_taps: indicates whether to use 5 taps or 7 taps
> + * @coef: output filter coefficients
> + */
> +static void dcss_scaler_gaussian_filter(int fc_q, bool use_5_taps,
> +					bool phase0_identity,
> +					int coef[][PSC_NUM_TAPS])
> +{
> +	int sigma_q, g0_q, g1_q, g2_q;
> +	int tap_cnt1, tap_cnt2, tap_idx, phase_cnt;
> +	int mid;
> +	int phase;
> +	int i;
> +	int taps;
> +
> +	if (use_5_taps)
> +		for (phase =3D 0; phase < PSC_STORED_PHASES; phase++) {
> +			coef[phase][0] =3D 0;
> +			coef[phase][PSC_NUM_TAPS - 1] =3D 0;
> +		}
> +
> +	/* seed coefficient scanner */
> +	taps =3D use_5_taps ? PSC_NUM_TAPS_RGBA : PSC_NUM_TAPS;
> +	mid =3D (PSC_NUM_PHASES * taps) / 2 - 1;
> +	phase_cnt =3D (PSC_NUM_PHASES * (PSC_NUM_TAPS + 1)) / 2;
> +	tap_cnt1 =3D (PSC_NUM_PHASES * PSC_NUM_TAPS) / 2;
> +	tap_cnt2 =3D (PSC_NUM_PHASES * PSC_NUM_TAPS) / 2;
> +
> +	/* seed gaussian filter generator */
> +	sigma_q =3D div_q(PSC_Q_ROUND_OFFSET, fc_q);
> +	g0_q =3D 1 << PSC_Q_FRACTION;
> +	g1_q =3D exp_approx_q(div_q(-PSC_Q_ROUND_OFFSET,
> +				  mult_q(sigma_q, sigma_q)));
> +	g2_q =3D mult_q(g1_q, g1_q);
> +	coef[phase_cnt & PSC_PHASE_MASK][tap_cnt1 >> PSC_BITS_FOR_PHASE] =3D g0=
_q;
> +
> +	for (i =3D 0; i < mid; i++) {
> +		phase_cnt++;
> +		tap_cnt1--;
> +		tap_cnt2++;
> +
> +		g0_q =3D mult_q(g0_q, g1_q);
> +		g1_q =3D mult_q(g1_q, g2_q);
> +
> +		if ((phase_cnt & PSC_PHASE_MASK) <=3D 8) {
> +			tap_idx =3D tap_cnt1 >> PSC_BITS_FOR_PHASE;
> +			coef[phase_cnt & PSC_PHASE_MASK][tap_idx] =3D g0_q;
> +		}
> +		if (((-phase_cnt) & PSC_PHASE_MASK) <=3D 8) {
> +			tap_idx =3D tap_cnt2 >> PSC_BITS_FOR_PHASE;
> +			coef[(-phase_cnt) & PSC_PHASE_MASK][tap_idx] =3D g0_q;
> +		}
> +	}
> +
> +	phase_cnt++;
> +	tap_cnt1--;
> +	coef[phase_cnt & PSC_PHASE_MASK][tap_cnt1 >> PSC_BITS_FOR_PHASE] =3D 0;
> +
> +	/* override phase 0 with identity filter if specified */
> +	if (phase0_identity)
> +		for (i =3D 0; i < PSC_NUM_TAPS; i++)
> +			coef[0][i] =3D i =3D=3D (PSC_NUM_TAPS >> 1) ?
> +						(1 << PSC_COEFF_PRECISION) : 0;
> +
> +	/* normalize coef */
> +	for (phase =3D 0; phase < PSC_STORED_PHASES; phase++) {
> +		int sum =3D 0;
> +		s64 ll_temp;
> +
> +		for (i =3D 0; i < PSC_NUM_TAPS; i++)
> +			sum +=3D coef[phase][i];
> +		for (i =3D 0; i < PSC_NUM_TAPS; i++) {
> +			ll_temp =3D coef[phase][i];
> +			ll_temp <<=3D PSC_COEFF_PRECISION;
> +			ll_temp +=3D sum >> 1;
> +			ll_temp /=3D sum;
> +			coef[phase][i] =3D (int)ll_temp;
> +		}
> +	}
> +}
> +
> +/**
> + * dcss_scaler_filter_design() - Compute filter coefficients using
> + *				 Gaussian filter.
> + * @src_length: length of input
> + * @dst_length: length of output
> + * @use_5_taps: 0 for 7 taps per phase, 1 for 5 taps
> + * @coef: output coefficients
> + */
> +static void dcss_scaler_filter_design(int src_length, int dst_length,
> +				      bool use_5_taps, bool phase0_identity,
> +				      int coef[][PSC_NUM_TAPS])
> +{
> +	int fc_q;
> +
> +	/* compute cutoff frequency */
> +	if (dst_length >=3D src_length)
> +		fc_q =3D div_q(1, PSC_NUM_PHASES);
> +	else
> +		fc_q =3D div_q(dst_length, src_length * PSC_NUM_PHASES);
> +
> +	/* compute gaussian filter coefficients */
> +	dcss_scaler_gaussian_filter(fc_q, use_5_taps, phase0_identity, coef);
> +}
> +
> +static void dcss_scaler_write(struct dcss_scaler_ch *ch, u32 val, u32 of=
s)
> +{
> +	struct dcss_scaler *scl =3D ch->scl;
> +
> +	dcss_ctxld_write(scl->ctxld, scl->ctx_id, val, ch->base_ofs + ofs);
> +}
> +
> +static int dcss_scaler_ch_init_all(struct dcss_scaler *scl,
> +				   unsigned long scaler_base)
> +{
> +	struct dcss_scaler_ch *ch;
> +	int i;
> +
> +	for (i =3D 0; i < 3; i++) {
> +		ch =3D &scl->ch[i];
> +
> +		ch->base_ofs =3D scaler_base + i * 0x400;
> +
> +		ch->base_reg =3D ioremap(ch->base_ofs, SZ_4K);
> +		if (!ch->base_reg) {
> +			dev_err(scl->dev, "scaler: unable to remap ch base\n");
> +			return -ENOMEM;
> +		}
> +
> +		ch->scl =3D scl;
> +	}
> +
> +	return 0;
> +}
> +
> +int dcss_scaler_init(struct dcss_dev *dcss, unsigned long scaler_base)
> +{
> +	struct dcss_scaler *scaler;
> +
> +	scaler =3D kzalloc(sizeof(*scaler), GFP_KERNEL);
> +	if (!scaler)
> +		return -ENOMEM;
> +
> +	dcss->scaler =3D scaler;
> +	scaler->dev =3D dcss->dev;
> +	scaler->ctxld =3D dcss->ctxld;
> +	scaler->ctx_id =3D CTX_SB_HP;
> +
> +	if (dcss_scaler_ch_init_all(scaler, scaler_base)) {
> +		int i;
> +
> +		for (i =3D 0; i < 3; i++) {
> +			if (scaler->ch[i].base_reg)
> +				iounmap(scaler->ch[i].base_reg);
> +		}
> +
> +		kfree(scaler);
> +
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +void dcss_scaler_exit(struct dcss_scaler *scl)
> +{
> +	int ch_no;
> +
> +	for (ch_no =3D 0; ch_no < 3; ch_no++) {
> +		struct dcss_scaler_ch *ch =3D &scl->ch[ch_no];
> +
> +		dcss_writel(0, ch->base_reg + DCSS_SCALER_CTRL);
> +
> +		if (ch->base_reg)
> +			iounmap(ch->base_reg);
> +	}
> +
> +	kfree(scl);
> +}
> +
> +void dcss_scaler_ch_enable(struct dcss_scaler *scl, int ch_num, bool en)
> +{
> +	struct dcss_scaler_ch *ch =3D &scl->ch[ch_num];
> +	u32 scaler_ctrl;
> +
> +	scaler_ctrl =3D en ? SCALER_EN | REPEAT_EN : 0;
> +
> +	if (en)
> +		dcss_scaler_write(ch, ch->sdata_ctrl, DCSS_SCALER_SDATA_CTRL);
> +
> +	if (ch->scaler_ctrl !=3D scaler_ctrl)
> +		ch->scaler_ctrl_chgd =3D true;
> +
> +	ch->scaler_ctrl =3D scaler_ctrl;
> +}
> +
> +static void dcss_scaler_yuv_enable(struct dcss_scaler_ch *ch, bool en)
> +{
> +	ch->sdata_ctrl &=3D ~YUV_EN;
> +	ch->sdata_ctrl |=3D en ? YUV_EN : 0;
> +}
> +
> +static void dcss_scaler_rtr_8lines_enable(struct dcss_scaler_ch *ch, boo=
l en)
> +{
> +	ch->sdata_ctrl &=3D ~RTRAM_8LINES;
> +	ch->sdata_ctrl |=3D en ? RTRAM_8LINES : 0;
> +}
> +
> +static void dcss_scaler_bit_depth_set(struct dcss_scaler_ch *ch, int dep=
th)
> +{
> +	u32 val;
> +
> +	val =3D depth =3D=3D 30 ? 2 : 0;
> +
> +	dcss_scaler_write(ch,
> +			  ((val << CHR_BIT_DEPTH_POS) & CHR_BIT_DEPTH_MASK) |
> +			  ((val << LUM_BIT_DEPTH_POS) & LUM_BIT_DEPTH_MASK),
> +			  DCSS_SCALER_BIT_DEPTH);
> +}
> +
> +enum buffer_format {
> +	BUF_FMT_YUV420,
> +	BUF_FMT_YUV422,
> +	BUF_FMT_ARGB8888_YUV444,
> +};
> +
> +enum chroma_location {
> +	PSC_LOC_HORZ_0_VERT_1_OVER_4 =3D 0,
> +	PSC_LOC_HORZ_1_OVER_4_VERT_1_OVER_4 =3D 1,
> +	PSC_LOC_HORZ_0_VERT_0 =3D 2,
> +	PSC_LOC_HORZ_1_OVER_4_VERT_0 =3D 3,
> +	PSC_LOC_HORZ_0_VERT_1_OVER_2 =3D 4,
> +	PSC_LOC_HORZ_1_OVER_4_VERT_1_OVER_2 =3D 5
> +};
> +
> +static void dcss_scaler_format_set(struct dcss_scaler_ch *ch,
> +				   enum buffer_format src_fmt,
> +				   enum buffer_format dst_fmt)
> +{
> +	dcss_scaler_write(ch, src_fmt, DCSS_SCALER_SRC_FORMAT);
> +	dcss_scaler_write(ch, dst_fmt, DCSS_SCALER_DST_FORMAT);
> +}
> +
> +static void dcss_scaler_res_set(struct dcss_scaler_ch *ch,
> +				int src_xres, int src_yres,
> +				int dst_xres, int dst_yres,
> +				u32 pix_format, enum buffer_format dst_format)
> +{
> +	u32 lsrc_xres, lsrc_yres, csrc_xres, csrc_yres;
> +	u32 ldst_xres, ldst_yres, cdst_xres, cdst_yres;
> +	bool src_is_444 =3D true;
> +
> +	lsrc_xres =3D src_xres;
> +	csrc_xres =3D src_xres;
> +	lsrc_yres =3D src_yres;
> +	csrc_yres =3D src_yres;
> +	ldst_xres =3D dst_xres;
> +	cdst_xres =3D dst_xres;
> +	ldst_yres =3D dst_yres;
> +	cdst_yres =3D dst_yres;
> +
> +	if (pix_format =3D=3D DRM_FORMAT_UYVY || pix_format =3D=3D DRM_FORMAT_V=
YUY ||
> +	    pix_format =3D=3D DRM_FORMAT_YUYV || pix_format =3D=3D DRM_FORMAT_Y=
VYU) {
> +		csrc_xres >>=3D 1;
> +		src_is_444 =3D false;
> +	} else if (pix_format =3D=3D DRM_FORMAT_NV12 ||
> +		   pix_format =3D=3D DRM_FORMAT_NV21) {
> +		csrc_xres >>=3D 1;
> +		csrc_yres >>=3D 1;
> +		src_is_444 =3D false;
> +	}
> +
> +	if (dst_format =3D=3D BUF_FMT_YUV422)
> +		cdst_xres >>=3D 1;
> +
> +	/* for 4:4:4 to 4:2:2 conversion, source height should be 1 less */
> +	if (src_is_444 && dst_format =3D=3D BUF_FMT_YUV422) {
> +		lsrc_yres--;
> +		csrc_yres--;
> +	}
> +
> +	dcss_scaler_write(ch, (((lsrc_yres - 1) << HEIGHT_POS) & HEIGHT_MASK) |
> +			       (((lsrc_xres - 1) << WIDTH_POS) & WIDTH_MASK),
> +			  DCSS_SCALER_SRC_LUM_RES);
> +	dcss_scaler_write(ch, (((csrc_yres - 1) << HEIGHT_POS) & HEIGHT_MASK) |
> +			       (((csrc_xres - 1) << WIDTH_POS) & WIDTH_MASK),
> +			  DCSS_SCALER_SRC_CHR_RES);
> +	dcss_scaler_write(ch, (((ldst_yres - 1) << HEIGHT_POS) & HEIGHT_MASK) |
> +			       (((ldst_xres - 1) << WIDTH_POS) & WIDTH_MASK),
> +			  DCSS_SCALER_DST_LUM_RES);
> +	dcss_scaler_write(ch, (((cdst_yres - 1) << HEIGHT_POS) & HEIGHT_MASK) |
> +			       (((cdst_xres - 1) << WIDTH_POS) & WIDTH_MASK),
> +			  DCSS_SCALER_DST_CHR_RES);
> +}
> +
> +#define downscale_fp(factor, fp_pos)		((factor) << (fp_pos))
> +#define upscale_fp(factor, fp_pos)		((1 << (fp_pos)) / (factor))
> +
> +struct dcss_scaler_factors {
> +	int downscale;
> +	int upscale;
> +};
> +
> +static const struct dcss_scaler_factors dcss_scaler_factors[] =3D {
> +	{3, 8}, {5, 8}, {5, 8},
> +};
> +
> +static void dcss_scaler_fractions_set(struct dcss_scaler_ch *ch,
> +				      int src_xres, int src_yres,
> +				      int dst_xres, int dst_yres,
> +				      u32 src_format, u32 dst_format,
> +				      enum chroma_location src_chroma_loc)
> +{
> +	int src_c_xres, src_c_yres, dst_c_xres, dst_c_yres;
> +	u32 l_vinc, l_hinc, c_vinc, c_hinc;
> +	u32 c_vstart, c_hstart;
> +
> +	src_c_xres =3D src_xres;
> +	src_c_yres =3D src_yres;
> +	dst_c_xres =3D dst_xres;
> +	dst_c_yres =3D dst_yres;
> +
> +	c_vstart =3D 0;
> +	c_hstart =3D 0;
> +
> +	/* adjustments for source chroma location */
> +	if (src_format =3D=3D BUF_FMT_YUV420) {
> +		/* vertical input chroma position adjustment */
> +		switch (src_chroma_loc) {
> +		case PSC_LOC_HORZ_0_VERT_1_OVER_4:
> +		case PSC_LOC_HORZ_1_OVER_4_VERT_1_OVER_4:
> +			/*
> +			 * move chroma up to first luma line
> +			 * (1/4 chroma input line spacing)
> +			 */
> +			c_vstart -=3D (1 << (PSC_PHASE_FRACTION_BITS - 2));
> +			break;
> +		case PSC_LOC_HORZ_0_VERT_1_OVER_2:
> +		case PSC_LOC_HORZ_1_OVER_4_VERT_1_OVER_2:
> +			/*
> +			 * move chroma up to first luma line
> +			 * (1/2 chroma input line spacing)
> +			 */
> +			c_vstart -=3D (1 << (PSC_PHASE_FRACTION_BITS - 1));
> +			break;
> +		default:
> +			break;
> +		}
> +		/* horizontal input chroma position adjustment */
> +		switch (src_chroma_loc) {
> +		case PSC_LOC_HORZ_1_OVER_4_VERT_1_OVER_4:
> +		case PSC_LOC_HORZ_1_OVER_4_VERT_0:
> +		case PSC_LOC_HORZ_1_OVER_4_VERT_1_OVER_2:
> +			/* move chroma left 1/4 chroma input sample spacing */
> +			c_hstart -=3D (1 << (PSC_PHASE_FRACTION_BITS - 2));
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	/* adjustments to chroma resolution */
> +	if (src_format =3D=3D BUF_FMT_YUV420) {
> +		src_c_xres >>=3D 1;
> +		src_c_yres >>=3D 1;
> +	} else if (src_format =3D=3D BUF_FMT_YUV422) {
> +		src_c_xres >>=3D 1;
> +	}
> +
> +	if (dst_format =3D=3D BUF_FMT_YUV422)
> +		dst_c_xres >>=3D 1;
> +
> +	l_vinc =3D ((src_yres << 13) + (dst_yres >> 1)) / dst_yres;
> +	c_vinc =3D ((src_c_yres << 13) + (dst_c_yres >> 1)) / dst_c_yres;
> +	l_hinc =3D ((src_xres << 13) + (dst_xres >> 1)) / dst_xres;
> +	c_hinc =3D ((src_c_xres << 13) + (dst_c_xres >> 1)) / dst_c_xres;
> +
> +	/* save chroma start phase */
> +	ch->c_vstart =3D c_vstart;
> +	ch->c_hstart =3D c_hstart;
> +
> +	dcss_scaler_write(ch, 0, DCSS_SCALER_V_LUM_START);
> +	dcss_scaler_write(ch, l_vinc, DCSS_SCALER_V_LUM_INC);
> +
> +	dcss_scaler_write(ch, 0, DCSS_SCALER_H_LUM_START);
> +	dcss_scaler_write(ch, l_hinc, DCSS_SCALER_H_LUM_INC);
> +
> +	dcss_scaler_write(ch, c_vstart, DCSS_SCALER_V_CHR_START);
> +	dcss_scaler_write(ch, c_vinc, DCSS_SCALER_V_CHR_INC);
> +
> +	dcss_scaler_write(ch, c_hstart, DCSS_SCALER_H_CHR_START);
> +	dcss_scaler_write(ch, c_hinc, DCSS_SCALER_H_CHR_INC);
> +}
> +
> +int dcss_scaler_get_min_max_ratios(struct dcss_scaler *scl, int ch_num,
> +				   int *min, int *max)
> +{
> +	*min =3D upscale_fp(dcss_scaler_factors[ch_num].upscale, 16);
> +	*max =3D downscale_fp(dcss_scaler_factors[ch_num].downscale, 16);
> +
> +	return 0;
> +}
> +
> +static void dcss_scaler_program_5_coef_set(struct dcss_scaler_ch *ch,
> +					   int base_addr,
> +					   int coef[][PSC_NUM_TAPS])
> +{
> +	int i, phase;
> +
> +	for (i =3D 0; i < PSC_STORED_PHASES; i++) {
> +		dcss_scaler_write(ch, ((coef[i][1] & 0xfff) << 16 |
> +				       (coef[i][2] & 0xfff) << 4  |
> +				       (coef[i][3] & 0xf00) >> 8),
> +				  base_addr + i * sizeof(u32));
> +		dcss_scaler_write(ch, ((coef[i][3] & 0x0ff) << 20 |
> +				       (coef[i][4] & 0xfff) << 8  |
> +				       (coef[i][5] & 0xff0) >> 4),
> +				  base_addr + 0x40 + i * sizeof(u32));
> +		dcss_scaler_write(ch, ((coef[i][5] & 0x00f) << 24),
> +				  base_addr + 0x80 + i * sizeof(u32));
> +	}
> +
> +	/* reverse both phase and tap orderings */
> +	for (phase =3D (PSC_NUM_PHASES >> 1) - 1;
> +			i < PSC_NUM_PHASES; i++, phase--) {
> +		dcss_scaler_write(ch, ((coef[phase][5] & 0xfff) << 16 |
> +				       (coef[phase][4] & 0xfff) << 4  |
> +				       (coef[phase][3] & 0xf00) >> 8),
> +				  base_addr + i * sizeof(u32));
> +		dcss_scaler_write(ch, ((coef[phase][3] & 0x0ff) << 20 |
> +				       (coef[phase][2] & 0xfff) << 8  |
> +				       (coef[phase][1] & 0xff0) >> 4),
> +				  base_addr + 0x40 + i * sizeof(u32));
> +		dcss_scaler_write(ch, ((coef[phase][1] & 0x00f) << 24),
> +				  base_addr + 0x80 + i * sizeof(u32));
> +	}
> +}
> +
> +static void dcss_scaler_program_7_coef_set(struct dcss_scaler_ch *ch,
> +					   int base_addr,
> +					   int coef[][PSC_NUM_TAPS])
> +{
> +	int i, phase;
> +
> +	for (i =3D 0; i < PSC_STORED_PHASES; i++) {
> +		dcss_scaler_write(ch, ((coef[i][0] & 0xfff) << 16 |
> +				       (coef[i][1] & 0xfff) << 4  |
> +				       (coef[i][2] & 0xf00) >> 8),
> +				  base_addr + i * sizeof(u32));
> +		dcss_scaler_write(ch, ((coef[i][2] & 0x0ff) << 20 |
> +				       (coef[i][3] & 0xfff) << 8  |
> +				       (coef[i][4] & 0xff0) >> 4),
> +				  base_addr + 0x40 + i * sizeof(u32));
> +		dcss_scaler_write(ch, ((coef[i][4] & 0x00f) << 24 |
> +				       (coef[i][5] & 0xfff) << 12 |
> +				       (coef[i][6] & 0xfff)),
> +				  base_addr + 0x80 + i * sizeof(u32));
> +	}
> +
> +	/* reverse both phase and tap orderings */
> +	for (phase =3D (PSC_NUM_PHASES >> 1) - 1;
> +			i < PSC_NUM_PHASES; i++, phase--) {
> +		dcss_scaler_write(ch, ((coef[phase][6] & 0xfff) << 16 |
> +				       (coef[phase][5] & 0xfff) << 4  |
> +				       (coef[phase][4] & 0xf00) >> 8),
> +				  base_addr + i * sizeof(u32));
> +		dcss_scaler_write(ch, ((coef[phase][4] & 0x0ff) << 20 |
> +				       (coef[phase][3] & 0xfff) << 8  |
> +				       (coef[phase][2] & 0xff0) >> 4),
> +				  base_addr + 0x40 + i * sizeof(u32));
> +		dcss_scaler_write(ch, ((coef[phase][2] & 0x00f) << 24 |
> +				       (coef[phase][1] & 0xfff) << 12 |
> +				       (coef[phase][0] & 0xfff)),
> +				  base_addr + 0x80 + i * sizeof(u32));
> +	}
> +}
> +
> +static void dcss_scaler_yuv_coef_set(struct dcss_scaler_ch *ch,
> +				     enum buffer_format src_format,
> +				     enum buffer_format dst_format,
> +				     bool use_5_taps,
> +				     int src_xres, int src_yres, int dst_xres,
> +				     int dst_yres)
> +{
> +	int coef[PSC_STORED_PHASES][PSC_NUM_TAPS];
> +	bool program_5_taps =3D use_5_taps ||
> +			      (dst_format =3D=3D BUF_FMT_YUV422 &&
> +			       src_format =3D=3D BUF_FMT_ARGB8888_YUV444);
> +
> +	/* horizontal luma */
> +	dcss_scaler_filter_design(src_xres, dst_xres, false,
> +				  src_xres =3D=3D dst_xres, coef);
> +	dcss_scaler_program_7_coef_set(ch, DCSS_SCALER_COEF_HLUM, coef);
> +
> +	/* vertical luma */
> +	dcss_scaler_filter_design(src_yres, dst_yres, program_5_taps,
> +				  src_yres =3D=3D dst_yres, coef);
> +
> +	if (program_5_taps)
> +		dcss_scaler_program_5_coef_set(ch, DCSS_SCALER_COEF_VLUM, coef);
> +	else
> +		dcss_scaler_program_7_coef_set(ch, DCSS_SCALER_COEF_VLUM, coef);
> +
> +	/* adjust chroma resolution */
> +	if (src_format !=3D BUF_FMT_ARGB8888_YUV444)
> +		src_xres >>=3D 1;
> +	if (src_format =3D=3D BUF_FMT_YUV420)
> +		src_yres >>=3D 1;
> +	if (dst_format !=3D BUF_FMT_ARGB8888_YUV444)
> +		dst_xres >>=3D 1;
> +	if (dst_format =3D=3D BUF_FMT_YUV420) /* should not happen */
> +		dst_yres >>=3D 1;
> +
> +	/* horizontal chroma */
> +	dcss_scaler_filter_design(src_xres, dst_xres, false,
> +				  (src_xres =3D=3D dst_xres) && (ch->c_hstart =3D=3D 0),
> +				  coef);
> +
> +	dcss_scaler_program_7_coef_set(ch, DCSS_SCALER_COEF_HCHR, coef);
> +
> +	/* vertical chroma */
> +	dcss_scaler_filter_design(src_yres, dst_yres, program_5_taps,
> +				  (src_yres =3D=3D dst_yres) && (ch->c_vstart =3D=3D 0),
> +				  coef);
> +	if (program_5_taps)
> +		dcss_scaler_program_5_coef_set(ch, DCSS_SCALER_COEF_VCHR, coef);
> +	else
> +		dcss_scaler_program_7_coef_set(ch, DCSS_SCALER_COEF_VCHR, coef);
> +}
> +
> +static void dcss_scaler_rgb_coef_set(struct dcss_scaler_ch *ch,
> +				     int src_xres, int src_yres, int dst_xres,
> +				     int dst_yres)
> +{
> +	int coef[PSC_STORED_PHASES][PSC_NUM_TAPS];
> +
> +	/* horizontal RGB */
> +	dcss_scaler_filter_design(src_xres, dst_xres, false,
> +				  src_xres =3D=3D dst_xres, coef);
> +	dcss_scaler_program_7_coef_set(ch, DCSS_SCALER_COEF_HLUM, coef);
> +
> +	/* vertical RGB */
> +	dcss_scaler_filter_design(src_yres, dst_yres, false,
> +				  src_yres =3D=3D dst_yres, coef);
> +	dcss_scaler_program_7_coef_set(ch, DCSS_SCALER_COEF_VLUM, coef);
> +}
> +
> +static void dcss_scaler_set_rgb10_order(struct dcss_scaler_ch *ch,
> +					const struct drm_format_info *format)
> +{
> +	u32 a2r10g10b10_format;
> +
> +	if (format->is_yuv)
> +		return;
> +
> +	ch->sdata_ctrl &=3D ~A2R10G10B10_FORMAT_MASK;
> +
> +	if (format->depth !=3D 30)
> +		return;
> +
> +	switch (format->format) {
> +	case DRM_FORMAT_ARGB2101010:
> +	case DRM_FORMAT_XRGB2101010:
> +		a2r10g10b10_format =3D 0;
> +		break;
> +
> +	case DRM_FORMAT_ABGR2101010:
> +	case DRM_FORMAT_XBGR2101010:
> +		a2r10g10b10_format =3D 5;
> +		break;
> +
> +	case DRM_FORMAT_RGBA1010102:
> +	case DRM_FORMAT_RGBX1010102:
> +		a2r10g10b10_format =3D 6;
> +		break;
> +
> +	case DRM_FORMAT_BGRA1010102:
> +	case DRM_FORMAT_BGRX1010102:
> +		a2r10g10b10_format =3D 11;
> +		break;
> +
> +	default:
> +		a2r10g10b10_format =3D 0;
> +		break;
> +	}
> +
> +	ch->sdata_ctrl |=3D a2r10g10b10_format << A2R10G10B10_FORMAT_POS;
> +}
> +
> +void dcss_scaler_setup(struct dcss_scaler *scl, int ch_num,
> +		       const struct drm_format_info *format,
> +		       int src_xres, int src_yres, int dst_xres, int dst_yres,
> +		       u32 vrefresh_hz)
> +{
> +	struct dcss_scaler_ch *ch =3D &scl->ch[ch_num];
> +	unsigned int pixel_depth =3D 0;
> +	bool rtr_8line_en =3D false;
> +	bool use_5_taps =3D false;
> +	enum buffer_format src_format =3D BUF_FMT_ARGB8888_YUV444;
> +	enum buffer_format dst_format =3D BUF_FMT_ARGB8888_YUV444;
> +	u32 pix_format =3D format->format;
> +
> +	if (format->is_yuv) {
> +		dcss_scaler_yuv_enable(ch, true);
> +
> +		if (pix_format =3D=3D DRM_FORMAT_NV12 ||
> +		    pix_format =3D=3D DRM_FORMAT_NV21) {
> +			rtr_8line_en =3D true;
> +			src_format =3D BUF_FMT_YUV420;
> +		} else if (pix_format =3D=3D DRM_FORMAT_UYVY ||
> +			   pix_format =3D=3D DRM_FORMAT_VYUY ||
> +			   pix_format =3D=3D DRM_FORMAT_YUYV ||
> +			   pix_format =3D=3D DRM_FORMAT_YVYU) {
> +			src_format =3D BUF_FMT_YUV422;
> +		}
> +
> +		use_5_taps =3D !rtr_8line_en;
> +	} else {
> +		dcss_scaler_yuv_enable(ch, false);
> +
> +		pixel_depth =3D format->depth;
> +	}
> +
> +	dcss_scaler_fractions_set(ch, src_xres, src_yres, dst_xres,
> +				  dst_yres, src_format, dst_format,
> +				  PSC_LOC_HORZ_0_VERT_1_OVER_4);
> +
> +	if (format->is_yuv)
> +		dcss_scaler_yuv_coef_set(ch, src_format, dst_format,
> +					 use_5_taps, src_xres, src_yres,
> +					 dst_xres, dst_yres);
> +	else
> +		dcss_scaler_rgb_coef_set(ch, src_xres, src_yres,
> +					 dst_xres, dst_yres);
> +
> +	dcss_scaler_rtr_8lines_enable(ch, rtr_8line_en);
> +	dcss_scaler_bit_depth_set(ch, pixel_depth);
> +	dcss_scaler_set_rgb10_order(ch, format);
> +	dcss_scaler_format_set(ch, src_format, dst_format);
> +	dcss_scaler_res_set(ch, src_xres, src_yres, dst_xres, dst_yres,
> +			    pix_format, dst_format);
> +}
> +
> +/* This function will be called from interrupt context. */
> +void dcss_scaler_write_sclctrl(struct dcss_scaler *scl)
> +{
> +	int chnum;
> +
> +	dcss_ctxld_assert_locked(scl->ctxld);
> +
> +	for (chnum =3D 0; chnum < 3; chnum++) {
> +		struct dcss_scaler_ch *ch =3D &scl->ch[chnum];
> +
> +		if (ch->scaler_ctrl_chgd) {
> +			dcss_ctxld_write_irqsafe(scl->ctxld, scl->ctx_id,
> +						 ch->scaler_ctrl,
> +						 ch->base_ofs +
> +						 DCSS_SCALER_CTRL);
> +			ch->scaler_ctrl_chgd =3D false;
> +		}
> +	}
> +}
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-ss.c b/drivers/gpu/drm/imx/dcs=
s/dcss-ss.c
> new file mode 100644
> index 000000000000..8ddf08da911b
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/dcss-ss.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/slab.h>
> +
> +#include "dcss-dev.h"
> +
> +#define DCSS_SS_SYS_CTRL			0x00
> +#define   RUN_EN				BIT(0)
> +#define DCSS_SS_DISPLAY				0x10
> +#define   LRC_X_POS				0
> +#define   LRC_X_MASK				GENMASK(12, 0)
> +#define   LRC_Y_POS				16
> +#define   LRC_Y_MASK				GENMASK(28, 16)
> +#define DCSS_SS_HSYNC				0x20
> +#define DCSS_SS_VSYNC				0x30
> +#define   SYNC_START_POS			0
> +#define   SYNC_START_MASK			GENMASK(12, 0)
> +#define   SYNC_END_POS				16
> +#define   SYNC_END_MASK				GENMASK(28, 16)
> +#define   SYNC_POL				BIT(31)
> +#define DCSS_SS_DE_ULC				0x40
> +#define   ULC_X_POS				0
> +#define   ULC_X_MASK				GENMASK(12, 0)
> +#define   ULC_Y_POS				16
> +#define   ULC_Y_MASK				GENMASK(28, 16)
> +#define   ULC_POL				BIT(31)
> +#define DCSS_SS_DE_LRC				0x50
> +#define DCSS_SS_MODE				0x60
> +#define   PIPE_MODE_POS				0
> +#define   PIPE_MODE_MASK			GENMASK(1, 0)
> +#define DCSS_SS_COEFF				0x70
> +#define   HORIZ_A_POS				0
> +#define   HORIZ_A_MASK				GENMASK(3, 0)
> +#define   HORIZ_B_POS				4
> +#define   HORIZ_B_MASK				GENMASK(7, 4)
> +#define   HORIZ_C_POS				8
> +#define   HORIZ_C_MASK				GENMASK(11, 8)
> +#define   HORIZ_H_NORM_POS			12
> +#define   HORIZ_H_NORM_MASK			GENMASK(14, 12)
> +#define   VERT_A_POS				16
> +#define   VERT_A_MASK				GENMASK(19, 16)
> +#define   VERT_B_POS				20
> +#define   VERT_B_MASK				GENMASK(23, 20)
> +#define   VERT_C_POS				24
> +#define   VERT_C_MASK				GENMASK(27, 24)
> +#define   VERT_H_NORM_POS			28
> +#define   VERT_H_NORM_MASK			GENMASK(30, 28)
> +#define DCSS_SS_CLIP_CB				0x80
> +#define DCSS_SS_CLIP_CR				0x90
> +#define   CLIP_MIN_POS				0
> +#define   CLIP_MIN_MASK				GENMASK(9, 0)
> +#define   CLIP_MAX_POS				0
> +#define   CLIP_MAX_MASK				GENMASK(23, 16)
> +#define DCSS_SS_INTER_MODE			0xA0
> +#define   INT_EN				BIT(0)
> +#define   VSYNC_SHIFT				BIT(1)
> +
> +struct dcss_ss {
> +	struct device *dev;
> +	void __iomem *base_reg;
> +	u32 base_ofs;
> +
> +	struct dcss_ctxld *ctxld;
> +	u32 ctx_id;
> +
> +	bool in_use;
> +};
> +
> +static void dcss_ss_write(struct dcss_ss *ss, u32 val, u32 ofs)
> +{
> +	if (!ss->in_use)
> +		dcss_writel(val, ss->base_reg + ofs);
> +
> +	dcss_ctxld_write(ss->ctxld, ss->ctx_id, val,
> +			 ss->base_ofs + ofs);
> +}
> +
> +int dcss_ss_init(struct dcss_dev *dcss, unsigned long ss_base)
> +{
> +	struct dcss_ss *ss;
> +
> +	ss =3D kzalloc(sizeof(*ss), GFP_KERNEL);
> +	if (!ss)
> +		return -ENOMEM;
> +
> +	dcss->ss =3D ss;
> +	ss->dev =3D dcss->dev;
> +	ss->ctxld =3D dcss->ctxld;
> +
> +	ss->base_reg =3D ioremap(ss_base, SZ_4K);
> +	if (!ss->base_reg) {
> +		dev_err(dcss->dev, "ss: unable to remap ss base\n");
> +		kfree(ss);
> +		return -ENOMEM;
> +	}
> +
> +	ss->base_ofs =3D ss_base;
> +	ss->ctx_id =3D CTX_SB_HP;
> +
> +	return 0;
> +}
> +
> +void dcss_ss_exit(struct dcss_ss *ss)
> +{
> +	/* stop SS */
> +	dcss_writel(0, ss->base_reg + DCSS_SS_SYS_CTRL);
> +
> +	if (ss->base_reg)
> +		iounmap(ss->base_reg);
> +
> +	kfree(ss);
> +}
> +
> +void dcss_ss_subsam_set(struct dcss_ss *ss)
> +{
> +	dcss_ss_write(ss, 0x41614161, DCSS_SS_COEFF);
> +	dcss_ss_write(ss, 0, DCSS_SS_MODE);
> +	dcss_ss_write(ss, 0x03ff0000, DCSS_SS_CLIP_CB);
> +	dcss_ss_write(ss, 0x03ff0000, DCSS_SS_CLIP_CR);
> +}
> +
> +void dcss_ss_sync_set(struct dcss_ss *ss, struct videomode *vm,
> +		      bool phsync, bool pvsync)
> +{
> +	u16 lrc_x, lrc_y;
> +	u16 hsync_start, hsync_end;
> +	u16 vsync_start, vsync_end;
> +	u16 de_ulc_x, de_ulc_y;
> +	u16 de_lrc_x, de_lrc_y;
> +
> +	lrc_x =3D vm->hfront_porch + vm->hback_porch + vm->hsync_len +
> +		vm->hactive - 1;
> +	lrc_y =3D vm->vfront_porch + vm->vback_porch + vm->vsync_len +
> +		vm->vactive - 1;
> +
> +	dcss_ss_write(ss, (lrc_y << LRC_Y_POS) | lrc_x, DCSS_SS_DISPLAY);
> +
> +	hsync_start =3D vm->hfront_porch + vm->hback_porch + vm->hsync_len +
> +		      vm->hactive - 1;
> +	hsync_end =3D vm->hsync_len - 1;
> +
> +	dcss_ss_write(ss, (phsync ? SYNC_POL : 0) |
> +		      ((u32)hsync_end << SYNC_END_POS) | hsync_start,
> +		      DCSS_SS_HSYNC);
> +
> +	vsync_start =3D vm->vfront_porch - 1;
> +	vsync_end =3D vm->vfront_porch + vm->vsync_len - 1;
> +
> +	dcss_ss_write(ss, (pvsync ? SYNC_POL : 0) |
> +		      ((u32)vsync_end << SYNC_END_POS) | vsync_start,
> +		      DCSS_SS_VSYNC);
> +
> +	de_ulc_x =3D vm->hsync_len + vm->hback_porch - 1;
> +	de_ulc_y =3D vm->vsync_len + vm->vfront_porch + vm->vback_porch;
> +
> +	dcss_ss_write(ss, SYNC_POL | ((u32)de_ulc_y << ULC_Y_POS) | de_ulc_x,
> +		      DCSS_SS_DE_ULC);
> +
> +	de_lrc_x =3D vm->hsync_len + vm->hback_porch + vm->hactive - 1;
> +	de_lrc_y =3D vm->vsync_len + vm->vfront_porch + vm->vback_porch +
> +		   vm->vactive - 1;
> +
> +	dcss_ss_write(ss, (de_lrc_y << LRC_Y_POS) | de_lrc_x, DCSS_SS_DE_LRC);
> +}
> +
> +void dcss_ss_enable(struct dcss_ss *ss)
> +{
> +	dcss_ss_write(ss, RUN_EN, DCSS_SS_SYS_CTRL);
> +	ss->in_use =3D true;
> +}
> +
> +void dcss_ss_shutoff(struct dcss_ss *ss)
> +{
> +	dcss_writel(0, ss->base_reg + DCSS_SS_SYS_CTRL);
> +	ss->in_use =3D false;
> +}
> -- =

> 2.23.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
