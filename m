Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F5F9B1899
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 16:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B7510E406;
	Sat, 26 Oct 2024 14:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="OZPmkcOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EF010E406
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 14:30:02 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4XbMVx5PD7zDrQC;
 Sat, 26 Oct 2024 14:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1729953002; bh=3Hz0FB8mphIPsVK/l2Coz4EpEE8fFacEh+OP9OSeJpU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OZPmkcOpzIsMpbkRDJmsCcVzlHeBCZatanV1R1eusNxWt36nN6/vSA7X24mWUX78V
 PhjCUa00PaxlwkHKuhSCpHGIHIh6fVuvtT4PWTHrnRY8L4JuhuCdESDDIBtyeVagGx
 z83lxjRuzKK5x9Bp94UJQc9435Ty33fYFWvb/QrY=
X-Riseup-User-ID: 870E5745E7D4399F44F820B46552A04B3AD346E43B82681AF776AE7B88BCFD3C
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4XbMVq2WnczJsbY;
 Sat, 26 Oct 2024 14:29:55 +0000 (UTC)
Message-ID: <0b595d86-dbb5-43ae-9eb4-5f611013f6e8@riseup.net>
Date: Sat, 26 Oct 2024 11:29:53 -0300
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v2 1/8] drm/vkms: Create helpers macro to avoid
 code duplication in format callbacks
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 20241007-yuv-v12-0-01c1ada6fec8@bootlin.com
References: <20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com>
 <20241007-b4-new-color-formats-v2-1-d47da50d4674@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20241007-b4-new-color-formats-v2-1-d47da50d4674@bootlin.com>
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

