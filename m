Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC78C75DB
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 14:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD40B10ECA0;
	Thu, 16 May 2024 12:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jo1pgb4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA9610EC98;
 Thu, 16 May 2024 12:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3k2ElnK03S3i3Q6UkNBsqu5VyXmT1AMp8qwZV0UTPpk=; b=jo1pgb4H33HCOh8I02xaMIj+lf
 PurxYmHzNknLQTY3845N1qYJqqT0gFVORr+WuRUfPgVjinPJnnMpBFdP4Of5S2DiY6ImvQ4Yk7vJU
 YcXbPzMr+CJfJ7eIVwCGvShLdoL1w+sf2Ft0EsISbUivKoHgUGqLIlPYb59VjPDozww0TOAhgGfzS
 ZKVyfKEWMjeEePc8K8nc91ORS0I1HDVt4H9truETJnvAnY57upeQWGa9MOaeSkHXMlhgd+B82Yw5G
 RxJzDuSEe2xu01FtqzLr0RjarmoecfDX0pUW8jg/Px6MpA4dEaDpumRXHeqiTgkyFWKD4vUwCYJiO
 kjbXXs/w==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s7a42-008odo-3o; Thu, 16 May 2024 14:18:26 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
Subject: [RFC 2/2] drm/amdgpu: Actually respect buffer migration budget
Date: Thu, 16 May 2024 13:18:22 +0100
Message-ID: <20240516121822.19036-3-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516121822.19036-1-tursulin@igalia.com>
References: <20240516121822.19036-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Current code appears to live in a misconception that playing with buffer
allowed and preferred placements can always control the decision on
whether backing store migration will be attempted or not.

That is however not the case when userspace sets buffer placements of
VRAM+GTT, which is what radv does since commit 862b6a9a ("radv: Improve
spilling on discrete GPUs."), with the end result of completely ignoring
the migration budget.

Fix this by validating against a local singleton placement set to the
current backing store location. This way, when migration budget has been
depleted, we can prevent ttm_bo_validate from seeing any other than the
current placement.

For the case of implicit GTT allowed domain added in amdgpu_bo_create
when userspace only sets VRAM the behaviour should be the same. On the
first pass the re-validation will attempt to migrate away from the
fallback GTT domain, and if that did not succeed the buffer will remain in
the fallback placement.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Friedrich Vock <friedrich.vock@gmx.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 112 +++++++++++++++++++------
 1 file changed, 85 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index ec888fc6ead8..08e7631f3a2e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -32,6 +32,7 @@
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_syncobj.h>
+#include <drm/drm_print.h>
 #include <drm/ttm/ttm_tt.h>
 
 #include "amdgpu_cs.h"
@@ -775,6 +776,56 @@ void amdgpu_cs_report_moved_bytes(struct amdgpu_device *adev, u64 num_bytes,
 	spin_unlock(&adev->mm_stats.lock);
 }
 
+static bool
+amdgpu_cs_bo_move_under_budget(struct amdgpu_cs_parser *p,
+			       struct amdgpu_bo *abo)
+{
+	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
+
+	/*
+	 * Don't move this buffer if we have depleted our allowance
+	 * to move it. Don't move anything if the threshold is zero.
+	 */
+	if (p->bytes_moved >= p->bytes_moved_threshold)
+		return false;
+
+	if ((!abo->tbo.base.dma_buf ||
+	     list_empty(&abo->tbo.base.dma_buf->attachments)) &&
+	    (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
+	     (abo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)) &&
+	    p->bytes_moved_vis >= p->bytes_moved_vis_threshold) {
+		/*
+		 * And don't move a CPU_ACCESS_REQUIRED BO to limited
+		 * visible VRAM if we've depleted our allowance to do
+		 * that.
+		 */
+		return false;
+	}
+
+	return true;
+}
+
+static bool
+amdgpu_bo_fill_current_placement(struct amdgpu_bo *abo,
+				 struct ttm_placement *placement,
+				 struct ttm_place *place)
+{
+	struct ttm_placement *bo_placement = &abo->placement;
+	int i;
+
+	for (i = 0; i < bo_placement->num_placement; i++) {
+		if (bo_placement->placement[i].mem_type ==
+		    abo->tbo.resource->mem_type) {
+			*place = bo_placement->placement[i];
+			placement->num_placement = 1;
+			placement->placement = place;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
@@ -784,46 +835,53 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
 		.no_wait_gpu = false,
 		.resv = bo->tbo.base.resv
 	};
-	uint32_t domain;
+	bool allow_move;
 	int r;
 
 	if (bo->tbo.pin_count)
 		return 0;
 
-	/* Don't move this buffer if we have depleted our allowance
-	 * to move it. Don't move anything if the threshold is zero.
-	 */
-	if (p->bytes_moved < p->bytes_moved_threshold &&
-	    (!bo->tbo.base.dma_buf ||
-	    list_empty(&bo->tbo.base.dma_buf->attachments))) {
-		if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
-		    (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)) {
-			/* And don't move a CPU_ACCESS_REQUIRED BO to limited
-			 * visible VRAM if we've depleted our allowance to do
-			 * that.
-			 */
-			if (p->bytes_moved_vis < p->bytes_moved_vis_threshold)
-				domain = bo->preferred_domains;
-			else
-				domain = bo->allowed_domains;
-		} else {
-			domain = bo->preferred_domains;
-		}
-	} else {
-		domain = bo->allowed_domains;
-	}
+	if (!bo->tbo.resource || amdgpu_cs_bo_move_under_budget(p, bo))
+		allow_move = true;
+	else
+		allow_move = false;
 
+	amdgpu_bo_placement_from_domain(bo, bo->allowed_domains);
 retry:
-	amdgpu_bo_placement_from_domain(bo, domain);
-	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+	if (allow_move) {
+		r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+	} else {
+		struct ttm_placement same_placement = { };
+		struct ttm_place same_place;
+		bool placement_found;
+
+		placement_found =
+			amdgpu_bo_fill_current_placement(bo,
+							 &same_placement,
+							 &same_place);
+
+		if (drm_WARN_ON_ONCE(&adev->ddev, !placement_found)) {
+			/*
+			 * QQQ
+			 * Current placement not in the bo->allowed_domains set.
+			 * Can this happen?
+			 * QQQ
+			 */
+			allow_move = true;
+			goto retry;
+		}
+
+		r = ttm_bo_validate(&bo->tbo, &same_placement, &ctx);
+	}
 
 	p->bytes_moved += ctx.bytes_moved;
 	if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
 	    amdgpu_res_cpu_visible(adev, bo->tbo.resource))
 		p->bytes_moved_vis += ctx.bytes_moved;
 
-	if (unlikely(r == -ENOMEM) && domain != bo->allowed_domains) {
-		domain = bo->allowed_domains;
+	if (unlikely(r == -ENOMEM) && !allow_move) {
+		ctx.bytes_moved = 0;
+		allow_move = true;
 		goto retry;
 	}
 
-- 
2.44.0

