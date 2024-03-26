Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19C288C844
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEA210F0BE;
	Tue, 26 Mar 2024 15:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ek9x/s5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF0610F0B0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 15:57:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 951FF1C0007;
 Tue, 26 Mar 2024 15:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1711468625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cj4+K3Q18OP+zaHpsf73IF0YvyFrPci37KR5EMxaAhE=;
 b=ek9x/s5qL9OQw/9nadbUES4SLfBNBN+WazdAm0CYzaUm+RTsU1OjBkDvO0A6S2yE/n91Q1
 IJWaixWIAwRnN8k2m9H0rJLKEl07270X4T6wvpY1x6ji/dLGEMijzeXS4wZCnZI98aBUeC
 TyoGlgfV9YkrcyJgeYkjYVNR3vw+8eaVZ0QHbGKGkS4to+hdA+1w1XCLUxOfpFdzlyb+zi
 DX+FzJNOQ0OmGtS0xNJLzKBo9bI1dtdonfZfnrkCSi3LFy3DXRpCckTvPAlCWjmiIGX3HL
 iUq1uJBPZvcI6RH2qZBEHGN1a5HIW8tGYV1PVuyozs489bgiZfp+MUUqCXqDGw==
Date: Tue, 26 Mar 2024 16:57:03 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v5 11/16] drm/vkms: Add YUV support
Message-ID: <ZgLwT2Kkax8cJEhz@localhost.localdomain>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-11-e610cbd03f52@bootlin.com>
 <e5d8297f-3e1f-459f-bef2-3a91f2caf94f@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5d8297f-3e1f-459f-bef2-3a91f2caf94f@igalia.com>
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

Le 25/03/24 - 11:26, Maíra Canal a écrit :
> On 3/13/24 14:45, Louis Chauvet wrote:
> > From: Arthur Grillo <arthurgrillo@riseup.net>
> > 
> > Add support to the YUV formats bellow:
> > 
> > - NV12/NV16/NV24
> > - NV21/NV61/NV42
> > - YUV420/YUV422/YUV444
> > - YVU420/YVU422/YVU444
> > 
> > The conversion from yuv to rgb is done with fixed-point arithmetic, using
> > 32.32 floats and the drm_fixed helpers.
> > 
> > To do the conversion, a specific matrix must be used for each color range
> > (DRM_COLOR_*_RANGE) and encoding (DRM_COLOR_*). This matrix is stored in
> > the `conversion_matrix` struct, along with the specific y_offset needed.
> > This matrix is queried only once, in `vkms_plane_atomic_update` and
> > stored in a `vkms_plane_state`. Those conversion matrices of each
> > encoding and range were obtained by rounding the values of the original
> > conversion matrices multiplied by 2^32. This is done to avoid the use of
> > floating point operations.
> > 
> > The same reading function is used for YUV and YVU formats. As the only
> > difference between those two category of formats is the order of field, a
> > simple swap in conversion matrix columns allows using the same function.
> > 
> > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > [Louis Chauvet:
> > - Adapted Arthur's work
> > - Implemented the read_line_t callbacks for yuv
> > - add struct conversion_matrix
> > - remove struct pixel_yuv_u8
> > - update the commit message
> > - Merge the modifications from Arthur]
> 
> A Co-developed-by tag would be more appropriate.

I am not the main author of this part, I only applied a few simple 
suggestions, the complex part was done by Arthur.

I will wait for Arthur's confirmation to change it to Co-developed by if
he agrees.

 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_drv.h     |  22 ++
