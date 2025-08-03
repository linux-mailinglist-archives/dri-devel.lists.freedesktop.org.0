Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ADEB191E3
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA9B10E4B7;
	Sun,  3 Aug 2025 03:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fRpyZbj7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3630010E4B1;
 Sun,  3 Aug 2025 03:59:03 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3e3ff43383fso24795645ab.0; 
 Sat, 02 Aug 2025 20:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193542; x=1754798342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jpDECMN/XR0FZhB3ZVOYTjHABOqLofF6ypEtWrGfFSg=;
 b=fRpyZbj7Dh7FXQaTFlELv19Nkt94YHv35f16TO4UGjdmWCcb7nq5rdweDIY+V5KJSJ
 M2GOxvcSCkjo7o+k/ML5uFLKLusZPdQGS7Ud1xu5QIXNLhqtJ1tEBvtraGyMQmJU5hsf
 3QCsDqfT0c9B88Vyn/6g2uh0ZOUz74zX7SRg9Bo9uNWv8a6vgOsEnyYLfjYrB9crln5C
 gu7sbCUUghTb9ocu5/HigvBA6oFmtAgDeGgEB56CqkRQFVk6Y4VLpJt6E1cnf//EhNmD
 p08C7LRdSX7b/KiUFfiNb1r5dmouUXiLYEoTgbN+tJl+aw2ZmfuEl8cSWfLgBKOxSjOn
 6ZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193542; x=1754798342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jpDECMN/XR0FZhB3ZVOYTjHABOqLofF6ypEtWrGfFSg=;
 b=RhwieH/SSL9M2s2qEcatUz5hdidk+FNAaBBask87NdZMk31r883ks7WqPy12tSKwJZ
 977eNlfzPxLo0s1Pu1gcStc3WNMWO3W8NYZL6WZnrjl4Lq4FRdFiwsuZhghvl7Okb0rr
 ZVFISietjWRhOmEzi7wVV2Fip2shvNHUCUbFsIaMFc4vYXDkzkA9FjPyenZVRmW1ybX2
 EEqRFbaTUi1/eanPhHdZ7OUM7rNWEi25p7ra59hhwpr2kO372Y+nXvrDZHv9MyRIbGrO
 dVRYJqhMfX/geNm3JrNNxdkkGmIZB4rKt9Uwwiy6UXq2JUP0bTyJtn4l/2l8MBz1cnXG
 xvtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ3BlvcylRbsbxS8t0I5iS1wZWenBohVLz6+7fVTeR+Wo3/Cu4riWsRJYkzb9wMfjt0urw2h9FeynR@lists.freedesktop.org,
 AJvYcCVnKufpww4zq05lFoheYNwV7eWFB8C7DPARulhkIs1QO9+bOi89SlHv1Nr+PREZBYXSz9p4OLfs@lists.freedesktop.org,
 AJvYcCWBH6IzGd3tsKnDnW6c4m5tmefUcY5uciVtj7H18Rc5yNPN+6BkQQ5YY7ezXrQpMOmVk3+bNry3H950R/yTVw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRD99T0N2PA5T9tkXtzrv6i+rMeJNQzBX6pQ/yVSFDp4oevJ6/
 oSUqPoSZwkb+6MsCVXchuRFck70PNiAw2vIkI+QW0xYbtVrLIDS3TI0m
X-Gm-Gg: ASbGncuUxfht3H5lbF6lTnKynjgcP5f9rAQOBKnDowNfDXBYX077yMMUurF30JLGAb5
 RD2f5yxwRW4icsQS8sKBLzIN7yFNvvNnZcIAvZLx/krW8mX6HzBleTUS4/5BT6w1XY/ijA4gd6v
 66244+FdQVUFYN62wVui6dzlSywhmKklilHeOM6Ti56JNlkex9KudtRWVrHe5AUQ0q8CU2YRjBs
 jW8CCPRCwTFyrmP5PyISa3VlDLjVNKaMRkEi/HBzM7t0/rHLFpyHWtVQymL//875hYD+H7/G+r8
 tkXoM6J3IjY4nnxKl5J4F5TS21/MlGt+7+PimUnyipNfROYPwsKgOnrr1sROQz+y784Rygz6FZ+
 9QOp6DfCAZhKTGfp/6Yz2okXRhtbZM8i6JRyGkOUpmVOQYvnEjfM2XzvK/rBH1sZ3NscChPJelW
 U4vw==
X-Google-Smtp-Source: AGHT+IEWS1QJ17M7yMR5nyYeJ7d4hKGsEyPwEJ84vqEYgD3f99tTqxTvKRmLupaUsp2IAfhvoN4xiQ==
X-Received: by 2002:a92:d30c:0:b0:3e3:f914:d774 with SMTP id
 e9e14a558f8ab-3e4161b2256mr60925185ab.17.1754193541865; 
 Sat, 02 Aug 2025 20:59:01 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:01 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com,
 linux-doc@vger.kernel.org
