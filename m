Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441C891E65C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 19:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F163410E4B0;
	Mon,  1 Jul 2024 17:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E233A10E4A0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 17:14:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sOKc5-0002pA-2r; Mon, 01 Jul 2024 19:14:49 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sOKc4-006Q8D-3N; Mon, 01 Jul 2024 19:14:48 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH 3/4] drm/amdgpu: use new scheduler accounting
Date: Mon,  1 Jul 2024 19:14:46 +0200
Message-Id: <20240701171447.3823888-3-l.stach@pengutronix.de>
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

Instead of implementing this ourself.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2:
- rebased to v6.10-rc1
- adapted to match new function names
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 52 ++++---------------------
 1 file changed, 8 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 56f2428813e8..392f51e0b2e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -166,41 +166,6 @@ static unsigned int amdgpu_ctx_get_hw_prio(struct amdgpu_ctx *ctx, u32 hw_ip)
 	return hw_prio;
 }
 
-/* Calculate the time spend on the hw */
-static ktime_t amdgpu_ctx_fence_time(struct dma_fence *fence)
-{
-	struct drm_sched_fence *s_fence;
-
-	if (!fence)
-		return ns_to_ktime(0);
-
-	/* When the fence is not even scheduled it can't have spend time */
-	s_fence = to_drm_sched_fence(fence);
-	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &s_fence->scheduled.flags))
-		return ns_to_ktime(0);
-
-	/* When it is still running account how much already spend */
-	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &s_fence->finished.flags))
-		return ktime_sub(ktime_get(), s_fence->scheduled.timestamp);
-
-	return ktime_sub(s_fence->finished.timestamp,
-			 s_fence->scheduled.timestamp);
-}
-
-static ktime_t amdgpu_ctx_entity_time(struct amdgpu_ctx *ctx,
-				      struct amdgpu_ctx_entity *centity)
-{
-	ktime_t res = ns_to_ktime(0);
-	uint32_t i;
-
-	spin_lock(&ctx->ring_lock);
-	for (i = 0; i < amdgpu_sched_jobs; i++) {
-		res = ktime_add(res, amdgpu_ctx_fence_time(centity->fences[i]));
-	}
-	spin_unlock(&ctx->ring_lock);
-	return res;
-}
-
 static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 				  const u32 ring)
 {
@@ -272,18 +237,17 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 static ktime_t amdgpu_ctx_fini_entity(struct amdgpu_device *adev,
 				  struct amdgpu_ctx_entity *entity)
 {
-	ktime_t res = ns_to_ktime(0);
+	ktime_t res;
 	int i;
 
 	if (!entity)
-		return res;
+		return res = ns_to_ktime(0);
 
-	for (i = 0; i < amdgpu_sched_jobs; ++i) {
-		res = ktime_add(res, amdgpu_ctx_fence_time(entity->fences[i]));
+	for (i = 0; i < amdgpu_sched_jobs; ++i)
 		dma_fence_put(entity->fences[i]);
-	}
 
 	amdgpu_xcp_release_sched(adev, entity);
+	res = drm_sched_entity_time_spent(&entity->entity);
 	drm_sched_entity_destroy(&entity->entity);
 	kfree(entity);
 	return res;
@@ -748,9 +712,6 @@ uint64_t amdgpu_ctx_add_fence(struct amdgpu_ctx *ctx,
 	centity->sequence++;
 	spin_unlock(&ctx->ring_lock);
 
-	atomic64_add(ktime_to_ns(amdgpu_ctx_fence_time(other)),
-		     &ctx->mgr->time_spend[centity->hw_ip]);
-
 	dma_fence_put(other);
 	return seq;
 }
@@ -930,12 +891,15 @@ void amdgpu_ctx_mgr_usage(struct amdgpu_ctx_mgr *mgr,
 		for (hw_ip = 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
 			for (i = 0; i < amdgpu_ctx_num_entities[hw_ip]; ++i) {
 				struct amdgpu_ctx_entity *centity;
+				struct drm_sched_entity *entity;
 				ktime_t spend;
 
 				centity = ctx->entities[hw_ip][i];
 				if (!centity)
 					continue;
-				spend = amdgpu_ctx_entity_time(ctx, centity);
+
+				entity = &centity->entity;
+				spend = drm_sched_entity_time_spent(entity);
 				usage[hw_ip] = ktime_add(usage[hw_ip], spend);
 			}
 		}
-- 
2.39.2

