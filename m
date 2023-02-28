Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB376A546A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 09:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D4910E58A;
	Tue, 28 Feb 2023 08:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8072210E4B7;
 Tue, 28 Feb 2023 08:34:13 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id eg37so36387076edb.12;
 Tue, 28 Feb 2023 00:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGt43u7HoznQ3xRDitEZby9LXDJQuSBDBMZ7DpscYzY=;
 b=ThjAMVz2FYeNO6ZgdAgsDqp5Ze0AMzmcN11Ib36bI8NRTLTxdLpdbA9rqACtRewaCo
 xJotutrIh8sDvOod2s/uBvPSf+7R0OtNeAIiF0YXjrkVHyxvgjBdhYsv3/ApzEtEqedP
 R0yYRbmc8UZGqDN0HlsXrBDXh0jFrQBI66jAn36pJbeJw+PfvAdfM9H20qP3Yb0W1Ejz
 ox243QVqUCGXt7/JRntVREvPdqMHaftBuw+OgOcEFOASf0wP7IDGa1I3xcJN75T3Os47
 e04a+4Yjc73035l0LjSjQuaD9euoxOoXHlB0yLmDb66rzHMAf9uOgbmBNQo4GLjeY2hT
 6RWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGt43u7HoznQ3xRDitEZby9LXDJQuSBDBMZ7DpscYzY=;
 b=pc+FDQIqD2GGeQnwjlZJlwyMMHfS5kDnr68lgbtLrcRXxlA3nTyM+21QOfAD5JPBRn
 NOprFQAZ0+eQ6LtPYW8oLVRmF05jaC8jF0L2b9iy9m+9Q020Xj6hRnsYlVu/SO0pku6C
 1UxMlDdmGjGjifIsCWGu6k5xSrbgE7UgqsBcgh3JtqwSYYp3yQvo7az0MEVzNSLByWh4
 ZpwcS/nLqICRX6aFHiMPFJvthSY3H3W+VUdOyYLBYIaqYqjh9lk8zbE2cC9ZYBXMyPvf
 xDJ+5b2h+8hg/qtXkTEfwnozbY2tMui8kdUZuSUaQsQqZxnIDbsxZMnxF+yKJf7m6JcA
 M1Hw==
X-Gm-Message-State: AO0yUKW4kiLnSzIeIq1ej+02zrngxKmNzggr4aX8Axo8MAcKAMjTc706
 OVCLxoXUsP2rHPjkLd62v1urBSo+sj8=
X-Google-Smtp-Source: AK7set9rIYHwuAO8lGMwj6JDIP/VV1w/xtJlfH0szoO+Mfj+pfFPnpA6H4XYTRdEUAOpOeWSwXf/rQ==
X-Received: by 2002:a17:906:e42:b0:8f7:5038:9896 with SMTP id
 q2-20020a1709060e4200b008f750389896mr1362234eji.70.1677573251998; 
 Tue, 28 Feb 2023 00:34:11 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 ss17-20020a170907039100b008cf6f8798e1sm4296969ejb.54.2023.02.28.00.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 00:34:11 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm: add drm_exec selftests
Date: Tue, 28 Feb 2023 09:33:59 +0100
Message-Id: <20230228083406.1720795-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228083406.1720795-1-christian.koenig@amd.com>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
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
Cc: dakr@redhat.com, arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Largely just the initial skeleton.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/Kconfig               |  1 +
 drivers/gpu/drm/tests/Makefile        |  3 +-
 drivers/gpu/drm/tests/drm_exec_test.c | 73 +++++++++++++++++++++++++++
 3 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tests/drm_exec_test.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 84a5fc28c48d..0c8d8ed69154 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -79,6 +79,7 @@ config DRM_KUNIT_TEST
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
index 000000000000..78eb61eb27cc
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2019 Intel Corporation
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
+static	struct drm_device dev;
+
+static void drm_exec_sanitycheck(struct kunit *test)
+{
+	struct drm_exec exec;
+
+	drm_exec_init(&exec, true);
+	drm_exec_fini(&exec);
+	pr_info("%s - ok!\n", __func__);
+}
+
+static void drm_exec_lock1(struct kunit *test)
+{
+	struct drm_gem_object gobj = { };
+	struct drm_exec exec;
+	int ret;
+
+	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+
+	drm_exec_init(&exec, true);
+	drm_exec_while_not_all_locked(&exec) {
+		ret = drm_exec_prepare_obj(&exec, &gobj, 1);
+		drm_exec_continue_on_contention(&exec);
+		if (ret) {
+			drm_exec_fini(&exec);
+			pr_err("%s - err %d!\n", __func__, ret);
+			return;
+		}
+	}
+	drm_exec_fini(&exec);
+	pr_info("%s - ok!\n", __func__);
+}
+
+static int drm_exec_suite_init(struct kunit_suite *suite)
+{
+	kunit_info(suite, "Testing DRM exec manager\n");
+	return 0;
+}
+
+static struct kunit_case drm_exec_tests[] = {
+	KUNIT_CASE(drm_exec_sanitycheck),
+	KUNIT_CASE(drm_exec_lock1),
+	{}
+};
+
+static struct kunit_suite drm_exec_test_suite = {
+	.name = "drm_exec",
+	.suite_init = drm_exec_suite_init,
+	.test_cases = drm_exec_tests,
+};
+
+kunit_test_suite(drm_exec_test_suite);
+
+MODULE_AUTHOR("AMD");
+MODULE_LICENSE("GPL and additional rights");
-- 
2.34.1

