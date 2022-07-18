Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C512577B4D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E58A9CF4;
	Mon, 18 Jul 2022 06:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BB3A9CC6;
 Mon, 18 Jul 2022 06:38:38 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id n7so8530162ioo.7;
 Sun, 17 Jul 2022 23:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4dDgtpEw8MKBMS31pj2gEm6m+ax4+WVBkcmAcIHRbQQ=;
 b=M+I5IKt/NHWduA4uX6HcHdZUMM7aL66QEQ9JUMrhNOQnXcU7Luu9mqxnD+nEZQFwER
 7CJETz0l1sdEFopbFbgb2kh1qJyVsc8CuHKF4LEu55a0p6pyFvGqAmeWtYtT6YhFYt5o
 /pp+BWmK7O86IG/LRNLh8CGF1/zoY8qiMBKsw5ukZbAtY/d3GRCjpVYkQdywAS1Kx17Z
 xMh3oWrJEuAFb2UkSlbSyQkfaGQapN00/TV5s/Oa2YQVMUnq5kTTsWMMnGH5kG7lH2VI
 QqlXy4b44kPytfonMcelTcqdjs/6UvRnXpW4WYV5w4AGBYHCHvBGwSL8HjtjhXyTaGy2
 OLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4dDgtpEw8MKBMS31pj2gEm6m+ax4+WVBkcmAcIHRbQQ=;
 b=OD6Ed1U3P8KwbgZZ8P42kT8e3OelVA5tRxa7jy7v1WrLryYS7o8lWSaETGnpF8hlmw
 TDUEKQcJoyWpOE8WYOYGEOZ0dJcmNMZZC2ibvDIKhVEO2tx8fRIC8b/OgMqSBckuBGQH
 kMboAhQ7HctuoFTZpMxwpDPGQ06Y8LZLfFkmBYtoJbKlvYQ9vnM08HX7HU1VqNnUg4U5
 dMh85AJR4kJZJWbk5VdQ0dsR/p0qqukuFd9u/H455AV1imsCvKvdbVUBMClNRDjOtEdv
 dA4A5Wi7mNrzZOqUFgjR9mxnnAmFt/UKWnID7yz/F4b+UW316S3Q7Em1zD+zN8uoPtmg
 MvBA==
X-Gm-Message-State: AJIora94A/zxoK4CUx0SjpDZYF2DUK/3bQJaTazmd7YLd1blJI+smKZw
 NsJWunmDqenuOuDdtJLkmtNuw5dl0Pk=
X-Google-Smtp-Source: AGRyM1utggbi9jTJm0AEr8LHih4RXvISMQdr+q/8EkwlAMRaUHMXM8ZzC3yqeUR5RMfGoeN2L/DYTA==
X-Received: by 2002:a05:6638:25c4:b0:341:4c88:bd11 with SMTP id
 u4-20020a05663825c400b003414c88bd11mr7482127jat.190.1658126317725; 
 Sun, 17 Jul 2022 23:38:37 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 17/41] dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes
Date: Mon, 18 Jul 2022 00:36:01 -0600
Message-Id: <20220718063641.9179-18-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Demonstrate use of DECLARE_DYNDBG_CLASSMAP macro, and expose them as
sysfs-nodes for testing.

For each of the 4 class-map-types:

  - declare a class-map of that type,
  - declare the enum corresponding to those class-names
  - share _base across 0..30 range
  - add a __pr_debug_cls() call for each class-name
  - declare 2 sysnodes for each class-map
    for 'p' flag, and future 'T' flag

These declarations create the following sysfs parameter interface:

  :> pwd
  /sys/module/test_dynamic_debug/parameters
  :> ls
  T_disjoint  T_levels  T_symbolic  T_verbosity  do_prints
  p_disjoint  p_levels  p_symbolic  p_verbosity

NOTES:

The local wrapper macro is an api candidate, but there are already too
many parameters.  OTOH, maybe related enum should be in there too,
since it has _base inter-dependencies.

The T_* params control the (future) T flag on the same class'd
pr_debug callsites as their p* counterparts.  Using them will fail,
until the dyndbg-trace patches are added in.

:#> echo 1 > T_disjoint
[   28.792489] dyndbg: disjoint: 0x1 > test_dynamic_debug.T_D2
[   28.793848] dyndbg: query 0: "class D2_CORE +T" mod:*
[   28.795086] dyndbg: split into words: "class" "D2_CORE" "+T"
[   28.796467] dyndbg: op='+'
[   28.797148] dyndbg: unknown flag 'T'
[   28.798021] dyndbg: flags parse failed
[   28.798947] dyndbg: processed 1 queries, with 0 matches, 1 errs
[   28.800378] dyndbg: bit_0: -22 matches on class: D2_CORE -> 0x1
[   28.801959] dyndbg: test_dynamic_debug.T_D2: updated 0x0 -> 0x1
[   28.803974] dyndbg: total matches: -22

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 125 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 110 insertions(+), 15 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index ba3882ca3e48..eac85e4e996a 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -10,57 +10,152 @@
 
 #include <linux/module.h>
 
-static void do_prints(void); /* device under test */
-
-/* run tests by reading or writing sysfs node */
+/* run tests by reading or writing sysfs node: do_prints */
 
