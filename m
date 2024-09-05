Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03A096D89D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 14:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2861510E11B;
	Thu,  5 Sep 2024 12:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZvPv/6UQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD1210E11B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 12:33:25 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42c828c8863so5930365e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725539604; x=1726144404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ACo5pyh8ZH0iApXWsTEGKO0W8zLiGjkvm+h5suFQZ3Q=;
 b=ZvPv/6UQ0WH4cEkX/fS7UqI30WHe5QKXyHHi8O7gdLKl7brP50anbuV/gvizFO9EF3
 l9uf7nDuI3i9/HpbmpBWnXTQlRznLzt1euX1ktGXUNGGQCty9n3+U9F6GSK+kyqEhA85
 mftak7HCsagjILVAlJ7Z/DJRZam98pVl1tBv+KlTBXwHLH9UPBXmOKkH0vBLYnsTp5sV
 bYC9VyeIqw+Ro8sz6AwkZm3w/OLN9rs4t3WP0yZgyuNi8AatOlGI077tqxNZ0A07zRSy
 3sqDmtSgTwNhuZqm1GCFqR8+exGMiZZR/EZEWz+IL2wv6BBl5KF5i0XRO/SMhI1kTIie
 bsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725539604; x=1726144404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ACo5pyh8ZH0iApXWsTEGKO0W8zLiGjkvm+h5suFQZ3Q=;
 b=KNSUbOgYrp/T4CrngjDHin0aSVs34AU/0fwU2yZ+TCZEBDarvESO4WMIFdlIaNT5QW
 u9QysjVpegTAJDEYzQjR6MK08qIvZuGF6dhXvMgtV9mBeOiJlxbYP5QnYqz81V5dROr6
 qwmv990hZ6xR0z0ZihBMFWEBY6eHDlDkLqZL6s7crTS9DKnmKOMjS3xI/YAYxBhzMmu3
 bmFhzj6k5kayqg/7sYq4meEsIAoiPkguXA80lk3dojERaZEL7CChde8DuNzcMqfcPp5s
 2xoO+zUlmx9oyxcZFlFQKtpWJdMq37fVdoezaSDWOAej58yrF1fbHkj18G3ZYW6Uu4GU
 434g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxMJnA6tsH8aQihiIrRhLWJ5G504e8Gtf+Ju0zsRwZaFcKqS1FsNr3U5Ao5nCcgftgK9puqtxJI6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlQZG1O1CIzixMEk3QSm66U8ElcZJ17KyNzX8+2KNKE2OrPU9v
 tf6g67fUgDge9a3atMFfn0+V1Dsk7WEQMPmJL/dqgbTtY5y7RBqiF+xwOW5U
X-Google-Smtp-Source: AGHT+IGEJfGlrCY0E09RK32iwd4KyQUdAvEvG12UAWMSzQcn2nsrurMAndnd7hlMNDeFMZjFmG1aAg==
X-Received: by 2002:a05:600c:5123:b0:426:6353:4b7c with SMTP id
 5b1f17b1804b1-42bda2ce3a1mr124732025e9.8.1725539603194; 
 Thu, 05 Sep 2024 05:33:23 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb273sm233181905e9.8.2024.09.05.05.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 05:33:22 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 marcheu@google.com, melissa.srw@gmail.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, nicolejadeyee@google.com,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3] drm/vkms: Add documentation
Date: Thu,  5 Sep 2024 14:33:18 +0200
Message-ID: <20240905123319.3035-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829-google-clarifications-v3-1-f6604e2f6297@bootlin.com>
References: <20240829-google-clarifications-v3-1-f6604e2f6297@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Thanks for appling the suggested changes.

I added some minor style comments, but other than that patch looks
good to me.

> Add documentation around vkms_output and its initialization.
> Add some documentation on pixel conversion functions.
> Update of outdated comments for pixel_write functions.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

