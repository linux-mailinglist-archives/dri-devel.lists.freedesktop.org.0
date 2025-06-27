Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5068AEB003
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076C710E31E;
	Fri, 27 Jun 2025 07:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f8D9HXTN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6CC10E31E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 07:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751008874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7T8pVkHRKwCktH0i+Lgt2LdnpL3Clnbv6O9t8mIHq44=;
 b=f8D9HXTNWU7W/oxjhbFzfot0KOF8n+uyYcQhtDG55Ay7GLk9FpzZsziDxExI0SAD3lCPbS
 OlvtEWbcF38D5RXis6MBMplU1x2VaBEPLOTo2YzObxXdETV4dgkw6IRkD+y6HnCxpVWgNv
 VeoOlqLkcZC61CqHbz2KkMnH/a1+poI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-nVM6ESxHOl21qMQKCfz1NQ-1; Fri, 27 Jun 2025 03:21:12 -0400
X-MC-Unique: nVM6ESxHOl21qMQKCfz1NQ-1
X-Mimecast-MFC-AGG-ID: nVM6ESxHOl21qMQKCfz1NQ_1751008871
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4eeed54c2so1170435f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 00:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751008871; x=1751613671;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7T8pVkHRKwCktH0i+Lgt2LdnpL3Clnbv6O9t8mIHq44=;
 b=ti5XoAsdy5G+0kD6zFi6/PAaRgBcJWImEwdWN85XB0paZIHJJgSBSETxQhLh1gonzg
 xZZ5PrPdJq+ok3i+q5DYmwOrSO4jHXlIiGYSnDYFwuFdEtjYDw586oxq09ZamVphTNJl
 kxftq86iZ0hPZArqZIZJfqFj5BZ/t3MpNdezL4ruqp4vwSBJrdpE1fhXYwRT6ZmSO67n
 F87PQWjVpZbLKWLqwD89+Y1WPN/CYqc9s8o13Vq+7qteBTI48UgZzyA3rSn70XzH3q52
 xBorNVPquwdqoEnVIqHz+74ek950ozByOkyFV/8Ai7qq0lToEqnxA9fbjpJ/C09pjEDb
 l9qQ==
X-Gm-Message-State: AOJu0YwOUxV/rex/P1Meeb5vYg/I2don3yR+6ba947V2RGlpALN3E22r
 s9NrjU9YssxYsjcdqx3AYAkIS9v5RDYsR8Qelt26i/3+ExvnuVk4Ac3YWRtDFGBFnI7VLT4WXWJ
 YPXUoIyiCfdupBu899QhWG3YS/cZBqBBeWGXJUQKKXUaB4rY/LRlxkYx1psH2q3VIhBAtng==
X-Gm-Gg: ASbGncu/1Ua2SLxsfXEiBk2bmS+Y4IJeieRzhsD/IqGc9pH2VUh+lHj9I6qpO4aCDLt
 0NXxgXHTp0/ePtR92czW66MhCv2eROPajPHg98cMsbmmEQf1C5cxWOZj1vfcW70o96gcTktM94z
 JEsswT4CgPwGSNMh5A0t2aFyypvbfvxFWaOW4lYtyUYkbqm01W/M/M/o031oQBYcmw9vuppomhp
 xdQx4bmc9fmd3/CluXaVdTzBzttdtpvaCSVpMsSzgDdYVADWGHdc6ri6nFSwpJ2BCT3R5X2Wajp
 /4HUSC7e5li9skluhD1gUGJzw2aRqfYr0E2hIiHhSKM4uCs2dBOH3nGQbi0LEg==
X-Received: by 2002:adf:9d87:0:b0:3a5:2ec5:35a9 with SMTP id
 ffacd0b85a97d-3a8f4549249mr1534712f8f.3.1751008871013; 
 Fri, 27 Jun 2025 00:21:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYTAwPMBLLuY5B1e/xgrRGMxZyO1QqSsYOB9Z0ojZ5gBsL3NMYJpjKncjtolscOMeITeHqtg==
X-Received: by 2002:adf:9d87:0:b0:3a5:2ec5:35a9 with SMTP id
 ffacd0b85a97d-3a8f4549249mr1534679f8f.3.1751008870491; 
 Fri, 27 Jun 2025 00:21:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e62144sm1907930f8f.92.2025.06.27.00.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 00:21:10 -0700 (PDT)
Message-ID: <86712b85-44ad-4b2e-a10f-ffad5677d82f@redhat.com>
Date: Fri, 27 Jun 2025 09:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/format-helper: Split off byte swapping from
 drm_fb_xrgb8888_to_rgb565()
