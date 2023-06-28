Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7895D740F1C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 12:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8894A10E36F;
	Wed, 28 Jun 2023 10:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D2D10E060;
 Wed, 28 Jun 2023 10:44:52 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51d894b9b6cso4182113a12.3; 
 Wed, 28 Jun 2023 03:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687949091; x=1690541091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nH4pgevSq1YjS3pvUb8xcR9UA4gk+cvW9zgwMJQdRD4=;
 b=Kn+gBXpSDVK8fNwc33+HIm2IqIIXrnECHBBSDcQctKlKcN9I3XmToRrmsELe2LBd+2
 R82sZKxki3k4lXTb/NK1Vg1fk2P/Vdt/0CfawbTV7WgXK/QhY9pv574ie7M9o0VRl+G+
 99Fco0RIR/9z1je8eaRLw3HH2Y08uIA2ETGIIfy2WuMGb8NQu5MLHbJIFcDJbpc8tEJX
 66FOYCUWi6Yb81SSlXnQumal2bD0tSm6l/EBprKtvbc3+tAyH4pzPeX2w5fJGPNChCWC
 ErUEJbf/U/TrV99Kqmr6z5lnDpN15HhsDixsxDMX17L2A1FQMjFTA5izfT4ysHUR9N7w
 h8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687949091; x=1690541091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nH4pgevSq1YjS3pvUb8xcR9UA4gk+cvW9zgwMJQdRD4=;
 b=KtGpqfNgLCE307Fon6gt14Lu/S1DJpAj6sf/qtr7/exc4i4OCeB/N/a3k3448eNynj
 hwT1ja+9tUTVaTJFXRBNi/aKuz+PTNpEt6w4P2DgUf//Mj+/ZvozO0Tw5pqWlWruOGIX
 A69e5oOfgJFNg8R+C4vYrlboQfKvYqtd7cQz7Oz3fCK80q6Gnv54aDNiHXa5zke8Pxg7
 9vh/jlL7aqjmgveqgCkhgdDHBZyrV6dWIpQMqfjeOQh9LlFNwiLCsWJMPGroNliCLOP7
 0gU+doj+U8HL7Dvq8UNwm+E3bZVtOPL27Wa+zW7m+sj/Yw9pu3xF5Y3aN1g4p4UaDoS1
 541Q==
X-Gm-Message-State: AC+VfDyPyE96Us6+Xz7bjWIfvat7C7Vqe72hX90B331B/wid+bcPUZTy
 C6gGO6O/CEz4uWNaSKoUSAKaGum6UNE=
X-Google-Smtp-Source: ACHHUZ55hn86H89TDoHbhROs1WaWdMRuzBqP4MMF7CQi1YV6KPKc15zQU9Eyz86MHDvAqyom50RCdg==
X-Received: by 2002:a05:6402:1acc:b0:51b:df14:594e with SMTP id
 ba12-20020a0564021acc00b0051bdf14594emr14209252edb.39.1687949090613; 
 Wed, 28 Jun 2023 03:44:50 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15a4:6600:e1e8:ea62:da3f:c009])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056402515200b0051d9580b00esm3463537edd.11.2023.06.28.03.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 03:44:50 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Subject: [PATCH 2/6] drm: add drm_exec selftests v4
Date: Wed, 28 Jun 2023 12:44:42 +0200
Message-Id: <20230628104446.1369-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628104446.1369-1-christian.koenig@amd.com>
References: <20230628104446.1369-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exercise at least all driver facing functions of this new component.

v2: add array test as well
v3: some kunit cleanups
v4: more tests and cleanups

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/Kconfig               |   1 +
 drivers/gpu/drm/tests/Makefile        |   3 +-
 drivers/gpu/drm/tests/drm_exec_test.c | 159 ++++++++++++++++++++++++++
 3 files changed, 162 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tests/drm_exec_test.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index c2f3d234c89e..47e0bfe19757 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -80,6 +80,7 @@ config DRM_KUNIT_TEST
 	select DRM_BUDDY
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_KUNIT_TEST_HELPERS
+	select DRM_EXEC
 	default KUNIT_ALL_TESTS
 	help
 	  This builds unit tests for DRM. This option is not useful for
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index bca726a8f483..ba7baa622675 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_modes_test.o \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
-	drm_rect_test.o
+	drm_rect_test.o	\
+	drm_exec_test.o
 
 CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
