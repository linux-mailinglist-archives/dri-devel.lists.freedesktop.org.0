Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB5C924A57
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D339410E6CB;
	Tue,  2 Jul 2024 21:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jzRsNJDd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F9210E6D5;
 Tue,  2 Jul 2024 21:58:33 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7f61549406eso180459539f.1; 
 Tue, 02 Jul 2024 14:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957513; x=1720562313; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+nJakz52Sv/CtSZEYJn6GwOFm1g7btzQOY0AED19SRE=;
 b=jzRsNJDdhABcKcYITSkae3Kf/UKQxVamYC3w6+5uecmSXxC2OJ+xmsQ2fGwpEGkPTT
 OHnGSnRi9IJio0+5+YVkTN4wfgZBBmlyCXkLwuMvMGNhHcdN0W8O46wD7fUXj7FWn1cL
 SN2FDpMAB59qtO1+TQ3t292MC7ssQrXHk/1DwC/Vqdb9W9TU7bgNqnVvIIscWFX15Etz
 cVIi9n5qF7RndstvSO3Y/YeCHikk+IOUYHBI+cm9t/eMuoX3e8Dv4Uy5GJxm31avkD0h
 Cl1z2ZyOAPF8rPHnt5mevSQ6NzG/vmdsUJL4Q/NlDVTeSl/6CCpnzG9l7IfNtgbf22qv
 fXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957513; x=1720562313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+nJakz52Sv/CtSZEYJn6GwOFm1g7btzQOY0AED19SRE=;
 b=SobBEsJvk2KMaApT1T1jIdwxu6YGdyulcBURUacTnpDeHok8hcMrMoRf70bIXEIkMw
 my7Azz0CH3z8TC5+RShKHAXt35lcZcAiKHkeQcNL6timIpVp77P+IXPI9P2/7CviLSOX
 8/tJMZFTnQEMsbUoWKOOLrkFYZxGA/I0wyWb13oSDIIJcN/cUTkIgwyc8eORz/mWEyl6
 V9/BztcRVMsq71+XZPRLOAHVqaBvs+V/1ZuEyg9y+r4JfTvoOmKsgS3bp3URXz3t7H76
 esTbIIWtT8Cn+OFBcApbzI6co1ZGVA6jvkEP+LZBFSjjBNBX5CmiB1Z9MZlwzivatakr
 bbng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGZCBD+YZNaIFACBiAQeMWYq0qGHeYTrD7fPxbHDXbJjme+tKEDtDZoS2NdwkmTBLU1btFLy5rFQylOSucxM8rNs6ecgZhYZ4ZEyL7vpI8x2Mi3eNU/eKCTKyWg/f1JW5xPXQRstxewYSyGPh5Ss8aBYzqQcCKv6UmWKpqb+C5VY7c/seDYKK1VsWxeHEKwQVmLP6IBG0hXx7XxxEiE7HTRIq4L/7wlqBgu4moqSzyHjq3Lzw=
X-Gm-Message-State: AOJu0YyvCsa6gLoYvg/DkUZ/D8eEpr8Bjzs+XRUtkr3OXnnvhnPNZHTT
 +/KvuDFnRQ80X12XJV5ej0STXgPWVlMYbHIIqELcec3rYSX63AZd
X-Google-Smtp-Source: AGHT+IEuZy8Vgv5b+bOzfhyaySOnrkgTu3wLlzeOEen4503I5cIUNiME/kSyynp7tQIoWK1m30ED8g==
X-Received: by 2002:a6b:dd12:0:b0:7f6:1ec3:a107 with SMTP id
 ca18e2360f4ac-7f62ee7a0d7mr1187913439f.18.1719957512586; 
 Tue, 02 Jul 2024 14:58:32 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 15/52] dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP
Date: Tue,  2 Jul 2024 15:57:05 -0600
Message-ID: <20240702215804.2201271-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

DECLARE_DYNDBG_CLASSMAP() has a design error; its usage fails a basic
K&R rule: "define once, refer many times".

It is used across DRM core & drivers, each use re-defines the classmap
understood by that module; and all must match for the modules to
respond together when DRM.debug categories are enabled.  This is
brittle; a maintenance foot-gun.

Worse, it causes the CONFIG_DRM_USE_DYNAMIC_DEBUG=Y regression; 1st
drm.ko loads, and dyndbg initializes its DRM.debug callsites, then a
drm-driver loads, but too late - it missed the DRM.debug enablement.

