Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F7B7E5808
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4008A10E098;
	Wed,  8 Nov 2023 13:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9A310E098
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 13:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699450952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZybxVMnawKnU2MbahKvcEdSz3IS2CyWZT+LOfEXuSe4=;
 b=SGcQ/ls5DdnvETHdmDB6FR+SW0pGGEObVc+VLDhJ/C51KD6FQ4Xl/lAuFYjGbRcQSASr3K
 HCangOF8z2n+btu1375x81ufaq9m/8aZwtAegL8/QAxtJrYdJflNWnB8QIPj+8dNk8w2lE
 IV3o2jq8W7DpFBSdqCMYC83eOQ7Xj5c=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-1j9SvkuPN-mcRquy7IHfNA-1; Wed, 08 Nov 2023 08:42:30 -0500
X-MC-Unique: 1j9SvkuPN-mcRquy7IHfNA-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-778a32da939so704577685a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 05:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699450950; x=1700055750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZybxVMnawKnU2MbahKvcEdSz3IS2CyWZT+LOfEXuSe4=;
 b=HvioBvAI3CAgfRSi3iD7A6h9ouuZD/DxVhU11ZPVr64LT630+8MNJ2vSpK4ihreXto
 YCDkrP5vW40Rhf9P0DnYDKNAqoRTwdHJeRpk8Xaqpp1YOJ4lEeSI0taBrowfdZwdbrNt
 Eu4Tyq7jXy0IlZSM2lrbfmY2QIofLg7RhwMDZqE0qkIKpOMF/dEh5yTXiABl9tMZRROv
 7jsryHqZcjcnqRIZuF/32LeLcEOYNmshotBqM6/EjPit5Rzu+5QFIrFIewNFvQBq7J5a
 B54PheJAy1RmxP/9Z0epojReES8HzH/4RcOTVmOOcqjXDg5VV/qjNl3LSQOA1LSc1j32
 Kxmg==
X-Gm-Message-State: AOJu0YwZ34xHlP+5bVTSESzse7jT1cNjCczyNKd/PiUNFhVpuCTNef1l
 Hvuaq7GEQcHjHaQF8zJU9bTZTNk/YjS+ZwfdADyRo8cxIu0L/Wk8SdKDlpxI2bfLtLhgTFxMhHM
 ruVfxb18nV+A8ACGJMUjLggXdwpE=
X-Received: by 2002:a05:620a:4414:b0:77b:93b5:33be with SMTP id
 v20-20020a05620a441400b0077b93b533bemr1821739qkp.14.1699450949809; 
 Wed, 08 Nov 2023 05:42:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhgUZPxYEbWo3lBL/u7o2B6o/d7fPXrZiZOZmVjT5bSWNvS5ettzMPiWteVu7kIDDPleTnrg==
X-Received: by 2002:a05:620a:4414:b0:77b:93b5:33be with SMTP id
 v20-20020a05620a441400b0077b93b533bemr1821711qkp.14.1699450949414; 
 Wed, 08 Nov 2023 05:42:29 -0800 (PST)
Received: from klayman.redhat.com (net-2-34-31-107.cust.vodafonedsl.it.
 [2.34.31.107]) by smtp.gmail.com with ESMTPSA id
 y26-20020a37e31a000000b007671b599cf5sm1040235qki.40.2023.11.08.05.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 05:42:28 -0800 (PST)
From: Marco Pagani <marpagan@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>
Subject: [RFC PATCH v2] drm/test: add a test suite for GEM objects backed by
 shmem
Date: Wed,  8 Nov 2023 14:42:03 +0100
Message-ID: <20231108134205.111478-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.41.0
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

v2:
- Improved description of test cases
- Cleaner error handling using KUnit actions
- Alphabetical order in Kconfig and Makefile
---
 drivers/gpu/drm/Kconfig                    |   9 +-
 drivers/gpu/drm/tests/Makefile             |   5 +-
 drivers/gpu/drm/tests/drm_gem_shmem_test.c | 381 +++++++++++++++++++++
 3 files changed, 389 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/tests/drm_gem_shmem_test.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3eee8636f847..a2551c8c393a 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -76,14 +76,15 @@ config DRM_KUNIT_TEST
 	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
 	depends on DRM && KUNIT
 	select PRIME_NUMBERS
+	select DRM_BUDDY
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
-	select DRM_LIB_RANDOM
-	select DRM_KMS_HELPER
-	select DRM_BUDDY
+	select DRM_EXEC
 	select DRM_EXPORT_FOR_TESTS if m
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
 	select DRM_KUNIT_TEST_HELPERS
-	select DRM_EXEC
+	select DRM_LIB_RANDOM
 	default KUNIT_ALL_TESTS
 	help
 	  This builds unit tests for DRM. This option is not useful for
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index ba7baa622675..d6183b3d7688 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -9,15 +9,16 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_connector_test.o \
 	drm_damage_helper_test.o \
 	drm_dp_mst_helper_test.o \
+	drm_exec_test.o \
 	drm_format_helper_test.o \
 	drm_format_test.o \
 	drm_framebuffer_test.o \
+	drm_gem_shmem_test.o \
 	drm_managed_test.o \
 	drm_mm_test.o \
 	drm_modes_test.o \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
-	drm_rect_test.o	\
-	drm_exec_test.o
+	drm_rect_test.o
 
 CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
new file mode 100644
index 000000000000..983380490673
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -0,0 +1,381 @@
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
+struct fake_dev {
+	struct drm_device drm_dev;
+	struct device *dev;
+};
+
+/*
+ * Wrappers to avoid an explicit type casting when passing action
+ * functions to kunit_add_action().
+ */
+static void kfree_wrapper(void *p)
+{
+	kfree(p);
+}
+
+static void sg_free_table_wrapper(void *sgt)
+{
+	sg_free_table(sgt);
+}
+
+static void drm_gem_shmem_free_wrapper(void *shmem)
+{
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
+	struct fake_dev *fdev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+
+	shmem = drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
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
+	struct fake_dev *fdev = test->priv;
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
+	gem_obj = drm_gem_shmem_prime_import_sg_table(&fdev->drm_dev, &attach_mock, sgt);
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
+	struct fake_dev *fdev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	int i, ret;
+
+	shmem = drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
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
+	struct fake_dev *fdev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	struct iosys_map map;
+	int ret, i;
+
+	shmem = drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
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
+	struct fake_dev *fdev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	unsigned int si, len = 0;
+	int ret;
+
+	shmem = drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
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
+	struct fake_dev *fdev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	unsigned int si, len, ret = 0;
+
+	shmem = drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
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
+	struct fake_dev *fdev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	int ret;
+
+	shmem = drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
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
+	struct fake_dev *fdev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	struct sg_table *sgt;
+	int ret;
+
+	shmem = drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
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
+	struct fake_dev *fdev;
+	struct device *dev;
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
+	fdev = drm_kunit_helper_alloc_drm_device(test, dev, struct fake_dev,
+						 drm_dev, DRIVER_GEM);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fdev);
+
+	fdev->dev = dev;
+	test->priv = fdev;
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

base-commit: 9ccde17d46554dbb2757c427f2cdf67688701f96
-- 
2.41.0

