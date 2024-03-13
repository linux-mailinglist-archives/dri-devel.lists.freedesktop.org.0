Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2404F87B198
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 20:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B5B10F223;
	Wed, 13 Mar 2024 19:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="oqeT8VHO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672FD10F223
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 19:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=75WVLbdwI+iDn1zwGEAUGq3py3zyrknBJPOCRtfKgus=; b=oqeT8VHOM5Ys7DVNGOQYq9T/Qa
 pQoxGa3NprcqJtXMbujtg5idZDjeTniP60jiiC2TiCTOx1D4CO5Qt/SajoAHJg+Xk4fQeaxMLJz27
 JgvpxyjHawliDFL+XKyBeh+l3o/Gb1ZeoMoirQv+DpWxk7qb9Is+wOS6kD2hhYGDydLprhJG3An0p
 0NSwjmn/ISlGvXM80dvpc6BXrkuhTpQk1wEukj8RXpsEeCuOEOdiSzPqPh8huOCbiCxv2ez5QgsEj
 vOJp6bQztpJURPz9GtYin1eeRQmwj4Q6NAu1dAxO2ioQ2FZvlggyYD3H54s/ZoNaEblA/+7623R2e
 V61Gn5xA==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rkU9p-0000000BZfK-0aN9; Wed, 13 Mar 2024 19:20:57 +0000
Message-ID: <f0fe1d62-ee99-4576-ad27-62de98f9ad39@infradead.org>
Date: Wed, 13 Mar 2024 12:20:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] drm/vkms: Add YUV support
Content-Language: en-US
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
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
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240313-yuv-v5-11-e610cbd03f52@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 3/13/24 10:45, Louis Chauvet wrote:
> From: Arthur Grillo <arthurgrillo@riseup.net>
> 

> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> [Louis Chauvet:
> - Adapted Arthur's work
> - Implemented the read_line_t callbacks for yuv
> - add struct conversion_matrix
> - remove struct pixel_yuv_u8
> - update the commit message
> - Merge the modifications from Arthur]
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h     |  22 ++
>  drivers/gpu/drm/vkms/vkms_formats.c | 431 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_formats.h |   4 +
>  drivers/gpu/drm/vkms/vkms_plane.c   |  17 +-
>  4 files changed, 473 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 23e1d247468d..f3116084de5a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -99,6 +99,27 @@ typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_st
>  				  int y_start, enum pixel_read_direction direction, int count,
>  				  struct pixel_argb_u16 out_pixel[]);
>  
> +/**
> + * CONVERSION_MATRIX_FLOAT_DEPTH - Number of digits after the point for conversion matrix values

This should be

+ * define CONVERSION_MATRIX_FLOAT_DEPTH - Number of digits after the point for conversion matrix values

to conform to kernel-doc format.

> + */
> +#define CONVERSION_MATRIX_FLOAT_DEPTH 32
> +

> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 1449a0e6c706..edbf4b321b91 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c

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

	         matrices

> +	 *
> +	 * Below are the function calls used to generate eac matrix, go to

	                                                 each

> +	 * https://colour.readthedocs.io/en/develop/generated/colour.matrix_YCbCr.html
> +	 * for more info:
> +	 *
> +	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> +	 *                                  is_legal = False,
> +	 *                                  bits = 8) * 2**32).astype(int)
> +	 */

> +
>  /**

Please convert this comment to kernel-doc format or just use "/*" to begin
the comment.

>   * Retrieve the correct write_pixel function for a specific format.
>   * If the format is not supported by VKMS a warn is emitted and a dummy "don't do anything"

> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 8875bed76410..987dd2b686a8 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c


thanks.
-- 
#Randy
