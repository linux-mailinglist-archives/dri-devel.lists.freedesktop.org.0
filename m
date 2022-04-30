Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FB2515C46
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 12:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F1410E06F;
	Sat, 30 Apr 2022 10:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C0E10E027;
 Sat, 30 Apr 2022 10:31:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11FD8B80123;
 Sat, 30 Apr 2022 10:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B45AC385B0;
 Sat, 30 Apr 2022 10:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651314668;
 bh=5a3g5n+qmEd88ekG2DL7ECt9MM1yHMe0jnzyEtuLpqg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gAOGtCXn9lgpRzyoj/fqa0aPc3jhw1Jqo+MSKNxwVE+IUgMVRpGTf4OVtLZdSeZqd
 wzjmUKJAtT22aRbMgAPxuz9GQUEYery/ELlun2DLAoz4nAWVKdJoKcandelji+33q4
 fGaWOQOJcG0O89lfSGUZjTc7SB2nVxzbJbHQxYaFjuqGCSAznmzGifz9TAn5SMrf1Q
 PI8UwQorA626qDLrprZknbQa7iTyKQ7iF9pfgpqLHiLM4Tdq5yUXcJXxaai4gr4NhE
 xnFMc7czngQdUywPIYRNYuvNTjBhiiPK+QP50B9IVurAYM35wbS13rciykpn4LD+UZ
 xIGETWKHKhZwA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nkkNQ-001lBO-G4; Sat, 30 Apr 2022 11:31:00 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v2 1/2] module: update dependencies at try_module_get()
Date: Sat, 30 Apr 2022 11:30:58 +0100
Message-Id: <3c7547d551558c9da02038dda45992f91b1f5141.1651314499.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651314499.git.mchehab@kernel.org>
References: <cover.1651314499.git.mchehab@kernel.org>
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
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v2 0/2] at: https://lore.kernel.org/all/cover.1651314499.git.mchehab@kernel.org/

 include/linux/module.h |  4 +++-
 kernel/module/main.c   | 35 +++++++++++++++++++++++++++++++++--
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 46d4d5f2516e..836851baaad4 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -620,7 +620,9 @@ extern void __module_get(struct module *module);
 
 /* This is the Right Way to get a module: if it fails, it's being removed,
  * so pretend it's not there. */
-extern bool try_module_get(struct module *module);
+extern bool __try_module_get(struct module *module, struct module *this);
+
+#define try_module_get(mod) __try_module_get(mod, THIS_MODULE)
 
 extern void module_put(struct module *module);
 
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 05a42d8fcd7a..9f4416381e65 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -631,6 +631,35 @@ static int ref_module(struct module *a, struct module *b)
 	return 0;
 }
 
+static int ref_module_dependency(struct module *mod,
+				       struct module *this)
+{
+	int ret;
+
+	if (!this || !this->name) {
+		return -EINVAL;
+	}
+
+	if (mod == this)
+		return 0;
+
+	mutex_lock(&module_mutex);
+
+	ret = ref_module(this, mod);
+
+#ifdef CONFIG_MODULE_UNLOAD
+	if (ret)
+		goto ret;
+
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
@@ -841,7 +870,7 @@ void __module_get(struct module *module)
 }
 EXPORT_SYMBOL(__module_get);
 
-bool try_module_get(struct module *module)
+bool __try_module_get(struct module *module, struct module *this)
 {
 	bool ret = true;
 
@@ -856,9 +885,11 @@ bool try_module_get(struct module *module)
 
 		preempt_enable();
 	}
+	if (ret)
+		ref_module_dependency(module, this);
 	return ret;
 }
-EXPORT_SYMBOL(try_module_get);
+EXPORT_SYMBOL(__try_module_get);
 
 void module_put(struct module *module)
 {
-- 
2.35.1

