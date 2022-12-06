Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 623CE643A38
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 01:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E35910E2EF;
	Tue,  6 Dec 2022 00:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E82710E2D4;
 Tue,  6 Dec 2022 00:35:08 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id h6so2988255iof.9;
 Mon, 05 Dec 2022 16:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SAAKFjB1VNTzR6Sh5xG3GSn+/WNGfps5BORZPudnIXg=;
 b=drc0sSwo/bo8bZGj6roOSN2Ge80cj0T5RLkyGnsrroeW+JeJBWxfrV+2Uf1wDBtrMb
 keQiYLGhbGiahnXRqjIxFXjX9nHN/PeTYd8TTO14XqgvWzfexLgglRIkKyFaq05KW5aB
 1yT/dIkaBf7KkzRAGKunHlrZ1VJzRy4LHepVUiPbcYje52lZrkW35V2i0Lfn3kgsTfiN
 tNpyoEwfHXptAANRkuttvg73fGxajymodYuAwnfeUagSf9/HQjLPtaD0W2ehaXbItqLY
 BXaR5nXKK62okdS7khfvgiuL07j2dRHSsimeCoEkHEx6vIZQBwjniT66kpWIaBpIGXSr
 JDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SAAKFjB1VNTzR6Sh5xG3GSn+/WNGfps5BORZPudnIXg=;
 b=XhIp5uqLK8oecbFqEK38NnAskQ0XAoVTedr788ymLNaqAJ05Pj6VUI6PfznNWLtARR
 1vAm1kMENU14DFgOiKlfhR45Xu9A9PYzW62XWB15DmEzJEfg8pPzr8sOCEAhNv04Hs5I
 N6G8/PX5YnYJmMEPMncnKLHq8WAlwfU2fsImkkCAY0W6viu/s+32uK0kfDTbKqvLks/F
 yukCoMrLRv13EXgfNOmGXfmIDTetLyQ3VcBdmTzQiBtgwqkUQQTlclVeZ+3dWinQQNOb
 2nWX4z/EcXN5L2zL98/B8Qo1fK1DHqOONv+hVFiXSnaoXJFzOjeyV7NHA3Bpg+sknrez
 N6xw==
X-Gm-Message-State: ANoB5pn+aAO6aXpURKe/IQYqBjAPPuts8ISU+G2G4AzLVjV41xcFz9RV
 2Um9h7Ci81SP/uQwXDnG5M4=
X-Google-Smtp-Source: AA0mqf4byq9ON4UsZ7YAL8HebV+cIzzK30DoCiYN/5PpTUJOKeD+AyLH7gYA7zMTCT8Ofvk1oM2pzg==
X-Received: by 2002:a5e:c64a:0:b0:6cc:e295:7bde with SMTP id
 s10-20020a5ec64a000000b006cce2957bdemr290273ioo.183.1670286907728; 
 Mon, 05 Dec 2022 16:35:07 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 x3-20020a056602160300b006bba42f7822sm6408213iow.52.2022.12.05.16.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 16:35:07 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 10/17] dyndbg-API: specialize DYNDBG_CLASSMAP_(DEFINE|USE)
Date: Mon,  5 Dec 2022 17:34:17 -0700
Message-Id: <20221206003424.592078-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206003424.592078-1-jim.cromie@gmail.com>
References: <20221206003424.592078-1-jim.cromie@gmail.com>
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
DYNDBG_CLASSMAP_DEFINE and DYNDBG_CLASSMAP_USE variants, lets
differentiate them according to their separate jobs.

Dyndbg's existing __dyndbg_classes[] section does:

. catalogs the classmaps defined by the module (or builtin modules)
. authorizes dyndbg to >control those class'd prdbgs for the module.

This patch adds __dyndbg_class_refs[] section:

. catalogs references/uses of the above classmap definitions.
. authorizes dyndbg to >control those class'd prdbgs in ref'g module.
. maps the client module to classmap definitions
  this allows dyndbg to propagate drm.debug to the client module.

The distinction of the 2 roles yields 2 gains:

It follows the define-once-declare-elsewhere pattern that K&R gave us,
dumping the weird coordinated-changes-by-identical-classmaps API.

It should help solve the chicken-egg problem that drm.debug-on-dyndbg
has; the _USEr module must propagate the drm.debug setting once the
using module has loaded.

The new DYNDBG_CLASSMAP macros add records to the sections:

DYNDBG_CLASSMAP_DEFINE:
  invoked by drm_print, just once per sub-system.
  defines the classmap, names "DRM_UT_*", maps to class_id's
  authorizes dyndbg to exert >control
  populates __dyndbg_classes[] "section", __used.
  exports the classmap.

