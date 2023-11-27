Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D997FA244
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 15:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB0F10E2AD;
	Mon, 27 Nov 2023 14:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E0010E2A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 14:16:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1r7cPZ-0008A9-Er; Mon, 27 Nov 2023 15:16:33 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1r7cPY-00Bxqo-6E; Mon, 27 Nov 2023 15:16:32 +0100
Received: from sha by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1r7cPY-00471C-3F; Mon, 27 Nov 2023 15:16:32 +0100
Date: Mon, 27 Nov 2023 15:16:32 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v2 05/12] drm/rockchip: vop2: Set YUV/RGB overlay mode
Message-ID: <20231127141632.GF977968@pengutronix.de>
References: <20231122125316.3454268-1-andyshrk@163.com>
 <20231122125438.3454608-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122125438.3454608-1-andyshrk@163.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Andy Yan <andy.yan@rock-chips.com>,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 08:54:38PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Set overlay mode register according to the
> output mode is yuv or rgb.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h  |  1 +
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 19 ++++++++++++++++---
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> index 3d8ab2defa1b..7a58c5c9d4ec 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> @@ -51,6 +51,7 @@ struct rockchip_crtc_state {
>  	u32 bus_format;
>  	u32 bus_flags;
>  	int color_space;
> +	bool yuv_overlay;

This struct already contains a bool type variable. Please add this one
next to it to keep the struct size smaller.

>  };
>  #define to_rockchip_crtc_state(s) \
>  		container_of(s, struct rockchip_crtc_state, base)
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index a019cc9bbd54..b32a291c5caa 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1612,6 +1612,8 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>  
>  	vop2->enable_count++;
>  
> +	vcstate->yuv_overlay = is_yuv_output(vcstate->bus_format);
> +
>  	vop2_crtc_enable_irq(vp, VP_INT_POST_BUF_EMPTY);
>  
>  	polflags = 0;
> @@ -1639,7 +1641,7 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>  	if (vop2_output_uv_swap(vcstate->bus_format, vcstate->output_mode))
>  		dsp_ctrl |= RK3568_VP_DSP_CTRL__DSP_RB_SWAP;
>  
> -	if (is_yuv_output(vcstate->bus_format))
> +	if (vcstate->yuv_overlay)
>  		dsp_ctrl |= RK3568_VP_DSP_CTRL__POST_DSP_OUT_R2Y;
>  
>  	vop2_dither_setup(crtc, &dsp_ctrl);
> @@ -1948,10 +1950,12 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
>  	u16 hdisplay;
>  	u32 bg_dly;
>  	u32 pre_scan_dly;
> +	u32 ovl_ctrl;
>  	int i;
>  	struct vop2_video_port *vp0 = &vop2->vps[0];
>  	struct vop2_video_port *vp1 = &vop2->vps[1];
>  	struct vop2_video_port *vp2 = &vop2->vps[2];
> +	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(vp->crtc.state);
>  
>  	adjusted_mode = &vp->crtc.state->adjusted_mode;
>  	hsync_len = adjusted_mode->crtc_hsync_end - adjusted_mode->crtc_hsync_start;
> @@ -1964,7 +1968,14 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
>  	pre_scan_dly = ((bg_dly + (hdisplay >> 1) - 1) << 16) | hsync_len;
>  	vop2_vp_write(vp, RK3568_VP_PRE_SCAN_HTIMING, pre_scan_dly);
>  
> -	vop2_writel(vop2, RK3568_OVL_CTRL, 0);
> +	ovl_ctrl = vop2_readl(vop2, RK3568_OVL_CTRL);
> +	if (vcstate->yuv_overlay)
> +		ovl_ctrl |= BIT(vp->id);
> +	else
> +		ovl_ctrl &= ~BIT(vp->id);

Some

#define RK3568_OVL_CTRL__YUV_MODE(vp)	BIT(vp)

Would be nice.

> +
> +	vop2_writel(vop2, RK3568_OVL_CTRL, ovl_ctrl);

Is it necessary to write this register twice?

> +
>  	port_sel = vop2_readl(vop2, RK3568_OVL_PORT_SEL);
>  	port_sel &= RK3568_OVL_PORT_SEL__SEL_PORT;
>  
> @@ -2036,9 +2047,11 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
>  		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(nlayer + ofs, 5);
>  	}
>  
> +	ovl_ctrl |= RK3568_OVL_CTRL__LAYERSEL_REGDONE_IMD;
> +
>  	vop2_writel(vop2, RK3568_OVL_LAYER_SEL, layer_sel);
>  	vop2_writel(vop2, RK3568_OVL_PORT_SEL, port_sel);
> -	vop2_writel(vop2, RK3568_OVL_CTRL, RK3568_OVL_CTRL__LAYERSEL_REGDONE_IMD);
> +	vop2_writel(vop2, RK3568_OVL_CTRL, ovl_ctrl);

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
