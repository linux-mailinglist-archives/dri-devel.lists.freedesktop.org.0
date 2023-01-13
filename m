Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B807D66A333
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED5F10EAEB;
	Fri, 13 Jan 2023 19:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5A310EAD3;
 Fri, 13 Jan 2023 19:30:54 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id h26so11225061ila.11;
 Fri, 13 Jan 2023 11:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ww+3SueiUHoCitYrSDWO8ffFpPcz7FnsT8mBQaBvWbA=;
 b=jh8UX2Q211H4EUbNFb9Y/zMlOBh94pDye0mJCLGSYNsPbeTvPMD42ag8DOgpKdeaX2
 jNiQvvD0eAwYju556HZHviFlFSqhqo03nyxFA8RXfOxri8B4f5SPTc+c68/iVwR7Slg7
 4z7wORaiWjTX/cv8A2NS2Li9M7R5iAKJWngmJWXlGrNIiGXO6wy4fHPAxvCCpf11rbvD
 +hwYzuixYvAwQ4ZumrqCwCMkf4gkPFG3e6MN0Ctr2lbae6aect7EQk4mNKcDha/8NLaB
 nANNpjkq4MGQ60vV7TBNxC5Tu9YGNmnEXrvZ1q7ToaV8COmK6Nx8wDgeJA5Rbr805Sur
 LJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ww+3SueiUHoCitYrSDWO8ffFpPcz7FnsT8mBQaBvWbA=;
 b=afqWm+5vqaShM06osT2bQuTgL6CPK1v88KjkeAX/3oSdXKN62AcdpmOlB+QNevgimq
 fSfy1OGESvwa15/0x58FRr3PkU1FsbfdeigFfBwrSZB0plpFXqPsfvYh7PmiSLppstA2
 byFBtsGbGImIAMOKwBMgZzy+mWa5tY/Mg3QJ7aqzWrMy1sLm7hqtE7GxO9xsD+CCzVhS
 vAu0PdD5bGy1aOA+dgxYpWjFiv1HGxwdqv78P1ncthhbBFnC3vGH/dVEJW2lwHartKPw
 Mo6qZxs32DrL1B/qwkdbLvdWHv7ZbDF7jiS0XDpCfSE32YV/iAW5DYoPdIquwBnnSeek
 0tDg==
X-Gm-Message-State: AFqh2koH0wstZBG+5cqGXNS/FZ1BlVWdhMsO8WQAQvIlwFtg23stZ/aC
 Fr3SCTdPSSpT8WvSpCROwQ8=
X-Google-Smtp-Source: AMrXdXuPuviDGlo0ZTneXXHi5n4jyPbQPD+3oh8IUEST16U72gkfwe35/NGuBn1LdnoIPYsme1yDlg==
X-Received: by 2002:a92:b703:0:b0:305:e3da:fae8 with SMTP id
 k3-20020a92b703000000b00305e3dafae8mr57500774ili.10.1673638253870; 
 Fri, 13 Jan 2023 11:30:53 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:30:53 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 11/20] dyndbg-API: specialize DYNDBG_CLASSMAP_(DEFINE|USE)
Date: Fri, 13 Jan 2023 12:30:07 -0700
Message-Id: <20230113193016.749791-12-jim.cromie@gmail.com>
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

Now that the DECLARE_DYNDBG_CLASSMAP macro has been split into
DYNDBG_CLASSMAP_DEFINE and DYNDBG_CLASSMAP_USE, lets differentiate
them according to their separate jobs.

Dyndbg's existing __dyndbg_classes[] section does:

. catalogs the classmaps defined by the module (or builtin modules)
. authorizes dyndbg to >control those class'd prdbgs for the module.

This patch adds __dyndbg_class_refs[] section:

. catalogs references/uses of the above classmap definitions.
. authorizes dyndbg to >control those class'd prdbgs in ref'g module.
. maps the client module to classmap definitions
  drm-drivers and helpers are clients.
  this allows dyndbg to apply drm.debug to the client module, when added.

