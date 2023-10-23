Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 546F37D42B3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 00:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AA210E285;
	Mon, 23 Oct 2023 22:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EF810E285
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 22:34:13 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4SDqjw0KL4z9tJ3;
 Mon, 23 Oct 2023 22:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1698100452; bh=zsOREkCGPMs3qbyM1ZCtmE9Z8L+kJCNshEU0rtK16tE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OA53ii60/oPxIX5YuWbZ37rhw2ashhL0RTBq6ywCfQGDFe1TaicJg8kbfr9y/8SXa
 YlV4HC6pAIw3MWS04a6f7M4lkmLC06+hZWP3symRky1E5v89olMSeF1xvQ1sbzb5VP
 U0nvGIknMZTtot+JCyLold9xLaPc5WmkrRvTSNzA=
X-Riseup-User-ID: 3034D2AC8290BB57A4B8D1F2E8BE2FD9B6D9EE02BAC00938BE698A983DD39CBC
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4SDqjn1tgFzJmj7;
 Mon, 23 Oct 2023 22:34:05 +0000 (UTC)
Message-ID: <981c4876-a054-4af5-b104-d12bf3724a28@riseup.net>
Date: Mon, 23 Oct 2023 19:34:01 -0300
MIME-Version: 1.0
Subject: Re: [RFC PATCH v2 04/17] drm/vkms: Add kunit tests for VKMS LUT
 handling
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-5-harry.wentland@amd.com>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20231019212133.245155-5-harry.wentland@amd.com>
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/10/23 18:21, Harry Wentland wrote:
> Debugging LUT math is much easier when we can unit test
> it. Add kunit functionality to VKMS and add tests for
>  - get_lut_index
>  - lerp_u16
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alexander Goins <agoins@nvidia.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Michel Dänzer <mdaenzer@redhat.com>
> Cc: Aleix Pol <aleixpol@kde.org>
> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> Cc: Victoria Brekenfeld <victoria@system76.com>
> Cc: Sima <daniel@ffwll.ch>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> Cc: Sasha McIntosh <sashamcintosh@google.com>
> ---
>  drivers/gpu/drm/vkms/Kconfig                  |  5 ++
>  drivers/gpu/drm/vkms/Makefile                 |  2 +
>  drivers/gpu/drm/vkms/tests/.kunitconfig       |  4 ++
>  drivers/gpu/drm/vkms/tests/Makefile           |  4 ++
>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 64 +++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_composer.c          |  4 +-
>  drivers/gpu/drm/vkms/vkms_composer.h          | 11 ++++
>  7 files changed, 92 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>  create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
> 
> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> index 1816562381a2..372cc5fa92f1 100644
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
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index 1b28a6a32948..d3440f228f46 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -9,3 +9,5 @@ vkms-y := \
>  	vkms_writeback.o
>  
>  obj-$(CONFIG_DRM_VKMS) += vkms.o
> +
> +obj-y += tests/
> \ No newline at end of file
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
> diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
> new file mode 100644
> index 000000000000..761465332ff2
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += \
> +	vkms_color_tests.o
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
> new file mode 100644
> index 000000000000..843b2e1d607e
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#include <kunit/test.h>
> +
> +#include <drm/drm_fixed.h>
> +
> +#include "../vkms_composer.h"
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
> index 3c99fb8b54e2..a0a3a6fd2926 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -91,7 +91,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
>  }
>  
>  // lerp(a, b, t) = a + (b - a) * t
> -static u16 lerp_u16(u16 a, u16 b, s64 t)
> +u16 lerp_u16(u16 a, u16 b, s64 t)
>  {
>  	s64 a_fp = drm_int2fixp(a);
>  	s64 b_fp = drm_int2fixp(b);
> @@ -101,7 +101,7 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
>  	return drm_fixp2int(a_fp + delta);
>  }
>  
> -static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
> +s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
>  {
>  	s64 color_channel_fp = drm_int2fixp(channel_value);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
> new file mode 100644
> index 000000000000..11c5de9cc961
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_composer.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _VKMS_COMPOSER_H_
> +#define _VKMS_COMPOSER_H_
> +
> +#include "vkms_drv.h"
> +
> +s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
> +u16 lerp_u16(u16 a, u16 b, s64 t);

Not that exposing these functions is inherently wrong, but it might be
better to follow the documentation's suggestion for testing static
functions[0].

[0]: https://www.kernel.org/doc/html/latest/dev-tools/kunit/usage.html#testing-static-functions

Best Regards,
~Arthur Grillo

> +
> +#endif /* _VKMS_COMPOSER_H_ */
> \ No newline at end of file