new file mode 100644
index 000000000000..727ac267682e
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ */
+
+#define pr_fmt(fmt) "drm_exec: " fmt
+
+#include <kunit/test.h>
+
+#include <linux/module.h>
+#include <linux/prime_numbers.h>
+
+#include <drm/drm_exec.h>
+#include <drm/drm_device.h>
+#include <drm/drm_gem.h>
+
+#include "../lib/drm_random.h"
+
+static struct drm_device dev;
+
+static void sanitycheck(struct kunit *test)
+{
+	struct drm_exec exec;
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_fini(&exec);
+	KUNIT_SUCCEED(test);
+}
+
+static void test_lock(struct kunit *test)
+{
+	struct drm_gem_object gobj = { };
+	struct drm_exec exec;
+	int ret;
+
+	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec) {
+		ret = drm_exec_lock_obj(&exec, &gobj);
+		drm_exec_retry_on_contention(&exec);
+		KUNIT_EXPECT_EQ(test, ret, 0);
+		if (ret)
+			break;
+	}
+	drm_exec_fini(&exec);
+}
+
+static void test_lock_unlock(struct kunit *test)
+{
+	struct drm_gem_object gobj = { };
+	struct drm_exec exec;
+	int ret;
+
+	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec) {
+		ret = drm_exec_lock_obj(&exec, &gobj);
+		drm_exec_retry_on_contention(&exec);
+		KUNIT_EXPECT_EQ(test, ret, 0);
+		if (ret)
+			break;
+
+		drm_exec_unlock_obj(&exec, &gobj);
+		ret = drm_exec_lock_obj(&exec, &gobj);
+		drm_exec_retry_on_contention(&exec);
+		KUNIT_EXPECT_EQ(test, ret, 0);
+		if (ret)
+			break;
+	}
+	drm_exec_fini(&exec);
+}
+
+static void test_duplicates(struct kunit *test)
+{
+	struct drm_gem_object gobj = { };
+	struct drm_exec exec;
+	int ret;
+
+	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+
+	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES);
+	drm_exec_until_all_locked(&exec) {
+		ret = drm_exec_lock_obj(&exec, &gobj);
+		drm_exec_retry_on_contention(&exec);
+		KUNIT_EXPECT_EQ(test, ret, 0);
+		if (ret)
+			break;
+
+		ret = drm_exec_lock_obj(&exec, &gobj);
+		drm_exec_retry_on_contention(&exec);
+		KUNIT_EXPECT_EQ(test, ret, 0);
+		if (ret)
+			break;
+	}
+	drm_exec_unlock_obj(&exec, &gobj);
+	drm_exec_fini(&exec);
+}
+
+
+
+static void test_prepare(struct kunit *test)
+{
+	struct drm_gem_object gobj = { };
+	struct drm_exec exec;
+	int ret;
+
+	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec) {
+		ret = drm_exec_prepare_obj(&exec, &gobj, 1);
+		drm_exec_retry_on_contention(&exec);
+		KUNIT_EXPECT_EQ(test, ret, 0);
+		if (ret)
+			break;
+	}
+	drm_exec_fini(&exec);
+}
+
+static void test_prepare_array(struct kunit *test)
+{
+	struct drm_gem_object gobj1 = { };
+	struct drm_gem_object gobj2 = { };
+	struct drm_gem_object *array[] = { &gobj1, &gobj2 };
+	struct drm_exec exec;
+	int ret;
+
+	drm_gem_private_object_init(&dev, &gobj1, PAGE_SIZE);
+	drm_gem_private_object_init(&dev, &gobj2, PAGE_SIZE);
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec)
+		ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
+					     1);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	drm_exec_fini(&exec);
+}
+
+static struct kunit_case drm_exec_tests[] = {
+	KUNIT_CASE(sanitycheck),
+	KUNIT_CASE(test_lock),
+	KUNIT_CASE(test_lock_unlock),
+	KUNIT_CASE(test_duplicates),
+	KUNIT_CASE(test_prepare),
+	KUNIT_CASE(test_prepare_array),
+	{}
+};
+
+static struct kunit_suite drm_exec_test_suite = {
+	.name = "drm_exec",
+	.test_cases = drm_exec_tests,
+};
+
+kunit_test_suite(drm_exec_test_suite);
+
+MODULE_AUTHOR("AMD");
+MODULE_LICENSE("GPL and additional rights");
-- 
2.34.1

