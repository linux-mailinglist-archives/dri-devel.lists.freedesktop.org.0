Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DD9C18396
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 05:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C461B10E04A;
	Wed, 29 Oct 2025 04:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131DF10E04A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 04:12:03 +0000 (UTC)
X-UUID: 687dbf04b47d11f0a38c85956e01ac42-20251029
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:24ce07cd-caf3-4987-ad82-1f3ea74b1d01, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:10746e5ee0c5b761bd759bb49646ec09,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|15|50,EDM:-3,IP
 :nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 687dbf04b47d11f0a38c85956e01ac42-20251029
X-User: hehuiwen@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <hehuiwen@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 235195869; Wed, 29 Oct 2025 12:11:56 +0800
From: Huiwen He <hehuiwen@kylinos.cn>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Huiwen He <hehuiwen@kylinos.cn>
Subject: [PATCH] drm/i915: remove redundant __GFP_NOWARN
Date: Wed, 29 Oct 2025 12:11:44 +0800
Message-Id: <20251029041144.449363-1-hehuiwen@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

The __GFP_NOWARN flag was included in GFP_NOWAIT since commit
16f5dfbc851b ("gfp: include __GFP_NOWARN in GFP_NOWAIT"). So
remove the redundant __GFP_NOWARN flag.

Signed-off-by: Huiwen He <hehuiwen@kylinos.cn>
---
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 4 ++--
 drivers/gpu/drm/i915/i915_active.c               | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 8d4bb95f8424..22432912db2e 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -220,7 +220,7 @@ static void heartbeat(struct work_struct *wrk)
 		goto out;
 	}
 
-	rq = heartbeat_create(ce, GFP_NOWAIT | __GFP_NOWARN);
+	rq = heartbeat_create(ce, GFP_NOWAIT);
 	if (IS_ERR(rq))
 		goto unlock;
 
@@ -282,7 +282,7 @@ static int __intel_engine_pulse(struct intel_engine_cs *engine)
 	GEM_BUG_ON(!intel_engine_has_preemption(engine));
 	GEM_BUG_ON(!intel_engine_pm_is_awake(engine));
 
-	rq = heartbeat_create(ce, GFP_NOWAIT | __GFP_NOWARN);
+	rq = heartbeat_create(ce, GFP_NOWAIT);
 	if (IS_ERR(rq))
 		return PTR_ERR(rq);
 
diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 6b0c1162505a..f3acce9c1195 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -725,8 +725,7 @@ int i915_request_await_active(struct i915_request *rq,
 
 static int sw_await_fence(void *arg, struct dma_fence *fence)
 {
-	return i915_sw_fence_await_dma_fence(arg, fence, 0,
-					     GFP_NOWAIT | __GFP_NOWARN);
+	return i915_sw_fence_await_dma_fence(arg, fence, 0, GFP_NOWAIT);
 }
 
 int i915_sw_fence_await_active(struct i915_sw_fence *fence,
-- 
2.25.1

