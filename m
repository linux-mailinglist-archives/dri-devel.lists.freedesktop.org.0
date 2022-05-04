Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0C3519895
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 09:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FDD10EF39;
	Wed,  4 May 2022 07:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4828B10EEEA;
 Wed,  4 May 2022 07:47:45 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id g6so1319318ejw.1;
 Wed, 04 May 2022 00:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E8Wag8mDZiGLpawz9aj7bJEn2udoJx894u4z01hsvFY=;
 b=P33eqN7lPMrsHgVQJjVaNtU9GJzmPX18+nIwRGdiomuesy/+tXPT5wUoDjbUoUqdT/
 TkKFB6Zfi1GkOTH9cOr/B6pUOQjnroMqCylbVTcT7tu9HBntE8QPpQHZ7GFnnwJmGH8e
 LtNKZuB983/TpnulvLRi6eeSelSzxqiI1lmS/xbVJV+tizvy+T8aCEZwSnW49TpcUhwT
 x+2tSYfEkmUWvgvUHwqsdg63Swy7qYi17Lwki5O3NyCTLhpcFuZAnqG4QKA3yHypMlbE
 MfgvrV8QQw6Y9juegO/xInAwaiwo5bEtTwwqWcuv4NVn3Uy9OgodiEIJ3b218MZIulse
 3T2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E8Wag8mDZiGLpawz9aj7bJEn2udoJx894u4z01hsvFY=;
 b=CXur50A7ktzdP3/vwayVJbW72b994tcOgLxS0WFuUVIpV6rKNKWaBwsPMJAw4vIkWx
 Jh0cG2tCMWLsZj7io3piAcU0vT8ee81xX8nc1Q0VYO6Pc7ATKaK9NsyMVIjhn1vCLgpU
 55Y4J6Pm6TZq6OO0ifYOZZ8wI6ZUSX1RxFUpuM1SEFH/X8oTyIrPjRML2iOHI/2qsLHB
 GXpNL/CpysL7LN4msP66CgYRzfxrbNaaqD3fHloARpDnzBNG3oQo9fzSiy/xHTlWJdne
 xomjJ3dKyqVhyZB2dIw4zo9jguAvAAsYSqExCY9pIZ+w6JMvWMpGcS6BNdN5PLTABnqw
 NfUQ==
X-Gm-Message-State: AOAM531jI7a+5Nf853aPj2s2WRLI9g+DWUfc0cug/WpIvN/H/oc4LBqh
 TJYE4RA9no0nTFc7b0VfTpr4/SLiK9U=
X-Google-Smtp-Source: ABdhPJyncruOzGmb1UAib+TJRWyxKHOtvHOGCHDBkXj6r74QqXUjxyPIpksZEl6GUzLG4V/PjJvMnQ==
X-Received: by 2002:a17:907:7e85:b0:6f4:78f1:75b5 with SMTP id
 qb5-20020a1709077e8500b006f478f175b5mr8165910ejc.54.1651650463831; 
 Wed, 04 May 2022 00:47:43 -0700 (PDT)
Received: from able.fritz.box (p57b0b7c9.dip0.t-ipconnect.de. [87.176.183.201])
 by smtp.gmail.com with ESMTPSA id
 jy10-20020a170907762a00b006f3ef214dc2sm5433686ejc.40.2022.05.04.00.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 00:47:43 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: [PATCH 2/8] drm: add drm_exec selftests
Date: Wed,  4 May 2022 09:47:33 +0200
Message-Id: <20220504074739.2231-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504074739.2231-1-christian.koenig@amd.com>
References: <20220504074739.2231-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Largely just the initial skeleton.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/selftests/Makefile            |  2 +-
 .../gpu/drm/selftests/drm_exec_selftests.h    | 10 +++
 drivers/gpu/drm/selftests/test-drm_exec.c     | 74 +++++++++++++++++++
 3 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/selftests/drm_exec_selftests.h
 create mode 100644 drivers/gpu/drm/selftests/test-drm_exec.c

diff --git a/drivers/gpu/drm/selftests/Makefile b/drivers/gpu/drm/selftests/Makefile
index 5ba5f9138c95..0ab4b0f0642f 100644
--- a/drivers/gpu/drm/selftests/Makefile
+++ b/drivers/gpu/drm/selftests/Makefile
@@ -5,4 +5,4 @@ test-drm_modeset-y := test-drm_modeset_common.o test-drm_plane_helper.o \
 		      test-drm_rect.o
 
 obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_modeset.o test-drm_cmdline_parser.o \
-				    test-drm_buddy.o
+				    test-drm_buddy.o test-drm_exec.o
diff --git a/drivers/gpu/drm/selftests/drm_exec_selftests.h b/drivers/gpu/drm/selftests/drm_exec_selftests.h
new file mode 100644
index 000000000000..d88ec9c85fe6
--- /dev/null
+++ b/drivers/gpu/drm/selftests/drm_exec_selftests.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* List each unit test as selftest(name, function)
+ *
+ * The name is used as both an enum and expanded as igt__name to create
+ * a module parameter. It must be unique and legal for a C identifier.
+ *
+ * Tests are executed in order by igt/drm_exec
+ */
+selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
+selftest(exec_lock1, igt_exec_lock1)
diff --git a/drivers/gpu/drm/selftests/test-drm_exec.c b/drivers/gpu/drm/selftests/test-drm_exec.c
new file mode 100644
index 000000000000..de2c3d986828
--- /dev/null
+++ b/drivers/gpu/drm/selftests/test-drm_exec.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#define pr_fmt(fmt) "drm_exec: " fmt
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
+#define TESTS "drm_exec_selftests.h"
+#include "drm_selftest.h"
+
+static	struct drm_device dev;
+
+static int igt_sanitycheck(void *ignored)
+{
+	struct drm_exec exec;
+
+	drm_exec_init(&exec, true);
+	drm_exec_fini(&exec);
+	pr_info("%s - ok!\n", __func__);
+	return 0;
+}
+
+static int igt_exec_lock1(void *ignored)
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
+			return ret;
+		}
+	}
+	drm_exec_fini(&exec);
+	pr_info("%s - ok!\n", __func__);
+	return 0;
+}
+
+#include "drm_selftest.c"
+
+static int __init test_drm_exec_init(void)
+{
+	int err;
+
+	err = run_selftests(selftests, ARRAY_SIZE(selftests), NULL);
+
+	return err > 0 ? 0 : err;
+}
+
+static void __exit test_drm_exec_exit(void)
+{
+}
+
+module_init(test_drm_exec_init);
+module_exit(test_drm_exec_exit);
+
+MODULE_AUTHOR("AMD");
+MODULE_LICENSE("GPL and additional rights");
-- 
2.25.1

