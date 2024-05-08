Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3515D8C0428
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 20:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AED411316E;
	Wed,  8 May 2024 18:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ih0YCcGw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB9510FD21;
 Wed,  8 May 2024 18:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UpMA+65rY/sCkvxdYJyDdP6Zw8ALk8gPEl4rfTRAbv0=; b=ih0YCcGwNC7cEr2a33Ua621HZs
 b/NJ+kwnN/tB0qdnjCXOKCnCQk2kKgyOE7QhCJSfIDS9Gdto1YqdaP8HhhTRrgwmGQG7aWg4spEUn
 buxKB/OYjbVP6D70og4UIRRzMq/HuuQnz7dm6bLVuYCXEYuL6YVXp6PmPl78q8xIPQAg5PHp4IrZe
 b1e3byDol+8USoHEJy+X4m+8q/WIAxrKkZVJlychTDttzwSGQaz8l8B0uakHWVcepLXy3lrXEsIEf
 uzxRTVim63kP0DuRdUy95goio3qktHsyC+YWsTyC76OqVGvzNM/pkmR4BbPcXgqsC6W2Xj6SsrQdp
 5H+rQaqg==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s4ljo-002zRV-Vu; Wed, 08 May 2024 20:09:57 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
Subject: [RFC 2/5] drm/amdgpu: Actually respect buffer migration budget
Date: Wed,  8 May 2024 19:09:42 +0100
Message-ID: <20240508180946.96863-3-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508180946.96863-1-tursulin@igalia.com>
References: <20240508180946.96863-1-tursulin@igalia.com>
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
allowed and preferred placements can control the decision on whether
backing store migration will be attempted or not.

Both from code inspection and from empirical experiments I see that not
being true, and that both allowed and preferred placement are typically
set to the same bitmask.

As such, when the code decides to throttle the migration for a client, it
is in fact not achieving anything. Buffers can still be either migrated or
not migrated based on the external (to this function and facility) logic.

Fix it by not changing the buffer object placements if the migration
budget has been spent.

FIXME:
Is it still required to call validate is the question..

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Friedrich Vock <friedrich.vock@gmx.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 22708954ae68..d07a1dd7c880 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -784,6 +784,7 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
 		.no_wait_gpu = false,
 		.resv = bo->tbo.base.resv
 	};
+	bool migration_allowed = true;
 	struct ttm_resource *old_res;
 	uint32_t domain;
 	int r;
@@ -805,19 +806,24 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
 			 * visible VRAM if we've depleted our allowance to do
 			 * that.
 			 */
-			if (p->bytes_moved_vis < p->bytes_moved_vis_threshold)
+			if (p->bytes_moved_vis < p->bytes_moved_vis_threshold) {
 				domain = bo->preferred_domains;
-			else
+			} else {
 				domain = bo->allowed_domains;
+				migration_allowed = false;
+			}
 		} else {
 			domain = bo->preferred_domains;
 		}
 	} else {
 		domain = bo->allowed_domains;
+		migration_allowed = false;
 	}
 
 retry:
-	amdgpu_bo_placement_from_domain(bo, domain);
+	if (migration_allowed)
+		amdgpu_bo_placement_from_domain(bo, domain);
+
 	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
 
 	if (unlikely(r == -ENOMEM) && domain != bo->allowed_domains) {
-- 
2.44.0

