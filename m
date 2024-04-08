Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C30389B92F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 09:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E2C112206;
	Mon,  8 Apr 2024 07:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZASBQYId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A71411220B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 07:50:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 430A5FF806;
 Mon,  8 Apr 2024 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712562623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBHoqmf1+VBfZaWSGb4JDuJotk70nemrZocvLyM5cJo=;
 b=ZASBQYIduyks2tPxPuE49AKRaFHbCKX1SxuIiGf1RsTwCf/vuWJlWGK74MgQwZlFqFsRVV
 KM5JWLY5gjC4xF93XYnIcn6QlpKXb4ZR+wnozLGy5koI047TtRZyfIxZ0zOgaXRmzMSVS9
 0wcRa8w8cM57DdDEvIlbZe8VH9Vx2mz4dRLTahPkBkJWHKssUFnN+hz7gNihI/x7bxgT73
 ulyMJUsd2chzLabiXsaKwnaBmhRC0M2CgpMDwLP/RoznHXvQiOyzR1DmUAISnUGXA+zhgl
 VIHNUEdX39TBT2mEBkv66lVpNc5gIM/CcTgU1/SyPIMXbx8cEdLZg/yeZ1K6Sw==
Date: Mon, 8 Apr 2024 09:50:19 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v5 11/16] drm/vkms: Add YUV support
Message-ID: <ZhOhuzllWYooTPa6@louis-chauvet-laptop>
Mail-Followup-To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-11-e610cbd03f52@bootlin.com>
 <20240327162307.4b9b6e45.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240327162307.4b9b6e45.pekka.paalanen@collabora.com>
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

Le 27/03/24 - 16:23, Pekka Paalanen a écrit :
> On Wed, 13 Mar 2024 18:45:05 +0100
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
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
> 
> You mean fixed-point, not floating-point (floats).
> 
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
> 
> Sounds good!
> 
> > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > [Louis Chauvet:
> > - Adapted Arthur's work
> > - Implemented the read_line_t callbacks for yuv
> > - add struct conversion_matrix
> > - remove struct pixel_yuv_u8
> > - update the commit message
> > - Merge the modifications from Arthur]
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.h     |  22 ++
> >  drivers/gpu/drm/vkms/vkms_formats.c | 431 ++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/vkms/vkms_formats.h |   4 +
> >  drivers/gpu/drm/vkms/vkms_plane.c   |  17 +-
> >  4 files changed, 473 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 23e1d247468d..f3116084de5a 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -99,6 +99,27 @@ typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_st
> >  				  int y_start, enum pixel_read_direction direction, int count,
> >  				  struct pixel_argb_u16 out_pixel[]);
> >  
> > +/**
> > + * CONVERSION_MATRIX_FLOAT_DEPTH - Number of digits after the point for conversion matrix values
> > + */
> > +#define CONVERSION_MATRIX_FLOAT_DEPTH 32
> 
> Fraction, not float.
> 
> > +
> > +/**
> > + * struct conversion_matrix - Matrix to use for a specific encoding and range
> > + *
> > + * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a row-major manner and is
> > + * used to compute rgb values from yuv values:
> > + *     [[r],[g],[b]] = @matrix * [[y],[u],[v]]
> > + *   OR for yvu formats:
> > + *     [[r],[g],[b]] = @matrix * [[y],[v],[u]]
> > + *  The values of the matrix are fixed floats, 32.CONVERSION_MATRIX_FLOAT_DEPTH
> 
> Fixed float is not a thing. They are signed fixed-point values with
> 32-bit fractional part.

I will edit all of this for v6.
 
> > + * @y_offest: Offset to apply on the y value.
> > + */
> > +struct conversion_matrix {
> > +	s64 matrix[3][3];
> > +	s64 y_offset;
> > +};
> 
> Btw. too bad that drm_fixed.h does not use something like
> 
> 	typedef struct drm_fixed {
> 		s64 v;
> 	} drm_fixed_t;
> 
> and use that in all the API where a fixed-point value is passed. It
> would make the type very explicit, and the struct prevents it from
> implicitly casting to/from regular integer formats.
> 
> Then you could use drm_fixed_t instead of s64 and it would be obvious
> how the values must be handled and which API is appropriate.

I agree this could be a nice improvment, but it may require touching a lot 
of places. 

