Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF5458B1F1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF408A365C;
	Fri,  5 Aug 2022 21:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586F512A9F5;
 Fri,  5 Aug 2022 21:54:34 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id p82so2864874iod.2;
 Fri, 05 Aug 2022 14:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=oXa3J77+ymNXcT3dgrk8PZ8EaI201l90EOblevPX3B0=;
 b=M0+6Xxiw7YlhVZrRwe4IiGM4so0I/tE1Q37jQ4JczgsEvjxhtjf2ipsay2SWWY50lJ
 vQk3/JXXYxCHlM4mxfJgIpVbc2NqrH+NhvB93aDALFrpT2N34BTbhdrpdYjYR7iShd8b
 jhoCahOZQklgiDkeUDyVnQOZRXiL4pdAdjQRYP0/UpG2tBmGYeb0Rb3RjNH9W29O2roG
 eZdcY0yYQo7jbN2R/TEC99TcUxsEU6fC2cF1v77+he/NEt/s2ZPKIe6AK8eRLBklnKer
 Fw6wQ3BS+rkzbPHz8M+uXwZVUa3n+/ROfYTMWLUtnean8JiDsq4YBriKZP4vW+5wOWf5
 4ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=oXa3J77+ymNXcT3dgrk8PZ8EaI201l90EOblevPX3B0=;
 b=Ky1NFDVvN0de4Mu+qcm8UUHZ1wEum6RePujx025yf382jmDL5zvcRDwMsrzp2Z2n2F
 shuys0i5KPGglMrcGSAe3GabsuCRRn13+MUt7YHg/92b5Dycvr4aUlXyYVagOU9SXGdj
 OJeILRD52pZbdil8TJPSbQaRvvYXDPtfAjVeOUqr9Ow21OBvzL6f6KNYyzB7ToTEnngV
 BVq4qhJm8EISizZ/k0aq4Uzjib9Bfme16vfsyMFM/DSWuOP6rX+wgRUUgT6swMc5nIeZ
 ape5p/f+rkyRLndm4TcvvgftRxUUbAyx2a9TtbgcLF3mFAqTKSK6sg1I/U1RaZe+LNhF
 4cpQ==
X-Gm-Message-State: ACgBeo2zi0G7A6/lkCHB18p+nf6MdzU2Tw8laKPWfDGBwjiF++sWjIo8
 uZixBsO1+jIID68Dj1l/bFY=
X-Google-Smtp-Source: AA6agR5/OntY7dZsFs1UDQjm6MgnVJaaF5yH1gzu01jkp4/PSkjEGkzEDN6LKbjmbFyNfe76rzGKQQ==
X-Received: by 2002:a02:95c3:0:b0:342:7c31:5443 with SMTP id
 b61-20020a0295c3000000b003427c315443mr4227882jai.31.1659736472735; 
 Fri, 05 Aug 2022 14:54:32 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:32 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 11/33] dyndbg: create and use struct _ddebug_info
Date: Fri,  5 Aug 2022 15:53:33 -0600
Message-Id: <20220805215355.3509287-12-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 Luis Chamberlain <mcgrof@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

this new struct gathers the linker provided vectors/sections:

  descs - the vector of descriptors in __dyndbg section.
  num_descs - length of the data/section

Use it as follows:

In lib/dynamic_debug.c:

Alter ddebug_add_module() params-list, replacing descriptor-table and
its length with a single _ddebug_info object containing them.  This
future-proofs the function against the looming addition of class-map
info, for either the builtin module set, or the loaded module.

In dynamic_debug_init(): add & initialize an auto struct _ddebug_info
var, and use it like a cursor / multi-part iterator.  Re-initialize
the var's component values before each call to ddebug_add_module().
This gives us the inch-worm walk thru the modules in the built-in
__dyndbgs data section.

In kernel/module/{main.c,internal.h}:

Embed a struct _ddebug_info into struct load_info, replacing the 2 fields it
contains.  Populate its members in find_module_sections.

Also adjust dynamic_debug_setup/remove() to match the change to
ddebug_add_module().

Note: this adds an include dynamic_debug, and might be prone to
include loops, since its also smuggled in by printk.h.  Nothing has
puked in robot-land.

cc: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 13 +++++++-----
 kernel/module/internal.h      |  4 ++--
 kernel/module/main.c          | 18 ++++++++--------
 lib/dynamic_debug.c           | 40 +++++++++++++++++++++++++++--------
 4 files changed, 50 insertions(+), 25 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 8d9eec5f6d8b..6a2001250da1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -51,12 +51,16 @@ struct _ddebug {
 #endif
 } __attribute__((aligned(8)));
 
-
+/* encapsulate linker provided built-in (or module) dyndbg data */
+struct _ddebug_info {
+	struct _ddebug *descs;
+	unsigned int num_descs;
+};
 
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
 
-int ddebug_add_module(struct _ddebug *tab, unsigned int n,
-				const char *modname);
+int ddebug_add_module(struct _ddebug_info *dyndbg, const char *modname);
+
 extern int ddebug_remove_module(const char *mod_name);
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
@@ -184,8 +188,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 #include <linux/errno.h>
 #include <linux/printk.h>
 
-static inline int ddebug_add_module(struct _ddebug *tab, unsigned int n,
-				    const char *modname)
+static inline int ddebug_add_module(struct _ddebug_info *dinfo, const char *modname)
 {
 	return 0;
 }
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index ec104c2950c3..ce42b5b8b4da 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -53,6 +53,7 @@ extern const struct kernel_symbol __stop___ksymtab_gpl[];
 extern const s32 __start___kcrctab[];
 extern const s32 __start___kcrctab_gpl[];
 
