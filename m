Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B4C8B9EEE
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 18:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEB910FA0A;
	Thu,  2 May 2024 16:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HTKJ3Orj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5244E10FA0A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 16:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714668797;
 bh=OnllDPei0At6ZNVbYT9imDID39CmCjUAhlGq/1o6ktQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HTKJ3OrjYAcBqbYiFuZVhbSbUVGwDsS2SFfBBR3ZCf1yBJpwyVcg69lzly94p0CF+
 RjzvD8Vz+wmb8FVEGJRj+HX0IfK3UyC1REYHPrbFBytFfijwJuYzOYlaBrvlkqIZFj
 o41n10K8Wrh6YUUfNQNznxj1uSjCKrhL55xsrYVA2SqmhkpNf6Ddn4tCbk4Wua6zTv
 NFGmJGQD/mDt/P4ihwxFGXE6+gzFAwjIIq2jdqLVb2IjfWCJPdwA+rn4tewTJqBDxi
 9n1l02N9PORNNeUi7FLPDLv7HA1bm10vJlpLp8rSE8LyZZTK/3g2gNNuCQPiPNwHrd
 KWAwkIaVZI0CQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9BCD93782121;
 Thu,  2 May 2024 16:53:16 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Eric Smith <eric.smith@collabora.com>
Subject: [PATCH v4 4/5] drm/panthor: Fix an off-by-one in the heap context
 retrieval logic
Date: Thu,  2 May 2024 18:51:57 +0200
Message-ID: <20240502165158.1458959-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502165158.1458959-1-boris.brezillon@collabora.com>
References: <20240502165158.1458959-1-boris.brezillon@collabora.com>
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

The heap ID is used to index the heap context pool, and allocating
in the [1:MAX_HEAPS_PER_POOL] leads to an off-by-one. This was
originally to avoid returning a zero heap handle, but given the handle
is formed with (vm_id << 16) | heap_id, with vm_id > 0, we already can't
end up with a valid heap handle that's zero.

v4:
- s/XA_FLAGS_ALLOC1/XA_FLAGS_ALLOC/

v3:
- Allocate in the [0:MAX_HEAPS_PER_POOL-1] range

v2:
- New patch

Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
Reported-by: Eric Smith <eric.smith@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Tested-by: Eric Smith <eric.smith@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_heap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index b0fc5b9ee847..95a1c6c9f35e 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -323,7 +323,8 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 	if (!pool->vm) {
 		ret = -EINVAL;
 	} else {
-		ret = xa_alloc(&pool->xa, &id, heap, XA_LIMIT(1, MAX_HEAPS_PER_POOL), GFP_KERNEL);
+		ret = xa_alloc(&pool->xa, &id, heap,
+			       XA_LIMIT(0, MAX_HEAPS_PER_POOL - 1), GFP_KERNEL);
 		if (!ret) {
 			void *gpu_ctx = panthor_get_heap_ctx(pool, id);
 
@@ -543,7 +544,7 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
 	pool->vm = vm;
 	pool->ptdev = ptdev;
 	init_rwsem(&pool->lock);
-	xa_init_flags(&pool->xa, XA_FLAGS_ALLOC1);
+	xa_init_flags(&pool->xa, XA_FLAGS_ALLOC);
 	kref_init(&pool->refcount);
 
 	pool->gpu_contexts = panthor_kernel_bo_create(ptdev, vm, bosize,
-- 
2.44.0

