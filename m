Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFE452024E
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 18:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CCD10E929;
	Mon,  9 May 2022 16:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD7D10E104;
 Mon,  9 May 2022 16:23:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C5C1B817E3;
 Mon,  9 May 2022 16:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D49C385AC;
 Mon,  9 May 2022 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652113423;
 bh=FwXO3JACkg3sY4dA/R+BvoEHsuUOyXZesgC8uLp382Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r8uSniqMZqOXFG9O7Nk2Dk2ArAW8XkksmnqlDJ+zFtLseUC0uM5wlwP6iQjVnEUtb
 GU09qu8I4chB+Kewwt7nmV0MfK05y2oikCySLw8TWXbzQr5n+xtn0KvG7XLB/bmXwj
 TkHu5PCrY6eiG+FiEAE2VTaeC+E+9FaXtfyxaWrGUAtmZP960adBkqjgORqnmAfVUz
 hXG1Rnt1WpNyLI+GVin684xH/TzgevDgdIbp1DdQ8r8T5QG7tcOcJ5rC6OV7VXjS/8
 TKGQZfVWW9yu9QzUI//IXm4wuqGyWWbGwv0Id5li44ruIR51jpCJuuWJzKhDBGmyON
 8mpI+NeW9WMXQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1no6Ae-006xVX-Jf; Mon, 09 May 2022 18:23:40 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v6 3/4] module: set holders when symbol_get() is used
Date: Mon,  9 May 2022 18:23:38 +0200
Message-Id: <e8058ca7a0b84479f4075654cecff811916639ce.1652113087.git.mchehab@kernel.org>
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
Cc: alsa-devel@alsa-project.org, Richard Weinberger <richard@nod.at>,
 mauro.chehab@linux.intel.com, David Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kai Vehmanen <kai.vehmanen@intel.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-modules@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Kernel modules use symbol_get() or symbol_request() in order
to bind into other drivers. That's the case, for instance, of
media dvb drivers that hook the frontend drivers via I2C using
dvb_attach() macro.

When such bindings happen, one needs first to unload/unbind the
driver that got the symbol before being able to unload/unbind the
module that contains the needed symbol.

Add a logic to document it via /proc/modules and via lsmod.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v6 0/4] at: https://lore.kernel.org/all/cover.1652113087.git.mchehab@kernel.org/

 drivers/mtd/chips/gen_probe.c           | 4 ++--
 include/linux/module.h                  | 4 ++--
 kernel/module/main.c                    | 3 ++-
 samples/hw_breakpoint/data_breakpoint.c | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index 4d4f97841016..f1e97633ac09 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -208,10 +208,10 @@ static inline struct mtd_info *cfi_cmdset_unknown(struct map_info *map,
 	if (!probename)
 		return NULL;
 
-	probe_function = __symbol_get(probename);
+	probe_function = __symbol_get(probename, THIS_MODULE);
 	if (!probe_function) {
 		request_module("cfi_cmdset_%4.4X", type);
-		probe_function = __symbol_get(probename);
+		probe_function = __symbol_get(probename, THIS_MODULE);
 	}
 	kfree(probename);
 
diff --git a/include/linux/module.h b/include/linux/module.h
index a66b9be92ef5..07a77c2618b5 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -298,8 +298,8 @@ struct notifier_block;
 
 extern int modules_disabled; /* for sysctl */
 /* Get/put a kernel symbol (calls must be symmetric) */
-void *__symbol_get(const char *symbol);
-#define symbol_get(x) ((typeof(&x))(__symbol_get(__stringify(x))))
+void *__symbol_get(const char *symbol, struct module *this);
+#define symbol_get(x) ((typeof(&x))(__symbol_get(__stringify(x), THIS_MODULE)))
 
 /* modules using other modules: kdb wants to see this. */
 struct module_use {
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 6044aeba0f18..ec1baa67d6e7 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1259,7 +1259,7 @@ static void free_module(struct module *mod)
 #endif
 }
 
-void *__symbol_get(const char *symbol)
+void *__symbol_get(const char *symbol, struct module *this)
 {
 	struct find_symbol_arg fsa = {
 		.name	= symbol,
@@ -1273,6 +1273,7 @@ void *__symbol_get(const char *symbol)
 		return NULL;
 	}
 	preempt_enable();
+	ref_module_dependency(fsa.owner, this);
 	return (void *)kernel_symbol_value(fsa.sym);
 }
 EXPORT_SYMBOL_GPL(__symbol_get);
diff --git a/samples/hw_breakpoint/data_breakpoint.c b/samples/hw_breakpoint/data_breakpoint.c
index 418c46fe5ffc..30b3261a894b 100644
--- a/samples/hw_breakpoint/data_breakpoint.c
+++ b/samples/hw_breakpoint/data_breakpoint.c
@@ -41,7 +41,7 @@ static int __init hw_break_module_init(void)
 {
 	int ret;
 	struct perf_event_attr attr;
-	void *addr = __symbol_get(ksym_name);
+	void *addr = __symbol_get(ksym_name, THIS_MODULE);
 
 	if (!addr)
 		return -ENXIO;
-- 
2.35.3