Subject: [PATCH v4 19/58] dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
Date: Sat,  2 Aug 2025 21:57:37 -0600
Message-ID: <20250803035816.603405-20-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

When DRM_USE_DYNAMIC_DEBUG=y, it is used across DRM core & drivers;
each invocation allocates/inits the classmap understood by that
module.  All must match for the modules to respond together when
DRM.debug categories are enabled.  This is brittle; a maintenance
foot-gun.

Further, its culpable in the CONFIG_DRM_USE_DYNAMIC_DEBUG=Y
regression; its use in both core & drivers obfuscates the 2 roles,
resulting in incomplete initialization when modprobing drivers:

1st drm.ko loads, and dyndbg initializes its DRM.debug callsites, then
a drm-driver loads, but too late for the DRM.debug enablement.

So retire it, replace with 2 macros:
  DYNAMIC_DEBUG_CLASSMAP_DEFINE - invoked once from core - drm.ko
  DYNAMIC_DEBUG_CLASSMAP_USE    - from all drm drivers and helpers.

DYNAMIC_DEBUG_CLASSMAP_DEFINE: this reworks DECLARE_DYNDBG_CLASSMAP,
by dropping the static qualifier on the classmap, and exporting it
instead.

DYNAMIC_DEBUG_CLASSMAP_USE: then refers to the exported var by name:
  used from drivers, helper-mods
  lets us drop the repetitive "classname" declarations
  fixes 2nd-defn problem
  creates a ddebug_class_user record in new __dyndbg_class_users section
  new section is scanned "differently"

DECLARE_DYNDBG_CLASSMAP is preserved temporarily, to decouple DRM
adaptation work and avoid compile-errs before its done.  IOW, DRM gets
these fixes when they commit the adopt-new-api patches.

The DEFINE,USE distinction, and the separate classmap-use record,
allows dyndbg to initialize the driver's & helper's DRM.debug
callsites separately after each is modprobed.

Basically, the classmap init-scan is repeated for classmap-users.

To review, dyndbg's existing __dyndbg_classes[] section does:

. catalogs the module's classmaps
. tells dyndbg about them, allowing >control
. DYNAMIC_DEBUG_CLASSMAP_DEFINE creates section records.
. we rename it to: __dyndbg_class_maps[]

Then this patch adds __dyndbg_class_users[] section:

. catalogs users of classmap definitions from elsewhere
. authorizes dyndbg to >control user's class'd prdbgs
. DYNAMIC_DEBUG_CLASSMAP_USE() creates section records.

Now ddebug_add_module(etal) can handle classmap-uses similar to (and
after) classmaps; when a dependent module is loaded, if it has
classmap-uses (to a classmap-def in another module), that module's
kernel params are scanned to find if it has a kparam that is wired to
dyndbg's param-ops, and whose classmap is the one being ref'd.

To support this, theres a few data/header changes:

new struct ddebug_class_user
  contains: user-module-name, &classmap-defn
  it records drm-driver's use of a classmap in the section, allowing lookup

struct ddebug_info gets 2 new fields for the new sections:
  class_users, num_class_users.
  set by dynamic_debug_init() for builtins.
  or by kernel/module/main:load_info() for loadable modules.

vmlinux.lds.h: new BOUNDED_SECTION for __dyndbg_class_users.
this creates start,len C symbol-names for the section.

dynamic_debug.c has 2 changes in ddebug_add_module(), ddebug_change():

ddebug_add_module()
    called	ddebug_attach_module_classes()
    now calls	ddebug_apply_class_maps() & ddebug_apply_class_users()
		these both call ddebug_apply_params().

ddebug_apply_params(new fn):

It scans module's/builtin kernel-params, calls ddebug_match_apply_kparam
for each to find any params/sysfs-nodes which may be wired to a classmap.

ddebug_match_apply_kparam(new fn):

1st, it tests the kernel-param.ops is dyndbg's; this guarantees that
the attached arg is a struct ddebug_class_param, which has a ref to
the param's state, and to the classmap defining the param's handling.

2nd, it requires that the classmap ref'd by the kparam is the one
we've been called for; modules can use many separate classmaps (as
test_dynamic_debug does).

Then apply the "parent" kparam's setting to the dependent module,
using ddebug_apply_class_bitmap().

ddebug_change(and callees) also gets adjustments:

ddebug_find_valid_class(): This does a search over the module's
classmaps, looking for the class FOO echo'd to >control.  So now it
searches over __dyndbg_class_users[] after __dyndbg_classes[].

ddebug_class_name(): return class-names for defined OR used classes.

test_dynamic_debug.c, test_dynamic_debug_submod.c:

This demonstrates the 2 types of classmaps & sysfs-params, following
the 4-part recipe:

