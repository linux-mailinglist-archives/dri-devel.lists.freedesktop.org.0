Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7D36F6ADF
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 14:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E4010E296;
	Thu,  4 May 2023 12:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2A110E296;
 Thu,  4 May 2023 12:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tPow+oGVqtat0jltpQX+EehYyhY9mTztu6MtA4PYDRo=; b=OQOYd02ky4mDot0wc6xSkYf5Mg
 eCE0fBHtF5nriR7TEqRpPFv3x+7h2ERJmOwnrYlP5eg9lcMGGSP3uXKtv0xSQdqRCofHzhZC07EFt
 1Cm6blFq/lIl6pQsJW2ivVlj18koB9QumbANTE/anPauaCtfMHkYmeRf37eWwM9lfJVKaja8Xo+gF
 BQ6MF8gdjz0BQKRIEBU4KlBPZCRS4Kqv2ZFVtza9+SlSd9kqcD8dQnsjZHS7Ua8NjFJsu2HH7dFdp
 WS9MCWhjQwIMk+Iri3k4PHJsFKgwvU0s9UgHGehikQppeevQK5CynSo4ajjJ+wD3CkrtAEaeClf5T
 OFzMggeg==;
Received: from [177.34.168.16] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1puXka-0015yz-Er; Thu, 04 May 2023 14:07:56 +0200
Message-ID: <c5171667-75e2-7b7c-38a6-19d256445c38@igalia.com>
Date: Thu, 4 May 2023 09:07:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 02/13] drm: add drm_exec selftests v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-3-christian.koenig@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230504115159.2245-3-christian.koenig@amd.com>
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

Hi Christian,

It would be nice if you use the KUnit macros, instead of pr_info.

On 5/4/23 08:51, Christian König wrote:
> Largely just the initial skeleton.
> 
> v2: add array test as well
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/Kconfig               |  1 +
>   drivers/gpu/drm/tests/Makefile        |  3 +-
>   drivers/gpu/drm/tests/drm_exec_test.c | 96 +++++++++++++++++++++++++++
>   3 files changed, 99 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/tests/drm_exec_test.c
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 2dc81eb062eb..068e574e234e 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -80,6 +80,7 @@ config DRM_KUNIT_TEST
>   	select DRM_BUDDY
>   	select DRM_EXPORT_FOR_TESTS if m
>   	select DRM_KUNIT_TEST_HELPERS
> +	select DRM_EXEC
>   	default KUNIT_ALL_TESTS
>   	help
>   	  This builds unit tests for DRM. This option is not useful for
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index bca726a8f483..ba7baa622675 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>   	drm_modes_test.o \
>   	drm_plane_helper_test.o \
>   	drm_probe_helper_test.o \
> -	drm_rect_test.o
> +	drm_rect_test.o	\
> +	drm_exec_test.o
>   
>   CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
> new file mode 100644
> index 000000000000..26aa13e62d22
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2019 Intel Corporation
> + */
> +
> +#define pr_fmt(fmt) "drm_exec: " fmt
> +
> +#include <kunit/test.h>
> +
> +#include <linux/module.h>
> +#include <linux/prime_numbers.h>
> +
> +#include <drm/drm_exec.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_gem.h>
> +
> +#include "../lib/drm_random.h"
> +
> +static struct drm_device dev;
> +
> +static void drm_exec_sanitycheck(struct kunit *test)
> +{
> +	struct drm_exec exec;
> +
> +	drm_exec_init(&exec, true);
> +	drm_exec_fini(&exec);
> +	pr_info("%s - ok!\n", __func__);

Here you could use KUNIT_SUCCEED(test).

> +}
> +
> +static void drm_exec_lock1(struct kunit *test)

Is there a reason to call the function drm_exec_lock1 instead of
just drm_exec_lock?

> +{
> +	struct drm_gem_object gobj = { };
> +	struct drm_exec exec;
> +	int ret;
> +
> +	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
> +
> +	drm_exec_init(&exec, true);
> +	drm_exec_while_not_all_locked(&exec) {
> +		ret = drm_exec_prepare_obj(&exec, &gobj, 1);
> +		drm_exec_continue_on_contention(&exec);
> +		if (ret) {
> +			drm_exec_fini(&exec);
> +			pr_err("%s - err %d!\n", __func__, ret);

Here you could use KUNIT_FAIL. Same for the other function.

Actually, it would be better if you created a function `exit`
associated with the test suite, where you would call drm_exec_fini,
and checked the ret variable with KUNIT_EXPECT_EQ(test, ret, 0) in
the test.

> +			return;
> +		}
> +	}
> +	drm_exec_fini(&exec);
> +	pr_info("%s - ok!\n", __func__);
> +}
> +
> +static void drm_exec_lock_array(struct kunit *test)
> +{
> +	struct drm_gem_object gobj1 = { };
> +	struct drm_gem_object gobj2 = { };
> +	struct drm_gem_object *array[] = { &gobj1, &gobj2 };
> +	struct drm_exec exec;
> +	int ret;
> +
> +	drm_gem_private_object_init(&dev, &gobj1, PAGE_SIZE);
> +	drm_gem_private_object_init(&dev, &gobj2, PAGE_SIZE);
> +
> +	drm_exec_init(&exec, true);
> +	ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array), 0);
> +	if (ret) {
> +		drm_exec_fini(&exec);
> +		pr_err("%s - err %d!\n", __func__, ret);
> +		return;
> +	}
> +	drm_exec_fini(&exec)> +	pr_info("%s - ok!\n", __func__);
> +}
> +
> +static int drm_exec_suite_init(struct kunit_suite *suite)
> +{
> +	kunit_info(suite, "Testing DRM exec manager\n");

Isn't this already clear by the name of the test?

Best Regards,
- Maíra Canal

> +	return 0;
> +}
> +
> +static struct kunit_case drm_exec_tests[] = {
> +	KUNIT_CASE(drm_exec_sanitycheck),
> +	KUNIT_CASE(drm_exec_lock1),
> +	KUNIT_CASE(drm_exec_lock_array),
> +	{}
> +};
> +
> +static struct kunit_suite drm_exec_test_suite = {
> +	.name = "drm_exec",
> +	.suite_init = drm_exec_suite_init,
> +	.test_cases = drm_exec_tests,
> +};
> +
> +kunit_test_suite(drm_exec_test_suite);
> +
> +MODULE_AUTHOR("AMD");
> +MODULE_LICENSE("GPL and additional rights");
