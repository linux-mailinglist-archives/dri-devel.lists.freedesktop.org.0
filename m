Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5C59D16C9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 18:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EC210E529;
	Mon, 18 Nov 2024 17:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A/YTCm2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E782010E529
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 17:10:49 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4319399a411so40968355e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 09:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731949848; x=1732554648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rMsBau+RNY/BQ9drs/seXkWHcU6HysTcpfy1mkYz62E=;
 b=A/YTCm2RHP7xg2Ejr0VyLKPK710O9jm2hAXIJ6V9nGFl1JCeu/uNRsH16T4SQ26uro
 qel2sOvZ3Kl8aD+by2bNuiYLqUD2x5BtajyHH7ss2IkvTA4FXxUetJZ3bKjbgaH3nEpg
 u6/Ru1zhMqT/dowQSo767190fhVW+PZijLgxNlmOw1lLw6iu4fEK0CWATFC82jvcV2ys
 ZH91cZR9G8Hg68lAhgru//jmgongAWoSL2RJSbRFsGuV2LcTsAcqjKMgaOnWdlneeo3W
 d2QmIsjgWXKNjFG3BH4nB4BjmzMsJdd8fqsqXeCYgfC8F/olcJoUA1w2s/SXrvPkXGqH
 IanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731949848; x=1732554648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rMsBau+RNY/BQ9drs/seXkWHcU6HysTcpfy1mkYz62E=;
 b=n6ySZFv6GHiVjjoMeDC3PooBkdwxBCxaXFHoXK+9doRGPs9G39oa/7hVQ7QL0h4I2M
 OV/j+SKLTt9srt0z7jWrGwzb6enzE5Iik6gK6rafFt8b+j2eUf7Hu9NrmRqWvKq7aaun
 hrNYXvuAgrPACLKzuR2upckRgf2wECItuIpBwgiLgPi3KnD6wIV/RuBTHYR9dz300zVG
 Ne9JMnZl8ghB0u0JSp58G3h/bbx3biiEJE0hTjmru/bszcd/y10MsWc47SemsgA0Ublx
 P2Vlbs4MdIHZAdZrOzD+HOFqpZ4IIuR5RrIRoZPCQd3fhjIduRbc+0my9JuwMLijD4IE
 QIIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXajAtz99Lh38VN4KpXC/LETcZhmIifTFa9L0ysCpFTq4EmACQslWDBlUpghDXxK6UfCVvAin9wn3k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz9l64Shmd3CR2gfmynv34xZb2b+JQYzV+AbzyM38KfjKHJcgG
 VmDcec2qKpVGwFiNhZQ8uTE0M5sVRE/Mi4ULfVn8xRg9PYlAtRuq
X-Google-Smtp-Source: AGHT+IEmWeRgtUI4XZ0nOVHrQDr2gMtwhcNxdB0d8C+tnMK3cUO1eNocb36D2Hy8oEafoeECFHDjtg==
X-Received: by 2002:a05:600c:1c81:b0:432:a36b:d896 with SMTP id
 5b1f17b1804b1-432df78c5a9mr99224175e9.26.1731949848076; 
 Mon, 18 Nov 2024 09:10:48 -0800 (PST)
