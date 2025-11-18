Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDCFC6B93C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A52710E534;
	Tue, 18 Nov 2025 20:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cI7M37u6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC06010E52A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:29 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-9490c3ac6ebso74902639f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497169; x=1764101969; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cg7h9DusbTMg0eiL3l2pzfbIMjlxlhfIO+RD1u8ONBY=;
 b=cI7M37u6JcebtSxgOzVJG+/YFxPIotm1LwWyn5SGv59ZUWimGVXF/jRmt5WTwKq5UM
 uCJCbI3D7252yYRJ0la0D8bJ8h/BEzgNjjmGOI4ocEOVBbi1emyH/ZOaOMwNWsC71Zga
 CX6C2PU7MH26sEr4t6KR7QEij+r1irY+3gk/qE3B4AxAt4ShWmDttC5Z17cgwz1OSud0
 xBmr/FLkCOYAQbzCsqfGsUJF9OjKMymqClDQSDYNWxyjmNa4s+UGC1ccZtkIyP+icOqo
 nCA5WZ5kopYK9ozEuKeA6bmUyCVRA3L+c1pS6Abish8LpS2GUsW6hE6X0QNhG28n+XdK
 21UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497169; x=1764101969;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cg7h9DusbTMg0eiL3l2pzfbIMjlxlhfIO+RD1u8ONBY=;
 b=GWsjRCSTSpFlu9KdIoly2QWVlaJFSDiSQQvX/mnLV0f5bA5RuG6jzp0GEBiSWt6xzF
 3skrjWi0HFHduxrFO+RAPoBh60IAFI2w4LP9eDFrd9azD8ducWDQ/udSu5Z+w0zGFDc5
 SDX4G/k8PQeksPa603DklG59mpp2vi/MVEeSG5Lk0KgDMA9mlbZCPlTMsEUKXkMQXUm5
 qPWTs+S82Y4DEpQvKvJ2xDWYmdf7m1s1COtTbTkvrDXMXar45zw6cEn3KfBlp7MBqi5T
 I+uqyJoWu7UWPKNy7OrH2u4VZc1z/6sE72D/Uu1Xlkg67Lu0czIrHf0q/w7vS5OOYCEG
 /VRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxrGKlfx6/hW//q/LmEG5BALTG8ODtWWhYYIHr++GDwUYA3OLVtsgOnsarhEiviTXqdEdTrrOIJQ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzY6z0ByKtNnKdhvfS8Cy9uYF9crwx52aoqsLsnMXSuX5C/Swsz
 Hxj4h+AlPtcsLztj8qiSy9uo9AjYRjDwAUCpPPaM7HbVREgCL48SrHzaG+PeRzCH
X-Gm-Gg: ASbGncuE54r1oXo7kbPFW4utGVvKjeaTRkDi4gwj6r9ITyfnf35oGuKuQdAe2rVG6Au
 lPXSLwMqrZ7+vS2YWHbEH6roh/RCrGnqM6hqsT2GFASnVqjKaNXEky+WCzYG97aT5Sagsy2y173
 aSrwpaD+fYXCQlTOL+XIz4GkLAEQSU2c6sBOlOMSCuVhjRbB7Q0W45wPcFfxMBcMiGOWdv3hOC/
 WhEOSzBm6+DjLQxHNcaHiSaeGmcPUiXRDWODCy4Ca8OuFixHNcCKbrgakoIPIIbDk/4N37TU3nu
 TQNeQ0tAVe/QyPq+4FTRcrW+1ZSaUmka728TuBAxajUZT/9bP19khNbgW6/IPPqVc7b/VVZ+UzD
 VwuAzSTdU1otZLc59+2VNIbGtyxBL4HQ+nJepLB4MWvfiPDOm6PrJnEsfIewGFy7cV4zs47HX5d
 EhUDqD2TBJGJdBpyXUz6yJTEV6XXOnnU0KCGFw4hKXeOIFNLM4nkv3lqgRIvHnZsI2HBg=
