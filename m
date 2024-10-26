Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C79F9B18F5
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 17:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD45B10E0C4;
	Sat, 26 Oct 2024 15:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="PsLNUCgL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB5010E108
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 15:08:53 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4XbNMm0xWMzDqFC;
 Sat, 26 Oct 2024 15:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1729955332; bh=37ymUSLy/WZsWp4KgcCO90jZ08a6qeob/RoGfxbDwWg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PsLNUCgLjQW7+GiM1tn6xeXt3kbmo51SnYXqWTHL9FOyW2CpRFL7ii04uS3rx5A/y
 FlvrNkeZIHMFmLY6Y1oGRGtLcJg05fySw6ttt2d6OoznwMnngj90unVMDNkYF/DcvL
 KLLO9htx1lYPEdhtq+/5sFKDyOZkFgdKGiFOZ+io=
X-Riseup-User-ID: 32B0ED6C68EDD35F28DFBFFDC01B9FA8D5CD208960BF2E7AB0B435EE1D4F2A46
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4XbNMf214TzFqLF;
 Sat, 26 Oct 2024 15:08:45 +0000 (UTC)
Message-ID: <2af1f9b4-0bc8-4585-ba13-d3b97e25845f@riseup.net>
Date: Sat, 26 Oct 2024 12:08:44 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] drm/vkms: Add a macro for write_line functions
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com>
 <20240814-writeback_line_by_line-v2-2-36541c717569@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20240814-writeback_line_by_line-v2-2-36541c717569@bootlin.com>
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

Hi Louis,

On 14/08/24 05:42, Louis Chauvet wrote:
> As stated in [2], the write_line functions are very similar and force code

Where is [2]?

> duplication. This patch add a macro to avoid code repetition.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 107 ++++++++++--------------------------
>   1 file changed, 30 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index d1309f6d307f..a25cdf656d8a 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -654,6 +654,31 @@ static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
>   	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
>   }
>   
> +/**
> + * WRITE_LINE() - Generic generator for write_line functions
> + *
> + * This generator can only be used for format with only one plane and block_w == block_h == 1
> + *
> + * @function_name: Name to use for the generated function
> + * @conversion_function: Fonction to use for the conversion from argb_u16 to the required format.

s/Fonction/Function

> + */
> +#define WRITE_LINE(function_name, conversion_function)					\
> +static void function_name(struct vkms_writeback_job *wb,				\
> +			  struct pixel_argb_u16 *src_pixels, int count, int x_start,	\
> +			  int y_start)							\
> +{											\
> +	u8 *dst_pixels;									\
> +											\
> +	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);	\
> +											\
> +	while (count) {									\
> +		(conversion_function)(dst_pixels, src_pixels);				\
> +		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];		\
> +		src_pixels += 1;							\
> +		count--;								\

Just a nit: What do you think about this loop?

for (; count > 0; src_pixels++, count--)

It doesn't really matter what option you pick.

Best Regards,
- Maíra

> +	}										\
> +}
> +
>   /*
>    * The following functions are write_line function for each pixel format supported by VKMS.
>    *
> @@ -667,85 +692,13 @@ static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
>    * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
>    */
>   
> -static void ARGB8888_write_line(struct vkms_writeback_job *wb,
> -				struct pixel_argb_u16 *src_pixels, int count, int x_start,
> -				int y_start)
> -{
> -	u8 *dst_pixels;
> +WRITE_LINE(ARGB8888_write_line, argb_u16_to_ARGB8888)
> +WRITE_LINE(XRGB8888_write_line, argb_u16_to_XRGB8888)
>   
> -	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
> +WRITE_LINE(ARGB16161616_write_line, argb_u16_to_ARGB16161616)
> +WRITE_LINE(XRGB16161616_write_line, argb_u16_to_XRGB16161616)
>   
> -	while (count) {
> -		argb_u16_to_ARGB8888(dst_pixels, src_pixels);
> -		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> -		src_pixels += 1;
> -		count--;
> -	}
> -}
> -
> -static void XRGB8888_write_line(struct vkms_writeback_job *wb,
> -				struct pixel_argb_u16 *src_pixels, int count, int x_start,
> -				int y_start)
> -{
> -	u8 *dst_pixels;
> -
> -	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
> -
> -	while (count) {
> -		argb_u16_to_XRGB8888(dst_pixels, src_pixels);
> -		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> -		src_pixels += 1;
> -		count--;
> -	}
> -}
> -
> -static void ARGB16161616_write_line(struct vkms_writeback_job *wb,
> -				    struct pixel_argb_u16 *src_pixels, int count, int x_start,
> -				    int y_start)
> -{
> -	u8 *dst_pixels;
> -
> -	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
> -
> -	while (count) {
> -		argb_u16_to_ARGB16161616(dst_pixels, src_pixels);
> -		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> -		src_pixels += 1;
> -		count--;
> -	}
> -}
> -
> -static void XRGB16161616_write_line(struct vkms_writeback_job *wb,
> -				    struct pixel_argb_u16 *src_pixels, int count, int x_start,
> -				    int y_start)
> -{
> -	u8 *dst_pixels;
> -
> -	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
> -
> -	while (count) {
> -		argb_u16_to_XRGB16161616(dst_pixels, src_pixels);
> -		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> -		src_pixels += 1;
> -		count--;
> -	}
> -}
> -
> -static void RGB565_write_line(struct vkms_writeback_job *wb,
> -			      struct pixel_argb_u16 *src_pixels, int count, int x_start,
> -			      int y_start)
> -{
> -	u8 *dst_pixels;
> -
> -	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
> -
> -	while (count) {
> -		argb_u16_to_RGB565(dst_pixels, src_pixels);
> -		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> -		src_pixels += 1;
> -		count--;
> -	}
> -}
> +WRITE_LINE(RGB565_write_line, argb_u16_to_RGB565)
>   
>   /**
>    * get_pixel_read_function() - Retrieve the correct read_line function for a specific
> 
