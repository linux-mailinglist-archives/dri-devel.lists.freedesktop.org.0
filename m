Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A734AD5F77
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 21:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A5010E6F5;
	Wed, 11 Jun 2025 19:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BSsuewaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E55310E737
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 19:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yuHqs9EnI0m/8KmCLjpcjeiwaERqEqTbJ5BxU9D0QFY=; b=BSsuewaCfoouBF0OJdhn3IgQPx
 3TiGq7chukdaZ4S97xnSIY1s/e9e8A+13zB9ibwXvsWhMf+fi8f887BnCZkXYcDq4USQQVgTBmrh8
 JD3qShd1HkXYEe58bXOEOOPPASsPmfuNmpky3CMcTenrWeHk23LgC/EQ2HQksieWD4+ULW/IDqFt8
 t2bLCEBdgJaNCwXSoQX8/qwkpVhjK/VAeAfH4SvcgmcsA8tWjQGqFd6H85376nyCRz5GOks944jBG
 hF57+KQogMmDMzPPFMxj2OiJexSYmybyuIorWYC1Cp/++72EGArnHS/RfNPIfr/NhZtX7KTa76RfM
 82UnBaBw==;
Received: from [187.36.208.198] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uPRU7-002LR5-Ux; Wed, 11 Jun 2025 21:51:44 +0200
Message-ID: <04450359-4f94-4ce6-a2ef-e8b3551d0761@igalia.com>
Date: Wed, 11 Jun 2025 16:51:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] drm/vkms: Create helpers macro to avoid code
 duplication in format callbacks
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20250530-b4-new-color-formats-v4-0-ef5f9f48376c@bootlin.com>
 <20250530-b4-new-color-formats-v4-1-ef5f9f48376c@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20250530-b4-new-color-formats-v4-1-ef5f9f48376c@bootlin.com>
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

On 5/30/25 11:05, Louis Chauvet wrote:
> The callback functions for line conversion are almost identical for
> some format. The generic READ_LINE macro generate all the required
> boilerplate to process a line.
> 
> Two overrides of this macro have been added to avoid duplication of
> the same arguments every time.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 186 ++++++++++++------------------------
>   1 file changed, 59 insertions(+), 127 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 6d0227c6635a..a9c624081dac 100644
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
> + * @function_name: Function name to generate
> + * @pixel_name: Temporary pixel name used in the @__VA_ARGS__ parameters
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
> + * READ_LINE_le16161616() - Generic generator for ARGB16161616 formats.
> + * The pixel type used is u16, so pixel_name[0]..pixel_name[n] are the n components of the pixel.
> + *
> + * @function_name: Function name to generate
> + * @pixel_name: temporary pixel to use in @a, @r, @g and @b parameters
> + * @a, @r, @g, @b: value of each channel
> + */
> +#define READ_LINE_le16161616(function_name, pixel_name, a, r, g, b) \
> +	READ_LINE(function_name, pixel_name, __le16, argb_u16_from_le16161616, a, r, g, b)
> +
>   /*
>    * The following functions are read_line function for each pixel format supported by VKMS.
>    *
> @@ -378,138 +430,18 @@ static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
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
>   
> -	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> +READ_LINE_ARGB8888(XRGB8888_read_line, px, 0xFF, px[2], px[1], px[0])
>   
> -	while (out_pixel < end) {
> -		*out_pixel = argb_u16_from_gray8(*src_pixels);
> -		src_pixels += step;
> -		out_pixel += 1;
> -	}
> -}
> +READ_LINE_ARGB8888(ARGB8888_read_line, px, px[3], px[2], px[1], px[0])
> +READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
>   
> -static void ARGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
> -			       enum pixel_read_direction direction, int count,
> -			       struct pixel_argb_u16 out_pixel[])
> -{
> -	struct pixel_argb_u16 *end = out_pixel + count;
> -	u8 *src_pixels;
> -
> -	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> +READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
> +READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
>   
> -	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> +READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
>   
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
> -static void ABGR8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
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
> -		/* Switch blue and red pixels. */
> -		*out_pixel = argb_u16_from_u8888(px[3], px[0], px[1], px[2]);
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
> -
> -	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> -
> -	while (out_pixel < end) {
> -		__le16 *px = (__le16 *)src_pixels;
> -		*out_pixel = argb_u16_from_le16161616(cpu_to_le16(0xFFFF), px[2], px[1], px[0]);
> -		out_pixel += 1;
> -		src_pixels += step;
> -	}
> -}
> -
> -static void RGB565_read_line(const struct vkms_plane_state *plane, int x_start,
> -			     int y_start, enum pixel_read_direction direction, int count,
> -			     struct pixel_argb_u16 out_pixel[])
> -{
> -	struct pixel_argb_u16 *end = out_pixel + count;
> -	u8 *src_pixels;
> -
> -	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> -
> -	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> -
> -	while (out_pixel < end) {
> -		__le16 *px = (__le16 *)src_pixels;
> -
> -		*out_pixel = argb_u16_from_RGB565(px);
> -		out_pixel += 1;
> -		src_pixels += step;
> -	}
> -}
> +READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
>   
>   /*
>    * This callback can be used for YUV formats where U and V values are
> 

