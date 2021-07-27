Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0793D74D9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 14:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260646EA2B;
	Tue, 27 Jul 2021 12:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450096E992
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 12:10:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id z4so3060015wrv.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 05:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QJnqoqOXB9+u6uqWz9HbnyQ59ICs56VzdaGB4gc4dXw=;
 b=VVYoVGzScvSTwe86Sro86PG/AQn/w7PUzP4czC1sC+v8U4rUuKHm979v15ACT+ToHL
 98HCwNZzHjrvbJ4bJO37jIllURjW58cZbeQ4ORZwJ3WyAyyOwDL5ppFKNfgL47VJE0u0
 XmYnWVc19KdZf6/1JWtUqRD3VSsjontF4o93M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QJnqoqOXB9+u6uqWz9HbnyQ59ICs56VzdaGB4gc4dXw=;
 b=INHiLzLGB/e9esJ337re2q2NUPgL73ZV66LxctIcAk62nW6+RYFaV4TR7ZxDoKCT94
 Mp+yrzbFcQJx0YPszgzuAfzGTYu9fAbiBhXcEVo+k0dpexDljmxHoup0YmKz8DoUdL5v
 7bDVMQKyTUqFADPLqYBdyAhymWLZvdzJRp6MudIND+YLTn3ynQQQZFTpd5CTJGmwujS2
 U4/1SW15SFOwobqqXygzbAvmHo1o0PTHxk1x4eEEgWjVqaWAd29190JZGWRiUmG5NOXo
 K345hik7rbKML/pxwSrXKqc/6/puYBq4vTVcNY4JJINQngCofK70S+1akSnaAFogPjp5
 F73A==
X-Gm-Message-State: AOAM533J/P/z9mni+AWV9psWQitTs30hbw9XVc94lpAJ1r5uczDtLobG
 qCTxMa/9tSTvsmpfvcU8mgycGx0ZZqw1mA==
X-Google-Smtp-Source: ABdhPJw/k/TYh8/3Ihcad2+67nGgvgPfPNRIZGXw4MLMsZtmhE0ZilpkgviilaM2KMi2urq/5XgF/A==
X-Received: by 2002:a5d:4e8f:: with SMTP id e15mr16395021wru.313.1627387851808; 
 Tue, 27 Jul 2021 05:10:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k186sm3010577wme.45.2021.07.27.05.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 05:10:51 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 11/11] drm/i915: Extract i915_module.c
Date: Tue, 27 Jul 2021 14:10:37 +0200
Message-Id: <20210727121037.2041102-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727121037.2041102-1-daniel.vetter@ffwll.ch>
References: <20210727121037.2041102-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The module init code is somewhat misplaced in i915_pci.c, since it
needs to pull in init/exit functions from every part of the driver and
pollutes the include list a lot.

Extract an i915_module.c file which pulls all the bits together, and
allows us to massively trim the include list of i915_pci.c.

The downside is that have to drop the error path check Jason added to
catch when we set up the pci driver too early. I think that risk is
acceptable for this pretty nice include.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/Makefile      |   1 +
 drivers/gpu/drm/i915/i915_module.c | 113 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_pci.c    | 117 +----------------------------
 drivers/gpu/drm/i915/i915_pci.h    |   8 ++
 4 files changed, 125 insertions(+), 114 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_module.c
 create mode 100644 drivers/gpu/drm/i915/i915_pci.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 9022dc638ed6..4ebd9f417ddb 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -38,6 +38,7 @@ i915-y += i915_drv.o \
 	  i915_irq.o \
 	  i915_getparam.o \
 	  i915_mitigations.o \
+	  i915_module.o \
 	  i915_params.o \
 	  i915_pci.o \
 	  i915_scatterlist.o \
diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
new file mode 100644
index 000000000000..c578ea8f56a0
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_module.c
@@ -0,0 +1,113 @@
+/*
+ * SPDX-License-Identifier: MIT
+ *
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include <linux/console.h>
+
+#include "gem/i915_gem_context.h"
+#include "gem/i915_gem_object.h"
+#include "i915_active.h"
+#include "i915_buddy.h"
+#include "i915_params.h"
+#include "i915_pci.h"
+#include "i915_perf.h"
+#include "i915_request.h"
+#include "i915_scheduler.h"
+#include "i915_selftest.h"
+#include "i915_vma.h"
+
+static int i915_check_nomodeset(void)
+{
+	bool use_kms = true;
+
+	/*
+	 * Enable KMS by default, unless explicitly overriden by
+	 * either the i915.modeset prarameter or by the
+	 * vga_text_mode_force boot option.
+	 */
+
+	if (i915_modparams.modeset == 0)
+		use_kms = false;
+
+	if (vgacon_text_force() && i915_modparams.modeset == -1)
+		use_kms = false;
+
+	if (!use_kms) {
+		/* Silently fail loading to not upset userspace. */
+		DRM_DEBUG_DRIVER("KMS disabled.\n");
+		return 1;
+	}
+
+	return 0;
+}
+
+static const struct {
+   int (*init)(void);
+   void (*exit)(void);
+} init_funcs[] = {
+	{ i915_check_nomodeset, NULL },
+	{ i915_active_module_init, i915_active_module_exit },
+	{ i915_buddy_module_init, i915_buddy_module_exit },
+	{ i915_context_module_init, i915_context_module_exit },
+	{ i915_gem_context_module_init, i915_gem_context_module_exit },
+	{ i915_objects_module_init, i915_objects_module_exit },
+	{ i915_request_module_init, i915_request_module_exit },
+	{ i915_scheduler_module_init, i915_scheduler_module_exit },
+	{ i915_vma_module_init, i915_vma_module_exit },
+	{ i915_mock_selftests, NULL },
+	{ i915_pmu_init, i915_pmu_exit },
+	{ i915_register_pci_driver, i915_unregister_pci_driver },
+	{ i915_perf_sysctl_register, i915_perf_sysctl_unregister },
+};
+static int init_progress;
+
+static int __init i915_init(void)
+{
+	int err, i;
+
+	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
+		err = init_funcs[i].init();
+		if (err < 0) {
+			while (i--) {
+				if (init_funcs[i].exit)
+					init_funcs[i].exit();
+			}
+			return err;
+		} else if (err > 0) {
+			/*
+			 * Early-exit success is reserved for things which
+			 * don't have an exit() function because we have no
+			 * idea how far they got or how to partially tear
+			 * them down.
+			 */
+			WARN_ON(init_funcs[i].exit);
+			break;
+		}
+	}
+
+	init_progress = i;
+
+	return 0;
+}
+
+static void __exit i915_exit(void)
+{
+	int i;
+
+	for (i = init_progress - 1; i >= 0; i--) {
+		GEM_BUG_ON(i >= ARRAY_SIZE(init_funcs));
+		if (init_funcs[i].exit)
+			init_funcs[i].exit();
+	}
+}
+
+module_init(i915_init);
+module_exit(i915_exit);
+
+MODULE_AUTHOR("Tungsten Graphics, Inc.");
+MODULE_AUTHOR("Intel Corporation");
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index b4f5e88aaae6..08651ca03478 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -22,24 +22,13 @@
  *
  */
 
-#include <linux/console.h>
 #include <linux/vga_switcheroo.h>
 
 #include <drm/drm_drv.h>
 #include <drm/i915_pciids.h>
 
-#include "display/intel_fbdev.h"
-
-#include "i915_active.h"
-#include "i915_buddy.h"
 #include "i915_drv.h"
-#include "gem/i915_gem_context.h"
-#include "gem/i915_gem_object.h"
-#include "i915_request.h"
-#include "i915_perf.h"
-#include "i915_selftest.h"
-#include "i915_scheduler.h"
-#include "i915_vma.h"
+#include "i915_pci.h"
 
 #define PLATFORM(x) .platform = (x)
 #define GEN(x) \
@@ -1251,31 +1240,6 @@ static void i915_pci_shutdown(struct pci_dev *pdev)
 	i915_driver_shutdown(i915);
 }
 
