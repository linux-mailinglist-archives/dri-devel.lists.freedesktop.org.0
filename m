Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F166C74EBCA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 12:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A92E10E35E;
	Tue, 11 Jul 2023 10:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D71C10E35E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 10:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689071741; x=1720607741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sg4S5cKhWKuAJU81OosrKtlprRZuEKANX0j+6DgqUT0=;
 b=h3qakKpwJi3rgrl2klyLPwSfLL8JQKRp4Goj7TXD6WrCZ5T332/jpQKT
 DsAFOXnixof8r7adpfsHsXpuGA3c1Kmh7xRXhVnRQQyQHWaNbnJEirXi6
 Mcw1P09ySlUbR2tDsJ0h7SmEJ0Fz2ApwhGZYZABJ+UqcXwAN+xufNPLU+
 ItWymXr5pQjfxTmDMiaBS/4GK2mnW/N8xsZNbVbUxiiCZR4RTWBJghm5G
 BkzsdIje1QBKa3vOQsrD9bDQ00bMGZg6tMI0lNg/UIF6oa6bGH0izsxE+
 Bwc0FP6wXJfO/00mQEX8huvxmp2AIEDCOyJI3pxf46XGojg5vUou/YKx2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="362046475"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="362046475"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:35:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="698386255"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="698386255"
Received: from kaszymec-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.213.16.58])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:35:31 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v4 1/3] drm/ttm: Introduce KUnit tests
Date: Tue, 11 Jul 2023 12:34:23 +0200
Message-Id: <34a4a90a8ff92b472cff1f9df3517611ece92316.1689060814.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1689060814.git.karolina.stolarek@intel.com>
References: <cover.1689060814.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the initial version of unit tests for ttm_device struct, together
with helper functions.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/Kconfig                       | 15 +++
 drivers/gpu/drm/ttm/Makefile                  |  1 +
 drivers/gpu/drm/ttm/tests/.kunitconfig        |  4 +
 drivers/gpu/drm/ttm/tests/Makefile            |  5 +
 drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 54 ++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 98 +++++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h | 37 +++++++
 7 files changed, 214 insertions(+)
 create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index afb3b2f5f425..53024e44a2d5 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -194,6 +194,21 @@ config DRM_TTM
 	  GPU memory types. Will be enabled automatically if a device driver
 	  uses it.
 
+config DRM_TTM_KUNIT_TEST
+        tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
+        default n
+        depends on DRM && KUNIT
+        select DRM_TTM
+        select DRM_EXPORT_FOR_TESTS if m
+        select DRM_KUNIT_TEST_HELPERS
+        default KUNIT_ALL_TESTS
+        help
+          Enables unit tests for TTM, a GPU memory manager subsystem used
+          to manage memory buffers. This option is mostly useful for kernel
+          developers.
+
+          If in doubt, say "N".
+
 config DRM_BUDDY
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
index f906b22959cf..dad298127226 100644
--- a/drivers/gpu/drm/ttm/Makefile
+++ b/drivers/gpu/drm/ttm/Makefile
@@ -8,3 +8,4 @@ ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
 ttm-$(CONFIG_AGP) += ttm_agp_backend.o
 
 obj-$(CONFIG_DRM_TTM) += ttm.o
+obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += tests/
diff --git a/drivers/gpu/drm/ttm/tests/.kunitconfig b/drivers/gpu/drm/ttm/tests/.kunitconfig
new file mode 100644
index 000000000000..75fdce0cd98e
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/.kunitconfig
@@ -0,0 +1,4 @@
+CONFIG_KUNIT=y
+CONFIG_DRM=y
+CONFIG_DRM_KUNIT_TEST_HELPERS=y
+CONFIG_DRM_TTM_KUNIT_TEST=y
diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
new file mode 100644
index 000000000000..7917805f37af
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0 AND MIT
+
+obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
+        ttm_device_test.o \
+        ttm_kunit_helpers.o
diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
new file mode 100644
index 000000000000..76d927d07501
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include <drm/ttm/ttm_resource.h>
+#include <drm/ttm/ttm_device.h>
+#include <drm/ttm/ttm_placement.h>
+
+#include "ttm_kunit_helpers.h"
+
+static void ttm_device_init_basic(struct kunit *test)
+{
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_device *ttm_dev;
+	struct ttm_resource_manager *ttm_sys_man;
+	int err;
+
+	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
+
+	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	KUNIT_EXPECT_PTR_EQ(test, ttm_dev->funcs, &ttm_dev_funcs);
+	KUNIT_ASSERT_NOT_NULL(test, ttm_dev->wq);
+	KUNIT_ASSERT_NOT_NULL(test, ttm_dev->man_drv[TTM_PL_SYSTEM]);
+
+	ttm_sys_man = &ttm_dev->sysman;
+	KUNIT_ASSERT_NOT_NULL(test, ttm_sys_man);
+	KUNIT_EXPECT_TRUE(test, ttm_sys_man->use_tt);
+	KUNIT_EXPECT_TRUE(test, ttm_sys_man->use_type);
+	KUNIT_ASSERT_NOT_NULL(test, ttm_sys_man->func);
+
+	KUNIT_EXPECT_PTR_EQ(test, ttm_dev->dev_mapping,
+			    priv->drm->anon_inode->i_mapping);
+
+	ttm_device_fini(ttm_dev);
+}
+
+static struct kunit_case ttm_device_test_cases[] = {
+	KUNIT_CASE(ttm_device_init_basic),
+	{}
+};
+
+static struct kunit_suite ttm_device_test_suite = {
+	.name = "ttm_device",
+	.init = ttm_test_devices_init,
+	.exit = ttm_test_devices_fini,
+	.test_cases = ttm_device_test_cases,
+};
+
+kunit_test_suites(&ttm_device_test_suite);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
new file mode 100644
index 000000000000..5f1499761f16
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include "ttm_kunit_helpers.h"
+
+struct ttm_device_funcs ttm_dev_funcs = {
+};
+EXPORT_SYMBOL_GPL(ttm_dev_funcs);
+
+int ttm_device_kunit_init(struct ttm_test_devices *priv,
+			  struct ttm_device *ttm,
+			  bool use_dma_alloc,
+			  bool use_dma32)
+{
+	struct drm_device *drm = priv->drm;
+	int err;
+
+	err = ttm_device_init(ttm, &ttm_dev_funcs, drm->dev,
+			      drm->anon_inode->i_mapping,
+			      drm->vma_offset_manager,
+			      use_dma_alloc, use_dma32);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ttm_device_kunit_init);
+
+struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
+{
+	struct ttm_test_devices *devs;
+
+	devs = kunit_kzalloc(test, sizeof(*devs), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, devs);
+
+	devs->dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, devs->dev);
+
+	devs->drm = __drm_kunit_helper_alloc_drm_device(test, devs->dev,
+							sizeof(*devs->drm), 0,
+							DRIVER_GEM);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, devs->drm);
+
+	return devs;
+}
+EXPORT_SYMBOL_GPL(ttm_test_devices_basic);
+
+struct ttm_test_devices *ttm_test_devices_all(struct kunit *test)
+{
+	struct ttm_test_devices *devs;
+	struct ttm_device *ttm_dev;
+	int err;
+
+	devs = ttm_test_devices_basic(test);
+
+	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
+
+	err = ttm_device_kunit_init(devs, ttm_dev, false, false);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	devs->ttm_dev = ttm_dev;
+	test->priv = devs;
+
+	return devs;
+}
+EXPORT_SYMBOL_GPL(ttm_test_devices_all);
+
+void ttm_test_devices_put(struct kunit *test, struct ttm_test_devices *devs)
+{
+	if (devs->ttm_dev)
+		ttm_device_fini(devs->ttm_dev);
+
+	drm_kunit_helper_free_device(test, devs->dev);
+	drm_dev_put(devs->drm);
+}
+EXPORT_SYMBOL_GPL(ttm_test_devices_put);
+
+int ttm_test_devices_init(struct kunit *test)
+{
+	struct ttm_test_devices *priv;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	priv = ttm_test_devices_basic(test);
+	test->priv = priv;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ttm_test_devices_init);
+
+void ttm_test_devices_fini(struct kunit *test)
+{
+	ttm_test_devices_put(test, test->priv);
+}
+EXPORT_SYMBOL_GPL(ttm_test_devices_fini);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
new file mode 100644
index 000000000000..f9f5bc03e93a
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#ifndef TTM_KUNIT_HELPERS_H
+#define TTM_KUNIT_HELPERS_H
+
+#include <drm/drm_drv.h>
+#include <drm/ttm/ttm_device.h>
+
+#include <drm/drm_kunit_helpers.h>
+#include <kunit/test.h>
+
+extern struct ttm_device_funcs ttm_dev_funcs;
+
+struct ttm_test_devices {
+	struct drm_device *drm;
+	struct device *dev;
+	struct ttm_device *ttm_dev;
+};
+
+/* Building blocks for test-specific init functions */
+int ttm_device_kunit_init(struct ttm_test_devices *priv,
+			  struct ttm_device *ttm,
+			  bool use_dma_alloc,
+			  bool use_dma32);
+
+struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test);
+struct ttm_test_devices *ttm_test_devices_all(struct kunit *test);
+
+void ttm_test_devices_put(struct kunit *test, struct ttm_test_devices *devs);
+
+/* Generic init/fini for tests that only need DRM/TTM devices */
+int ttm_test_devices_init(struct kunit *test);
+void ttm_test_devices_fini(struct kunit *test);
+
+#endif // TTM_KUNIT_HELPERS_H
-- 
2.25.1

