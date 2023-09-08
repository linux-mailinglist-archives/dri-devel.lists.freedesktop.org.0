Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA7A799146
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 22:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B0610E959;
	Fri,  8 Sep 2023 20:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6763E10E959
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 20:51:42 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Rj7ZP7558zDqYc;
 Fri,  8 Sep 2023 20:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1694206302; bh=bWnx89DJjiNCd6Z5BFbKE0awgchdEkO0r8XjPV0txnI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tMqtNqOndMmukoXEKy7q8xofK7yJcCPiq+4Fes54VD3vT+mTiDJ2FRy1yPGp0RM1Z
 Bp41W2hRihf/zusiYn2HpjLcQhVBmM20jCWqdzo/Fuh2MntdAADKECVS/adzUfe0w+
 M/SLLdG/i36/drE9gM9fnqUMIs3MFXchgXD/Th4k=
X-Riseup-User-ID: A91C0439F754B18DA76ED2BC94EEFDFF12EEFB2259688CEEBE45EA9E51C07FFE
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Rj7ZL50BjzJnCB;
 Fri,  8 Sep 2023 20:51:38 +0000 (UTC)
Message-ID: <dcaeb89f-30db-1590-249f-797334fcbc36@riseup.net>
Date: Fri, 8 Sep 2023 17:51:40 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] drm/tests: Add calls to drm_fb_blit() on supported
 format conversion tests
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
References: <20230905-final-gsoc-v2-0-b52e8cb068ea@riseup.net>
 <20230905-final-gsoc-v2-1-b52e8cb068ea@riseup.net>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230905-final-gsoc-v2-1-b52e8cb068ea@riseup.net>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arthur,

On 9/5/23 18:27, Arthur Grillo wrote:
> Add a call to drm_fb_blit() on existing format conversion tests that
> has support.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/tests/drm_format_helper_test.c | 142 +++++++++++++++++++++++++
>   1 file changed, 142 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 79bc9d4bbd71..b888f7334510 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -643,6 +643,18 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>   	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
>   	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected_swab, dst_size);
> +
> +	buf = dst.vaddr;
> +	memset(buf, 0, TEST_BUF_SIZE);
> +
> +	int blit_result = 0;
> +
> +	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGB565, &src, &fb, &params->clip);
> +
> +	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
>   static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
> @@ -677,6 +689,18 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
>   	drm_fb_xrgb8888_to_xrgb1555(&dst, dst_pitch, &src, &fb, &params->clip);
>   	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +
> +	buf = dst.vaddr; /* restore original value of buf */
> +	memset(buf, 0, TEST_BUF_SIZE);
> +
> +	int blit_result = 0;
> +
> +	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB1555, &src, &fb, &params->clip);
> +
> +	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
>   static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
> @@ -711,6 +735,18 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
>   	drm_fb_xrgb8888_to_argb1555(&dst, dst_pitch, &src, &fb, &params->clip);
>   	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +
> +	buf = dst.vaddr; /* restore original value of buf */
> +	memset(buf, 0, TEST_BUF_SIZE);
> +
> +	int blit_result = 0;
> +
> +	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB1555, &src, &fb, &params->clip);
> +
> +	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
>   static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
> @@ -745,6 +781,18 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
>   	drm_fb_xrgb8888_to_rgba5551(&dst, dst_pitch, &src, &fb, &params->clip);
>   	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +
> +	buf = dst.vaddr; /* restore original value of buf */
> +	memset(buf, 0, TEST_BUF_SIZE);
> +
> +	int blit_result = 0;
> +
> +	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGBA5551, &src, &fb, &params->clip);
> +
> +	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
>   static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
> @@ -782,6 +830,16 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>   
>   	drm_fb_xrgb8888_to_rgb888(&dst, dst_pitch, &src, &fb, &params->clip);
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +
> +	buf = dst.vaddr; /* restore original value of buf */
> +	memset(buf, 0, TEST_BUF_SIZE);
> +
> +	int blit_result = 0;
> +
> +	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGB888, &src, &fb, &params->clip);
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
>   static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
> @@ -816,6 +874,18 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
>   	drm_fb_xrgb8888_to_argb8888(&dst, dst_pitch, &src, &fb, &params->clip);
>   	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +
> +	buf = dst.vaddr; /* restore original value of buf */
> +	memset(buf, 0, TEST_BUF_SIZE);
> +
> +	int blit_result = 0;
> +
> +	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB8888, &src, &fb, &params->clip);
> +
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
>   static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
> @@ -850,6 +920,17 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>   	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip);
>   	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +
> +	buf = dst.vaddr; /* restore original value of buf */
> +	memset(buf, 0, TEST_BUF_SIZE);
> +
> +	int blit_result = 0;
> +
> +	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB2101010, &src, &fb,
> +				  &params->clip);
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
>   static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
> @@ -884,6 +965,19 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
>   	drm_fb_xrgb8888_to_argb2101010(&dst, dst_pitch, &src, &fb, &params->clip);
>   	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +
> +	buf = dst.vaddr; /* restore original value of buf */
> +	memset(buf, 0, TEST_BUF_SIZE);
> +
> +	int blit_result = 0;
> +
> +	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB2101010, &src, &fb,
> +				  &params->clip);
> +
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
>   static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
> @@ -951,6 +1045,41 @@ static void drm_test_fb_swab(struct kunit *test)
>   	drm_fb_swab(&dst, dst_pitch, &src, &fb, &params->clip, false);
>   	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +
> +	buf = dst.vaddr; /* restore original value of buf */
> +	memset(buf, 0, TEST_BUF_SIZE);
> +
> +	int blit_result;
> +
> +	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB8888 | DRM_FORMAT_BIG_ENDIAN,
> +				  &src, &fb, &params->clip);
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +
> +	buf = dst.vaddr;
> +	memset(buf, 0, TEST_BUF_SIZE);
> +
> +	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_BGRX8888, &src, &fb, &params->clip);
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +
> +	buf = dst.vaddr;
> +	memset(buf, 0, TEST_BUF_SIZE);
> +
> +	struct drm_format_info mock_format = *fb.format;
> +
> +	mock_format.format |= DRM_FORMAT_BIG_ENDIAN;
> +	fb.format = &mock_format;
> +
> +	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB8888, &src, &fb, &params->clip);
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
>   struct clip_offset_case {
> @@ -1543,6 +1672,19 @@ static void drm_test_fb_memcpy(struct kunit *test)
>   		KUNIT_EXPECT_MEMEQ_MSG(test, buf[i], expected[i], dst_size[i],
>   				       "Failed expectation on plane %zu", i);
>   	}
> +
> +	memset(*buf, 0, TEST_BUF_SIZE * DRM_FORMAT_MAX_PLANES);
> +
> +	int blit_result;
> +
> +	blit_result = drm_fb_blit(dst, dst_pitches, params->format, src, &fb, &params->clip);
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	for (size_t i = 0; i < fb.format->num_planes; i++) {
> +		expected[i] = cpubuf_to_le32(test, params->expected[i], TEST_BUF_SIZE);
> +		KUNIT_EXPECT_MEMEQ_MSG(test, buf[i], expected[i], dst_size[i],
> +				       "Failed expectation on plane %zu", i);
> +	}
>   }
>   
>   static struct kunit_case drm_format_helper_test_cases[] = {
> 
