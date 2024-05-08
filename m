Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4E48C0423
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 20:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9B110FD21;
	Wed,  8 May 2024 18:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Hz6UPqW0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488C8112975;
 Wed,  8 May 2024 18:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=34o9j38lIuPsAWMIr1s1WCxeQDVWEE3VRdir/CEHm8o=; b=Hz6UPqW0bjh6dE/iopvMADKk3F
 1Me4hYL4or1Z3oGlasSEIrLJBEc6NprRn3hA5uKmEcVrE+Aen8/oXY93ygebyNtOXbL7+hTvJhJNp
 XlbxcyGVRJWFUhG01FRP6asBDwh43SafaSw/+/EPdSjkOAUizCgK8N+qdMZzHURaGMmwieRYUOJCD
 Fwcn71zbfrvSFmxvySrz8fvsSTOUJcKeoYN0GQzdXP4mvgZakJvgW3fFI56mFliOoc9CtMQePVxOi
 wBWK2VOfyHjhpBTpo7Y34fTGNDAZ/qLcW8qhAPiKn4sQNOEl/bNcUiKqPAWGhykqAFf3jwKZvQGqq
 WdwLp+CQ==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s4ljq-002zRn-At; Wed, 08 May 2024 20:09:58 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
Subject: [RFC 4/5] drm/amdgpu: Use preferred placement for VRAM+GTT
Date: Wed,  8 May 2024 19:09:44 +0100
Message-ID: <20240508180946.96863-5-tursulin@igalia.com>
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

Now that TTM has the preferred placement flag, extend the current
workaround which assumes the GTT placement as fallback in the presence of
the additional VRAM placement.

By marking the VRAM placement as preferred we will make the buffer re-
validation phase actually attempt to migrate them back to VRAM.

Without it, TTM core logic is happy to leave them in GTT placement
"forever".

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Friedrich Vock <friedrich.vock@gmx.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 50b7e7c0ce50..9be767357e86 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -128,8 +128,8 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
 	struct ttm_placement *placement = &abo->placement;
 	struct ttm_place *places = abo->placements;
+	int c = 0, vram_index = -1;
 	u64 flags = abo->flags;
-	u32 c = 0;
 
 	if (domain & AMDGPU_GEM_DOMAIN_VRAM) {
 		unsigned int visible_pfn = adev->gmc.visible_vram_size >> PAGE_SHIFT;
@@ -158,7 +158,7 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 		    flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS)
 			places[c].flags |= TTM_PL_FLAG_CONTIGUOUS;
 
-		c++;
+		vram_index = c++;
 	}
 
 	if (domain & AMDGPU_GEM_DOMAIN_DOORBELL) {
@@ -180,8 +180,10 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 		 * When GTT is just an alternative to VRAM make sure that we
 		 * only use it as fallback and still try to fill up VRAM first.
 		 */
-		if (domain & abo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM)
+		if (vram_index >= 0) {
 			places[c].flags |= TTM_PL_FLAG_FALLBACK;
+			places[vram_index].flags |= TTM_PL_FLAG_PREFERRED;
+		}
 		c++;
 	}
 
-- 
2.44.0

