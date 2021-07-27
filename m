Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE8B3D74D7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 14:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E446EA0E;
	Tue, 27 Jul 2021 12:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9B56E992
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 12:10:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r2so14985682wrl.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 05:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WCqsV70edJbQ7NVyAK9Rx/CfAlgYa6xJoV0SdrDjYT4=;
 b=b8uppblO0dnYxnJT7h9GKRHZB4tDWVgC+PT6/4kCfTJPO4jR6VTqXjwCqqNK4QXoU8
 7TZXepbBqV3pIyLTpFCqAA/yPSck1DgI5qs2ApRMjITwQNGqTIVg9Mi6fcghRHvrRWAK
 dCM0Pi6Sq9eaLPZchaP1PSX1l29NKB5BoUq+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WCqsV70edJbQ7NVyAK9Rx/CfAlgYa6xJoV0SdrDjYT4=;
 b=Op0eBvbsOoO4NQeRN3k9MHp40jJOU7scrIpX+H0QpSaMOnhiWEewYwIK0XymJGLii+
 /POP0iosjRuwTZ9ZT3Wulx/+/3oYkeaKBe8qDDe0qmSrFWAmOYiRbnTDkl2zRx5a3hz3
 czUxtZ3RbNClfLe3MrUXJUgJ6m/l9arl+kQFv92R0ID3fvHS2VjYcfXN99kaSgM5Qehu
 NF7hvP1pnjNAVfe8qA8wy//3GXdRiOm4X+pf3XO+K/M+WgYXPQ6XmTTFstbpBmcfG/1l
 MamIJwFOc1G5SCFRK0Uc9gMBLLFc7ayewckpQk6W9bJIPZPc5eKiBynqLfJ1sVtMwwul
 0GBQ==
X-Gm-Message-State: AOAM533Cx5BzaXJ23PWxUfe0rTKGLTPWOKIwu7Vo/zBGgkFOeC2IKbIt
 T01dWPUTR2pcLNtkptSTlueg6IdzIBrD6w==
X-Google-Smtp-Source: ABdhPJyZD4BU3WtjQD0+yvAgeHFYR6EYk5JWEGJAUto9wQRWB05pnpkgDTwqfVMRFjr78KW5e9xs0g==
X-Received: by 2002:adf:f110:: with SMTP id r16mr24183561wro.358.1627387851009; 
 Tue, 27 Jul 2021 05:10:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k186sm3010577wme.45.2021.07.27.05.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 05:10:50 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 10/11] drm/i915: Remove i915_globals
Date: Tue, 27 Jul 2021 14:10:36 +0200
Message-Id: <20210727121037.2041102-10-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No longer used.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/Makefile         |  1 -
 drivers/gpu/drm/i915/gt/intel_gt_pm.c |  1 -
 drivers/gpu/drm/i915/i915_globals.c   | 53 ---------------------------
 drivers/gpu/drm/i915/i915_globals.h   | 25 -------------
 drivers/gpu/drm/i915/i915_pci.c       |  2 -
 5 files changed, 82 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/i915_globals.c
 delete mode 100644 drivers/gpu/drm/i915/i915_globals.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 10b3bb6207ba..9022dc638ed6 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -166,7 +166,6 @@ i915-y += \
 	  i915_gem_gtt.o \
 	  i915_gem_ww.o \
 	  i915_gem.o \
-	  i915_globals.o \
 	  i915_query.o \
 	  i915_request.o \
 	  i915_scheduler.o \
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index d86825437516..943c1d416ec0 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -6,7 +6,6 @@
 #include <linux/suspend.h>
 
 #include "i915_drv.h"
-#include "i915_globals.h"
 #include "i915_params.h"
 #include "intel_context.h"
 #include "intel_engine_pm.h"
diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
deleted file mode 100644
index 04979789e7be..000000000000
--- a/drivers/gpu/drm/i915/i915_globals.c
+++ /dev/null
@@ -1,53 +0,0 @@
-/*
- * SPDX-License-Identifier: MIT
- *
- * Copyright © 2019 Intel Corporation
- */
-
-#include <linux/slab.h>
-#include <linux/workqueue.h>
-
-#include "i915_globals.h"
-#include "i915_drv.h"
-
-static LIST_HEAD(globals);
-
-void __init i915_global_register(struct i915_global *global)
-{
-	GEM_BUG_ON(!global->exit);
-
-	list_add_tail(&global->link, &globals);
-}
-
-static void __i915_globals_cleanup(void)
-{
-	struct i915_global *global, *next;
-
-	list_for_each_entry_safe_reverse(global, next, &globals, link)
-		global->exit();
-}
-
-static __initconst int (* const initfn[])(void) = {
-};
-
-int __init i915_globals_init(void)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(initfn); i++) {
-		int err;
-
-		err = initfn[i]();
-		if (err) {
-			__i915_globals_cleanup();
-			return err;
-		}
-	}
-
-	return 0;
-}
-
-void i915_globals_exit(void)
-{
-	__i915_globals_cleanup();
-}
diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
deleted file mode 100644
index 57d2998bba45..000000000000
--- a/drivers/gpu/drm/i915/i915_globals.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * SPDX-License-Identifier: MIT
- *
- * Copyright © 2019 Intel Corporation
- */
-
-#ifndef _I915_GLOBALS_H_
-#define _I915_GLOBALS_H_
-
-#include <linux/types.h>
-
-typedef void (*i915_global_func_t)(void);
-
-struct i915_global {
-	struct list_head link;
-
-	i915_global_func_t exit;
-};
-
-void i915_global_register(struct i915_global *global);
-
-int i915_globals_init(void);
-void i915_globals_exit(void);
-
-#endif /* _I915_GLOBALS_H_ */
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 14785d88dafb..b4f5e88aaae6 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -37,7 +37,6 @@
 #include "gem/i915_gem_object.h"
 #include "i915_request.h"
 #include "i915_perf.h"
-#include "i915_globals.h"
 #include "i915_selftest.h"
 #include "i915_scheduler.h"
 #include "i915_vma.h"
@@ -1309,7 +1308,6 @@ static const struct {
 	{ i915_request_module_init, i915_request_module_exit },
 	{ i915_scheduler_module_init, i915_scheduler_module_exit },
 	{ i915_vma_module_init, i915_vma_module_exit },
-	{ i915_globals_init, i915_globals_exit },
 	{ i915_mock_selftests, NULL },
 	{ i915_pmu_init, i915_pmu_exit },
 	{ i915_register_pci_driver, i915_unregister_pci_driver },
-- 
2.32.0

