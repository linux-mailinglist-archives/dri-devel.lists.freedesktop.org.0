Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29BEC58120
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C745910E856;
	Thu, 13 Nov 2025 14:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I8cQLBKC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1B210E84A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:49 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b6d402422c2so138776066b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045627; x=1763650427; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1vtve7xgnWRe/vOdHtoREn4DAu8sZ2mMOpzTrHCPaxI=;
 b=I8cQLBKCLHafg6SC9Rb7Bf9EoQd+dFyYoWKmrEWL+B7710mcG8zKURcg5SIprrg4g3
 qmcL1/CKJCOY8R9bwpil6tnscvTa8wiTqDlwc/JwL51R8VJd1vfFnZsSOkjNbJM/cdLZ
 xG8nU1glu5Cg4lp3rmfrewKW2OKxWiNWEMMpI31R8ywdA2d+7NhCxiWUqkQHIkwSHRFI
 1tD37Xeara3TW95VW56shMzoa9x4NXOqnw12Gia3Wu9uO92zFfO3iMSp/t8BvGBenQOz
 eN+Ym1lYwV/ydJ29q8Dum/8PTD12Ztsioyssh8GSNn57vjiu701Z0S0s/gdeDA3LyFZU
 NGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045627; x=1763650427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1vtve7xgnWRe/vOdHtoREn4DAu8sZ2mMOpzTrHCPaxI=;
 b=ZgZa+enDSc+znd6TxDKNkvupcYlYhfyZA19DNy+R1g6/C2VpdYR9hAUVwg8y0Xly3Z
 Yqco2TjEBQKHaIgCMpZAJLeGcC6fklYGZO+qRtHRQmO86Q+50Ip7R6TiFfm7u/Lf0K9z
 rc5r7THsWJwV6Q3dwN87no19bo6bs30OOba7lNAe7NlWk7GJBsD5XD23Ik1Ht8XF+9Aa
 Qd9UEaukpX7gZU7ICidBhDzz6x+v32/rbEzpnvk4LhWTe3Ey4YPOYGA/5iv4HoZ1Rgca
 n8FwGeJUMreTPhb9T3MOaMqr8JNyK9+Wm8xRbmUi/CobTLN7J6fU3GU9cZI4vKO5Me5T
 7EKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtRqRsM4KhSXy2WgShoTzI0Jo37MucPvXt9L3wC0aZX5jiujsw4z7C8es61WTRllyi1I+ASmm5rvk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6TT3qawLb48EAUQwZoj173UivVUdIg+Mo3lbuS0iYfRG1Dw1j
 0AGluvhl8AG6XyQOfkY17gfWhA5V+lrfkFQApBwi7ZGMENXlCWe4R9yX
X-Gm-Gg: ASbGncsQqvs34DzesnojYjo8+UeeO85Tcp0EsePRX2TRMZ1S2dAHVYNlypInRl2s53F
 G/JFEwZe2PURZg+qia/C7JgINxmH6POXUj2fbQpSTTGy15n6DHkWJ3EOikcyaXZlpGDnCS5CRUn
 6vwcr+1zR8rjCgHEXwJFGwn4D8ACHnTZOe49euOqmlU6B4jcf8UesUx6tctPTzKyR8J2hD4ZseF
 4AKbK836yp4hOtfytIbWDYa28GkvCZ0JL+yhdZQN74+v4joAtFB9o590qsA4USnqfs65mdf9WcK
 M61nXAkE+JEae5iSGwtvMUdtlUXoFUfc0rlcigAhczN/U9Q+8yTmbmhwgBof4dJFlHchf44L0GD
 uuDv7is3YFQVp7DWmux5y3o6bZAcl99tAs41IvhwbN5BfixJ5J2rJFepbPgMdgSCuCTQaugbDNh
 w2P1274GG2X0w=
X-Google-Smtp-Source: AGHT+IGhN0BwuRz6xHS4a4rKQwJnNXuC7Dv18mVfD20rjR0xsbY2hGCz0+6Jk5TkTMzE1pREPfPY0Q==
X-Received: by 2002:a17:907:3e23:b0:b71:df18:9fd6 with SMTP id
 a640c23a62f3a-b7331aaac19mr727099166b.50.1763045627465; 
 Thu, 13 Nov 2025 06:53:47 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:47 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 16/18] drm/xe: Drop HW fence slab
Date: Thu, 13 Nov 2025 15:51:53 +0100
Message-ID: <20251113145332.16805-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113145332.16805-1-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Helps with disconnecting fences from Xe module.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 25 ++-----------------------
 drivers/gpu/drm/xe/xe_hw_fence.h |  3 ---
 drivers/gpu/drm/xe/xe_module.c   |  5 -----
 3 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 3456bec93c70..5edcf057aceb 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -6,7 +6,6 @@
 #include "xe_hw_fence.h"
 
 #include <linux/device.h>
-#include <linux/slab.h>
 
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -16,28 +15,9 @@
 #include "xe_map.h"
 #include "xe_trace.h"
 
-static struct kmem_cache *xe_hw_fence_slab;
-
-int __init xe_hw_fence_module_init(void)
-{
-	xe_hw_fence_slab = kmem_cache_create("xe_hw_fence",
-					     sizeof(struct xe_hw_fence), 0,
-					     SLAB_HWCACHE_ALIGN, NULL);
-	if (!xe_hw_fence_slab)
-		return -ENOMEM;
-
-	return 0;
-}
-
-void xe_hw_fence_module_exit(void)
-{
-	rcu_barrier();
-	kmem_cache_destroy(xe_hw_fence_slab);
-}
-
 static struct xe_hw_fence *fence_alloc(void)
 {
-	return kmem_cache_zalloc(xe_hw_fence_slab, GFP_KERNEL);
+	return kzalloc(sizeof(struct xe_hw_fence), GFP_KERNEL);
 }
 
 static void fence_free(struct rcu_head *rcu)
@@ -45,8 +25,7 @@ static void fence_free(struct rcu_head *rcu)
 	struct xe_hw_fence *fence =
 		container_of(rcu, struct xe_hw_fence, dma.rcu);
 
-	if (!WARN_ON_ONCE(!fence))
-		kmem_cache_free(xe_hw_fence_slab, fence);
+	kfree(fence);
 }
 
 static void hw_fence_irq_run_cb(struct irq_work *work)
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index f13a1c4982c7..96f34332fd8d 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -11,9 +11,6 @@
 /* Cause an early wrap to catch wrapping errors */
 #define XE_FENCE_INITIAL_SEQNO (-127)
 
-int xe_hw_fence_module_init(void);
-void xe_hw_fence_module_exit(void);
-
 void xe_hw_fence_irq_init(struct xe_hw_fence_irq *irq);
 void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq);
 void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index d08338fc3bc1..32517bcd533c 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -12,7 +12,6 @@
 
 #include "xe_drv.h"
 #include "xe_configfs.h"
-#include "xe_hw_fence.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
 #include "xe_observation.h"
@@ -114,10 +113,6 @@ static const struct init_funcs init_funcs[] = {
 		.init = xe_configfs_init,
 		.exit = xe_configfs_exit,
 	},
-	{
-		.init = xe_hw_fence_module_init,
-		.exit = xe_hw_fence_module_exit,
-	},
 	{
 		.init = xe_sched_job_module_init,
 		.exit = xe_sched_job_module_exit,
-- 
2.43.0

