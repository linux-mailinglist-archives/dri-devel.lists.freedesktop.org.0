Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D8ADC8BE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 12:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273CE10E48F;
	Tue, 17 Jun 2025 10:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gp0Zz2Mi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D7410E421;
 Tue, 17 Jun 2025 10:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PolAvQsuxk2ZTSGJNk6dxsSDnUlV5mSUcs1RlYjIk6I=; b=gp0Zz2MiAEfhABTS208XT0K92G
 u+m0WO+R77oOAYJhxoFVsv0KC+XCFN0Q4A1LlyJ8qsZoW9XYKHustuKj0IeKpxvbmrD0kjqkQkHdv
 nJ1v10a6gkRKeUKTYB4vfZHRgN5QjcDXX6H4u73Cn0i3hCyqQrIpri+6RCXrQh8yU9fJloH8JkOxM
 CxFqE7xCobuDUpQX1LvK93dJQK85x4dIM7RVPwJXFZJbuprsoznJy5mCyxqtajjkV7JuuETniAxEf
 FqwPeRfXorx9/LozBy1RujVaOxzA6+vcA6PYQjxYUlGG1wo+pvPf58sNMGCRCJIvMH0jRF/7Tdtr0
 e3Qj/0Cw==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uRTxo-004YPv-RQ; Tue, 17 Jun 2025 12:54:49 +0200
Message-ID: <94368e63-ea55-4d1c-b4a1-6d4560e1bb2e@igalia.com>
Date: Tue, 17 Jun 2025 07:54:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 02/46] drm/vkms: Add kunit tests for VKMS LUT handling
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, arthurgrillo@riseup.net,
 Daniel Stone <daniels@collabora.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-3-alex.hung@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250617041746.2884343-3-alex.hung@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On 17/06/25 01:16, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> Debugging LUT math is much easier when we can unit test
> it. Add kunit functionality to VKMS and add tests for
>   - get_lut_index
>   - lerp_u16
> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> v8:
>   - Update config names (Louis Chauvet)
> 
> v7:
>   - Fix checkpatch warnings and errors (Louis Chauvet)
>    - Change SPDX-License-Identifier: GPL-2.0+ from /* */ to //
>    - Fix checkpatch errors and warnings (new line at EOF, redundant spaces, and long lines)
>    - Add static to const struct vkms_color_lut test_linear_lut
>   - Add "MODULE_DESCRIPTION" (Jeff Johnson)
> 
> 
> v6:
>   - Eliminate need to include test as .c file (Louis Chauvet)
> 
> v5:
>   - Bring back static for lerp_u16 and get_lut_index (Arthur)
> 
> v4:
>   - Test the critical points of the lerp function (Pekka)
> 
> v3:
>   - Use include way of testing static functions (Arthur)
> 
>   drivers/gpu/drm/vkms/tests/Makefile          |   2 +-
>   drivers/gpu/drm/vkms/tests/vkms_color_test.c | 172 +++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_composer.c         |   8 +-
>   drivers/gpu/drm/vkms/vkms_composer.h         |  13 ++
>   4 files changed, 192 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
>   create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
> 
> diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
> index 9ded37b67a46..e92f7143e540 100644
> --- a/drivers/gpu/drm/vkms/tests/Makefile
> +++ b/drivers/gpu/drm/vkms/tests/Makefile
> @@ -1,3 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms_config_test.o
> +obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms_config_test.o vkms_color_test.o

I believe you might need to rebase this patch on top of drm-misc-next
due to 60ba94338047 ("drm/vkms: Compile all tests with
CONFIG_DRM_VKMS_KUNIT_TEST").

> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> new file mode 100644
> index 000000000000..affca56cac7b
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c

[...]

> +
> +static void vkms_color_test_lerp(struct kunit *test)
> +{
> +	/*** half-way round down ***/
> +	s64 t = 0x80000000 - 1;
> +
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x8);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
> +
> +	/*** half-way round up ***/
> +	t = 0x80000000;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x9);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
> +
> +	/*** t = 0.0 ***/
> +	t = 0x0;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
> +
> +	/*** t = 1.0 ***/
> +	t = 0x100000000;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
> +
> +	/*** t = 0.0 + 1 ***/
> +	t = 0x0 + 1;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
> +
> +	/*** t = 1.0 - 1 ***/
> +	t = 0x100000000 - 1;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
> +
> +	/*** t chosen to verify the flipping point of result a (or b) to a+1 (or b-1) ***/
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000 - 1), 0x0);
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000), 0x1);
> +}

This test case seems to be a perfect use-case for parametized tests [1].

[1] https://docs.kernel.org/dev-tools/kunit/usage.html#parameterized-testing

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
> +
> +kunit_test_suite(vkms_color_test_suite);
> +
> +MODULE_DESCRIPTION("Kunit test for VKMS LUT handling");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index fa269d279e25..b0dc95f971d8 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -12,6 +12,8 @@
>   #include <linux/minmax.h>
>   
>   #include "vkms_drv.h"
> +#include <kunit/visibility.h>
> +#include "vkms_composer.h"

Nit: IIRC, it's common to sort the includes entries.

Best Regards,
- Maíra

