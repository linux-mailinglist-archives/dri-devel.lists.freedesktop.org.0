Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62AA57BA1A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2119F8F520;
	Wed, 20 Jul 2022 15:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EBB8F25C;
 Wed, 20 Jul 2022 15:33:11 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id v185so14533343ioe.11;
 Wed, 20 Jul 2022 08:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qHCsllpYuf8vvnWucr6BFoiX98frrfaryjZSZIrR9Cs=;
 b=fcOHeCsFCjMh61M7rWEM6woZTILUYeo5di/VPFkBtVeb2meWrwnc1aE4lmyqcek1LB
 Dqp9wo0wwaKwiot4hVeBMck77MlHZN1i/Bl8iA5FRqRf8Bw810jPne/Y7IJIgFycXmNm
 isHMt6lUK99aQ24K1PZttcUeq5J9u3nxsQ/S2yy/7XJ40oi99JAr9uQXW5+1pK7qxQ30
 tiCTcTiBvV2DWnATU3MvG3ZlWX2st/X2RwoADPrKyQ+Qtp+0C5twm9RpGeKk/fLG1goi
 YhALX2O4yrvNzGHGAWwdTrZ0hFXoV8e/7dLCJ3Sy/+56amcUoTbM7QUSTFKdbV09ToP3
 YTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qHCsllpYuf8vvnWucr6BFoiX98frrfaryjZSZIrR9Cs=;
 b=GwfWUz0SWCojj7oGgEYAzKHzQrA4NJJHcXlogdlPkFQk+D+bD1XrksaAJtvtS9y5bl
 K06rutMpBFkvKeBf6Fb0wNeFkVuyoqrteexrDaKJj/pjohc/u1px8ewzXMnngsKFGJUy
 biuqFvXUEnZPtoasl2oWukYyInYkWtVS+InzPO9Xw1JYTCMBlrnwNJ+Brai/PiSuBlku
 v/Q+1FIf7zKPtEReMDhLJ3PtaSLS4dqzH2TsAWJ1LGYc/s9niqfx7+UXCExJBuvVXec6
 0RwsiBlwjJn9ZoKoVhp/at7SG+ltp/F6we10HHXYmzxBHQllNdQBocRxNJelG/TowjGe
 VIzA==
X-Gm-Message-State: AJIora/OawN0+/hAgrHC186GMPqHgkViL0GXDvKzw8laebEfvsSadjL7
 e3Lqr8Rzu0FSmwogtqA7BZ0fzY3c5gvHSg==
X-Google-Smtp-Source: AGRyM1tyUkVIJQB3Z6xE69WtktrR2I0lsYXVsk82nC1P2m3RYn4FarbSiAJEENd7ss0lyFP7TA9xdg==
X-Received: by 2002:a6b:5f0d:0:b0:67b:da10:933e with SMTP id
 t13-20020a6b5f0d000000b0067bda10933emr13418145iob.56.1658331190425; 
 Wed, 20 Jul 2022 08:33:10 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:10 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 13/41] kernel/module: add __dyndbg_classes section
Date: Wed, 20 Jul 2022 09:32:05 -0600
Message-Id: <20220720153233.144129-14-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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

Like existing sections, particularly __dyndbg, this new one is an
array/address and its length.  In a close imitation of __dyndbg
handling, these are defined, then passed around, as follows:

vmlinux.lds.h:

KEEP the new section, which also silences orphan section warning on
loadable modules.  Add (__start_/__stop_)__dyndbg_classes linker
symbols for the c externs (below).

kernel/module/internal.h:
- add new fields for classes,length to struct load_info,

kernel/module.c:
- fill new fields in find_module_sections(), using section_objs()
- extend callchain prototypes
  to pass classes, length
  load_module(): pass new info to dynamic_debug_setup()
  dynamic_debug_setup(): new params, pass through to ddebug_add_module()

dynamic_debug.c:
- add externs to the linker symbols.

ddebug_add_module(): add params for classes, length.
- It currently builds a debug_table, and *will* find and attach classes.

dynamic_debug_init(): compute num_classes from linker symbols, and add
new _start, num_classes params to ddebug_add_module() calls.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/vmlinux.lds.h |  3 +++
 include/linux/dynamic_debug.h     |  9 ++++++---
 kernel/module/internal.h          |  2 ++
 kernel/module/main.c              | 10 +++++++---
 lib/dynamic_debug.c               | 22 ++++++++++++++++------
 5 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 7515a465ec03..9b8bd5504ad9 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -345,6 +345,9 @@
 	*(__tracepoints)						\
 	/* implement dynamic printk debug */				\
 	. = ALIGN(8);							\