So replace it with 2 macros:
  DYNDBG_CLASSMAP_DEFINE - invoked once from core - drm.ko
  DYNDBG_CLASSMAP_USE    - from all drm drivers and helpers.

DYNDBG_CLASSMAP_DEFINE: it reuses a renamed DECLARE_DYNDBG_CLASSMAP to
construct the struct classmap variable, but it drops the static
qualifier, and exports it instead.

DYNDBG_CLASSMAP_USE: then refers to the exported var by name:
* used from drivers, helper-mods
* lets us drop the repetitive "classname" args
* fixes 2nd-defn problem
* creates a ddebug_class_user record in new __dyndbg_class_users section
  this allows ddebug_add_module(etal) to handle them per-module.

DECLARE_DYNDBG_CLASSMAP is preserved temporarily, to decouple DRM
adaptation work and avoid compile-errs before its done.  IOW, DRM
gets fixed when they commit the adopt-new-api patches.

The DEFINE,USE distinction, and the separate classmap-use record,
allows dyndbg to initialize the driver's & helper's DRM.debug
callsites separately after each is modprobed.

Basically, the classmap init-scan repeated for classmap-users.

To review, dyndbg's existing __dyndbg_classes[] section does:

. catalogs the classmaps defined by a module (or builtin modules)
. tells dyndbg the module has class'd prdbgs, allowing >control
. DYNDBG_CLASSMAP_DEFINE creates classmaps in this section.

This patch adds __dyndbg_class_users[] section:

. catalogs uses/references to the classmap definitions.
. authorizes dyndbg to >control those class'd prdbgs in ref'g module.
. DYNDBG_CLASSMAP_USE() creates classmap-user records in this new section.

Now ddebug_add_module(etal) can handle classmap-uses similar to (and
after) classmaps; when a dependent module is loaded, if it has
classmap-uses (to a classmap-def in another module), that module's
kernel params are scanned to find if it has a kparam that is wired to
dyndbg's param-ops, and whose classmap is the one being ref'd.

To support this, theres a few data/header changes:

new struct ddebug_class_user
  contains: user-module-name, &classmap-defn
  it records drm-driver's use of a classmap in the section, allowing lookup

struct ddebug_info gets 2 more fields to keep the new section with the others:
  class_users, num_class_users.
  set by dynamic_debug_init() for builtins.
  or by kernel/module/main:load_info() for loadable modules.

vmlinux.lds.h: new BOUNDED_SECTION for __dyndbg_class_users

dynamic_debug.c has 2 changes in ddebug_add_module(), ddebug_change():

ddebug_add_module() already calls ddebug_attach_module_classes()
to handle classmaps DEFINEd by a module, now it also calls
ddebug_attach_user_module_classes() to handle USEd classmaps.  To
avoid this work when possible, 1st scan the module's descriptors and
count the number of class'd pr_debugs.

ddebug_attach_user_module_classes() scans the module's class_users
section, follows the refs to the parent's classmap, and calls
ddebug_apply_params() on each.  It also avoids work by checking the
module's class-ct.

ddebug_apply_params(new fn):

It scans module's/builtin kernel-params, calls ddebug_match_apply_kparam
for each to find the params/sysfs-nodes which may be wired to a classmap.

ddebug_match_apply_kparam(new fn):

1st, it tests the kernel-param.ops is dyndbg's; this guarantees that
the attached arg is a struct ddebug_class_param, which has a ref to
the param's state, and to the classmap defining the param's handling.

2nd, it requires that the classmap ref'd by the kparam is the one
we're called for; modules can use many separate classmaps (as
test_dynamic_debug does).

Then apply the "parent" kparam's setting to the dependent module,
using ddebug_apply_class_bitmap().

ddebug_change(and callees) also gets adjustments:

ddebug_find_valid_class(): This does a search over the module's
classmaps, looking for the class FOO echo'd to >control.  So now it
searches over __dyndbg_class_users[] after __dyndbg_classes[].

ddebug_class_name(): return class-names for defined AND used classes.

test_dynamic_debug.c, test_dynamic_debug_submod.c:

This demonstrates the 2 types of classmaps & sysfs-params, following
the 4-part recipe:

1. define an enum for the classmap: DRM.debug has DRM_UT_{CORE,KMS,...}
   multiple classes must share 0-62 classid space.