Received: from fedora.. ([213.94.25.69]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3823a0e8f26sm7119834f8f.31.2024.11.18.09.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 09:10:47 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 helen.koike@collabora.com, jeremie.dautheribes@bootlin.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 marcheu@google.com, melissa.srw@gmail.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, nicolejadeyee@google.com, pekka.paalanen@haloniitty.fi,
 rdunlap@infradead.org, rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 simona.vetter@ffwll.ch, simona@ffwll.ch, thomas.petazzoni@bootlin.com,
 tzimmermann@suse.de
Subject: [PATCH v13 7/9] drm/vkms: Introduce pixel_read_direction enum
Date: Mon, 18 Nov 2024 18:10:45 +0100
Message-ID: <20241118171046.2861-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031-yuv-v13-7-bd5463126faa@bootlin.com>
References: <20241031-yuv-v13-7-bd5463126faa@bootlin.com>
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

> The pixel_read_direction enum is useful to describe the reading direction
> in a plane. It avoids using the rotation property of DRM, which not
> practical to know the direction of reading.
> This patch also introduce two helpers, one to compute the
> pixel_read_direction from the DRM rotation property, and one to compute
> the step, in byte, between two successive pixel in a specific direction.
> 
> Acked-by: Maíra Canal <mairacanal@riseup.net>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 44 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_drv.h      | 11 +++++++++
>  drivers/gpu/drm/vkms/vkms_formats.c  | 32 ++++++++++++++++++++++++++
>  3 files changed, 87 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index ecac0bc858a0..601e33431b45 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -159,6 +159,50 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
>  	}
>  }
>  
> +/**
> + * direction_for_rotation() - Get the correct reading direction for a given rotation
> + *
> + * @rotation: Rotation to analyze. It correspond the field @frame_info.rotation.
> + *
> + * This function will use the @rotation setting of a source plane to compute the reading
> + * direction in this plane which correspond to a "left to right writing" in the CRTC.
> + * For example, if the buffer is reflected on X axis, the pixel must be read from right to left
> + * to be written from left to right on the CRTC.
> + */
> +static enum pixel_read_direction direction_for_rotation(unsigned int rotation)
> +{
> +	struct drm_rect tmp_a, tmp_b;
> +	int x, y;
> +
> +	/*
> +	 * Points A and B are depicted as zero-size rectangles on the CRTC.
> +	 * The CRTC writing direction is from A to B. The plane reading direction
> +	 * is discovered by inverse-transforming A and B.
> +	 * The reading direction is computed by rotating the vector AB (top-left to top-right) in a
> +	 * 1x1 square.
> +	 */
> +
> +	tmp_a = DRM_RECT_INIT(0, 0, 0, 0);
> +	tmp_b = DRM_RECT_INIT(1, 0, 0, 0);
> +	drm_rect_rotate_inv(&tmp_a, 1, 1, rotation);
> +	drm_rect_rotate_inv(&tmp_b, 1, 1, rotation);
> +
> +	x = tmp_b.x1 - tmp_a.x1;
> +	y = tmp_b.y1 - tmp_a.y1;
> +
> +	if (x == 1 && y == 0)
> +		return READ_LEFT_TO_RIGHT;
> +	else if (x == -1 && y == 0)
> +		return READ_RIGHT_TO_LEFT;
> +	else if (y == 1 && x == 0)
> +		return READ_TOP_TO_BOTTOM;
> +	else if (y == -1 && x == 0)
> +		return READ_BOTTOM_TO_TOP;
> +
> +	WARN_ONCE(true, "The inverse of the rotation gives an incorrect direction.");
> +	return READ_LEFT_TO_RIGHT;
> +}
> +
>  /**
>   * blend - blend the pixels from all planes and compute crc
>   * @wb: The writeback frame buffer metadata
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 3f45290a0c5d..777b7bd91f27 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -69,6 +69,17 @@ struct vkms_writeback_job {
>  	pixel_write_t pixel_write;
>  };
>  
> +/**
> + * enum pixel_read_direction - Enum used internaly by VKMS to represent a reading direction in a

Minor typo:

s/internaly/internally

Everything else looks great, thanks!

> + * plane.
> + */
> +enum pixel_read_direction {
> +	READ_BOTTOM_TO_TOP,
> +	READ_TOP_TO_BOTTOM,
> +	READ_RIGHT_TO_LEFT,
> +	READ_LEFT_TO_RIGHT
> +};
> +
>  /**
>   * typedef pixel_read_t - These functions are used to read a pixel in the source frame,
>   * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 7f932d42394d..d0e7dfc1f0d3 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -79,6 +79,38 @@ static void packed_pixels_addr(const struct vkms_frame_info *frame_info,
>  	*addr = (u8 *)frame_info->map[0].vaddr + offset;
>  }
>  
> +/**
> + * get_block_step_bytes() - Common helper to compute the correct step value between each pixel block
> + * to read in a certain direction.
> + *
> + * @fb: Framebuffer to iter on
> + * @direction: Direction of the reading
> + * @plane_index: Plane to get the step from
> + *
> + * As the returned count is the number of bytes between two consecutive blocks in a direction,
> + * the caller may have to read multiple pixels before using the next one (for example, to read from
> + * left to right in a DRM_FORMAT_R1 plane, each block contains 8 pixels, so the step must be used
> + * only every 8 pixels).
> + */
> +static int get_block_step_bytes(struct drm_framebuffer *fb, enum pixel_read_direction direction,
> +				int plane_index)
> +{
> +	switch (direction) {
> +	case READ_LEFT_TO_RIGHT:
> +		return fb->format->char_per_block[plane_index];
> +	case READ_RIGHT_TO_LEFT:
> +		return -fb->format->char_per_block[plane_index];
> +	case READ_TOP_TO_BOTTOM:
> +		return (int)fb->pitches[plane_index] * drm_format_info_block_width(fb->format,
> +										   plane_index);
> +	case READ_BOTTOM_TO_TOP:
> +		return -(int)fb->pitches[plane_index] * drm_format_info_block_width(fb->format,
> +										    plane_index);
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * packed_pixels_addr_1x1() - Get the pointer to the block containing the pixel at the given
>   * coordinates
> 
