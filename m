Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4798C6B921
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7E710E52E;
	Tue, 18 Nov 2025 20:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z6blABT6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8134010E528
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:25 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-92aee734585so234993339f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497165; x=1764101965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mct+W783etrQqHLEp3lsatraWMaivkS9bmpWM7woGuQ=;
 b=Z6blABT68JHFMQ9Sv8H+jRyay6r7Ta12kLJpcQxQPKiRXIUgQVcCcT2e2xR3sLkDWL
 2wNSnriXhhJ39TsrzVEbvdI1GnOdNz+w2kPN0CF9mN6l0QeeKHaQbMVVgUlsQVhtxvW3
 Cn34aYFGp0IHEDxJCj5LCuS0fysz57AAMxEHxHqnVIEhBMlxXrVc+UikifWDwqyhni6H
 +YLh/XwJvZvCC+I7RuORh3DBk9/rsOio5/t7VafEUYvgfAINWPvFs2e8nbB3efBuLCB0
 VsXYUwrTJycGbjGz5N2s8VyLwpTCzmLepgPW7dmLN8kwFinqSm2Xr75XbeOBNeK+8S+y
 gaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497165; x=1764101965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mct+W783etrQqHLEp3lsatraWMaivkS9bmpWM7woGuQ=;
 b=k72sCozK+St1ZFphTteZcbNc93kbz5MdSIlbX7UaJo3VFKqvxL7rKDSQUcaj0rsFO8
 0Hyw6AjzyGeM3u7XIVvHE54FoSwPTJxSzlf2Bpwn6/nzFXJyju7v5AyqqwsHl/FbNL6r
 OPAGrl6zXY4/39F29HTgQ3WzGSqgyGGJZoTrq+IftJ56KZf8a3KKH6DIRxY9fvFPTeGA
 gzMyrsd3xRjiEXP+2Lzgv8pSdS9cSOHmfUuUUqMEhic24MvWrCHvm5O1Qe2hSkO9yXLa
 VjIGtF4D9VAvUt4lK1hNEf18VuIjVEIerfC+4xqGLdGyhw7CfFTmf9sB74T/ur2QXt4/
 a1mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHwqZ1spsr3co0tpRbdOQxguZZ2+WUym/+wq6ehp3eOoLCxdrVrERAvVjcXig62AStg854VfU6obY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRFwjxCqSslHJKiDtIYiXxNBii7qlD+kvZJJBtJ4WHB9YU7SDE
 K4Z/HefKpC4BCqtsPqrlKlwgrIT2G8i74oy6iMUpt5S7vp57tvaPtO98Npjj6oWC
X-Gm-Gg: ASbGncvulRR6jLLAhdmI0LIvyr51y6uSGK7JSSkxcERynvCva2sKtI3t0hwGNOL/0xv
 MMHbfmRfYZqDmv5JRp0GdH5MKT5WWiNOEpEyiNEb0AZJ3akQKxPOIOwWKspxxqtyY3HmykLdfni
 J9L7waH3vqpnyojGmdUi6BRpRvjAw6xldCpwPTumbZFjClsEK4Nq49YMPAvQDYMb6vMDc9+FzvZ
 Y1Ys+VEicnNzKN9YCYPfDGeQUpMy0WmyGOD1YgBd/WKbrsWclSt9CRfvqx/eIstcEXAI/Si4va4
 x/N7HqJUumfh+JtVf21vZE+wCr34O8fHdn5J7n8eKEfB3stGO7kv45A5iUcc/NcdOyZ4wJn0hDv
 xIukUEUZLfBnQmtvnQ6eg9Xgf/MGqldKQrxoFk4YY4IFXazKnQ7/AKXO2JTEb/ewOxHbfxTxTbU
 WKy8okg0EDAJD6QHTePV1Z+mkA/jKYDrl5j4JL3IMi01s9Y935URPNwIm+R4C+cWGVr3vgsYPYV
 Tu+kg==
X-Google-Smtp-Source: AGHT+IHGfErc/UWqzrlNN2SxeHnF2N6XWTJgrrIplPow/7P3OT9p7p+77a0rWldrj7UKNVwxvpSLbg==
X-Received: by 2002:a05:6602:7215:b0:948:6b99:2247 with SMTP id
 ca18e2360f4ac-948e0cf7a04mr2165293939f.8.1763497164348; 
 Tue, 18 Nov 2025 12:19:24 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:23 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v6 21/31] dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
Date: Tue, 18 Nov 2025 13:18:31 -0700
Message-ID: <20251118201842.1447666-22-jim.cromie@gmail.com>
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