0. define an enum for the classmap:
   DRM.debug provides DRM_UT_<*> (aka <T>)
   multiple classmaps in a module(s) must share 0-62 classid space.
1. DYNAMIC_DEBUG_CLASSMAP_DEFINE(classmap_name, .. "<T>")
   drm.ko does this
2. DYNAMIC_DEBUG_CLASSMAP_PARAM* (classmap_name)
   if module wants a sysfs PARAM
3. DYNAMIC_DEBUG_CLASSMAP_USE(classmap_name)
   for subsystem/group/drivers use

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
source, with the new ifdef _SUBMOD block invoking DYNAMIC_DEBUG_CLASSMAP_USE
for the 2 test-interfaces.  I think this is clearer.

These 2 modules are both tristate, allowing 3 super/sub combos: Y/Y,
Y/M, M/M (not N/Y, since this is disallowed by dependence).

Y/Y testing exposed a missing __align(8) in the _METADATA macro, which
M/M didn't see because the module-loader memory placement constrains
it instead.

Fixes: aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")
cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3-
   undo 1.9 simplification of ddebug_find_valid_class()
   ddebug_change needs map to see its controlling param
   change internal callchains to pass di, not dt

v2 a. building 2 .ko's from 1 source file is weird; add a clear
      comment at the top to justify it (basically cloning)
      ln 138+ in commit-msg is insufficient.

   b. retire "DYNDBG_" name shortening b4 adding _CLASSMAP_* macros.
   c. s/dd_class/_ddebug_class/
   d. s/\bddebug\b/_$1/g in header: chgs 1 struct and UNIQUE_ID bases

v1.9 - commit-msg tweaks
     DRM:CHECK warnings on macros: add parens
     extern DEFINEd _var, static classnames
     change ddebug_class_user.user_mod_name to .mod_name
     simplify ddebug_find_valid_class return val
     improve vpr_cm_info msg format
     wrap (base) in macro body
     move __DYNDBG_CLASSMAP_CHECK above kdoc for DYNDBG_CLASSMAP_DEFINE

v1.8 - split drm parts to separate commits.
     preserve DECLARE_DYNDBG_CLASSMAP to decouple DRM, no flag day.
     fixup block comment

v1.7 - previous submission-blocking bug:

missing __align(8) in DYNAMIC_DEBUG_DECLARE_METADATA on
ddebug_class_user caused corrupt records, but only for builtin
modules; module loader code probably pinned allocations to the right
alignment naturally, hiding the bug for typical builds.

v6- get rid of WARN_ON_ONCE
v?- fix _var expanded 2x in macro

dyndbg:

This fn formerly returned the map which contained the class (thus
validating it), and as a side-effect set the class-id in an outvar.

But the caller didn't use the map (after checking its not null), only
the valid class-id.  So simplify the fn to return the class-id of the
validated classname, or -ENOENT when the queried classname is not
found.

Convey more useful info in the debug-msg: print class-names[0,last],
and [base,+len] instead of the class-type printout, which is almost
always "type:DISJOINT_BITS".  And drop ddebug_classmap_typenames,
which is now unused.

[root@v6 b0-dd]# modprobe test_dynamic_debug_submod
[   18.864962] dyndbg: loaded classmap: test_dynamic_debug [16..24] V0..V7
[   18.865046] dyndbg:  found kp:p_level_num =0x0
[   18.865048] dyndbg:   mapped to: test_dynamic_debug [16..24] V0..V7
[   18.865164] dyndbg:   p_level_num: lvl:0 bits:0x0
[   18.865217] dyndbg: loaded classmap: test_dynamic_debug [0..10] D2_CORE..D2_DRMRES
[   18.865297] dyndbg:  found kp:p_disjoint_bits =0x0
[   18.865298] dyndbg:   mapped to: test_dynamic_debug [0..10] D2_CORE..D2_DRMRES
[   18.865424] dyndbg:   p_disjoint_bits: classbits: 0x0
[   18.865472] dyndbg: module:test_dynamic_debug attached 2 classmaps
[   18.865533] dyndbg:  23 debug prints in module test_dynamic_debug
[   18.866558] dyndbg: loaded classmap: test_dynamic_debug_submod [16..24] V0..V7
[   18.866698] dyndbg:  found kp:p_level_num =0x0
[   18.866699] dyndbg:   mapped to: test_dynamic_debug_submod [16..24] V0..V7
[   18.866865] dyndbg:   p_level_num: lvl:0 bits:0x0
[   18.866926] dyndbg: loaded classmap: test_dynamic_debug_submod [0..10] D2_CORE..D2_DRMRES
[   18.867026] dyndbg:  found kp:p_disjoint_bits =0x0
[   18.867027] dyndbg:   mapped to: test_dynamic_debug_submod [0..10] D2_CORE..D2_DRMRES
[   18.867193] dyndbg:   p_disjoint_bits: classbits: 0x0
[   18.867255] dyndbg: module:test_dynamic_debug_submod attached 2 classmap uses
[   18.867351] dyndbg:  23 debug prints in module test_dynamic_debug_submod

