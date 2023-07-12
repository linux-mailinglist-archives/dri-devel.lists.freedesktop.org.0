Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B138274FC74
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 02:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358A610E46E;
	Wed, 12 Jul 2023 00:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36B210E46E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 00:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
 :References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5d6FnH1FYgpMFIGfObd2t8ckqY18NMcmf+fC7r3e4yk=; b=QuIxaWyxflyc5p8NTwokLLUlqI
 BPgjO3lmXRXpKulFr3h/Wq4qM55ysyUxAdbI9oi7OISbZwIoGQmX7zCqF4Nj5SUydIMkn4UtUnmEt
 8jqdDYhzexX6iHCCkqFur8fl8MVxbtNlJeNHthKmeT5cL7HoBFA3sunYsrlIIPcy++SrBtTVO6Mo3
 ch6Hcsa1vs0fLTQuud+1cQz1vHvYadOqILNnnTd1bpfKt6Oh95IrC4hcpbuGvWHBMat0L8gVKf1z0
 FQ5shyf8ZDi7e9Y2i+p2fWy9GbSZSZJ1A+1Xwvm6sIkrnP2dxb+xyGRuWTxq0+1if7D/qtXwZuobd
 +Ddz5xcw==;
Received: from [177.34.168.16] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qJOCW-00Cpeb-A0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 02:59:28 +0200
Message-ID: <55f53478-9935-398c-e6c6-642a0c3b0ff0@igalia.com>
Date: Tue, 11 Jul 2023 21:59:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: dri-devel@lists.freedesktop.org
References: <20230711133122.3710-1-christian.koenig@amd.com>
 <20230711133122.3710-3-christian.koenig@amd.com>
Content-Language: en-US
From: Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH 2/6] drm: add drm_exec selftests v4
In-Reply-To: <20230711133122.3710-3-christian.koenig@amd.com>
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

On 7/11/23 10:31, Christian König wrote:
> Exercise at least all driver facing functions of this new component.
> 
> v2: add array test as well
> v3: some kunit cleanups
> v4: more tests and cleanups
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/Kconfig               |   1 +
>   drivers/gpu/drm/tests/Makefile        |   3 +-
>   drivers/gpu/drm/tests/drm_exec_test.c | 159 ++++++++++++++++++++++++++
>   3 files changed, 162 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/tests/drm_exec_test.c
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index c0b4063a3ee6..22c1ba9ea28c 100644
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
> index 000000000000..727ac267682e
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + */
> +
> +#define pr_fmt(fmt) "drm_exec: " fmt

Do we need this pr_fmt(fmt)?

Best Regards,
- Maíra

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
> +static void sanitycheck(struct kunit *test)
> +{
> +	struct drm_exec exec;
> +
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_fini(&exec);
> +	KUNIT_SUCCEED(test);
> +}
> +
> +static void test_lock(struct kunit *test)
> +{
> +	struct drm_gem_object gobj = { };
> +	struct drm_exec exec;
> +	int ret;
> +
> +	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
> +
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_until_all_locked(&exec) {
> +		ret = drm_exec_lock_obj(&exec, &gobj);
> +		drm_exec_retry_on_contention(&exec);
> +		KUNIT_EXPECT_EQ(test, ret, 0);
> +		if (ret)
> +			break;
> +	}
> +	drm_exec_fini(&exec);
> +}
> +
> +static void test_lock_unlock(struct kunit *test)
> +{
> +	struct drm_gem_object gobj = { };
> +	struct drm_exec exec;
> +	int ret;
> +
> +	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
> +
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_until_all_locked(&exec) {
> +		ret = drm_exec_lock_obj(&exec, &gobj);
> +		drm_exec_retry_on_contention(&exec);
> +		KUNIT_EXPECT_EQ(test, ret, 0);
> +		if (ret)
> +			break;
> +
> +		drm_exec_unlock_obj(&exec, &gobj);
> +		ret = drm_exec_lock_obj(&exec, &gobj);
> +		drm_exec_retry_on_contention(&exec);
> +		KUNIT_EXPECT_EQ(test, ret, 0);
> +		if (ret)
> +			break;
> +	}
> +	drm_exec_fini(&exec);
> +}
> +
> +static void test_duplicates(struct kunit *test)
> +{
> +	struct drm_gem_object gobj = { };
> +	struct drm_exec exec;
> +	int ret;
> +
> +	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
> +
> +	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES);
> +	drm_exec_until_all_locked(&exec) {
> +		ret = drm_exec_lock_obj(&exec, &gobj);
> +		drm_exec_retry_on_contention(&exec);
> +		KUNIT_EXPECT_EQ(test, ret, 0);
> +		if (ret)
> +			break;
> +
> +		ret = drm_exec_lock_obj(&exec, &gobj);
> +		drm_exec_retry_on_contention(&exec);
> +		KUNIT_EXPECT_EQ(test, ret, 0);
> +		if (ret)
> +			break;
> +	}
> +	drm_exec_unlock_obj(&exec, &gobj);
> +	drm_exec_fini(&exec);
> +}
> +
> +
> +
> +static void test_prepare(struct kunit *test)
> +{
> +	struct drm_gem_object gobj = { };
> +	struct drm_exec exec;
> +	int ret;
> +
> +	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
> +
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_until_all_locked(&exec) {
> +		ret = drm_exec_prepare_obj(&exec, &gobj, 1);
> +		drm_exec_retry_on_contention(&exec);
> +		KUNIT_EXPECT_EQ(test, ret, 0);
> +		if (ret)
> +			break;
> +	}
> +	drm_exec_fini(&exec);
> +}
> +
> +static void test_prepare_array(struct kunit *test)
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
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_until_all_locked(&exec)
> +		ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
> +					     1);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	drm_exec_fini(&exec);
> +}
> +
> +static struct kunit_case drm_exec_tests[] = {
> +	KUNIT_CASE(sanitycheck),
> +	KUNIT_CASE(test_lock),
> +	KUNIT_CASE(test_lock_unlock),
> +	KUNIT_CASE(test_duplicates),
> +	KUNIT_CASE(test_prepare),
> +	KUNIT_CASE(test_prepare_array),
> +	{}
> +};
> +
> +static struct kunit_suite drm_exec_test_suite = {
> +	.name = "drm_exec",
> +	.test_cases = drm_exec_tests,
> +};
> +
> +kunit_test_suite(drm_exec_test_suite);
> +
> +MODULE_AUTHOR("AMD");
> +MODULE_LICENSE("GPL and additional rights");
