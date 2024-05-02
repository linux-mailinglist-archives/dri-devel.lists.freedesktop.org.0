Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79E98B9DA3
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 17:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B00112516;
	Thu,  2 May 2024 15:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="owOXHedo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959F6112512
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714664429;
 bh=FqiEASv/dg2Tu+4C/cDLkpYYOsvbpbdFArzieoTIRYs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=owOXHedonKRq5Npuvk7oZvWsc/WBGT+GFCVhqagLvS5mM6zohrYABt3NWZKFdQ7uJ
 VNQGOHy24BwcdtJmesa8SZw/BBoPTUmqQDXA1uNz1UU4QAazcxXts/EMqnHqhTjK/d
 FADUlVSm1O1rC82ADt/SLfj/jtSfGwJ5mhj3Imai2TOXQ/Rd0t65I5yzluzf0DOGNr
 XBarj/hiBgByDbe1j1gq1Tll/vyzW7g5IIPav6tilJOvUx90GzZ6Tg1OsrtgWcUakd
 whzV0/u0s3VmuvG47pJNY03SPL+l5xe2CE+u548IVxi0hd1VHpQG2/hZv7bQBrdL7f
 KwUCp76GpPB/w==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 06A933782117;
 Thu,  2 May 2024 15:40:28 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 2/5] drm/panthor: Make sure the tiler initial/max chunks
 are consistent
Date: Thu,  2 May 2024 17:40:22 +0200
Message-ID: <20240502154025.1425278-3-boris.brezillon@collabora.com>
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

It doesn't make sense to have a maximum number of chunks smaller than
the initial number of chunks attached to the context.

Fix the uAPI header to reflect the new constraint, and mention the
undocumented "initial_chunk_count > 0" constraint while at it.

v3:
- Add R-b

v2:
- Fix the check

Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_heap.c | 3 +++
 include/uapi/drm/panthor_drm.h         | 8 ++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index c3c0ba744937..3be86ec383d6 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -281,6 +281,9 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 	if (initial_chunk_count == 0)
 		return -EINVAL;
 
+	if (initial_chunk_count > max_chunks)
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

