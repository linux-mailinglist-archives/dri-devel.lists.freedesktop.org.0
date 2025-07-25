Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6518AB11DB4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 13:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC8110E1E0;
	Fri, 25 Jul 2025 11:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PUNBXaTv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D2610E1E0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 11:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yAamN9go1GWBowH4grgvGHuyYEmwy0Xef1vXhYyGgbU=; b=PUNBXaTvZM3SmUHZnDAh5xRhJh
 QVpZ5Op8xG677EtGUmH+IRU/7N2EU+h82dARUiKSrqip/4uSbZYDCTr5Q8p2+N1gePRwDkwEya+W/
 A4jrfDtFt1fYw79Rt2L4UxOrRtnFdBj9hG/VBD5rD8Dxm4hJnlGzBZQA/dDNDYJXQeBHqKgJPk/XX
 Q14zquXUPpSgCc6lF2W+0UN4Db7u+I91ilSyoVyM5RkUK8/zdCJKQLziXEXCBU7kDjySsXIu9K4Dd
 HW7+9Tpo/L/XpcAFLtdIrejARn3zHSMOo5x43YckzAvVgvgqxp4wW8yUqnr5ZXPyhWZrVO83XuNSh
 2lW0jxDQ==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ufGlu-003gf2-Oe; Fri, 25 Jul 2025 13:39:31 +0200
Message-ID: <e15c86ee-f53c-4a35-9167-0d846309488d@igalia.com>
Date: Fri, 25 Jul 2025 08:39:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vc4: plane: Add support for P01[026] and S01[026]
 formats
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Robert Mader <robert.mader@collabora.com>
References: <20250724-drm-vc4-extra-formats-v1-1-67fa80597fad@raspberrypi.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250724-drm-vc4-extra-formats-v1-1-67fa80597fad@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Dave,

On 24/07/25 13:11, Dave Stevenson wrote:
> There are now formats defined for 2-plane YUV420 at 10, 12,
> and 16 bit depth using the most significant bits of the 16bit
> word (P010, P012, and P016), and 3-plane YUV420 at those
> depths using the least significant bits of the 16 bit word
> (S010, S012, and S016).
> 
> VC4_GEN_6 can support all those formats although only using
> at most 10bits of resolution.
> Add them as supported formats for all planes, but filtered
> by hardware revision.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> We'd been asked if the S01x YUV formats could be supported on Pi5 as some
> software codecs produce them.
> The answer was yes, so this patch adds them and the P01x formats.
> ---
>   drivers/gpu/drm/vc4/vc4_plane.c | 54 ++++++++++++++++++++++++++++++++++++++---
>   drivers/gpu/drm/vc4/vc4_regs.h  |  9 +++++++
>   2 files changed, 59 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index 056d344c5411..3d1342751a80 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -36,6 +36,7 @@ static const struct hvs_format {
>   	u32 pixel_order;
>   	u32 pixel_order_hvs5;
>   	bool hvs5_only;
> +	bool hvs6_only;

Instead of adding a new boolean, what about adding a `enum vc4_gen
min_gen`? Then, you can just check if `vc4->gen <
hvs_formats[i].min_gen` in vc4_plane_init().

Best Regards,
- Maíra

>   } hvs_formats[] = {
>   	{
>   		.drm = DRM_FORMAT_XRGB8888,
> @@ -247,6 +248,42 @@ static const struct hvs_format {
>   		.pixel_order = HVS_PIXEL_ORDER_BGRA,
>   		.pixel_order_hvs5 = HVS_PIXEL_ORDER_RGBA,
>   	},
> +	{
> +		.drm = DRM_FORMAT_P010,
> +		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_2PLANE,
> +		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
> +		.hvs6_only = true,
> +	},
> +	{
> +		.drm = DRM_FORMAT_P012,
> +		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_2PLANE,
> +		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
> +		.hvs6_only = true,
> +	},
> +	{
> +		.drm = DRM_FORMAT_P016,
> +		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_2PLANE,
> +		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
> +		.hvs6_only = true,
> +	},
> +	{
> +		.drm = DRM_FORMAT_S010,
> +		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_9_0_3PLANE,
> +		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
> +		.hvs6_only = true,
> +	},
> +	{
> +		.drm = DRM_FORMAT_S012,
> +		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_11_2_3PLANE,
> +		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
> +		.hvs6_only = true,
> +	},
> +	{
> +		.drm = DRM_FORMAT_S016,
> +		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_3PLANE,
> +		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
> +		.hvs6_only = true,
> +	},
>   };
>   
>   static const struct hvs_format *vc4_get_hvs_format(u32 drm_format)
> @@ -2490,6 +2527,12 @@ static bool vc4_format_mod_supported(struct drm_plane *plane,
>   	case DRM_FORMAT_YVU420:
>   	case DRM_FORMAT_NV16:
>   	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_P010:
> +	case DRM_FORMAT_P012:
> +	case DRM_FORMAT_P016:
> +	case DRM_FORMAT_S010:
> +	case DRM_FORMAT_S012:
> +	case DRM_FORMAT_S016:
>   	default:
>   		return (modifier == DRM_FORMAT_MOD_LINEAR);
>   	}
> @@ -2524,10 +2567,13 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
>   	};
>   
>   	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
> -		if (!hvs_formats[i].hvs5_only || vc4->gen >= VC4_GEN_5) {
> -			formats[num_formats] = hvs_formats[i].drm;
> -			num_formats++;
> -		}
> +		if (hvs_formats[i].hvs5_only && vc4->gen < VC4_GEN_5)
> +			continue;
> +		if (hvs_formats[i].hvs6_only && vc4->gen < VC4_GEN_6_C)
> +			continue;
> +
> +		formats[num_formats] = hvs_formats[i].drm;
> +		num_formats++;
>   	}
>   
>   	vc4_plane = drmm_universal_plane_alloc(dev, struct vc4_plane, base,
> diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
> index 27158be19952..4536e3c0533b 100644
> --- a/drivers/gpu/drm/vc4/vc4_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_regs.h
> @@ -1079,6 +1079,15 @@ enum hvs_pixel_format {
>   	HVS_PIXEL_FORMAT_AYUV444_RGB = 15,
>   	HVS_PIXEL_FORMAT_RGBA1010102 = 16,
>   	HVS_PIXEL_FORMAT_YCBCR_10BIT = 17,
> +	/* 10 bit YUV420 formats with data with various alignments */
> +	HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_2PLANE = 24,
> +	HVS_PIXEL_FORMAT_YCBCR_YUV420_15_6_3PLANE = 25,
> +	HVS_PIXEL_FORMAT_YCBCR_YUV420_13_4_2PLANE = 26,
> +	HVS_PIXEL_FORMAT_YCBCR_YUV420_13_4_3PLANE = 27,
> +	HVS_PIXEL_FORMAT_YCBCR_YUV420_11_2_2PLANE = 28,
> +	HVS_PIXEL_FORMAT_YCBCR_YUV420_11_2_3PLANE = 29,
> +	HVS_PIXEL_FORMAT_YCBCR_YUV420_9_0_2PLANE = 30,
> +	HVS_PIXEL_FORMAT_YCBCR_YUV420_9_0_3PLANE = 31,
>   };
>   
>   /* Note: the LSB is the rightmost character shown.  Only valid for
> 
> ---
> base-commit: e48123c607a0db8b9ad02f83c8c3d39918dbda06
> change-id: 20250724-drm-vc4-extra-formats-1f53e6491cc1
> 
> Best regards,