commit aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")

DECLARE_DYNDBG_CLASSMAP() has a design error; its usage fails a
basic K&R rule: "define once, refer many times".

When CONFIG_DRM_USE_DYNAMIC_DEBUG=y, it is used across DRM core &
drivers; each invocation allocates/inits the classmap understood by
that module.  They *all* must match for the DRM modules to respond
consistently when drm.debug categories are enabled.  This is at least
a maintenance hassle.

Worse, its the root-cause of the CONFIG_DRM_USE_DYNAMIC_DEBUG=Y
regression; its use in both core & drivers obfuscates the 2 roles,
muddling the design, yielding an incomplete initialization when
modprobing drivers:

1st drm.ko loads, and dyndbg initializes its drm.debug callsites, then
a drm-driver loads, but too late for the drm.debug enablement.

And that gave us:
commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")

So retire it, replace with 2 macros:
  DYNAMIC_DEBUG_CLASSMAP_DEFINE - invoked once from core - drm.ko
  DYNAMIC_DEBUG_CLASSMAP_USE    - from all drm drivers and helpers.
  NB: name-space de-noise

DYNAMIC_DEBUG_CLASSMAP_DEFINE: this reworks DECLARE_DYNDBG_CLASSMAP,
basically by dropping the static qualifier on the classmap, and
exporting it instead.

DYNAMIC_DEBUG_CLASSMAP_USE: then refers to the exported var by name:
  used from drivers, helper-mods
  lets us drop the repetitive "classname" declarations
  fixes 2nd-defn problem
  creates a ddebug_class_user record in new __dyndbg_class_users section
  new section is scanned "differently"

DECLARE_DYNDBG_CLASSMAP is preserved temporarily, to decouple DRM
adaptation work and avoid compile-errs before its done.

The DEFINE,USE distinction, and the separate classmap-use record,
allows dyndbg to initialize the driver's & helper's drm.debug
callsites separately after each is modprobed.

Basically, the classmap initial scan is repeated for classmap-users.

dyndbg's existing __dyndbg_classes[] section does:

. catalogs the module's classmaps
. tells dyndbg about them, allowing >control
. DYNAMIC_DEBUG_CLASSMAP_DEFINE creates section records.
. we rename it to: __dyndbg_class_maps[]

this patch adds __dyndbg_class_users[] section:

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

TLDR ?

dynamic_debug.c: 2 changes from ddebug_add_module() & ddebug_change():

ddebug_add_module():

ddebug_attach_module_classes() is reworked/renamed/split into
debug_apply_class_maps(), ddebug_apply_class_users(), which both call
ddebug_apply_params().

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

0. define an enum for the classmap's class_ids
   drm.debug gives us DRM_UT_<*> (aka <T>)
   multiple classmaps in a module(s) must share 0-62 classid space.

1. DYNAMIC_DEBUG_CLASSMAP_DEFINE(classmap_name, .. "<T>")
   names the classes, maps them to consecutive class-ids.
   convention here is stringified ENUM_SYMBOLS
   these become API/ABI if 2 is done.

2. DYNAMIC_DEBUG_CLASSMAP_PARAM* (classmap_name)
   adds a controlling kparam to the class

3. DYNAMIC_DEBUG_CLASSMAP_USE(classmap_name)
   for subsystem/group/drivers to use extern created by 1.

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
source; the new ifdef _SUBMOD block invokes DYNAMIC_DEBUG_CLASSMAP_USE
for the 2 test-interfaces.  I think this is clearer.

These 2 modules are both tristate, allowing 3 super/sub combos: Y/Y,
Y/M, M/M (not N/Y, since this is disallowed by dependence).

Y/Y, Y/M testing once exposed a missing __align(8) in the _METADATA
macro, which M/M didn't see, probably because the module-loader memory
placement constrained it from misalignment.

Fixes: aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")
cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
checkpatch --strict complains about both DEFINE/USE macros
in both cases, _var is an lvalue.
CHECK: Macro argument reuse '_var' - possible side-effects?
CHECK: Macro argument reuse '_var' - possible side-effects?

+ avoid stale di in add-module
  review apply-classmap-* after locked list-add

V-Ive-lost-track:
  rework the main design-review comment block
  add @_base to class_user, and inner _USE_ - can deconflict with defn

