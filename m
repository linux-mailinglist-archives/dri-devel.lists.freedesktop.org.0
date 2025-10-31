Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE0AC25529
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF1D10EB8A;
	Fri, 31 Oct 2025 13:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SopuIB/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D380B10EB8A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:45:19 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so23046065e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761918318; x=1762523118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1vtve7xgnWRe/vOdHtoREn4DAu8sZ2mMOpzTrHCPaxI=;
 b=SopuIB/Y4/qJfkG9gcnGFrPiBORGBOs17a5nWgBwvI1rAXpzdebv8NwWkwIh77iPRR
 nW+wwYLZk/qBvItau97ISUol/UYcHFJ9x+UG0TicYz8FqJ77oi7lQWe4jE7UvhUwv+XC
 WFoS12ZI0xdBXXzgZ1EE9ZlNz1b5gRKi5kdnGDseAijc2ip/gIaDcRMAUlMgBAQVhsb5
 obsZQaqn+Wwe288Sq1pst8KYr5sG/Z24/SlJaVd6itxtiJEID4zO3/dmjzhDegpDCmDw
 Ev6RrkBooiU6MkaoaaeNUu3fwtfsTEnazgqVx+XU3SfwyFKCLl2ubWMJA3CcIrqbJxLQ
 gYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761918318; x=1762523118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1vtve7xgnWRe/vOdHtoREn4DAu8sZ2mMOpzTrHCPaxI=;
 b=hrLpqHofey1e/z3wWwDANsEfKI13ki4HENNLxIKe0f7iaRRHOaqAyw57uMsJ3KrBl6
 UlF8gxieEeoI8a5BiG+vQfK6UVzh33Mjouc7XP8xi5NmJTK33xm1eg+xtyQZ+A+zXcAT
 +Pj3W9H4hGkQY7K4kvVOv9jgvnCsvMgaVXXEvkrkIjr/o0xk0EYRsBTs8+hIgcIaw1YU
 BnCp6HEW7xsK1u9IkP3s06bJOuGMbs643NNH2p+X6RTN+jVvCtLuiOkcAe6xd5GTNFY9
 kJrLomTz/DEer8RL9IjWBfvUr5b9MHzJWiJr5eey7IkqJB5ZgI0DaJbawjSJ3qDYyf6v
 Pt6g==
X-Gm-Message-State: AOJu0Yz2zod3aOZQPWZik6Xo6r2yG4PX1dUBj4GVuW6R6CqN0DKcfVEu
 HZA4ntVQ0ycBnF89MKBQK9uYYFn/tM3QQycGv3eljWyWHDVrs1Er65KC
X-Gm-Gg: ASbGnctNqDzN77DvQcjOLb4NCghGI9Z9PgmTpW4OlzLHatTgzlHkosndloE0Nc3TYHQ
 nx+/u/vjqbP7X6bhYOOPWTi86e6RSuRYoTjogw04t/AvWSMdbp5wXwcAQkJrNhqvqrdIsdgyh4g
 gZ+1MZFDFh6DehOyF0hFYix4EN1oKtL1omf3RpCd/SMduq1dG5vJ9Ff9lu8ILww4peWK41vKaUj
 1LZ3lxIsXKyhK0PiAVsHO6kfufPYIqfErD/Kt5wP2yq1QiPfoqNlTnQmNRf0Eon9B2sfPoHyRRM
 qGXQY8XeN89egKaN4eFhggm9IhFgFEgIZ5RukJtmiJHNXkQYdkJQeaZiR8zNb20qmhZTE08TQTb
 5DYlk5+gUP6omldHjhBCLBL5/zXlkUgiEYMuApZIgkmpCxwfJ9SLxEJeWRH3RKvTki/8MwNoefd
 m5tsnpQj+IMLNvVF8UyYo2/Fwt
X-Google-Smtp-Source: AGHT+IGIzclpM7lnvjdWsgUHdOVq6+rOhqTzcODwfT9Xra3mnD/4VUOCxNJ4wncXtuaa4hG4XwxhCQ==
X-Received: by 2002:a05:600c:c178:b0:46d:9d28:fb5e with SMTP id
 5b1f17b1804b1-4773a7384c3mr11798345e9.5.1761918318217; 
 Fri, 31 Oct 2025 06:45:18 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1599:7d00:73cb:d446:bf90:f1c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732fe119bsm34502635e9.10.2025.10.31.06.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:45:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 18/20] drm/xe: Drop HW fence slab
Date: Fri, 31 Oct 2025 14:16:52 +0100
Message-ID: <20251031134442.113648-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031134442.113648-1-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
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