fixup-test-submod

fixup-test

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

fixup-h-decl

tweak-hdr-cmts-cls
---
 MAINTAINERS                       |   2 +-
 include/asm-generic/vmlinux.lds.h |   1 +
 include/linux/dynamic_debug.h     | 118 ++++++++++++++++++++++---
 kernel/module/main.c              |   3 +
 lib/Kconfig.debug                 |  24 ++++--
 lib/Makefile                      |   5 ++
 lib/dynamic_debug.c               | 137 +++++++++++++++++++++++++++---
 lib/test_dynamic_debug.c          | 132 ++++++++++++++++++++--------
 lib/test_dynamic_debug_submod.c   |  14 +++
 9 files changed, 366 insertions(+), 70 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4259d63c431a3..7d92c21693dc6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8454,7 +8454,7 @@ M:	Jim Cromie <jim.cromie@gmail.com>
 S:	Maintained
 F:	include/linux/dynamic_debug.h
 F:	lib/dynamic_debug.c
-F:	lib/test_dynamic_debug.c
+F:	lib/test_dynamic_debug*.c
 F:	tools/testing/selftests/dynamic_debug/*
 
 DYNAMIC INTERRUPT MODERATION
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 6fbdee1978210..94d3bc099c66d 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -366,6 +366,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 	/* implement dynamic printk debug */				\
 	. = ALIGN(8);							\
 	BOUNDED_SECTION_BY(__dyndbg_class_maps, ___dyndbg_class_maps)	\
+	BOUNDED_SECTION_BY(__dyndbg_class_users, ___dyndbg_class_users)	\
 	BOUNDED_SECTION_BY(__dyndbg_descriptors, ___dyndbg_descs)	\
 	CODETAG_SECTIONS()						\
 	LIKELY_PROFILE()		       				\
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 1785ef5b93b15..c45f5b76763cc 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -71,9 +71,39 @@ enum ddebug_class_map_type {
 	 */
 };
 