2. DYNDBG_CLASSMAP_DEFINE(.. DRM_UT_{CORE,KMS,...})
3. DYNDBG_CLASSMAP_PARAM* (classmap)
4. DYNDBG_CLASSMAP_USE()
   by _submod only, skipping 2,3

Move all the enum declarations together, to better explain how they
share the 0..62 class-id space available to a module (non-overlapping
subranges).

reorg macros 2,3 by name.  This gives a tabular format, making it easy
to see the pattern of repetition, and the points of change.

And extend the test to replicate the 2-module (parent & dependent)
scenario which caused the CONFIG_DRM_USE_DYNAMIC_DEBUG=y regression
seen in drm & drivers.

The _submod.c is a 2-line file: #define _SUBMOD, #include parent.

This gives identical complements of prdbgs in parent & _submod, and
thus identical print behavior when all of: >control, >params, and
parent->_submod propagation are working correctly.

It also puts all the parent/_submod declarations together in the same
source, with the new ifdef _SUBMOD block invoking DYNDBG_CLASSMAP_USE
for the 2 test-interfaces.  I think this is clearer.

These 2 modules are both tristate, allowing 3 super/sub combos: Y/Y,
Y/M, M/M (not N/N).  Y/Y testing exposed a missing __align(8) in the
_METADATA macro, which M/M didn't see because the module-loader memory
placement constrains it instead.

DEBUG details:

``#define DEBUG`` in src enables all pr_debugs after it, including any
class'd pr_debugs; its not necessarily all-or-nothing, unless you do
the define in a header.  Also, the only way to disable a class'd
pr_debug is via the classmap-kparam or using "class foo" in control
queries, to address the classes by name.

NB: this patch ignores a checkpatch do-while warning; which is wrong
for declarative macros like these:

arch/powerpc/platforms/cell/spu_base.c
48:static DEFINE_SPINLOCK(spu_lock);
62:static DEFINE_SPINLOCK(spu_full_list_lock);
63:static DEFINE_MUTEX(spu_full_list_mutex);

Fixes: aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v8 - split drm parts to separate commits.
     preserve DECLARE_DYNDBG_CLASSMAP to decouple DRM, no flag day.
     fixup block comment

v7 - previous submission-blocking bug:

missing __align(8) in DYNAMIC_DEBUG_DECLARE_METADATA on
ddebug_class_user caused corrupt records, but only for builtin
modules; module loader code probably pinned allocations to the right
alignment naturally, hiding the bug for typical builds.

v6- get rid of WARN_ON_ONCE
v?- fix _var expanded 2x in macro
---
 MAINTAINERS                       |   2 +-
 include/asm-generic/vmlinux.lds.h |   1 +
 include/linux/dynamic_debug.h     |  62 ++++++++--
 kernel/module/main.c              |   3 +
 lib/Kconfig.debug                 |  24 +++-
 lib/Makefile                      |   3 +
 lib/dynamic_debug.c               | 184 ++++++++++++++++++++++++++----
 lib/test_dynamic_debug.c          | 111 ++++++++++++------
 lib/test_dynamic_debug_submod.c   |  10 ++
 9 files changed, 332 insertions(+), 68 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 28e20975c26f..c9ed48109ff5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7526,7 +7526,7 @@ M:	Jim Cromie <jim.cromie@gmail.com>
 S:	Maintained
 F:	include/linux/dynamic_debug.h
 F:	lib/dynamic_debug.c
-F:	lib/test_dynamic_debug.c
+F:	lib/test_dynamic_debug*.c
 
 DYNAMIC INTERRUPT MODERATION
 M:	Tal Gilboa <talgi@nvidia.com>
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index f7749d0f2562..f1d8e64b244c 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -365,6 +365,7 @@
 	/* implement dynamic printk debug */				\
 	. = ALIGN(8);							\
 	BOUNDED_SECTION_BY(__dyndbg_classes, ___dyndbg_classes)		\
