Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E074E514C6A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 16:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA16810ED1B;
	Fri, 29 Apr 2022 14:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC79510ED1B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 14:08:51 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 87E1A5C9C0E;
 Fri, 29 Apr 2022 16:08:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1651241329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fguk2iOqIzSKPU3fndmkOFoTYGnsBGSXVVOUZNVhkfw=;
 b=snM7hEe3f8gqwQfaB9l1ep7NF0zevO2bQKYjfHC5e8qztUaWCG0D64Nerjh6SvEwzJrs9S
 2Vx9A25lwcNztaPYaiurCzswxDIQDdlwhvY/PxTm53bY9iqi8NpJmMSpIVjaWpFRdtCNdX
 fQBCqARg1H76qFYxTFWZ7dyko9yf2eU=
MIME-Version: 1.0
Date: Fri, 29 Apr 2022 16:08:47 +0200
From: Stefan Agner <stefan@agner.ch>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2] drm: mxsfb: Implement LCDIF scanout CRC32 support
In-Reply-To: <20220411203531.774958-1-marex@denx.de>
References: <20220411203531.774958-1-marex@denx.de>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <efa4cf7bc24ed9b217f1bbaff9b652d4@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Robby Cai <robby.cai@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-11 22:35, Marek Vasut wrote:
> The LCDIF controller as present in i.MX28/i.MX6SX/i.MX8M Mini/Nano has
> CRC_STAT register, which contains CRC32 of the frame as it was clocked
> out of the DPI interface of the LCDIF. This is most likely meant as a
> functional safety feature.
> 
> Unfortunately, there is zero documentation on how the CRC32 is calculated,
> there is no documentation of the polynomial, the init value, nor on which
> data is the checksum applied.
> 
> By applying brute-force on 8 pixel / 2 line frame, which is the minimum
> size LCDIF would work with, it turns out the polynomial is CRC32_POLY_LE
> 0xedb88320 , init value is 0xffffffff , the input data are bitrev32()
> of the entire frame and the resulting CRC has to be also bitrev32()ed.
> 
> Doing this calculation in kernel for each frame is unrealistic due to the
> CPU demand, so attach the CRC collected from hardware to a frame instead.
> The DRM subsystem already has an interface for this purpose and the CRC
> can be accessed e.g. via debugfs:
> "
> $ echo auto > /sys/kernel/debug/dri/1/crtc-0/crc/control
> $ cat /sys/kernel/debug/dri/1/crtc-0/crc/data
> 0x0000408c 0xa4e5cdd8
> 0x0000408d 0x72f537b4
> "
> The per-frame CRC can be used by userspace e.g. during automated testing,
> to verify that whatever buffer was sent to be scanned out was actually
> scanned out of the LCDIF correctly.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
> V2: Check crtc for non-NULL before dereferencing it in mxsfb_crtc_set_crc_source
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c  | 15 +++++++-
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h  |  3 ++
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 61 ++++++++++++++++++++++++++++--
>  drivers/gpu/drm/mxsfb/mxsfb_regs.h |  1 +
>  4 files changed, 75 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 94cafff7f68d5..ccf4107476ecc 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/crc32.h>

Doesn't look like this is used?

With that addressed.
Acked-by: Stefan Agner <stefan@agner.ch>

--
Stefan

