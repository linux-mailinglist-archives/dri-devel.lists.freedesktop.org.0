Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2130D7D598E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 19:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949A210E42F;
	Tue, 24 Oct 2023 17:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6449710E42F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 17:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698167671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rPe5sErz69Kanovy14RWE3IYDmvNX5JNjcUdys3uWXo=;
 b=DQaYIuB5oRvbhx4YevecFIbP1LwVtO/3i++W7pM1FACItia0zBwUdvor4NfEyFISXZw+ja
 0t5iybFVjfKVUMtNDOGl+9U3TOxWcxNk2y5vTbukfC0xS72tTNSvn5iBkTeAiWVdhouUg+
 npIUfbSsK4P1yo9qeff7JSdTOSITA6E=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-w04NvZ2uN6uIqCoP2coNRg-1; Tue, 24 Oct 2023 13:14:30 -0400
X-MC-Unique: w04NvZ2uN6uIqCoP2coNRg-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-778a20a16e3so651751885a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 10:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698167669; x=1698772469;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rPe5sErz69Kanovy14RWE3IYDmvNX5JNjcUdys3uWXo=;
 b=br430GP3nL/WTOtW6hRrjt3FQebLLEOwhDn131ZKAUf8k3rAMG59IgjAu2pM9Q7AfF
 zBSXYKFJNhavx1XQlgeTxKslld+hAcznF+aRu25W1FNlDX5K8DHPlOL5vLA7UZzqL7X5
 OlHlJ2JLDbQgpz5mj017QQVX7su56L9mgJzKeM7pWzowaxb5VMjAwJzlGmdZza+Xa7cj
 5fbbr7WE6MsDhlj1ezo2LFH6E8wgqR/p1+Y/XhhXzKhfsN6feVwXYQS501tkDmNmD7v/
 rY5XTilorynewS8e5fZg8lsyejsudBnNBgs9LP39Ywbq0qv2N6mpf/dDjBxsy6DNO19c
 Jrdg==
X-Gm-Message-State: AOJu0YwPR+q3YOXcBwyRIPQqwErHgJwM3pbPKunGiv/Sq6TM3YQESgIs
 X2c+4EklJ0FqltQ9NhJbWMThBcHAmwarEaXewAZGWKS3wcsCo8M+MwLBuFSouo/EyoNkbNfMIjE
 cbbvnMWPZY74+NEODfD447aiCsa4=
X-Received: by 2002:a05:620a:75a:b0:778:9407:7fb2 with SMTP id
 i26-20020a05620a075a00b0077894077fb2mr13324454qki.22.1698167669480; 
 Tue, 24 Oct 2023 10:14:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIdhxuxEfCx3j4I0HFbiJ43lsMpJusnNEfPAwg87n/MZ5TveZd/Xx4uN8x1QmqfRHILmwhjA==
X-Received: by 2002:a05:620a:75a:b0:778:9407:7fb2 with SMTP id
 i26-20020a05620a075a00b0077894077fb2mr13324432qki.22.1698167669139; 
 Tue, 24 Oct 2023 10:14:29 -0700 (PDT)
