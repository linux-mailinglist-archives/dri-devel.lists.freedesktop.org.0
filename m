Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C04AF4833CD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 15:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7DB89F2A;
	Mon,  3 Jan 2022 14:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3743E89F2A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 14:55:09 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1n4Ojq-0001Xw-Up; Mon, 03 Jan 2022 15:55:06 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1n4Ojn-0007eK-Te; Mon, 03 Jan 2022 15:55:03 +0100
Date: Mon, 3 Jan 2022 15:55:03 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH 22/22] drm: rockchip: Add VOP2 driver
Message-ID: <20220103145503.GH6003@pengutronix.de>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <20211220110630.3521121-23-s.hauer@pengutronix.de>
 <1761858.GBYTvM79DV@archbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1761858.GBYTvM79DV@archbook>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:21:37 up 23 days, 22:07, 67 users,  load average: 1.10, 1.07, 1.10
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas,

Thanks for the review. I have changed the points I don't comment on here
according to your suggestions.

> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/delay.h>
> > +#include <linux/swab.h>
> > +#include <linux/bitfield.h>
> > +#include <drm/drm_debugfs.h>
> > +#include <uapi/linux/videodev2.h>
> > +#include <drm/drm_vblank.h>
> > +#include <dt-bindings/soc/rockchip,vop2.h>
> 
> Alphabetically sort these includes? Not sure on what the
> convention is in the DRM subsystem.

Me neither. The first random file I looked at in drivers/gpu/drm/ has
the includes sorted alphabetically, so I'll do the same.

> 
> > +static void vop2_cfg_done(struct vop2_video_port *vp)
> > +{
> > +	struct vop2 *vop2 = vp->vop2;
> > +	uint32_t val;
> > +
> > +	val = vop2_readl(vop2, RK3568_REG_CFG_DONE);
> > +
> > +	val &= 0x7;
> 
> GENMASK(2, 0) instead of 0x7, should that be a constant somewhere?
> 
> > +
> > +	vop2_writel(vop2, RK3568_REG_CFG_DONE,
> > +		    val | BIT(vp->id) | RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN);

Replaced that with the following which doesn't need a mask:

	regmap_set_bits(vop2->map, RK3568_REG_CFG_DONE,
				BIT(vp->id) | RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN);


> > +}
> > +
> > +static void vop2_win_disable(struct vop2_win *win)
> > +{
> > +	vop2_win_write(win, VOP2_WIN_ENABLE, 0);
> > +
> > +	if (vop2_cluster_window(win))
> > +		vop2_win_write(win, VOP2_WIN_CLUSTER_ENABLE, 0);
> > +}
> > +
> > +static uint32_t vop2_afbc_transform_offset(struct drm_plane_state *pstate,
> > +					   bool afbc_half_block_en)
> > +{
> > +	struct drm_rect *src = &pstate->src;
> > +	struct drm_framebuffer *fb = pstate->fb;
> > +	uint32_t bpp = fb->format->cpp[0] * 8;
> > +	uint32_t vir_width = (fb->pitches[0] << 3) / bpp;
> > +	uint32_t width = drm_rect_width(src) >> 16;
> > +	uint32_t height = drm_rect_height(src) >> 16;
> > +	uint32_t act_xoffset = src->x1 >> 16;
> > +	uint32_t act_yoffset = src->y1 >> 16;
> > +	uint32_t align16_crop = 0;
> > +	uint32_t align64_crop = 0;
> > +	uint32_t height_tmp = 0;
> > +	uint32_t transform_tmp = 0;
> > +	uint8_t transform_xoffset = 0;
> > +	uint8_t transform_yoffset = 0;
> > +	uint8_t top_crop = 0;
> > +	uint8_t top_crop_line_num = 0;
> > +	uint8_t bottom_crop_line_num = 0;
> > +
> > +	/* 16 pixel align */
> > +	if (height & 0xf)
> > +		align16_crop = 16 - (height & 0xf);
> > +
> > +	height_tmp = height + align16_crop;
> > +
> > +	/* 64 pixel align */
> > +	if (height_tmp & 0x3f)
> > +		align64_crop = 64 - (height_tmp & 0x3f);
> > +
> > +	top_crop_line_num = top_crop << 2;
> > +	if (top_crop == 0)
> > +		bottom_crop_line_num = align16_crop + align64_crop;
> > +	else if (top_crop == 1)
> > +		bottom_crop_line_num = align16_crop + align64_crop + 12;
> > +	else if (top_crop == 2)
> > +		bottom_crop_line_num = align16_crop + align64_crop + 8;
> 
> top_crop == 0 is always taken from what I can gather, rest is
> dead code. Is this intentional? It doesn't seem intentional.

It's the same in the downstream driver. I don't know what top_crop is
good for. I just removed the dead code for now.

> > +		transform_xoffset = transform_tmp & 0xf;
> > +		transform_tmp = vir_width - width - act_xoffset;
> > +		transform_yoffset = transform_tmp & 0xf;
> > +		break;
> > +	case 0:
> > +		transform_tmp = act_xoffset;
> > +		transform_xoffset = transform_tmp & 0xf;
> > +		transform_tmp = top_crop_line_num + act_yoffset;
> > +
> > +		if (afbc_half_block_en)
> > +			transform_yoffset = transform_tmp & 0x7;
> > +		else
> > +			transform_yoffset = transform_tmp & 0xf;
> > +
> > +		break;
> > +	}
> > +
> > +	return (transform_xoffset & 0xf) | ((transform_yoffset & 0xf) << 16);
> > +}
> 
> 0xf, 0x3f, 0x7 might be more clear as GENMASK.
> if (afbc_half_block_en) branches can be moved out of cases and
> assign a transform mask variable instead.