> > +
> >  /**
> >   * vkms_plane_state - Driver specific plane state
> >   * @base: base plane state
> > @@ -110,6 +131,7 @@ struct vkms_plane_state {
> >  	struct drm_shadow_plane_state base;
> >  	struct vkms_frame_info *frame_info;
> >  	pixel_read_line_t pixel_read_line;
> > +	struct conversion_matrix *conversion_matrix;
> 
> If the matrix was embedded as a copy instead of a pointer to (const!)
> matrix, you would not need to manually hardcode YVU variant of the
> matrices, but you could simply swap the columns of the YUV matrix while
> copying them into this field.

Very good suggestion thanks, applied for the v6!

> 
> >  };
> >  
> >  struct vkms_plane {
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index 1449a0e6c706..edbf4b321b91 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -105,6 +105,44 @@ static int get_step_next_block(struct drm_framebuffer *fb, enum pixel_read_direc
> >  	return 0;
> >  }
> >  
> > +/**
> > + * get_subsampling() - Get the subsampling divisor value on a specific direction
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
> >  /*
> >   * The following  functions take pixel data (a, r, g, b, pixel, ...), convert them to the format
> >   * ARGB16161616 in out_pixel.
> > @@ -161,6 +199,42 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
> >  	return out_pixel;
> >  }
> >  
> > +static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
> > +						  struct conversion_matrix *matrix)
> 
> If you are using the "swap the matrix columns" trick, then you cannot
> call these cb, cr nor even u,v, because they might be the opposite.
> They are simply the first and second chroma channel, and their meaning
> depends on the given matrix.

I will rename them for v6, channel_1 and channel_2.

> > +{
> > +	u8 r, g, b;
> > +	s64 fp_y, fp_cb, fp_cr;
> > +	s64 fp_r, fp_g, fp_b;
> > +
> > +	fp_y = y - matrix->y_offset;
> > +	fp_cb = cb - 128;
> > +	fp_cr = cr - 128;
> 
> This looks like an incorrect way to convert u8 to fixed-point, but...
>
> > +
> > +	fp_y = drm_int2fixp(fp_y);
> > +	fp_cb = drm_int2fixp(fp_cb);
> > +	fp_cr = drm_int2fixp(fp_cr);
> 
> I find it confusing to re-purpose variables like this.
> 
> I'd do just
> 
> 	fp_c1 = drm_int2fixp((int)c1 - 128);

I agree with this remark, I will change it for the v6.

> If the function arguments were int to begin with, then the cast would
> be obviously unnecessary.

For this I'm less sure. The name of the function and the usage is 
explicit: we want to use u8 as input. As we manipulate pointers in 
read_line, I don't know how it will works if the pointer is dereferenced 
to a int instead of a u8.

> So, what you have in fp variables at this point is fractional numbers
> in the 8-bit integer scale. However, because the target format is
> 16-bit, you should not show the extra precision away here. Instead,
> multiply by 257 to bring the values to 16-bit scale, and do the RGB
> clamping to 16-bit, not 8-bit.
> 
> > +
> > +	fp_r = drm_fixp_mul(matrix->matrix[0][0], fp_y) +
> > +	       drm_fixp_mul(matrix->matrix[0][1], fp_cb) +
> > +	       drm_fixp_mul(matrix->matrix[0][2], fp_cr);
> > +	fp_g = drm_fixp_mul(matrix->matrix[1][0], fp_y) +
> > +	       drm_fixp_mul(matrix->matrix[1][1], fp_cb) +
> > +	       drm_fixp_mul(matrix->matrix[1][2], fp_cr);
> > +	fp_b = drm_fixp_mul(matrix->matrix[2][0], fp_y) +
> > +	       drm_fixp_mul(matrix->matrix[2][1], fp_cb) +
> > +	       drm_fixp_mul(matrix->matrix[2][2], fp_cr);
> > +
> > +	fp_r = drm_fixp2int_round(fp_r);
> > +	fp_g = drm_fixp2int_round(fp_g);
> > +	fp_b = drm_fixp2int_round(fp_b);
> > +
> > +	r = clamp(fp_r, 0, 0xff);
> > +	g = clamp(fp_g, 0, 0xff);
> > +	b = clamp(fp_b, 0, 0xff);
> > +
> > +	return argb_u16_from_u8888(255, r, g, b);
> 
> Going through argb_u16_from_u8888() will throw away precision.

I tried to fix it in the v6, IGT tests pass. If something is wrong in the 
v6, please let me know.

> > +}
> > +
> >  /*
> >   * The following functions are read_line function for each pixel format supported by VKMS.
> >   *
> > @@ -293,6 +367,79 @@ static void RGB565_read_line(const struct vkms_plane_state *plane, int x_start,
> >  	}
> >  }
> >  
> > +/*
> > + * This callback can be used for yuv and yvu formats, given a properly modified conversion matrix
> > + * (column inversion)
> 
> Would be nice to explain what semi_planar_yuv means, so that the
> documentation for these functions would show how they differ rather
> than all saying exactly the same thing.

 /* This callback can be used for YUV format where each color component is 
  * stored in a different plane (often called planar formats). It will 
  * handle correctly subsampling.

 /*
  * This callback can be used for YUV formats where U and V values are 
  * stored in the same plane (often called semi-planar formats). It will 
  * corectly handle subsampling.
  * 
  * The conversion matrix stored in the @plane is used to:
  * - Apply the correct color range and encoding
  * - Convert YUV and YVU with the same function (a simple column swap is 
  *   needed)
  */
 