>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -52,6 +53,7 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
>  		.hs_wdth_shift	= 24,
>  		.has_overlay	= false,
>  		.has_ctrl2	= false,
> +		.has_crc32	= false,
>  	},
>  	[MXSFB_V4] = {
>  		.transfer_count	= LCDC_V4_TRANSFER_COUNT,
> @@ -61,6 +63,7 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
>  		.hs_wdth_shift	= 18,
>  		.has_overlay	= false,
>  		.has_ctrl2	= true,
> +		.has_crc32	= true,
>  	},
>  	[MXSFB_V6] = {
>  		.transfer_count	= LCDC_V4_TRANSFER_COUNT,
> @@ -70,6 +73,7 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
>  		.hs_wdth_shift	= 18,
>  		.has_overlay	= true,
>  		.has_ctrl2	= true,
> +		.has_crc32	= true,
>  	},
>  };
>  
> @@ -145,12 +149,19 @@ static irqreturn_t mxsfb_irq_handler(int irq, void *data)
>  {
>  	struct drm_device *drm = data;
>  	struct mxsfb_drm_private *mxsfb = drm->dev_private;
> -	u32 reg;
> +	u32 reg, crc;
> +	u64 vbc;
>  
>  	reg = readl(mxsfb->base + LCDC_CTRL1);
>  
> -	if (reg & CTRL1_CUR_FRAME_DONE_IRQ)
> +	if (reg & CTRL1_CUR_FRAME_DONE_IRQ) {
>  		drm_crtc_handle_vblank(&mxsfb->crtc);
> +		if (mxsfb->crc_active) {
> +			crc = readl(mxsfb->base + LCDC_V4_CRC_STAT);
> +			vbc = drm_crtc_accurate_vblank_count(&mxsfb->crtc);
> +			drm_crtc_add_crc_entry(&mxsfb->crtc, true, vbc, &crc);
> +		}
> +	}
>  
>  	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
>  
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> index ddb5b0417a82c..d160d921b25fc 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> @@ -23,6 +23,7 @@ struct mxsfb_devdata {
>  	unsigned int	hs_wdth_shift;
>  	bool		has_overlay;
>  	bool		has_ctrl2;
> +	bool		has_crc32;
>  };
>  
>  struct mxsfb_drm_private {
> @@ -44,6 +45,8 @@ struct mxsfb_drm_private {
>  	struct drm_encoder		encoder;
>  	struct drm_connector		*connector;
>  	struct drm_bridge		*bridge;
> +
> +	bool				crc_active;
>  };
>  
>  static inline struct mxsfb_drm_private *
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index c7f14ef1edc25..323087944ac56 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -454,6 +454,41 @@ static void mxsfb_crtc_disable_vblank(struct
> drm_crtc *crtc)
>  	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
>  }
>  
> +static int mxsfb_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
> +{
> +	struct mxsfb_drm_private *mxsfb;
> +
> +	if (!crtc)
> +		return -ENODEV;
> +
> +	mxsfb = to_mxsfb_drm_private(crtc->dev);
> +
> +	if (source && strcmp(source, "auto") == 0)
> +		mxsfb->crc_active = true;
> +	else if (!source)
> +		mxsfb->crc_active = false;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int mxsfb_crtc_verify_crc_source(struct drm_crtc *crtc,
> +					const char *source, size_t *values_cnt)
> +{
> +	if (!crtc)
> +		return -ENODEV;
> +
> +	if (source && strcmp(source, "auto") != 0) {
> +		DRM_DEBUG_DRIVER("Unknown CRC source %s for %s\n",
> +				 source, crtc->name);
> +		return -EINVAL;
> +	}
> +
> +	*values_cnt = 1;
> +	return 0;
> +}
> +
>  static const struct drm_crtc_helper_funcs mxsfb_crtc_helper_funcs = {
>  	.atomic_check = mxsfb_crtc_atomic_check,
>  	.atomic_flush = mxsfb_crtc_atomic_flush,
> @@ -472,6 +507,19 @@ static const struct drm_crtc_funcs mxsfb_crtc_funcs = {
>  	.disable_vblank = mxsfb_crtc_disable_vblank,
>  };
>  
> +static const struct drm_crtc_funcs mxsfb_crtc_with_crc_funcs = {
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank = mxsfb_crtc_enable_vblank,
> +	.disable_vblank = mxsfb_crtc_disable_vblank,
> +	.set_crc_source = mxsfb_crtc_set_crc_source,
> +	.verify_crc_source = mxsfb_crtc_verify_crc_source,
> +};
> +
>  /*
> -----------------------------------------------------------------------------
>   * Encoder
>   */
> @@ -655,9 +703,16 @@ int mxsfb_kms_init(struct mxsfb_drm_private *mxsfb)
>  	}
>  
>  	drm_crtc_helper_add(crtc, &mxsfb_crtc_helper_funcs);
> -	ret = drm_crtc_init_with_planes(mxsfb->drm, crtc,
> -					&mxsfb->planes.primary, NULL,
> -					&mxsfb_crtc_funcs, NULL);
> +	if (mxsfb->devdata->has_crc32) {
> +		ret = drm_crtc_init_with_planes(mxsfb->drm, crtc,
> +						&mxsfb->planes.primary, NULL,
> +						&mxsfb_crtc_with_crc_funcs,
> +						NULL);
> +	} else {
> +		ret = drm_crtc_init_with_planes(mxsfb->drm, crtc,
> +						&mxsfb->planes.primary, NULL,
> +						&mxsfb_crtc_funcs, NULL);
> +	}
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> index 694fea13e893e..cf813a1da1d78 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> @@ -26,6 +26,7 @@
>  #define LCDC_VDCTRL2			0x90
>  #define LCDC_VDCTRL3			0xa0
>  #define LCDC_VDCTRL4			0xb0
> +#define LCDC_V4_CRC_STAT		0x1a0
>  #define LCDC_V4_DEBUG0			0x1d0
>  #define LCDC_V3_DEBUG0			0x1f0
>  #define LCDC_AS_CTRL			0x210
