Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA043520249
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 18:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BAE10E46D;
	Mon,  9 May 2022 16:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD6610E07C;
 Mon,  9 May 2022 16:23:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B97EE6134F;
 Mon,  9 May 2022 16:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18849C385B4;
 Mon,  9 May 2022 16:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652113423;
 bh=SrbmG/FGRx9mnqf8kRpRVHkNIYGrA6qPuY6/5C7xAUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AmChdpm2bT+XTKXg+8kYfVM7LxKIWNgM4goPhOfYiYSWw4CiCCo2E/MZSIQFuRSfh
 MIJoAEQmQdM2C3B3XarTl3M2BrWjFAo1to6WoXpiKTeUm5CgMeaqmweC6dk/1W3xHF
 4OZhPQgZZbi6qjPoGvMAgSqkYAnXTM/BKu2rnAyq4/xF2gPYwRNvBzIORdgziRBDHl
 lnpFNKHt3j+6Oym4NFljcYgzzoRcf6vN/YIefNU3j1gdpKsfB9HZJ4LHrtJv9Tvoss
 SeOcaH/Q3laiieFCuc7k8KOhnGXys7N6Yfuuh0DO1cbB45acuDBzlDKuLGjZPUWLpj
 xXIWzCeTRfdCg==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1no6Ae-006xVS-Hw; Mon, 09 May 2022 18:23:40 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v6 2/4] module: update dependencies at try_module_get()
Date: Mon,  9 May 2022 18:23:37 +0200
Message-Id: <28a942f860ccdee05751dcccc74b70e9d64f2b94.1652113087.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652113087.git.mchehab@kernel.org>
References: <cover.1652113087.git.mchehab@kernel.org>
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
Cc: alsa-devel@alsa-project.org, mauro.chehab@linux.intel.com,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@intel.com>,
 linux-modules@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sometimes, device drivers are bound into each other via try_module_get(),
making such references invisible when looking at /proc/modules or lsmod.

Add a function to allow setting up module references for such
cases, and call it when try_module_get() is used.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v6 0/4] at: https://lore.kernel.org/all/cover.1652113087.git.mchehab@kernel.org/

 include/linux/module.h |  8 +++--
 kernel/module/main.c   | 73 ++++++++++++++++++++++++++++++++++--------
 2 files changed, 64 insertions(+), 17 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 77961f5773b6..a66b9be92ef5 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -618,12 +618,12 @@ extern void __module_get(struct module *module);
 
 /* This is the Right Way to get a module: if it fails, it's being removed,
  * so pretend it's not there. */
-extern bool try_module_get(struct module *module);
+extern bool try_module_get_owner(struct module *module, struct module *this);
 
 extern void module_put(struct module *module);
 
 #else /*!CONFIG_MODULE_UNLOAD*/
-static inline bool try_module_get(struct module *module)
+static inline bool try_module_get_owner(struct module *module, struct module *this)
 {
 	return !module || module_is_live(module);
 }
@@ -752,7 +752,7 @@ static inline void __module_get(struct module *module)
 {
 }
 
-static inline bool try_module_get(struct module *module)
+static inline bool try_module_get_owner(struct module *module, struct module *this)
 {
 	return true;
 }
@@ -893,6 +893,8 @@ static inline bool module_sig_ok(struct module *module)
 }
 #endif	/* CONFIG_MODULE_SIG */
 
+#define try_module_get(mod) try_module_get_owner(mod, THIS_MODULE)
+
 int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
 					     struct module *, unsigned long),
 				   void *data);
diff --git a/kernel/module/main.c b/kernel/module/main.c
index fe44d46c378b..6044aeba0f18 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -139,6 +139,24 @@ int unregister_module_notifier(struct notifier_block *nb)
 }
 EXPORT_SYMBOL(unregister_module_notifier);
 
+static bool __try_module_get(struct module *module)
+{
+	bool ret = true;
+
+	if (module) {
+		preempt_disable();
+		/* Note: here, we can fail to get a reference */
+		if (likely(module_is_live(module) &&
+			   atomic_inc_not_zero(&module->refcnt) != 0))
+			trace_module_get(module, _RET_IP_);
+		else
+			ret = false;
+
+		preempt_enable();
+	}
+	return ret;
+}
+
 /*
  * We require a truly strong try_module_get(): 0 means success.
  * Otherwise an error is returned due to ongoing or failed
@@ -149,7 +167,7 @@ static inline int strong_try_module_get(struct module *mod)
 	BUG_ON(mod && mod->state == MODULE_STATE_UNFORMED);
 	if (mod && mod->state == MODULE_STATE_COMING)
 		return -EBUSY;
-	if (try_module_get(mod))
+	if (__try_module_get(mod))
 		return 0;
 	else
 		return -ENOENT;
@@ -620,6 +638,41 @@ static int ref_module(struct module *a, struct module *b)
 	return 0;
 }
 
+static int ref_module_dependency(struct module *mod, struct module *this)
+{
+	int ret = 0;
+
+	if (!this || !mod || !this->name || !mod->holders_dir)
+		return -EINVAL;
+
+	if (mod == this)
+		return 0;
+
+	mutex_lock(&module_mutex);
+
+	if (already_uses(this, mod))
+		goto ret;
+
+	ret = strong_try_module_get(mod);
+	if (ret)
+		goto ret;
+
+	ret = add_module_usage(this, mod);
+	if (ret) {
+		module_put(mod);
+		goto ret;
+	}
+
+#ifdef CONFIG_MODULE_UNLOAD
+	ret = sysfs_create_link(mod->holders_dir,
+				&this->mkobj.kobj, this->name);
+#endif
+
+ret:
+	mutex_unlock(&module_mutex);
+	return ret;
+}
+
 /* Clear the unload stuff of the module. */
 static void module_unload_free(struct module *mod)
 {
@@ -830,24 +883,16 @@ void __module_get(struct module *module)
 }
 EXPORT_SYMBOL(__module_get);
 
-bool try_module_get(struct module *module)
+bool try_module_get_owner(struct module *module, struct module *this)
 {
-	bool ret = true;
+	int ret = __try_module_get(module);
 
-	if (module) {
-		preempt_disable();
-		/* Note: here, we can fail to get a reference */
-		if (likely(module_is_live(module) &&
-			   atomic_inc_not_zero(&module->refcnt) != 0))
-			trace_module_get(module, _RET_IP_);
-		else
-			ret = false;
+	if (ret)
+		ref_module_dependency(module, this);
 
-		preempt_enable();
-	}
 	return ret;
 }
-EXPORT_SYMBOL(try_module_get);
+EXPORT_SYMBOL(try_module_get_owner);
 
 void module_put(struct module *module)
 {
-- 
2.35.3