Sure. Other than that the function can be simplified a bit more.

> 
> > +
> > +/*
> > + * A Cluster window has 2048 x 16 line buffer, which can
> > + * works at 2048 x 16(Full) or 4096 x 8 (Half) mode.
> > + * for Cluster_lb_mode register:
> > + * 0: half mode, for plane input width range 2048 ~ 4096
> > + * 1: half mode, for cluster work at 2 * 2048 plane mode
> > + * 2: half mode, for rotate_90/270 mode
> > + *
> > + */
> > +static int vop2_get_cluster_lb_mode(struct vop2_win *win, struct drm_plane_state *pstate)
> > +{
> > +	if ((pstate->rotation & DRM_MODE_ROTATE_270) || (pstate->rotation & DRM_MODE_ROTATE_90))
> > +		return 2;
> > +	else
> > +		return 0;
> > +}
> 
> What about 1?

1 is used in the downstream driver for cluster sub windows. These are
currently not supported, I don't know yet where this is leading to.

> 
> > +
> > +/*
> > + * bli_sd_factor = (src - 1) / (dst - 1) << 12;
> > + * avg_sd_factor:
> > + * bli_su_factor:
> > + * bic_su_factor:
> > + * = (src - 1) / (dst - 1) << 16;
> > + *
> > + * gt2 enable: dst get one line from two line of the src
> > + * gt4 enable: dst get one line from four line of the src.
> > + *
> > + */
> > +static uint16_t vop2_scale_factor(enum scale_mode mode,
> > +				  int32_t filter_mode,
> > +				  uint32_t src, uint32_t dst)
> > +{
> > +	uint32_t fac;
> > +	int i;
> > +
> > +	if (mode == SCALE_NONE)
> > +		return 0;
> > +
> > +	/*
> > +	 * A workaround to avoid zero div.
> > +	 */
> > +	if (dst == 1 || src == 1) {
> > +		dst++;
> > +		src++;
> > +	}
> > +
> > +	if ((mode == SCALE_DOWN) && (filter_mode == VOP2_SCALE_DOWN_BIL)) {
> > +		fac = ((src - 1) << 12) / (dst - 1);
> > +		for (i = 0; i < 100; i++) {
> > +			if (fac * (dst - 1) >> 12 < (src - 1))
> > +				break;
> > +			fac -= 1;
> > +			DRM_DEBUG("down fac cali: src:%d, dst:%d, fac:0x%x\n", src, dst, fac);
> > +		}
> > +	} else {
> > +		fac = ((src - 1) << 16) / (dst - 1);
> > +		for (i = 0; i < 100; i++) {
> > +			if (fac * (dst - 1) >> 16 < (src - 1))
> > +				break;
> > +			fac -= 1;
> > +			DRM_DEBUG("up fac cali:  src:%d, dst:%d, fac:0x%x\n", src, dst, fac);
> > +		}
> > +	}
> > +
> > +	return fac;
> > +}
> 
> src = 0 or dst = 0 causes an uint underflow here.