X-Google-Smtp-Source: AGHT+IFYu4ACOQpobmsCVZEJwVweKtlcHag/1hGFezFU+uIvfspwhrOJmtaHGMOIf1bEE9oTjX/eGQ==
X-Received: by 2002:a05:6602:2d8c:b0:948:a2aa:edc8 with SMTP id
 ca18e2360f4ac-948e0d43f0cmr2217545739f.4.1763497168927; 
 Tue, 18 Nov 2025 12:19:28 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:28 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v6 25/31] dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to
 API
Date: Tue, 18 Nov 2025 13:18:35 -0700
Message-ID: <20251118201842.1447666-26-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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

move the DYNAMIC_DEBUG_CLASSMAP_PARAM macro from test-dynamic-debug.c into
the header, and refine it, by distinguishing the 2 use cases:

1.DYNAMIC_DEBUG_CLASSMAP_PARAM_REF
    for DRM, to pass in extern __drm_debug by name.
    dyndbg keeps bits in it, so drm can still use it as before

2.DYNAMIC_DEBUG_CLASSMAP_PARAM
    new user (test_dynamic_debug) doesn't need to share state,
    decls a static long unsigned int to store the bitvec.

__DYNAMIC_DEBUG_CLASSMAP_PARAM
   bottom layer - allocate,init a ddebug-class-param, module-param-cb.

Modify ddebug_sync_classbits() argtype deref inside the fn, to give
access to all kp members.

Also add stub macros, clean up and improve comments in test-code, and
add MODULE_DESCRIPTIONs.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
-v10 add stub macros
-v9
 - fixup drm-print.h  add PARAM_REF forwarding macros
   with DYNAMIC_DEBUG_CLASSMAP_PARAM_REF in the API, add DRM_ variant
---
 include/linux/dynamic_debug.h   | 40 ++++++++++++++++++++++
 lib/dynamic_debug.c             | 60 ++++++++++++++++++++++-----------
 lib/test_dynamic_debug.c        | 47 ++++++++++----------------
 lib/test_dynamic_debug_submod.c |  9 ++++-
 4 files changed, 106 insertions(+), 50 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b19c9b1d53b6..b1d11d946780 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -251,6 +251,44 @@ struct _ddebug_class_param {
 		.base = _base						\
 	}
 
+/**
+ * DYNAMIC_DEBUG_CLASSMAP_PARAM - control a ddebug-classmap from a sys-param
+ * @_name:  sysfs node name
+ * @_var:   name of the classmap var defining the controlled classes/bits
+ * @_flags: flags to be toggled, typically just 'p'
+ *
+ * Creates a sysfs-param to control the classes defined by the
+ * exported classmap, with bits 0..N-1 mapped to the classes named.
+ * This version keeps class-state in a private long int.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _var, _flags)		\
+	static unsigned long _name##_bvec;				\
+	__DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _name##_bvec, _var, _flags)
+
+/**
+ * DYNAMIC_DEBUG_CLASSMAP_PARAM_REF - wrap a classmap with a controlling sys-param
+ * @_name:  sysfs node name
+ * @_bits:  name of the module's unsigned long bit-vector, ex: __drm_debug
+ * @_var:   name of the (exported) classmap var defining the classes/bits
+ * @_flags: flags to be toggled, typically just 'p'
+ *
+ * Creates a sysfs-param to control the classes defined by the
+ * exported clasmap, with bits 0..N-1 mapped to the classes named.
+ * This version keeps class-state in user @_bits.  This lets drm check
+ * __drm_debug elsewhere too.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags)	\
+	__DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
+
+#define __DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)	\
+	static struct _ddebug_class_param _name##_##_flags = {		\
+		.bits = &(_bits),					\
+		.flags = #_flags,					\
+		.map = &(_var),						\
+	};								\
+	module_param_cb(_name, &param_ops_dyndbg_classes,		\
+			&_name##_##_flags, 0600)
+
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
 
@@ -423,6 +461,8 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)
 #define DYNAMIC_DEBUG_CLASSMAP_USE(_var)
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _var, _flags)
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(_name, _var, _flags)
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
 #define DYNAMIC_DEBUG_BRANCH(descriptor) false
 #define DECLARE_DYNDBG_CLASSMAP(...)
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 25b3932891e0..69a87eb13262 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -687,6 +687,30 @@ static int ddebug_apply_class_bitmap(const struct _ddebug_class_param *dcp,
 
 #define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
 
+static void ddebug_class_param_clamp_input(unsigned long *inrep, const struct kernel_param *kp)
+{
+	const struct _ddebug_class_param *dcp = kp->arg;
+	const struct _ddebug_class_map *map = dcp->map;
+
+	switch (map->map_type) {
+	case DD_CLASS_TYPE_DISJOINT_BITS:
+		/* expect bits. mask and warn if too many */
+		if (*inrep & ~CLASSMAP_BITMASK(map->length)) {
+			pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
+				KP_NAME(kp), *inrep, CLASSMAP_BITMASK(map->length));
+			*inrep &= CLASSMAP_BITMASK(map->length);
+		}
+		break;
+	case DD_CLASS_TYPE_LEVEL_NUM:
+		/* input is bitpos, of highest verbosity to be enabled */
+		if (*inrep > map->length) {
+			pr_warn("%s: level:%ld exceeds max:%d, clamping\n",
+				KP_NAME(kp), *inrep, map->length);
+			*inrep = map->length;
+		}
+		break;
+	}
+}
 static int param_set_dyndbg_module_classes(const char *instr,
 					   const struct kernel_param *kp,
 					   const char *mod_name)
