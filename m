Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492528B9DA5
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 17:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EA011251B;
	Thu,  2 May 2024 15:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UqXw0IvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DEA112515
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714664430;
 bh=mOOifeA7h2tjyxi4eoYBSbmRZkE4sxVXmUEbBlpKpTY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UqXw0IvUwdvMKW2Fj7eJ5yJxtlFWwJ1R61lgiimNHSgLCwvMK7t9bxchijhn01Vzl
 wCxLACsXKUJVgLNGT8/1C8rN8tmjWcD9dGRqyk2Uf3AOphqAeckgw82EgY0LZ523SR
 ZqXT+QZND8MGEvS4CjPcyaqTp/PWiRc2Yj71vJs/5QmsJSpoky5cd8x/LjJ9fJoom5
 cF8dX5cAx8JvKUZIZ38bR2MVRxI9gC9FJTS4IJKbBkUKsq3Oi4zM57uYE+YRun9FAZ
 qbHKYgivVhs+gOi8SvBqieeaHD2xzJGuuni++L9ItZJOC4mEoPhJOVpI5LAMzF8XGR
 uZpL0ctsEWZqg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 443DB378214B;
 Thu,  2 May 2024 15:40:30 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Eric Smith <eric.smith@collabora.com>
Subject: [PATCH v3 4/5] drm/panthor: Fix an off-by-one in the heap context
 retrieval logic
Date: Thu,  2 May 2024 17:40:24 +0200
Message-ID: <20240502154025.1425278-5-boris.brezillon@collabora.com>
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

The heap ID is used to index the heap context pool, and allocating
in the [1:MAX_HEAPS_PER_POOL] leads to an off-by-one. This was
originally to avoid returning a zero heap handle, but given the handle
is formed with (vm_id << 16) | heap_id, with vm_id > 0, we already can't
end up with a valid heap handle that's zero.

v3:
- Allocate in the [0:MAX_HEAPS_PER_POOL-1] range

v2:
- New patch

Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
Reported-by: Eric Smith <eric.smith@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Tested-by: Eric Smith <eric.smith@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_heap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 683bb94761bc..252332f5390f 100644
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
 
-- 
2.44.0

