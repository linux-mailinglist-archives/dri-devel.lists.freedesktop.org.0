Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 062B07D3E5D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 19:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB3710E229;
	Mon, 23 Oct 2023 17:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2717910E229
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 17:55:13 +0000 (UTC)
Received: from [IPv6:2a00:23c8:b70a:ae01:e088:d5b:55b6:2378] (unknown
 [IPv6:2a00:23c8:b70a:ae01:e088:d5b:55b6:2378])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: obbardc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C32EE6606F65;
 Mon, 23 Oct 2023 18:55:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698083711;
 bh=4fqfiXOwuLy2WxNBwd+ist9gTOJ0OxY1/MiSWMqUEkE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=d0/HfKCrKrdp62mwRVjhuO5jQGkNyCuPEvatT+zYrBzebZ/vh4x0tCB+Hu7/1AKgE
 fnLq7WG/rD8ld3yqzW4zdLJOV95LU8qsYBpA9p1cOLAZNuB/yPOf9D+fag5K/wo8x2
 8JYcORK4lRreFWLOsZHvJiaIQRe3SxbTyo8nNinvLqz9FTOpxbguwg7XjlE3uVXuEk
 Bdh6y5XCw24YfoBOLryfhLLFwgMTj5XA4kdp3nEHsoBiKO531pQDzrQxH2uryg/Zo6
 qleTxyOj5d8h3B9lA/iBqYMI1e83ivXMH8dAhqnFRJTOEh0QwZbCXlXiE0mbKCH95T
 GLI320AR6GiIg==
Message-ID: <6000957e6d7b977919eed4b7d6fe6c303066d18c.camel@collabora.com>
Subject: Re: [PATCH v5 2/2] drm/rockchip: vop: Add NV15, NV20 and NV30 support
From: Christopher Obbard <chris.obbard@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>, Sandy
 Huang <hjc@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 23 Oct 2023 18:55:10 +0100
In-Reply-To: <20231023173718.188102-3-jonas@kwiboo.se>
References: <20231023173718.188102-1-jonas@kwiboo.se>
 <20231023173718.188102-3-jonas@kwiboo.se>
Autocrypt: addr=chris.obbard@collabora.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
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
Cc: linux-rockchip@lists.infradead.org, kernel <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonas,

On Mon, 2023-10-23 at 17:37 +0000, Jonas Karlman wrote:
> Add support for displaying 10-bit 4:2:0 and 4:2:2 formats produced by
> the Rockchip Video Decoder on RK322X, RK3288, RK3328 and RK3399.
> Also add support for 10-bit 4:4:4 format while at it.
>=20
> V5: Use drm_format_info_min_pitch() for correct bpp
> =C2=A0=C2=A0=C2=A0 Add missing NV21, NV61 and NV42 formats
> V4: Rework RK3328/RK3399 win0/1 data to not affect RK3368
> V2: Added NV30 support
>=20
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Reviewed-by: Sandy Huang <hjc@rock-chips.com>

Reviewed-by: Christopher Obbard <chris.obbard@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>


Cheers!

Chris