+#include <linux/dynamic_debug.h>
 struct load_info {
 	const char *name;
 	/* pointer to module in temporary copy, freed at end of load_module() */
@@ -62,8 +63,7 @@ struct load_info {
 	Elf_Shdr *sechdrs;
 	char *secstrings, *strtab;
 	unsigned long symoffs, stroffs, init_typeoffs, core_typeoffs;
-	struct _ddebug *debug;
-	unsigned int num_debug;
+	struct _ddebug_info dyndbg;
 	bool sig_ok;
 #ifdef CONFIG_KALLSYMS
 	unsigned long mod_kallsyms_init_off;
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 0548151dd933..cfe10356793d 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1593,16 +1593,16 @@ static void free_modinfo(struct module *mod)
 	}
 }
 
-static void dynamic_debug_setup(struct module *mod, struct _ddebug *debug, unsigned int num)
+static void dynamic_debug_setup(struct module *mod, struct _ddebug_info *dyndbg)
 {
-	if (!debug)
+	if (!dyndbg->num_descs)
 		return;
-	ddebug_add_module(debug, num, mod->name);
+	ddebug_add_module(dyndbg, mod->name);
 }
 
-static void dynamic_debug_remove(struct module *mod, struct _ddebug *debug)
+static void dynamic_debug_remove(struct module *mod, struct _ddebug_info *dyndbg)
 {
-	if (debug)
+	if (dyndbg->num_descs)
 		ddebug_remove_module(mod->name);
 }
 
@@ -2093,8 +2093,8 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 	if (section_addr(info, "__obsparm"))
 		pr_warn("%s: Ignoring obsolete parameters\n", mod->name);
 
-	info->debug = section_objs(info, "__dyndbg",
-				   sizeof(*info->debug), &info->num_debug);
+	info->dyndbg.descs = section_objs(info, "__dyndbg",
+					sizeof(*info->dyndbg.descs), &info->dyndbg.num_descs);
 
 	return 0;
 }
@@ -2783,7 +2783,7 @@ static int load_module(struct load_info *info, const char __user *uargs,
 	}
 
 	init_build_id(mod, info);
-	dynamic_debug_setup(mod, info->debug, info->num_debug);
+	dynamic_debug_setup(mod, &info->dyndbg);
 
 	/* Ftrace init must be called in the MODULE_STATE_UNFORMED state */
 	ftrace_module_init(mod);
@@ -2845,7 +2845,7 @@ static int load_module(struct load_info *info, const char __user *uargs,
 
  ddebug_cleanup:
 	ftrace_release_mod(mod);
-	dynamic_debug_remove(mod, info->debug);
+	dynamic_debug_remove(mod, &info->dyndbg);
 	synchronize_rcu();
 	kfree(mod->args);
  free_arch_cleanup:
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 2e8ebef3bd0d..457ce936191a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -923,14 +923,20 @@ static const struct proc_ops proc_fops = {
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
  */
-int ddebug_add_module(struct _ddebug *tab, unsigned int n,
-			     const char *name)
+static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
+			       const char *modname)
 {
 	struct ddebug_table *dt;
 
+	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
+	if (!di->num_descs) {
+		v3pr_info(" skip %s\n", modname);
+		return 0;
+	}
+
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-		pr_err("error adding module: %s\n", name);
+		pr_err("error adding module: %s\n", modname);
 		return -ENOMEM;
 	}
 	/*
@@ -939,18 +945,25 @@ int ddebug_add_module(struct _ddebug *tab, unsigned int n,
 	 * member of struct module, which lives at least as long as
 	 * this struct ddebug_table.
 	 */
-	dt->mod_name = name;
-	dt->num_ddebugs = n;
-	dt->ddebugs = tab;
+	dt->mod_name = modname;
+	dt->ddebugs = di->descs;
+	dt->num_ddebugs = di->num_descs;
+
+	INIT_LIST_HEAD(&dt->link);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	vpr_info("%3u debug prints in module %s\n", n, dt->mod_name);
+	vpr_info("%3u debug prints in module %s\n", di->num_descs, modname);
 	return 0;
 }
 
+int ddebug_add_module(struct _ddebug_info *di, const char *modname)
+{
+	return __ddebug_add_module(di, 0, modname);
+}
+
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
 static int ddebug_dyndbg_param_cb(char *param, char *val,
 				const char *modname, int on_err)
@@ -1064,6 +1077,11 @@ static int __init dynamic_debug_init(void)
 	const char *modname;
 	char *cmdline;
 
+	struct _ddebug_info di = {
+		.descs = __start___dyndbg,
+		.num_descs = __stop___dyndbg - __start___dyndbg,
+	};
+
 	if (&__start___dyndbg == &__stop___dyndbg) {
 		if (IS_ENABLED(CONFIG_DYNAMIC_DEBUG)) {
 			pr_warn("_ddebug table is empty in a CONFIG_DYNAMIC_DEBUG build\n");
@@ -1082,7 +1100,9 @@ static int __init dynamic_debug_init(void)
 
 		if (strcmp(modname, iter->modname)) {
 			mod_ct++;
-			ret = ddebug_add_module(iter_mod_start, mod_sites, modname);
+			di.num_descs = mod_sites;
+			di.descs = iter_mod_start;
+			ret = __ddebug_add_module(&di, i, modname);
 			if (ret)
 				goto out_err;
 
@@ -1091,7 +1111,9 @@ static int __init dynamic_debug_init(void)
 			iter_mod_start = iter;
 		}
 	}
-	ret = ddebug_add_module(iter_mod_start, mod_sites, modname);
+	di.num_descs = mod_sites;
+	di.descs = iter_mod_start;
+	ret = __ddebug_add_module(&di, i, modname);
 	if (ret)
 		goto out_err;
 
-- 
2.37.1