+	BOUNDED_SECTION_BY(__dyndbg_class_users, ___dyndbg_class_users)	\
 	BOUNDED_SECTION_BY(__dyndbg, ___dyndbg)				\
 	LIKELY_PROFILE()		       				\
 	BRANCH_PROFILE()						\
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dd304e231f08..2c6944c0d6cd 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -72,8 +72,8 @@ enum ddebug_class_map_type {
 };
 
 struct ddebug_class_map {
-	struct module *mod;
-	const char *mod_name;	/* needed for builtins */
+	const struct module *mod;		/* NULL for builtins */
+	const char *mod_name;
 	const char **class_names;
 	const int length;
 	const int base;		/* index of 1st .class_id, allows split/shared space */
@@ -81,11 +81,34 @@ struct ddebug_class_map {
 };
 
 /**
- * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
- * @_var:   a struct ddebug_class_map, passed to module_param_cb
- * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
- * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: class-names used to control class'd prdbgs
+ * DYNDBG_CLASSMAP_DEFINE - define a set of debug-classes used by a module.
+ * @_var:   name of the classmap, exported for other modules coordinated use.
+ * @_type:  enum ddebug_class_map_type, chooses bits/verbose, numeric/names.
+ * @_base:  offset of 1st class-name, used to share 0..62 classid space
+ * @classes: vals are stringified enum-vals, like DRM_UT_*
+ *
+ * Defines and exports a struct ddebug_class_map whose @classes are
+ * used to validate a "class FOO .." >control command on the module
+ */
+#define __DYNDBG_CLASSMAP_DEFINE(_var, _maptype, _base, ...)		\
+	const char *_var##_classnames[] = { __VA_ARGS__ };		\
+	struct ddebug_class_map __aligned(8) __used			\
+		__section("__dyndbg_classes") _var = {			\
+		.mod = THIS_MODULE,					\
+		.mod_name = KBUILD_MODNAME,				\
+		.base = _base,						\
+		.map_type = _maptype,					\
+		.length = ARRAY_SIZE(_var##_classnames),		\
+		.class_names = _var##_classnames,			\
+	}
+#define DYNDBG_CLASSMAP_DEFINE(_var, ...)		\
+	__DYNDBG_CLASSMAP_DEFINE(_var, __VA_ARGS__);	\
+	EXPORT_SYMBOL(_var)
+
+/*
+ * XXX: keep this until DRM adapts to use the DEFINE/USE api, it
+ * differs from __DYNDBG_CLASSMAP_DEFINE only in the static on the
+ * struct decl.
  */
 #define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
@@ -99,12 +122,37 @@ struct ddebug_class_map {
 		.class_names = _var##_classnames,			\
 	}
 
+struct ddebug_class_user {
+	char *user_mod_name;
+	struct ddebug_class_map *map;
+};
+
+/**
+ * DYNDBG_CLASSMAP_USE - refer to a classmap, DEFINEd elsewhere.
+ * @_var: name of the exported classmap var
+ *
+ * This registers a module's use of another module's classmap defn, so
+ * dyndbg can authorize "class DRM_CORE ..." >control commands upon
+ * this module.
+ */
+#define DYNDBG_CLASSMAP_USE(_var)					\
+	DYNDBG_CLASSMAP_USE_(_var, __UNIQUE_ID(ddebug_class_user))
+#define DYNDBG_CLASSMAP_USE_(_var, _uname)				\
+	extern struct ddebug_class_map _var;				\
+	static struct ddebug_class_user __aligned(8) __used		\
+	__section("__dyndbg_class_users") _uname = {			\
+		.user_mod_name = KBUILD_MODNAME,			\
+		.map = &(_var),						\
+	}
+
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
 	struct ddebug_class_map *classes;
+	struct ddebug_class_user *class_users;
 	unsigned int num_descs;
 	unsigned int num_classes;
+	unsigned int num_class_users;
 };
 
 struct ddebug_class_param {
diff --git a/kernel/module/main.c b/kernel/module/main.c
index e1e8a7a9d6c1..9f7ce0f0e6e5 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2217,6 +2217,9 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 	mod->dyndbg_info.classes = section_objs(info, "__dyndbg_classes",
 						sizeof(*mod->dyndbg_info.classes),
 						&mod->dyndbg_info.num_classes);
+	mod->dyndbg_info.class_users = section_objs(info, "__dyndbg_class_users",
+						    sizeof(*mod->dyndbg_info.class_users),
+						   &mod->dyndbg_info.num_class_users);
 #endif
 
 	return 0;
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 291185f54ee4..16288bdaa944 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2797,12 +2797,26 @@ config TEST_STATIC_KEYS
 	  If unsure, say N.
 
 config TEST_DYNAMIC_DEBUG
-	tristate "Test DYNAMIC_DEBUG"
-	depends on DYNAMIC_DEBUG
+	tristate "Build test-dynamic-debug module"
+	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	help
-	  This module registers a tracer callback to count enabled
-	  pr_debugs in a 'do_debugging' function, then alters their
-	  enablements, calls the function, and compares counts.
+	  This module exercises/demonstrates dyndbg's classmap API, by
+	  creating 2 classes: a DISJOINT classmap (supporting DRM.debug)
+	  and a LEVELS/VERBOSE classmap (like verbose2 > verbose1).
+
+	  If unsure, say N.
+
+config TEST_DYNAMIC_DEBUG_SUBMOD
+	tristate "Build test-dynamic-debug submodule"
+	default m
+	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
+	depends on TEST_DYNAMIC_DEBUG
+	help
+	  This sub-module uses a classmap defined and exported by the
+	  parent module, recapitulating drm & driver's shared use of
+	  drm.debug to control enabled debug-categories.
+	  It is tristate, independent of parent, to allow testing all
+	  proper combinations of parent=y/m submod=y/m.
 
 	  If unsure, say N.
 
diff --git a/lib/Makefile b/lib/Makefile
index ffc6b2341b45..d3e6a48f202b 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_TEST_USER_COPY) += test_user_copy.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
 obj-$(CONFIG_TEST_DYNAMIC_DEBUG) += test_dynamic_debug.o
+obj-$(CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD) += test_dynamic_debug_submod.o
 obj-$(CONFIG_TEST_PRINTF) += test_printf.o
 obj-$(CONFIG_TEST_SCANF) += test_scanf.o
 
@@ -240,6 +241,8 @@ obj-$(CONFIG_HAVE_ARCH_TRACEHOOK) += syscall.o
 obj-$(CONFIG_DYNAMIC_DEBUG_CORE) += dynamic_debug.o
 #ensure exported functions have prototypes
 CFLAGS_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+CFLAGS_test_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+CFLAGS_test_dynamic_debug_submod.o := -DDYNAMIC_DEBUG_MODULE
 
 obj-$(CONFIG_SYMBOLIC_ERRNAME) += errname.o
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d5701207febc..9150e0e5145f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -43,13 +43,16 @@ extern struct _ddebug __start___dyndbg[];
 extern struct _ddebug __stop___dyndbg[];
 extern struct ddebug_class_map __start___dyndbg_classes[];
 extern struct ddebug_class_map __stop___dyndbg_classes[];
+extern struct ddebug_class_user __start___dyndbg_class_users[];
+extern struct ddebug_class_user __stop___dyndbg_class_users[];
 
 struct ddebug_table {
 	struct list_head link;
 	const char *mod_name;
 	struct _ddebug *ddebugs;
 	struct ddebug_class_map *classes;
-	unsigned int num_ddebugs, num_classes;
+	struct ddebug_class_user *class_users;
+	unsigned int num_ddebugs, num_classes, num_class_users;
 };
 
 struct ddebug_query {
@@ -148,21 +151,39 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 		  query->first_lineno, query->last_lineno, query->class_string);
 }
 
