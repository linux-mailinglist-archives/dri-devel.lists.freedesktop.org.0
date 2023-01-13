Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB0D66A33B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5C410EAF2;
	Fri, 13 Jan 2023 19:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3AE10EADF;
 Fri, 13 Jan 2023 19:30:59 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id v6so1707600ilq.3;
 Fri, 13 Jan 2023 11:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oflCfmI+To4S37iZ6t08kU0uJ39RtZq/82Mw2ARcM4o=;
 b=boR7+PhjjreSbcb2CFMZ8IGN4V1ff1LGHcDj/cYpWNrXNK+1kEtpRjBfDvMJEgWp3X
 TOs7VlqymYk/vX9zrTZvF9TMgdL6ASgebePP2TThFG3nrUtkdttP9gOiiyox4gFSfmxf
 npzxy4DPSUFSRkh/nFvDWxgPLvhBfbFV/FoOuG41AJdtv86TJhQ43jBiK8RsZhv31tZM
 BN3qHsBxiSif7yHeryIuD8J0aN9K+z8XTpyuU/vnupaqz63HRshjgh/eInP2RqfzztjI
 EIpS8acbttsYtqTF14QoH39rSELMU/mEmNfMES9CC0P59JvgHBtxyyquCaOIPF60e/V1
 H7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oflCfmI+To4S37iZ6t08kU0uJ39RtZq/82Mw2ARcM4o=;
 b=qwnVYHUrI0NUFZ0Uw+Kd4GzV5oYwBR0pTzLB75AluUq6TXq0zfyhJw85qKmYax158z
 QWwX8/cnHzZMjYNzMw2jFdqbWx6WFpqWIlmGwlZUXXQM9F9I0UMahcu6vCZBZYKmwosV
 8X24ctmr1cB+JFWGbpmMnLYE0WTwtnPbJEspCWJXphgyXzAg5p684KagIUwCfNghamdj
 JHHmj2k/pcNAn9Y8P76Sq0LPlTOQfScqQuX0iVNyGQ6UVDpOtCfrdLcl/C8FuGEa5CcA
 PeArbFf5b8YSrHZrS0kfxkt20wCSCdbmkHQF3/Bp2+2uD1fyyGMHTVzk8ju6weyXKgGh
 UgYw==
X-Gm-Message-State: AFqh2kqlIsgZUTb/AcCMKIStDY5zu1MNkU7lMguzs6PUkn9CU7EVqW2D
 SmLQWWOGBBYdGdyp0xVFJSY=
X-Google-Smtp-Source: AMrXdXvkUeNjsRv+x3kOF1bN+++9C2WbmGJXER7bc6ntCQtuKLR6ABMmuBJO8/FkGaZwdYy+rP4ZfQ==
X-Received: by 2002:a05:6e02:108:b0:30c:5c54:c264 with SMTP id
 t8-20020a056e02010800b0030c5c54c264mr29478009ilm.13.1673638258905; 
 Fri, 13 Jan 2023 11:30:58 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:30:58 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 15/20] test-dyndbg: build test_dynamic_debug_submod
Date: Fri, 13 Jan 2023 12:30:11 -0700
Message-Id: <20230113193016.749791-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113193016.749791-1-jim.cromie@gmail.com>
References: <20230113193016.749791-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CONFIG_DRM_USE_DYNAMIC_DEBUG=y has a regression; drm subsystem
modules, which depend upon drm.ko and use the drm.debug API, do not
get enabled when __drm_debug is set by `modprobe drm debug=0x1f`.

With =N, __drm_debug is checked before logging the msg, so the
end-of-modprobe debug=$init affected all later checks.  But with =y,
each run-time check is replaced by a static-key that is set at
end-of-modprobe.

This creates a chicken-egg dependency; i915 must be modprobed before
its drm.debugs are enabled, but drm.ko (and __drm_debug=$init) must be
done before modprobe i915, so its callsites arent there yet to be
enabled.

The WIP-fix is to split DECLARE_DYNDBG_CLASSMAP to:

DYNDBG_CLASSMAP_DEFINE - invoked in 'parent'
DYNDBG_CLASSMAP_USE - invoked in dependent, to USE the exported definition

To prove the fix w/o involving DRM, we need 2 modules, one dependent
on the other.  Add test_dynamic_debug_submod.ko, which _USEs the
classmaps _exported by test_dynamic_debug.ko

To keep code to a minimum, test_dynamic_debug.c ifdefs on
TEST_DYNAMIC_DEBUG_SUBMOD to build either parent or dependent, with
either DYNDBG_CLASSMAP_DEFINE or DYNDBG_CLASSMAP_USE blocks.

So test_dynamic_debug_submod.c is just 2 lines: include parent after
defining SUBMOD.  This also gives the 2 modules identical logging
behavior as a baseline.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/Makefile                    |  3 +-
 lib/test_dynamic_debug.c        | 50 ++++++++++++++++++++++++++++-----
 lib/test_dynamic_debug_submod.c | 10 +++++++
 3 files changed, 55 insertions(+), 8 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c

