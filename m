Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992678B1BBB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 09:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BCC10E595;
	Thu, 25 Apr 2024 07:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="acatInul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358E710E595
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714029522;
 bh=eV7aELKJ+gQJ7Zb2lwM73UFu5GwTeV6h6EUCdjt+vNU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=acatInulZ7d2lAfV+f1rfp0q96otY1HNOKkVDgj7lAW7dOfrgA+9H9mRds4QVkkfS
 qC5SpavDhfw2jac/8RTZ64IMbDmFAxxME1hagRXoR3AV17n0TdQv5rIBTPObPAWRBY
 03sEf0oJeCoSb1qiDMTqFe69Nw8bUy/Lvm8aQUqPEZ11q31SnSjUUBAha3yR7x7Djv
 38F103+xU+d4pHLUkauuO07pBKGWW+DamprKTdwO1D8cfSZ5JDBZEejDknQjq+Vuv7
 BhQbGYeLu2bhkvEO2kLd9Hf97Era6RoXHtcUUS2IbJJ/SGEfgmf7HWsn+ytg+hugpa
 ofFv6ILb5u/ww==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 99A93378215D;
 Thu, 25 Apr 2024 07:18:41 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: [PATCH 2/3] drm/panthor: Make sure the tiler initial/max chunks are
 consistent
Date: Thu, 25 Apr 2024 09:18:36 +0200
Message-ID: <20240425071837.529039-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425071837.529039-1-boris.brezillon@collabora.com>
References: <20240425071837.529039-1-boris.brezillon@collabora.com>
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

It doesn't make sense to have a maximum number of chunks smaller than
the initial number of chunks attached to the context.

Fix the uAPI header to reflect the new constraint, and mention the
undocumented "initial_chunk_count > 0" constraint while at it.

Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_heap.c | 3 +++
 include/uapi/drm/panthor_drm.h         | 8 ++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 143fa35f2e74..8728c9bb76e4 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -281,6 +281,9 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 	if (initial_chunk_count == 0)
 		return -EINVAL;
 
+	if (initial_chunk_count < max_chunks)
+		return -EINVAL;
+
 	if (hweight32(chunk_size) != 1 ||
 	    chunk_size < SZ_256K || chunk_size > SZ_2M)
 		return -EINVAL;
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index dadb05ab1235..5db80a0682d5 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -895,13 +895,17 @@ struct drm_panthor_tiler_heap_create {
 	/** @vm_id: VM ID the tiler heap should be mapped to */
 	__u32 vm_id;
 
-	/** @initial_chunk_count: Initial number of chunks to allocate. */
+	/** @initial_chunk_count: Initial number of chunks to allocate. Must be at least one. */
 	__u32 initial_chunk_count;
 
 	/** @chunk_size: Chunk size. Must be a power of two at least 256KB large. */
 	__u32 chunk_size;
 
-	/** @max_chunks: Maximum number of chunks that can be allocated. */
+	/**
+	 * @max_chunks: Maximum number of chunks that can be allocated.
+	 *
+	 * Must be at least @initial_chunk_count.
+	 */
 	__u32 max_chunks;
 
 	/**
-- 
2.44.0