+#define vpr_dt_info(dt_p, msg_p, ...) ({				\
+	struct ddebug_table const *_dt = dt_p;				\
+	v2pr_info(msg_p " module:%s nd:%d nc:%d nu:%d\n", ##__VA_ARGS__, \
+		  _dt->mod_name, _dt->num_ddebugs, _dt->num_classes,	\
+		  _dt->num_class_users);				\
+	})
+
 #define __outvar /* filled by callee */
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
 							const char *class_string,
 							__outvar int *class_id)
 {
 	struct ddebug_class_map *map;
+	struct ddebug_class_user *cli;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for (i = 0, map = dt->classes; i < dt->num_classes; i++, map++) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
+			vpr_dt_info(dt, "good-class: %s.%s ", map->mod_name, class_string);
 			return map;
 		}
 	}
+	for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++) {
+		idx = match_string(cli->map->class_names, cli->map->length, class_string);
+		if (idx >= 0) {
+			*class_id = idx + cli->map->base;
+			vpr_dt_info(dt, "class-ref: %s.%s ",
+				    cli->user_mod_name, class_string);
+			return cli->map;
+		}
+	}
 	*class_id = -ENOENT;
 	return NULL;
 }
@@ -559,7 +580,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 
 /* handle multiple queries in query string, continue on error, return
    last error or number of matching callsites.  Module name is either
-   in param (for boot arg) or perhaps in query string.
+   in the modname arg (for boot args) or perhaps in query string.
 */
 static int ddebug_exec_queries(char *query, const char *modname)
 {
@@ -688,12 +709,12 @@ static int param_set_dyndbg_module_classes(const char *instr,
 }
 
 /**
- * param_set_dyndbg_classes - class FOO >control
+ * param_set_dyndbg_classes - set all classes in a classmap
  * @instr: string echo>d to sysfs, input depends on map_type
- * @kp:    kp->arg has state: bits/lvl, map, map_type
+ * @kp:    kp->arg has state: bits/lvl, classmap, map_type
  *
- * Enable/disable prdbgs by their class, as given in the arguments to
- * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
+ * For all classes in the classmap, enable/disable them per the input
+ * (depending on map_type).  For LEVEL map-types, enforce relative
  * levels by bitpos.
  *
  * Returns: 0 or <0 if error.
@@ -1038,12 +1059,17 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
 {
 	struct ddebug_class_map *map = dt->classes;
+	struct ddebug_class_user *cli = dt->class_users;
 	int i;
 
 	for (i = 0; i < dt->num_classes; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
+	for (i = 0; i < dt->num_class_users; i++, cli++)
+		if (class_in_range(dp->class_id, cli->map))
+			return cli->map->class_names[dp->class_id - cli->map->base];
+
 	return NULL;
 }
 
@@ -1124,31 +1150,134 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
+static const char * const ddebug_classmap_typenames[] = {
+	"DISJOINT_BITS", "LEVEL_NUM"
+};
+
+#define vpr_cm_info(cm_p, msg_p, ...) ({				\
+	struct ddebug_class_map const *_cm = cm_p;			\
+	v2pr_info(msg_p " module:%s base:%d len:%d type:%s\n", ##__VA_ARGS__, \
+		  _cm->mod_name, _cm->base, _cm->length,		\
+		  ddebug_classmap_typenames[_cm->map_type]);		\
+	})
+
+static void ddebug_sync_classbits(const struct ddebug_class_param *dcp, const char *modname)
+{
+	/* clamp initial bitvec, mask off hi-bits */
+	if (*dcp->bits & ~CLASSMAP_BITMASK(dcp->map->length)) {
+		*dcp->bits &= CLASSMAP_BITMASK(dcp->map->length);
+		v2pr_info("preset classbits: %lx\n", *dcp->bits);
+	}
+	/* force class'd prdbgs (in USEr module) to match (DEFINEr module) class-param */
+	ddebug_apply_class_bitmap(dcp, dcp->bits, ~0, modname);
+	ddebug_apply_class_bitmap(dcp, dcp->bits, 0, modname);
+}
+
+static void ddebug_match_apply_kparam(const struct kernel_param *kp,
+				      const struct ddebug_class_map *map,
+				      const char *modnm)
+{
+	struct ddebug_class_param *dcp;
+
+	if (kp->ops != &param_ops_dyndbg_classes)
+		return;
+
+	dcp = (struct ddebug_class_param *)kp->arg;
+
+	if (map == dcp->map) {
+		v2pr_info("found kp:%s =0x%lx", kp->name, *dcp->bits);
+		vpr_cm_info(map, "mapped to:");
+		ddebug_sync_classbits(dcp, modnm);
+	}
+}
+
+static void ddebug_apply_params(const struct ddebug_class_map *cm, const char *modnm)
+{
+	const struct kernel_param *kp;
+#if IS_ENABLED(CONFIG_MODULES)
+	int i;
+
+	if (cm->mod) {
+		vpr_cm_info(cm, "loaded class:");
+		/* ifdef protects the cm->mod->kp deref */
+		for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
+			ddebug_match_apply_kparam(kp, cm, modnm);
+	}
+#endif
+	if (!cm->mod) {
+		vpr_cm_info(cm, "builtin class:");
+		for (kp = __start___param; kp < __stop___param; kp++)
+			ddebug_match_apply_kparam(kp, cm, modnm);
+	}
+}
+
+/*
+ * Find this module's classmaps in a sub/whole-range of the builtin/
+ * modular classmap vector/section.  Save the start and length of the
+ * subrange at its edges.
+ */
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
 	struct ddebug_class_map *cm;
 	int i, nc = 0;
 