-static int i915_check_nomodeset(void)
-{
-	bool use_kms = true;
-
-	/*
-	 * Enable KMS by default, unless explicitly overriden by
-	 * either the i915.modeset prarameter or by the
-	 * vga_text_mode_force boot option.
-	 */
-
-	if (i915_modparams.modeset == 0)
-		use_kms = false;
-
-	if (vgacon_text_force() && i915_modparams.modeset == -1)
-		use_kms = false;
-
-	if (!use_kms) {
-		/* Silently fail loading to not upset userspace. */
-		DRM_DEBUG_DRIVER("KMS disabled.\n");
-		return 1;
-	}
-
-	return 0;
-}
-
 static struct pci_driver i915_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = pciidlist,
@@ -1285,87 +1249,12 @@ static struct pci_driver i915_pci_driver = {
 	.driver.pm = &i915_pm_ops,
 };
 
-static int i915_register_pci_driver(void)
+int i915_register_pci_driver(void)
 {
 	return pci_register_driver(&i915_pci_driver);
 }
 
-static void i915_unregister_pci_driver(void)
+void i915_unregister_pci_driver(void)
 {
 	pci_unregister_driver(&i915_pci_driver);
 }
-
-static const struct {
-   int (*init)(void);
-   void (*exit)(void);
-} init_funcs[] = {
-	{ i915_check_nomodeset, NULL },
-	{ i915_active_module_init, i915_active_module_exit },
-	{ i915_buddy_module_init, i915_buddy_module_exit },
-	{ i915_context_module_init, i915_context_module_exit },
-	{ i915_gem_context_module_init, i915_gem_context_module_exit },
-	{ i915_objects_module_init, i915_objects_module_exit },
-	{ i915_request_module_init, i915_request_module_exit },
-	{ i915_scheduler_module_init, i915_scheduler_module_exit },
-	{ i915_vma_module_init, i915_vma_module_exit },
-	{ i915_mock_selftests, NULL },
-	{ i915_pmu_init, i915_pmu_exit },
-	{ i915_register_pci_driver, i915_unregister_pci_driver },
-	{ i915_perf_sysctl_register, i915_perf_sysctl_unregister },
-};
-static int init_progress;
-
-static int __init i915_init(void)
-{
-	int err, i;
-
-	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
-		err = init_funcs[i].init();
-		if (err < 0) {
-			while (i--) {
-				if (init_funcs[i].exit)
-					init_funcs[i].exit();
-			}
-			return err;
-		} else if (err > 0) {
-			/*
-			 * Early-exit success is reserved for things which
-			 * don't have an exit() function because we have no
-			 * idea how far they got or how to partially tear
-			 * them down.
-			 */
-			WARN_ON(init_funcs[i].exit);
-
-			/*
-			 * We don't want to advertise devices with an only
-			 * partially initialized driver.
-			 */
-			WARN_ON(i915_pci_driver.driver.owner);
-			break;
-		}
-	}
-
-	init_progress = i;
-
-	return 0;
-}
-
-static void __exit i915_exit(void)
-{
-	int i;
-
-	for (i = init_progress - 1; i >= 0; i--) {
-		GEM_BUG_ON(i >= ARRAY_SIZE(init_funcs));
-		if (init_funcs[i].exit)
-			init_funcs[i].exit();
-	}
-}
-
-module_init(i915_init);
-module_exit(i915_exit);
-
-MODULE_AUTHOR("Tungsten Graphics, Inc.");
-MODULE_AUTHOR("Intel Corporation");
-
-MODULE_DESCRIPTION(DRIVER_DESC);
-MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/i915/i915_pci.h b/drivers/gpu/drm/i915/i915_pci.h
new file mode 100644
index 000000000000..b386f319f52e
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_pci.h
@@ -0,0 +1,8 @@
+/*
+ * SPDX-License-Identifier: MIT
+ *
+ * Copyright © 2021 Intel Corporation
+ */
+
+int i915_register_pci_driver(void);
+void i915_unregister_pci_driver(void);
-- 
2.32.0