v4- rework after stub-macros
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
---
 MAINTAINERS                       |   2 +-
 include/asm-generic/vmlinux.lds.h |   1 +
 include/linux/dynamic_debug.h     | 139 ++++++++++++++++++++++++---
 kernel/module/main.c              |   3 +
 lib/Kconfig.debug                 |  24 ++++-
 lib/Makefile                      |   5 +
 lib/dynamic_debug.c               | 154 +++++++++++++++++++++++++-----
 lib/test_dynamic_debug.c          | 132 ++++++++++++++++++-------
 lib/test_dynamic_debug_submod.c   |  14 +++
 9 files changed, 396 insertions(+), 78 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0db59cca0d4a..4ad12af49a35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8616,7 +8616,7 @@ M:	Jim Cromie <jim.cromie@gmail.com>
 S:	Maintained
 F:	include/linux/dynamic_debug.h
 F:	lib/dynamic_debug.c
-F:	lib/test_dynamic_debug.c
+F:	lib/test_dynamic_debug*.c
 F:	tools/testing/selftests/dynamic_debug/*
 
 DYNAMIC INTERRUPT MODERATION
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 866c79d8b2a5..7bfd23ea7620 100644
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
index c4ebbccca5d1..905db0b49104 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -71,8 +71,11 @@ enum ddebug_class_map_type {
 	 */
 };
 
