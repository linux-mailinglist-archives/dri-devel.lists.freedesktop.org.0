Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4310AAD8E60
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF61210E9C2;
	Fri, 13 Jun 2025 14:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZF9KR6Rc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF26A10E9C2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:00:27 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4508287895dso20932135e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749823226; x=1750428026; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YgP1kvrXmli2cZYIrpU+nsM8sWeFE+vQ7S5TQiPvK1w=;
 b=ZF9KR6Rc/9bf2efbI2zMVoXsVw35Lrg8qRGpF4KDT35Kf2aoU06a46NwCaev8rwYpI
 Z0t14ipLhFnrPJy6oiSGxt4AP0l/1CnTdFJTrKxiq/x8al+zfRdIT57CjPghkwRud31g
 b/zvh4doceZ4M0vVTr/L/wlkBwCaphfBr3xd6RIpSf+b49V1u3rS9ZHpUQb5vmPeGRCp
 VBxk0cpVzOiqwR4kkQzxKgSBkwiYvoSG97uuJGV8LPMd547FzV5OnL8tPhhoMfveGH2h
 bxII+0YNh8PEMd3j4T9JqZULcWSTyWB3FQAw+2KZBtFczc0Z9iNoD/bZZtFzp/JT2rui
 49/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749823226; x=1750428026;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YgP1kvrXmli2cZYIrpU+nsM8sWeFE+vQ7S5TQiPvK1w=;
 b=NoTABnmyJ8jNHiPlwOaxwYI7s4BWBLGT1AlGahJ/zxmAOA1tXHgQrEMYls9RW14VgG
 NL1LXjSNJcWASns5P5xRTWY2KAuger7AjCsOcjZCJ++a08NinrDuOaOEH2WED3ROQ0yS
 CHqX6YPGeO2tFpY0ozdyrXRm3Yj3tS4Q4m4BLAl9uGxqTCefB57FpV7AAICsCqzXYFio
 VOI1k1J953lR0xPfa2QCzbBcnrYNJGJ66hgFRys19xctLKjRN5tYnKrx0+vVbigdqsZV
 SJeKr30ylx0JyaEtHeh7BzKvyPN7/3HBJSxUVuujZVVpcLg9LWECe2kNFY60OMHmgShz
 MiEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2OqJXaI9FJ6tVfpIlU7AN5bDox4LfD95zxPvUPRAfoiJ15QDm/lcDIdm+r+L7C5UAUviLIE99cFk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7r0XtkgkekrjMjnBveayLOQboAkIn7MpSFAGzoTf15JD16G74
 xAragHVZ2lIane7Ulms/LQB1WiokbUXV+ocNzx6Yc3IPMbgml5X3R/JP
X-Gm-Gg: ASbGncspbFZA7uvd+Qwty/oXAhM5xZqrVc9LIZ7conl15931NkR/JvknSBxPFvsY+rb
 a0iEOBUmJTYqi7m/fo3R+Fz6bnjzgoqXD13x+UTfduAJNEV10IbV4zYytDTDYJxTVzKRkNC6QQ4
 bD23tKgONOesKo+h9CA8rCayJ0pK2PR5UKHkW7qT0Uokmpwif5xASG5nabZ9yl2/SpddFN2uDFM
 lt/c7EIpNpe0xPnnMn3xNEMbLlBEeDx78fvLiTU+afItvUzO0NgnB7Mmk5V8STKHAPOwM/UxSRd
 EIt6qAEIU2npkhL8y5S/9paFl/lmK5x6ePh3p6CgNOZbnGPGNldSoatWjlE=
X-Google-Smtp-Source: AGHT+IHjTx3uMpqhF6I44B8sjZwZ+c5ktKBMPGLM098AL5qdB2sPWVNMo5bGgONSn3ig5e0kF3G1Yg==
X-Received: by 2002:a05:600c:184c:b0:448:d54a:ca23 with SMTP id
 5b1f17b1804b1-4533b24b7e8mr7402065e9.8.1749823225840; 
 Fri, 13 Jun 2025 07:00:25 -0700 (PDT)