With the suggested changes, feel free to add:
Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
> This series does not introduce functionnal changes, only some
> documentation and renaming to clarify the code.
> ---
> Changes in v3:
> - Merged https://lore.kernel.org/all/20240802-yuv-v9-3-08a706669e16@bootlin.com/
>   as it also add documentation
> - Apply José's comments, sorry
> - Replace =1 by =BIT(0) for possible_crtc value
> - Link to v2: https://lore.kernel.org/r/20240826-google-clarifications-v2-1-2574655b0b91@bootlin.com
> 
> Changes in v2:
> - Dropped already applied patches
> - Dropped useless patch as its content is deleted later
> - Remove dependency on previous series
> - Apply Maíra's comments
> - Link to v1: https://lore.kernel.org/r/20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c |   7 +++
>  drivers/gpu/drm/vkms/vkms_drv.h      | 101 ++++++++++++++++++++++++++++++-----
>  drivers/gpu/drm/vkms/vkms_formats.c  |  62 +++++++++++++++++----
>  drivers/gpu/drm/vkms/vkms_output.c   |  14 ++++-
>  4 files changed, 161 insertions(+), 23 deletions(-)
> 
> 
> ---
> base-commit: 84addde447fd9d713e101437db0d4924855eff4f
> change-id: 20240520-google-clarifications-dede8dcbe38a
> 
> Best regards,
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index e7441b227b3c..57a5769fc994 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -189,6 +189,13 @@ static void blend(struct vkms_writeback_job *wb,
>  
>  	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
>  
> +	/*
> +	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
> +	 * complexity to avoid poor blending performance.
> +	 *
> +	 * The function vkms_compose_row() is used to read a line, pixel-by-pixel, into the staging
> +	 * buffer.
> +	 */
>  	for (size_t y = 0; y < crtc_y_limit; y++) {
>  		fill_background(&background_color, output_buffer);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 5e46ea5b96dc..12a11976f2fc 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -25,6 +25,17 @@
>  
>  #define VKMS_LUT_SIZE 256
>  
> +/**
> + * struct vkms_frame_info - Structure to store the state of a frame
> + *
> + * @fb: backing drm framebuffer
> + * @src: source rectangle of this frame in the source framebuffer, stored in 16.16 fixed-point form
> + * @dst: destination rectangle in the crtc buffer, stored in whole pixel units
> + * @map: see drm_shadow_plane_state@data

I think that the right format is "@drm_shadow_plane_state.data"?
https://docs.kernel.org/doc-guide/kernel-doc.html#nested-structs-unions

> + * @rotation: rotation applied to the source.
> + *
> + * @src and @dst should have the same size modulo the rotation.
> + */
>  struct vkms_frame_info {
>  	struct drm_framebuffer *fb;
>  	struct drm_rect src, dst;
> @@ -52,9 +63,11 @@ struct vkms_writeback_job {
>  };
>  
>  /**
> - * vkms_plane_state - Driver specific plane state
> + * struct vkms_plane_state - Driver specific plane state
>   * @base: base plane state
>   * @frame_info: data required for composing computation
> + * @pixel_read: function to read a pixel in this plane. The creator of a struct vkms_plane_state
> + *	        must ensure that this pointer is valid
>   */
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
> @@ -73,29 +86,56 @@ struct vkms_color_lut {
>  };
>  
>  /**
> - * vkms_crtc_state - Driver specific CRTC state
> + * struct vkms_crtc_state - Driver specific CRTC state
> + *
>   * @base: base CRTC state
>   * @composer_work: work struct to compose and add CRC entries
> - * @n_frame_start: start frame number for computed CRC
> - * @n_frame_end: end frame number for computed CRC
> + *

Sorry I missed this extra empty line in my previous review.
You can delete this extra "*".

> + * @num_active_planes: Number of active planes
> + * @active_planes: List containing all the active planes (counted by
> + *  @num_active_planes). They should be stored in z-order.
> + * @active_writeback: Current active writeback job
> + * @gamma_lut: Look up table for gamma used in this CRTC
> + * @crc_pending: Protected by @vkms_output.composer_lock, true when the frame CRC is not computed
> + *		 yet. Used by vblank to detect if the composer is too slow.
> + * @wb_pending: Protected by @vkms_output.composer_lock, true when a writeback frame is requested.
> + * @frame_start: Protected by @vkms_output.composer_lock, saves the frame number before the start
> + *		 of the composition process.
> + * @frame_end: Protected by @vkms_output.composer_lock, saves the last requested frame number.
> + *	       This is used to generate enough CRC entries when the composition worker is too slow.
>   */
>  struct vkms_crtc_state {
>  	struct drm_crtc_state base;
>  	struct work_struct composer_work;
>  
>  	int num_active_planes;
> -	/* stack of active planes for crc computation, should be in z order */
>  	struct vkms_plane_state **active_planes;
>  	struct vkms_writeback_job *active_writeback;
>  	struct vkms_color_lut gamma_lut;
>  
> -	/* below four are protected by vkms_output.composer_lock */
>  	bool crc_pending;
>  	bool wb_pending;
>  	u64 frame_start;
>  	u64 frame_end;
>  };
>  
> +/**
> + * struct vkms_output - Internal representation of all output components in VKMS
> + *
> + * @crtc: Base CRTC in DRM
> + * @encoder: DRM encoder used for this output
> + * @connector: DRM connector used for this output
> + * @wb_connecter: DRM writeback connector used for this output
> + * @vblank_hrtimer: Timer used to trigger the vblank
> + * @period_ns: vblank period, in nanoseconds, used to configure @vblank_hrtimer and to compute
> + *	       vblank timestamps
> + * @composer_workq: Ordered workqueue for @composer_state.composer_work.
> + * @lock: Lock used to protect concurrent access to the composer
> + * @composer_enabled: Protected by @lock, true when the VKMS composer is active (crc needed or
> + *		      writeback)
> + * @composer_state: Protected by @lock, current state of this VKMS output
> + * @composer_lock: Lock used internally to protect @composer_state members
> + */
>  struct vkms_output {
>  	struct drm_crtc crtc;
>  	struct drm_encoder encoder;
> @@ -103,28 +143,38 @@ struct vkms_output {
>  	struct drm_writeback_connector wb_connector;
>  	struct hrtimer vblank_hrtimer;
>  	ktime_t period_ns;
> -	/* ordered wq for composer_work */
>  	struct workqueue_struct *composer_workq;
> -	/* protects concurrent access to composer */
>  	spinlock_t lock;
>  
> -	/* protected by @lock */
>  	bool composer_enabled;
>  	struct vkms_crtc_state *composer_state;
>  
>  	spinlock_t composer_lock;
>  };
>  
> -struct vkms_device;
> -
> +/**
> + * struct vkms_config - General configuration for VKMS driver
> + *
> + * @writeback: If true, a writeback buffer can be attached to the CRTC
> + * @cursor: If true, a cursor plane is created in the VKMS device
> + * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
> + * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
> + */
>  struct vkms_config {
>  	bool writeback;
>  	bool cursor;
>  	bool overlay;
> -	/* only set when instantiated */
>  	struct vkms_device *dev;
>  };
>  
> +/**
> + * struct vkms_device - Description of a VKMS device
> + *
> + * @drm - Base device in DRM
> + * @platform - Associated platform device
> + * @output - Configuration and sub-components of the VKMS device
> + * @config: Configuration used in this VKMS device
> + */
>  struct vkms_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
> @@ -132,6 +182,10 @@ struct vkms_device {
>  	const struct vkms_config *config;
>  };
>  
> +/*
> + * The following helpers are used to convert a member of a struct into its parent.
> + */
> +
>  #define drm_crtc_to_vkms_output(target) \
>  	container_of(target, struct vkms_output, crtc)
>  
> @@ -144,12 +198,33 @@ struct vkms_device {
>  #define to_vkms_plane_state(target)\
>  	container_of(target, struct vkms_plane_state, base.base)
>  
> -/* CRTC */
> +/**
> + * vkms_crtc_init() - Initialize a CRTC for VKMS
> + * @dev: DRM device associated with the VKMS buffer
> + * @crtc: uninitialized CRTC device
> + * @primary: primary plane to attach to the CRTC
> + * @cursor plane to attach to the CRTC

Missing ":" after "@cursor":

 * @cursor: cursor plane to attach to the CRTC

> + */
>  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  		   struct drm_plane *primary, struct drm_plane *cursor);
>  
> +/**
> + * vkms_output_init() - Initialize all sub-components needed for a VKMS device.
> + *
> + * @vkmsdev: VKMS device to initialize
> + * @index: CRTC which can be attached to the planes. The caller must ensure that
> + *	   @index is positive and less or equals to 31.
> + */
>  int vkms_output_init(struct vkms_device *vkmsdev, int index);
>  
> +/**
> + * vkms_plane_init() - Initialize a plane
> + *
> + * @vkmsdev: VKMS device containing the plane
> + * @type: type of plane to initialize
> + * @possible_crtc_index: CRTC which can be attached to the plane. The caller must ensure that
> + * possible_crtc_index is positive and less or equals to 31.

Should read:

 * @index: CRTC which can be attached to the plane. The caller must ensure that
 *	   @index is positive and less or equals to 31.

> + */
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  				   enum drm_plane_type type, int index);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 040b7f113a3b..e8a5cc235ebb 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -9,24 +9,40 @@
>  
>  #include "vkms_formats.h"
>  
> +/**
> + * pixel_offset() - Get the offset of the pixel at coordinates x/y in the first plane
> + *
> + * @frame_info: Buffer metadata
> + * @x: The x coordinate of the wanted pixel in the buffer
> + * @y: The y coordinate of the wanted pixel in the buffer
> + *
> + * The caller must ensure that the framebuffer associated with this request uses a pixel format
> + * where block_h == block_w == 1.
> + * If this requirement is not fulfilled, the resulting offset can point to an other pixel or
> + * outside of the buffer.
> + */
>  static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
>  {
>  	return frame_info->offset + (y * frame_info->pitch)
>  				  + (x * frame_info->cpp);
>  }
>  
> -/*
> - * packed_pixels_addr - Get the pointer to pixel of a given pair of coordinates
> +/**
> + * packed_pixels_addr() - Get the pointer to the block containing the pixel at the given
> + * coordinates
>   *
>   * @frame_info: Buffer metadata
> - * @x: The x(width) coordinate of the 2D buffer
> - * @y: The y(Heigth) coordinate of the 2D buffer
> + * @x: The x (width) coordinate inside the plane
> + * @y: The y (height) coordinate inside the plane
>   *
>   * Takes the information stored in the frame_info, a pair of coordinates, and
>   * returns the address of the first color channel.
>   * This function assumes the channels are packed together, i.e. a color channel
>   * comes immediately after another in the memory. And therefore, this function
>   * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
> + *
> + * The caller must ensure that the framebuffer associated with this request uses a pixel format
> + * where block_h == block_w == 1, otherwise the returned pointer can be outside the buffer.
>   */
>  static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
>  				int x, int y)
> @@ -51,6 +67,13 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int limit, i
>  	return x;
>  }
>  
> +/*
> + * The following functions take pixel data from the buffer and convert them to the format
> + * ARGB16161616 in @out_pixel.
> + *
> + * They are used in the vkms_compose_row() function to handle multiple formats.
> + */
> +
>  static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
>  	/*
> @@ -143,12 +166,11 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
>  }
>  
>  /*
> - * The following  functions take an line of argb_u16 pixels from the
> - * src_buffer, convert them to a specific format, and store them in the
> - * destination.
> + * The following functions take one &struct pixel_argb_u16 and convert it to a specific format.
> + * The result is stored in @dst_pixels.
>   *
> - * They are used in the `compose_active_planes` to convert and store a line
> - * from the src_buffer to the writeback buffer.
> + * They are used in vkms_writeback_row() to convert and store a pixel from the src_buffer to
> + * the writeback buffer.
>   */
>  static void argb_u16_to_ARGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>  {
> @@ -214,6 +236,14 @@ static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>  	*pixels = cpu_to_le16(r << 11 | g << 5 | b);
>  }
>  
> +/**
> + * vkms_writeback_row() - Generic loop for all supported writeback format. It is executed just
> + * after the blending to write a line in the writeback buffer.
> + *
> + * @wb: Job where to insert the final image
> + * @src_buffer: Line to write
> + * @y: Row to write in the writeback buffer
> + */
>  void vkms_writeback_row(struct vkms_writeback_job *wb,
>  			const struct line_buffer *src_buffer, int y)
>  {
> @@ -227,6 +257,13 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>  		wb->pixel_write(dst_pixels, &in_pixels[x]);
>  }
>  
> +/**
> + * get_pixel_conversion_function() - Retrieve the correct read_pixel function for a specific
> + * format. The returned pointer is NULL for unsupported pixel formats. The caller must ensure that
> + * the pointer is valid before using it in a vkms_plane_state.
> + *
> + * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> + */
>  void *get_pixel_conversion_function(u32 format)
>  {
>  	switch (format) {
> @@ -245,6 +282,13 @@ void *get_pixel_conversion_function(u32 format)
>  	}
>  }
>  
> +/**
> + * get_pixel_write_function() - Retrieve the correct write_pixel function for a specific format.
> + * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
> + * pointer is valid before using it in a vkms_writeback_job.
> + *
> + * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> + */
>  void *get_pixel_write_function(u32 format)
>  {
>  	switch (format) {
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 5ce70dd946aa..56801e914208 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -21,6 +21,7 @@ static int vkms_conn_get_modes(struct drm_connector *connector)
>  {
>  	int count;
>  
> +	/* Use the default modes list from DRM */
>  	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
>  	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
>  
> @@ -58,6 +59,12 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  	int writeback;
>  	unsigned int n;
>  
> +	/*
> +	 * Initialize used plane. One primary plane is required to perform the composition.
> +	 *
> +	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
> +	 * composition.
> +	 */
>  	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
> @@ -76,6 +83,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  			return PTR_ERR(cursor);
>  	}
>  
> +	/* [1]: Allocation of a CRTC, its index will be 1 */

It'd be great to clarify that BIT(0) == 1. Maybe?

  /* [1]: Allocation of a CRTC, its index will be BIT(0) = 1 */

>  	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
>  	if (ret)
>  		return ret;
> @@ -95,7 +103,11 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		DRM_ERROR("Failed to init encoder\n");
>  		goto err_encoder;
>  	}
> -	encoder->possible_crtcs = 1;
> +	/*
> +	 * This is a hardcoded value to select crtc for the encoder.
> +	 * 1 here designate the first registered CRTC, the one allocated in [1]

BIT(0) here designate the first...

> +	 */
> +	encoder->possible_crtcs = BIT(0);
>  
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret) {
