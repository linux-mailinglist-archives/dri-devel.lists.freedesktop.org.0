Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2C47764D1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 18:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CC210E464;
	Wed,  9 Aug 2023 16:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DB710E464
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 16:16:08 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RLZtH5wLTzDqnl;
 Wed,  9 Aug 2023 16:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1691597768; bh=gfDx1Zb2v34vgGtapqIGMqS0mHNiLoucZGJXU2jZkFQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rWN9dt0zjSE4ktq6Cw+bJ2HHxpG7nYgzSV9jpS1BU9PDjU7CHHkHsKiahDN1bJ6Af
 D/TGpERrsGFi/n6SXzjqNVznDSo9/k+VfOTmi3xPQACMcQcaKVrFwD7bOlIJpgMEbx
 MqGQgmFZ86x8Cz3mhDUkXGHWeUzgx+pnAOjN63jI=
X-Riseup-User-ID: 99ECA7A3C65FE6A7B6AD968A310986289AC71D6C4E8E3DEF3F155C7E5C28C4CB
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RLZtF0HbQzJq8V;
 Wed,  9 Aug 2023 16:16:04 +0000 (UTC)
Message-ID: <2edca0fe-970a-413f-8fc1-de5f475bc3a7@riseup.net>
Date: Wed, 9 Aug 2023 13:16:00 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 5/6] drm/format-helper-test: Add multi-plane support to
 conversion_buf_size()
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>
References: <20230721182316.560649-1-arthurgrillo@riseup.net>
 <20230721182316.560649-6-arthurgrillo@riseup.net>
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@riseup.net>
In-Reply-To: <20230721182316.560649-6-arthurgrillo@riseup.net>
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
Cc: tzimmermann@suse.de, tales.aparecida@gmail.com, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, mairacanal@riseup.net, davidgow@google.com,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Em 21/07/2023 15:23, Arthur Grillo escreveu:
> The drm_fb_memcpy() supports multi-plane formats. To fully test it in
> the future, add multi-plane support to the conversion_buf_size() helper.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---

I think this would be a more concrect improvement if the plane parameter 
was really used. Anyway,

Reviewed-by: André Almeida <andrealmeid@igalia.com>

>   .../gpu/drm/tests/drm_format_helper_test.c    | 28 +++++++++----------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index de4677868647..6ecd92898e8e 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -472,7 +472,7 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>    * The size of the destination buffer or negative value on error.
>    */
>   static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
> -				  const struct drm_rect *clip)
> +				  const struct drm_rect *clip, int plane)
>   {
>   	const struct drm_format_info *dst_fi = drm_format_info(dst_format);
>   
> @@ -480,7 +480,7 @@ static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
>   		return -EINVAL;
>   
>   	if (!dst_pitch)
> -		dst_pitch = drm_format_info_min_pitch(dst_fi, 0, drm_rect_width(clip));
> +		dst_pitch = drm_format_info_min_pitch(dst_fi, plane, drm_rect_width(clip));
>   
>   	return dst_pitch * drm_rect_height(clip);
>   }
> @@ -554,7 +554,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
>   	};
>   
>   	dst_size = conversion_buf_size(DRM_FORMAT_R8, result->dst_pitch,
> -				       &params->clip);
> +				       &params->clip, 0);
>   	KUNIT_ASSERT_GT(test, dst_size, 0);
>   
>   	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> @@ -587,7 +587,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
>   	};
>   
>   	dst_size = conversion_buf_size(DRM_FORMAT_RGB332, result->dst_pitch,
> -				       &params->clip);
> +				       &params->clip, 0);
>   	KUNIT_ASSERT_GT(test, dst_size, 0);
>   
>   	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> @@ -620,7 +620,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>   	};
>   
>   	dst_size = conversion_buf_size(DRM_FORMAT_RGB565, result->dst_pitch,
> -				       &params->clip);
> +				       &params->clip, 0);
>   	KUNIT_ASSERT_GT(test, dst_size, 0);
>   
>   	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> @@ -663,7 +663,7 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
>   	};
>   
>   	dst_size = conversion_buf_size(DRM_FORMAT_XRGB1555, result->dst_pitch,
> -				       &params->clip);
> +				       &params->clip, 0);
>   	KUNIT_ASSERT_GT(test, dst_size, 0);
>   
>   	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> @@ -697,7 +697,7 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
>   	};
>   
>   	dst_size = conversion_buf_size(DRM_FORMAT_ARGB1555, result->dst_pitch,
> -				       &params->clip);
> +				       &params->clip, 0);
>   	KUNIT_ASSERT_GT(test, dst_size, 0);
>   
>   	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> @@ -731,7 +731,7 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
>   	};
>   
>   	dst_size = conversion_buf_size(DRM_FORMAT_RGBA5551, result->dst_pitch,
> -				       &params->clip);
> +				       &params->clip, 0);
>   	KUNIT_ASSERT_GT(test, dst_size, 0);
>   
>   	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> @@ -765,7 +765,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>   	};
>   
>   	dst_size = conversion_buf_size(DRM_FORMAT_RGB888, result->dst_pitch,
> -				       &params->clip);
> +				       &params->clip, 0);
>   	KUNIT_ASSERT_GT(test, dst_size, 0);
>   
>   	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> @@ -803,7 +803,7 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
>   	};
>   
>   	dst_size = conversion_buf_size(DRM_FORMAT_ARGB8888,
> -				       result->dst_pitch, &params->clip);
> +				       result->dst_pitch, &params->clip, 0);
>   	KUNIT_ASSERT_GT(test, dst_size, 0);
>   
>   	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> @@ -838,7 +838,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>   	};
>   
>   	dst_size = conversion_buf_size(DRM_FORMAT_XRGB2101010,
> -				       result->dst_pitch, &params->clip);
> +				       result->dst_pitch, &params->clip, 0);
>   	KUNIT_ASSERT_GT(test, dst_size, 0);
>   
>   	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> @@ -872,7 +872,7 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
>   	};
>   
>   	dst_size = conversion_buf_size(DRM_FORMAT_ARGB2101010,
> -				       result->dst_pitch, &params->clip);
> +				       result->dst_pitch, &params->clip, 0);
>   	KUNIT_ASSERT_GT(test, dst_size, 0);
>   
>   	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> @@ -906,7 +906,7 @@ static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
>   		.pitches = { params->pitch, 0, 0 },
>   	};
>   
> -	dst_size = conversion_buf_size(DRM_FORMAT_C1, result->dst_pitch, &params->clip);
> +	dst_size = conversion_buf_size(DRM_FORMAT_C1, result->dst_pitch, &params->clip, 0);
>   
>   	KUNIT_ASSERT_GT(test, dst_size, 0);
>   
> @@ -939,7 +939,7 @@ static void drm_test_fb_swab(struct kunit *test)
>   		.pitches = { params->pitch, 0, 0 },
>   	};
>   
> -	dst_size = conversion_buf_size(DRM_FORMAT_XRGB8888, result->dst_pitch, &params->clip);
> +	dst_size = conversion_buf_size(DRM_FORMAT_XRGB8888, result->dst_pitch, &params->clip, 0);
>   
>   	KUNIT_ASSERT_GT(test, dst_size, 0);
>   