On 07/10/24 13:46, Louis Chauvet wrote:
> The callback functions for line conversion are almost identical for
> some format. The generic READ_LINE macro generate all the required
> boilerplate to process a line.
> 
> Two overrides of this macro have been added to avoid duplication of
> the same arguments every time.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 163 +++++++++++++-----------------------
>   1 file changed, 58 insertions(+), 105 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index f9841b8000c4..8f1bcca38148 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -292,6 +292,58 @@ VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1,
>   }
>   EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
>   
> +/**
> + * READ_LINE() - Generic generator for a read_line function which can be used for format with one
> + * plane and a block_h == block_w == 1.
> + *
> + * @function_name: Function name to generate > + * @pixel_name: temporary pixel name used in the @__VA_ARGS__ parameters

s/temporary/Temporary

> + * @pixel_type: Used to specify the type you want to cast the pixel pointer
> + * @callback: Callback to call for each pixels. This fonction should take @__VA_ARGS__ as parameter
> + *            and return a pixel_argb_u16
> + * @__VA_ARGS__: Argument to pass inside the callback. You can use @pixel_name to access current
> + *  pixel.
> + */
> +#define READ_LINE(function_name, pixel_name, pixel_type, callback, ...)				\
> +static void function_name(const struct vkms_plane_state *plane, int x_start,			\
> +			      int y_start, enum pixel_read_direction direction, int count,	\
> +			      struct pixel_argb_u16 out_pixel[])				\
> +{												\
> +	struct pixel_argb_u16 *end = out_pixel + count;						\
> +	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);			\
> +	u8 *src_pixels;										\
> +												\
> +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);		\
> +												\
> +	while (out_pixel < end) {								\
> +		pixel_type *(pixel_name) = (pixel_type *)src_pixels;				\
> +		*out_pixel = (callback)(__VA_ARGS__);						\
> +		out_pixel += 1;									\
> +		src_pixels += step;								\
> +	}											\
> +}
> +
> +/**
> + * READ_LINE_ARGB8888() - Generic generator for ARGB8888 formats.
> + * The pixel type used is u8, so pixel_name[0]..pixel_name[n] are the n components of the pixel.
> + *
> + * @function_name: Function name to generate
> + * @pixel_name: temporary pixel to use in @a, @r, @g and @b parameters
> + * @a, @r, @g, @b: value of each channel
> + */
> +#define READ_LINE_ARGB8888(function_name, pixel_name, a, r, g, b) \
> +	READ_LINE(function_name, pixel_name, u8, argb_u16_from_u8888, a, r, g, b)
> +/**
> + * READ_LINE_ARGB16161616() - Generic generator for ARGB16161616 formats.
> + * The pixel type used is u8, so pixel_name[0]..pixel_name[n] are the n components of the pixel.

s/u8/u16

Best Regard,
- Maíra

> + *
> + * @function_name: Function name to generate
> + * @pixel_name: temporary pixel to use in @a, @r, @g and @b parameters
> + * @a, @r, @g, @b: value of each channel
> + */
> +#define READ_LINE_16161616(function_name, pixel_name, a, r, g, b) \
> +	READ_LINE(function_name, pixel_name, u16, argb_u16_from_u16161616, a, r, g, b)
> +
>   /*
>    * The following functions are read_line function for each pixel format supported by VKMS.
>    *
> @@ -378,118 +430,19 @@ static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
>   	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel);
>   }
>   
> -static void R8_read_line(const struct vkms_plane_state *plane, int x_start,
> -			 int y_start, enum pixel_read_direction direction, int count,
> -			 struct pixel_argb_u16 out_pixel[])
> -{
> -	struct pixel_argb_u16 *end = out_pixel + count;
> -	u8 *src_pixels;
> -	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> -
> -	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> -
> -	while (out_pixel < end) {
> -		*out_pixel = argb_u16_from_gray8(*src_pixels);
> -		src_pixels += step;
> -		out_pixel += 1;
> -	}
> -}
> -
> -static void ARGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
> -			       enum pixel_read_direction direction, int count,
> -			       struct pixel_argb_u16 out_pixel[])
> -{
> -	struct pixel_argb_u16 *end = out_pixel + count;
> -	u8 *src_pixels;
> -
> -	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> -
> -	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> -
> -	while (out_pixel < end) {
> -		u8 *px = (u8 *)src_pixels;
> -		*out_pixel = argb_u16_from_u8888(px[3], px[2], px[1], px[0]);
> -		out_pixel += 1;
> -		src_pixels += step;
> -	}
> -}
> -
> -static void XRGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
> -			       enum pixel_read_direction direction, int count,
> -			       struct pixel_argb_u16 out_pixel[])
> -{
> -	struct pixel_argb_u16 *end = out_pixel + count;
> -	u8 *src_pixels;
> -
> -	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> -
> -	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> -
> -	while (out_pixel < end) {
> -		u8 *px = (u8 *)src_pixels;
> -		*out_pixel = argb_u16_from_u8888(255, px[2], px[1], px[0]);
> -		out_pixel += 1;
> -		src_pixels += step;
> -	}
> -}
> -
> -static void ARGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
> -				   int y_start, enum pixel_read_direction direction, int count,
> -				   struct pixel_argb_u16 out_pixel[])
> -{
> -	struct pixel_argb_u16 *end = out_pixel + count;
> -	u8 *src_pixels;
> -
> -	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> -
> -	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> -
> -	while (out_pixel < end) {
> -		u16 *px = (u16 *)src_pixels;
> -		*out_pixel = argb_u16_from_u16161616(px[3], px[2], px[1], px[0]);
> -		out_pixel += 1;
> -		src_pixels += step;
> -	}
> -}
> -
> -static void XRGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
> -				   int y_start, enum pixel_read_direction direction, int count,
> -				   struct pixel_argb_u16 out_pixel[])
> -{
> -	struct pixel_argb_u16 *end = out_pixel + count;
> -	u8 *src_pixels;
> -
> -	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
>   
> -	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> +READ_LINE_ARGB8888(XRGB8888_read_line, px, 255, px[2], px[1], px[0])
>   
> -	while (out_pixel < end) {
> -		__le16 *px = (__le16 *)src_pixels;
> -		*out_pixel = argb_u16_from_le16161616(cpu_to_le16(0xFFFF), px[2], px[1], px[0]);
> -		out_pixel += 1;
> -		src_pixels += step;
> -	}
> -}
> +READ_LINE_ARGB8888(ARGB8888_read_line, px, px[3], px[2], px[1], px[0])
>   
> -static void RGB565_read_line(const struct vkms_plane_state *plane, int x_start,
> -			     int y_start, enum pixel_read_direction direction, int count,
> -			     struct pixel_argb_u16 out_pixel[])
> -{
> -	struct pixel_argb_u16 *end = out_pixel + count;
> -	u8 *src_pixels;
>   
> -	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> +READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0]);
> +READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0]);
>   
> -	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> +READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
>   
> -	while (out_pixel < end) {
> -		__le16 *px = (__le16 *)src_pixels;
> +READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
>   
> -		*out_pixel = argb_u16_from_RGB565(px);
> -		out_pixel += 1;
> -		src_pixels += step;
> -	}
> -}
>   
>   /*
>    * This callback can be used for YUV formats where U and V values are
> 