The distinction of the 2 roles yields 2 gains:

It follows the define-once-declare-elsewhere pattern that K&R gave us,
dumping the weird coordinated-changes-by-identical-classmaps API.

It should help solve the chicken-egg problem that DRM_USE_DYNAMIC_DEBUG
has; the _USEr module must propagate the drm.debug setting once the
using module has loaded.

The new DYNDBG_CLASSMAP_* macros add records to the sections:

DYNDBG_CLASSMAP_DEFINE:
  invoked just once per sub-system.
  for drm, its drm_print, where drm.debug is exposed.
  defines the classmap, names "DRM_UT_*", maps to class_id's
  authorizes dyndbg to exert >control
  populates __dyndbg_classes[] "section", __used.
  exports the classmap.

DYNDBG_CLASSMAP_USE:
  invoked by modules using classmaps defined & exported elsewhere
  populates __dyndbg_class_refs[] "section", __used.
  maps client-module name to the extern'd classmap.
  has client-name, so dyndbg can recognize loading client modules.

also:

struct ddebug_info gets 2 new fields to encapsulate the new section:
  class_refs, num_class_refs.
  set by dynamic_debug_init() for builtins.
  or by kernel/module/main:load_info() for loadable modules.

. struct ddebug_class_user
  contains: user-module-name, ref to classmap-defn
  dyndbg finds drm-driver's use of a classmap, gets/applies its settings

. vmlinux.lds.h additions: linker symbols, KEEP for new section

dynamic_debug.c: 2 sets of changes;
  those "under" ddebug_add_module(), immediately below
  those "under" ddebug_change(), further below

ddebug_attach_module_classes():
  as before:
  called from ddebug_add_module
  finds classmaps whose .mod_name matches module being added.
  attaches them to the module's ddebug_table.

ddebug_attach_client_module_classes():
  new:
  called from ddebug_add_module, after list-add to ddebug-tables.
  like above, but works class-refs, not classes.
  foreach __dyndbg_class_refs: ddebug_param_load_dependent_class(classmap*)

s/ddebug_find_kparams/ddebug_apply_parents_params/.

ddebug_find_kparam(classmap*):

scans module's/builtin kernel-params, calls ddebug_match_attach_kparam
for each to find the params/sysfs-nodes using a classmap.

ddebug_match_apply_kparam():

1st, it tests the kernel-param.ops is dyndbg's; this guarantees that
the attached arg is a struct ddebug_class_param, which has a ref to
the param's state.

Then compare the modname being loaded to the classmap.mod_name; if it
matches, save the debug_class_param into the classmap.dc_parm.  This
lets users of the classmap (in particular a client) access the state.

ddebug_param_load_dependent_class():

Called from ddebug_attach_client_module_classes() on each class_refs[]
entry.  Each user refs a classmap which has already been seen by
ddebug_find_kparam(), and whose .dc_parm has the state.

So this fn just copies the state to a local var, then calls
ddebug_apply_class_bitmap() to apply it to the dependent module.
ddebug_apply_class_bitmap() tests for bit changes before sending
messages without making changes.

ddebug_find_valid_class():

This helps ddebug_change(), doing the search over classmaps, looking
for the class given to >control.  So now it searches over
__dyndbg_class_refs[] after __dyndbg_classes[].

Thats the theory anyway.  things are still broken (differently) for
both builtins and loadables.  For loadables, the >control is applied,
but doesnt alter any callsites.  For builtins, things break earlier.

[*] consider swapping struct ddebug_class_param's dc_parm for kparam.
This gives access to kparam->name, helpful for current debugging.
Attaching that kp via macro would simplify attach-*module-classes too.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

dyndbg: rework ddebug_(|client_)_module_attach_classes

move ddebug_attach_module_classes() up.

name-refinements++:

s/ddebug_param_load_dependent_class/ddebug_apply_parents_params/

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/vmlinux.lds.h |   3 +
 include/linux/dynamic_debug.h     |  39 ++++---
 kernel/module/main.c              |   2 +
 lib/dynamic_debug.c               | 166 ++++++++++++++++++++++++++----
 4 files changed, 176 insertions(+), 34 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 3dc5824141cd..7100701fb68c 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -363,6 +363,9 @@
 	__start___dyndbg_classes = .;					\
 	KEEP(*(__dyndbg_classes))					\
 	__stop___dyndbg_classes = .;					\
+	__start___dyndbg_class_refs = .;				\
+	KEEP(*(__dyndbg_class_refs))					\
+	__stop___dyndbg_class_refs = .;					\
 	__start___dyndbg = .;						\
 	KEEP(*(__dyndbg))						\
 	__stop___dyndbg = .;						\
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 1cdfd62fd2e4..397ac8294230 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -81,8 +81,8 @@ enum ddebug_class_map_type {
 };
 
 struct ddebug_class_map {
-	struct module *mod;
-	const char *mod_name;	/* needed for builtins */
+	const struct module *mod;		/* NULL for builtins */
+	const char *mod_name;
 	const char **class_names;
 	const int length;
 	const int base;		/* index of 1st .class_id, allows split/shared space */
@@ -99,8 +99,8 @@ struct ddebug_class_map {
  * @classes: class-names used to control class'd prdbgs
  */
 #define DYNDBG_CLASSMAP_DEFINE(_var, _maptype, _base, ...)		\
-	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
-	static struct ddebug_class_map __aligned(8) __used		\
+	const char *_var##_classnames[] = { __VA_ARGS__ };		\
+	struct ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_classes") _var = {			\
 		.mod = THIS_MODULE,					\
 		.mod_name = KBUILD_MODNAME,				\
@@ -108,24 +108,37 @@ struct ddebug_class_map {
 		.map_type = _maptype,					\
 		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
-	}
+	};								\
+	EXPORT_SYMBOL(_var)
 
-/*
- * refer to the classmap instantiated once, by the macro above.  This
- * distinguishes the multiple users of drm.debug from the single
- * definition, allowing them to specialize.  ATM its a pass-thru, but
- * it should help regularize the admittedly wierd sharing by identical
- * definitions.
+struct ddebug_class_user {
+	char *user_mod_name;
+	struct ddebug_class_map *map;
+};
+/**
+ * DYNDBG_CLASSMAP_USE - Use a classmap DEFINEd in another module.
+ * This lets dyndbg initialize the dependent module's prdbgs from the
+ * other module's controlling sysfs node.
  */
-#define DYNDBG_CLASSMAP_USE(_var, _maptype, _base, ...)		\
-	DYNDBG_CLASSMAP_DEFINE(_var, _maptype, _base, __VA_ARGS__)
+#define DYNDBG_CLASSMAP_USE(_var, ...)					\
+	DYNDBG_CLASSMAP_USE_(_var, __UNIQUE_ID(ddebug_class_user),	\
+			     __VA_ARGS__)
+#define DYNDBG_CLASSMAP_USE_(_var, _uname, ...)				\
+	extern struct ddebug_class_map _var;				\
+	static struct ddebug_class_user __used				\
+	__section("__dyndbg_class_refs") _uname = {			\
+		.user_mod_name = KBUILD_MODNAME,			\
+		.map = &_var,						\
+	}
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
 	struct ddebug_class_map *classes;
+	struct ddebug_class_user *class_refs;
 	unsigned int num_descs;
 	unsigned int num_classes;
+	unsigned int num_class_refs;
 };
 
 struct ddebug_class_param {
diff --git a/kernel/module/main.c b/kernel/module/main.c
index d02d39c7174e..ee4f85a3b8f0 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2111,6 +2111,8 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 					sizeof(*info->dyndbg.descs), &info->dyndbg.num_descs);
 	info->dyndbg.classes = section_objs(info, "__dyndbg_classes",
 					sizeof(*info->dyndbg.classes), &info->dyndbg.num_classes);
