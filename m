Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7E52944C
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8059410EA4F;
	Mon, 16 May 2022 22:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FDC10EDA4;
 Mon, 16 May 2022 22:57:18 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id i15so1654318ilk.5;
 Mon, 16 May 2022 15:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4+OOX1OvjkZsN3TSD9RgwwVgcTBaI2m+uT5AbHUS6m0=;
 b=Fo7YXOf/0vFpkLY8Uk/yY0nT5SmPi5y3dHrHluxiH+jPSSKgG/p1Gz5zK7Vu5n6UxZ
 adpJHsxKhBbt1AKuP/901DivHo+vHYALOYRgk1qIRa516KCkldDX94eJ7bs7maLShCvL
 yXLtI4UQzjqwM/jdu7hPJ/Fa8PKfjUkEUkZVEHTUCxZs7L2OQhpyIvljd/WT3ti+Vcb5
 jIyuq0xWDkawREPHWBdqqDjrcGo4i4IDSorHGgRDzfopEesYDc1Y563hH+6Si+9YntGB
 GOGkbE2mJ32gkdmtkIWrgfkvMltVXBVQh4IvArvSY61UnBULbKT1PiPUYwzrahZpFEuZ
 6aXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4+OOX1OvjkZsN3TSD9RgwwVgcTBaI2m+uT5AbHUS6m0=;
 b=swqHQe8VmJo67EZTcGRZpYKoUeBD7ehO8VOhJ6GYR247HC4ktKKToC/JH9IU9IueO3
 I5EHC78vsUbu9+VFm53cM76dtyqMiunTuCd0TMqZP0Dbef26s7DfMakJGBWO2oXQvbTM
 ynXS85+ITWIBHq7j9hIbvIhyGGYsDeuHO2Xxz7c0p48yMeWB1OgdKpnYkxtiHv/82aeO
 Fdyum3ogzLZkRjwbhGiH14XwS9AsARadTQkJ0QC6PoIsiD1jcgoZhBdXwLDJ02JuhsIl
 yHOicG/KeaEiHs12U32BY/e2m03OdK+OcQprirGeRBC6dFCngqeiR49EZMIBimgEuxSg
 BdjA==
X-Gm-Message-State: AOAM530qzN09Y0JgtnHM7Qhx9DXqPPxWe9m/5VqNz43tE3WgMBf99YfL
 lZRpLrhIDFGuyoosn9Utoe4=
X-Google-Smtp-Source: ABdhPJxiH2HWdFdauTnvGpj4Rme8nnchoUQHFiTC7tx6lbGdrSpdRV5tZOHEmwpDAUNac856y9edUg==
X-Received: by 2002:a05:6e02:1c4a:b0:2d1:183e:4ce0 with SMTP id
 d10-20020a056e021c4a00b002d1183e4ce0mr4908778ilg.150.1652741837929; 
 Mon, 16 May 2022 15:57:17 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:17 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 14/27] dyndbg: add test_dynamic_debug module
Date: Mon, 16 May 2022 16:56:27 -0600
Message-Id: <20220516225640.3102269-15-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Demonstrate dyndbg's "class FOO" and bitmap-to-classes support.  This
support is meant to plug into drm.debug system, and largely replace
the use of drm_debug_enabled(category) with JUMP_LABELs.

Recap:
  #> echo class DRM_UT_CORE +p > /proc/dynamic_debug/control

This is made "safe" because dyndbg skips it for any modules which
don't know that class (havent called dynamic_debug_register_classes).

Other modules may use the same .class_id for a separate classified
debug scheme.

Use the API:

- DYNAMIC_DEBUG_CLASSES(_var, classes), to declare static _var by name
- dynamic_debug_register_classes(_var)
- dynamic_debug_unregister_classes(_var)

Use these 3 times; with base = 0,8,16 respectively, to demonstrate the
segmenting of the module's .class_id range [0..30]

