Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB39965F75
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 12:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E080710EA78;
	Fri, 30 Aug 2024 10:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qdxOS/ej";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E963710EA63
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725014459;
 bh=OXnC9WCTsreZVOplRshz6ldc8Yb1csM/CfRNKGFyXA0=;
 h=From:To:Cc:Subject:Date:From;
 b=qdxOS/ejC8k3kIisEoMiJKouF5g394DPoXd2W3St1mBv8mNy4fY+goigXoXvawCkg
 JcNDEQCVecmubfqWJNQYSMs21jbQQ6GQ8a/whpTBSEHGBolDUnk5WYZ29+hW+Ndb/a
 5/lTh5Xwxp5eQIA/h0maDcZOoWfG1Z4NG4tslPVAB234ClsJUSIbh5EF28cm+N37Mj
 sajvSPt8jW0zgZ3cFlgWsJne8zaH5u40YjgUrHi4Wrzwzq89kzVdV50l0rHd/iN2IR
 cDpZvyND94J9YCRVmAESGp6AmG4bPui4eYZMRzKSJma8uWm1iaKl0m5mfejBH58Nff
 hFwPy5SBdCQEg==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E2A717E0FAD;
 Fri, 30 Aug 2024 12:40:59 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH] drm/sched: Make sure drm_sched_fence_ops don't vanish
Date: Fri, 30 Aug 2024 12:40:57 +0200
Message-ID: <20240830104057.1479321-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.46.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma_fence objects created by drm_sched might hit other subsystems, which
means the fence object might potentially outlive the drm_sched module
lifetime, and at this point the dma_fence::ops points to a memory region
that no longer exists.

In order to fix that, let's make sure the drm_sched_fence code is always
statically linked, just like dma-fence{-chain}.c does.

Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Just like for the other UAF fix, this is an RFC, as I'm not sure that's
how we want it fixed. The other option we have is to retain a module ref
for each initialized fence and release it when the fence is freed.
---
 drivers/gpu/drm/Makefile                |  2 +-
 drivers/gpu/drm/scheduler/Makefile      |  7 ++++++-
 drivers/gpu/drm/scheduler/sched_fence.c | 21 +++++++++------------
 drivers/gpu/drm/scheduler/sched_main.c  |  3 +++
 4 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 68cc9258ffc4..b97127da58b7 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -158,7 +158,7 @@ obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
 obj-y			+= arm/
 obj-y			+= display/
 obj-$(CONFIG_DRM_TTM)	+= ttm/
-obj-$(CONFIG_DRM_SCHED)	+= scheduler/
+obj-y			+= scheduler/
 obj-$(CONFIG_DRM_RADEON)+= radeon/
 obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
 obj-$(CONFIG_DRM_AMDGPU)+= amd/amdxcp/
diff --git a/drivers/gpu/drm/scheduler/Makefile b/drivers/gpu/drm/scheduler/Makefile
index 53863621829f..bc18d26f27a1 100644
--- a/drivers/gpu/drm/scheduler/Makefile
+++ b/drivers/gpu/drm/scheduler/Makefile
@@ -20,6 +20,11 @@
 # OTHER DEALINGS IN THE SOFTWARE.
 #
 #
-gpu-sched-y := sched_main.o sched_fence.o sched_entity.o
+
+# sched_fence.c contains dma_fence_ops that can't go away, so make sure it's
+# statically linked when CONFIG_DRM_SCHED=m
+obj-y += $(if $(CONFIG_DRM_SCHED),sched_fence.o,)
+
+gpu-sched-y := sched_main.o sched_entity.o
 
 obj-$(CONFIG_DRM_SCHED) += gpu-sched.o
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index efa2a71d98eb..ac65589476dd 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -39,12 +39,7 @@ static int __init drm_sched_fence_slab_init(void)
 
 	return 0;
 }
-
-static void __exit drm_sched_fence_slab_fini(void)
-{
-	rcu_barrier();
-	kmem_cache_destroy(sched_fence_slab);
-}
+subsys_initcall(drm_sched_fence_slab_init);
 
 static void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
 				       struct dma_fence *fence)
@@ -74,6 +69,7 @@ void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
 
 	dma_fence_signal(&fence->scheduled);
 }
+EXPORT_SYMBOL(drm_sched_fence_scheduled);
 
 void drm_sched_fence_finished(struct drm_sched_fence *fence, int result)
 {
@@ -81,6 +77,7 @@ void drm_sched_fence_finished(struct drm_sched_fence *fence, int result)
 		dma_fence_set_error(&fence->finished, result);
 	dma_fence_signal(&fence->finished);
 }
+EXPORT_SYMBOL(drm_sched_fence_finished);
 
 static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
 {
@@ -118,6 +115,7 @@ void drm_sched_fence_free(struct drm_sched_fence *fence)
 	if (!WARN_ON_ONCE(fence->timeline))
 		kmem_cache_free(sched_fence_slab, fence);
 }
+EXPORT_SYMBOL(drm_sched_fence_free);
 
 /**
  * drm_sched_fence_release_scheduled - callback that fence can be freed
@@ -210,6 +208,9 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
 {
 	struct drm_sched_fence *fence = NULL;
 
+	if (unlikely(!sched_fence_slab))
+		return NULL;
+
 	fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
 	if (fence == NULL)
 		return NULL;
@@ -219,6 +220,7 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
 
 	return fence;
 }
+EXPORT_SYMBOL(drm_sched_fence_alloc);
 
 void drm_sched_fence_init(struct drm_sched_fence *fence,
 			  struct drm_sched_entity *entity)
@@ -234,9 +236,4 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
 		       &fence->lock, entity->fence_context + 1, seq);
 }
-
-module_init(drm_sched_fence_slab_init);
-module_exit(drm_sched_fence_slab_fini);
-
-MODULE_DESCRIPTION("DRM GPU scheduler");
-MODULE_LICENSE("GPL and additional rights");
+EXPORT_SYMBOL(drm_sched_fence_init);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 1e31a9c8ce15..eaaf086eab30 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1467,3 +1467,6 @@ void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
 	queue_work(sched->submit_wq, &sched->work_free_job);
 }
 EXPORT_SYMBOL(drm_sched_wqueue_start);
+
+MODULE_DESCRIPTION("DRM GPU scheduler");
+MODULE_LICENSE("GPL and additional rights");
-- 
2.46.0

