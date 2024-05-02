Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F4F8B9DA4
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 17:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CF6112515;
	Thu,  2 May 2024 15:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="2sn6z7Pn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F53F112514
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714664430;
 bh=lKmQMTT1rmVhx7r5vTQ4FCbqGDF+4dN++d8pveLpj9k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2sn6z7PnzkWl/0P4tpw+MWMWKSXO9xQN2r+cIovgDJbP2wVJpIfTHr/bNYxGMPksO
 pcZe4pnq0WGf0o+6o3AKdit1bXPmsnDAA/3tbhu1iy5OW+tiQ7PJKXXfRz3tDhZi2j
 BnpVpGlby0pRP40tQCkQNFkMxJVogfK6LTsuydXKFVqXOzh7P5GCMgFXRvAB5sVzkR
 i9pvt00/LD0nBA4G0H4aHyL3+o5kNupDRLuGLAk1sD2V5V8FPF16XtsUpnAEz9h/hY
 YhGgsn0k/Ox26gK6zpb4Kw051hLu3py0y9XV9q7bsnwln2/GHcqhmc/42dq68FdTJq
 g1XCiC8LTfRAg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9F2E73782121;
 Thu,  2 May 2024 15:40:29 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 3/5] drm/panthor: Relax the constraints on the tiler chunk
 size
Date: Thu,  2 May 2024 17:40:23 +0200
Message-ID: <20240502154025.1425278-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502154025.1425278-1-boris.brezillon@collabora.com>
References: <20240502154025.1425278-1-boris.brezillon@collabora.com>
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

The field used to store the chunk size if 12 bits wide, and the encoding
is chunk_size = chunk_header.chunk_size << 12, which gives us a
theoretical [4k:8M] range. This range is further limited by
implementation constraints, and all known implementations seem to
impose a [128k:8M] range, so do the same here.

We also relax the power-of-two constraint, which doesn't seem to
exist on v10. This will allow userspace to fine-tune initial/max
tiler memory on memory-constrained devices.

v3:
- Add R-bs
- Fix valid range in the kerneldoc

v2:
- Turn the power-of-two constraint into a page-aligned constraint to allow
  fine-tune of the initial/max heap memory size
- Fix the panthor_heap_create() kerneldoc

Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_heap.c | 8 ++++----
 include/uapi/drm/panthor_drm.h         | 6 +++++-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 3be86ec383d6..683bb94761bc 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -253,8 +253,8 @@ int panthor_heap_destroy(struct panthor_heap_pool *pool, u32 handle)
  * @pool: Pool to instantiate the heap context from.
  * @initial_chunk_count: Number of chunk allocated at initialization time.
  * Must be at least 1.
- * @chunk_size: The size of each chunk. Must be a power of two between 256k
- * and 2M.
+ * @chunk_size: The size of each chunk. Must be page-aligned and lie in the
+ * [128k:2M] range.
  * @max_chunks: Maximum number of chunks that can be allocated.
  * @target_in_flight: Maximum number of in-flight render passes.
  * @heap_ctx_gpu_va: Pointer holding the GPU address of the allocated heap
@@ -284,8 +284,8 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 	if (initial_chunk_count > max_chunks)
 		return -EINVAL;
 
-	if (hweight32(chunk_size) != 1 ||
-	    chunk_size < SZ_256K || chunk_size > SZ_2M)
+	if (!IS_ALIGNED(chunk_size, PAGE_SIZE) ||
+	    chunk_size < SZ_128K || chunk_size > SZ_8M)
 		return -EINVAL;
 
 	down_read(&pool->lock);
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 5db80a0682d5..b8220d2e698f 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -898,7 +898,11 @@ struct drm_panthor_tiler_heap_create {
 	/** @initial_chunk_count: Initial number of chunks to allocate. Must be at least one. */
 	__u32 initial_chunk_count;
 
-	/** @chunk_size: Chunk size. Must be a power of two at least 256KB large. */
+	/**
+	 * @chunk_size: Chunk size.
+	 *
+	 * Must be page-aligned and lie in the [128k:8M] range.
+	 */
 	__u32 chunk_size;
 
 	/**
-- 
2.44.0

