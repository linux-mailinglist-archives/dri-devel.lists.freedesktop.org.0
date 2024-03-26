Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD1588C847
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4C310F0C3;
	Tue, 26 Mar 2024 15:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="N895UDzr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7104610F0B1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 15:57:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9AB7320009;
 Tue, 26 Mar 2024 15:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1711468620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FANT3Hdk3h/Q37rlnCavNDGM1y7fyrgYQwAIQzZkwEg=;
 b=N895UDzrTL5E1+fthK3PO1WMWP9jqrHXuAM1UcOSapbuRZl6+yVLejBMVLxBW2M8e/h6MA
 V+sklsUo2h1//Tvl89Q3QyqG090NIWzYZ9Qxrla+zhZeBoDqCNIlfWZthSv9+199HfBuaw
 iKGRXcrsPL4zj5uSL5QSy8tgUkZH9qlyCpqNHRRyDwpsMTzfXDg+XUO3KYrxa/CvTGljTU
 Jay+U4SIzJzcZGysdTyY+KgPa3NQuny5rpugQYALMuzgcBk2OaHirCsR+uMtVruCPU2iAO
 3KWwa5B7943r0agVNmYG5HxP1sqYtNgeOxH2UgPuMrK2pkhgOeQXOsDE6XcFdw==
Date: Tue, 26 Mar 2024 16:56:57 +0100
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
Subject: Re: [PATCH v5 04/16] drm/vkms: Add typedef and documentation for
 pixel_read and pixel_write functions
Message-ID: <ZgLwSU8VI4F6q5x1@localhost.localdomain>
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
 <20240313-yuv-v5-4-e610cbd03f52@bootlin.com>
 <20240325140426.3841ac70.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240325140426.3841ac70.pekka.paalanen@collabora.com>
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

Le 25/03/24 - 14:04, Pekka Paalanen a écrit :
> On Wed, 13 Mar 2024 18:44:58 +0100
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
> > Introduce two typedefs: pixel_read_t and pixel_write_t. It allows the
> > compiler to check if the passed functions take the correct arguments.
> > Such typedefs will help ensuring consistency across the code base in
> > case of update of these prototypes.
> > 
> > Rename input/output variable in a consistent way between read_line and
> > write_line.
> > 
> > A warn has been added in get_pixel_*_function to alert when an unsupported
> > pixel format is requested. As those formats are checked before
> > atomic_update callbacks, it should never append.
> 
> s/append/happen/

Fixed in v6.

Thanks,
Louis Chauvet
 
