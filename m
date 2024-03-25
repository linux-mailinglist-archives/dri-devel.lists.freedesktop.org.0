Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B324C88A46E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 15:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E15A10E31D;
	Mon, 25 Mar 2024 14:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QVfzEc8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1137210E91C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uUqMG4Rlt4GSQox3FafJY2HAmkIghLTgTx7VqlpFR0E=; b=QVfzEc8+R1o4KYn8Pd+tMNHmc2
 OQ3npR2f0aYPhiI9rEFxyBhRzUfQpeKcDMvWwg8q9vQ/AiuV3kbu2r7S4W37eMAqJkNDT6rB6UerQ
 U6jHyPAFbV4qkzhDMX5UiFzbfAQO6iwE6A+yuHNHsKfKJgYs6a7hlG6M+GlAJA8zdc50TaEPFLw3b
 IJiv/G+lYyOZdkLgBbKAiycBANM8qvPcbplbM4b/VJMVsarwuhAvU0txPt0mEBR5utNGIGqhG9TXx
 Sk3sJYyYPxuk3gv2vB9jmH+h/8xiPsjDXoO/OFOTyLQ1lqJgDKavntZmBUWZH5epB71+OYmPnntF+
 oyym+dxg==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rolHs-00F5qt-3M; Mon, 25 Mar 2024 15:26:56 +0100
Message-ID: <e5d8297f-3e1f-459f-bef2-3a91f2caf94f@igalia.com>
Date: Mon, 25 Mar 2024 11:26:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] drm/vkms: Add YUV support
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-11-e610cbd03f52@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240313-yuv-v5-11-e610cbd03f52@bootlin.com>
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

On 3/13/24 14:45, Louis Chauvet wrote:
> From: Arthur Grillo <arthurgrillo@riseup.net>
> 
> Add support to the YUV formats bellow:
> 
> - NV12/NV16/NV24
> - NV21/NV61/NV42
> - YUV420/YUV422/YUV444
> - YVU420/YVU422/YVU444
> 
> The conversion from yuv to rgb is done with fixed-point arithmetic, using
> 32.32 floats and the drm_fixed helpers.
> 
> To do the conversion, a specific matrix must be used for each color range
> (DRM_COLOR_*_RANGE) and encoding (DRM_COLOR_*). This matrix is stored in
> the `conversion_matrix` struct, along with the specific y_offset needed.
> This matrix is queried only once, in `vkms_plane_atomic_update` and
> stored in a `vkms_plane_state`. Those conversion matrices of each
> encoding and range were obtained by rounding the values of the original
> conversion matrices multiplied by 2^32. This is done to avoid the use of
> floating point operations.
> 
> The same reading function is used for YUV and YVU formats. As the only
> difference between those two category of formats is the order of field, a
> simple swap in conversion matrix columns allows using the same function.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> [Louis Chauvet:
> - Adapted Arthur's work
> - Implemented the read_line_t callbacks for yuv
> - add struct conversion_matrix
> - remove struct pixel_yuv_u8
> - update the commit message
> - Merge the modifications from Arthur]

