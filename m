Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC2193D00B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 11:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82F510E959;
	Fri, 26 Jul 2024 09:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="GmJy7HWe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 494 seconds by postgrey-1.36 at gabe;
 Fri, 26 Jul 2024 09:03:55 UTC
Received: from mail-m12747.qiye.163.com (mail-m12747.qiye.163.com
 [115.236.127.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493BE10E950
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 09:03:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=GmJy7HWeZfjjTuvANgcg/KGQovsIC+itErCS6Ie/z0r4kZMKX0ZlbIPz3uMFnIQeKo0DXQZtQMsaiSGGmqG1JjqURyyHM+0OMZurqWm4YOaoNXQ+1rIR9EjCgLRIS4Fz1rIOw81uMglcDV+Kd27LK/k6Nv1pwVUnXkORcYFUDAc=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=ZF9yzHJ3QBuZLl2xV7ZAuU1z3Rzjhw3pM8V/EhOhsCE=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTPA id 52B76841225;
 Fri, 26 Jul 2024 16:55:29 +0800 (CST)
Message-ID: <ec283a7c-845b-4c58-8d86-cdd07862a0dc@rock-chips.com>
Date: Fri, 26 Jul 2024 16:55:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rockchip/drm: vop2: add support for gamma LUT
To: Piotr Zalewski <pZ010001011111@proton.me>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "heiko@sntech.de" <heiko@sntech.de>, "hjc@rock-chips.com"
 <hjc@rock-chips.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
References: <TkgKVivuaLFLILPY-n3iZo_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKeFZr-MJzJMtw0=@proton.me>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <TkgKVivuaLFLILPY-n3iZo_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKeFZr-MJzJMtw0=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUlPQ1YdSk1LGEtLGk1DSkhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a90ee409ba603a4kunm52b76841225
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M0k6Qww4SDI1PTgBKyk4Eygu
 AxMKChBVSlVKTElKQkNPSkhLTkpNVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkpNTUw3Bg++
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

Hi Piotr,
    Thanks for your work.

On 7/25/24 06:05, Piotr Zalewski wrote:
> Add support for gamma LUT in VOP2 driver. The implementation is based on
> the one found in VOP driver and modified to be compatible with VOP2. Blue
> and red channels in gamma LUT register write were swapped with respect to
> how gamma LUT values are written in VOP. Write of the current video port id
> to VOP2_SYS_LUT_PORT_SEL register was added before the write of DSP_LUT_EN
> bit. Gamma size is set and drm color management is enabled for each video
> port's CRTC except ones which have no associated device. Tested on RK3566
> (Pinetab2).
> 
> Helped-by: Dragan Simic <dsimic@manjaro.org>
> Signed-off-by: Piotr Zalewski <pZ010001011111@proton.me>
> ---
> 
> Notes:
>      Changes in v3:
>          - v3 is patch v2 "resend", by mistake the incremental patch were
>          sent in v2
> 
>      Changes in v2:
>          - Apply code styling corrections [1]
>          - Move gamma LUT write inside the vop2 lock
> 
>      Link to v2: https://lore.kernel.org/linux-rockchip/Hk03HDb6wSSHWtEFZHUye06HR0-9YzP5nCHx9A8_kHzWSZawDrU1o1pjEGkCOJFoRg0nTB4BWEv6V0XBOjF4-0Mj44lp2TrjaQfnytzp-Pk=@proton.me/T/#u
>      Link to v1: https://lore.kernel.org/linux-rockchip/9736eadf6a9d8e97eef919c6b3d88828@manjaro.org/T/#t
> 
>      [1] https://lore.kernel.org/linux-rockchip/d019761504b540600d9fc7a585d6f95f@manjaro.org/
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 9873172e3fd3..37fcf544a5fd 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -278,6 +278,15 @@ static u32 vop2_readl(struct vop2 *vop2, u32 offset)
>   	return val;
>   }
> 
> +static u32 vop2_vp_read(struct vop2_video_port *vp, u32 offset)
> +{
> +	u32 val;
> +
> +	regmap_read(vp->vop2->map, vp->data->offset + offset, &val);
> +
> +	return val;
> +}
> +
>   static void vop2_win_write(const struct vop2_win *win, unsigned int reg, u32 v)
>   {
>   	regmap_field_write(win->reg[reg], v);
> @@ -1482,6 +1491,95 @@ static bool vop2_crtc_mode_fixup(struct drm_crtc *crtc,
>   	return true;
>   }
> 
> +static bool vop2_vp_dsp_lut_is_enabled(struct vop2_video_port *vp)
> +{
> +	return (u32) (vop2_vp_read(vp, RK3568_VP_DSP_CTRL) & RK3568_VP_DSP_CTRL__DSP_LUT_EN) >
> +	    0;
> +}
> +
> +static void vop2_vp_dsp_lut_enable(struct vop2_video_port *vp)
> +{
> +	u32 dsp_ctrl = vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> +
> +	dsp_ctrl |= RK3568_VP_DSP_CTRL__DSP_LUT_EN;
> +	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> +}
> +
> +static void vop2_vp_dsp_lut_disable(struct vop2_video_port *vp)
> +{
> +	u32 dsp_ctrl = vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> +
> +	dsp_ctrl &= ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
> +	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> +}
> +
> +static void vop2_crtc_write_gamma_lut(struct vop2 *vop2, struct drm_crtc *crtc)
> +{
> +	const struct vop2_video_port *vp = to_vop2_video_port(crtc);
> +	const struct vop2_video_port_data *vp_data = &vop2->data->vp[vp->id];
> +
> +	struct drm_color_lut *lut = crtc->state->gamma_lut->data;
> +	unsigned int i, bpc = ilog2(vp_data->gamma_lut_len);
> +	u32 word;
> +
> +	for (i = 0; i < crtc->gamma_size; i++) {
> +		word = (drm_color_lut_extract(lut[i].blue, bpc) << (2 * bpc)) |
> +		    (drm_color_lut_extract(lut[i].green, bpc) << bpc) |
> +		    drm_color_lut_extract(lut[i].red, bpc);
> +
> +		writel(word, vop2->lut_regs + i * 4);
> +	}
> +}
> +
> +static void vop2_crtc_gamma_set(struct vop2 *vop2, struct drm_crtc *crtc,
> +				struct drm_crtc_state *old_state)
> +{
> +	struct drm_crtc_state *state = crtc->state;
> +	struct vop2_video_port *vp = to_vop2_video_port(crtc);
> +	u32 dsp_ctrl;
> +	int ret;
> +
> +	if (!vop2->lut_regs)
> +		return;
> +
> +	if (!state->gamma_lut) {

       What's the purpose of checking !state->gamma_lut here,
  and you check it again at the end for return.
  This makes me very confused.
> +		/*
> +		 * To disable gamma (gamma_lut is null) or to write
> +		 * an update to the LUT, clear dsp_lut_en.
> +		 */
> +		vop2_lock(vop2);
> +
> +		vop2_vp_dsp_lut_disable(vp);
> +
> +		vop2_cfg_done(vp);
> +		vop2_unlock(vop2);
> +		/*
> +		 * In order to write the LUT to the internal memory,
> +		 * we need to first make sure the dsp_lut_en bit is cleared.
> +		 */
> +		ret = readx_poll_timeout(vop2_vp_dsp_lut_is_enabled, vp, dsp_ctrl,
> +				!dsp_ctrl, 5, 30 * 1000);
> +
> +		if (ret) {
> +			DRM_DEV_ERROR(vop2->dev, "display LUT RAM enable timeout!\n");
> +			return;
> +		}
> +
> +		if (!state->gamma_lut)
> +			return;
> +	}
> +
> +
> +	vop2_lock(vop2);
> +	vop2_crtc_write_gamma_lut(vop2, crtc);
> +	vop2_writel(vp->vop2, RK3568_LUT_PORT_SEL, vp->id);

We should select lut_port befor write gamma.

And there is one thing to note here is that:
There is only one gamma for rk3568/rk3566, that means only one
of the three VPs can exclusively use it at a time, so we need
a exclusive check for rk3568/rk3566.

For rk3588 and the new soc, there is no such limination.

The another thing to note is that for rk35588 and other new soc, no need to disable dsp_lut before write it.
> +
> +	vop2_vp_dsp_lut_enable(vp);
> +
> +	vop2_cfg_done(vp);
> +	vop2_unlock(vop2);
> +}
> +
>   static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
>   {
>   	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(crtc->state);
> @@ -1925,6 +2023,7 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>   	const struct vop2_data *vop2_data = vop2->data;
>   	const struct vop2_video_port_data *vp_data = &vop2_data->vp[vp->id];
>   	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state, crtc);
>   	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(crtc->state);
>   	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>   	unsigned long clock = mode->crtc_clock * 1000;
> @@ -2060,6 +2159,9 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>   	drm_crtc_vblank_on(crtc);
> 
>   	vop2_unlock(vop2);
> +
> +	if (crtc->state->gamma_lut)
> +		vop2_crtc_gamma_set(vop2, crtc, old_state);
>   }
> 
>   static int vop2_crtc_atomic_check(struct drm_crtc *crtc,
> @@ -2070,6 +2172,16 @@ static int vop2_crtc_atomic_check(struct drm_crtc *crtc,
>   	int nplanes = 0;
>   	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> 
> +	if (vp->vop2->lut_regs && crtc_state->color_mgmt_changed && crtc_state->gamma_lut) {
> +		unsigned int len = drm_color_lut_size(crtc_state->gamma_lut);
> +
> +		if (len != crtc->gamma_size) {
> +			DRM_DEBUG_KMS("Invalid LUT size; got %d, expected %d\n",
> +				      len, crtc->gamma_size);
> +			return -EINVAL;
> +		}
> +	}
> +
>   	drm_atomic_crtc_state_for_each_plane(plane, crtc_state)
>   		nplanes++;
> 
> @@ -2459,6 +2571,10 @@ static void vop2_setup_dly_for_windows(struct vop2 *vop2)
>   static void vop2_crtc_atomic_begin(struct drm_crtc *crtc,
>   				   struct drm_atomic_state *state)
>   {
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
> +									  crtc);
> +	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
> +									      crtc);
>   	struct vop2_video_port *vp = to_vop2_video_port(crtc);
>   	struct vop2 *vop2 = vp->vop2;
>   	struct drm_plane *plane;
> @@ -2482,6 +2598,9 @@ static void vop2_crtc_atomic_begin(struct drm_crtc *crtc,
>   	vop2_setup_layer_mixer(vp);
>   	vop2_setup_alpha(vp);
>   	vop2_setup_dly_for_windows(vop2);
> +
> +	if (crtc_state->color_mgmt_changed && !crtc_state->active_changed)
> +		vop2_crtc_gamma_set(vop2, crtc, old_crtc_state);
>   }
> 
>   static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
> @@ -2791,6 +2910,14 @@ static int vop2_create_crtcs(struct vop2 *vop2)
> 
>   		drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
> 
> +		if (vop2->lut_regs && vp->crtc.dev != NULL) {
> +			const struct vop2_video_port_data *vp_data = &vop2_data->vp[vp->id];
> +
> +			drm_mode_crtc_set_gamma_size(&vp->crtc, vp_data->gamma_lut_len);
> +			drm_crtc_enable_color_mgmt(&vp->crtc, 0, false,
> +						   vp_data->gamma_lut_len);
> +		}
> +
>   		init_completion(&vp->dsp_hold_completion);
>   	}
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> index 615a16196aff..3a58b73fa876 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> @@ -394,6 +394,7 @@ enum dst_factor_mode {
>   #define RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN		BIT(15)
> 
>   #define RK3568_VP_DSP_CTRL__STANDBY			BIT(31)
> +#define RK3568_VP_DSP_CTRL__DSP_LUT_EN			BIT(28)
>   #define RK3568_VP_DSP_CTRL__DITHER_DOWN_MODE		BIT(20)
>   #define RK3568_VP_DSP_CTRL__DITHER_DOWN_SEL		GENMASK(19, 18)
>   #define RK3568_VP_DSP_CTRL__DITHER_DOWN_EN		BIT(17)