Received: from [192.168.9.16] (net-2-34-31-107.cust.vodafonedsl.it.
 [2.34.31.107]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05620a2a0800b0077263636a95sm3570561qkp.93.2023.10.24.10.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 10:14:28 -0700 (PDT)
Message-ID: <789aaf2b-4d68-4128-b8ff-c1ba4849e141@redhat.com>
Date: Tue, 24 Oct 2023 19:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/test: add a test suite for GEM objects backed by
 shmem
To: Maxime Ripard <mripard@kernel.org>
References: <20231023164541.92913-1-marpagan@redhat.com>
 <zakappnhljtx3axi2ovvis3evhju4cwqrena7j6gqn5kjdjtsb@mgrhkn5oboid>
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <zakappnhljtx3axi2ovvis3evhju4cwqrena7j6gqn5kjdjtsb@mgrhkn5oboid>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Christian Koenig <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-24 11:23, Maxime Ripard wrote:
> Hi Marco,
> 
> On Mon, Oct 23, 2023 at 06:45:40PM +0200, Marco Pagani wrote:
>> This patch introduces an initial KUnit test suite for GEM objects
>> backed by shmem buffers.
>>
>> Signed-off-by: Marco Pagani <marpagan@redhat.com>
>> ---
>>  drivers/gpu/drm/Kconfig                    |   1 +
>>  drivers/gpu/drm/tests/Makefile             |   3 +-
>>  drivers/gpu/drm/tests/drm_gem_shmem_test.c | 303 +++++++++++++++++++++
>>  3 files changed, 306 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/tests/drm_gem_shmem_test.c
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 3eee8636f847..f0a77e3e04d7 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -84,6 +84,7 @@ config DRM_KUNIT_TEST
>>  	select DRM_EXPORT_FOR_TESTS if m
>>  	select DRM_KUNIT_TEST_HELPERS
>>  	select DRM_EXEC
>> +	select DRM_GEM_SHMEM_HELPER
> 
> I know that DRM_EXEC already stands out, but these should be ordered
> alphabetically, so it should be before DRM_KUNIT_TEST_HELPERS.
> 
>>  	default KUNIT_ALL_TESTS
>>  	help
>>  	  This builds unit tests for DRM. This option is not useful for
>> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
>> index ba7baa622675..b8227aab369e 100644
>> --- a/drivers/gpu/drm/tests/Makefile
>> +++ b/drivers/gpu/drm/tests/Makefile
>> @@ -18,6 +18,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>>  	drm_plane_helper_test.o \
>>  	drm_probe_helper_test.o \
>>  	drm_rect_test.o	\
>> -	drm_exec_test.o
>> +	drm_exec_test.o \
>> +	drm_gem_shmem_test.o
> 
> Ditto.
>

Right, I'll sort them alphabetically for v2.

>>  CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
>> diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>> new file mode 100644
>> index 000000000000..0bf6727f08d2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
>> @@ -0,0 +1,303 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * KUnit test suite for GEM objects backed by shmem buffers
>> + *
>> + * Copyright (C) 2023 Red Hat, Inc.
>> + *
>> + * Author: Marco Pagani <marpagan@redhat.com>
>> + */
>> +
>> +#include <linux/dma-buf.h>
>> +#include <linux/iosys-map.h>
>> +#include <linux/sizes.h>
>> +
>> +#include <kunit/test.h>
>> +
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_gem.h>
>> +#include <drm/drm_gem_shmem_helper.h>
>> +#include <drm/drm_kunit_helpers.h>
>> +
>> +#define TEST_SIZE		SZ_1M
>> +#define TEST_BYTE		0xae
>> +
>> +struct fake_dev {
>> +	struct drm_device drm_dev;
>> +	struct device *dev;
>> +};
>> +
>> +/* Test creating a shmem GEM object */
>> +static void drm_gem_shmem_test_obj_create(struct kunit *test)
>> +{
>> +	struct fake_dev *fdev = test->priv;
>> +	struct drm_gem_shmem_object *shmem;
>> +
>> +	shmem = drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
>> +	KUNIT_ASSERT_EQ(test, shmem->base.size, TEST_SIZE);
>> +	KUNIT_ASSERT_NOT_NULL(test, shmem->base.filp);
>> +	KUNIT_ASSERT_NOT_NULL(test, shmem->base.funcs);
>> +
>> +	drm_gem_shmem_free(shmem);
>> +}
>> +
>> +/* Test creating a private shmem GEM object from a scatter/gather table */
> 
> Thanks for documenting those tests. I believe we should also document
> what we expect from the test: should the test succeed? fail? if it
> fails, what is the cause of failure?
> 
> Based on the following test, I think something like the following would
> be good:
> 
> Test that creating a private shmem GEM object from a previously
> allocated sg_table succeeds and is properly initialized
> 
> Feel free to change it to something else if you find something missing.
>

Sounds good to me. I'll improve the documentation for v2.

>> +static void drm_gem_shmem_test_obj_create_private(struct kunit *test)
>> +{
>> +	struct fake_dev *fdev = test->priv;
>> +	struct drm_gem_shmem_object *shmem;
>> +	struct drm_gem_object *gem_obj;
>> +	struct dma_buf buf_mock;
>> +	struct dma_buf_attachment attach_mock;
>> +	struct sg_table *sgt;
>> +	char *buf;
>> +	int ret;
>> +
>> +	/* Create a mock scatter/gather table */
>> +	buf = kunit_kzalloc(test, TEST_SIZE, GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, buf);
>> +
>> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, sgt);
>> +
>> +	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +	sg_init_one(sgt->sgl, buf, TEST_SIZE);
>> +
>> +	/* Init a mock DMA-BUF */
>> +	buf_mock.size = TEST_SIZE;
>> +	attach_mock.dmabuf = &buf_mock;
>> +
>> +	gem_obj = drm_gem_shmem_prime_import_sg_table(&fdev->drm_dev, &attach_mock, sgt);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gem_obj);
>> +	KUNIT_ASSERT_EQ(test, gem_obj->size, TEST_SIZE);
>> +	KUNIT_ASSERT_NULL(test, gem_obj->filp);
>> +	KUNIT_ASSERT_NOT_NULL(test, gem_obj->funcs);
>> +
>> +	shmem = to_drm_gem_shmem_obj(gem_obj);
>> +	KUNIT_ASSERT_PTR_EQ(test, shmem->sgt, sgt);
>> +
>> +	/* The scatter/gather table is freed by drm_gem_shmem_free */
>> +	drm_gem_shmem_free(shmem);
>> +}
> 
> KUNIT_ASSERT_* will stop the execution of the test on failure, you
> should probably use a bit more of KUNIT_EXPECT_* calls otherwise you'll
> leak resources.
> 
> You also probably want to use a kunit_action to clean up and avoid that
> whole discussion
>