-	/*
-	 * Find this module's classmaps in a subrange/wholerange of
-	 * the builtin/modular classmap vector/section.  Save the start
-	 * and length of the subrange at its edges.
-	 */
-	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
+	for (i = 0, cm = di->classes; i < di->num_classes; i++, cm++) {
 
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
-			if (!nc) {
-				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
+			vpr_cm_info(cm, "classes[%d]:", i);
+			if (!nc++)
 				dt->classes = cm;
-			}
-			nc++;
 		}
 	}
-	if (nc) {
-		dt->num_classes = nc;
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
+	if (!nc)
+		return;
+
+	vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
+	dt->num_classes = nc;
+
+	for (i = 0, cm = dt->classes; i < dt->num_classes; i++, cm++)
+		ddebug_apply_params(cm, cm->mod_name);
+}
+
+/*
+ * propagates class-params thru their classmaps to class-users.  this
+ * means a query against the dt/module, which means it must be on the
+ * list to be seen by ddebug_change.
+ */
+static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
+					      const struct _ddebug_info *di)
+{
+	struct ddebug_class_user *cli;
+	int i, nc = 0;
+
+	/*
+	 * For builtins: scan the array, find start/length of this
+	 * module's refs, save to dt.  For loadables, this is the
+	 * whole array.
+	 */
+	for (i = 0, cli = di->class_users; i < di->num_class_users; i++, cli++) {
+
+		if (WARN_ON_ONCE(!cli || !cli->map || !cli->user_mod_name))
+			continue;
+
+		if (!strcmp(cli->user_mod_name, dt->mod_name)) {
+
+			vpr_cm_info(cli->map, "class_ref[%d] %s -> %s", i,
+				    cli->user_mod_name, cli->map->mod_name);
+			if (!nc++)
+				dt->class_users = cli;
+		}
 	}
+	if (!nc)
+		return;
+
+	dt->num_class_users = nc;
+
+	/* now iterate dt */
+	for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++)
+		ddebug_apply_params(cli->map, cli->user_mod_name);
+
+	vpr_dt_info(dt, "attach-client-module: ");
 }
 
 /*
@@ -1158,6 +1287,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	struct _ddebug *iter;
+	int i, class_ct = 0;
 
 	if (!di->num_descs)
 		return 0;
@@ -1181,13 +1312,20 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
-	if (di->classes && di->num_classes)
+	for (i = 0, iter = di->descs; i < di->num_descs; i++, iter++)
+		if (iter->class_id != _DPRINTK_CLASS_DFLT)
+			class_ct++;
+
+	if (class_ct && di->num_classes)
 		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
+	if (class_ct && di->num_class_users)
+		ddebug_attach_user_module_classes(dt, di);
+
 	vpr_info("%3u debug prints in module %s\n", di->num_descs, modname);
 	return 0;
 }
@@ -1337,8 +1475,10 @@ static int __init dynamic_debug_init(void)
 	struct _ddebug_info di = {
 		.descs = __start___dyndbg,
 		.classes = __start___dyndbg_classes,
+		.class_users = __start___dyndbg_class_users,
 		.num_descs = __stop___dyndbg - __start___dyndbg,
 		.num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
+		.num_class_users = __stop___dyndbg_class_users - __start___dyndbg_class_users,
 	};
 
 #ifdef CONFIG_MODULES
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 9e950a911b6c..ff9b879286d5 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -6,11 +6,15 @@
  *      Jim Cromie	<jim.cromie@gmail.com>
  */
 
