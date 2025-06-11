Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B13AD601B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 22:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBC910E720;
	Wed, 11 Jun 2025 20:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Vhg2KtV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE1610E282
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 20:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I1ROOz6q/EtfqWpNZah1S7LaOISIKhDuAQrSuQeGxzc=; b=Vhg2KtV0+qzSWlNWX9NfA84Kjh
 QMYR3gGu6ltzYWI0KGjwDBbYSZF/wtjMZQ07D40h9yJUUbUJCR0e3UfdXo3m+nkE1RwDBKvTJabwX
 W00qHCy7ul2CtbFXry6cxM2oHlXQl/Q/ThMliOlvF6SYuEXDrQtW8KaWjZozMCS6lV7tOMPtd8Rp+
 PZrL+giQ186jidXJIhrvKgibKMAtMoqRmmf9hevEu+XpFASa93W8OMaIGb/PIL1jfUm+ON6Mef4Ze
 Vn36OblS9nURA921ZCtUkFL+4rsuOnDQ+XE4wRg6tECaIBxALexqyx2jghy5JDMuUeQPW9MAQ0YdS
 AGU0W9vA==;
Received: from [187.36.208.198] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uPS7e-002MEE-QP; Wed, 11 Jun 2025 22:32:35 +0200
Message-ID: <87cc0c8e-5c25-49d1-88a5-52cc263c7c5f@igalia.com>
Date: Wed, 11 Jun 2025 17:32:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] drm/vkms: Create helper macro for YUV formats
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
 <20250530-b4-new-color-formats-v4-7-ef5f9f48376c@bootlin.com>
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
In-Reply-To: <20250530-b4-new-color-formats-v4-7-ef5f9f48376c@bootlin.com>
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

On 5/30/25 11:06, Louis Chauvet wrote:
> The callback functions for line conversion are almost identical for
> semi-planar formats. The generic READ_LINE_YUV_SEMIPLANAR macro
> generate all the required boilerplate to process a line from a
> semi-planar format.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 75 ++++++++++++++++++++++++-------------
>   1 file changed, 48 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 261e822e9618..8ecd75d063f4 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -485,35 +485,56 @@ READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
>    * - Convert YUV and YVU with the same function (a column swap is needed when setting up
>    * plane->conversion_matrix)
>    */
> -static void semi_planar_yuv_read_line(const struct vkms_plane_state *plane, int x_start,
> -				      int y_start, enum pixel_read_direction direction, int count,
> -				      struct pixel_argb_u16 out_pixel[])
> -{
> -	u8 *y_plane;
> -	u8 *uv_plane;
> -
> -	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0,
> -			       &y_plane);
> -	packed_pixels_addr_1x1(plane->frame_info,
> -			       x_start / plane->frame_info->fb->format->hsub,
> -			       y_start / plane->frame_info->fb->format->vsub, 1,
> -			       &uv_plane);
> -	int step_y = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> -	int step_uv = get_block_step_bytes(plane->frame_info->fb, direction, 1);
> -	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
> -	int subsampling_offset = get_subsampling_offset(direction, x_start, y_start);
> -	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;
>   
> -	for (int i = 0; i < count; i++) {
> -		*out_pixel = argb_u16_from_yuv161616(conversion_matrix, y_plane[0] * 257,
> -						     uv_plane[0] * 257, uv_plane[1] * 257);
> -		out_pixel += 1;
> -		y_plane += step_y;
> -		if ((i + subsampling_offset + 1) % subsampling == 0)
> -			uv_plane += step_uv;
> -	}
> +/**
> + * READ_LINE_YUV_SEMIPLANAR() - Generic generator for a read_line function which can be used for yuv
> + * formats with two planes and block_w == block_h == 1.
> + *
> + * @function_name: Function name to generate
> + * @pixel_1_name: temporary pixel name for the first plane used in the @__VA_ARGS__ parameters

s/temporary/Temporary

> + * @pixel_2_name: temporary pixel name for the second plane used in the @__VA_ARGS__ parameters
> + * @pixel_1_type: Used to specify the type you want to cast the pixel pointer on the plane 1
> + * @pixel_2_type: Used to specify the type you want to cast the pixel pointer on the plane 2
> + * @callback: Callback to call for each pixels. This function should take
> + *            (struct conversion_matrix*, @__VA_ARGS__) as parameter and return a pixel_argb_u16

s/struct conversion_matrix*/struct conversion_matrix *

> + * @__VA_ARGS__: Argument to pass inside the callback. You can use @pixel_1_name and @pixel_2_name
> + *               to access current pixel values
> + */
> +#define READ_LINE_YUV_SEMIPLANAR(function_name, pixel_1_name, pixel_2_name, pixel_1_type,	\
> +				 pixel_2_type, callback, ...)					\
> +static void function_name(const struct vkms_plane_state *plane, int x_start,			\
> +		 int y_start, enum pixel_read_direction direction, int count,			\
> +		 struct pixel_argb_u16 out_pixel[])						\
> +{												\
> +	u8 *plane_1;										\
> +	u8 *plane_2;										\

For now, how do you feel about keeping it as `y_plane` and `uv_plane`.
For me, it has more semantic information and eases the understanding.

With those nits,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> +												\
> +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0,				\
> +			       &plane_1);							\
> +	packed_pixels_addr_1x1(plane->frame_info,						\
> +			       x_start / plane->frame_info->fb->format->hsub,			\
> +			       y_start / plane->frame_info->fb->format->vsub, 1,		\
> +			       &plane_2);							\
> +	int step_1 = get_block_step_bytes(plane->frame_info->fb, direction, 0);			\
> +	int step_2 = get_block_step_bytes(plane->frame_info->fb, direction, 1);			\
> +	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);		\
> +	int subsampling_offset = get_subsampling_offset(direction, x_start, y_start);		\
> +	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;		\
> +												\
> +	for (int i = 0; i < count; i++) {							\
> +		pixel_1_type *(pixel_1_name) = (pixel_1_type *)plane_1;				\
> +		pixel_2_type *(pixel_2_name) = (pixel_2_type *)plane_2;				\
> +		*out_pixel = (callback)(conversion_matrix, __VA_ARGS__);			\
> +		out_pixel += 1;									\
> +		plane_1 += step_1;								\
> +		if ((i + subsampling_offset + 1) % subsampling == 0)				\
> +			plane_2 += step_2;							\
> +	}											\
>   }
>   
> +READ_LINE_YUV_SEMIPLANAR(YUV888_semiplanar_read_line, y, uv, u8, u8, argb_u16_from_yuv161616,
> +			 y[0] * 257, uv[0] * 257, uv[1] * 257)
> +
>   /*
>    * This callback can be used for YUV format where each color component is
>    * stored in a different plane (often called planar formats). It will
> @@ -713,7 +734,7 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
>   	case DRM_FORMAT_NV21:
>   	case DRM_FORMAT_NV61:
>   	case DRM_FORMAT_NV42:
> -		return &semi_planar_yuv_read_line;
> +		return &YUV888_semiplanar_read_line;
>   	case DRM_FORMAT_YUV420:
>   	case DRM_FORMAT_YUV422:
>   	case DRM_FORMAT_YUV444:
> 

