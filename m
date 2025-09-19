Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E13B89A12
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 15:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F7F10E9E2;
	Fri, 19 Sep 2025 13:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="d5sMuSnO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD25110E9E2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 13:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EwxvJ41dqx/hxg5IuBPyRyKgkcfxZXnYWGXLY/Gnmgo=; b=d5sMuSnOT4YQDQQdqR8E6ERn2P
 DIHRaRMbfup+KqHMY+iakj9p0wPHw8rHgNVUsS7e28Vwd7eSz95edwVB7makXRnLmlv1aDvX1JunO
 dQsUx+TY78ZJii82wUvz8K//Vw6P1UlCAd0b9kHmJraaB3BHH5DV8kLavfnMUeUMu6DG3KZTIxd6W
 5feJAul3dhbBIJ2cX+ffS/6dFZz1iKAfLsG0d54DV+wMwuMtY83a8b4Yd/i/uXw4X/lXLhcWylpyy
 R+0gnNfBnDT1fhC07gpO5/ITrW6z2S5hpUZ2jdrc0x3ad0nj8Sql2SYj1hyi1eX6dHvaQukHdqyPy
 lDmL3MXA==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzaxg-00E6Nq-1u; Fri, 19 Sep 2025 15:15:40 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 3/4] drm/ttm: Tidy ttm_operation_ctx initialization
Date: Fri, 19 Sep 2025 14:15:29 +0100
Message-ID: <20250919131530.91247-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
References: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
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

No need to initialize a subset of fields to zero.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c  | 10 ++--------
 drivers/gpu/drm/ttm/ttm_device.c   |  5 +----
 drivers/gpu/drm/ttm/ttm_resource.c |  5 +----
 drivers/gpu/drm/ttm/ttm_tt.c       |  2 +-
 4 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index acbbca9d5c92..94a72db76f52 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -343,10 +343,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 			   struct ttm_bo_kmap_obj *map)
 {
 	struct ttm_resource *mem = bo->resource;
-	struct ttm_operation_ctx ctx = {
-		.interruptible = false,
-		.no_wait_gpu = false
-	};
+	struct ttm_operation_ctx ctx = { };
 	struct ttm_tt *ttm = bo->ttm;
 	struct ttm_resource_manager *man =
 			ttm_manager_type(bo->bdev, bo->resource->mem_type);
@@ -530,10 +527,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 		iosys_map_set_vaddr_iomem(map, vaddr_iomem);
 
 	} else {
-		struct ttm_operation_ctx ctx = {
-			.interruptible = false,
-			.no_wait_gpu = false
-		};
+		struct ttm_operation_ctx ctx = { };
 		struct ttm_tt *ttm = bo->ttm;
 		pgprot_t prot;
 		void *vaddr;
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index c3e2fcbdd2cc..00c405f1c9b8 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -134,10 +134,7 @@ static int ttm_global_init(void)
  */
 int ttm_device_prepare_hibernation(struct ttm_device *bdev)
 {
-	struct ttm_operation_ctx ctx = {
-		.interruptible = false,
-		.no_wait_gpu = false,
-	};
+	struct ttm_operation_ctx ctx = { };
 	int ret;
 
 	do {
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index b78be0c342f2..55ce363a73ae 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -543,10 +543,7 @@ EXPORT_SYMBOL(ttm_resource_manager_init);
 int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 				   struct ttm_resource_manager *man)
 {
-	struct ttm_operation_ctx ctx = {
-		.interruptible = false,
-		.no_wait_gpu = false,
-	};
+	struct ttm_operation_ctx ctx = { };
 	struct dma_fence *fence;
 	int ret;
 
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 506e257dfba8..226d2762a1d6 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -453,7 +453,7 @@ EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_unpopulate);
 /* Test the shrinker functions and dump the result */
 static int ttm_tt_debugfs_shrink_show(struct seq_file *m, void *data)
 {
-	struct ttm_operation_ctx ctx = { false, false };
+	struct ttm_operation_ctx ctx = { };
 
 	seq_printf(m, "%d\n", ttm_global_swapout(&ctx, GFP_KERNEL));
 	return 0;
-- 
2.48.0