Right. Looking at it these loops are rather unnecessary and duplicating
the code also. The whole function goes down to:

static uint16_t vop2_scale_factor(uint32_t src, uint32_t dst)
{
	uint32_t fac;
	int shift;

	if (src == dst)
		return 0;

	if (dst < 2)
		return U16_MAX;

	if (src < 2)
		return 0;

	if (src > dst)
		shift = 12;
	else
		shift = 16;

	src--;
	dst--;

	fac = DIV_ROUND_UP(src << shift, dst) - 1;

	if (fac > U16_MAX)
		return U16_MAX;

	return fac;
}


> > +static void vop2_enable(struct vop2 *vop2)
> > +{
> > +	int ret;
> > +	uint32_t v;
> > +
> > +	ret = pm_runtime_get_sync(vop2->dev);
> > +	if (ret < 0) {
> > +		drm_err(vop2->drm, "failed to get pm runtime: %d\n", ret);
> > +		return;
> > +	}
> > +
> > +	ret = vop2_core_clks_prepare_enable(vop2);
> > +	if (ret) {
> > +		pm_runtime_put_sync(vop2->dev);
> > +		return;
> > +	}
> > +
> > +	if (vop2->data->soc_id == 3566)
> > +		vop2_writel(vop2, RK3568_OTP_WIN_EN, 1);
> > +
> > +	vop2_writel(vop2, RK3568_REG_CFG_DONE, RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN);
> > +
> > +	/*
> > +	 * Disable auto gating, this is a workaround to
> > +	 * avoid display image shift when a window enabled.
> > +	 */
> > +	v = vop2_readl(vop2, RK3568_SYS_AUTO_GATING_CTRL);
> > +	v &= ~RK3568_SYS_AUTO_GATING_CTRL__AUTO_GATING_EN;
> > +	vop2_writel(vop2, RK3568_SYS_AUTO_GATING_CTRL, v);
> > +
> > +	vop2_writel(vop2, RK3568_SYS0_INT_CLR,
> > +		    VOP2_INT_BUS_ERRPR << 16 | VOP2_INT_BUS_ERRPR);
> > +	vop2_writel(vop2, RK3568_SYS0_INT_EN,
> > +		    VOP2_INT_BUS_ERRPR << 16 | VOP2_INT_BUS_ERRPR);
> > +	vop2_writel(vop2, RK3568_SYS1_INT_CLR,
> > +		    VOP2_INT_BUS_ERRPR << 16 | VOP2_INT_BUS_ERRPR);
> > +	vop2_writel(vop2, RK3568_SYS1_INT_EN,
> > +		    VOP2_INT_BUS_ERRPR << 16 | VOP2_INT_BUS_ERRPR);
> > +}
> 
> Does reg writes but doesn't have the spinlock.

I didn't care about it at all when working on this driver, so we can be
sure it's at the wrong places right now.

I think we can just drop the register spinlock. The driver uses regmap
now, so read-modify-write accesses are covered by the regmap internal
locking as long as we use regmap_update_bits(). The remaining accesses
are either orthogonal anyway or are covered by the vop2_lock mutex.

> > +	vop2_lock(vop2);
> > +
> > +	ret = clk_prepare_enable(vp->dclk);
> > +	if (ret < 0) {
> > +		drm_err(vop2->drm, "failed to enable dclk for video port%d - %d\n",
> > +			      vp->id, ret);
> > +		return;
> 
> vop2_lock is never unlocked in this branch

I'll move the call to vop2_lock() below the clk_prepare_enable().

> > +	}
> > +
> > +	pm_runtime_put(vop2->dev);
> > +
> > +	return ret;
> > +}
> 
> Does reg writes, does the ISR need the reg spinlock here? I'm not
> sure.
> 
> In general there appear to be a lot of issues with the register
> lock, so either I'm misunderstanding what it's supposed to protect
> or the code is very thread unsafe.

Yeah, the original driver had the spinlock and as said I kept it but
didn't maintain it. Let's remove it for now.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