For each of those 3 class-name-sets, add 2 sysfs-node-bitmaps, one
each for p-syslog, and T-tracefs, the latter will work once dyndbg
gets that patchset.

  #> modprobe test_dynamic_debug dyndbg=+pfm
  #> cat /sys/module/test_dynamic_debug/parameters/do_prints
  #> echo class FOO +pf  > /proc/dynamic_debug/control
  #> echo class Foo +pfm > /proc/dynamic_debug/control
  #> cat /sys/module/test_dynamic_debug/parameters/do_prints

RFC:

This use case exposes a weak point in the api; the 2nd query command
given in the dyndbg option will not work like the 1st:

  #> modprobe test_dynamic_debug dyndbg='+pfm; class FOO +pfm'

This is because the option is processed early in module-load, well
before the registration can attach the class-map to the module's
ddebug_table entry.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 MAINTAINERS              |   1 +
 lib/Kconfig.debug        |  11 +++
 lib/Makefile             |   1 +
 lib/test_dynamic_debug.c | 172 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 185 insertions(+)
 create mode 100644 lib/test_dynamic_debug.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e8c52d0192a6..bf615853be47 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6918,6 +6918,7 @@ M:	Jason Baron <jbaron@akamai.com>
 S:	Maintained
 F:	include/linux/dynamic_debug.h
 F:	lib/dynamic_debug.c
+F:	lib/test_dynamic_debug.c
 
 DYNAMIC INTERRUPT MODERATION
 M:	Tal Gilboa <talgi@nvidia.com>
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 075cd25363ac..c88d691d3df1 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2601,6 +2601,17 @@ config TEST_STATIC_KEYS
 
 	  If unsure, say N.
 
