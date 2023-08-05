Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5F0770FBB
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 14:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF57810E18F;
	Sat,  5 Aug 2023 12:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A0110E18F
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 12:56:44 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RJ2f415qyz9sjb;
 Sat,  5 Aug 2023 12:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1691240204; bh=4f5b08tQfhlnhRFUCUEey1QocePYxuyKrJyPJsKGEHI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V3jMlk2dTVzhINU8Fz1cCsN5lgUKx99hxlevQW0s1F5ddtJKypmG0vxIX3xLj9DLH
 k0gFu7GlrPo67zRvY3o3GNfFewpUPZupgCPMIw8IFOp75IMKo5RHymufCzmkUtti85
 QTJje9X/y99C7cEA4mxCe044ymjrdbQTGcW07fPQ=
X-Riseup-User-ID: 70A0603BBFA5D7C58E88C3ABFB23F059437217113BABEBA9F223A11926DBBDA7
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RJ2f042HdzFpgy;
 Sat,  5 Aug 2023 12:56:40 +0000 (UTC)
Message-ID: <2ee54603-55f1-1bab-b4d9-5968881d1eeb@riseup.net>
Date: Sat, 5 Aug 2023 09:56:37 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] drm/format-helper: Test default pitch fallback
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230721182316.560649-1-arthurgrillo@riseup.net>
 <20230721182316.560649-2-arthurgrillo@riseup.net>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230721182316.560649-2-arthurgrillo@riseup.net>
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
Cc: tales.aparecida@gmail.com, javierm@redhat.com, tzimmermann@suse.de,
 davidgow@google.com, jose.exposito89@gmail.com, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arthur,

Just nitpicking, but...

On 7/21/23 15:23, Arthur Grillo wrote:
> Test the default pitch fallback when NULL is passed as the dst_pitch on
> the conversion procedures.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>   .../gpu/drm/tests/drm_format_helper_test.c    | 132 ++++++++++++------
>   1 file changed, 87 insertions(+), 45 deletions(-)
> 

[...]

> @@ -530,7 +532,10 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>   	iosys_map_set_vaddr(&src, xrgb8888);
>   
> -	drm_fb_xrgb8888_to_gray8(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
> +		drm_fb_xrgb8888_to_gray8(&dst, NULL, &src, &fb, &params->clip);
> +	else
> +		drm_fb_xrgb8888_to_gray8(&dst, &result->dst_pitch, &src, &fb, &params->clip);

Couldn't we do something like:

unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
	? NULL : &result->dst_pitch;

[...]

drm_fb_xrgb8888_to_gray8(&dst, dst_pitch, &src, &fb, &params->clip);

I believe the code would be cleaner.

Best Regards,
- Maíra

>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
> @@ -560,7 +565,10 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>   	iosys_map_set_vaddr(&src, xrgb8888);
>   
> -	drm_fb_xrgb8888_to_rgb332(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
> +		drm_fb_xrgb8888_to_rgb332(&dst, NULL, &src, &fb, &params->clip);
> +	else
> +		drm_fb_xrgb8888_to_rgb332(&dst, &result->dst_pitch, &src, &fb, &params->clip);
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
> @@ -590,12 +598,19 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>   	iosys_map_set_vaddr(&src, xrgb8888);
>   
> -	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, false);
> +	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
> +		drm_fb_xrgb8888_to_rgb565(&dst, NULL, &src, &fb, &params->clip, false);
> +	else
> +		drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip,
> +					  false);
>   	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   
>   	buf = dst.vaddr; /* restore original value of buf */
> -	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
> +	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
> +		drm_fb_xrgb8888_to_rgb565(&dst, NULL, &src, &fb, &params->clip, true);
> +	else
> +		drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
>   	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected_swab, dst_size);
>   }
> @@ -626,7 +641,10 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>   	iosys_map_set_vaddr(&src, xrgb8888);
>   
> -	drm_fb_xrgb8888_to_xrgb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
> +		drm_fb_xrgb8888_to_xrgb1555(&dst, NULL, &src, &fb, &params->clip);
> +	else
> +		drm_fb_xrgb8888_to_xrgb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
>   	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
> @@ -657,7 +675,10 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>   	iosys_map_set_vaddr(&src, xrgb8888);
>   
> -	drm_fb_xrgb8888_to_argb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
> +		drm_fb_xrgb8888_to_argb1555(&dst, NULL, &src, &fb, &params->clip);
> +	else
> +		drm_fb_xrgb8888_to_argb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
>   	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
> @@ -688,7 +709,10 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>   	iosys_map_set_vaddr(&src, xrgb8888);
>   
> -	drm_fb_xrgb8888_to_rgba5551(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
> +		drm_fb_xrgb8888_to_rgba5551(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	else
> +		drm_fb_xrgb8888_to_rgba5551(&dst, &result->dst_pitch, &src, &fb, &params->clip);
>   	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
> @@ -723,7 +747,11 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>   	 * RGB888 expected results are already in little-endian
>   	 * order, so there's no need to convert the test output.
>   	 */
> -	drm_fb_xrgb8888_to_rgb888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
> +		drm_fb_xrgb8888_to_rgb888(&dst, NULL, &src, &fb, &params->clip);
> +	else
> +		drm_fb_xrgb8888_to_rgb888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
> @@ -753,7 +781,11 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>   	iosys_map_set_vaddr(&src, xrgb8888);
>   
> -	drm_fb_xrgb8888_to_argb8888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
> +		drm_fb_xrgb8888_to_argb8888(&dst, NULL, &src, &fb, &params->clip);
> +	else
> +		drm_fb_xrgb8888_to_argb8888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +
>   	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
> @@ -784,7 +816,10 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>   	iosys_map_set_vaddr(&src, xrgb8888);
>   
> -	drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
> +		drm_fb_xrgb8888_to_xrgb2101010(&dst, NULL, &src, &fb, &params->clip);
> +	else
> +		drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
>   	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
> @@ -815,7 +850,11 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>   	iosys_map_set_vaddr(&src, xrgb8888);
>   
> -	drm_fb_xrgb8888_to_argb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
> +		drm_fb_xrgb8888_to_argb2101010(&dst, NULL, &src, &fb, &params->clip);
> +	else
> +		drm_fb_xrgb8888_to_argb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +
>   	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
> @@ -846,7 +885,10 @@ static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>   	iosys_map_set_vaddr(&src, xrgb8888);
>   
> -	drm_fb_xrgb8888_to_mono(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	if (result->dst_pitch == TEST_USE_DEFAULT_PITCH)
> +		drm_fb_xrgb8888_to_mono(&dst, NULL, &src, &fb, &params->clip);
> +	else
> +		drm_fb_xrgb8888_to_mono(&dst, &result->dst_pitch, &src, &fb, &params->clip);
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