-#define pr_fmt(fmt) "test_dd: " fmt
+#if defined(TEST_DYNAMIC_DEBUG_SUBMOD)
+  #define pr_fmt(fmt) "test_dd_submod: " fmt
+#else
+  #define pr_fmt(fmt) "test_dd: " fmt
+#endif
 
 #include <linux/module.h>
 
-/* run tests by reading or writing sysfs node: do_prints */
+/* re-gen output by reading or writing sysfs node: do_prints */
 
 static void do_prints(void); /* device under test */
 static int param_set_do_prints(const char *instr, const struct kernel_param *kp)
@@ -29,24 +33,39 @@ static const struct kernel_param_ops param_ops_do_prints = {
 };
 module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
 
-/*
- * Using the CLASSMAP api:
- * - classmaps must have corresponding enum
- * - enum symbols must match/correlate with class-name strings in the map.
- * - base must equal enum's 1st value
- * - multiple maps must set their base to share the 0-30 class_id space !!
- *   (build-bug-on tips welcome)
- * Additionally, here:
- * - tie together sysname, mapname, bitsname, flagsname
- */
-#define DD_SYS_WRAP(_model, _flags)					\
-	static unsigned long bits_##_model;				\
-	static struct ddebug_class_param _flags##_model = {		\
+#define CLASSMAP_BITMASK(width, base) (((1UL << (width)) - 1) << base)
+
+/* sysfs param wrapper, proto-API */
+#define DYNDBG_CLASSMAP_PARAM_(_model, _flags, _init)			\
+	static unsigned long bits_##_model = _init;			\
+	static struct ddebug_class_param _flags##_##_model = {		\
 		.bits = &bits_##_model,					\
 		.flags = #_flags,					\
 		.map = &map_##_model,					\
 	};								\
