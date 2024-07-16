Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA229322BD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 11:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B9B10E2FF;
	Tue, 16 Jul 2024 09:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="J8lqRdXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E35010E2FF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 09:25:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C81220005;
 Tue, 16 Jul 2024 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1721121947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bw3XO9TaPkmvJGziVR8FQo3Mg0uUAJduf2jGPmbKZqQ=;
 b=J8lqRdXlo0NUJQV0dpwal+8u80SUlRgAc4EaJBuxlj67X8RvCEF/8rhnGWa3ctBragiO++
 srYgpOWglBXnrh7IslU1mp5KFboj5JJGAODCQurB4ltQ+MyC42nADc4llC+7yrwWGtZRnM
 lh3iKiYpWPMl408zQGR48ansshVH+ZbSy4oEvmJvqUJJWYwg5huvOTwKPrMFZjV66h962J
 hnK0FNxuCaGsPXLGbYJ64X1O77IXZam4lHxdzrkdNgvK7YhesO3JDy2iwDLa7ziqUZVYYc
 skYCVnkJvsi5RXKCeWlE30JooCCKJxyu09qXMit+wTqjV5SpJ7e6u8TS7uqXlw==
Date: Tue, 16 Jul 2024 11:25:45 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/vkms: Fix cpu_to_le16()/le16_to_cpu() warnings
Message-ID: <ZpY8mS0UtIPUu88i@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240715151625.6968-2-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240715151625.6968-2-jose.exposito89@gmail.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 15/07/24 - 17:16, José Expósito a écrit :
> Building with Sparse enabled prints this warning for cpu_to_le16()
> calls:
> 
>     warning: incorrect type in assignment (different base types)
>         expected unsigned short [usertype]
>         got restricted __le16 [usertype]
> 
> And this warning for le16_to_cpu() calls:
> 
>     warning: cast to restricted __le16
> 
> Declare the target buffer as __le16 to fix both warnings.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> ---
> 
> v1 -> v2: https://lore.kernel.org/dri-devel/20240712161656.7480-1-jose.exposito89@gmail.com/T/
> 
>  - Thomas Zimmermann: Declare "pixels" cariable as __le16 instead of
>    multiple casting.
> ---
>  drivers/gpu/drm/vkms/vkms_formats.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 36046b12f296..1ff535222bd4 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -75,7 +75,7 @@ static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixe
>  
>  static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
> -	u16 *pixels = (u16 *)src_pixels;
> +	__le16 *pixels = (__force __le16 *)src_pixels;

Hi,

I think you don't need __force for this cast, so you can remove it.

>  	out_pixel->a = le16_to_cpu(pixels[3]);
>  	out_pixel->r = le16_to_cpu(pixels[2]);
> @@ -85,7 +85,7 @@ static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
>  
>  static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
> -	u16 *pixels = (u16 *)src_pixels;
> +	__le16 *pixels = (__force __le16 *)src_pixels;
>  	out_pixel->a = (u16)0xffff;
>  	out_pixel->r = le16_to_cpu(pixels[2]);
> @@ -95,7 +95,7 @@ static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
>  
>  static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
> -	u16 *pixels = (u16 *)src_pixels;
> +	__le16 *pixels = (__force __le16 *)src_pixels;
>  
>  	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>  	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> @@ -178,7 +178,7 @@ static void argb_u16_to_XRGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel
>  
>  static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>  {
> -	u16 *pixels = (u16 *)dst_pixels;
> +	__le16 *pixels = (__force __le16 *)dst_pixels;
>
>  	pixels[3] = cpu_to_le16(in_pixel->a);
>  	pixels[2] = cpu_to_le16(in_pixel->r);
> @@ -188,9 +188,9 @@ static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_p
>  
>  static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>  {
> -	u16 *pixels = (u16 *)dst_pixels;
> +	__le16 *pixels = (__force __le16 *)dst_pixels;
>
> -	pixels[3] = 0xffff;
> +	pixels[3] = (__force __le16)0xffff;

I agree with Thomas Zimmerman, I prefer cpu_to_le16().

With or without those modifications:

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Thanks,
Louis Chauvet

>  	pixels[2] = cpu_to_le16(in_pixel->r);
>  	pixels[1] = cpu_to_le16(in_pixel->g);
>  	pixels[0] = cpu_to_le16(in_pixel->b);
> @@ -198,7 +198,7 @@ static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_p
>  
>  static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>  {
> -	u16 *pixels = (u16 *)dst_pixels;
> +	__le16 *pixels = (__force __le16 *)dst_pixels;
>  
>  	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>  	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> -- 
> 2.45.2
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