+/*
+ * map @class_names 0..N to consecutive constants starting at @base.
+ */
 struct _ddebug_class_map {
-	struct module *mod;	/* NULL for builtins */
+	const struct module *mod;	/* NULL for builtins */
 	const char *mod_name;
 	const char **class_names;
 	const int length;
@@ -80,10 +83,18 @@ struct _ddebug_class_map {
 	enum ddebug_class_map_type map_type;
 };
 
+struct _ddebug_class_user {
+	char *mod_name;
+	struct _ddebug_class_map *map;
+	const int base;		/* user offset to re-number the used map */
+};
+
 /*
- * @_ddebug_info: gathers module/builtin dyndbg_* __sections together.
+ * @_ddebug_info: gathers module/builtin __dyndbg_<T> __sections
+ * together, each is a vec_<T>: a struct { struct T start[], int len }.
+ *
  * For builtins, it is used as a cursor, with the inner structs
- * marking sub-vectors of the builtin __sections in DATA.
+ * marking sub-vectors of the builtin __sections in DATA_DATA
  */
 struct _ddebug_descs {
 	struct _ddebug *start;
@@ -95,10 +106,16 @@ struct _ddebug_class_maps {
 	int len;
 };
 
+struct _ddebug_class_users {
+	struct _ddebug_class_user *start;
+	int len;
+};
+
 struct _ddebug_info {
 	const char *mod_name;
 	struct _ddebug_descs descs;
 	struct _ddebug_class_maps maps;
+	struct _ddebug_class_users users;
 };
 
 struct _ddebug_class_param {
@@ -117,12 +134,81 @@ struct _ddebug_class_param {
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
 	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
 
+/*
+ * dyndbg classmaps is modelled closely upon drm.debug:
+ *
+ *  1. run-time control via sysfs node (api/abi)
+ *  2. each bit 0..N controls a single "category"
+ *  3. a pr_debug can have only 1 category, not several.
+ *  4. "kind" is a compile-time constant: 0..N or BIT() thereof
+ *  5. macro impls - give compile-time resolution or fail.
+ *
+ * dyndbg classmaps design axioms/constraints:
+ *
+ *  . optimizing compilers use 1-5 above, so preserve them.
+ *  . classmaps.class_id *is* the category.
+ *  . classmap definers/users are modules.
+ *  . every user wants 0..N
+ *  . 0..N exposes as ABI
+ *  . no 1 use-case wants N > 32, 16 is more usable
+ *  . N <= 64 in *all* cases
+ *  . modules/subsystems make category/classmap decisions
+ *  . ie an enum: DRM has DRM_UT_CORE..DRM_UT_DRMRES
+ *  . some categories are exposed to user: ABI
+ *  . making modules change their numbering is bogus, avoid if possible
+ *
+ * We can solve for all these at once:
+ *  A: map class-names to a .class_id range at compile-time
+ *  B: allow only "class NAME" changes to class'd callsites at run-time
+ *  C: users/modules must manage 0..62 hardcoded .class_id range limit.
+ *  D: existing pr_debugs get CLASS_DFLT=63
+ *
+ * By mapping class-names at >control to class-ids underneath, and
+ * responding only to class-names DEFINEd or USEd by the module, we
+ * can private-ize the class-id, and adjust class'd pr_debugs only by
+ * their names.
+ *
+ * This give us:
+ *  E: class_ids without classnames are unreachable
+ *  F: user modules opt-in by DEFINEing a classmap and/or USEing another
+ *
+ * Multi-classmap modules/groups are supported, if the classmaps share
+ * the class_id space [0..62] without overlap/conflict.
+ *
+ * NOTE: Due to the integer class_id, this api cannot disallow these:
+ * __pr_debug_cls(0, "fake CORE msg");  works only if a classmap maps 0.
+ * __pr_debug_cls(22, "no such class"); compiles but is not reachable
+ */
+
 /**
- * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
- * @_var:   a struct ddebug_class_map, passed to module_param_cb
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
@@ -136,6 +222,26 @@ struct _ddebug_class_param {
 		.class_names = _var##_classnames,			\
 	}
 
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
+	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, 0, __UNIQUE_ID(_ddebug_class_user))
+#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _base, _uname)		\
+	extern struct _ddebug_class_map _var;				\
+	static struct _ddebug_class_user __aligned(8) __used		\
+	__section("__dyndbg_class_users") _uname = {			\
+		.mod_name = KBUILD_MODNAME,				\
+		.map = &(_var),						\
+		.base = _base						\
+	}
+
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
 
@@ -287,12 +393,18 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
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
 
@@ -300,6 +412,8 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 #include <linux/errno.h>
 #include <linux/printk.h>
 
+#define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)
+#define DYNAMIC_DEBUG_CLASSMAP_USE(_var)
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
 #define DYNAMIC_DEBUG_BRANCH(descriptor) false
 #define DECLARE_DYNDBG_CLASSMAP(...)
@@ -346,8 +460,7 @@ static inline int param_set_dyndbg_classes(const char *instr, const struct kerne
 static inline int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 { return 0; }
 
-#endif
-
+#endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 extern const struct kernel_param_ops param_ops_dyndbg_classes;
 
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 1ccc5d4399c3..ee35238d2d0a 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2716,6 +2716,9 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 	mod->dyndbg_info.maps.start = section_objs(info, "__dyndbg_class_maps",
 						   sizeof(*mod->dyndbg_info.maps.start),
 						   &mod->dyndbg_info.maps.len);
+	mod->dyndbg_info.users.start = section_objs(info, "__dyndbg_class_users",
+						   sizeof(*mod->dyndbg_info.users.start),
+						   &mod->dyndbg_info.users.len);
 #endif
 
 	return 0;
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index dc0e0c6ed075..4fa720b98571 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2959,12 +2959,26 @@ config TEST_STATIC_KEYS
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
index 392ff808c9b9..45a445a5ff96 100644
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
@@ -207,6 +210,8 @@ obj-$(CONFIG_ARCH_NEED_CMPXCHG_1_EMU) += cmpxchg-emu.o
 obj-$(CONFIG_DYNAMIC_DEBUG_CORE) += dynamic_debug.o
 #ensure exported functions have prototypes
 CFLAGS_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+CFLAGS_test_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+CFLAGS_test_dynamic_debug_submod.o := -DDYNAMIC_DEBUG_MODULE
 
 obj-$(CONFIG_SYMBOLIC_ERRNAME) += errname.o
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e5522fea49bb..c6b983f2324b 100644
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
@@ -168,20 +171,37 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 		  query->first_lineno, query->last_lineno, query->class_string);
 }
 
-static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							 const char *class_string,
-							 int *class_id)
+#define vpr_di_info(di_p, msg_p, ...) ({				\
+	struct _ddebug_info const *_di = di_p;				\
+	v2pr_info(msg_p "module:%s nd:%d nc:%d nu:%d\n", ##__VA_ARGS__, \
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
@@ -238,8 +258,7 @@ static bool ddebug_match_desc(const struct ddebug_query *query,
 	return true;
 }
 
-static int ddebug_change(const struct ddebug_query *query,
-			 struct flag_settings *modifiers)
+static int ddebug_change(const struct ddebug_query *query, struct flag_settings *modifiers)
 {
 	int i;
 	struct ddebug_table *dt;
@@ -260,7 +279,8 @@ static int ddebug_change(const struct ddebug_query *query,
 			continue;
 
 		if (query->class_string) {
-			map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
+			map = ddebug_find_valid_class(&dt->info, query->class_string,
+						      &valid_class);
 			if (!map)
 				continue;
 		} else {
@@ -590,7 +610,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 
 /* handle multiple queries in query string, continue on error, return
    last error or number of matching callsites.  Module name is either
-   in param (for boot arg) or perhaps in query string.
+   in the modname arg (for boot args) or perhaps in query string.
 */
 static int ddebug_exec_queries(char *query, const char *modname)
 {
@@ -721,7 +741,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 /**
  * param_set_dyndbg_classes - classmap kparam setter
  * @instr: string echo>d to sysfs, input depends on map_type
- * @kp:    kp->arg has state: bits/lvl, map, map_type
+ * @kp:    kp->arg has state: bits/lvl, classmap, map_type
  *
  * enable/disable all class'd pr_debugs in the classmap. For LEVEL
  * map-types, enforce * relative levels by bitpos.
@@ -758,6 +778,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 	default:
 		return -1;
 	}
+	return 0;
 }
 EXPORT_SYMBOL(param_get_dyndbg_classes);
 
@@ -1073,12 +1094,17 @@ static bool ddebug_class_in_range(const int class_id, const struct _ddebug_class
 static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp)
 {
 	struct _ddebug_class_map *map;
+	struct _ddebug_class_user *cli;
 	int i;
 
 	for_subvec(i, map, di, maps)
 		if (ddebug_class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
+	for_subvec(i, cli, di, users)
+		if (ddebug_class_in_range(dp->class_id, cli->map))
+			return cli->map->class_names[dp->class_id - cli->map->base];
+
 	return NULL;
 }
 
@@ -1159,9 +1185,85 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
-static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
+#define vpr_cm_info(cm_p, msg_fmt, ...) ({				\
+	struct _ddebug_class_map const *_cm = cm_p;			\
+	v2pr_info(msg_fmt "%s [%d..%d] %s..%s\n", ##__VA_ARGS__,	\
+		  _cm->mod_name, _cm->base, _cm->base + _cm->length,	\
+		  _cm->class_names[0], _cm->class_names[_cm->length - 1]); \
+	})
+
+static void ddebug_sync_classbits(const struct kernel_param *kp, const char *modname)
 {
-	vpr_info("module:%s attached %d classes\n", dt->info.mod_name, dt->info.maps.len);
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
+		vpr_cm_info(map, " %s maps ", mod_name);
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
+		vpr_cm_info(cm, "loaded classmap: %s ", mod_name);
+		/* ifdef protects the cm->mod->kp deref */
+		for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
+			ddebug_match_apply_kparam(kp, cm, mod_name);
+	}
+#endif
+	if (!cm->mod) {
+		vpr_cm_info(cm, "builtin classmap: %s ", mod_name);
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
+	vpr_di_info(di, "attached %d class-maps to ", i);
+}
+
+static void ddebug_apply_class_users(const struct _ddebug_info *di)
+{
+	struct _ddebug_class_user *cli;
+	int i;
+
+	for_subvec(i, cli, di, users)
+		ddebug_apply_params(cli->map, cli->mod_name);
+
+	vpr_di_info(di, "attached %d class-users to ", i);
 }
 
 /*
@@ -1198,6 +1300,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
+	struct _ddebug_class_user *cli;
 	int i;
 
 	if (!di->descs.len)
@@ -1210,26 +1313,29 @@ static int ddebug_add_module(struct _ddebug_info *di)
 		pr_err("error adding module: %s\n", di->mod_name);
 		return -ENOMEM;
 	}
+	INIT_LIST_HEAD(&dt->link);
 	/*
-	 * For built-in modules, name (as supplied in di by its
-	 * callers) lives in .rodata and is immortal. For loaded
-	 * modules, name points at the name[] member of struct module,
-	 * which lives at least as long as this struct ddebug_table.
+	 * For built-in modules, di-> referents live in .rodata and is
+	 * are immortal. For loaded modules, name points at the name[]
+	 * member of struct module, which lives at least as long as
+	 * this struct ddebug_table.
 	 */
 	dt->info = *di;
-
-	INIT_LIST_HEAD(&dt->link);
-
 	dd_mark_vector_subrange(i, dt, cm, di, maps);
-
-	if (di->maps.len)
-		ddebug_attach_module_classes(dt, di);
+	dd_mark_vector_subrange(i, dt, cli, di, users);
+	/* now di may be stale */
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
+	if (dt->info.maps.len)
+		ddebug_apply_class_maps(&dt->info);
+	if (dt->info.users.len)
+		ddebug_apply_class_users(&dt->info);
+
+	vpr_info("%3u debug prints in module %s\n",
+		 dt->info.descs.len, dt->info.mod_name);
 	return 0;
 }
 
@@ -1379,8 +1485,10 @@ static int __init dynamic_debug_init(void)
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
index 9c3e53cd26bd..6c4548f63512 100644
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
index 000000000000..672aabf40160
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
2.51.1