+config TEST_DYNAMIC_DEBUG
+	tristate "Test DYNAMIC_DEBUG"
+	depends on m
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
index 6b9ffc1bd1ee..e5727fbbfc7d 100644
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
index 000000000000..65c37ba6c0da
--- /dev/null
+++ b/lib/test_dynamic_debug.c
@@ -0,0 +1,172 @@
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
+int param_set_do_prints(const char *instr, const struct kernel_param *kp)
+{
+	do_prints();
+	return 0;
+}
+EXPORT_SYMBOL(param_set_do_prints);
+
+int param_get_do_prints(char *buffer, const struct kernel_param *kp)
+{
+	do_prints();
+	return scnprintf(buffer, PAGE_SIZE, "did do_prints\n");
+}
+EXPORT_SYMBOL(param_get_do_prints);
+
+const struct kernel_param_ops param_ops_do_prints = {
+	.set = param_set_do_prints,
+	.get = param_get_do_prints,
+};
+EXPORT_SYMBOL(param_ops_do_prints);
+
+module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
+
+/*
+ * Declare 3 groups of classes, with different .class_id[] ranges,
+ * each with 2 sysfs-node bitmaps controlling p,T flags respectively
+ * for those named classes.  This example is rather more involved than
+ * anyone will likely use.
+
+ * The T-bitmap sysfs-node functionality will need a few patches which
+ * add trace-events to dyndbg.
+
+ * Rules:
+ * - enum symbols must match/correlate with class-name strings
+ * - base must equal enum's 1st value
+ */
+
+enum cat1 { FOO, BAR, BUZZ };
+DYNAMIC_DEBUG_CLASSES(ddt_classes1, 0,
+		      "FOO", "BAR", "BUZZ");
+
+unsigned long bits_1p, bits_1t;
+EXPORT_SYMBOL(bits_1p);
+EXPORT_SYMBOL(bits_1t);
+
+static struct ddebug_classes_bitmap_param p1_bitmap = {
+	.bits = &bits_1p,
+	.flags = "p",
+	.map = &ddt_classes1
+};
+module_param_cb(c1_syslog_bits, &param_ops_dyndbg_classes, &p1_bitmap, 0600);
+
+static struct ddebug_classes_bitmap_param t1_bitmap = {
+	.bits = &bits_1t,
+	.flags = "T",
+	.map = &ddt_classes1
+};
+module_param_cb(c1_trace_bits, &param_ops_dyndbg_classes, &t1_bitmap, 0600);
+
+
+enum cat2 { Foo = 8, Bar, Buzz };
+DYNAMIC_DEBUG_CLASSES(ddt_classes2, 8,
+		      "Foo", "Bar", "Buzz");
+
+unsigned long bits_2p, bits_2t;
+EXPORT_SYMBOL(bits_2p);
+EXPORT_SYMBOL(bits_2t);
+
+static struct ddebug_classes_bitmap_param p2_bitmap = {
+	.bits = &bits_2p,
+	.flags = "p",
+	.map = &ddt_classes2
+};
+module_param_cb(c2_syslog_bits, &param_ops_dyndbg_classes, &p2_bitmap, 0600);
+
+static struct ddebug_classes_bitmap_param t2_bitmap = {
+	.bits = &bits_2t,
+	.flags = "T",
+	.map = &ddt_classes2
+};
+module_param_cb(c2_trace_bits, &param_ops_dyndbg_classes, &t2_bitmap, 0600);
+
+
+enum cat3 { bing = 16, bong, boom };
+DYNAMIC_DEBUG_CLASSES(ddt_classes3, 16,
+		      "bing", "bong", "boom");
+
+unsigned long bits_3p, bits_3t;
+EXPORT_SYMBOL(bits_3p);
+EXPORT_SYMBOL(bits_3t);
+
+static struct ddebug_classes_bitmap_param p3_bitmap = {
+	.bits = &bits_3p,
+	.flags = "p",
+	.map = &ddt_classes3
+};
+module_param_cb(c3_syslog_bits, &param_ops_dyndbg_classes, &p3_bitmap, 0600);
+
+static struct ddebug_classes_bitmap_param t3_bitmap = {
+	.bits = &bits_3t,
+	.flags = "T",
+	.map = &ddt_classes3
+};
+module_param_cb(c3_trace_bits, &param_ops_dyndbg_classes, &t3_bitmap, 0600);
+
+static void do_prints(void)
+{
+	/* raw integer classes */
+	__pr_debug_cls(0, "class 0");
+	__pr_debug_cls(1, "class 1");
+	__pr_debug_cls(2, "class 2");
+
+	/* enum ints */
+	__pr_debug_cls(FOO, "class FOO");
+	__pr_debug_cls(BAR, "class BAR");
+	__pr_debug_cls(BUZZ, "class BUZZ");
+
+	__pr_debug_cls(Foo, "class Foo");
+	__pr_debug_cls(Bar, "class Bar");
+	__pr_debug_cls(Buzz, "class Buzz");
+
+	__pr_debug_cls(bing, "class bing");
+	__pr_debug_cls(bong, "class bong");
+	__pr_debug_cls(boom, "class boom");
+}
+
+static int __init test_dynamic_debug_init(void)
+{
+	pr_debug("module-init\n");
+	/*
+	 * these are too late to enable class FOO at module load time:
+	 * #> modprobe test_dynamic_debug dyndbg='class FOO +p'
+	 */
+	dynamic_debug_register_classes(&ddt_classes1);
+	dynamic_debug_register_classes(&ddt_classes2);
+	dynamic_debug_register_classes(&ddt_classes3);
+
+	do_prints();
+
+	pr_debug("module-init done\n");
+	return 0;
+}
+
+static void __exit test_dynamic_debug_exit(void)
+{
+	dynamic_debug_unregister_classes(&ddt_classes1);
+	dynamic_debug_unregister_classes(&ddt_classes2);
+	dynamic_debug_unregister_classes(&ddt_classes3);
+
+	pr_debug("module-exit\n");
+}
+
+module_init(test_dynamic_debug_init);
+module_exit(test_dynamic_debug_exit);
+
+MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.35.3

