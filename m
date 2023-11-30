Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE7E7FF7D7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 18:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFAA10E749;
	Thu, 30 Nov 2023 17:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECA210E749
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701364475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sdJLGFUsBvRPgmsAPdEnB3Yq8nzOIqNpJn9wW0/735U=;
 b=crPhz60FKGOeK9FnUkoz3XrwGAp7MpRLvTlybX5ZwKEQkLMNjNpWaRM9WQL+d0bBVnrFLg
 VPRVv05CHmnTP3oqnVAtPj4ilE6Dr0AIp3FfreCeqR3jecaRjRif4OlLaonkkPFaI72ER9
 hHJZu/5DKez5Sl3phWk/gG0IDX2tK6s=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-dHsKYJLaM5qfYlHjN6pWoQ-1; Thu, 30 Nov 2023 12:14:33 -0500
X-MC-Unique: dHsKYJLaM5qfYlHjN6pWoQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-67800577545so48317056d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 09:14:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701364473; x=1701969273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sdJLGFUsBvRPgmsAPdEnB3Yq8nzOIqNpJn9wW0/735U=;
 b=XmCmyrBMJuXQ+afvAUPfC0M9ZpPKbEEPxK2KjXMo4bnh1wcgapVk/o8f4knWAHEheG
 /zNpX22B6LKG3DcbgVes7mjJtC8Soh9/BSoos4azxVv8KYN8w8IUoMT1ee8ohx6IlKcC
 pI/C4LNjbILOHDboo3YVjdya6DzDvnh2VCdYmLOzc3tE+7KgmXIShjXEORg53j4rM33q
 mYvsqgnEk/s8Xm/g7nNdwAAs4bP1ViRUDY9fLE6pLj9uj4NmkqTZLyJvHqTylxF8xbsx
 Q5UHoVDqEdfShaGKlEguTB81IB4iG7gb9wnGH6eQ9mDROYXzQ7cjB0ExDFlaTA8+mKzS
 MUrQ==
X-Gm-Message-State: AOJu0Yyg7IJ3Ekr2MXf3fZuVBpGDzDxhFerqK7YIgopymSdvnx6b2wsY
 vvXGzsVuoIuXKwyYaJF2VWqjDLdnNJFp9BzCJ7tnGk/f/cEtaoKRYT6QmbJEs8JeNqQTCjCQrFG
 9dmY4APo3W4oqgSSovVAfbqK3bmc=
X-Received: by 2002:a05:6214:d0c:b0:67a:542a:dba1 with SMTP id
 12-20020a0562140d0c00b0067a542adba1mr19722585qvh.17.1701364473133; 
 Thu, 30 Nov 2023 09:14:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj2Bf1J8SDqB0wuqLQHTMYnj3qEz2o57Mqa6dPV3K7TvyTfFtsgHvGRGXfYxFzIcG4opxh9w==
X-Received: by 2002:a05:6214:d0c:b0:67a:542a:dba1 with SMTP id
 12-20020a0562140d0c00b0067a542adba1mr19722523qvh.17.1701364472771; 
 Thu, 30 Nov 2023 09:14:32 -0800 (PST)
Received: from klayman.redhat.com (net-2-34-30-38.cust.vodafonedsl.it.
 [2.34.30.38]) by smtp.gmail.com with ESMTPSA id
 r12-20020a0ce28c000000b0067a24f5b432sm169478qvl.62.2023.11.30.09.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 09:14:32 -0800 (PST)
From: Marco Pagani <marpagan@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH v5] drm/test: add a test suite for GEM objects backed by shmem
Date: Thu, 30 Nov 2023 18:14:16 +0100
Message-ID: <20231130171417.74162-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marco Pagani <marpagan@redhat.com>, linaro-mm-sig@lists.linaro.org,
 Javier Martinez Canillas <javierm@redhat.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch introduces an initial KUnit test suite for GEM objects
backed by shmem buffers.

Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marco Pagani <marpagan@redhat.com>

