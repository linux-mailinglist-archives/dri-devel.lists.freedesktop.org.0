Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5381BB1EFDB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 22:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A3610E02F;
	Fri,  8 Aug 2025 20:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U9KmCqY7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF7B10E02F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 20:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3UHBFltu+vWIROL/lI0FPk1dZsJaXVXBDCV7KGLpb8o=; b=U9KmCqY7P3ykFDOHf/nsSF+IIu
 orXKYqvEvrGXGrn40bEFIAEH1WQdOE8SXVDo6nA+aKFP9mzsLpBWpqajaWTtgK9X9C/Q+n4vui+q3
 awtIboJkKYEl7Z8W3rswP/o3CW77F8xZ84/C/p/xMcC0rDLbNpl3NKDkHpM9NdSX1CvlJXEfatUN7
 tpLMTfHJ2RYCN2m74LHKfncA92oqChTYBqDygG7uhD/TG6+r4CGpYaqkWO5+qmDqfsXfSqaPYzhY9
 m0coy7E1OTVEMRAIILDFJ9ZgmaN4mQxCxIXNARCnIcTXcvMoKB5ghEiuvdTtMNGwIdLwnhA/RJevx
 ZPy/9bNg==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ukTzu-00Bi2m-8O; Fri, 08 Aug 2025 22:47:30 +0200
Message-ID: <ffdd997c-51e0-40db-bdfd-ef4094bf1ad7@igalia.com>
Date: Fri, 8 Aug 2025 17:47:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/vc4: plane: Flag formats as having a minimum
 generation
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Robert Mader <robert.mader@collabora.com>
References: <20250807-drm-vc4-extra-formats-v2-0-fadc93844551@raspberrypi.com>
 <20250807-drm-vc4-extra-formats-v2-1-fadc93844551@raspberrypi.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250807-drm-vc4-extra-formats-v2-1-fadc93844551@raspberrypi.com>
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

On 07/08/25 10:28, Dave Stevenson wrote:
> The bool hvs5_only is now mis-named as they are also supported on
> hvs6, and we're about to add formats that are only supported on
> hvs6.
> 
> Change from a bool to an enum vc4_gen giving the minimum generation
> that supports the format.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vc4/vc4_plane.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index 056d344c5411..3bdd9466a7b0 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -35,7 +35,7 @@ static const struct hvs_format {
>   	u32 hvs; /* HVS_FORMAT_* */
>   	u32 pixel_order;
>   	u32 pixel_order_hvs5;
> -	bool hvs5_only;
> +	enum vc4_gen min_gen;
>   } hvs_formats[] = {
>   	{
>   		.drm = DRM_FORMAT_XRGB8888,
> @@ -161,31 +161,31 @@ static const struct hvs_format {
>   		.drm = DRM_FORMAT_P030,
>   		.hvs = HVS_PIXEL_FORMAT_YCBCR_10BIT,
>   		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
> -		.hvs5_only = true,
> +		.min_gen = VC4_GEN_5,
>   	},
>   	{
>   		.drm = DRM_FORMAT_XRGB2101010,
>   		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
>   		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ARGB,
> -		.hvs5_only = true,
> +		.min_gen = VC4_GEN_5,
>   	},
>   	{
>   		.drm = DRM_FORMAT_ARGB2101010,
>   		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
>   		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ARGB,
> -		.hvs5_only = true,
> +		.min_gen = VC4_GEN_5,
>   	},
>   	{
>   		.drm = DRM_FORMAT_ABGR2101010,
>   		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
>   		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ABGR,
> -		.hvs5_only = true,
> +		.min_gen = VC4_GEN_5,
>   	},
>   	{
>   		.drm = DRM_FORMAT_XBGR2101010,
>   		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
>   		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ABGR,
> -		.hvs5_only = true,
> +		.min_gen = VC4_GEN_5,
>   	},
>   	{
>   		.drm = DRM_FORMAT_RGB332,
> @@ -2524,7 +2524,7 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
>   	};
>   
>   	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
> -		if (!hvs_formats[i].hvs5_only || vc4->gen >= VC4_GEN_5) {
> +		if (vc4->gen >= hvs_formats[i].min_gen) {
>   			formats[num_formats] = hvs_formats[i].drm;
>   			num_formats++;
>   		}
> 

