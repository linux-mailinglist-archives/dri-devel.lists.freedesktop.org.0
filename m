Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF989C91485
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 09:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4949310E0FD;
	Fri, 28 Nov 2025 08:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="EkSe98ZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3295.qiye.163.com (mail-m3295.qiye.163.com
 [220.197.32.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEF710E0FD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 08:46:53 +0000 (UTC)
Received: from [172.16.12.51] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2b402a864;
 Fri, 28 Nov 2025 16:46:46 +0800 (GMT+08:00)
Message-ID: <0ed71b8d-5a2e-4213-bd2f-7ba317d1e4cb@rock-chips.com>
Date: Fri, 28 Nov 2025 16:46:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/rockchip: vop2: Support setting custom
 background color
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com>
 <20251118-rk3588-bgcolor-v3-4-a2cc909428ea@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20251118-rk3588-bgcolor-v3-4-a2cc909428ea@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ac9a4b85703abkunm11421f537af6fa
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU5LT1ZLTEkYQ05MT0NNGktWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=EkSe98ZCaMWUeYJWp7XkH1NrLpxTWcBUuZ5/ZMa2t6hgO7fIBoBI7bhabX0N7JKE+CGGs15C9bG4dNFtrOGp1A4uPgc3UwN7O1zAxrxJvwTAbjSgobcIVchpTCb2zb7Gk7oqG5zxYWUxQc99Wdsk9g823t58tn/7Lv5rHHw84ao=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=NXIQw8wTklQzICYSBWsCIghl/AUSAsiExXTZ+MWpvQM=;
 h=date:mime-version:subject:message-id:from;
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

Hello Cristian,

On 11/18/2025 7:52 AM, Cristian Ciocaltea wrote:
> The Rockchip VOP2 display controller allows configuring the background
> color of each video output port.
> 
> Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
> which defaults to solid black, make use of it when programming the
> hardware.
> 
> Note the maximum precision allowed by the display controller is 10bpc,
> while the alpha component is not supported, hence ignored.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 ++++++++++++-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 498df0ce4680..87110beba366 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1554,6 +1554,7 @@ static void vop2_post_config(struct drm_crtc *crtc)
>  	struct vop2_video_port *vp = to_vop2_video_port(crtc);
>  	struct vop2 *vop2 = vp->vop2;
>  	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> +	u64 bgcolor = crtc->state->background_color;
>  	u16 vtotal = mode->crtc_vtotal;
>  	u16 hdisplay = mode->crtc_hdisplay;
>  	u16 hact_st = mode->crtc_htotal - mode->crtc_hsync_start;
> @@ -1599,7 +1600,11 @@ static void vop2_post_config(struct drm_crtc *crtc)
>  		vop2_vp_write(vp, RK3568_VP_POST_DSP_VACT_INFO_F1, val);
>  	}
>  
> -	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
> +	/* Background color is programmed with 10 bits of precision */
> +	val = FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED, DRM_ARGB64_GETR_BPC(bgcolor, 10));
> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN, DRM_ARGB64_GETG_BPC(bgcolor, 10));
> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE, DRM_ARGB64_GETB_BPC(bgcolor, 10));

Division is expensive. If we convert a 16 bpc value to 10 bpc using
direct bit-shifts, that is "DRM_ARGB64_GETX(bgcolor) >> 6" will
keep the relative error within 1 compared to DIV_ROUND_CLOSEST().

Should we be concerned about the precision problem here?

> +	vop2_vp_write(vp, RK3568_VP_DSP_BG, val);
>  }
>  
>  static int us_to_vertical_line(struct drm_display_mode *mode, int us)
> @@ -1984,6 +1989,10 @@ static int vop2_crtc_state_dump(struct drm_crtc *crtc, struct seq_file *s)
>  		   drm_get_bus_format_name(vcstate->bus_format));
>  	seq_printf(s, "\toutput_mode[%x]", vcstate->output_mode);
>  	seq_printf(s, " color_space[%d]\n", vcstate->color_space);
> +	seq_printf(s, "\tbackground color (10bpc): r=0x%x g=0x%x b=0x%x\n",
> +		   DRM_ARGB64_GETR_BPC(cstate->background_color, 10),
> +		   DRM_ARGB64_GETG_BPC(cstate->background_color, 10),
> +		   DRM_ARGB64_GETB_BPC(cstate->background_color, 10));
>  	seq_printf(s, "    Display mode: %dx%d%s%d\n",
>  		   mode->hdisplay, mode->vdisplay, interlaced ? "i" : "p",
>  		   drm_mode_vrefresh(mode));
> @@ -2473,6 +2482,8 @@ static int vop2_create_crtcs(struct vop2 *vop2)
>  			return dev_err_probe(drm->dev, ret,
>  					     "crtc init for video_port%d failed\n", i);
>  
> +		drm_crtc_attach_background_color_property(&vp->crtc);
> +
>  		drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
>  		if (vop2->lut_regs) {
>  			const struct vop2_video_port_data *vp_data = &vop2_data->vp[vp->id];
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> index 9124191899ba..37722652844a 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> @@ -658,6 +658,10 @@ enum dst_factor_mode {
>  #define RK3588_VP_CLK_CTRL__DCLK_OUT_DIV		GENMASK(3, 2)
>  #define RK3588_VP_CLK_CTRL__DCLK_CORE_DIV		GENMASK(1, 0)
>  
> +#define RK3568_VP_DSP_BG__DSP_BG_RED			GENMASK(29, 20)
> +#define RK3568_VP_DSP_BG__DSP_BG_GREEN			GENMASK(19, 10)
> +#define RK3568_VP_DSP_BG__DSP_BG_BLUE			GENMASK(9, 0)
> +
>  #define RK3568_VP_POST_SCL_CTRL__VSCALEDOWN		BIT(1)
>  #define RK3568_VP_POST_SCL_CTRL__HSCALEDOWN		BIT(0)
>  

-- 
Best, 
Chaoyi
