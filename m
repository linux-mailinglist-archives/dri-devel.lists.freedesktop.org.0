Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BF08A4F41
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87D511251F;
	Mon, 15 Apr 2024 12:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="SbJFW4qV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 534 seconds by postgrey-1.36 at gabe;
 Mon, 15 Apr 2024 12:40:23 UTC
Received: from mail-m49216.qiye.163.com (mail-m49216.qiye.163.com
 [45.254.49.216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1DC11251F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:40:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=SbJFW4qVuEaI4qcFvFthxSYZN4hPn7MyUoKzRBmeQfFIm3SP37qsqNN4ILlu0sJO5R/nhczUDH9lh3KNsJEJ83P6HwmxII+KR1Hfj1Kezs+6y5/oxgE8vrbbFOvbUFWAG49vJ/AXVl9zgXIDSuDca/M4nY+XqL+wCmz22kDKU3o=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
 bh=7fFzxdWwdQyIeDGK8d/RTm034/Lv0WNsN5Qi/0l6TgI=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTPA id 370E2840680;
 Mon, 15 Apr 2024 20:31:18 +0800 (CST)
Message-ID: <0bc127b7-ef34-49f6-92d5-03ec3633f694@rock-chips.com>
Date: Mon, 15 Apr 2024 20:31:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: vop2: Do not divide height twice for YUV
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stubner <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240414182706.655270-1-detlev.casanova@collabora.com>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20240414182706.655270-1-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhgfSFZKHklJTBhIQ05MHR1VEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5IVUpLS1VKQk
 tLWQY+
X-HM-Tid: 0a8ee1bd892703a4kunm370e2840680
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MiI6Lzo4STMKLwkiTj8VQ0NI
 TQhPCypVSlVKTEpISkNPSUxCSUlLVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBT09LQjcG
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

Hi,

On 4/15/24 02:27, Detlev Casanova wrote:
> For the cbcr format, gt2 and gt4 are computed again after src_h has been
> divided by vsub.
> 
> As src_h as already been divided by 2 before, introduce cbcr_src_h and
> cbcr_src_w to keep a copy of those values to be used for cbcr gt2 and
> gt4 computation.
> 
> This fixes yuv planes being unaligned vertically when down scaling to
> 1080 pixels from 2160.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")

Acked-by: Andy Yan <andy.yan@rock-chips.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 22 +++++++++++---------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index fdd768bbd487c..62ebbdb16253d 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -706,6 +706,8 @@ static void vop2_setup_scale(struct vop2 *vop2, const struct vop2_win *win,
>   	const struct drm_format_info *info;
>   	u16 hor_scl_mode, ver_scl_mode;
>   	u16 hscl_filter_mode, vscl_filter_mode;
> +	uint16_t cbcr_src_w = src_w;
> +	uint16_t cbcr_src_h = src_h;
>   	u8 gt2 = 0;
>   	u8 gt4 = 0;
>   	u32 val;
> @@ -763,27 +765,27 @@ static void vop2_setup_scale(struct vop2 *vop2, const struct vop2_win *win,
>   	vop2_win_write(win, VOP2_WIN_YRGB_VSCL_FILTER_MODE, vscl_filter_mode);
>   
>   	if (info->is_yuv) {
> -		src_w /= info->hsub;
> -		src_h /= info->vsub;
> +		cbcr_src_w /= info->hsub;
> +		cbcr_src_h /= info->vsub;
>   
>   		gt4 = 0;
>   		gt2 = 0;
>   
> -		if (src_h >= (4 * dst_h)) {
> +		if (cbcr_src_h >= (4 * dst_h)) {
>   			gt4 = 1;
> -			src_h >>= 2;
> -		} else if (src_h >= (2 * dst_h)) {
> +			cbcr_src_h >>= 2;
> +		} else if (cbcr_src_h >= (2 * dst_h)) {
>   			gt2 = 1;
> -			src_h >>= 1;
> +			cbcr_src_h >>= 1;
>   		}
>   
> -		hor_scl_mode = scl_get_scl_mode(src_w, dst_w);
> -		ver_scl_mode = scl_get_scl_mode(src_h, dst_h);
> +		hor_scl_mode = scl_get_scl_mode(cbcr_src_w, dst_w);
> +		ver_scl_mode = scl_get_scl_mode(cbcr_src_h, dst_h);
>   
> -		val = vop2_scale_factor(src_w, dst_w);
> +		val = vop2_scale_factor(cbcr_src_w, dst_w);
>   		vop2_win_write(win, VOP2_WIN_SCALE_CBCR_X, val);
>   
> -		val = vop2_scale_factor(src_h, dst_h);
> +		val = vop2_scale_factor(cbcr_src_h, dst_h);
>   		vop2_win_write(win, VOP2_WIN_SCALE_CBCR_Y, val);
>   
>   		vop2_win_write(win, VOP2_WIN_VSD_CBCR_GT4, gt4);