-	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes, &_flags##_model, 0600)
+	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,	\
+			&_flags##_##_model, 0600)
+#ifdef DEBUG
+#define DYNDBG_CLASSMAP_PARAM(_model, _flags)  DYNDBG_CLASSMAP_PARAM_(_model, _flags, ~0)
+#else
+#define DYNDBG_CLASSMAP_PARAM(_model, _flags)  DYNDBG_CLASSMAP_PARAM_(_model, _flags, 0)
+#endif
+
+/*
+ * Demonstrate/test all 4 class-typed classmaps with a sys-param.
+ *
+ * Each is 3 part: client-enum decl, _DEFINE, _PARAM.
+ * Declare them in blocks to show patterns of use (repetitions and
+ * changes) within each.
+ *
+ * 1st, dyndbg expects a client-provided enum-type as source of
+ * category/classid truth.  DRM has DRM_UT_<CORE,DRIVER,KMS,etc>.
+ *
+ * Modules with multiple CLASSMAPS must have enums with distinct
+ * value-ranges, arranged below with explicit enum_sym = X inits.
+ *
+ * Declare all 4 enums now, for different types
+ */
 
 /* numeric input, independent bits */
 enum cat_disjoint_bits {
@@ -60,26 +79,51 @@ enum cat_disjoint_bits {
 	D2_LEASE,
 	D2_DP,
 	D2_DRMRES };
-DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"D2_CORE",
-			"D2_DRIVER",
-			"D2_KMS",
-			"D2_PRIME",
-			"D2_ATOMIC",
-			"D2_VBL",
-			"D2_STATE",
-			"D2_LEASE",
-			"D2_DP",
-			"D2_DRMRES");
-DD_SYS_WRAP(disjoint_bits, p);
-DD_SYS_WRAP(disjoint_bits, T);
 
 /* numeric verbosity, V2 > V1 related */
 enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
-DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
-		       "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
-DD_SYS_WRAP(level_num, p);
-DD_SYS_WRAP(level_num, T);
+
+/* recapitulate DRM's parent(drm.ko) <-- _submod(drivers,helpers) */
+#if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
+/*
+ * In single user, or parent / coordinator (drm.ko) modules, define
+ * classmaps on the client enums above, and then declares the PARAMS
+ * ref'g the classmaps.  Each is exported.
+ */
+DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
+		       D2_CORE,
+		       "D2_CORE",
+		       "D2_DRIVER",
+		       "D2_KMS",
+		       "D2_PRIME",
+		       "D2_ATOMIC",
+		       "D2_VBL",
+		       "D2_STATE",
+		       "D2_LEASE",
+		       "D2_DP",
+		       "D2_DRMRES");
+
+DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
+		       V0, "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
+
+/*
+ * now add the sysfs-params
+ */
+
+DYNDBG_CLASSMAP_PARAM(disjoint_bits, p);
+DYNDBG_CLASSMAP_PARAM(level_num, p);
+
+#else /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
+/*
+ * in submod/drm-drivers, use the classmaps defined in top/parent
+ * module above.
+ */
+
+DYNDBG_CLASSMAP_USE(map_disjoint_bits);
+DYNDBG_CLASSMAP_USE(map_level_num);
+
+#endif
 
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
@@ -115,6 +159,7 @@ static void do_levels(void)
 
 static void do_prints(void)
 {
+	pr_debug("do_prints:\n");
 	do_cats();
 	do_levels();
 }
diff --git a/lib/test_dynamic_debug_submod.c b/lib/test_dynamic_debug_submod.c
new file mode 100644
index 000000000000..9a893402ce1a
--- /dev/null
+++ b/lib/test_dynamic_debug_submod.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
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
2.45.2