> >   drivers/gpu/drm/vkms/vkms_formats.c | 431 ++++++++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/vkms/vkms_formats.h |   4 +
> >   drivers/gpu/drm/vkms/vkms_plane.c   |  17 +-
> >   4 files changed, 473 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 23e1d247468d..f3116084de5a 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -99,6 +99,27 @@ typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_st
> >   				  int y_start, enum pixel_read_direction direction, int count,
> >   				  struct pixel_argb_u16 out_pixel[]);
> >   
> > +/**
> > + * CONVERSION_MATRIX_FLOAT_DEPTH - Number of digits after the point for conversion matrix values
> > + */
> > +#define CONVERSION_MATRIX_FLOAT_DEPTH 32
> > +
> > +/**
> > + * struct conversion_matrix - Matrix to use for a specific encoding and range
> > + *
> > + * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a row-major manner and is
> > + * used to compute rgb values from yuv values:
> > + *     [[r],[g],[b]] = @matrix * [[y],[u],[v]]
> > + *   OR for yvu formats:
> > + *     [[r],[g],[b]] = @matrix * [[y],[v],[u]]
> > + *  The values of the matrix are fixed floats, 32.CONVERSION_MATRIX_FLOAT_DEPTH > + * @y_offest: Offset to apply on the y value.
> 
> s/y_offest/y_offset

Fixed in v6.

> > + */
> > +struct conversion_matrix {
> > +	s64 matrix[3][3];
> > +	s64 y_offset;
> > +};
> > +
> >   /**
> >    * vkms_plane_state - Driver specific plane state
> >    * @base: base plane state
> > @@ -110,6 +131,7 @@ struct vkms_plane_state {
> >   	struct drm_shadow_plane_state base;
> >   	struct vkms_frame_info *frame_info;
> >   	pixel_read_line_t pixel_read_line;
> > +	struct conversion_matrix *conversion_matrix;
> 
> Add @conversion_matrix on the kernel-doc from the struct
> vkms_plane_state.

Fixed in v6.

> >   };
> >   
> >   struct vkms_plane {
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index 1449a0e6c706..edbf4b321b91 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -105,6 +105,44 @@ static int get_step_next_block(struct drm_framebuffer *fb, enum pixel_read_direc
> >   	return 0;
> >   }
> >   
> > +/**
> > + * get_subsampling() - Get the subsampling divisor value on a specific direction
> 
> Where are the arguments?

Fixed in v6.

> > + */
> > +static int get_subsampling(const struct drm_format_info *format,
> > +			   enum pixel_read_direction direction)
> > +{
> > +	switch (direction) {
> > +	case READ_BOTTOM_TO_TOP:
> > +	case READ_TOP_TO_BOTTOM:
> > +		return format->vsub;
> > +	case READ_RIGHT_TO_LEFT:
> > +	case READ_LEFT_TO_RIGHT:
> > +		return format->hsub;
> > +	}
> > +	WARN_ONCE(true, "Invalid direction for pixel reading: %d\n", direction);
> > +	return 1;
> > +}
> > +
> > +/**
> > + * get_subsampling_offset() - An offset for keeping the chroma siting consistent regardless of
> > + * x_start and y_start values
> 
> Same.

Fixed in v6.

> > + */
> > +static int get_subsampling_offset(enum pixel_read_direction direction, int x_start, int y_start)
> > +{
> > +	switch (direction) {
> > +	case READ_BOTTOM_TO_TOP:
> > +		return -y_start - 1;
> > +	case READ_TOP_TO_BOTTOM:
> > +		return y_start;
> > +	case READ_RIGHT_TO_LEFT:
> > +		return -x_start - 1;
> > +	case READ_LEFT_TO_RIGHT:
> > +		return x_start;
> > +	}
> > +	WARN_ONCE(true, "Invalid direction for pixel reading: %d\n", direction);
> > +	return 0;
> > +}
> > +
> >   /*
> >    * The following  functions take pixel data (a, r, g, b, pixel, ...), convert them to the format
> >    * ARGB16161616 in out_pixel.
> > @@ -161,6 +199,42 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
> >   	return out_pixel;
> >   }
> >   
> 
> [...]
> 
> >   
> > +/**
> > + * get_conversion_matrix_to_argb_u16() - Retrieve the correct yuv to rgb conversion matrix for a
> > + * given encoding and range.
> > + *
> > + * If the matrix is not found, return a null pointer. In all other cases, it return a simple
> > + * diagonal matrix, which act as a "no-op".
> > + *
> > + * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> > + * @encoding: DRM_COLOR_* value for which to obtain a conversion matrix
> > + * @range: DRM_COLOR_*_RANGE value for which to obtain a conversion matrix
> 
> A bit odd to see the arguments after the description.

Fixed in v6.

> > + */
> > +struct conversion_matrix *
> > +get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
> > +				  enum drm_color_range range)
> > +{
> > +	static struct conversion_matrix no_operation = {
> > +		.matrix = {
> > +			{ 4294967296, 0,          0, },
> > +			{ 0,          4294967296, 0, },
> > +			{ 0,          0,          4294967296, },
> > +		},
> > +		.y_offset = 0,
> > +	};

[...]

> > +
> > +	/* Breaking in this switch means that the color format+encoding+range is not supported */
> 
> s/color format+encoding+range/color format + encoding + range

Fixed in v6.

> > +	switch (format) {
> > +	case DRM_FORMAT_NV12:
> > +	case DRM_FORMAT_NV16:
> > +	case DRM_FORMAT_NV24:
> > +	case DRM_FORMAT_YUV420:
> > +	case DRM_FORMAT_YUV422:
> > +	case DRM_FORMAT_YUV444:
> > +		switch (encoding) {
> > +		case DRM_COLOR_YCBCR_BT601:
> > +			switch (range) {
> > +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> > +				return &yuv_bt601_limited;
> > +			case DRM_COLOR_YCBCR_FULL_RANGE:

[...]

> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> > index 8d2bef95ff79..e1d324764b17 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.h
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> > @@ -9,4 +9,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format);
> >   
> >   pixel_write_t get_pixel_write_function(u32 format);
> >   
> > +struct conversion_matrix *
> > +get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
> > +				  enum drm_color_range range);
> > +
> >   #endif /* _VKMS_FORMATS_H_ */
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index 8875bed76410..987dd2b686a8 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -17,7 +17,19 @@ static const u32 vkms_formats[] = {
> >   	DRM_FORMAT_XRGB8888,
> >   	DRM_FORMAT_XRGB16161616,
> >   	DRM_FORMAT_ARGB16161616,
> > -	DRM_FORMAT_RGB565
> > +	DRM_FORMAT_RGB565,
> > +	DRM_FORMAT_NV12,
> > +	DRM_FORMAT_NV16,
> > +	DRM_FORMAT_NV24,
> > +	DRM_FORMAT_NV21,
> > +	DRM_FORMAT_NV61,
> > +	DRM_FORMAT_NV42,
> > +	DRM_FORMAT_YUV420,
> > +	DRM_FORMAT_YUV422,
> > +	DRM_FORMAT_YUV444,
> > +	DRM_FORMAT_YVU420,
> > +	DRM_FORMAT_YVU422,
> > +	DRM_FORMAT_YVU444
> 
> Let's add a comma by the end of this entry, to avoid deleting this line
> when adding a new format.

Fixed in v6.

> >   };
> >   
> >   static struct drm_plane_state *
> > @@ -117,12 +129,15 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> >   	drm_framebuffer_get(frame_info->fb);
> >   	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
> >   									  DRM_MODE_ROTATE_90 |
> > +									  DRM_MODE_ROTATE_180 |
> 
> Why do we need to add DRM_MODE_ROTATE_180 here? Isn't the same as
> reflecting both along the X and Y axis?

Oops, I had no intention of putting that change here. I will move it to 
another patch.

I don't understand why DRM_MODE_ROTATE_180 isn't in this list. If I read 
the drm_rotation_simplify documentation, it explains that this argument 
should contain all supported rotations and reflections, and ROT_180 is 
supported by VKMS. Perhaps this call is unnecessary because all 
combinations are supported by vkms?

Thanks,
Louis Chauvet

> Best Regards,
> - Maíra
> 
> >   									  DRM_MODE_ROTATE_270 |
> >   									  DRM_MODE_REFLECT_X |
> >   									  DRM_MODE_REFLECT_Y);
> >   
> >   
> >   	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
> > +	vkms_plane_state->conversion_matrix = get_conversion_matrix_to_argb_u16
> > +		(fmt, new_state->color_encoding, new_state->color_range);
> >   }
> >   
> >   static int vkms_plane_atomic_check(struct drm_plane *plane,
> > 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