diff --git a/lib/Makefile b/lib/Makefile
index 59bd7c2f793a..0f04c59bdc8e 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -78,7 +78,7 @@ obj-$(CONFIG_TEST_SORT) += test_sort.o
 obj-$(CONFIG_TEST_USER_COPY) += test_user_copy.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
-obj-$(CONFIG_TEST_DYNAMIC_DEBUG) += test_dynamic_debug.o
+obj-$(CONFIG_TEST_DYNAMIC_DEBUG) += test_dynamic_debug.o test_dynamic_debug_submod.o
 obj-$(CONFIG_TEST_PRINTF) += test_printf.o
 obj-$(CONFIG_TEST_SCANF) += test_scanf.o
 obj-$(CONFIG_TEST_BITMAP) += test_bitmap.o
@@ -100,6 +100,7 @@ obj-$(CONFIG_KPROBES_SANITY_TEST) += test_kprobes.o
 obj-$(CONFIG_TEST_REF_TRACKER) += test_ref_tracker.o
 CFLAGS_test_fprobe.o += $(CC_FLAGS_FTRACE)
 obj-$(CONFIG_FPROBE_SANITY_TEST) += test_fprobe.o
+
 #
 # CFLAGS for compiling floating point code inside the kernel. x86/Makefile turns
 # off the generation of FPU/SSE* instructions for kernel proper but FPU_FLAGS
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index e678884066bf..39d4f63cade1 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -6,7 +6,11 @@
  *      Jim Cromie	<jim.cromie@gmail.com>
  */
 
-#define pr_fmt(fmt) "test_dd: " fmt
+#if defined(TEST_DYNAMIC_DEBUG_SUBMOD)
+  #define pr_fmt(fmt) "test_dd_submod: " fmt
+#else
+  #define pr_fmt(fmt) "test_dd: " fmt
+#endif
 
 #define DEBUG /* enable all prdbgs (plain & class'd) at compiletime */
 
@@ -49,6 +53,13 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
 	};								\
 	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes, &_flags##_model, 0600)
 
+/*
+ * dynamic-debug imitates drm.debug model's use of enums (DRM_UT_CORE
+ * etc) to define it's classes/categories.  dyndbg allows class-id's
+ * 0..62, reserving 63 for plain old (non-class'd) prdbgs.  A module
+ * can define multiple classmaps, as long as they share the range.
+ */
+
 /* numeric input, independent bits */
 enum cat_disjoint_bits {
 	D2_CORE = 0,
@@ -61,7 +72,36 @@ enum cat_disjoint_bits {
 	D2_LEASE,
 	D2_DP,
 	D2_DRMRES };
+
+/* symbolic input, independent bits */
+enum cat_disjoint_names { LOW = 10, MID, HI };
+
+/* numeric verbosity, V2 > V1 related */
+enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
+
+/* symbolic verbosity */
+enum cat_level_names { L0 = 22, L1, L2, L3, L4, L5, L6, L7 };
+
+#if defined(TEST_DYNAMIC_DEBUG_SUBMOD)
+
+/* use the classmaps defined in 'parent' module below */
+DYNDBG_CLASSMAP_USE(map_disjoint_bits);
+DYNDBG_CLASSMAP_USE(map_disjoint_names);
+DYNDBG_CLASSMAP_USE(map_level_num);
+DYNDBG_CLASSMAP_USE(map_level_names);
+
+#else
+
+/*
+ * parent module, define a classmap of each of 4 types.
+ * enum values are class-ids
+ * enum symbols are stringified, used as classnames
+ * param bits are mapped in order: 0..N
+ * (a straight, obvious, linear map is encouraged)
+ */
+
 DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
+		       /* bits 0..N of param are mapped to these class-ids */
 		       D2_CORE,
 		       D2_DRIVER,
 		       D2_KMS,
@@ -75,27 +115,23 @@ DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
 DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
-/* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 10, MID, HI };
 DYNDBG_CLASSMAP_DEFINE(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES,
 		       LOW, MID, HI);
 DD_SYS_WRAP(disjoint_names, p);
 DD_SYS_WRAP(disjoint_names, T);
 
-/* numeric verbosity, V2 > V1 related */
-enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
 DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 		       V0, V1, V2, V3, V4, V5, V6, V7);
 DD_SYS_WRAP(level_num, p);
 DD_SYS_WRAP(level_num, T);
 
-/* symbolic verbosity */
-enum cat_level_names { L0 = 22, L1, L2, L3, L4, L5, L6, L7 };
 DYNDBG_CLASSMAP_DEFINE(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES,
 		       L0, L1, L2, L3, L4, L5, L6, L7);
 DD_SYS_WRAP(level_names, p);
 DD_SYS_WRAP(level_names, T);
 
+#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
 
diff --git a/lib/test_dynamic_debug_submod.c b/lib/test_dynamic_debug_submod.c
new file mode 100644
index 000000000000..f4ee7a6d6989
--- /dev/null
+++ b/lib/test_dynamic_debug_submod.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Kernel module for testing dynamic_debug
+ *
+ * Authors:
+ *      Jim Cromie	<jim.cromie@gmail.com>
+ */
+
+#define TEST_DYNAMIC_DEBUG_SUBMOD
+#include "test_dynamic_debug.c"
-- 
2.39.0

