Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6643158B1FF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871BAA4B44;
	Fri,  5 Aug 2022 21:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA60D12BE31;
 Fri,  5 Aug 2022 21:54:44 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id j20so1975534ila.6;
 Fri, 05 Aug 2022 14:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=1y159ZhAT7UwYDHx836NbKz/sH4FGDT0eWA3LtOPK28=;
 b=aZpGJUfkVtvgVQOcA2F7tAMS9ukLmpQUh3ljHkf8mdLln5qcpZB9sw8JktDUOZUfin
 xLOZQjWOpSuON3eyAeAu0CbF/36kkedJfxlVb8EilpP8NgwuOHRUROHCZ53wKAtwcHW8
 Jeh/gyh1fxpZRMsteWVDc3LGjglz0Koq17XZfoMIqYlbNNK6YVVpFJPTcabGrF+zUxOl
 3nDrv09wEZVtUo5DXADv4GIftR4TjYij61T53L1CgmlxQ6y0DTdbSvu7fQFGEmt/3xqZ
 sWUWbDNbwEpc/QRQVCatjqHnf92fBh0/OP4rLiZSj5g5A76MlyvGpiP8ydfP9zWcgESr
 ZWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=1y159ZhAT7UwYDHx836NbKz/sH4FGDT0eWA3LtOPK28=;
 b=s+xlI+iVoyIsdUawJjzH7mMkP3TRjirhhHP4x+6zey4lz7dSGOG6schELxl1H8wL8v
 ARaiTtAPZp/kcyEwhGQk9H1WoFHaUACCuEJOZ3RfGonRm3lkucG5kun9S1LWb8mE/bph
 Crqi6HDCZgOoG5IuMkVWcCMcOfBmozMX45By2VuEZFY59u4W+T1g1HTSaBP5SM7xLchr
 4Hcx01VhoJwDoHDi7X2Ygsa9EjOixNE9LaHpjch619f/9410TEsFEIMLLALLxOX+iFcD
 5oR05GB/nuPX6vVF310WGw61vOkqTBwTf8TejOUcpBq/zmo956HlImhT7d/qxiSkuSPX
 QPbQ==
X-Gm-Message-State: ACgBeo2fsLdFh14kNs0SQLK6pbvCe9P0eP9FieLhlYKve1EARtjVo8Rs
 PxYwsnCbNILZraq8epgTSK4=
X-Google-Smtp-Source: AA6agR7d9MaevNi+wYrhfwwaCK505X33v/tWLIHGXSbOGLIz9cTvnFOlWaEafAqO2toexMXLdgER5Q==
X-Received: by 2002:a05:6e02:194d:b0:2df:8893:90bb with SMTP id
 x13-20020a056e02194d00b002df889390bbmr2260522ilu.242.1659736483850; 
 Fri, 05 Aug 2022 14:54:43 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 21/33] dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes
Date: Fri,  5 Aug 2022 15:53:43 -0600
Message-Id: <20220805215355.3509287-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org
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

  :#> pwd
  /sys/module/test_dynamic_debug/parameters
  :#> ls
  T_disjoint_bits  T_disjoint_names  T_level_names  T_level_num  do_prints
  p_disjoint_bits  p_disjoint_names  p_level_names  p_level_num

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
index ba3882ca3e48..8dd250ad022b 100644
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
+	static struct ddebug_class_param _flags##_model = {		\
+		.bits = &bits_##_model,					\
+		.flags = #_flags,					\
+		.map = &map_##_model,					\
+	};								\
+	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes, &_flags##_model, 0600)
+
+/* numeric input, independent bits */
+enum cat_disjoint_bits {
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
+DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
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
+DD_SYS_WRAP(disjoint_bits, p);
+DD_SYS_WRAP(disjoint_bits, T);
+
+/* symbolic input, independent bits */
+enum cat_disjoint_names { LOW = 11, MID, HI };
+DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
+			"LOW", "MID", "HI");
+DD_SYS_WRAP(disjoint_names, p);
+DD_SYS_WRAP(disjoint_names, T);
+
+/* numeric verbosity, V2 > V1 related */
+enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
+DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
+		       "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
+DD_SYS_WRAP(level_num, p);
+DD_SYS_WRAP(level_num, T);
+
+/* symbolic verbosity */
+enum cat_level_names { L0 = 22, L1, L2, L3, L4, L5, L6, L7 };
+DECLARE_DYNDBG_CLASSMAP(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES, 22,
+			"L0", "L1", "L2", "L3", "L4", "L5", "L6", "L7");
+DD_SYS_WRAP(level_names, p);
+DD_SYS_WRAP(level_names, T);
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
2.37.1

