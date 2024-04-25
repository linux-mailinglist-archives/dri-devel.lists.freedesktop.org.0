Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC158B1BBC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 09:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157ED11A20B;
	Thu, 25 Apr 2024 07:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GSiJ6k09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D7710E595
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714029522;
 bh=YyWOTZ54pFEZT96fwWDj606lhXAkPZSVV4Y9gEdOfTY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GSiJ6k09Ban8OJ17OaKcsCqcdl/UJu1M/6XK0Ry9VpUQ+oaazaRkTlHQ4oVIr9ZV5
 iIsPvp0KF0O1m6r7BxkJKeSIzuxZh2vC83QZ3junt3JVzM1aYDnR26bVjwmSeBkYfC
 kWUqXLV9Eqf4etGFzPtJcWScKFdjSt0rFMye0QNE7ov1BQJr7/gGR3+l5kr1gmdGLK
 ZxrY91T+faMCaYR1FNNdG26n/qN5ORpF8ENOtuNxl3PJdNrYw5u9P2IbaKpW2LGxUB
 z+PcKZDTLM+bIV1e26YCN2f/Bhr2wJ8XbAJIzcuf1B+4Z/B6fJC9xmJ29efJ87ADlG
 6uLr61wiiPU6A==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 45E14378215E;
 Thu, 25 Apr 2024 07:18:42 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: [PATCH 3/3] drm/panthor: Relax the check on the tiler chunk size
Date: Thu, 25 Apr 2024 09:18:37 +0200
Message-ID: <20240425071837.529039-4-boris.brezillon@collabora.com>
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

The field used to store the chunk size if 12 bits wide, and the encoding
is chunk_size = chunk_header.chunk_size << 12, which gives us a
theoretical [4k:8M] range. This range is further limited by
implementation constraints, but those shouldn't be enforced kernel side.

Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_heap.c | 2 +-
 include/uapi/drm/panthor_drm.h         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 8728c9bb76e4..146ea2f57764 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -285,7 +285,7 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 		return -EINVAL;
 
 	if (hweight32(chunk_size) != 1 ||
-	    chunk_size < SZ_256K || chunk_size > SZ_2M)
+	    chunk_size < SZ_4K || chunk_size > SZ_8M)
 		return -EINVAL;
 
 	down_read(&pool->lock);
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 5db80a0682d5..80c0716361b9 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -898,7 +898,7 @@ struct drm_panthor_tiler_heap_create {
 	/** @initial_chunk_count: Initial number of chunks to allocate. Must be at least one. */
 	__u32 initial_chunk_count;
 
-	/** @chunk_size: Chunk size. Must be a power of two at least 256KB large. */
+	/** @chunk_size: Chunk size. Must be a power of two and lie in the [4k:8M] range. */
 	__u32 chunk_size;
 
 	/**
-- 
2.44.0