> > + */
> > +static void semi_planar_yuv_read_line(const struct vkms_plane_state *plane, int x_start,
> > +				      int y_start, enum pixel_read_direction direction, int count,
> > +				      struct pixel_argb_u16 out_pixel[])
> > +{
> > +	int rem_x, rem_y;
> > +	u8 *y_plane;
> > +	u8 *uv_plane;
> > +
> > +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &y_plane, &rem_x, &rem_y);
> 
> Assert rem_x, rem_y are zero, or block is 1x1.
> 
> > +	packed_pixels_addr(plane->frame_info,
> > +			   x_start / plane->frame_info->fb->format->hsub,
> > +			   y_start / plane->frame_info->fb->format->vsub,
> > +			   1, &uv_plane, &rem_x, &rem_y);
> 
> Assert rem_x, rem_y are zero, or block is 1x1.
> 
> Actually, this is so common, that maybe there should be a wrapper for
> packed_pixels_addr() or another variant of it, that asserts that the
> block size is 1x1 and does not return rem_x, rem_y at all.

I will create a packed_pixel_addr_1x1 for this, and add this assert 
inside, so no code duplication.

> > +	int step_y = get_step_next_block(plane->frame_info->fb, direction, 0);
> > +	int step_uv = get_step_next_block(plane->frame_info->fb, direction, 1);
> > +	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
> > +	int subsampling_offset = get_subsampling_offset(direction, x_start, y_start);
> > +	struct conversion_matrix *conversion_matrix = plane->conversion_matrix;
> > +
> > +	for (int i = 0; i < count; i++) {
> > +		*out_pixel = argb_u16_from_yuv888(y_plane[0], uv_plane[0], uv_plane[1],
> > +						  conversion_matrix);
> > +		out_pixel += 1;
> > +		y_plane += step_y;
> > +		if ((i + subsampling_offset + 1) % subsampling == 0)
> > +			uv_plane += step_uv;
> > +	}
> > +}
> > +
> > +/*
> > + * This callback can be used for yuv and yvu formats, given a properly modified conversion matrix
> > + * (column inversion)
> > + */
> > +static void planar_yuv_read_line(const struct vkms_plane_state *plane, int x_start,
> > +				 int y_start, enum pixel_read_direction direction, int count,
> > +				 struct pixel_argb_u16 out_pixel[])
> > +{
> > +	int rem_x, rem_y;
> > +	u8 *y_plane;
> > +	u8 *u_plane;
> > +	u8 *v_plane;
> > +
> > +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &y_plane, &rem_x, &rem_y);
> > +	packed_pixels_addr(plane->frame_info,
> > +			   x_start / plane->frame_info->fb->format->hsub,
> > +			   y_start / plane->frame_info->fb->format->vsub,
> > +			   1, &u_plane, &rem_x, &rem_y);
> > +	packed_pixels_addr(plane->frame_info,
> > +			   x_start / plane->frame_info->fb->format->hsub,
> > +			   y_start / plane->frame_info->fb->format->vsub,
> > +			   2, &v_plane, &rem_x, &rem_y);
> > +	int step_y = get_step_next_block(plane->frame_info->fb, direction, 0);
> > +	int step_u = get_step_next_block(plane->frame_info->fb, direction, 1);
> > +	int step_v = get_step_next_block(plane->frame_info->fb, direction, 2);
> > +	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
> > +	int subsampling_offset = get_subsampling_offset(direction, x_start, y_start);
> > +	struct conversion_matrix *conversion_matrix = plane->conversion_matrix;
> > +
> > +	for (int i = 0; i < count; i++) {
> > +		*out_pixel = argb_u16_from_yuv888(*y_plane, *u_plane, *v_plane, conversion_matrix);
> > +		out_pixel += 1;
> > +		y_plane += step_y;
> > +		if ((i + subsampling_offset + 1) % subsampling == 0) {
> > +			u_plane += step_u;
> > +			v_plane += step_v;
> > +		}
> > +	}
> > +}
> > +
> >  /*
> >   * The following functions take one argb_u16 pixel and convert it to a specific format. The
> >   * result is stored in @out_pixel.
> > @@ -418,6 +565,20 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
> >  		return &XRGB16161616_read_line;
> >  	case DRM_FORMAT_RGB565:
> >  		return &RGB565_read_line;
> > +	case DRM_FORMAT_NV12:
> > +	case DRM_FORMAT_NV16:
> > +	case DRM_FORMAT_NV24:
> > +	case DRM_FORMAT_NV21:
> > +	case DRM_FORMAT_NV61:
> > +	case DRM_FORMAT_NV42:
> > +		return &semi_planar_yuv_read_line;
> > +	case DRM_FORMAT_YUV420:
> > +	case DRM_FORMAT_YUV422:
> > +	case DRM_FORMAT_YUV444:
> > +	case DRM_FORMAT_YVU420:
> > +	case DRM_FORMAT_YVU422:
> > +	case DRM_FORMAT_YVU444:
> > +		return &planar_yuv_read_line;
> >  	default:
> >  		/*
> >  		 * This is a bug in vkms_plane_atomic_check. All the supported
> > @@ -435,6 +596,276 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
> >  	}
> >  }
> >  
> > +/**
> > + * get_conversion_matrix_to_argb_u16() - Retrieve the correct yuv to rgb conversion matrix for a
> > + * given encoding and range.
> > + *
> > + * If the matrix is not found, return a null pointer. In all other cases, it return a simple
> > + * diagonal matrix, which act as a "no-op".
> 
> This comment about NULL seems bogus.

Because it is... and it become useless when using the "copy matrix" 
method.

> > + *
> > + * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> > + * @encoding: DRM_COLOR_* value for which to obtain a conversion matrix
> > + * @range: DRM_COLOR_*_RANGE value for which to obtain a conversion matrix
> > + */
> > +struct conversion_matrix *
> > +get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
> > +				  enum drm_color_range range)
> > +{
> > +	static struct conversion_matrix no_operation = {
> 
> Every matrix here should be 'static const' rather than only 'static'.
>
> > +		.matrix = {
> > +			{ 4294967296, 0,          0, },
> > +			{ 0,          4294967296, 0, },
> > +			{ 0,          0,          4294967296, },
> > +		},
> > +		.y_offset = 0,
> > +	};
> > +
> > +	/*
> > +	 * Those matrixies were generated using the colour python framework
> > +	 *
> > +	 * Below are the function calls used to generate eac matrix, go to
> > +	 * https://colour.readthedocs.io/en/develop/generated/colour.matrix_YCbCr.html
> > +	 * for more info:
> > +	 *
> > +	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> > +	 *                                  is_legal = False,
> 
> Ugh, colour.matrix_YCbCr documentation is confusing. This is the first
> time I've heard of "legal range", so I had to look it up. Of course,
> the doc does not explain it.
> 
> Reading
> https://kb.pomfort.com/livegrade/advanced-grading-features/legal-and-extended-sdi-signals-and-luts-in-livegrade/
> it sounds like extended range in 8-bit is 1-254, not 0-255 that
> we use in computer graphics. This matches what I've read before
> elsewhere in ITU or SMPTE specs.
> 
> SDI signals reserve the 8-bit code points 0 and 255 for
> synchronization, making them invalid as data. It scales to higher bit
> depths, so 10-bit code points 0-3 and 1020-1023 inclusive are reserved
> for synchronization.
> 
> IOW, there are two different "full range" quantizations: extended and full.
> 
> Does is_legal=False refer to extended or full? The documentation
> does not say.
> 
> However, given that changing 'bits' value with is_legal=False does not
> change the result, and with is_legal=True it does change the result, I
> suspect is_legal=False means full range, not extended range.
> 
> So I think the python snippet is correct.
> 
> > +	 *                                  bits = 8) * 2**32).astype(int)
> > +	 */
> > +	static struct conversion_matrix yuv_bt601_full = {
> > +		.matrix = {
> > +			{ 4294967296, 0,           6021544149 },

[...]

> > +			{ 5020601039, 9234915964, 0 },
> > +		},
> > +		.y_offset = 16,
> > +	};
> > +
> > +	/*
> > +	 * The next matrices are just the previous ones, but with the first and
> > +	 * second columns swapped
> 
> As I mentioned earlier, you could derive those below from the above
> matrices in code, so you don't need all these open-coded.
> 
> You also would not need twice the switch-ladders below, you'd only need
> a 'bool need_to_swap_columns' from the pixel format.

It is done in the v6, the code is much simpler.

Thanks,
Louis Chauvet

> You could also have a 'bool limited_range', and do
> 
> 	case DRM_COLOR_YCBCR_BT601:
> 		return limited_range ? &yuv_bt601_limited : &yuv_bt601_full;
> 
> 
> > +	 */
> > +	static struct conversion_matrix yvu_bt601_full = {
> > +		.matrix = {
> > +			{ 4294967296, 6021544149,  0 },
> > +			{ 4294967296, -3067191994, -1478054095 },
> > +			{ 4294967296, 0,           7610682049 },
> > +		},
> > +		.y_offset = 0,
> > +	};
> > +	static struct conversion_matrix yvu_bt601_limited = {
> > +		.matrix = {
> > +			{ 5020601039, 6881764740,  0 },
> > +			{ 5020601039, -3505362278, -1689204679 },
> > +			{ 5020601039, 0,           8697922339 },
> > +		},
> > +		.y_offset = 16,
> > +	};
> > +	static struct conversion_matrix yvu_bt709_full = {
> > +		.matrix = {
> > +			{ 4294967296, 6763714498,  0 },
> > +			{ 4294967296, -2010578443, -804551626 },
> > +			{ 4294967296, 0,           7969741314 },
> > +		},
> > +		.y_offset = 0,
> > +	};
> > +	static struct conversion_matrix yvu_bt709_limited = {
> > +		.matrix = {
> > +			{ 5020601039, 7729959424,  0 },
> > +			{ 5020601039, -2297803934, -919487572 },
> > +			{ 5020601039, 0,           9108275786 },
> > +		},
> > +		.y_offset = 16,
> > +	};
> > +	static struct conversion_matrix yvu_bt2020_full = {
> > +		.matrix = {
> > +			{ 4294967296, 6333358775,  0 },
> > +			{ 4294967296, -2453942994, -706750298 },
> > +			{ 4294967296, 0,           8080551471 },
> > +		},
> > +		.y_offset = 0,
> > +	};
> > +	static struct conversion_matrix yvu_bt2020_limited = {
> > +		.matrix = {
> > +			{ 5020601039, 7238124312,  0 },
> > +			{ 5020601039, -2804506279, -807714626 },
> > +			{ 5020601039, 0,           9234915964 },
> > +		},
> > +		.y_offset = 16,
> > +	};
> > +
> > +	/* Breaking in this switch means that the color format+encoding+range is not supported */
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
> > +				return &yuv_bt601_full;
> > +			case DRM_COLOR_RANGE_MAX:
> > +				break;
> > +			}
> > +			break;
> > +		case DRM_COLOR_YCBCR_BT709:
> > +			switch (range) {
> > +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> > +				return &yuv_bt709_limited;
> > +			case DRM_COLOR_YCBCR_FULL_RANGE:
> > +				return &yuv_bt709_full;
> > +			case DRM_COLOR_RANGE_MAX:
> > +				break;
> > +			}
> > +			break;
> > +		case DRM_COLOR_YCBCR_BT2020:
> > +			switch (range) {
> > +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> > +				return &yuv_bt2020_limited;
> > +			case DRM_COLOR_YCBCR_FULL_RANGE:
> > +				return &yuv_bt2020_full;
> > +			case DRM_COLOR_RANGE_MAX:
> > +				break;
> > +			}
> > +			break;
> > +		case DRM_COLOR_ENCODING_MAX:
> > +			break;
> > +		}
> > +		break;
> > +	case DRM_FORMAT_YVU420:
> > +	case DRM_FORMAT_YVU422:
> > +	case DRM_FORMAT_YVU444:
> > +	case DRM_FORMAT_NV21:
> > +	case DRM_FORMAT_NV61:
> > +	case DRM_FORMAT_NV42:
> > +		switch (encoding) {
> > +		case DRM_COLOR_YCBCR_BT601:
> > +			switch (range) {
> > +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> > +				return &yvu_bt601_limited;
> > +			case DRM_COLOR_YCBCR_FULL_RANGE:
> > +				return &yvu_bt601_full;
> > +			case DRM_COLOR_RANGE_MAX:
> > +				break;
> > +			}
> > +			break;
> > +		case DRM_COLOR_YCBCR_BT709:
> > +			switch (range) {
> > +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> > +				return &yvu_bt709_limited;
> > +			case DRM_COLOR_YCBCR_FULL_RANGE:
> > +				return &yvu_bt709_full;
> > +			case DRM_COLOR_RANGE_MAX:
> > +				break;
> > +			}
> > +			break;
> > +		case DRM_COLOR_YCBCR_BT2020:
> > +			switch (range) {
> > +			case DRM_COLOR_YCBCR_LIMITED_RANGE:
> > +				return &yvu_bt2020_limited;
> > +			case DRM_COLOR_YCBCR_FULL_RANGE:
> > +				return &yvu_bt2020_full;
> > +			case DRM_COLOR_RANGE_MAX:
> > +				break;
> > +			}
> > +			break;
> > +		case DRM_COLOR_ENCODING_MAX:
> > +			break;
> > +		}
> > +		break;
> > +	case DRM_FORMAT_ARGB8888:
> > +	case DRM_FORMAT_XRGB8888:
> > +	case DRM_FORMAT_ARGB16161616:
> > +	case DRM_FORMAT_XRGB16161616:
> > +	case DRM_FORMAT_RGB565:
> > +		/*
> > +		 * Those formats are supported, but they don't need a conversion matrix. Return
> > +		 * a valid pointer to avoid kernel panic in case this matrix is used/checked
> > +		 * somewhere.
> > +		 */
> > +		return &no_operation;
> > +	default:
> > +		break;
> > +	}
> > +	WARN(true, "Unsupported encoding (%d), range (%d) and format (%p4cc) combination\n",
> > +	     encoding, range, &format);
> > +	return &no_operation;
> > +}
> > +
> >  /**
> >   * Retrieve the correct write_pixel function for a specific format.
> >   * If the format is not supported by VKMS a warn is emitted and a dummy "don't do anything"
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> > index 8d2bef95ff79..e1d324764b17 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.h
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> > @@ -9,4 +9,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format);
> >  
> >  pixel_write_t get_pixel_write_function(u32 format);
> >  
> > +struct conversion_matrix *
> > +get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
> > +				  enum drm_color_range range);
> > +
> >  #endif /* _VKMS_FORMATS_H_ */
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index 8875bed76410..987dd2b686a8 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -17,7 +17,19 @@ static const u32 vkms_formats[] = {
> >  	DRM_FORMAT_XRGB8888,
> >  	DRM_FORMAT_XRGB16161616,
> >  	DRM_FORMAT_ARGB16161616,
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
> >  };
> >  
> >  static struct drm_plane_state *
> > @@ -117,12 +129,15 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> >  	drm_framebuffer_get(frame_info->fb);
> >  	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
> >  									  DRM_MODE_ROTATE_90 |
> > +									  DRM_MODE_ROTATE_180 |
> >  									  DRM_MODE_ROTATE_270 |
> >  									  DRM_MODE_REFLECT_X |
> >  									  DRM_MODE_REFLECT_Y);
> >  
> >  
> >  	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
> > +	vkms_plane_state->conversion_matrix = get_conversion_matrix_to_argb_u16
> > +		(fmt, new_state->color_encoding, new_state->color_range);
> >  }
> >  
> >  static int vkms_plane_atomic_check(struct drm_plane *plane,
> > 
> 
> I couldn't pinpoint what would need to be fixed so that rotation would
> not change chroma siting, but I also cannot say that chroma siting is
> definitely correct already.
> 
> Thanks,
> pq



-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
