Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B25C40FDD
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A4B10EB28;
	Fri,  7 Nov 2025 17:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nMAr1zZ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF87E10EB28
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 17:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762535545;
 bh=zoDynGHwHw0SasPx/wuKLZQeGtF8GLflLkJQwGPsFzU=;
 h=From:To:Cc:Subject:Date:From;
 b=nMAr1zZ1t7ICUdSU5vBPW5kZEL2mV8/hbkN67hMTfqAq4zlzs0Kgzp9hPYDiUd42J
 HIR6S0/XgE/b58xJI+PIpcw6Kk2Js78xOwSUb7WlqsGAYt2d1DV6rKDtTLtArwtV2F
 dEb0w9UuOmBStjd8WKzQFAdbWnchYyMxl6WfE5pU4gktrrxwImyhkV3h2AhAM4nsqq
 1Q4P1sGN8nLBnWGvcQB/1RJV1mr+pIL8lfRHZIbwRbj+FJ6wGeczP3jcKUWWNPbhx8
 2ssetC2IU1yyv7vMBsmA943G7PUCZVWCQFvu8S/Zg6sqMCT10YoTcju7gTmHzRLCSC
 YRUJVUhg6v+ww==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FF8517E0097;
 Fri,  7 Nov 2025 18:12:25 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH] drm/panthor: Flush shmem writes before mapping buffers
 CPU-uncached
Date: Fri,  7 Nov 2025 18:12:14 +0100
Message-ID: <20251107171214.1186299-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
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

The shmem layer zeroes out the new pages using cached mappings, and if
we don't CPU-flush we might leave dirty cachelines behind, leading to
potential data leaks and/or asynchronous buffer corruption when dirty
cachelines are evicted.

Fixes: 8a1cc07578bf ("drm/panthor: Add GEM logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index f369cc3e2a5f..2c12c1c58e2b 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -281,6 +281,23 @@ panthor_gem_create_with_handle(struct drm_file *file,
 
 	panthor_gem_debugfs_set_usage_flags(bo, 0);
 
+	/* If this is a write-combine mapping, we query the sgt to force a CPU
+	 * cache flush (dma_map_sgtable() is called when the sgt is created).
+	 * This ensures the zero-ing is visible to any uncached mapping created
+	 * by vmap/mmap.
+	 * FIXME: Ideally this should be done when pages are allocated, not at
+	 * BO creation time.
+	 */
+	if (shmem->map_wc) {
+		struct sg_table *sgt;
+
+		sgt = drm_gem_shmem_get_pages_sgt(shmem);
+		if (IS_ERR(sgt)) {
+			ret = PTR_ERR(sgt);
+			goto out_put_gem;
+		}
+	}
+
 	/*
 	 * Allocate an id of idr table where the obj is registered
 	 * and handle has the id what user can see.
@@ -289,6 +306,7 @@ panthor_gem_create_with_handle(struct drm_file *file,
 	if (!ret)
 		*size = bo->base.base.size;
 
+out_put_gem:
 	/* drop reference from allocate - handle holds it now. */
 	drm_gem_object_put(&shmem->base);
 
-- 
2.51.1