You are right. I slightly prefer using KUnit expectations (unless actions
are strictly necessary) since I feel using actions makes test cases a bit
less straightforward to understand. Is this okay for you?

>> +
>> +/* Test pinning backing pages */
>> +static void drm_gem_shmem_test_pin_pages(struct kunit *test)
>> +{
>> +	struct fake_dev *fdev = test->priv;
>> +	struct drm_gem_shmem_object *shmem;
>> +	int i, ret;
>> +
>> +	shmem = drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
>> +	KUNIT_ASSERT_NULL(test, shmem->pages);
>> +	KUNIT_ASSERT_EQ(test, shmem->pages_use_count, 0);
>> +
>> +	ret = drm_gem_shmem_pin(shmem);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +	KUNIT_ASSERT_NOT_NULL(test, shmem->pages);
>> +	KUNIT_ASSERT_EQ(test, shmem->pages_use_count, 1);
>> +
>> +	for (i = 0; i < (shmem->base.size >> PAGE_SHIFT); i++)
>> +		KUNIT_ASSERT_NOT_NULL(test, shmem->pages[i]);
>> +
>> +	drm_gem_shmem_unpin(shmem);
>> +	KUNIT_ASSERT_NULL(test, shmem->pages);
>> +	KUNIT_ASSERT_EQ(test, shmem->pages_use_count, 0);
>> +
>> +	drm_gem_shmem_free(shmem);
>> +}
>> +
>> +/* Test creating a virtual mapping */
>> +static void drm_gem_shmem_test_vmap(struct kunit *test)
>> +{
>> +	struct fake_dev *fdev = test->priv;
>> +	struct drm_gem_shmem_object *shmem;
>> +	struct iosys_map map;
>> +	int ret, i;
>> +
>> +	shmem = drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
>> +	KUNIT_ASSERT_NULL(test, shmem->vaddr);
>> +	KUNIT_ASSERT_EQ(test, shmem->vmap_use_count, 0);
>> +
>> +	ret = drm_gem_shmem_vmap(shmem, &map);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +	KUNIT_ASSERT_NOT_NULL(test, shmem->vaddr);
>> +	KUNIT_ASSERT_EQ(test, shmem->vmap_use_count, 1);
>> +	KUNIT_ASSERT_FALSE(test, iosys_map_is_null(&map));
>> +
>> +	iosys_map_memset(&map, 0, TEST_BYTE, TEST_SIZE);
>> +	for (i = 0; i < TEST_SIZE; i++)
>> +		KUNIT_ASSERT_EQ(test, iosys_map_rd(&map, i, u8), TEST_BYTE);
>> +
>> +	drm_gem_shmem_vunmap(shmem, &map);
>> +	KUNIT_ASSERT_NULL(test, shmem->vaddr);
>> +	KUNIT_ASSERT_EQ(test, shmem->vmap_use_count, 0);
>> +
>> +	drm_gem_shmem_free(shmem);
>> +}
>> +
>> +/* Test exporting a scatter/gather table */
>> +static void drm_gem_shmem_test_get_pages_sgt(struct kunit *test)
>> +{
>> +	struct fake_dev *fdev = test->priv;
>> +	struct drm_gem_shmem_object *shmem;
>> +	struct sg_table *sgt;
>> +	struct scatterlist *sg;
>> +	unsigned int si, len = 0;
>> +	int ret;
>> +
>> +	shmem = drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
>> +
>> +	ret = drm_gem_shmem_pin(shmem);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	sgt = drm_gem_shmem_get_sg_table(shmem);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
>> +	KUNIT_ASSERT_NULL(test, shmem->sgt);
>> +
>> +	for_each_sgtable_sg(sgt, sg, si) {
>> +		KUNIT_ASSERT_NOT_NULL(test, sg);
>> +		len += sg->length;
>> +	}
>> +	KUNIT_ASSERT_GE(test, len, TEST_SIZE);
>> +
>> +	kfree(sgt);
>> +	drm_gem_shmem_free(shmem);
>> +}
>> +
>> +/* Test exporting a scatter/gather pinned table for PRIME */
>> +static void drm_gem_shmem_test_get_sg_table(struct kunit *test)
>> +{
>> +	struct fake_dev *fdev = test->priv;
>> +	struct drm_gem_shmem_object *shmem;
>> +	struct sg_table *sgt;
>> +	struct scatterlist *sg;
>> +	unsigned int si, len = 0;
>> +
>> +	shmem = drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
>> +
>> +	sgt = drm_gem_shmem_get_pages_sgt(shmem);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
>> +	KUNIT_ASSERT_PTR_EQ(test, sgt, shmem->sgt);
>> +
>> +	for_each_sgtable_sg(sgt, sg, si) {
>> +		KUNIT_ASSERT_NOT_NULL(test, sg);
>> +		len += sg->length;
>> +	}
>> +	KUNIT_ASSERT_GE(test, len, TEST_SIZE);
>> +
>> +	/* The scatter/gather table is freed by drm_gem_shmem_free */
>> +	drm_gem_shmem_free(shmem);
>> +}
>> +
>> +/* Test updating madvise status */
>> +static void drm_gem_shmem_test_madvise(struct kunit *test)
>> +{
>> +	struct fake_dev *fdev = test->priv;
>> +	struct drm_gem_shmem_object *shmem;
>> +	int ret;
>> +
>> +	shmem = drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
>> +	KUNIT_ASSERT_EQ(test, shmem->madv, 0);
>> +
>> +	ret = drm_gem_shmem_madvise(shmem, 1);
>> +	KUNIT_ASSERT_TRUE(test, ret);
>> +	KUNIT_ASSERT_EQ(test, shmem->madv, 1);
>> +
>> +	ret = drm_gem_shmem_madvise(shmem, -1);
>> +	KUNIT_ASSERT_FALSE(test, ret);
>> +	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
>> +
>> +	ret = drm_gem_shmem_madvise(shmem, 0);
>> +	KUNIT_ASSERT_FALSE(test, ret);
>> +	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
>> +
>> +	drm_gem_shmem_free(shmem);
>> +}
>> +
>> +/* Test purging */
>> +static void drm_gem_shmem_test_purge(struct kunit *test)
>> +{
>> +	struct fake_dev *fdev = test->priv;
>> +	struct drm_gem_shmem_object *shmem;
>> +	struct sg_table *sgt;
>> +	int ret;
>> +
>> +	shmem = drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
>> +
>> +	ret = drm_gem_shmem_is_purgeable(shmem);
>> +	KUNIT_ASSERT_FALSE(test, ret);
>> +
>> +	ret = drm_gem_shmem_madvise(shmem, 1);
>> +	KUNIT_ASSERT_TRUE(test, ret);
>> +
>> +	sgt = drm_gem_shmem_get_pages_sgt(shmem);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
>> +
>> +	ret = drm_gem_shmem_is_purgeable(shmem);
>> +	KUNIT_ASSERT_TRUE(test, ret);
>> +
>> +	drm_gem_shmem_purge(shmem);
>> +	KUNIT_ASSERT_TRUE(test, ret);
>> +
>> +	drm_gem_shmem_free(shmem);
>> +}
>> +
>> +static int drm_gem_shmem_test_init(struct kunit *test)
>> +{
>> +	struct fake_dev *fdev;
>> +	struct device *dev;
>> +
>> +	/* Allocate a parent device */
>> +	dev = drm_kunit_helper_alloc_device(test);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
>> +
>> +	/*
>> +	 * The DRM core will automatically initialize the GEM core and create
>> +	 * a DRM Memory Manager object which provides an address space pool
>> +	 * for GEM objects allocation.
>> +	 */
>> +	fdev = drm_kunit_helper_alloc_drm_device(test, dev, struct fake_dev,
>> +						 drm_dev, DRIVER_GEM);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fdev);
>> +
>> +	fdev->dev = dev;
>> +	test->priv = fdev;
>> +
>> +	return 0;
>> +}
>> +
>> +static void drm_gem_shmem_test_exit(struct kunit *test)
>> +{
>> +	struct fake_dev *fdev = test->priv;
>> +
>> +	drm_kunit_helper_free_device(test, fdev->dev);
>> +}
> 
> You don't need to call drm_kunit_helper_free_device() anymore
> 
> Maxime

Right. Initially, I accidentally used an older tree that did not include
commit 4f2b0b583baa4. I'll remove the whole exit function for v2.


Thanks,
Marco