+/*
+ * classmaps allow authors to devise their own domain-oriented
+ * class-names, to use them by converting some of their pr_debug(...)s
+ * to __pr_debug_cls(class_id, ...), and to enable them either by their
+ * kparam (/sys/module/drm/parameters/debug), or by using the class
+ * keyword in >control queries.
+ *
+ * classmaps are devised to support DRM.debug directly:
+ *
+ * class_id === drm_debug_category: DRM_UT_<*> === [0..10].
+ * These are compile-time constants, and __pr_debug_cls() requires
+ * this, enforcing what DRM devised for optimizing compilers to work
+ * with. UUID overheads were out of scope.
+ *
+ * That choice has immediate consequences:
+ * DRM wants class_ids [0..N], as will others.  We need private class_ids.
+ * DRM also exposes 0..N to userspace (/sys/module/drm/parameters/debug)
+ *
+ * By mapping class-names to class-ids at >control, and responding
+ * only to class-names DEFINEd or USEd by the module, we can
+ * private-ize the class-id, and adjust classes only by their names.
+ *
+ * Multi-class modules are possible, provided the classmaps share the
+ * class_id space [0..62].  Same applies to subsystems like DRM.
+ *
+ * NOTE: This api cannot disallow these:
+ * __pr_debug_cls(0, "fake CORE msg") in any part of DRM would "work"
+ * __pr_debug_cls(22, "no such class") would compile, but not "work"
+ */
+
 struct _ddebug_class_map {
-	struct module *mod;
-	const char *mod_name;	/* needed for builtins */
+	const struct module *mod;		/* NULL for builtins */
+	const char *mod_name;
 	const char **class_names;
 	const int length;
 	const int base;		/* index of 1st .class_id, allows split/shared space */
@@ -81,11 +111,34 @@ struct _ddebug_class_map {
 };
 
 /**
- * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
- * @_var:   a struct _ddebug_class_map, passed to module_param_cb
- * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
- * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: class-names used to control class'd prdbgs
+ * DYNAMIC_DEBUG_CLASSMAP_DEFINE - define debug classes used by a module.
+ * @_var:   name of the classmap, exported for other modules coordinated use.
+ * @_mapty: enum ddebug_class_map_type: 0:DISJOINT - independent, 1:LEVEL - v2>v1
+ * @_base:  reserve N classids starting at _base, to split 0..62 classid space
+ * @classes: names of the N classes.
+ *
+ * This tells dyndbg what class_ids the module is using: _base..+N, by
+ * mapping names onto them.  This qualifies "class NAME" >controls on
+ * the defining module, ignoring unknown names.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
+	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	extern struct _ddebug_class_map _var;				\
+	struct _ddebug_class_map __aligned(8) __used			\
+		__section("__dyndbg_class_maps") _var = {		\
+		.mod = THIS_MODULE,					\
+		.mod_name = KBUILD_MODNAME,				\
+		.base = (_base),					\
+		.map_type = (_mapty),					\
+		.length = ARRAY_SIZE(_var##_classnames),		\
+		.class_names = _var##_classnames,			\
+	};								\
+	EXPORT_SYMBOL(_var)
+
+/*
+ * XXX: keep this until DRM adapts to use the DEFINE/USE api, it
+ * differs from DYNAMIC_DEBUG_CLASSMAP_DEFINE by the lack of the
+ * extern/EXPORT on the struct init, and cascading thinkos.
  */
 #define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
@@ -99,10 +152,36 @@ struct _ddebug_class_map {
 		.class_names = _var##_classnames,			\
 	}
 
+struct _ddebug_class_user {
+	char *mod_name;
+	struct _ddebug_class_map *map;
+};
+
+/**
+ * DYNAMIC_DEBUG_CLASSMAP_USE - refer to a classmap, DEFINEd elsewhere.
+ * @_var: name of the exported classmap var
+ * @_not_yet: _base-like, but applies only to this USEr. (if needed)
+ *
+ * This tells dyndbg that the module has prdbgs with classids defined
+ * in the named classmap.  This qualifies "class NAME" >controls on
+ * the user module, and ignores unknown names.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_USE(_var)				\
+	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, __UNIQUE_ID(_ddebug_class_user))
+#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _uname)			\
+	extern struct _ddebug_class_map _var;				\
+	static struct _ddebug_class_user __aligned(8) __used		\
+	__section("__dyndbg_class_users") _uname = {			\
+		.mod_name = KBUILD_MODNAME,				\
+		.map = &(_var),						\
+	}
+
 /*
- * @_ddebug_info: gathers module/builtin dyndbg_* __sections together.
+ * @_ddebug_info: gathers module/builtin __dyndbg_<T> __sections
+ * together, each is a vec_<T>: a struct { struct T *addr, int len }.
+ *
  * For builtins, it is used as a cursor, with the inner structs
- * marking sub-vectors of the builtin __sections in DATA.
+ * marking sub-vectors of the builtin __sections in DATA_DATA
  */
 struct _ddebug_descs {
 	struct _ddebug *start;
@@ -114,10 +193,16 @@ struct _ddebug_class_maps {
 	int len;
 } __packed;
 
+struct _ddebug_class_users {
+	struct _ddebug_class_user *start;
+	int len;
+} __packed;
+
 struct _ddebug_info {
 	const char *mod_name;
 	struct _ddebug_descs descs;
 	struct _ddebug_class_maps maps;
+	struct _ddebug_class_users users;
 } __packed;
 
 struct _ddebug_class_param {
@@ -287,12 +372,18 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				   KERN_DEBUG, prefix_str, prefix_type,	\
 				   rowsize, groupsize, buf, len, ascii)
 
-/* for test only, generally expect drm.debug style macro wrappers */
-#define __pr_debug_cls(cls, fmt, ...) do {			\
+/*
+ * This is the "model" class variant of pr_debug.  It is not really
+ * intended for direct use; I'd encourage DRM-style drm_dbg_<T>
+ * macros for the interface, along with an enum for the <T>
+ *
+ * __printf(2, 3) would apply.
+ */
+#define __pr_debug_cls(cls, fmt, ...) ({			\
 	BUILD_BUG_ON_MSG(!__builtin_constant_p(cls),		\
 			 "expecting constant class int/enum");	\
 	dynamic_pr_debug_cls(cls, fmt, ##__VA_ARGS__);		\
-	} while (0)
+})
 
 #else /* !(CONFIG_DYNAMIC_DEBUG || (CONFIG_DYNAMIC_DEBUG_CORE && DYNAMIC_DEBUG_MODULE)) */
 
@@ -345,8 +436,7 @@ static inline int param_set_dyndbg_classes(const char *instr, const struct kerne
 static inline int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 { return 0; }
 
-#endif
-
+#endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 extern const struct kernel_param_ops param_ops_dyndbg_classes;
 
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 8515a6184be09..a554dab32133d 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2695,6 +2695,9 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 	mod->dyndbg_info.maps.start = section_objs(info, "__dyndbg_class_maps",
 						   sizeof(*mod->dyndbg_info.maps.start),
 						   &mod->dyndbg_info.maps.len);
+	mod->dyndbg_info.users.start = section_objs(info, "__dyndbg_class_users",
+						   sizeof(*mod->dyndbg_info.users.start),
+						   &mod->dyndbg_info.users.len);
 #endif
 
 	return 0;
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ebe33181b6e6e..bf4184d91562e 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2970,12 +2970,26 @@ config TEST_STATIC_KEYS
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
index c38582f187dd8..4f3d09a466414 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -81,6 +81,9 @@ obj-$(CONFIG_TEST_RHASHTABLE) += test_rhashtable.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
 obj-$(CONFIG_TEST_DYNAMIC_DEBUG) += test_dynamic_debug.o
+obj-$(CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD) += test_dynamic_debug_submod.o
+obj-$(CONFIG_TEST_PRINTF) += test_printf.o
+obj-$(CONFIG_TEST_SCANF) += test_scanf.o
 
 obj-$(CONFIG_TEST_BITMAP) += test_bitmap.o
 ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_KASAN),yy)