To: Thomas Zimmermann <tzimmermann@suse.de>, jose.exposito89@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20250625114911.1121301-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250625114911.1121301-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j4Z5JFxKjv_S04L8Ebo3eT_w_YYYaTlTI_1g0R_Hw7A_1751008871
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 25/06/2025 13:48, Thomas Zimmermann wrote:
> Move big-endian support from drm_fb_xrgb8888_to_rgb565() into the new
> helper drm_xrgb8888_to_rgb565be(). The functionality is required for
> displays with big-endian byte order. Update all callers.
> 
> With the change applied, drm_fb_xrgb8888_to_rgb565() has the same
> signature as the other conversion functions, which is required for
> further updates to drm_fb_blit(). Also makes the format-conversion
> helper available to panic handlers, if necessary.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_format_helper.c           | 66 ++++++++++++-------
>   drivers/gpu/drm/drm_format_internal.h         |  6 ++
>   drivers/gpu/drm/drm_mipi_dbi.c                |  8 ++-
>   drivers/gpu/drm/gud/gud_pipe.c                |  9 ++-
>   .../gpu/drm/tests/drm_format_helper_test.c    |  8 +--
>   include/drm/drm_format_helper.h               |  6 +-
>   6 files changed, 71 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 99d9f7bbc261..8f3daf38ca63 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -559,18 +559,6 @@ static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigne
>   	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_rgb565);
>   }
>   
> -static __always_inline u32 drm_xrgb8888_to_rgb565_swab(u32 pix)
> -{
> -	return swab16(drm_pixel_xrgb8888_to_rgb565(pix));
> -}
> -
> -/* TODO: implement this helper as conversion to RGB565|BIG_ENDIAN */
> -static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
> -						unsigned int pixels)
> -{
> -	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_xrgb8888_to_rgb565_swab);
> -}
> -
>   /**
>    * drm_fb_xrgb8888_to_rgb565 - Convert XRGB8888 to RGB565 clip buffer
>    * @dst: Array of RGB565 destination buffers
> @@ -580,7 +568,6 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
>    * @fb: DRM framebuffer
>    * @clip: Clip rectangle area to copy
>    * @state: Transform and conversion state
> - * @swab: Swap bytes
>    *
>    * This function copies parts of a framebuffer to display memory and converts the
>    * color format during the process. Destination and framebuffer formats must match. The
> @@ -595,23 +582,56 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
>    */
>   void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
>   			       const struct iosys_map *src, const struct drm_framebuffer *fb,
> -			       const struct drm_rect *clip, struct drm_format_conv_state *state,
> -			       bool swab)
> +			       const struct drm_rect *clip, struct drm_format_conv_state *state)
>   {
>   	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
>   		2,
>   	};
>   
> -	void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
> +		    drm_fb_xrgb8888_to_rgb565_line);
> +}
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
> +
> +static void drm_fb_xrgb8888_to_rgb565be_line(void *dbuf, const void *sbuf,
> +					     unsigned int pixels)
> +{
> +	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_rgb565be);
> +}
>   
> -	if (swab)
> -		xfrm_line = drm_fb_xrgb8888_to_rgb565_swab_line;
> -	else
> -		xfrm_line = drm_fb_xrgb8888_to_rgb565_line;
> +/**
> + * drm_fb_xrgb8888_to_rgb565be - Convert XRGB8888 to RGB565|DRM_FORMAT_BIG_ENDIAN clip buffer
> + * @dst: Array of RGB565BE destination buffers
> + * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
> + *             within @dst; can be NULL if scanlines are stored next to each other.
> + * @src: Array of XRGB8888 source buffer
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + * @state: Transform and conversion state
> + *
> + * This function copies parts of a framebuffer to display memory and converts the
> + * color format during the process. Destination and framebuffer formats must match. The
> + * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
> + * least as many entries as there are planes in @fb's format. Each entry stores the
> + * value for the format's respective color plane at the same index.
> + *
> + * This function does not apply clipping on @dst (i.e. the destination is at the
> + * top-left corner).
> + *
> + * Drivers can use this function for RGB565BE devices that don't support XRGB8888 natively.
> + */
> +void drm_fb_xrgb8888_to_rgb565be(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip, struct drm_format_conv_state *state)
> +{
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		2,
> +	};
>   
> -	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state, xfrm_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
> +		    drm_fb_xrgb8888_to_rgb565be_line);
>   }
> -EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565be);
>   
>   static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
>   {
> @@ -1188,7 +1208,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>   		return 0;
>   	} else if (fb_format == DRM_FORMAT_XRGB8888) {
>   		if (dst_format == DRM_FORMAT_RGB565) {
> -			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, state, false);
> +			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, state);
>   			return 0;
>   		} else if (dst_format == DRM_FORMAT_XRGB1555) {
>   			drm_fb_xrgb8888_to_xrgb1555(dst, dst_pitch, src, fb, clip, state);
> diff --git a/drivers/gpu/drm/drm_format_internal.h b/drivers/gpu/drm/drm_format_internal.h
> index 9428d5cfebc5..ce29dd05bcc5 100644
> --- a/drivers/gpu/drm/drm_format_internal.h
> +++ b/drivers/gpu/drm/drm_format_internal.h
> @@ -5,6 +5,7 @@
>   
>   #include <linux/bits.h>
>   #include <linux/types.h>
> +#include <linux/swab.h>
>   
>   /*
>    * Each pixel-format conversion helper takes a raw pixel in a
> @@ -59,6 +60,11 @@ static inline u32 drm_pixel_xrgb8888_to_rgb565(u32 pix)
>   	       ((pix & 0x000000f8) >> 3);
>   }
>   
> +static inline u32 drm_pixel_xrgb8888_to_rgb565be(u32 pix)
> +{
> +	return swab16(drm_pixel_xrgb8888_to_rgb565(pix));
> +}
> +
>   static inline u32 drm_pixel_xrgb8888_to_rgbx5551(u32 pix)
>   {
>   	return ((pix & 0x00f80000) >> 8) |
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index ba4be6be5d28..e33c78fc8fbd 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -230,7 +230,13 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
>   	case DRM_FORMAT_XRGB8888:
>   		switch (dbidev->pixel_format) {
>   		case DRM_FORMAT_RGB565:
> -			drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, src, fb, clip, fmtcnv_state, swap);
> +			if (swap) {
> +				drm_fb_xrgb8888_to_rgb565be(&dst_map, NULL, src, fb, clip,
> +							    fmtcnv_state);
> +			} else {
> +				drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, src, fb, clip,
> +							  fmtcnv_state);
> +			}
>   			break;
>   		case DRM_FORMAT_RGB888:
>   			drm_fb_xrgb8888_to_rgb888(&dst_map, NULL, src, fb, clip, fmtcnv_state);
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index adadd526641d..8d548d08f127 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -188,8 +188,13 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
>   		} else if (format->format == DRM_FORMAT_RGB332) {
>   			drm_fb_xrgb8888_to_rgb332(&dst, NULL, src, fb, rect, fmtcnv_state);
>   		} else if (format->format == DRM_FORMAT_RGB565) {
> -			drm_fb_xrgb8888_to_rgb565(&dst, NULL, src, fb, rect, fmtcnv_state,
> -						  gud_is_big_endian());
> +			if (gud_is_big_endian()) {
> +				drm_fb_xrgb8888_to_rgb565be(&dst, NULL, src, fb, rect,
> +							    fmtcnv_state);
> +			} else {
> +				drm_fb_xrgb8888_to_rgb565(&dst, NULL, src, fb, rect,
> +							  fmtcnv_state);
> +			}
>   		} else if (format->format == DRM_FORMAT_RGB888) {
>   			drm_fb_xrgb8888_to_rgb888(&dst, NULL, src, fb, rect, fmtcnv_state);
>   		} else {
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index ad06762db671..7299fa8971ce 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -735,13 +735,13 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>   		NULL : &result->dst_pitch;
>   
>   	drm_fb_xrgb8888_to_rgb565(&dst, dst_pitch, &src, &fb, &params->clip,
> -				  &fmtcnv_state, false);
> +				  &fmtcnv_state);
>   	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   
>   	buf = dst.vaddr; /* restore original value of buf */
> -	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip,
> -				  &fmtcnv_state, true);
> +	drm_fb_xrgb8888_to_rgb565be(&dst, &result->dst_pitch, &src, &fb, &params->clip,
> +				    &fmtcnv_state);
>   	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected_swab, dst_size);
>   
> @@ -749,7 +749,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>   	memset(buf, 0, dst_size);
>   
>   	drm_fb_xrgb8888_to_rgb565(&dst, dst_pitch, &src, &fb, &params->clip,
> -				  &fmtcnv_state, false);
> +				  &fmtcnv_state);
>   	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 0d3ee2a1313f..562bc383ece4 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -82,8 +82,10 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pi
>   			       const struct drm_rect *clip, struct drm_format_conv_state *state);
>   void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
>   			       const struct iosys_map *src, const struct drm_framebuffer *fb,
> -			       const struct drm_rect *clip, struct drm_format_conv_state *state,
> -			       bool swab);
> +			       const struct drm_rect *clip, struct drm_format_conv_state *state);
> +void drm_fb_xrgb8888_to_rgb565be(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip, struct drm_format_conv_state *state);
>   void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
>   				 const struct iosys_map *src, const struct drm_framebuffer *fb,
>   				 const struct drm_rect *clip, struct drm_format_conv_state *state);