+	info->dyndbg.class_refs = section_objs(info, "__dyndbg_class_refs",
+					sizeof(*info->dyndbg.class_refs), &info->dyndbg.num_class_refs);
 
 	return 0;
 }
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index b51f4bde6198..19bf66229d45 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -43,13 +43,16 @@ extern struct _ddebug __start___dyndbg[];
 extern struct _ddebug __stop___dyndbg[];
 extern struct ddebug_class_map __start___dyndbg_classes[];
 extern struct ddebug_class_map __stop___dyndbg_classes[];
+extern struct ddebug_class_user __start___dyndbg_class_refs[];
+extern struct ddebug_class_user __stop___dyndbg_class_refs[];
 
 struct ddebug_table {
 	struct list_head link;
 	const char *mod_name;
 	struct _ddebug *ddebugs;
 	struct ddebug_class_map *classes;
-	unsigned int num_ddebugs, num_classes;
+	struct ddebug_class_user *class_refs;
+	unsigned int num_ddebugs, num_classes, num_class_refs;
 };
 
 struct ddebug_query {
@@ -147,21 +150,36 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 		  query->first_lineno, query->last_lineno, query->class_string);
 }
 
+#define vpr_dt_info(dt, _msg, ...)					\
+	v2pr_info(_msg " module:%s nd:%d nc:%d nu:%d\n", ##__VA_ARGS__,	\
+		  dt->mod_name, dt->num_ddebugs, dt->num_classes, dt->num_class_refs);
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
+	for (i = 0, cli = dt->class_refs; i < dt->num_class_refs; i++, cli++) {
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
@@ -590,9 +608,10 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     const unsigned long *new_bits, const unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long *old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -601,8 +620,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -617,8 +637,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
@@ -720,7 +741,10 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		/* numeric input, accept and fall-thru */
 		rc = kstrtoul(instr, 0, &inrep);
 		if (rc) {
-			pr_err("expecting numeric input: %s > %s\n", instr, KP_NAME(kp));
+			char *nl = strchr(instr, '\n');
+			if (nl)
+				*nl = '\0';
+			pr_err("expecting numeric input, not: %s > %s\n", instr, KP_NAME(kp));
 			return -EINVAL;
 		}
 		break;
@@ -1113,12 +1137,17 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
 {
 	struct ddebug_class_map *map = dt->classes;
+	struct ddebug_class_user *cli = dt->class_refs;
 	int i;
 
 	for (i = 0; i < dt->num_classes; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
+	for (i = 0; i < dt->num_class_refs; i++, cli++)
+		if (class_in_range(dp->class_id, cli->map))
+			return cli->map->class_names[dp->class_id - cli->map->base];
+
 	return NULL;
 }
 
@@ -1199,31 +1228,120 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
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
 			if (!nc) {
-				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
 				dt->classes = cm;
+				v2pr_info("classes[0..]: module:%s base:%d len:%d ty:%d\n",
+					  cm->mod_name, cm->base, cm->length, cm->map_type);
 			}
 			nc++;
 		}
 	}
