Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E7C58BB54
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 16:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA1A8D4D3;
	Sun,  7 Aug 2022 14:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 745 seconds by postgrey-1.36 at gabe;
 Sun, 07 Aug 2022 12:51:05 UTC
Received: from fx.arvanta.net (static-213-198-238-194.adsl.eunet.rs
 [213.198.238.194])
 by gabe.freedesktop.org (Postfix) with ESMTP id 66E4FAE411
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Aug 2022 12:51:05 +0000 (UTC)
Received: from m1 (kcl.arvanta.net [10.5.1.8])
 by fx.arvanta.net (Postfix) with ESMTP id 6A11625185;
 Sun,  7 Aug 2022 14:38:37 +0200 (CEST)
Date: Sun, 7 Aug 2022 14:38:52 +0200
From: Milan =?utf-8?Q?P=2E_Stani=C4=87?= <mps@arvanta.net>
To: Hugh Cole-Baker <sigmaris@gmail.com>
Subject: Re: [PATCH v2 1/3] drm/rockchip: define gamma registers for RK3399
Message-ID: <Yu+yXG/d77+WhmYM@m1>
References: <20211019215843.42718-1-sigmaris@gmail.com>
 <20211019215843.42718-2-sigmaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211019215843.42718-2-sigmaris@gmail.com>
X-Mailman-Approved-At: Sun, 07 Aug 2022 14:47:23 +0000
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
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Tested it on gru-kevin with mainline kernel 5.19 and it works

On Tue, 2021-10-19 at 22:58, Hugh Cole-Baker wrote:
> The VOP on RK3399 has a different approach from previous versions for
> setting a gamma lookup table, using an update_gamma_lut register. As
> this differs from RK3288, give RK3399 its own set of "common" register
> definitions.
> 
> Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
Tested-by: "Milan P. Stanić" <mps@arvanta.net>
> ---
> 
> Changes from v1: no changes in this patch
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h |  2 ++
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 24 +++++++++++++++++++--
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.h |  1 +
>  3 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> index 857d97cdc67c..14179e89bd21 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> @@ -99,6 +99,8 @@ struct vop_common {
>  	struct vop_reg dither_down_en;
>  	struct vop_reg dither_up;
>  	struct vop_reg dsp_lut_en;
> +	struct vop_reg update_gamma_lut;
> +	struct vop_reg lut_buffer_index;
>  	struct vop_reg gate_en;
>  	struct vop_reg mmu_en;
>  	struct vop_reg out_mode;
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> index ca7cc82125cb..bfb7e130f09b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> @@ -865,6 +865,24 @@ static const struct vop_output rk3399_output = {
>  	.mipi_dual_channel_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 3),
>  };
>  
> +static const struct vop_common rk3399_common = {
> +	.standby = VOP_REG_SYNC(RK3399_SYS_CTRL, 0x1, 22),
> +	.gate_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 23),
> +	.mmu_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 20),
> +	.dither_down_sel = VOP_REG(RK3399_DSP_CTRL1, 0x1, 4),
> +	.dither_down_mode = VOP_REG(RK3399_DSP_CTRL1, 0x1, 3),
> +	.dither_down_en = VOP_REG(RK3399_DSP_CTRL1, 0x1, 2),
> +	.pre_dither_down = VOP_REG(RK3399_DSP_CTRL1, 0x1, 1),
> +	.dither_up = VOP_REG(RK3399_DSP_CTRL1, 0x1, 6),
> +	.dsp_lut_en = VOP_REG(RK3399_DSP_CTRL1, 0x1, 0),
> +	.update_gamma_lut = VOP_REG(RK3399_DSP_CTRL1, 0x1, 7),
> +	.lut_buffer_index = VOP_REG(RK3399_DBG_POST_REG1, 0x1, 1),
> +	.data_blank = VOP_REG(RK3399_DSP_CTRL0, 0x1, 19),
> +	.dsp_blank = VOP_REG(RK3399_DSP_CTRL0, 0x3, 18),
> +	.out_mode = VOP_REG(RK3399_DSP_CTRL0, 0xf, 0),
> +	.cfg_done = VOP_REG_SYNC(RK3399_REG_CFG_DONE, 0x1, 0),
> +};
> +
>  static const struct vop_yuv2yuv_phy rk3399_yuv2yuv_win01_data = {
>  	.y2r_coefficients = {
>  		VOP_REG(RK3399_WIN0_YUV2YUV_Y2R + 0, 0xffff, 0),
> @@ -944,7 +962,7 @@ static const struct vop_data rk3399_vop_big = {
>  	.version = VOP_VERSION(3, 5),
>  	.feature = VOP_FEATURE_OUTPUT_RGB10,
>  	.intr = &rk3366_vop_intr,
> -	.common = &rk3288_common,
> +	.common = &rk3399_common,
>  	.modeset = &rk3288_modeset,
>  	.output = &rk3399_output,
>  	.afbc = &rk3399_vop_afbc,
> @@ -952,6 +970,7 @@ static const struct vop_data rk3399_vop_big = {
>  	.win = rk3399_vop_win_data,
>  	.win_size = ARRAY_SIZE(rk3399_vop_win_data),
>  	.win_yuv2yuv = rk3399_vop_big_win_yuv2yuv_data,
> +	.lut_size = 1024,
>  };
>  
>  static const struct vop_win_data rk3399_vop_lit_win_data[] = {
> @@ -970,13 +989,14 @@ static const struct vop_win_yuv2yuv_data rk3399_vop_lit_win_yuv2yuv_data[] = {
>  static const struct vop_data rk3399_vop_lit = {
>  	.version = VOP_VERSION(3, 6),
>  	.intr = &rk3366_vop_intr,
> -	.common = &rk3288_common,
> +	.common = &rk3399_common,
>  	.modeset = &rk3288_modeset,
>  	.output = &rk3399_output,
>  	.misc = &rk3368_misc,
>  	.win = rk3399_vop_lit_win_data,
>  	.win_size = ARRAY_SIZE(rk3399_vop_lit_win_data),
>  	.win_yuv2yuv = rk3399_vop_lit_win_yuv2yuv_data,
> +	.lut_size = 256,
>  };
>  
>  static const struct vop_win_data rk3228_vop_win_data[] = {
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.h b/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
> index 0b3cd65ba5c1..406e981c75bd 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
> @@ -628,6 +628,7 @@
>  #define RK3399_YUV2YUV_WIN			0x02c0
>  #define RK3399_YUV2YUV_POST			0x02c4
>  #define RK3399_AUTO_GATING_EN			0x02cc
> +#define RK3399_DBG_POST_REG1			0x036c
>  #define RK3399_WIN0_CSC_COE			0x03a0
>  #define RK3399_WIN1_CSC_COE			0x03c0
>  #define RK3399_WIN2_CSC_COE			0x03e0
