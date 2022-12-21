Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F9A653717
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 20:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E411F10E48D;
	Wed, 21 Dec 2022 19:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D9510E48D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 19:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+e9+DQn7b0AlN26UQxtVfEeWas5SX0AQvwYIb/LfqJU=; b=QPE+xo+NL5N5sR+wIB8kkDzVwD
 Ptv48ULoP7ujdss8qFK+ipH+TzvkVQbFvOR6FSj2b/Nlotzn/Bib79Jf6GMdkOCMI1WeLtbqoz0kY
 +IJMX0KZ9Fch40gzTCtJw4prVzB/GKLp6YJ+MlmjGajKXbizSTA2Ln9R/UOKpWK4qQy4QW6dyDppb
 Eg4XfQ13r00R0NZv3M2WUV4gX7Iix45kQefHJ78lLYzd7soaEPeoyszYJK4m9we1LZeuSFy0CVckV
 vEzh+p1+9D19/fyAtdAVd90XSojXyYHFjlGRMDBNzfAccWvhQ8Gq94RXwZV+bEzgHAPmr+79C/0uc
 WqcSWBNQ==;
Received: from [168.205.245.125] (helo=[10.5.56.124])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1p84xD-007fB8-3R; Wed, 21 Dec 2022 20:40:39 +0100
Message-ID: <dcd3bfa6-15bc-81ee-8848-25aed2527dd6@igalia.com>
Date: Wed, 21 Dec 2022 16:40:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 03/13] drm/format-helper: Fix test-input format
 conversion
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, jose.exposito89@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20221220161145.27568-1-tzimmermann@suse.de>
 <20221220161145.27568-4-tzimmermann@suse.de>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221220161145.27568-4-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/20/22 13:11, Thomas Zimmermann wrote:
> Convert test input for format helpers from host byte order to
> little-endian order. The current code does it the other way around,
> but there's no effective difference to the result.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
>  .../gpu/drm/tests/drm_format_helper_test.c    | 35 +++++++++++++------
>  1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index cd1d7da3483c..e7c49e6d3f6d 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -279,6 +279,21 @@ static u32 *le32buf_to_cpu(struct kunit *test, const u32 *buf, size_t buf_size)
>  	return dst;
>  }
>  
> +static __le32 *cpubuf_to_le32(struct kunit *test, const u32 *buf, size_t buf_size)
> +{
> +	__le32 *dst = NULL;
> +	int n;
> +
> +	dst = kunit_kzalloc(test, sizeof(*dst) * buf_size, GFP_KERNEL);
> +	if (!dst)
> +		return NULL;
> +
> +	for (n = 0; n < buf_size; n++)
> +		dst[n] = cpu_to_le32(buf[n]);
> +
> +	return dst;
> +}
> +
>  static void convert_xrgb8888_case_desc(struct convert_xrgb8888_case *t,
>  				       char *desc)
>  {
> @@ -294,7 +309,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
>  	const struct convert_to_gray8_result *result = &params->gray8_result;
>  	size_t dst_size;
>  	__u8 *buf = NULL;
> -	__u32 *xrgb8888 = NULL;
> +	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
>  	struct drm_framebuffer fb = {
> @@ -310,7 +325,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
>  	iosys_map_set_vaddr(&dst, buf);
>  
> -	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
> @@ -324,7 +339,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
>  	const struct convert_to_rgb332_result *result = &params->rgb332_result;
>  	size_t dst_size;
>  	__u8 *buf = NULL;
> -	__u32 *xrgb8888 = NULL;
> +	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
>  	struct drm_framebuffer fb = {
> @@ -340,7 +355,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
>  	iosys_map_set_vaddr(&dst, buf);
>  
> -	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
> @@ -354,7 +369,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>  	const struct convert_to_rgb565_result *result = &params->rgb565_result;
>  	size_t dst_size;
>  	__u16 *buf = NULL;
> -	__u32 *xrgb8888 = NULL;
> +	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
>  	struct drm_framebuffer fb = {
> @@ -370,7 +385,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
>  	iosys_map_set_vaddr(&dst, buf);
>  
> -	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
> @@ -387,7 +402,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>  	const struct convert_to_rgb888_result *result = &params->rgb888_result;
>  	size_t dst_size;
>  	__u8 *buf = NULL;
> -	__u32 *xrgb8888 = NULL;
> +	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
>  	struct drm_framebuffer fb = {
> @@ -403,7 +418,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
>  	iosys_map_set_vaddr(&dst, buf);
>  
> -	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
> @@ -421,7 +436,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  	const struct convert_to_xrgb2101010_result *result = &params->xrgb2101010_result;
>  	size_t dst_size;
>  	__u32 *buf = NULL;
> -	__u32 *xrgb8888 = NULL;
> +	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
>  	struct drm_framebuffer fb = {
> @@ -437,7 +452,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
>  	iosys_map_set_vaddr(&dst, buf);
>  
> -	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
> +	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