> ---
> =C2=A0drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 36 ++++++++---
> =C2=A0drivers/gpu/drm/rockchip/rockchip_drm_vop.h |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 66 +++++++++++++++++-=
---
> =C2=A03 files changed, 86 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index 14320bc73e5b..b3d0b6ae9294 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -272,6 +272,18 @@ static bool has_uv_swapped(uint32_t format)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static bool is_fmt_10(uint32_t format)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_NV15:
> +	case DRM_FORMAT_NV20:
> +	case DRM_FORMAT_NV30:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> =C2=A0static enum vop_data_format vop_convert_format(uint32_t format)
> =C2=A0{
> =C2=A0	switch (format) {
> @@ -287,12 +299,15 @@ static enum vop_data_format
> vop_convert_format(uint32_t format)
> =C2=A0	case DRM_FORMAT_BGR565:
> =C2=A0		return VOP_FMT_RGB565;
> =C2=A0	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV15:
> =C2=A0	case DRM_FORMAT_NV21:
> =C2=A0		return VOP_FMT_YUV420SP;
> =C2=A0	case DRM_FORMAT_NV16:
> +	case DRM_FORMAT_NV20:
> =C2=A0	case DRM_FORMAT_NV61:
> =C2=A0		return VOP_FMT_YUV422SP;
> =C2=A0	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV30:
> =C2=A0	case DRM_FORMAT_NV42:
> =C2=A0		return VOP_FMT_YUV444SP;
> =C2=A0	default:
> @@ -944,7 +959,12 @@ static void vop_plane_atomic_update(struct drm_plane
> *plane,
> =C2=A0	dsp_sty =3D dest->y1 + crtc->mode.vtotal - crtc->mode.vsync_start;
> =C2=A0	dsp_st =3D dsp_sty << 16 | (dsp_stx & 0xffff);
> =C2=A0
> -	offset =3D (src->x1 >> 16) * fb->format->cpp[0];
> +	if (fb->format->char_per_block[0])
> +		offset =3D drm_format_info_min_pitch(fb->format, 0,
> +						=C2=A0=C2=A0 src->x1 >> 16);
> +	else
> +		offset =3D (src->x1 >> 16) * fb->format->cpp[0];
> +
> =C2=A0	offset +=3D (src->y1 >> 16) * fb->pitches[0];
> =C2=A0	dma_addr =3D rk_obj->dma_addr + offset + fb->offsets[0];
> =C2=A0
> @@ -970,6 +990,7 @@ static void vop_plane_atomic_update(struct drm_plane
> *plane,
> =C2=A0	}
> =C2=A0
> =C2=A0	VOP_WIN_SET(vop, win, format, format);
> +	VOP_WIN_SET(vop, win, fmt_10, is_fmt_10(fb->format->format));
> =C2=A0	VOP_WIN_SET(vop, win, yrgb_vir, DIV_ROUND_UP(fb->pitches[0], 4));
> =C2=A0	VOP_WIN_SET(vop, win, yrgb_mst, dma_addr);
> =C2=A0	VOP_WIN_YUV2YUV_SET(vop, win_yuv2yuv, y2r_en, is_yuv);
> @@ -979,15 +1000,16 @@ static void vop_plane_atomic_update(struct drm_pla=
ne
> *plane,
> =C2=A0		=C2=A0=C2=A0=C2=A0 (new_state->rotation & DRM_MODE_REFLECT_X) ? 1=
 : 0);
> =C2=A0
> =C2=A0	if (is_yuv) {
> -		int hsub =3D fb->format->hsub;
> -		int vsub =3D fb->format->vsub;
> -		int bpp =3D fb->format->cpp[1];
> -
> =C2=A0		uv_obj =3D fb->obj[1];
> =C2=A0		rk_uv_obj =3D to_rockchip_obj(uv_obj);
> =C2=A0
> -		offset =3D (src->x1 >> 16) * bpp / hsub;
> -		offset +=3D (src->y1 >> 16) * fb->pitches[1] / vsub;
> +		if (fb->format->char_per_block[1])
> +			offset =3D drm_format_info_min_pitch(fb->format, 1,
> +							=C2=A0=C2=A0 src->x1 >> 16);
> +		else
> +			offset =3D (src->x1 >> 16) * fb->format->cpp[1];
> +		offset /=3D fb->format->hsub;
> +		offset +=3D (src->y1 >> 16) * fb->pitches[1] / fb->format-
> >vsub;
> =C2=A0
> =C2=A0		dma_addr =3D rk_uv_obj->dma_addr + offset + fb->offsets[1];
> =C2=A0		VOP_WIN_SET(vop, win, uv_vir, DIV_ROUND_UP(fb->pitches[1],
> 4));
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> index 5f56e0597df8..4b2daefeb8c1 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> @@ -186,6 +186,7 @@ struct vop_win_phy {
> =C2=A0	struct vop_reg enable;
> =C2=A0	struct vop_reg gate;
> =C2=A0	struct vop_reg format;
> +	struct vop_reg fmt_10;
> =C2=A0	struct vop_reg rb_swap;
> =C2=A0	struct vop_reg uv_swap;
> =C2=A0	struct vop_reg act_info;
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> index 7b2805006776..f8cef0cb7bff 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> @@ -53,6 +53,26 @@ static const uint32_t formats_win_full[] =3D {
> =C2=A0	DRM_FORMAT_NV42,
> =C2=A0};
> =C2=A0
> +static const uint32_t formats_win_full_10[] =3D {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_BGR888,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_BGR565,
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_NV21,
> +	DRM_FORMAT_NV16,
> +	DRM_FORMAT_NV61,
> +	DRM_FORMAT_NV24,
> +	DRM_FORMAT_NV42,
> +	DRM_FORMAT_NV15,
> +	DRM_FORMAT_NV20,
> +	DRM_FORMAT_NV30,
> +};
> +
> =C2=A0static const uint64_t format_modifiers_win_full[] =3D {
> =C2=A0	DRM_FORMAT_MOD_LINEAR,
> =C2=A0	DRM_FORMAT_MOD_INVALID,
> @@ -627,11 +647,12 @@ static const struct vop_scl_regs rk3288_win_full_sc=
l =3D
> {
> =C2=A0
> =C2=A0static const struct vop_win_phy rk3288_win01_data =3D {
> =C2=A0	.scl =3D &rk3288_win_full_scl,
> -	.data_formats =3D formats_win_full,
> -	.nformats =3D ARRAY_SIZE(formats_win_full),
> +	.data_formats =3D formats_win_full_10,
> +	.nformats =3D ARRAY_SIZE(formats_win_full_10),
> =C2=A0	.format_modifiers =3D format_modifiers_win_full,
> =C2=A0	.enable =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
> =C2=A0	.format =3D VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
> +	.fmt_10 =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 4),
> =C2=A0	.rb_swap =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
> =C2=A0	.uv_swap =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 15),
> =C2=A0	.act_info =3D VOP_REG(RK3288_WIN0_ACT_INFO, 0x1fff1fff, 0),
> @@ -936,13 +957,38 @@ static const struct vop_win_yuv2yuv_data
> rk3399_vop_big_win_yuv2yuv_data[] =3D {
> =C2=A0
> =C2=A0};
> =C2=A0
> -static const struct vop_win_phy rk3399_win01_data =3D {
> +static const struct vop_win_phy rk3399_win0_data =3D {
> =C2=A0	.scl =3D &rk3288_win_full_scl,
> -	.data_formats =3D formats_win_full,
> -	.nformats =3D ARRAY_SIZE(formats_win_full),
> +	.data_formats =3D formats_win_full_10,
> +	.nformats =3D ARRAY_SIZE(formats_win_full_10),
> =C2=A0	.format_modifiers =3D format_modifiers_win_full_afbc,
> =C2=A0	.enable =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
> =C2=A0	.format =3D VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
> +	.fmt_10 =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 4),
> +	.rb_swap =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
> +	.uv_swap =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 15),
> +	.x_mir_en =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 21),
> +	.y_mir_en =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 22),
> +	.act_info =3D VOP_REG(RK3288_WIN0_ACT_INFO, 0x1fff1fff, 0),
> +	.dsp_info =3D VOP_REG(RK3288_WIN0_DSP_INFO, 0x0fff0fff, 0),
> +	.dsp_st =3D VOP_REG(RK3288_WIN0_DSP_ST, 0x1fff1fff, 0),
> +	.yrgb_mst =3D VOP_REG(RK3288_WIN0_YRGB_MST, 0xffffffff, 0),
> +	.uv_mst =3D VOP_REG(RK3288_WIN0_CBR_MST, 0xffffffff, 0),
> +	.yrgb_vir =3D VOP_REG(RK3288_WIN0_VIR, 0x3fff, 0),
> +	.uv_vir =3D VOP_REG(RK3288_WIN0_VIR, 0x3fff, 16),
> +	.src_alpha_ctl =3D VOP_REG(RK3288_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
> +	.dst_alpha_ctl =3D VOP_REG(RK3288_WIN0_DST_ALPHA_CTRL, 0xff, 0),
> +	.channel =3D VOP_REG(RK3288_WIN0_CTRL2, 0xff, 0),
> +};
> +
> +static const struct vop_win_phy rk3399_win1_data =3D {
> +	.scl =3D &rk3288_win_full_scl,
> +	.data_formats =3D formats_win_full_10,
> +	.nformats =3D ARRAY_SIZE(formats_win_full_10),
> +	.format_modifiers =3D format_modifiers_win_full,
> +	.enable =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
> +	.format =3D VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
> +	.fmt_10 =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 4),
> =C2=A0	.rb_swap =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
> =C2=A0	.uv_swap =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 15),
> =C2=A0	.x_mir_en =3D VOP_REG(RK3288_WIN0_CTRL0, 0x1, 21),
> @@ -965,9 +1011,9 @@ static const struct vop_win_phy rk3399_win01_data =
=3D {
> =C2=A0 * AFBC on the primary plane.
> =C2=A0 */
> =C2=A0static const struct vop_win_data rk3399_vop_win_data[] =3D {
> -	{ .base =3D 0x00, .phy =3D &rk3399_win01_data,
> +	{ .base =3D 0x00, .phy =3D &rk3399_win0_data,
> =C2=A0	=C2=A0 .type =3D DRM_PLANE_TYPE_PRIMARY },
> -	{ .base =3D 0x40, .phy =3D &rk3368_win01_data,
> +	{ .base =3D 0x40, .phy =3D &rk3399_win1_data,
> =C2=A0	=C2=A0 .type =3D DRM_PLANE_TYPE_OVERLAY },
> =C2=A0	{ .base =3D 0x00, .phy =3D &rk3368_win23_data,
> =C2=A0	=C2=A0 .type =3D DRM_PLANE_TYPE_OVERLAY },
> @@ -1099,11 +1145,11 @@ static const struct vop_intr rk3328_vop_intr =3D =
{
> =C2=A0};
> =C2=A0
> =C2=A0static const struct vop_win_data rk3328_vop_win_data[] =3D {
> -	{ .base =3D 0xd0, .phy =3D &rk3368_win01_data,
> +	{ .base =3D 0xd0, .phy =3D &rk3399_win1_data,
> =C2=A0	=C2=A0 .type =3D DRM_PLANE_TYPE_PRIMARY },
> -	{ .base =3D 0x1d0, .phy =3D &rk3368_win01_data,
> +	{ .base =3D 0x1d0, .phy =3D &rk3399_win1_data,
> =C2=A0	=C2=A0 .type =3D DRM_PLANE_TYPE_OVERLAY },
> -	{ .base =3D 0x2d0, .phy =3D &rk3368_win01_data,
> +	{ .base =3D 0x2d0, .phy =3D &rk3399_win1_data,
> =C2=A0	=C2=A0 .type =3D DRM_PLANE_TYPE_CURSOR },
> =C2=A0};
> =C2=A0