@@ -215,6 +218,8 @@ obj-$(CONFIG_ARCH_NEED_CMPXCHG_1_EMU) += cmpxchg-emu.o
 obj-$(CONFIG_DYNAMIC_DEBUG_CORE) += dynamic_debug.o
 #ensure exported functions have prototypes
 CFLAGS_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+CFLAGS_test_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+CFLAGS_test_dynamic_debug_submod.o := -DDYNAMIC_DEBUG_MODULE
 
 obj-$(CONFIG_SYMBOLIC_ERRNAME) += errname.o
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 2cd28a64578dd..fa8d1ee214066 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -29,6 +29,7 @@
 #include <linux/string_helpers.h>
 #include <linux/uaccess.h>
 #include <linux/dynamic_debug.h>
+
 #include <linux/debugfs.h>
 #include <linux/slab.h>
 #include <linux/jump_label.h>
@@ -43,6 +44,8 @@ extern struct _ddebug __start___dyndbg_descs[];
 extern struct _ddebug __stop___dyndbg_descs[];
 extern struct _ddebug_class_map __start___dyndbg_class_maps[];
 extern struct _ddebug_class_map __stop___dyndbg_class_maps[];
+extern struct _ddebug_class_user __start___dyndbg_class_users[];
+extern struct _ddebug_class_user __stop___dyndbg_class_users[];
 
 struct ddebug_table {
 	struct list_head link;
@@ -159,20 +162,37 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 		  query->first_lineno, query->last_lineno, query->class_string);
 }
 