DYNDBG_CLASSMAP_USE:
  invoked by modules using classmaps defined & exported elsewhere
  populates __dyndbg_class_refs[] "section", __used.
  maps client-module name to the extern'd classmap.
  no client-name yet, but will need it.

also:

struct ddebug_info gets 2 new fields to encapsulate the new section:
  class_refs, num_class_refs.
  set by dynamic_debug_init() for builtins.
  or by kernel/module/main:load_info() for loadable modules.

. struct ddebug_class_user
  contains: user-module-name, ref to classmap-defn
  dyndbg finds drm-driver's use of a classmap, gets/applies its settings

. struct ddebug_class_map gets .knob ptr to ddebug_class_param.
  compiled null, init'd under ddebug_add_module()
  allows finding drm.debug setting.

. vmlinux.lds.h additions: linker symbols, KEEP for new section

dynamic_debug.c:

ddebug_attach_module_classes():
  as before
  foreach __dyndbg_classes: ddebug_find_kparam(classmap*)

ddebug_attach_client_module_classes():
  foreach __dyndbg_class_refs: ddebug_param_load_dependent_class(classmap*)
  called after list-add to ddebug-tables.

ddebug_load_dependent_class():

This applies >controls to the module, it needs the module to be
present in the ddebug-tables list so that ddebug_change can apply the
changes to it.  So in ddebug_add_module, call 2nd fn *after* adding
the ddebug_table to the list.

ddebug_find_kparam(classmap*):

Finds the kernel-param / sysfs-node that controls the classmap, by
verifying that dyndbg's kparam-ops are used by the kparam.  The found
kparams arg is our ddebug_class_param, and has a ref to the state-var
under the sysfs-node.

ddebug_match_attach_kparam():

tests that kparam.ops == dyndbg's, then casts arg to
ddebug_class_param, and tests modnames for equality.

ddebug_param_load_dependent_class(struct ddebug_class_user*):

Called on class_refs entries, these classmaps have already been seen
by ddebug_find_kparam() which has wired the classmap.knob to the kparam.
So this fn just calls ddebug_apply_class_bitmap() on the state-var.

ddebug_find_valid_class():

This helps ddebug_change(), doing the search over classmaps, looking
for the class given to >control.  So now it searches over
__dyndbg_class_refs[] after __dyndbg_classes[].