Received: from fedora ([94.73.34.56]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e224600sm53841435e9.8.2025.06.13.07.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 07:00:25 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:00:23 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: arthurgrillo@riseup.net, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] drm/tests: Do not use drm_fb_blit() in
 format-helper tests
Message-ID: <aEwu91r9WfjGB6Ny@fedora>
References: <20250612135658.232535-1-tzimmermann@suse.de>
 <20250612135658.232535-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612135658.232535-2-tzimmermann@suse.de>
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

Hi Thomas,

On Thu, Jun 12, 2025 at 03:52:22PM +0200, Thomas Zimmermann wrote:
> Export additional helpers from the format-helper library and open-code
> drm_fb_blit() in tests. Prepares for the removal of drm_fb_blit(). Only
> sysfb drivers use drm_fb_blit(). The function will soon be removed from
> format helpers and be refactored within sysfb helpers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed and run the tests, they work, thanks.

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/drm_format_helper.c           | 108 ++++++++++++++++--
>  drivers/gpu/drm/drm_format_internal.h         |   8 ++
>  .../gpu/drm/tests/drm_format_helper_test.c    | 108 +++---------------
>  include/drm/drm_format_helper.h               |   9 ++
>  4 files changed, 131 insertions(+), 102 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index d36e6cacc575..73b5a80771cc 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -857,11 +857,33 @@ static void drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsig
>  	drm_fb_xfrm_line_32to32(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_abgr8888);
>  }
>  
> -static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> -					const struct iosys_map *src,
> -					const struct drm_framebuffer *fb,
> -					const struct drm_rect *clip,
> -					struct drm_format_conv_state *state)
> +/**
> + * drm_fb_xrgb8888_to_abgr8888 - Convert XRGB8888 to ABGR8888 clip buffer
> + * @dst: Array of ABGR8888 destination buffers
> + * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
> + *             within @dst; can be NULL if scanlines are stored next to each other.
> + * @src: Array of XRGB8888 source buffer
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + * @state: Transform and conversion state
> + *
> + * This function copies parts of a framebuffer to display memory and converts the
> + * color format during the process. The parameters @dst, @dst_pitch and @src refer
> + * to arrays. Each array must have at least as many entries as there are planes in
> + * @fb's format. Each entry stores the value for the format's respective color plane
> + * at the same index.
> + *
> + * This function does not apply clipping on @dst (i.e. the destination is at the
> + * top-left corner).
> + *
> + * Drivers can use this function for ABGR8888 devices that don't support XRGB8888
> + * natively. It sets an opaque alpha channel as part of the conversion.
> + */
> +void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src,
> +				 const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip,
> +				 struct drm_format_conv_state *state)
>  {
>  	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
>  		4,
> @@ -870,17 +892,40 @@ static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned in
>  	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
>  		    drm_fb_xrgb8888_to_abgr8888_line);
>  }
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_abgr8888);
>  
>  static void drm_fb_xrgb8888_to_xbgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
>  	drm_fb_xfrm_line_32to32(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_xbgr8888);
>  }
>  
> -static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> -					const struct iosys_map *src,
> -					const struct drm_framebuffer *fb,
> -					const struct drm_rect *clip,
> -					struct drm_format_conv_state *state)
> +/**
> + * drm_fb_xrgb8888_to_xbgr8888 - Convert XRGB8888 to XBGR8888 clip buffer
> + * @dst: Array of XBGR8888 destination buffers
> + * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
> + *             within @dst; can be NULL if scanlines are stored next to each other.
> + * @src: Array of XRGB8888 source buffer
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + * @state: Transform and conversion state
> + *
> + * This function copies parts of a framebuffer to display memory and converts the
> + * color format during the process. The parameters @dst, @dst_pitch and @src refer
> + * to arrays. Each array must have at least as many entries as there are planes in
> + * @fb's format. Each entry stores the value for the format's respective color plane
> + * at the same index.
> + *
> + * This function does not apply clipping on @dst (i.e. the destination is at the
> + * top-left corner).
> + *
> + * Drivers can use this function for XBGR8888 devices that don't support XRGB8888
> + * natively.
> + */
> +void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src,
> +				 const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip,
> +				 struct drm_format_conv_state *state)
>  {
>  	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
>  		4,
> @@ -889,6 +934,49 @@ static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned in
>  	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
>  		    drm_fb_xrgb8888_to_xbgr8888_line);
>  }
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_xbgr8888);
> +
> +static void drm_fb_xrgb8888_to_bgrx8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +{
> +	drm_fb_xfrm_line_32to32(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_bgrx8888);
> +}
> +
> +/**
> + * drm_fb_xrgb8888_to_bgrx8888 - Convert XRGB8888 to BGRX8888 clip buffer
> + * @dst: Array of BGRX8888 destination buffers
> + * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
> + *             within @dst; can be NULL if scanlines are stored next to each other.
> + * @src: Array of XRGB8888 source buffer
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + * @state: Transform and conversion state
> + *
> + * This function copies parts of a framebuffer to display memory and converts the
> + * color format during the process. The parameters @dst, @dst_pitch and @src refer
> + * to arrays. Each array must have at least as many entries as there are planes in
> + * @fb's format. Each entry stores the value for the format's respective color plane
> + * at the same index.
> + *
> + * This function does not apply clipping on @dst (i.e. the destination is at the
> + * top-left corner).
> + *
> + * Drivers can use this function for BGRX8888 devices that don't support XRGB8888
> + * natively.
> + */
> +void drm_fb_xrgb8888_to_bgrx8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src,
> +				 const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip,
> +				 struct drm_format_conv_state *state)
> +{
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		4,
> +	};
> +
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
> +		    drm_fb_xrgb8888_to_bgrx8888_line);
> +}
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_bgrx8888);
>  
>  static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
> diff --git a/drivers/gpu/drm/drm_format_internal.h b/drivers/gpu/drm/drm_format_internal.h
> index 9f857bfa368d..0aa458b8a3e0 100644
> --- a/drivers/gpu/drm/drm_format_internal.h
> +++ b/drivers/gpu/drm/drm_format_internal.h
> @@ -111,6 +111,14 @@ static inline u32 drm_pixel_xrgb8888_to_xbgr8888(u32 pix)
>  	       ((pix & 0x000000ff) << 16);
>  }
>  
> +static inline u32 drm_pixel_xrgb8888_to_bgrx8888(u32 pix)
> +{
> +	return ((pix & 0xff000000) >> 24) | /* also copy filler bits */
> +	       ((pix & 0x00ff0000) >> 8) |
> +	       ((pix & 0x0000ff00) << 8) |
> +	       ((pix & 0x000000ff) << 24);
> +}
> +
>  static inline u32 drm_pixel_xrgb8888_to_abgr8888(u32 pix)
>  {
>  	return GENMASK(31, 24) | /* fill alpha bits */
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 35cd3405d045..8aacc1ffa93a 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -748,14 +748,9 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>  	buf = dst.vaddr;
>  	memset(buf, 0, dst_size);
>  
> -	int blit_result = 0;
> -
> -	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGB565, &src, &fb, &params->clip,
> -				  &fmtcnv_state);
> -
> +	drm_fb_xrgb8888_to_rgb565(&dst, dst_pitch, &src, &fb, &params->clip,
> +				  &fmtcnv_state, false);
>  	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
> -
> -	KUNIT_EXPECT_FALSE(test, blit_result);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>  
> @@ -795,14 +790,8 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
>  	buf = dst.vaddr; /* restore original value of buf */
>  	memset(buf, 0, dst_size);
>  
> -	int blit_result = 0;
> -
> -	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB1555, &src, &fb, &params->clip,
> -				  &fmtcnv_state);
> -
> +	drm_fb_xrgb8888_to_xrgb1555(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
>  	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
> -
> -	KUNIT_EXPECT_FALSE(test, blit_result);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>  
> @@ -842,14 +831,8 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
>  	buf = dst.vaddr; /* restore original value of buf */
>  	memset(buf, 0, dst_size);
>  
> -	int blit_result = 0;
> -
> -	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB1555, &src, &fb, &params->clip,
> -				  &fmtcnv_state);
> -
> +	drm_fb_xrgb8888_to_argb1555(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
>  	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
> -
> -	KUNIT_EXPECT_FALSE(test, blit_result);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>  
> @@ -889,14 +872,8 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
>  	buf = dst.vaddr; /* restore original value of buf */
>  	memset(buf, 0, dst_size);
>  
> -	int blit_result = 0;
> -
> -	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGBA5551, &src, &fb, &params->clip,
> -				  &fmtcnv_state);
> -
> +	drm_fb_xrgb8888_to_rgba5551(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
>  	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
> -
> -	KUNIT_EXPECT_FALSE(test, blit_result);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>  
> @@ -939,12 +916,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>  	buf = dst.vaddr; /* restore original value of buf */
>  	memset(buf, 0, dst_size);
>  
> -	int blit_result = 0;
> -
> -	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGB888, &src, &fb, &params->clip,
> -				  &fmtcnv_state);
> -
> -	KUNIT_EXPECT_FALSE(test, blit_result);
> +	drm_fb_xrgb8888_to_rgb888(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>  
> @@ -985,12 +957,8 @@ static void drm_test_fb_xrgb8888_to_bgr888(struct kunit *test)
>  	buf = dst.vaddr; /* restore original value of buf */
>  	memset(buf, 0, dst_size);
>  
> -	int blit_result = 0;
> -
> -	blit_result = drm_fb_blit(&dst, &result->dst_pitch, DRM_FORMAT_BGR888, &src, &fb, &params->clip,
> +	drm_fb_xrgb8888_to_bgr888(&dst, &result->dst_pitch, &src, &fb, &params->clip,
>  				  &fmtcnv_state);
> -
> -	KUNIT_EXPECT_FALSE(test, blit_result);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>  
> @@ -1030,14 +998,8 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
>  	buf = dst.vaddr; /* restore original value of buf */
>  	memset(buf, 0, dst_size);
>  
> -	int blit_result = 0;
> -
> -	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB8888, &src, &fb, &params->clip,
> -				  &fmtcnv_state);
> -
> +	drm_fb_xrgb8888_to_argb8888(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
>  	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> -
> -	KUNIT_EXPECT_FALSE(test, blit_result);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>  
> @@ -1077,12 +1039,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  	buf = dst.vaddr; /* restore original value of buf */
>  	memset(buf, 0, dst_size);
>  
> -	int blit_result = 0;
> -
> -	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB2101010, &src, &fb,
> -				  &params->clip, &fmtcnv_state);
> -
> -	KUNIT_EXPECT_FALSE(test, blit_result);
> +	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>  
> @@ -1122,14 +1079,8 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
>  	buf = dst.vaddr; /* restore original value of buf */
>  	memset(buf, 0, dst_size);
>  
> -	int blit_result = 0;
> -
> -	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB2101010, &src, &fb,
> -				  &params->clip, &fmtcnv_state);
> -
> +	drm_fb_xrgb8888_to_argb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
>  	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> -
> -	KUNIT_EXPECT_FALSE(test, blit_result);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>  
> @@ -1202,23 +1153,15 @@ static void drm_test_fb_swab(struct kunit *test)
>  	buf = dst.vaddr; /* restore original value of buf */
>  	memset(buf, 0, dst_size);
>  
> -	int blit_result;
> -
> -	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB8888 | DRM_FORMAT_BIG_ENDIAN,
> -				  &src, &fb, &params->clip, &fmtcnv_state);
> +	drm_fb_swab(&dst, dst_pitch, &src, &fb, &params->clip, false, &fmtcnv_state);
>  	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> -
> -	KUNIT_EXPECT_FALSE(test, blit_result);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  
>  	buf = dst.vaddr;
>  	memset(buf, 0, dst_size);
>  
> -	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_BGRX8888, &src, &fb, &params->clip,
> -				  &fmtcnv_state);
> +	drm_fb_xrgb8888_to_bgrx8888(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
>  	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> -
> -	KUNIT_EXPECT_FALSE(test, blit_result);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  
>  	buf = dst.vaddr;
> @@ -1229,11 +1172,8 @@ static void drm_test_fb_swab(struct kunit *test)
>  	mock_format.format |= DRM_FORMAT_BIG_ENDIAN;
>  	fb.format = &mock_format;
>  
> -	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB8888, &src, &fb, &params->clip,
> -				  &fmtcnv_state);
> +	drm_fb_swab(&dst, dst_pitch, &src, &fb, &params->clip, false, &fmtcnv_state);
>  	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> -
> -	KUNIT_EXPECT_FALSE(test, blit_result);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>  
> @@ -1266,14 +1206,8 @@ static void drm_test_fb_xrgb8888_to_abgr8888(struct kunit *test)
>  	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
>  		NULL : &result->dst_pitch;
>  
> -	int blit_result = 0;
> -
> -	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ABGR8888, &src, &fb, &params->clip,
> -				  &fmtcnv_state);
> -
> +	drm_fb_xrgb8888_to_abgr8888(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
>  	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> -
> -	KUNIT_EXPECT_FALSE(test, blit_result);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>  
> @@ -1306,14 +1240,8 @@ static void drm_test_fb_xrgb8888_to_xbgr8888(struct kunit *test)
>  	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
>  		NULL : &result->dst_pitch;
>  
> -	int blit_result = 0;
> -
> -	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XBGR8888, &src, &fb, &params->clip,
> -				  &fmtcnv_state);
> -
> +	drm_fb_xrgb8888_to_xbgr8888(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
>  	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> -
> -	KUNIT_EXPECT_FALSE(test, blit_result);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>  
> @@ -1910,12 +1838,8 @@ static void drm_test_fb_memcpy(struct kunit *test)
>  		memset(buf[i], 0, dst_size[i]);
>  	}
>  
> -	int blit_result;
> -
> -	blit_result = drm_fb_blit(dst, dst_pitches, params->format, src, &fb, &params->clip,
> -				  &fmtcnv_state);
> +	drm_fb_memcpy(dst, dst_pitches, src, &fb, &params->clip);
>  
> -	KUNIT_EXPECT_FALSE(test, blit_result);
>  	for (size_t i = 0; i < fb.format->num_planes; i++) {
>  		expected[i] = cpubuf_to_le32(test, params->expected[i], TEST_BUF_SIZE);
>  		KUNIT_EXPECT_MEMEQ_MSG(test, buf[i], expected[i], dst_size[i],
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index d8539174ca11..49a2e09155d1 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -102,6 +102,15 @@ void drm_fb_xrgb8888_to_bgr888(struct iosys_map *dst, const unsigned int *dst_pi
>  void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
>  				 const struct iosys_map *src, const struct drm_framebuffer *fb,
>  				 const struct drm_rect *clip, struct drm_format_conv_state *state);
> +void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip, struct drm_format_conv_state *state);
> +void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip, struct drm_format_conv_state *state);
> +void drm_fb_xrgb8888_to_bgrx8888(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip, struct drm_format_conv_state *state);
>  void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
>  				    const struct iosys_map *src, const struct drm_framebuffer *fb,
>  				    const struct drm_rect *clip,
> -- 
> 2.49.0
> 
