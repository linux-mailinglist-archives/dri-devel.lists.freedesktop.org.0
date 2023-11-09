Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0497E7422
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 23:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C1210E936;
	Thu,  9 Nov 2023 22:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FDA10E957
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 22:05:35 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4SRGH25CSlz9s2N;
 Thu,  9 Nov 2023 22:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1699567534; bh=DW7av46NbTW0AZk8R7SXsLH5BylyZhUHMs4sOsuDWdw=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=fItFR3biDDEIEDB4u9Zp7y25NUnyzB8QooAAtU0L7XUGPt3s1Uwr9PL7cOOY3ellH
 0WcFvoB0Kc8OBah4QdyQsXF9JJNHqxI+a2LW41YB18bUg7u8mUFvYMrwMWHyA8tZJx
 mRK4lTeEWQJvvCNVFLRtZejcfBD4JTwxAuKRGTFo=
X-Riseup-User-ID: 538A88598EE949710BEB43BD1BC28D82081D534E940E12C2B8828A88BC3174B3
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4SRGH14ZQKzFsxN;
 Thu,  9 Nov 2023 22:05:33 +0000 (UTC)
Message-ID: <4df0cb7c-e738-4927-89ed-51a0e8bcac77@riseup.net>
Date: Thu, 9 Nov 2023 19:05:30 -0300
MIME-Version: 1.0
From: Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [RFC PATCH v3 04/23] drm/vkms: Add kunit tests for VKMS LUT
 handling
To: Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-5-harry.wentland@amd.com>
Content-Language: en-US
In-Reply-To: <20231108163647.106853-5-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/11/23 13:36, Harry Wentland wrote:
> Debugging LUT math is much easier when we can unit test
> it. Add kunit functionality to VKMS and add tests for
>  - get_lut_index
>  - lerp_u16
> 
> v3:
>  - Use include way of testing static functions (Arthur)
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/vkms/Kconfig                  |  5 ++
>  drivers/gpu/drm/vkms/tests/.kunitconfig       |  4 ++
>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 62 +++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_composer.c          |  8 ++-
>  4 files changed, 77 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
> 
> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> index b9ecdebecb0b..c1f8b343ff0e 100644
> --- a/drivers/gpu/drm/vkms/Kconfig
> +++ b/drivers/gpu/drm/vkms/Kconfig
> @@ -13,3 +13,8 @@ config DRM_VKMS
>  	  a VKMS.
>  
>  	  If M is selected the module will be called vkms.
> +
> +config DRM_VKMS_KUNIT_TESTS
> +	tristate "Tests for VKMS" if !KUNIT_ALL_TESTS
> +	depends on DRM_VKMS && KUNIT
> +	default KUNIT_ALL_TESTS
> diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
> new file mode 100644
> index 000000000000..70e378228cbd
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
> @@ -0,0 +1,4 @@
> +CONFIG_KUNIT=y
> +CONFIG_DRM=y
> +CONFIG_DRM_VKMS=y
> +CONFIG_DRM_VKMS_KUNIT_TESTS=y
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
> new file mode 100644
> index 000000000000..b995114cf6b8
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#include <kunit/test.h>
> +
> +#include <drm/drm_fixed.h>
> +
> +#define TEST_LUT_SIZE 16
> +
> +static struct drm_color_lut test_linear_array[TEST_LUT_SIZE] = {
> +	{ 0x0, 0x0, 0x0, 0 },
> +	{ 0x1111, 0x1111, 0x1111, 0 },
> +	{ 0x2222, 0x2222, 0x2222, 0 },
> +	{ 0x3333, 0x3333, 0x3333, 0 },
> +	{ 0x4444, 0x4444, 0x4444, 0 },
> +	{ 0x5555, 0x5555, 0x5555, 0 },
> +	{ 0x6666, 0x6666, 0x6666, 0 },
> +	{ 0x7777, 0x7777, 0x7777, 0 },
> +	{ 0x8888, 0x8888, 0x8888, 0 },
> +	{ 0x9999, 0x9999, 0x9999, 0 },
> +	{ 0xaaaa, 0xaaaa, 0xaaaa, 0 },
> +	{ 0xbbbb, 0xbbbb, 0xbbbb, 0 },
> +	{ 0xcccc, 0xcccc, 0xcccc, 0 },
> +	{ 0xdddd, 0xdddd, 0xdddd, 0 },
> +	{ 0xeeee, 0xeeee, 0xeeee, 0 },
> +	{ 0xffff, 0xffff, 0xffff, 0 },
> +};
> +
> +const struct vkms_color_lut test_linear_lut = {
> +	.base = test_linear_array,
> +	.lut_length = TEST_LUT_SIZE,
> +	.channel_value2index_ratio = 0xf000fll
> +};
> +
> +
> +static void vkms_color_test_get_lut_index(struct kunit *test)
> +{
> +	int i;
> +
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&test_linear_lut, test_linear_array[0].red)), 0);
> +
> +	for (i = 0; i < TEST_LUT_SIZE; i++)
> +		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&test_linear_lut, test_linear_array[i].red)), i);
> +}
> +
> +static void vkms_color_test_lerp(struct kunit *test)
> +{
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, 0x80000000), 0x8);
> +}
> +
> +static struct kunit_case vkms_color_test_cases[] = {
> +	KUNIT_CASE(vkms_color_test_get_lut_index),
> +	KUNIT_CASE(vkms_color_test_lerp),
> +	{}
> +};
> +
> +static struct kunit_suite vkms_color_test_suite = {
> +	.name = "vkms-color",
> +	.test_cases = vkms_color_test_cases,
> +};
> +kunit_test_suite(vkms_color_test_suite);
> +
> +MODULE_LICENSE("GPL");
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 3c99fb8b54e2..6f942896036e 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -91,7 +91,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
>  }
>  
>  // lerp(a, b, t) = a + (b - a) * t
> -static u16 lerp_u16(u16 a, u16 b, s64 t)
> +u16 lerp_u16(u16 a, u16 b, s64 t)

Now you don't need to remove the static keyword.

>  {
>  	s64 a_fp = drm_int2fixp(a);
>  	s64 b_fp = drm_int2fixp(b);
> @@ -101,7 +101,7 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
>  	return drm_fixp2int(a_fp + delta);
>  }
>  
> -static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
> +s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)

DITTO

Best Regards,
~Arthur Grillo

>  {
>  	s64 color_channel_fp = drm_int2fixp(channel_value);
>  
> @@ -429,3 +429,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>  
>  	return ret;
>  }
> +
> +#ifdef CONFIG_DRM_VKMS_KUNIT_TESTS
> +#include "tests/vkms_color_tests.c"
> +#endif