A Co-developed-by tag would be more appropriate.

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_drv.h     |  22 ++
>   drivers/gpu/drm/vkms/vkms_formats.c | 431 ++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_formats.h |   4 +
>   drivers/gpu/drm/vkms/vkms_plane.c   |  17 +-
>   4 files changed, 473 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 23e1d247468d..f3116084de5a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -99,6 +99,27 @@ typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_st
>   				  int y_start, enum pixel_read_direction direction, int count,
>   				  struct pixel_argb_u16 out_pixel[]);
>   
> +/**
> + * CONVERSION_MATRIX_FLOAT_DEPTH - Number of digits after the point for conversion matrix values
> + */
> +#define CONVERSION_MATRIX_FLOAT_DEPTH 32
> +
> +/**
> + * struct conversion_matrix - Matrix to use for a specific encoding and range
> + *
> + * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a row-major manner and is
> + * used to compute rgb values from yuv values:
> + *     [[r],[g],[b]] = @matrix * [[y],[u],[v]]
> + *   OR for yvu formats:
> + *     [[r],[g],[b]] = @matrix * [[y],[v],[u]]
> + *  The values of the matrix are fixed floats, 32.CONVERSION_MATRIX_FLOAT_DEPTH > + * @y_offest: Offset to apply on the y value.

s/y_offest/y_offset

> + */
> +struct conversion_matrix {
> +	s64 matrix[3][3];
> +	s64 y_offset;
> +};
> +
>   /**
>    * vkms_plane_state - Driver specific plane state
>    * @base: base plane state
> @@ -110,6 +131,7 @@ struct vkms_plane_state {
>   	struct drm_shadow_plane_state base;
>   	struct vkms_frame_info *frame_info;
>   	pixel_read_line_t pixel_read_line;
> +	struct conversion_matrix *conversion_matrix;

Add @conversion_matrix on the kernel-doc from the struct
vkms_plane_state.

>   };
>   
>   struct vkms_plane {
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 1449a0e6c706..edbf4b321b91 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -105,6 +105,44 @@ static int get_step_next_block(struct drm_framebuffer *fb, enum pixel_read_direc
>   	return 0;
>   }
>   
> +/**
> + * get_subsampling() - Get the subsampling divisor value on a specific direction

Where are the arguments?

> + */
> +static int get_subsampling(const struct drm_format_info *format,
> +			   enum pixel_read_direction direction)
> +{
> +	switch (direction) {
> +	case READ_BOTTOM_TO_TOP:
> +	case READ_TOP_TO_BOTTOM:
> +		return format->vsub;
> +	case READ_RIGHT_TO_LEFT:
> +	case READ_LEFT_TO_RIGHT:
> +		return format->hsub;
> +	}
> +	WARN_ONCE(true, "Invalid direction for pixel reading: %d\n", direction);
> +	return 1;
> +}
> +
> +/**
> + * get_subsampling_offset() - An offset for keeping the chroma siting consistent regardless of
> + * x_start and y_start values

Same.

> + */
> +static int get_subsampling_offset(enum pixel_read_direction direction, int x_start, int y_start)
> +{
> +	switch (direction) {
> +	case READ_BOTTOM_TO_TOP:
> +		return -y_start - 1;
> +	case READ_TOP_TO_BOTTOM:
> +		return y_start;
> +	case READ_RIGHT_TO_LEFT:
> +		return -x_start - 1;
> +	case READ_LEFT_TO_RIGHT:
> +		return x_start;
> +	}
> +	WARN_ONCE(true, "Invalid direction for pixel reading: %d\n", direction);
> +	return 0;
> +}
> +
>   /*
>    * The following  functions take pixel data (a, r, g, b, pixel, ...), convert them to the format
>    * ARGB16161616 in out_pixel.
> @@ -161,6 +199,42 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
>   	return out_pixel;
>   }
>   

[...]

>   
> +/**
> + * get_conversion_matrix_to_argb_u16() - Retrieve the correct yuv to rgb conversion matrix for a
> + * given encoding and range.
> + *
> + * If the matrix is not found, return a null pointer. In all other cases, it return a simple
> + * diagonal matrix, which act as a "no-op".
> + *
> + * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> + * @encoding: DRM_COLOR_* value for which to obtain a conversion matrix
> + * @range: DRM_COLOR_*_RANGE value for which to obtain a conversion matrix

A bit odd to see the arguments after the description.

> + */
> +struct conversion_matrix *
> +get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
> +				  enum drm_color_range range)
> +{
> +	static struct conversion_matrix no_operation = {
> +		.matrix = {
> +			{ 4294967296, 0,          0, },
> +			{ 0,          4294967296, 0, },
> +			{ 0,          0,          4294967296, },
> +		},
> +		.y_offset = 0,
> +	};
> +
> +	/*
> +	 * Those matrixies were generated using the colour python framework
> +	 *
> +	 * Below are the function calls used to generate eac matrix, go to
> +	 * https://colour.readthedocs.io/en/develop/generated/colour.matrix_YCbCr.html
> +	 * for more info:
> +	 *
> +	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> +	 *                                  is_legal = False,
> +	 *                                  bits = 8) * 2**32).astype(int)
> +	 */
> +	static struct conversion_matrix yuv_bt601_full = {
> +		.matrix = {
> +			{ 4294967296, 0,           6021544149 },
> +			{ 4294967296, -1478054095, -3067191994 },
> +			{ 4294967296, 7610682049,  0 },
> +		},
> +		.y_offset = 0,
> +	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> +	 *                                  is_legal = True,
> +	 *                                  bits = 8) * 2**32).astype(int)
> +	 */
> +	static struct conversion_matrix yuv_bt601_limited = {
> +		.matrix = {
> +			{ 5020601039, 0,           6881764740 },
> +			{ 5020601039, -1689204679, -3505362278 },
> +			{ 5020601039, 8697922339,  0 },
> +		},
> +		.y_offset = 16,
> +	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
> +	 *                                  is_legal = False,
> +	 *                                  bits = 8) * 2**32).astype(int)
> +	 */
> +	static struct conversion_matrix yuv_bt709_full = {
> +		.matrix = {
> +			{ 4294967296, 0,          6763714498 },
> +			{ 4294967296, -804551626, -2010578443 },
> +			{ 4294967296, 7969741314, 0 },
> +		},
> +		.y_offset = 0,
> +	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
> +	 *                                  is_legal = True,
> +	 *                                  bits = 8) * 2**32).astype(int)
> +	 */
> +	static struct conversion_matrix yuv_bt709_limited = {
> +		.matrix = {
> +			{ 5020601039, 0,          7729959424 },
> +			{ 5020601039, -919487572, -2297803934 },
> +			{ 5020601039, 9108275786, 0 },
> +		},
> +		.y_offset = 16,
> +	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
> +	 *                                  is_legal = False,
> +	 *                                  bits = 8) * 2**32).astype(int)
> +	 */
> +	static struct conversion_matrix yuv_bt2020_full = {
> +		.matrix = {
> +			{ 4294967296, 0,          6333358775 },
> +			{ 4294967296, -706750298, -2453942994 },
> +			{ 4294967296, 8080551471, 0 },
> +		},
> +		.y_offset = 0,
> +	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
> +	 *                                  is_legal = True,
> +	 *                                  bits = 8) * 2**32).astype(int)
> +	 */
> +	static struct conversion_matrix yuv_bt2020_limited = {
> +		.matrix = {
> +			{ 5020601039, 0,          7238124312 },
> +			{ 5020601039, -807714626, -2804506279 },
> +			{ 5020601039, 9234915964, 0 },
> +		},
> +		.y_offset = 16,
> +	};
> +
> +	/*
> +	 * The next matrices are just the previous ones, but with the first and
> +	 * second columns swapped
> +	 */
> +	static struct conversion_matrix yvu_bt601_full = {
> +		.matrix = {
> +			{ 4294967296, 6021544149,  0 },
> +			{ 4294967296, -3067191994, -1478054095 },
> +			{ 4294967296, 0,           7610682049 },
> +		},
> +		.y_offset = 0,
> +	};
> +	static struct conversion_matrix yvu_bt601_limited = {
> +		.matrix = {
> +			{ 5020601039, 6881764740,  0 },
> +			{ 5020601039, -3505362278, -1689204679 },
> +			{ 5020601039, 0,           8697922339 },
> +		},
> +		.y_offset = 16,
> +	};
> +	static struct conversion_matrix yvu_bt709_full = {
> +		.matrix = {
> +			{ 4294967296, 6763714498,  0 },
> +			{ 4294967296, -2010578443, -804551626 },
> +			{ 4294967296, 0,           7969741314 },
> +		},
> +		.y_offset = 0,
> +	};
> +	static struct conversion_matrix yvu_bt709_limited = {
> +		.matrix = {
> +			{ 5020601039, 7729959424,  0 },
> +			{ 5020601039, -2297803934, -919487572 },
> +			{ 5020601039, 0,           9108275786 },
> +		},
> +		.y_offset = 16,
> +	};
> +	static struct conversion_matrix yvu_bt2020_full = {
> +		.matrix = {
> +			{ 4294967296, 6333358775,  0 },
> +			{ 4294967296, -2453942994, -706750298 },
> +			{ 4294967296, 0,           8080551471 },
> +		},
> +		.y_offset = 0,
> +	};
> +	static struct conversion_matrix yvu_bt2020_limited = {
> +		.matrix = {
> +			{ 5020601039, 7238124312,  0 },
> +			{ 5020601039, -2804506279, -807714626 },
> +			{ 5020601039, 0,           9234915964 },
> +		},
> +		.y_offset = 16,
> +	};
> +
> +	/* Breaking in this switch means that the color format+encoding+range is not supported */