> 
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> Thanks,
> pq
> 
> > 
> > Document for those typedefs.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.h     |  23 ++++++-
> >  drivers/gpu/drm/vkms/vkms_formats.c | 124 +++++++++++++++++++++---------------
> >  drivers/gpu/drm/vkms/vkms_formats.h |   4 +-
> >  drivers/gpu/drm/vkms/vkms_plane.c   |   2 +-
> >  4 files changed, 95 insertions(+), 58 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 18086423a3a7..4bfc62d26f08 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -53,12 +53,31 @@ struct line_buffer {
> >  	struct pixel_argb_u16 *pixels;
> >  };
> >  
> > +/**
> > + * typedef pixel_write_t - These functions are used to read a pixel from a
> > + * `struct pixel_argb_u16*`, convert it in a specific format and write it in the @dst_pixels
> > + * buffer.
> > + *
> > + * @out_pixel: destination address to write the pixel
> > + * @in_pixel: pixel to write
> > + */
> > +typedef void (*pixel_write_t)(u8 *out_pixel, struct pixel_argb_u16 *in_pixel);
> > +
> >  struct vkms_writeback_job {
> >  	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
> >  	struct vkms_frame_info wb_frame_info;
> > -	void (*pixel_write)(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel);
> > +	pixel_write_t pixel_write;
> >  };
> >  
> > +/**
> > + * typedef pixel_read_t - These functions are used to read a pixel in the source frame,
> > + * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> > + *
> > + * @in_pixel: Pointer to the pixel to read
> > + * @out_pixel: Pointer to write the converted pixel
> > + */
> > +typedef void (*pixel_read_t)(u8 *in_pixel, struct pixel_argb_u16 *out_pixel);
> > +
> >  /**
> >   * vkms_plane_state - Driver specific plane state
> >   * @base: base plane state
> > @@ -69,7 +88,7 @@ struct vkms_writeback_job {
> >  struct vkms_plane_state {
> >  	struct drm_shadow_plane_state base;
> >  	struct vkms_frame_info *frame_info;
> > -	void (*pixel_read)(u8 *src_buffer, struct pixel_argb_u16 *out_pixel);
> > +	pixel_read_t pixel_read;
> >  };
> >  
> >  struct vkms_plane {
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index 6e3dc8682ff9..55a4365d21a4 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -76,7 +76,7 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int limit, i
> >   * They are used in the `vkms_compose_row` function to handle multiple formats.
> >   */
> >  
> > -static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> > +static void ARGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> >  {
> >  	/*
> >  	 * The 257 is the "conversion ratio". This number is obtained by the
> > @@ -84,48 +84,48 @@ static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixe
> >  	 * the best color value in a pixel format with more possibilities.
> >  	 * A similar idea applies to others RGB color conversions.
> >  	 */
> > -	out_pixel->a = (u16)src_pixels[3] * 257;
> > -	out_pixel->r = (u16)src_pixels[2] * 257;
> > -	out_pixel->g = (u16)src_pixels[1] * 257;
> > -	out_pixel->b = (u16)src_pixels[0] * 257;
> > +	out_pixel->a = (u16)in_pixel[3] * 257;
> > +	out_pixel->r = (u16)in_pixel[2] * 257;
> > +	out_pixel->g = (u16)in_pixel[1] * 257;
> > +	out_pixel->b = (u16)in_pixel[0] * 257;
> >  }
> >  
> > -static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> > +static void XRGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> >  {
> >  	out_pixel->a = (u16)0xffff;
> > -	out_pixel->r = (u16)src_pixels[2] * 257;
> > -	out_pixel->g = (u16)src_pixels[1] * 257;
> > -	out_pixel->b = (u16)src_pixels[0] * 257;
> > +	out_pixel->r = (u16)in_pixel[2] * 257;
> > +	out_pixel->g = (u16)in_pixel[1] * 257;
> > +	out_pixel->b = (u16)in_pixel[0] * 257;
> >  }
> >  
> > -static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> > +static void ARGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> >  {
> > -	u16 *pixels = (u16 *)src_pixels;
> > +	u16 *pixel = (u16 *)in_pixel;
> >  
> > -	out_pixel->a = le16_to_cpu(pixels[3]);
> > -	out_pixel->r = le16_to_cpu(pixels[2]);
> > -	out_pixel->g = le16_to_cpu(pixels[1]);
> > -	out_pixel->b = le16_to_cpu(pixels[0]);
> > +	out_pixel->a = le16_to_cpu(pixel[3]);
> > +	out_pixel->r = le16_to_cpu(pixel[2]);
> > +	out_pixel->g = le16_to_cpu(pixel[1]);
> > +	out_pixel->b = le16_to_cpu(pixel[0]);
> >  }
> >  
> > -static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> > +static void XRGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> >  {
> > -	u16 *pixels = (u16 *)src_pixels;
> > +	u16 *pixel = (u16 *)in_pixel;
> >  
> >  	out_pixel->a = (u16)0xffff;
> > -	out_pixel->r = le16_to_cpu(pixels[2]);
> > -	out_pixel->g = le16_to_cpu(pixels[1]);
> > -	out_pixel->b = le16_to_cpu(pixels[0]);
> > +	out_pixel->r = le16_to_cpu(pixel[2]);
> > +	out_pixel->g = le16_to_cpu(pixel[1]);
> > +	out_pixel->b = le16_to_cpu(pixel[0]);
> >  }
> >  
> > -static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> > +static void RGB565_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> >  {
> > -	u16 *pixels = (u16 *)src_pixels;
> > +	u16 *pixel = (u16 *)in_pixel;
> >  
> >  	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> >  	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> >  
> > -	u16 rgb_565 = le16_to_cpu(*pixels);
> > +	u16 rgb_565 = le16_to_cpu(*pixel);
> >  	s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
> >  	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
> >  	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
> > @@ -169,12 +169,12 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
> >  
> >  /*
> >   * The following functions take one argb_u16 pixel and convert it to a specific format. The
> > - * result is stored in @dst_pixels.
> > + * result is stored in @out_pixel.
> >   *
> >   * They are used in the `vkms_writeback_row` to convert and store a pixel from the src_buffer to
> >   * the writeback buffer.
> >   */
> > -static void argb_u16_to_ARGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> > +static void argb_u16_to_ARGB8888(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
> >  {
> >  	/*
> >  	 * This sequence below is important because the format's byte order is
> > @@ -186,43 +186,43 @@ static void argb_u16_to_ARGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel
> >  	 * | Addr + 2 | = Red channel
> >  	 * | Addr + 3 | = Alpha channel
> >  	 */
> > -	dst_pixels[3] = DIV_ROUND_CLOSEST(in_pixel->a, 257);
> > -	dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
> > -	dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixel->g, 257);
> > -	dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
> > +	out_pixel[3] = DIV_ROUND_CLOSEST(in_pixel->a, 257);
> > +	out_pixel[2] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
> > +	out_pixel[1] = DIV_ROUND_CLOSEST(in_pixel->g, 257);
> > +	out_pixel[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
> >  }
> >  
> > -static void argb_u16_to_XRGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> > +static void argb_u16_to_XRGB8888(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
> >  {
> > -	dst_pixels[3] = 0xff;
> > -	dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
> > -	dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixel->g, 257);
> > -	dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
> > +	out_pixel[3] = 0xff;
> > +	out_pixel[2] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
> > +	out_pixel[1] = DIV_ROUND_CLOSEST(in_pixel->g, 257);
> > +	out_pixel[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
> >  }
> >  
> > -static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> > +static void argb_u16_to_ARGB16161616(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
> >  {
> > -	u16 *pixels = (u16 *)dst_pixels;
> > +	u16 *pixel = (u16 *)out_pixel;
> >  
> > -	pixels[3] = cpu_to_le16(in_pixel->a);
> > -	pixels[2] = cpu_to_le16(in_pixel->r);
> > -	pixels[1] = cpu_to_le16(in_pixel->g);
> > -	pixels[0] = cpu_to_le16(in_pixel->b);
> > +	pixel[3] = cpu_to_le16(in_pixel->a);
> > +	pixel[2] = cpu_to_le16(in_pixel->r);
> > +	pixel[1] = cpu_to_le16(in_pixel->g);
> > +	pixel[0] = cpu_to_le16(in_pixel->b);
> >  }
> >  
> > -static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> > +static void argb_u16_to_XRGB16161616(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
> >  {
> > -	u16 *pixels = (u16 *)dst_pixels;
> > +	u16 *pixel = (u16 *)out_pixel;
> >  
> > -	pixels[3] = 0xffff;
> > -	pixels[2] = cpu_to_le16(in_pixel->r);
> > -	pixels[1] = cpu_to_le16(in_pixel->g);
> > -	pixels[0] = cpu_to_le16(in_pixel->b);
> > +	pixel[3] = 0xffff;
> > +	pixel[2] = cpu_to_le16(in_pixel->r);
> > +	pixel[1] = cpu_to_le16(in_pixel->g);
> > +	pixel[0] = cpu_to_le16(in_pixel->b);
> >  }
> >  
> > -static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> > +static void argb_u16_to_RGB565(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
> >  {
> > -	u16 *pixels = (u16 *)dst_pixels;
> > +	u16 *pixel = (u16 *)out_pixel;
> >  
> >  	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> >  	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> > @@ -235,7 +235,7 @@ static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> >  	u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
> >  	u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
> >  
> > -	*pixels = cpu_to_le16(r << 11 | g << 5 | b);
> > +	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
> >  }
> >  
> >  /**
> > @@ -266,7 +266,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
> >   *
> >   * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> >   */
> > -void *get_pixel_conversion_function(u32 format)
> > +pixel_read_t get_pixel_read_function(u32 format)
> >  {
> >  	switch (format) {
> >  	case DRM_FORMAT_ARGB8888:
> > @@ -280,7 +280,16 @@ void *get_pixel_conversion_function(u32 format)
> >  	case DRM_FORMAT_RGB565:
> >  		return &RGB565_to_argb_u16;
> >  	default:
> > -		return NULL;
> > +		/*
> > +		 * This is a bug in vkms_plane_atomic_check. All the supported
> > +		 * format must:
> > +		 * - Be listed in vkms_formats in vkms_plane.c
> > +		 * - Have a pixel_read callback defined here
> > +		 */
> > +		WARN(true,
> > +		     "Pixel format %p4cc is not supported by VKMS planes. This is a kernel bug, atomic check must forbid this configuration.\n",
> > +		     &format);
> > +		return (pixel_read_t)NULL;
> >  	}
> >  }
> >  
> > @@ -291,7 +300,7 @@ void *get_pixel_conversion_function(u32 format)
> >   *
> >   * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> >   */
> > -void *get_pixel_write_function(u32 format)
> > +pixel_write_t get_pixel_write_function(u32 format)
> >  {
> >  	switch (format) {
> >  	case DRM_FORMAT_ARGB8888:
> > @@ -305,6 +314,15 @@ void *get_pixel_write_function(u32 format)
> >  	case DRM_FORMAT_RGB565:
> >  		return &argb_u16_to_RGB565;
> >  	default:
> > -		return NULL;
> > +		/*
> > +		 * This is a bug in vkms_writeback_atomic_check. All the supported
> > +		 * format must:
> > +		 * - Be listed in vkms_wb_formats in vkms_writeback.c
> > +		 * - Have a pixel_write callback defined here
> > +		 */
> > +		WARN(true,
> > +		     "Pixel format %p4cc is not supported by VKMS writeback. This is a kernel bug, atomic check must forbid this configuration.\n",
> > +		     &format);
> > +		return (pixel_write_t)NULL;
> >  	}
> >  }
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> > index cf59c2ed8e9a..3ecea4563254 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.h
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> > @@ -5,8 +5,8 @@
> >  
> >  #include "vkms_drv.h"
> >  
> > -void *get_pixel_conversion_function(u32 format);
> > +pixel_read_t get_pixel_read_function(u32 format);
> >  
> > -void *get_pixel_write_function(u32 format);
> > +pixel_write_t get_pixel_write_function(u32 format);
> >  
> >  #endif /* _VKMS_FORMATS_H_ */
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index 21b5adfb44aa..10e9b23dab28 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -125,7 +125,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> >  	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
> >  			drm_rect_height(&frame_info->rotated), frame_info->rotation);
> >  
> > -	vkms_plane_state->pixel_read = get_pixel_conversion_function(fmt);
> > +	vkms_plane_state->pixel_read = get_pixel_read_function(fmt);
> >  }
> >  
> >  static int vkms_plane_atomic_check(struct drm_plane *plane,
> > 
> 



-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
