Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EF78C0424
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 20:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26D5112789;
	Wed,  8 May 2024 18:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fiW9rLy3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B178A112789;
 Wed,  8 May 2024 18:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jYsZ7Fu2L4pp8H27VmXuU5XxAlsuQnrZ+kETz1DjTvQ=; b=fiW9rLy3UZk0iK+wqSgQJ15MpE
 t/S2LMfEpRvvkD3+qaJKDio/xvWW5yi58v05ujeIwXDbAP19leTdYB0HjpH2Hem/9hhnMZDPtO3eM
 gQmGva6IrnCwGqtZa0RX0uelRovA661IXogwb4y2wN7BNnQwsrd9V8gXiiJCCjTeOJbTtp5qvYeAI
 WagIkTTbw4VuPMLoIQOzplO7VcpP3XcaqPwZCJ3dVi354Cg+tmGxAbd0leEXcR96FMFtuD28a4Mjw
 RYdsB8Q8jm086vmlAHDZOedy3vSKC1LNgHe/yrM408p39AKUeCwjJKpdAvRJdKfVFiYvmCnL0ognY
 aYyjN03A==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s4ljp-002zRe-LL; Wed, 08 May 2024 20:09:57 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
Subject: [RFC 3/5] drm/ttm: Add preferred placement flag
Date: Wed,  8 May 2024 19:09:43 +0100
Message-ID: <20240508180946.96863-4-tursulin@igalia.com>
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

Currently the fallback placement flag can achieve a hint that buffer
should be migrated back to the non-fallback placement, however that only
works while there is no memory pressure. As soon as we reach full VRAM
utilisation, or worse overcommit, the logic is happy to leave buffers in
the fallback placement. Consequence of this is that once buffers are
evicted they never get considered to be migrated back until the memory
pressure subsides, leaving a potentially active client not able to bring
its buffers back in.

Add a "preferred" placement flag which drivers can set when they want some
extra effort to be attempted for bringing a buffer back in.

QQQ:
Is the current "desired" flag unfortunately named perhaps? I ended up
understanding it as more like "would be nice if possible but absolutely
don't bother under memory pressure".

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Friedrich Vock <friedrich.vock@gmx.de>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 13 +++++++++----
 include/drm/ttm/ttm_placement.h    |  3 +++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 4a66b851b67d..59f3d1bcc11f 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -305,6 +305,8 @@ bool ttm_resource_compatible(struct ttm_resource *res,
 			     struct ttm_placement *placement,
 			     bool evicting)
 {
+	const u32 incompatible_flag = evicting ? TTM_PL_FLAG_DESIRED :
+						 TTM_PL_FLAG_FALLBACK;
 	struct ttm_buffer_object *bo = res->bo;
 	struct ttm_device *bdev = bo->bdev;
 	unsigned i;
@@ -316,11 +318,14 @@ bool ttm_resource_compatible(struct ttm_resource *res,
 		const struct ttm_place *place = &placement->placement[i];
 		struct ttm_resource_manager *man;
 
-		if (res->mem_type != place->mem_type)
-			continue;
+		if (res->mem_type != place->mem_type) {
+			if (place->flags & TTM_PL_FLAG_PREFERRED)
+				return false;
+			else
+				continue;
+		}
 
-		if (place->flags & (evicting ? TTM_PL_FLAG_DESIRED :
-				    TTM_PL_FLAG_FALLBACK))
+		if (place->flags & incompatible_flag)
 			continue;
 
 		if (place->flags & TTM_PL_FLAG_CONTIGUOUS &&
diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index b510a4812609..8ea0865e9cc8 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -70,6 +70,9 @@
 /* Placement is only used during eviction */
 #define TTM_PL_FLAG_FALLBACK	(1 << 4)
 
+/* Placement is only used during eviction */
+#define TTM_PL_FLAG_PREFERRED	(1 << 5)
+
 /**
  * struct ttm_place
  *
-- 
2.44.0

