Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849B091E659
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 19:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33CC10E4A8;
	Mon,  1 Jul 2024 17:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E54910E4AE
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 17:14:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sOKc5-0002p9-2z; Mon, 01 Jul 2024 19:14:49 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sOKc4-006Q8D-0C; Mon, 01 Jul 2024 19:14:48 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH 2/4] drm/amdgpu: mostly revert "fix force APP kill hang(v4)"
Date: Mon,  1 Jul 2024 19:14:45 +0200
Message-Id: <20240701171447.3823888-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240701171447.3823888-1-l.stach@pengutronix.de>
References: <20240701171447.3823888-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

From: Christian König <ckoenig.leichtzumerken@gmail.com>

This reverts commit 8ee3a52e3f35e064a3bf82f21dc74ddaf9843648.

The new amdgpu_ctx_mgr_entity_fini() was never called, so it was pure
coincident that this patch didn't cause a crash. Since the workaround
shouldn't be needed any more just mostly revert the changes to amdgpu.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2:
- rebased to v6.10-rc1
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 59 ++-----------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
 3 files changed, 5 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 5cb33ac99f70..56f2428813e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -284,7 +284,7 @@ static ktime_t amdgpu_ctx_fini_entity(struct amdgpu_device *adev,
 	}
 
 	amdgpu_xcp_release_sched(adev, entity);
-
+	drm_sched_entity_destroy(&entity->entity);
 	kfree(entity);
 	return res;
 }
@@ -503,24 +503,6 @@ static int amdgpu_ctx_alloc(struct amdgpu_device *adev,
 	return r;
 }
 
-static void amdgpu_ctx_do_release(struct kref *ref)
-{
-	struct amdgpu_ctx *ctx;
-	u32 i, j;
-
-	ctx = container_of(ref, struct amdgpu_ctx, refcount);
-	for (i = 0; i < AMDGPU_HW_IP_NUM; ++i) {
-		for (j = 0; j < amdgpu_ctx_num_entities[i]; ++j) {
-			if (!ctx->entities[i][j])
-				continue;
-
-			drm_sched_entity_destroy(&ctx->entities[i][j]->entity);
-		}
-	}
-
-	amdgpu_ctx_fini(ref);
-}
-
 static int amdgpu_ctx_free(struct amdgpu_fpriv *fpriv, uint32_t id)
 {
 	struct amdgpu_ctx_mgr *mgr = &fpriv->ctx_mgr;
@@ -529,7 +511,7 @@ static int amdgpu_ctx_free(struct amdgpu_fpriv *fpriv, uint32_t id)
 	mutex_lock(&mgr->lock);
 	ctx = idr_remove(&mgr->ctx_handles, id);
 	if (ctx)
-		kref_put(&ctx->refcount, amdgpu_ctx_do_release);
+		kref_put(&ctx->refcount, amdgpu_ctx_fini);
 	mutex_unlock(&mgr->lock);
 	return ctx ? 0 : -EINVAL;
 }
@@ -742,7 +724,7 @@ int amdgpu_ctx_put(struct amdgpu_ctx *ctx)
 	if (ctx == NULL)
 		return -EINVAL;
 
-	kref_put(&ctx->refcount, amdgpu_ctx_do_release);
+	kref_put(&ctx->refcount, amdgpu_ctx_fini);
 	return 0;
 }
 
@@ -911,45 +893,12 @@ long amdgpu_ctx_mgr_entity_flush(struct amdgpu_ctx_mgr *mgr, long timeout)
 	return timeout;
 }
 
-void amdgpu_ctx_mgr_entity_fini(struct amdgpu_ctx_mgr *mgr)
-{
-	struct amdgpu_ctx *ctx;
-	struct idr *idp;
-	uint32_t id, i, j;
-
-	idp = &mgr->ctx_handles;
-
-	idr_for_each_entry(idp, ctx, id) {
-		if (kref_read(&ctx->refcount) != 1) {
-			DRM_ERROR("ctx %p is still alive\n", ctx);
-			continue;
-		}
-
-		for (i = 0; i < AMDGPU_HW_IP_NUM; ++i) {
-			for (j = 0; j < amdgpu_ctx_num_entities[i]; ++j) {
-				struct drm_sched_entity *entity;
-
-				if (!ctx->entities[i][j])
-					continue;
-
-				entity = &ctx->entities[i][j]->entity;
-				drm_sched_entity_fini(entity);
-			}
-		}
-	}
-}
-
 void amdgpu_ctx_mgr_fini(struct amdgpu_ctx_mgr *mgr)
 {
 	struct amdgpu_ctx *ctx;
-	struct idr *idp;
 	uint32_t id;
 
-	amdgpu_ctx_mgr_entity_fini(mgr);
-
-	idp = &mgr->ctx_handles;
-
-	idr_for_each_entry(idp, ctx, id) {
+	idr_for_each_entry(&mgr->ctx_handles, ctx, id) {
 		if (kref_put(&ctx->refcount, amdgpu_ctx_fini) != 1)
 			DRM_ERROR("ctx %p is still alive\n", ctx);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
index 85376baaa92f..090dfe86f75b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
@@ -92,7 +92,6 @@ int amdgpu_ctx_wait_prev_fence(struct amdgpu_ctx *ctx,
 
 void amdgpu_ctx_mgr_init(struct amdgpu_ctx_mgr *mgr,
 			 struct amdgpu_device *adev);
-void amdgpu_ctx_mgr_entity_fini(struct amdgpu_ctx_mgr *mgr);
 long amdgpu_ctx_mgr_entity_flush(struct amdgpu_ctx_mgr *mgr, long timeout);
 void amdgpu_ctx_mgr_fini(struct amdgpu_ctx_mgr *mgr);
 void amdgpu_ctx_mgr_usage(struct amdgpu_ctx_mgr *mgr,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index a0ea6fe8d060..9513cf94defb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1401,6 +1401,7 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 		return;
 
 	pm_runtime_get_sync(dev->dev);
+	amdgpu_ctx_mgr_fini(&fpriv->ctx_mgr);
 
 	if (amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_UVD) != NULL)
 		amdgpu_uvd_free_handles(adev, file_priv);
@@ -1424,7 +1425,6 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 		amdgpu_bo_unreserve(pd);
 	}
 
-	amdgpu_ctx_mgr_fini(&fpriv->ctx_mgr);
 	amdgpu_vm_fini(adev, &fpriv->vm);
 
 	if (pasid)
-- 
2.39.2