v5:
- using __drm_kunit_helper_alloc_drm_device() to avoid local struct
v4:
- Add missing MMU dependency for DRM_GEM_SHMEM_HELPER (kernel test robot)
v3:
- Explicitly cast pointers in the helpers
- Removed unused pointer to parent dev in struct fake_dev
- Test entries reordering in Kconfig and Makefile sent as a separate patch
v2:
- Improved description of test cases
- Cleaner error handling using KUnit actions
- Alphabetical order in Kconfig and Makefile
---
 drivers/gpu/drm/Kconfig                    |   3 +-
 drivers/gpu/drm/tests/Makefile             |   1 +
 drivers/gpu/drm/tests/drm_gem_shmem_test.c | 383 +++++++++++++++++++++
 3 files changed, 386 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tests/drm_gem_shmem_test.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 740c1c0bd068..b7abd436455f 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -74,12 +74,13 @@ config DRM_KUNIT_TEST_HELPERS
 
 config DRM_KUNIT_TEST
 	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
-	depends on DRM && KUNIT
+	depends on DRM && KUNIT && MMU
 	select DRM_BUDDY
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_EXEC
 	select DRM_EXPORT_FOR_TESTS if m
+	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	select DRM_KUNIT_TEST_HELPERS
 	select DRM_LIB_RANDOM
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 2645af241ff0..d6183b3d7688 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_format_helper_test.o \
 	drm_format_test.o \
 	drm_framebuffer_test.o \
+	drm_gem_shmem_test.o \
 	drm_managed_test.o \
 	drm_mm_test.o \
 	drm_modes_test.o \
diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
new file mode 100644
index 000000000000..91202e40cde9
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit test suite for GEM objects backed by shmem buffers
+ *
+ * Copyright (C) 2023 Red Hat, Inc.
+ *
+ * Author: Marco Pagani <marpagan@redhat.com>
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/iosys-map.h>
+#include <linux/sizes.h>
+
+#include <kunit/test.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_kunit_helpers.h>
+
+#define TEST_SIZE		SZ_1M
+#define TEST_BYTE		0xae
+
+/*
+ * Wrappers to avoid an explicit type casting when passing action
+ * functions to kunit_add_action().
+ */
+static void kfree_wrapper(void *ptr)
+{
+	const void *obj = ptr;
+
+	kfree(obj);
+}
+
+static void sg_free_table_wrapper(void *ptr)
+{
+	struct sg_table *sgt = ptr;
+
+	sg_free_table(sgt);
+}
+
+static void drm_gem_shmem_free_wrapper(void *ptr)
+{
+	struct drm_gem_shmem_object *shmem = ptr;
+
+	drm_gem_shmem_free(shmem);
+}
+
+/*
+ * Test creating a shmem GEM object backed by shmem buffer. The test
+ * case succeeds if the GEM object is successfully allocated with the
+ * shmem file node and object functions attributes set, and the size
+ * attribute is equal to the correct size.
+ */
+static void drm_gem_shmem_test_obj_create(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+
+	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
+	KUNIT_EXPECT_EQ(test, shmem->base.size, TEST_SIZE);
+	KUNIT_EXPECT_NOT_NULL(test, shmem->base.filp);
+	KUNIT_EXPECT_NOT_NULL(test, shmem->base.funcs);
+
+	drm_gem_shmem_free(shmem);
+}
+
+/*
+ * Test creating a shmem GEM object from a scatter/gather table exported
+ * via a DMA-BUF. The test case succeed if the GEM object is successfully
+ * created with the shmem file node attribute equal to NULL and the sgt
+ * attribute pointing to the scatter/gather table that has been imported.
+ */
+static void drm_gem_shmem_test_obj_create_private(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	struct drm_gem_object *gem_obj;
+	struct dma_buf buf_mock;
+	struct dma_buf_attachment attach_mock;
+	struct sg_table *sgt;
+	char *buf;
+	int ret;
+
+	/* Create a mock scatter/gather table */
+	buf = kunit_kzalloc(test, TEST_SIZE, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, sgt);
+
+	ret = kunit_add_action_or_reset(test, kfree_wrapper, sgt);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_add_action_or_reset(test, sg_free_table_wrapper, sgt);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	sg_init_one(sgt->sgl, buf, TEST_SIZE);
+
+	/* Init a mock DMA-BUF */
+	buf_mock.size = TEST_SIZE;
+	attach_mock.dmabuf = &buf_mock;
+
+	gem_obj = drm_gem_shmem_prime_import_sg_table(drm_dev, &attach_mock, sgt);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gem_obj);
+	KUNIT_EXPECT_EQ(test, gem_obj->size, TEST_SIZE);
+	KUNIT_EXPECT_NULL(test, gem_obj->filp);
+	KUNIT_EXPECT_NOT_NULL(test, gem_obj->funcs);
+
+	/* The scatter/gather table will be freed by drm_gem_shmem_free */
+	kunit_remove_action(test, sg_free_table_wrapper, sgt);
+	kunit_remove_action(test, kfree_wrapper, sgt);
+
+	shmem = to_drm_gem_shmem_obj(gem_obj);
+	KUNIT_EXPECT_PTR_EQ(test, shmem->sgt, sgt);
+
+	drm_gem_shmem_free(shmem);
+}
+
+/*
+ * Test pinning backing pages for a shmem GEM object. The test case
+ * succeeds if a suitable number of backing pages are allocated, and
+ * the pages table counter attribute is increased by one.
+ */
+static void drm_gem_shmem_test_pin_pages(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	int i, ret;
+
+	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
+	KUNIT_EXPECT_NULL(test, shmem->pages);
+	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 0);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_shmem_pin(shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_NOT_NULL(test, shmem->pages);
+	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 1);
+
+	for (i = 0; i < (shmem->base.size >> PAGE_SHIFT); i++)
+		KUNIT_ASSERT_NOT_NULL(test, shmem->pages[i]);
+
+	drm_gem_shmem_unpin(shmem);
+	KUNIT_EXPECT_NULL(test, shmem->pages);
+	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 0);
+}
+
+/*
+ * Test creating a virtual mapping for a shmem GEM object. The test
+ * case succeeds if the backing memory is mapped and the reference
+ * counter for virtual mapping is increased by one. Moreover, the test
+ * case writes and then reads a test pattern over the mapped memory.
+ */
+static void drm_gem_shmem_test_vmap(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	struct iosys_map map;
+	int ret, i;
+
+	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
+	KUNIT_EXPECT_NULL(test, shmem->vaddr);
+	KUNIT_EXPECT_EQ(test, shmem->vmap_use_count, 0);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_shmem_vmap(shmem, &map);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_NOT_NULL(test, shmem->vaddr);
+	KUNIT_ASSERT_FALSE(test, iosys_map_is_null(&map));
+	KUNIT_EXPECT_EQ(test, shmem->vmap_use_count, 1);
+
+	iosys_map_memset(&map, 0, TEST_BYTE, TEST_SIZE);
+	for (i = 0; i < TEST_SIZE; i++)
+		KUNIT_EXPECT_EQ(test, iosys_map_rd(&map, i, u8), TEST_BYTE);
+
+	drm_gem_shmem_vunmap(shmem, &map);
+	KUNIT_EXPECT_NULL(test, shmem->vaddr);
+	KUNIT_EXPECT_EQ(test, shmem->vmap_use_count, 0);
+}
+
+/*
+ * Test exporting a scatter/gather table of pinned pages suitable for
+ * PRIME usage from a shmem GEM object. The test case succeeds if a
+ * scatter/gather table large enough to accommodate the backing memory
+ * is successfully exported.
+ */
+static void drm_gem_shmem_test_get_pages_sgt(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	unsigned int si, len = 0;
+	int ret;
+
+	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_shmem_pin(shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	sgt = drm_gem_shmem_get_sg_table(shmem);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
+	KUNIT_EXPECT_NULL(test, shmem->sgt);
+
+	ret = kunit_add_action_or_reset(test, sg_free_table_wrapper, sgt);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	for_each_sgtable_sg(sgt, sg, si) {
+		KUNIT_EXPECT_NOT_NULL(test, sg);
+		len += sg->length;
+	}
+
+	KUNIT_EXPECT_GE(test, len, TEST_SIZE);
+}
+
+/*
+ * Test pinning pages and exporting a scatter/gather table suitable for
+ * driver usage from a shmem GEM object. The test case succeeds if the
+ * backing pages are pinned and a scatter/gather table large enough to
+ * accommodate the backing memory is successfully exported.
+ */
+static void drm_gem_shmem_test_get_sg_table(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	unsigned int si, ret, len = 0;
+
+	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* The scatter/gather table will be freed by drm_gem_shmem_free */
+	sgt = drm_gem_shmem_get_pages_sgt(shmem);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
+	KUNIT_ASSERT_NOT_NULL(test, shmem->pages);
+	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 1);
+	KUNIT_EXPECT_PTR_EQ(test, sgt, shmem->sgt);
+
+	for_each_sgtable_sg(sgt, sg, si) {
+		KUNIT_EXPECT_NOT_NULL(test, sg);
+		len += sg->length;
+	}
+
+	KUNIT_EXPECT_GE(test, len, TEST_SIZE);
+}
+
+/*
+ * Test updating the madvise state of a shmem GEM object. The test
+ * case checks that the function for setting madv updates it only if
+ * its current value is greater or equal than zero and returns false
+ * if it has a negative value.
+ */
+static void drm_gem_shmem_test_madvise(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	int ret;
+
+	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
+	KUNIT_ASSERT_EQ(test, shmem->madv, 0);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_shmem_madvise(shmem, 1);
+	KUNIT_EXPECT_TRUE(test, ret);
+	KUNIT_ASSERT_EQ(test, shmem->madv, 1);
+
+	/* Set madv to a negative value */
+	ret = drm_gem_shmem_madvise(shmem, -1);
+	KUNIT_EXPECT_FALSE(test, ret);
+	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
+
+	/* Check that madv cannot be set back to a positive value */
+	ret = drm_gem_shmem_madvise(shmem, 0);
+	KUNIT_EXPECT_FALSE(test, ret);
+	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
+}
+
+/*
+ * Test purging a shmem GEM object. First, assert that a newly created
+ * shmem GEM object is not purgeable. Then, set madvise to a positive
+ * value and call drm_gem_shmem_get_pages_sgt() to pin and dma-map the
+ * backing pages. Finally, assert that the shmem GEM object is now
+ * purgeable and purge it.
+ */
+static void drm_gem_shmem_test_purge(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	struct sg_table *sgt;
+	int ret;
+
+	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_shmem_is_purgeable(shmem);
+	KUNIT_EXPECT_FALSE(test, ret);
+
+	ret = drm_gem_shmem_madvise(shmem, 1);
+	KUNIT_EXPECT_TRUE(test, ret);
+
+	/* The scatter/gather table will be freed by drm_gem_shmem_free */
+	sgt = drm_gem_shmem_get_pages_sgt(shmem);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
+
+	ret = drm_gem_shmem_is_purgeable(shmem);
+	KUNIT_EXPECT_TRUE(test, ret);
+
+	drm_gem_shmem_purge(shmem);
+	KUNIT_EXPECT_NULL(test, shmem->pages);
+	KUNIT_EXPECT_NULL(test, shmem->sgt);
+	KUNIT_EXPECT_EQ(test, shmem->madv, -1);
+}
+
+static int drm_gem_shmem_test_init(struct kunit *test)
+{
+	struct device *dev;
+	struct drm_device *drm_dev;
+
+	/* Allocate a parent device */
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	/*
+	 * The DRM core will automatically initialize the GEM core and create
+	 * a DRM Memory Manager object which provides an address space pool
+	 * for GEM objects allocation.
+	 */
+	drm_dev = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm_dev),
+						      0, DRIVER_GEM);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm_dev);
+
+	test->priv = drm_dev;
+
+	return 0;
+}
+
+static struct kunit_case drm_gem_shmem_test_cases[] = {
+	KUNIT_CASE(drm_gem_shmem_test_obj_create),
+	KUNIT_CASE(drm_gem_shmem_test_obj_create_private),
+	KUNIT_CASE(drm_gem_shmem_test_pin_pages),
+	KUNIT_CASE(drm_gem_shmem_test_vmap),
+	KUNIT_CASE(drm_gem_shmem_test_get_pages_sgt),
+	KUNIT_CASE(drm_gem_shmem_test_get_sg_table),
+	KUNIT_CASE(drm_gem_shmem_test_madvise),
+	KUNIT_CASE(drm_gem_shmem_test_purge),
+	{}
+};
+
+static struct kunit_suite drm_gem_shmem_suite = {
+	.name = "drm_gem_shmem",
+	.init = drm_gem_shmem_test_init,
+	.test_cases = drm_gem_shmem_test_cases
+};
+
+kunit_test_suite(drm_gem_shmem_suite);
+
+MODULE_LICENSE("GPL");

base-commit: a13fee31f56449fc600d9e064c7b32302f92dcef
-- 
2.43.0