+static void do_prints(void); /* device under test */
 static int param_set_do_prints(const char *instr, const struct kernel_param *kp)
 {
 	do_prints();
 	return 0;
 }
-
 static int param_get_do_prints(char *buffer, const struct kernel_param *kp)
 {
 	do_prints();
 	return scnprintf(buffer, PAGE_SIZE, "did do_prints\n");
 }
-
 static const struct kernel_param_ops param_ops_do_prints = {
 	.set = param_set_do_prints,
 	.get = param_get_do_prints,
 };
-
 module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
 
-static void do_alpha(void)
+/*
+ * Using the CLASSMAP api:
+ * - classmaps must have corresponding enum
+ * - enum symbols must match/correlate with class-name strings in the map.
+ * - base must equal enum's 1st value
+ * - multiple maps must set their base to share the 0-30 class_id space !!
+ *   (build-bug-on tips welcome)
+ * Additionally, here:
+ * - tie together sysname, mapname, bitsname, flagsname
+ */
+#define DD_SYS_WRAP(_model, _flags)					\
+	static unsigned long bits_##_model;				\
+	static struct ddebug_classes_bitmap_param _flags##_model = {	\
+		.bits = &bits_##_model,					\
+		.flags = #_flags,					\
+		.map = &map_##_model,					\
+	};								\
+	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes, &_flags##_model, 0600)
+
+/* numeric input, independent bits */
+enum cat_disjoint {
+	D2_CORE = 0,
+	D2_DRIVER,
+	D2_KMS,
+	D2_PRIME,
+	D2_ATOMIC,
+	D2_VBL,
+	D2_STATE,
+	D2_LEASE,
+	D2_DP,
+	D2_DRMRES };
+DECLARE_DYNDBG_CLASSMAP(map_disjoint, DD_CLASS_TYPE_DISJOINT, 0,
+			"D2_CORE",
+			"D2_DRIVER",
+			"D2_KMS",
+			"D2_PRIME",
+			"D2_ATOMIC",
+			"D2_VBL",
+			"D2_STATE",
+			"D2_LEASE",
+			"D2_DP",
+			"D2_DRMRES");
+DD_SYS_WRAP(disjoint, p);
+DD_SYS_WRAP(disjoint, T);
+
+/* symbolic input, independent bits */
+enum cat_symbolic { LOW = 11, MID, HI };
+DECLARE_DYNDBG_CLASSMAP(map_symbolic, DD_CLASS_TYPE_SYMBOLIC, 10,
+			"LOW", "MID", "HI");
+DD_SYS_WRAP(symbolic, p);
+DD_SYS_WRAP(symbolic, T);
+
+/* numeric verbosity, V2 > V1 related */
+enum cat_verbosity { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
+DECLARE_DYNDBG_CLASSMAP(map_verbosity, DD_CLASS_TYPE_VERBOSE, 14,
+		       "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
+DD_SYS_WRAP(verbosity, p);
+DD_SYS_WRAP(verbosity, T);
+
+/* symbolic verbosity */
+enum cat_levels { L0 = 22, L1, L2, L3, L4, L5, L6, L7 };
+DECLARE_DYNDBG_CLASSMAP(map_levels, DD_CLASS_TYPE_LEVELS, 22,
+			"L0", "L1", "L2", "L3", "L4", "L5", "L6", "L7");
+DD_SYS_WRAP(levels, p);
+DD_SYS_WRAP(levels, T);
+
+/* stand-in for all pr_debug etc */
+#define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
+
+static void do_cats(void)
 {
-	pr_debug("do alpha\n");
+	pr_debug("doing categories\n");
+
+	prdbg(LOW);
+	prdbg(MID);
+	prdbg(HI);
+
+	prdbg(D2_CORE);
+	prdbg(D2_DRIVER);
+	prdbg(D2_KMS);
+	prdbg(D2_PRIME);
+	prdbg(D2_ATOMIC);
+	prdbg(D2_VBL);
+	prdbg(D2_STATE);
+	prdbg(D2_LEASE);
+	prdbg(D2_DP);
+	prdbg(D2_DRMRES);
 }
-static void do_beta(void)
+
+static void do_levels(void)
 {
-	pr_debug("do beta\n");
+	pr_debug("doing levels\n");
+
+	prdbg(V1);
+	prdbg(V2);
+	prdbg(V3);
+	prdbg(V4);
+	prdbg(V5);
+	prdbg(V6);
+	prdbg(V7);
+
+	prdbg(L1);
+	prdbg(L2);
+	prdbg(L3);
+	prdbg(L4);
+	prdbg(L5);
+	prdbg(L6);
+	prdbg(L7);
 }
 
 static void do_prints(void)
 {
-	do_alpha();
-	do_beta();
+	do_cats();
+	do_levels();
 }
 
 static int __init test_dynamic_debug_init(void)
 {
 	pr_debug("init start\n");
-
 	do_prints();
-
 	pr_debug("init done\n");
 	return 0;
 }
 
 static void __exit test_dynamic_debug_exit(void)
 {
-	pr_debug("exiting\n");
+	pr_debug("exited\n");
 }
 
 module_init(test_dynamic_debug_init);
-- 
2.36.1