Thats the theory anyway.  things are still broken (differently) for
both builtins and loadables.  For loadables, the >control is applied,
but doesnt alter any callsites.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/vmlinux.lds.h |   3 +
 include/linux/dynamic_debug.h     |  41 ++++++---
 kernel/module/main.c              |   2 +
 lib/dynamic_debug.c               | 137 +++++++++++++++++++++++++++---
 4 files changed, 157 insertions(+), 26 deletions(-)

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
index 1cdfd62fd2e4..dabbe1a9180c 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -81,8 +81,10 @@ enum ddebug_class_map_type {
 };
 
 struct ddebug_class_map {
-	struct module *mod;
-	const char *mod_name;	/* needed for builtins */
+	struct list_head link;
+	struct module *mod;			/* NULL for builtins */
+	const char *mod_name;
+	struct ddebug_class_param *dc_parm;	/* controlling sysfs node */
 	const char **class_names;
 	const int length;
 	const int base;		/* index of 1st .class_id, allows split/shared space */
@@ -99,8 +101,8 @@ struct ddebug_class_map {
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
@@ -108,24 +110,37 @@ struct ddebug_class_map {
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
+	extern struct ddebug_class_map _var[];				\
+	static struct ddebug_class_user __used				\
+	__section("__dyndbg_class_refs") _uname = {			\
+		.user_mod_name = KBUILD_MODNAME,			\
+		.map = _var,						\
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
index 445f25ef2461..45b8414fa130 100644
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
@@ -153,15 +156,23 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
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
 			return map;
 		}
 	}
+	for (i = 0, cli = dt->class_refs; i < dt->num_class_refs; i++, cli++) {
+		idx = match_string(cli->map->class_names, cli->map->length, class_string);
+		if (idx >= 0) {
+			*class_id = idx + map->base;
+			return map;
+		}
+	}
 	*class_id = -ENOENT;
 	return NULL;
 }
@@ -603,7 +614,7 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
+	v2pr_info("apply bitmap: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -1106,13 +1117,19 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map = iter->table->classes;
-	int i, nc = iter->table->num_classes;
+	struct ddebug_table *dt = iter->table;
+	struct ddebug_class_map *map;
+	struct ddebug_class_user *cli;
+	int i;
 
-	for (i = 0; i < nc; i++, map++)
+	for (i = 0, map = dt->classes; i < dt->num_classes; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
+	for (i = 0, cli = dt->class_refs; i < dt->num_class_refs; i++, cli++)
+		if (class_in_range(dp->class_id, cli->map))
+			return cli->map->class_names[dp->class_id - map->base];
+
 	return NULL;
 }
 
@@ -1193,6 +1210,54 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
+static void ddebug_match_attach_kparam(const struct kernel_param *kp,
+				       struct ddebug_class_map *cm)
+{
+	struct ddebug_class_param *dcp;
+
+	if (kp->ops != &param_ops_dyndbg_classes)
+		return;
+	dcp = (struct ddebug_class_param *)kp->arg;
+
+	if (!strncmp(cm->mod_name, dcp->map->mod_name, strlen(cm->mod_name))) {
+		cm->dc_parm = dcp;
+		v2pr_info("controlling kp: %s.%s\n", cm->mod_name, kp->name);
+	} else
+		v2pr_info("not this: %s %s\n", cm->mod_name, kp->name);
+}
+
+static void ddebug_find_kparam(struct ddebug_class_map *cm)
+{
+	const struct kernel_param *kp;
+	int i;
+
+	if (cm->mod) {
+		v2pr_info("loaded class: module:%s base:%d len:%d ty:%d\n",
+			  cm->mod_name, cm->base, cm->length, cm->map_type);
+
+		for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
+			ddebug_match_attach_kparam(kp, cm);
+	} else {
+		v2pr_info("builtin class: module:%s base:%d len:%d ty:%d\n",
+			  cm->mod_name, cm->base, cm->length, cm->map_type);
+
+		for (kp = __start___param; kp < __stop___param; kp++)
+			ddebug_match_attach_kparam(kp, cm);
+	}
+}
+
+static void ddebug_param_load_dependent_class(const struct ddebug_class_user *cli)
+{
+	unsigned long new_bits, old_bits = 0;
+
+	new_bits = *cli->map->dc_parm->bits;
+
+	vpr_info("%s needs %s, 0x%lx\n", cli->user_mod_name,
+		 cli->map->mod_name, new_bits);
+
+	ddebug_apply_class_bitmap(cli->map->dc_parm, &new_bits, &old_bits, cli->user_mod_name);
+}
+
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
 	struct ddebug_class_map *cm;
@@ -1203,20 +1268,60 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	 * the builtin/modular classmap vector/section.  Save the start
 	 * and length of the subrange at its edges.
 	 */
-	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
+	for (i = 0, cm = di->classes; i < di->num_classes; i++, cm++) {
 
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			if (!nc) {
-				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
 				dt->classes = cm;
+				v2pr_info("classes start: class[%d]: module:%s base:%d len:%d ty:%d\n",
+					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
 			}
+			ddebug_find_kparam(cm);
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
+static void ddebug_attach_client_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
+{
+	struct ddebug_class_user *cli;
+	int i;
+
+	for (i = 0, cli = di->class_refs; i < di->num_class_refs; i++, cli++) {
+
+		if (!cli) {
+			v2pr_info("NO CLI\n");
+			continue;
+		}
+		if (!cli->map) {
+			v2pr_info("NO CLI map\n");
+			continue;
+		}
+		if (!cli->user_mod_name) {
+			v2pr_info("NO CLI name\n");
+			continue;
+		}
+
+		if (!strcmp(cli->user_mod_name, dt->mod_name)) {
+
+			v2pr_info("class_ref[%d] %s -> %s\n", i,
+				  cli->user_mod_name, cli->map->mod_name);
+
+			ddebug_param_load_dependent_class(cli);
+
+			dt->class_refs = cli;
+			/*
+			 * allow only 1 ref right now, see if that
+			 * works.  dont want to deal with vector,len
+			 * now, maybe inadequate anyway.
+			 */
+			v2pr_info("break on %d/%d\n", i, di->num_class_refs);
+			dt->num_class_refs = 1;
+			break;
+		}
 	}
 }
 
@@ -1229,7 +1334,8 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
+	v3pr_info("add-module: %s %d sites %d.%d\n", modname, di->num_descs,
+		  di->num_classes, di->num_class_refs);
 	if (!di->num_descs) {
 		v3pr_info(" skip %s\n", modname);
 		return 0;
@@ -1252,13 +1358,16 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 
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
@@ -1384,8 +1493,10 @@ static int __init dynamic_debug_init(void)
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
2.38.1