-	if (nc) {
-		dt->num_classes = nc;
+	dt->num_classes = nc;
+	if (nc)
 		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
+}
+
+#define vpr_cm_info(cm, _msg, ...)					\
+	v2pr_info(_msg "module:%s base:%d len:%d type:%d\n", ##__VA_ARGS__, \
+		  cm->mod_name, cm->base, cm->length, cm->map_type)
+
+static void ddebug_match_apply_kparam(const struct kernel_param *kp,
+				      const struct ddebug_class_map *cm,
+				      const char *cli_name)
+{
+	struct ddebug_class_param *dcp;
+	unsigned long new_bits, old_bits = 0;
+	int totct = 0;
+
+	if (kp->ops != &param_ops_dyndbg_classes)
+		return;
+
+	dcp = (struct ddebug_class_param *)kp->arg;
+
+	if (cm == dcp->map) {
+		v2pr_info("found kp:%s =0x%lx", kp->name, *dcp->bits);
+		vpr_cm_info(cm, "mapped to:");
+		/*
+		 * using apply-bitmap is too low.
+		 * param_set_dyndbg_classes uses map_type to sort
+		 * levels-to-bits.
+		 * param_set_dyndbg_classes is too high, it takes
+		 * string inputs.
+		 * de-union-ing levels/bits might solve it (partly),
+		 * at least simplifying the translation, and possibly
+		 * the apply-bitmap fn/iface
+		 */
+		new_bits = *dcp->bits;
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, cli_name);
+	}
+}
+
+static void ddebug_apply_parents_params(const struct ddebug_class_map *cm,
+					const char *user_modname)
+{
+	const struct kernel_param *kp;
+#if IS_ENABLED(CONFIG_MODULES)
+	int i;
+
+	if (cm->mod) {
+		vpr_cm_info(cm, "loaded class:");
+		for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
+			ddebug_match_apply_kparam(kp, cm, user_modname);
+	}
+#endif
+	if (!cm->mod) {
+		vpr_cm_info(cm, "builtin class:");
+		for (kp = __start___param; kp < __stop___param; kp++)
+			ddebug_match_apply_kparam(kp, cm, user_modname);
+	}
+}
+
+/*
+ * propagates class-params thru their classmaps to class-users.  this
+ * means a query against the dt/module, which means it must be on the
+ * list to be seen by ddebug_change.
+ */
+static void ddebug_attach_client_module_classes(struct ddebug_table *dt, const struct _ddebug_info *di)
+{
+	struct ddebug_class_user *cli;
+	const struct ddebug_class_map *cm;
+	int i, nc = 0;
+
+	for (i = 0, cli = di->class_refs; i < di->num_class_refs; i++, cli++) {
+
+		BUG_ON(!cli || !cli->map || !cli->user_mod_name);
+
+		if (!strcmp(cli->user_mod_name, dt->mod_name)) {
+
+			v2pr_info("class_ref[%d] %s -> %s\n", i,
+				  cli->user_mod_name, cli->map->mod_name);
+
+			if (!nc++)
+				dt->class_refs = cli;
+		}
+	}
+	dt->num_class_refs = nc;
+
+	for (i = 0, cli = dt->class_refs; i < dt->num_class_refs; i++, cli++) {
+		cm = cli->map;
+		ddebug_apply_parents_params(cm, cli->user_mod_name);
 	}
+
+	vpr_dt_info(dt, "attach-client-module: ");
 }
 
 /*
@@ -1235,7 +1353,8 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
+	v3pr_info("add-module: %s %d sites %d.%d\n", modname, di->num_descs,
+		  di->num_classes, di->num_class_refs);
 	if (!di->num_descs) {
 		v3pr_info(" skip %s\n", modname);
 		return 0;
@@ -1258,13 +1377,16 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 
 	INIT_LIST_HEAD(&dt->link);
 
-	if (di->classes && di->num_classes)
+	if (di->num_classes)
 		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
+	if (di->num_class_refs)
+		ddebug_attach_client_module_classes(dt, di);
+
 	vpr_info("%3u debug prints in module %s\n", di->num_descs, modname);
 	return 0;
 }
@@ -1390,8 +1512,10 @@ static int __init dynamic_debug_init(void)
 	struct _ddebug_info di = {
 		.descs = __start___dyndbg,
 		.classes = __start___dyndbg_classes,
+		.class_refs = __start___dyndbg_class_refs,
 		.num_descs = __stop___dyndbg - __start___dyndbg,
 		.num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
+		.num_class_refs = __stop___dyndbg_class_refs - __start___dyndbg_class_refs,
 	};
 
 	if (&__start___dyndbg == &__stop___dyndbg) {
-- 
2.39.0

