Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E467C7D85
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 08:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D10910E59E;
	Fri, 13 Oct 2023 06:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1139310E59E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 06:11:18 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1qrBOA-0000k2-RY; Fri, 13 Oct 2023 08:11:10 +0200
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1qrBO6-001KGs-TN; Fri, 13 Oct 2023 08:11:06 +0200
Received: from sha by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1qrBO6-00EE47-Qo; Fri, 13 Oct 2023 08:11:06 +0200
Date: Fri, 13 Oct 2023 08:11:06 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH 3/3] drm/rockchip: fix the plane format defination of
 rk3568/6
Message-ID: <20231013061106.GH3359458@pengutronix.de>
References: <20231012023439.1497304-1-andyshrk@163.com>
 <20231012023705.1497648-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012023705.1497648-1-andyshrk@163.com>
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
Cc: sjoerd.simons@collabora.com, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 10:37:05AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The cluster windows on rk3568/6 only support afbc format,
> linear format(RGB/YUV) are not supported.
> The cluster windows on rk3588 support both linear and afbc rgb
> format, but for yuv format it only support afbc.
> 
> The esmart windows on rk3588 support uv swap for yuyv, but
> rk356x does not support it.

It's a bit hard to track which sentence in the description refers to
which change in the patch. Could you split this up into multiple patches
to make this easier reviewable?

Renaming of the formats could also be a separate patch. Patches marked
with "no functional change" are nice and easy to review.

> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 53 +++++++++++---------
>  1 file changed, 30 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 62b573f282a7..cde85a17f138 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -15,7 +15,11 @@
>  
>  #include "rockchip_drm_vop2.h"
>  
> -static const uint32_t formats_win_full_10bit[] = {
> +static const uint32_t formats_for_cluster[] = {

You can drop the "for_"

Sascha

> +	DRM_FORMAT_XRGB2101010,
> +	DRM_FORMAT_ARGB2101010,
> +	DRM_FORMAT_XBGR2101010,
> +	DRM_FORMAT_ABGR2101010,
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_ARGB8888,
>  	DRM_FORMAT_XBGR8888,
> @@ -24,12 +28,14 @@ static const uint32_t formats_win_full_10bit[] = {
>  	DRM_FORMAT_BGR888,
>  	DRM_FORMAT_RGB565,
>  	DRM_FORMAT_BGR565,
> -	DRM_FORMAT_NV12,
> -	DRM_FORMAT_NV16,
> -	DRM_FORMAT_NV24,
> +	DRM_FORMAT_YUV420_8BIT, /* yuv420_8bit non-Linear mode only */
> +	DRM_FORMAT_YUV420_10BIT, /* yuv420_10bit non-Linear mode only */
> +	DRM_FORMAT_YUYV, /* yuv422_8bit non-Linear mode only*/
> +	DRM_FORMAT_Y210, /* yuv422_10bit non-Linear mode only */
>  };
>  
> -static const uint32_t formats_win_full_10bit_yuyv[] = {
> +/* RK356x can't support uv swap for YUYV and UYVY */
> +static const uint32_t formats_for_rk356x_esmart[] = {
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_ARGB8888,
>  	DRM_FORMAT_XBGR8888,
> @@ -38,14 +44,15 @@ static const uint32_t formats_win_full_10bit_yuyv[] = {
>  	DRM_FORMAT_BGR888,
>  	DRM_FORMAT_RGB565,
>  	DRM_FORMAT_BGR565,
> -	DRM_FORMAT_NV12,
> -	DRM_FORMAT_NV16,
> -	DRM_FORMAT_NV24,
> -	DRM_FORMAT_YVYU,
> -	DRM_FORMAT_VYUY,
> +	DRM_FORMAT_NV12, /* yuv420_8bit linear mode, 2 plane */
> +	DRM_FORMAT_NV16, /* yuv422_8bit linear mode, 2 plane */
> +	DRM_FORMAT_NV24, /* yuv444_8bit linear mode, 2 plane */
> +	DRM_FORMAT_NV15, /* yuv420_10bit linear mode, 2 plane, no padding */
> +	DRM_FORMAT_YUYV, /* yuv422_8bit[YUYV] linear mode */
> +	DRM_FORMAT_UYVY, /* yuv422_8bit[UYVY] linear mode */
>  };
>  
> -static const uint32_t formats_win_lite[] = {
> +static const uint32_t formats_for_smart[] = {
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_ARGB8888,
>  	DRM_FORMAT_XBGR8888,
> @@ -144,8 +151,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>  		.name = "Smart0-win0",
>  		.phys_id = ROCKCHIP_VOP2_SMART0,
>  		.base = 0x1c00,
> -		.formats = formats_win_lite,
> -		.nformats = ARRAY_SIZE(formats_win_lite),
> +		.formats = formats_for_smart,
> +		.nformats = ARRAY_SIZE(formats_for_smart),
>  		.format_modifiers = format_modifiers,
>  		.layer_sel_id = 3,
>  		.supported_rotations = DRM_MODE_REFLECT_Y,
> @@ -156,8 +163,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>  	}, {
>  		.name = "Smart1-win0",
>  		.phys_id = ROCKCHIP_VOP2_SMART1,
> -		.formats = formats_win_lite,
> -		.nformats = ARRAY_SIZE(formats_win_lite),
> +		.formats = formats_for_smart,
> +		.nformats = ARRAY_SIZE(formats_for_smart),
>  		.format_modifiers = format_modifiers,
>  		.base = 0x1e00,
>  		.layer_sel_id = 7,
> @@ -169,8 +176,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>  	}, {
>  		.name = "Esmart1-win0",
>  		.phys_id = ROCKCHIP_VOP2_ESMART1,
> -		.formats = formats_win_full_10bit_yuyv,
> -		.nformats = ARRAY_SIZE(formats_win_full_10bit_yuyv),
> +		.formats = formats_for_rk356x_esmart,
> +		.nformats = ARRAY_SIZE(formats_for_rk356x_esmart),
>  		.format_modifiers = format_modifiers,
>  		.base = 0x1a00,
>  		.layer_sel_id = 6,
> @@ -182,8 +189,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>  	}, {
>  		.name = "Esmart0-win0",
>  		.phys_id = ROCKCHIP_VOP2_ESMART0,
> -		.formats = formats_win_full_10bit_yuyv,
> -		.nformats = ARRAY_SIZE(formats_win_full_10bit_yuyv),
> +		.formats = formats_for_rk356x_esmart,
> +		.nformats = ARRAY_SIZE(formats_for_rk356x_esmart),
>  		.format_modifiers = format_modifiers,
>  		.base = 0x1800,
>  		.layer_sel_id = 2,
> @@ -196,8 +203,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>  		.name = "Cluster0-win0",
>  		.phys_id = ROCKCHIP_VOP2_CLUSTER0,
>  		.base = 0x1000,
> -		.formats = formats_win_full_10bit,
> -		.nformats = ARRAY_SIZE(formats_win_full_10bit),
> +		.formats = formats_for_cluster,
> +		.nformats = ARRAY_SIZE(formats_for_cluster),
>  		.format_modifiers = format_modifiers_afbc,
>  		.layer_sel_id = 0,
>  		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
> @@ -211,8 +218,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>  		.name = "Cluster1-win0",
>  		.phys_id = ROCKCHIP_VOP2_CLUSTER1,
>  		.base = 0x1200,
> -		.formats = formats_win_full_10bit,
> -		.nformats = ARRAY_SIZE(formats_win_full_10bit),
> +		.formats = formats_for_cluster,
> +		.nformats = ARRAY_SIZE(formats_for_cluster),
>  		.format_modifiers = format_modifiers_afbc,
>  		.layer_sel_id = 1,
>  		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
> -- 
> 2.34.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
