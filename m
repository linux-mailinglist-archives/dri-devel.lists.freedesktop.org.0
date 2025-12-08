Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E93ECABDF1
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 03:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D1110E390;
	Mon,  8 Dec 2025 02:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="cecY6BMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m155110.qiye.163.com (mail-m155110.qiye.163.com
 [101.71.155.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF7C10E391
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 02:48:31 +0000 (UTC)
Received: from [172.16.12.51] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2c54a2597;
 Mon, 8 Dec 2025 10:48:27 +0800 (GMT+08:00)
Message-ID: <f9f7b446-8575-4f16-aa96-5197b22846e3@rock-chips.com>
Date: Mon, 8 Dec 2025 10:48:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] drm/rockchip: vop2: Enforce AFBC source alignment
 in plane_check
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
 <20251206-vop2-atomic-fixups-v2-5-7fb45bbfbebd@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20251206-vop2-atomic-fixups-v2-5-7fb45bbfbebd@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9afbdc40e803abkunme8c07999276ba1c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhhISlZJS01CH0xNSUhIQkNWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=cecY6BMMm/6gQ/2K1RDh5tRiWZKU8O38FISd7rFWq0WnaAzGqbnG74DYW/5OX76YyJibVgxlKUeGLqykw3YxcmsttDzLWEiHTXe6IUFJgUa6FeaW3BIXEZgQvOpXS5Ur6s/5zek/X261ZJ0Ct245V+GgUw3u/kOSfOEZF7DJc+Q=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=++V9Ih2XOWHzt8kN5tDYhc2K8I+ECObECwQKC4d5xqk=;
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

Hello Nicolas, Daniel,

On 12/7/2025 4:45 AM, Nicolas Frattaroli wrote:
> From: Daniel Stone <daniels@collabora.com>
> 
> Planes can only source AFBC framebuffers at multiples of 4px wide on
> RK3566/RK3568. Instead of clipping on all SoCs when the user asks for an
> unaligned source rectangle, reject the configuration in the plane's
> atomic check on RK3566/RK3568 only.
> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>
> [Make RK3566/RK3568 specific, reword message]
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index bc1ed0ffede0..e23213337104 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1076,6 +1076,13 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
>  		return -EINVAL;
>  	}
>  
> +	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier) && src_w % 4) {
> +		drm_dbg_kms(vop2->drm,
> +			    "AFBC source rectangles must be 4-byte aligned; is %d\n",
> +			    src_w);
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1237,11 +1244,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
>  	WARN_ON(src_w < 4);
>  	WARN_ON(src_h < 4);
>  
> -	if (afbc_en && src_w % 4) {
> -		drm_dbg_kms(vop2->drm, "vp%d %s src_w[%d] not 4 pixel aligned\n",
> -			    vp->id, win->data->name, src_w);
> -		src_w = ALIGN_DOWN(src_w, 4);
> -	}
> +	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier))
> +		WARN_ON(src_w % 4);
>  
>  	act_info = (src_h - 1) << 16 | ((src_w - 1) & 0xffff);
>  	dsp_info = (dsp_h - 1) << 16 | ((dsp_w - 1) & 0xffff);
> 

You haven't replied to Andy's comment yet [0].

[0] https://lore.kernel.org/dri-devel/7b4e26ec.75f3.19a77276b53.Coremail.andyshrk@163.com/

-- 
Best, 
Chaoyi