@@ -705,26 +729,15 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		pr_err("expecting numeric input, not: %s > %s\n", instr, KP_NAME(kp));
 		return -EINVAL;
 	}
+	ddebug_class_param_clamp_input(&inrep, kp);
 
 	switch (map->map_type) {
 	case DD_CLASS_TYPE_DISJOINT_BITS:
-		/* expect bits. mask and warn if too many */
-		if (inrep & ~CLASSMAP_BITMASK(map->length)) {
-			pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
-				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
-			inrep &= CLASSMAP_BITMASK(map->length);
-		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
 		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		/* input is bitpos, of highest verbosity to be enabled */
-		if (inrep > map->length) {
-			pr_warn("%s: level:%ld exceeds max:%d, clamping\n",
-				KP_NAME(kp), inrep, map->length);
-			inrep = map->length;
-		}
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
@@ -1195,15 +1208,24 @@ static const struct proc_ops proc_fops = {
 static void ddebug_sync_classbits(const struct kernel_param *kp, const char *modname)
 {
 	const struct _ddebug_class_param *dcp = kp->arg;
+	unsigned long new_bits;
 
-	/* clamp initial bitvec, mask off hi-bits */
-	if (*dcp->bits & ~CLASSMAP_BITMASK(dcp->map->length)) {
-		*dcp->bits &= CLASSMAP_BITMASK(dcp->map->length);
-		v2pr_info("preset classbits: %lx\n", *dcp->bits);
+	ddebug_class_param_clamp_input(dcp->bits, kp);
+
+	switch (dcp->map->map_type) {
+	case DD_CLASS_TYPE_DISJOINT_BITS:
+		v2pr_info("  %s: classbits: 0x%lx\n", KP_NAME(kp), *dcp->bits);
+		ddebug_apply_class_bitmap(dcp, dcp->bits, 0UL, modname);
+		break;
+	case DD_CLASS_TYPE_LEVEL_NUM:
+		new_bits = CLASSMAP_BITMASK(*dcp->lvl);
+		v2pr_info("  %s: lvl:%ld bits:0x%lx\n", KP_NAME(kp), *dcp->lvl, new_bits);
+		ddebug_apply_class_bitmap(dcp, &new_bits, 0UL, modname);
+		break;
+	default:
+		pr_err("bad map type %d\n", dcp->map->map_type);
+		return;
 	}
-	/* force class'd prdbgs (in USEr module) to match (DEFINEr module) class-param */
-	ddebug_apply_class_bitmap(dcp, dcp->bits, ~0, modname);
-	ddebug_apply_class_bitmap(dcp, dcp->bits, 0, modname);
 }
 
 static void ddebug_match_apply_kparam(const struct kernel_param *kp,
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index fa81177e8089..83c4d571a8c9 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Kernel module for testing dynamic_debug
+ * Kernel module to test/demonstrate dynamic_debug features,
+ * particularly classmaps and their support for subsystems like DRM.
  *
  * Authors:
  *      Jim Cromie	<jim.cromie@gmail.com>
@@ -57,24 +58,6 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
 
 #define CLASSMAP_BITMASK(width, base) (((1UL << (width)) - 1) << (base))
 
-/* sysfs param wrapper, proto-API */
-#define DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, _init)		\
-	static unsigned long bits_##_model = _init;			\
-	static struct _ddebug_class_param _flags##_##_model = {		\
-		.bits = &bits_##_model,					\
-		.flags = #_flags,					\
-		.map = &map_##_model,					\
-	};								\
-	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,	\
-			&_flags##_##_model, 0600)
-#ifdef DEBUG
-#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_model, _flags)		\
-	DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, ~0)
-#else
-#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_model, _flags)		\
-	DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, 0)
-#endif
-
 /*
  * Demonstrate/test DISJOINT & LEVEL typed classmaps with a sys-param.
  *
@@ -105,12 +88,15 @@ enum cat_disjoint_bits {
 /* numeric verbosity, V2 > V1 related.  V0 is > D2_DRMRES */
 enum cat_level_num { V0 = 16, V1, V2, V3, V4, V5, V6, V7 };
 
-/* recapitulate DRM's multi-classmap setup */
+/*
+ * use/demonstrate multi-module-group classmaps, as for DRM
+ */
 #if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
 /*
- * In single user, or parent / coordinator (drm.ko) modules, define
- * classmaps on the client enums above, and then declares the PARAMS
- * ref'g the classmaps.  Each is exported.
+ * For module-groups of 1+, define classmaps with names (stringified
+ * enum-symbols) copied from above. 1-to-1 mapping is recommended.
+ * The classmap is exported, so that other modules in the group can
+ * link to it and control their prdbgs.
  */
 DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
 			      D2_CORE,
@@ -129,11 +115,13 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 			      V0, "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
 
 /*
- * now add the sysfs-params
+ * for use-cases that want it, provide a sysfs-param to set the
+ * classes in the classmap.  It is at this interface where the
+ * "v3>v2" property is applied to DD_CLASS_TYPE_LEVEL_NUM inputs.
  */
 
-DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
-DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
+DYNAMIC_DEBUG_CLASSMAP_PARAM(p_disjoint_bits,	map_disjoint_bits, p);
+DYNAMIC_DEBUG_CLASSMAP_PARAM(p_level_num,	map_level_num, p);
 
 #ifdef FORCE_CLASSID_CONFLICT
 /*
@@ -144,12 +132,10 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE")
 #endif
 
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
-
 /*
- * in submod/drm-drivers, use the classmaps defined in top/parent
- * module above.
+ * the +1 members of a multi-module group refer to the classmap
+ * DEFINEd (and exported) above.
  */
-
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
 DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
 
@@ -224,6 +210,7 @@ static void __exit test_dynamic_debug_exit(void)
 module_init(test_dynamic_debug_init);
 module_exit(test_dynamic_debug_exit);
 
+MODULE_DESCRIPTION("test/demonstrate dynamic-debug features");
 MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
 MODULE_DESCRIPTION("Kernel module for testing dynamic_debug");
 MODULE_LICENSE("GPL");
diff --git a/lib/test_dynamic_debug_submod.c b/lib/test_dynamic_debug_submod.c
index 672aabf40160..3adf3925fb86 100644
--- a/lib/test_dynamic_debug_submod.c
+++ b/lib/test_dynamic_debug_submod.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Kernel module for testing dynamic_debug
+ * Kernel module to test/demonstrate dynamic_debug features,
+ * particularly classmaps and their support for subsystems, like DRM,
+ * which defines its drm_debug classmap in drm module, and uses it in
+ * helpers & drivers.
  *
  * Authors:
  *      Jim Cromie	<jim.cromie@gmail.com>
@@ -12,3 +15,7 @@
  */
 #define TEST_DYNAMIC_DEBUG_SUBMOD
 #include "test_dynamic_debug.c"
+
+MODULE_DESCRIPTION("test/demonstrate dynamic-debug subsystem support");
+MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.51.1

