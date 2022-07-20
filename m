Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC30057BA29
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEB48F4DA;
	Wed, 20 Jul 2022 15:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C5E8F080;
 Wed, 20 Jul 2022 15:33:06 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id x64so6193380iof.1;
 Wed, 20 Jul 2022 08:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iVb/au/SvTssHWT9OAzWdqi8anWACH4yAl5fHyJFr8E=;
 b=nrhFi1lfMpHjL6e+P67FaOzYM7kNWyUDGIxEPFH/H7KiYcKNy2wfatQqqVhcBK+xiY
 FXIzrM9c+ApTScXhkneE0MR85lso/SS94ZJJrrOupaEY8L4DVxges/n62LAxNuMcUGAh
 H8z63s00a1iFf/TXqF/5gp5aNL/eQebV4oTrLCw6jJNZmGs12eC7PShfD/KZpbrCcBJT
 fmG2p9sg/678ZCKRxfkEs2D06804CzEyQ6so4T2vOSy95xoBxcGpxN9mWEwQDnYmlbwO
 h6hwgLaTHuaLLyZOWHZDdRmMyNLl2xaesLJ13eZX9tRZ9lEF2+JK/V1iZXY4/uuAQU6J
 4+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iVb/au/SvTssHWT9OAzWdqi8anWACH4yAl5fHyJFr8E=;
 b=oFz/TdekTmE7ACa0zwvzHy1c17tKuFQfncCC5CIVpeQAUtu2wWjDItPiSHQ6UWCwoY
 sA7REKk9u29y5aFlAx1+z5UOSiYJUVdA3jGRatAIJcUFp665qpjBVgylp9StQHsQeSwN
 vr9rDOJCFU2lgsR1iIFnCrIqD9psCTf4kS6a/pnYccyR8JhT8ouDsLa5AadRCzZOrSrm
 nfKm5gpruVmNZN1uGo8VJpWEa78ahog4ZTY2uto2rWqQ5JqFz54ct+s6npa5wQVNAo71
 u/nde/TXcYcBe9amFGCTdkbxg7hD1LdLnVgd7ZP09tUWgu3I8qENXEbDrmsFRuZdveTM
 SRFw==
X-Gm-Message-State: AJIora/03bHN1E7uRPZlvsgg9bgFiTObRjmt0v90h7Q/QFZzNpZ4q8L+
 mOV2CJBtmVH3/6OlJt8ZxiCKol74B09J3g==
X-Google-Smtp-Source: AGRyM1vDKY3uiY/A3sRBbc9vD2slPMl+Rgsx1Sl0S+8Ex03RQJZB5Zcb0hJDW1Vu8rg36lJjnqUcvg==
X-Received: by 2002:a05:6638:2105:b0:33f:6b09:948d with SMTP id
 n5-20020a056638210500b0033f6b09948dmr20043806jaj.169.1658331185294; 
 Wed, 20 Jul 2022 08:33:05 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 08/41] dyndbg: add test_dynamic_debug module
Date: Wed, 20 Jul 2022 09:32:00 -0600
Message-Id: <20220720153233.144129-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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

Provide a simple module to allow testing DYNAMIC_DEBUG behavior.  It
calls do_prints() from module-init, and with a sysfs-node.

  dmesg -C
  dmesg -w &
  modprobe test_dynamic_debug dyndbg=+p
  echo 1 > /sys/module/dynamic_debug/parameters/verbose

  cat /sys/module/test_dynamic_debug/parameters/do_prints
  echo module test_dynamic_debug +mftl > /proc/dynamic_debug/control
  echo junk > /sys/module/test_dynamic_debug/parameters/do_prints

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 MAINTAINERS              |  2 ++
 lib/Kconfig.debug        | 10 ++++++
 lib/Makefile             |  1 +
 lib/test_dynamic_debug.c | 70 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 83 insertions(+)
 create mode 100644 lib/test_dynamic_debug.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f679152bdbad..663307268285 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7094,6 +7094,8 @@ M:	Jason Baron <jbaron@akamai.com>
 S:	Maintained
 F:	include/linux/dynamic_debug.h
 F:	lib/dynamic_debug.c
+M:	Jim Cromie <jim.cromie@gmail.com>
+F:	lib/test_dynamic_debug.c
 
 DYNAMIC INTERRUPT MODERATION
 M:	Tal Gilboa <talgi@nvidia.com>
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2e24db4bff19..ca5978e1d18a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2529,6 +2529,16 @@ config TEST_STATIC_KEYS
 
 	  If unsure, say N.
 
+config TEST_DYNAMIC_DEBUG
+	tristate "Test DYNAMIC_DEBUG"
+	depends on DYNAMIC_DEBUG
+	help
+	  This module registers a tracer callback to count enabled
+	  pr_debugs in a 'do_debugging' function, then alters their
+	  enablements, calls the function, and compares counts.
+
+	  If unsure, say N.
+
 config TEST_KMOD
 	tristate "kmod stress tester"
 	depends on m
diff --git a/lib/Makefile b/lib/Makefile
index f99bf61f8bbc..9c316df868de 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_TEST_SORT) += test_sort.o
 obj-$(CONFIG_TEST_USER_COPY) += test_user_copy.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
+obj-$(CONFIG_TEST_DYNAMIC_DEBUG) += test_dynamic_debug.o
 obj-$(CONFIG_TEST_PRINTF) += test_printf.o
 obj-$(CONFIG_TEST_SCANF) += test_scanf.o
 obj-$(CONFIG_TEST_BITMAP) += test_bitmap.o
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
new file mode 100644
index 000000000000..ba3882ca3e48
--- /dev/null
+++ b/lib/test_dynamic_debug.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Kernel module for testing dynamic_debug
+ *
+ * Authors:
+ *      Jim Cromie	<jim.cromie@gmail.com>
+ */
+
+#define pr_fmt(fmt) "test_dd: " fmt
+
+#include <linux/module.h>
+
+static void do_prints(void); /* device under test */
+
+/* run tests by reading or writing sysfs node */
+
+static int param_set_do_prints(const char *instr, const struct kernel_param *kp)
+{
+	do_prints();
+	return 0;
+}
+
+static int param_get_do_prints(char *buffer, const struct kernel_param *kp)
+{
+	do_prints();
+	return scnprintf(buffer, PAGE_SIZE, "did do_prints\n");
+}
+
+static const struct kernel_param_ops param_ops_do_prints = {
+	.set = param_set_do_prints,
+	.get = param_get_do_prints,
+};
+
+module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
+
+static void do_alpha(void)
+{
+	pr_debug("do alpha\n");
+}
+static void do_beta(void)
+{
+	pr_debug("do beta\n");
+}
+
+static void do_prints(void)
+{
+	do_alpha();
+	do_beta();
+}
+
+static int __init test_dynamic_debug_init(void)
+{
+	pr_debug("init start\n");
+
+	do_prints();
+
+	pr_debug("init done\n");
+	return 0;
+}
+
+static void __exit test_dynamic_debug_exit(void)
+{
+	pr_debug("exiting\n");
+}
+
+module_init(test_dynamic_debug_init);
+module_exit(test_dynamic_debug_exit);
+
+MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.36.1