s/color format+encoding+range/color format + encoding + range

> +	switch (format) {
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV16:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
> +		switch (encoding) {
> +		case DRM_COLOR_YCBCR_BT601:
> +			switch (range) {
> +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> +				return &yuv_bt601_limited;
> +			case DRM_COLOR_YCBCR_FULL_RANGE:
> +				return &yuv_bt601_full;
> +			case DRM_COLOR_RANGE_MAX:
> +				break;
> +			}
> +			break;
> +		case DRM_COLOR_YCBCR_BT709:
> +			switch (range) {
> +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> +				return &yuv_bt709_limited;
> +			case DRM_COLOR_YCBCR_FULL_RANGE:
> +				return &yuv_bt709_full;
> +			case DRM_COLOR_RANGE_MAX:
> +				break;
> +			}
> +			break;
> +		case DRM_COLOR_YCBCR_BT2020:
> +			switch (range) {
> +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> +				return &yuv_bt2020_limited;
> +			case DRM_COLOR_YCBCR_FULL_RANGE:
> +				return &yuv_bt2020_full;
> +			case DRM_COLOR_RANGE_MAX:
> +				break;
> +			}
> +			break;
> +		case DRM_COLOR_ENCODING_MAX:
> +			break;
> +		}
> +		break;
> +	case DRM_FORMAT_YVU420:
> +	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
> +	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_NV42:
> +		switch (encoding) {
> +		case DRM_COLOR_YCBCR_BT601:
> +			switch (range) {
> +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> +				return &yvu_bt601_limited;
> +			case DRM_COLOR_YCBCR_FULL_RANGE:
> +				return &yvu_bt601_full;
> +			case DRM_COLOR_RANGE_MAX:
> +				break;
> +			}
> +			break;
> +		case DRM_COLOR_YCBCR_BT709:
> +			switch (range) {
> +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> +				return &yvu_bt709_limited;
> +			case DRM_COLOR_YCBCR_FULL_RANGE:
> +				return &yvu_bt709_full;
> +			case DRM_COLOR_RANGE_MAX:
> +				break;
> +			}
> +			break;
> +		case DRM_COLOR_YCBCR_BT2020:
> +			switch (range) {
> +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> +				return &yvu_bt2020_limited;
> +			case DRM_COLOR_YCBCR_FULL_RANGE:
> +				return &yvu_bt2020_full;
> +			case DRM_COLOR_RANGE_MAX:
> +				break;
> +			}
> +			break;
> +		case DRM_COLOR_ENCODING_MAX:
> +			break;
> +		}
> +		break;
> +	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_ARGB16161616:
> +	case DRM_FORMAT_XRGB16161616:
> +	case DRM_FORMAT_RGB565:
> +		/*
> +		 * Those formats are supported, but they don't need a conversion matrix. Return
> +		 * a valid pointer to avoid kernel panic in case this matrix is used/checked
> +		 * somewhere.
> +		 */
> +		return &no_operation;
> +	default:
> +		break;
> +	}
> +	WARN(true, "Unsupported encoding (%d), range (%d) and format (%p4cc) combination\n",
> +	     encoding, range, &format);
> +	return &no_operation;
> +}
> +
>   /**
>    * Retrieve the correct write_pixel function for a specific format.
>    * If the format is not supported by VKMS a warn is emitted and a dummy "don't do anything"
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index 8d2bef95ff79..e1d324764b17 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -9,4 +9,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format);
>   
>   pixel_write_t get_pixel_write_function(u32 format);
>   
> +struct conversion_matrix *
> +get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
> +				  enum drm_color_range range);
> +
>   #endif /* _VKMS_FORMATS_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 8875bed76410..987dd2b686a8 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -17,7 +17,19 @@ static const u32 vkms_formats[] = {
>   	DRM_FORMAT_XRGB8888,
>   	DRM_FORMAT_XRGB16161616,
>   	DRM_FORMAT_ARGB16161616,
> -	DRM_FORMAT_RGB565
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_NV16,
> +	DRM_FORMAT_NV24,
> +	DRM_FORMAT_NV21,
> +	DRM_FORMAT_NV61,
> +	DRM_FORMAT_NV42,
> +	DRM_FORMAT_YUV420,
> +	DRM_FORMAT_YUV422,
> +	DRM_FORMAT_YUV444,
> +	DRM_FORMAT_YVU420,
> +	DRM_FORMAT_YVU422,
> +	DRM_FORMAT_YVU444

Let's add a comma by the end of this entry, to avoid deleting this line
when adding a new format.

>   };
>   
>   static struct drm_plane_state *
> @@ -117,12 +129,15 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>   	drm_framebuffer_get(frame_info->fb);
>   	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
>   									  DRM_MODE_ROTATE_90 |
> +									  DRM_MODE_ROTATE_180 |

Why do we need to add DRM_MODE_ROTATE_180 here? Isn't the same as
reflecting both along the X and Y axis?

Best Regards,
- Maíra

>   									  DRM_MODE_ROTATE_270 |
>   									  DRM_MODE_REFLECT_X |
>   									  DRM_MODE_REFLECT_Y);
>   
>   
>   	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
> +	vkms_plane_state->conversion_matrix = get_conversion_matrix_to_argb_u16
> +		(fmt, new_state->color_encoding, new_state->color_range);
>   }
>   
>   static int vkms_plane_atomic_check(struct drm_plane *plane,
> 
