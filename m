Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BB074F02B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 15:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABE810E391;
	Tue, 11 Jul 2023 13:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9728C10E38C;
 Tue, 11 Jul 2023 13:31:28 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51e5d9e20ecso2263417a12.1; 
 Tue, 11 Jul 2023 06:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689082286; x=1691674286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=k+gZxYEvZVIU5Vbs9CccEUACscxkodxKZ3/RmKF+aIU=;
 b=WCsHom6q9iZdHXQJEndNU70dTSzYAqqtT9pHjg+PByP7Wn0yJ4vy4Be3kzST5ZRJh/
 B+CRhxC19hRvDZu/yh6UAbqNM8BU8Kp2wNm1UN2cdhLfJWXWrEy81tir17+ePvW5L00B
 J2I0I+693C9niW2WNoFCbgDaA5isJsLAex3jtznghZugBRc/8pTZHWWOeBfl5626zlYi
 gCLyLKU1BShMdjNm/VYtocGjOcsAtKUqb41NXGOSAVe+7FaaoSYfoj2TArgw/i1BOZD/
 2dultnBQ+/SR9lJAqt6On5e+aLG57yPjwIvrCxA7K0FJXFio+A0OIcgSe/npe3vSikRb
 JNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689082286; x=1691674286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k+gZxYEvZVIU5Vbs9CccEUACscxkodxKZ3/RmKF+aIU=;
 b=W6rj55yR9hFn9f7Xmu8d15LxZ9EFCN4xxDThNXtdxlf9Y/2/PME7sCHNeI+71erSfj
 Dmxi6PchKLg3XcI95bV4ct8Dm1DSJthZBXQo3bPsn97is9T1douh2AjgwF13SNmTdPqQ
 FE713PK/CD43m536w0ze37yaTVFqm9W8EqY/fsMkjT06Zp/IqmUIOaiKWetV4A1aO/A+
 ap9Tg4VYMGqoQSGshdk98HW3CmI+PQKdrzlC2ytSDo+DLs8qy/jLiyUyDO6jUIBig52M
 /C/m6HNsCu8LkN+V4jwtJf5sApuW7sTMx45R8zacr6NiQZbSYVJqXVBBrGmOAH7PvnIG
 UZdw==
X-Gm-Message-State: ABy/qLan7dshN9tjT2IU+KfIMKy7BsSmNzmwCLR05Tkzi698scV+NjCX
 FnzjcvjsL5codz/Yp+aR8VI=
X-Google-Smtp-Source: APBJJlFy0QTh1OkB2fDCIPB7fudnIm5DakhaFRxxh45ppKe15Ul8jovyp5ynVo7QaBeXbN+9p4m8qw==
X-Received: by 2002:a17:906:d7b1:b0:98e:1b9b:aef7 with SMTP id
 pk17-20020a170906d7b100b0098e1b9baef7mr13215029ejb.64.1689082286482; 
 Tue, 11 Jul 2023 06:31:26 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:154b:c600:448d:6e36:e62e:af18])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a1709060d9b00b009932337747esm1176967eji.86.2023.07.11.06.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 06:31:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: alexdeucher@gmail.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm: add drm_exec selftests v4
Date: Tue, 11 Jul 2023 15:31:18 +0200
Message-Id: <20230711133122.3710-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711133122.3710-1-christian.koenig@amd.com>
References: <20230711133122.3710-1-christian.koenig@amd.com>
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
index c0b4063a3ee6..22c1ba9ea28c 100644
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