+	__start___dyndbg_classes = .;					\
+	KEEP(*(__dyndbg_classes))					\
+	__stop___dyndbg_classes = .;					\
 	__start___dyndbg = .;						\
 	KEEP(*(__dyndbg))						\
 	__stop___dyndbg = .;						\
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 84e97cd0e8c4..f57076e02767 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -115,8 +115,10 @@ struct ddebug_class_map {
 
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
 
-int ddebug_add_module(struct _ddebug *tab, unsigned int n,
-				const char *modname);
+int ddebug_add_module(struct _ddebug *tab, unsigned int num_debugs,
+		      struct ddebug_class_map *classes, unsigned int num_classes,
+		      const char *modname);
+
 extern int ddebug_remove_module(const char *mod_name);
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
@@ -285,7 +287,8 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 #include <linux/errno.h>
 #include <linux/printk.h>
 
-static inline int ddebug_add_module(struct _ddebug *tab, unsigned int n,
+static inline int ddebug_add_module(struct _ddebug *tab, unsigned int num_debugs,
+				    struct ddebug_class_map *classes, unsigned int num_classes,
 				    const char *modname)
 {
 	return 0;
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index bc5507ab8450..02601dfe452b 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -60,7 +60,9 @@ struct load_info {
 	char *secstrings, *strtab;
 	unsigned long symoffs, stroffs, init_typeoffs, core_typeoffs;
 	struct _ddebug *debug;
+	struct ddebug_class_map *debug_classes;
 	unsigned int num_debug;
+	unsigned int num_debug_classes;
 	bool sig_ok;
 #ifdef CONFIG_KALLSYMS
 	unsigned long mod_kallsyms_init_off;
diff --git a/kernel/module/main.c b/kernel/module/main.c
index fed58d30725d..0f8e888908df 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1593,11 +1593,12 @@ static void free_modinfo(struct module *mod)
 	}
 }
 
-static void dynamic_debug_setup(struct module *mod, struct _ddebug *debug, unsigned int num)
+static void dynamic_debug_setup(struct module *mod, struct _ddebug *debug, unsigned int num,
+				struct ddebug_class_map *classes, unsigned int num_classes)
 {
 	if (!debug)
 		return;
-	ddebug_add_module(debug, num, mod->name);
+	ddebug_add_module(debug, num, classes, num_classes, mod->name);
 }
 
 static void dynamic_debug_remove(struct module *mod, struct _ddebug *debug)
@@ -2093,6 +2094,8 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 	if (section_addr(info, "__obsparm"))
 		pr_warn("%s: Ignoring obsolete parameters\n", mod->name);
 
+	info->debug_classes = section_objs(info, "__dyndbg_classes",
+				   sizeof(*info->debug_classes), &info->num_debug_classes);
 	info->debug = section_objs(info, "__dyndbg",
 				   sizeof(*info->debug), &info->num_debug);
 
@@ -2783,7 +2786,8 @@ static int load_module(struct load_info *info, const char __user *uargs,
 	}
 
 	init_build_id(mod, info);
-	dynamic_debug_setup(mod, info->debug, info->num_debug);
+	dynamic_debug_setup(mod, info->debug, info->num_debug,
+			    info->debug_classes, info->num_debug_classes);
 
 	/* Ftrace init must be called in the MODULE_STATE_UNFORMED state */
 	ftrace_module_init(mod);
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e96dc216463b..b6d80ba25bf5 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -41,6 +41,8 @@
 
 extern struct _ddebug __start___dyndbg[];
 extern struct _ddebug __stop___dyndbg[];
+extern struct ddebug_class_map __start___dyndbg_classes[];
+extern struct ddebug_class_map __stop___dyndbg_classes[];
 
 struct ddebug_table {
 	struct list_head link;
@@ -923,8 +925,9 @@ static const struct proc_ops proc_fops = {
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
  */
-int ddebug_add_module(struct _ddebug *tab, unsigned int n,
-			     const char *name)
+int ddebug_add_module(struct _ddebug *tab, unsigned int num_debugs,
+		      struct ddebug_class_map *classes, unsigned int num_classes,
+		      const char *name)
 {
 	struct ddebug_table *dt;
 
@@ -940,14 +943,14 @@ int ddebug_add_module(struct _ddebug *tab, unsigned int n,
 	 * this struct ddebug_table.
 	 */
 	dt->mod_name = name;
-	dt->num_ddebugs = n;
+	dt->num_ddebugs = num_debugs;
 	dt->ddebugs = tab;
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	vpr_info("%3u debug prints in module %s\n", n, dt->mod_name);
+	vpr_info("%3u debug prints in module %s\n", num_debugs, dt->mod_name);
 	return 0;
 }
 
@@ -1064,6 +1067,7 @@ static int __init dynamic_debug_init(void)
 	char *cmdline;
 	int ret = 0;
 	int n = 0, entries = 0, modct = 0;
+	int num_classes = __stop___dyndbg_classes - __start___dyndbg_classes;
 
 	if (&__start___dyndbg == &__stop___dyndbg) {
 		if (IS_ENABLED(CONFIG_DYNAMIC_DEBUG)) {
@@ -1081,7 +1085,9 @@ static int __init dynamic_debug_init(void)
 		entries++;
 		if (strcmp(modname, iter->modname)) {
 			modct++;
-			ret = ddebug_add_module(iter_start, n, modname);
+			ret = ddebug_add_module(iter_start, n,
+						__start___dyndbg_classes, num_classes,
+						modname);
 			if (ret)
 				goto out_err;
 			n = 0;
@@ -1090,7 +1096,8 @@ static int __init dynamic_debug_init(void)
 		}
 		n++;
 	}
-	ret = ddebug_add_module(iter_start, n, modname);
+	ret = ddebug_add_module(iter_start, n,
+				__start___dyndbg_classes, num_classes, modname);
 	if (ret)
 		goto out_err;
 
@@ -1099,6 +1106,9 @@ static int __init dynamic_debug_init(void)
 		 entries, modct, (int)((modct * sizeof(struct ddebug_table)) >> 10),
 		 (int)((entries * sizeof(struct _ddebug)) >> 10));
 
+	if (num_classes)
+		v2pr_info("  %d builtin ddebug class-maps\n", num_classes);
+
 	/* now that ddebug tables are loaded, process all boot args
 	 * again to find and activate queries given in dyndbg params.
 	 * While this has already been done for known boot params, it
-- 
2.36.1