-static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							 const char *class_string,
-							 int *class_id)
+#define vpr_di_info(di_p, msg_p, ...) ({				\
+	struct _ddebug_info const *_di = di_p;				\
+	v2pr_info(msg_p " module:%s nd:%d nc:%d nu:%d\n", ##__VA_ARGS__, \
+		  _di->mod_name, _di->descs.len, _di->maps.len,		\
+		  _di->users.len);					\
+	})
+
+static struct _ddebug_class_map *
+ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class, int *class_id)
 {
 	struct _ddebug_class_map *map;
+	struct _ddebug_class_user *cli;
 	int i, idx;
 
-	for_subvec(i, map, &dt->info, maps) {
-		idx = match_string(map->class_names, map->length, class_string);
+	for_subvec(i, map, di, maps) {
+		idx = match_string(map->class_names, map->length, query_class);
 		if (idx >= 0) {
+			vpr_di_info(di, "good-class: %s.%s ", map->mod_name, query_class);
 			*class_id = idx + map->base;
 			return map;
 		}
 	}
+	for_subvec(i, cli, di, users) {
+		idx = match_string(cli->map->class_names, cli->map->length, query_class);
+		if (idx >= 0) {
+			vpr_di_info(di, "class-ref: %s -> %s.%s ",
+				    cli->mod_name, cli->map->mod_name, query_class);
+			*class_id = idx + cli->map->base;
+			return cli->map;
+		}
+	}
 	*class_id = -ENOENT;
 	return NULL;
 }
@@ -183,8 +203,7 @@ static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table con
  * callsites, normally the same as number of changes.  If verbose,
  * logs the changes.  Takes ddebug_lock.
  */
-static int ddebug_change(const struct ddebug_query *query,
-			 struct flag_settings *modifiers)
+static int ddebug_change(const struct ddebug_query *query, struct flag_settings *modifiers)
 {
 	int i;
 	struct ddebug_table *dt;
@@ -204,7 +223,8 @@ static int ddebug_change(const struct ddebug_query *query,
 			continue;
 
 		if (query->class_string) {
-			map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
+			map = ddebug_find_valid_class(&dt->info, query->class_string,
+						      &valid_class);
 			if (!map)
 				continue;
 		} else {
@@ -569,7 +589,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 
 /* handle multiple queries in query string, continue on error, return
    last error or number of matching callsites.  Module name is either
-   in param (for boot arg) or perhaps in query string.
+   in the modname arg (for boot args) or perhaps in query string.
 */
 static int ddebug_exec_queries(char *query, const char *modname)
 {
@@ -700,7 +720,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 /**
  * param_set_dyndbg_classes - classmap kparam setter
  * @instr: string echo>d to sysfs, input depends on map_type
- * @kp:    kp->arg has state: bits/lvl, map, map_type
+ * @kp:    kp->arg has state: bits/lvl, classmap, map_type
  *
  * enable/disable all class'd pr_debugs in the classmap. For LEVEL
  * map-types, enforce * relative levels by bitpos.
@@ -737,6 +757,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 	default:
 		return -1;
 	}
+	return 0;
 }
 EXPORT_SYMBOL(param_get_dyndbg_classes);
 
@@ -1049,12 +1070,17 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp)
 {
 	struct _ddebug_class_map *map;
+	struct _ddebug_class_user *cli;
 	int i;
 
 	for_subvec(i, map, di, maps)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
+	for_subvec(i, cli, di, users)
+		if (class_in_range(dp->class_id, cli->map))
+			return cli->map->class_names[dp->class_id - cli->map->base];
+
 	return NULL;
 }
 
@@ -1135,9 +1161,85 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
-static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
+#define vpr_cm_info(cm_p, msg_fmt, ...) ({				\
+	struct _ddebug_class_map const *_cm = cm_p;			\
+	v2pr_info(msg_fmt " %s [%d..%d] %s..%s\n", ##__VA_ARGS__,	\
+		  _cm->mod_name, _cm->base, _cm->base + _cm->length,	\
+		  _cm->class_names[0], _cm->class_names[_cm->length - 1]); \
+	})
+
+static void ddebug_sync_classbits(const struct kernel_param *kp, const char *modname)
+{
+	const struct _ddebug_class_param *dcp = kp->arg;
+
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
+				      const struct _ddebug_class_map *map,
+				      const char *mod_name)
+{
+	struct _ddebug_class_param *dcp;
+
+	if (kp->ops != &param_ops_dyndbg_classes)
+		return;
+
+	dcp = (struct _ddebug_class_param *)kp->arg;
+
+	if (map == dcp->map) {
+		v2pr_info(" kp:%s.%s =0x%lx", mod_name, kp->name, *dcp->bits);
+		vpr_cm_info(map, " %s mapped to: ", mod_name);
+		ddebug_sync_classbits(kp, mod_name);
+	}
+}
+
+static void ddebug_apply_params(const struct _ddebug_class_map *cm, const char *mod_name)
+{
+	const struct kernel_param *kp;
+#if IS_ENABLED(CONFIG_MODULES)
+	int i;
+
+	if (cm->mod) {
+		vpr_cm_info(cm, "loaded classmap: %s", mod_name);
+		/* ifdef protects the cm->mod->kp deref */
+		for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
+			ddebug_match_apply_kparam(kp, cm, mod_name);
+	}
+#endif
+	if (!cm->mod) {
+		vpr_cm_info(cm, "builtin classmap: %s", mod_name);
+		for (kp = __start___param; kp < __stop___param; kp++)
+			ddebug_match_apply_kparam(kp, cm, mod_name);
+	}
+}
+
+static void ddebug_apply_class_maps(const struct _ddebug_info *di)
+{
+	struct _ddebug_class_map *cm;
+	int i;
+
+	for_subvec(i, cm, di, maps)
+		ddebug_apply_params(cm, cm->mod_name);
+
+	vpr_di_info(di, "attached %d classmaps to module: %s ", i, cm->mod_name);
+}
+
+static void ddebug_apply_class_users(const struct _ddebug_info *di)
 {
-	vpr_info("module:%s attached %d classes\n", dt->info.mod_name, dt->info.maps.len);
+	struct _ddebug_class_user *cli;
+	int i;
+
+	for_subvec(i, cli, di, users)
+		ddebug_apply_params(cli->map, cli->mod_name);
+
+	vpr_di_info(di, "attached %d class-users to module: %s ", i, cli->mod_name);
 }
 
 /*
@@ -1173,6 +1275,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
+	struct _ddebug_class_user *cli;
 	int i;
 
 	if (!di->descs.len)
@@ -1196,14 +1299,18 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	INIT_LIST_HEAD(&dt->link);
 
 	dd_mark_vector_subrange(i, dt, cm, di, maps);
+	dd_mark_vector_subrange(i, dt, cli, di, users);
 
-	if (di->maps.len)
-		ddebug_attach_module_classes(dt, di);
+	if (dt->info.maps.len)
+		ddebug_apply_class_maps(&dt->info);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
+	if (dt->info.users.len)
+		ddebug_apply_class_users(&dt->info);
+
 	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
 }
@@ -1354,8 +1461,10 @@ static int __init dynamic_debug_init(void)
 	struct _ddebug_info di = {
 		.descs.start = __start___dyndbg_descs,
 		.maps.start  = __start___dyndbg_class_maps,
+		.users.start = __start___dyndbg_class_users,
 		.descs.len = __stop___dyndbg_descs - __start___dyndbg_descs,
 		.maps.len  = __stop___dyndbg_class_maps - __start___dyndbg_class_maps,
+		.users.len = __stop___dyndbg_class_users - __start___dyndbg_class_users,
 	};
 
 #ifdef CONFIG_MODULES
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 9c3e53cd26bd8..6c4548f635128 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -6,11 +6,30 @@
  *      Jim Cromie	<jim.cromie@gmail.com>
  */
 
-#define pr_fmt(fmt) "test_dd: " fmt
+/*
+ * This file is built 2x, also making test_dynamic_debug_submod.ko,
+ * whose 2-line src file #includes this file.  This gives us a _submod
+ * clone with identical pr_debugs, without further maintenance.
+ *
+ * If things are working properly, they should operate identically
+ * when printed or adjusted by >control.  This eases visual perusal of
+ * the logs, and simplifies testing, by easing the proper accounting
+ * of expectations.
+ *
+ * It also puts both halves of the subsystem _DEFINE & _USE use case
+ * together, and integrates the common ENUM providing both class_ids
+ * and class-names to both _DEFINErs and _USERs.  I think this makes
+ * the usage clearer.
+ */
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
@@ -29,24 +48,39 @@ static const struct kernel_param_ops param_ops_do_prints = {
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
-	static struct _ddebug_class_param _flags##_model = {		\
+#define CLASSMAP_BITMASK(width, base) (((1UL << (width)) - 1) << (base))
+
+/* sysfs param wrapper, proto-API */
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, _init)		\
+	static unsigned long bits_##_model = _init;			\
+	static struct _ddebug_class_param _flags##_##_model = {		\
 		.bits = &bits_##_model,					\
 		.flags = #_flags,					\
 		.map = &map_##_model,					\
 	};								\
-	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes, &_flags##_model, 0600)
+	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,	\
+			&_flags##_##_model, 0600)
+#ifdef DEBUG
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_model, _flags)		\
+	DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, ~0)
+#else
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_model, _flags)		\
+	DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, 0)
+#endif
+
+/*
+ * Demonstrate/test DISJOINT & LEVEL typed classmaps with a sys-param.
+ *
+ * To comport with DRM debug-category (an int), classmaps map names to
+ * ids (also an int).  So a classmap starts with an enum; DRM has enum
+ * debug_category: with DRM_UT_<CORE,DRIVER,KMS,etc>.  We use the enum
+ * values as class-ids, and stringified enum-symbols as classnames.
+ *
+ * Modules with multiple CLASSMAPS must have enums with distinct
+ * value-ranges, as arranged below with explicit enum_sym = X inits.
+ * To clarify this sharing, declare the 2 enums now, for the 2
+ * different classmap types
+ */
 
 /* numeric input, independent bits */
 enum cat_disjoint_bits {
@@ -60,26 +94,51 @@ enum cat_disjoint_bits {
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
-
-/* numeric verbosity, V2 > V1 related */
-enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
-DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
-		       "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
-DD_SYS_WRAP(level_num, p);
-DD_SYS_WRAP(level_num, T);
+
+/* numeric verbosity, V2 > V1 related.  V0 is > D2_DRMRES */
+enum cat_level_num { V0 = 16, V1, V2, V3, V4, V5, V6, V7 };
+
+/* recapitulate DRM's multi-classmap setup */
+#if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
+/*
+ * In single user, or parent / coordinator (drm.ko) modules, define
+ * classmaps on the client enums above, and then declares the PARAMS
+ * ref'g the classmaps.  Each is exported.
+ */
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
+			      D2_CORE,
+			      "D2_CORE",
+			      "D2_DRIVER",
+			      "D2_KMS",
+			      "D2_PRIME",
+			      "D2_ATOMIC",
+			      "D2_VBL",
+			      "D2_STATE",
+			      "D2_LEASE",
+			      "D2_DP",
+			      "D2_DRMRES");
+
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
+			      V0, "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
+
+/*
+ * now add the sysfs-params
+ */
+
+DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
+DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
+
+#else /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
+/*
+ * in submod/drm-drivers, use the classmaps defined in top/parent
+ * module above.
+ */
+
+DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
+DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
+
+#endif
 
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
@@ -115,6 +174,7 @@ static void do_levels(void)
 
 static void do_prints(void)
 {
+	pr_debug("do_prints:\n");
 	do_cats();
 	do_levels();
 }
diff --git a/lib/test_dynamic_debug_submod.c b/lib/test_dynamic_debug_submod.c
new file mode 100644
index 0000000000000..672aabf40160d
--- /dev/null
+++ b/lib/test_dynamic_debug_submod.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kernel module for testing dynamic_debug
+ *
+ * Authors:
+ *      Jim Cromie	<jim.cromie@gmail.com>
+ */
+
+/*
+ * clone the parent, inherit all the properties, for consistency and
+ * simpler accounting in test expectations.
+ */
+#define TEST_DYNAMIC_DEBUG_SUBMOD
+#include "test_dynamic_debug.c"
-- 
2.50.1

