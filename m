Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71AE55B8D2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 10:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82721121FE;
	Mon, 27 Jun 2022 08:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 314 seconds by postgrey-1.36 at gabe;
 Mon, 27 Jun 2022 08:59:50 UTC
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DB51121FE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 08:59:50 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1656320073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lYtRoPZU94l44IB7XMhlqGu/BmFm++kHBnUT6UzlKII=;
 b=ip2dno0gIC8N4gE5uN1e0jQX5Ld4LQfqQZurE8gIF3U/cjtCMfAfSH3j5kdGpMPj2hSsHE
 o2vz9AOZjXnFl2NgY8w4DdfxH6dFSb5RPqXYQNT47xo95fu9EYd/8e4C21MLqpghHQK038
 RQF0uGFptbdfHx3xFwZ34Rcq2PpZgSA=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Subject: [PATCH] drm: Remove the unused param "struct drm_buddy *mm"
Date: Mon, 27 Jun 2022 16:54:04 +0800
Message-Id: <20220627085405.221435-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the param "struct drm_buddy *mm" which is unused in
the function drm_block_alloc()/drm_block_free().

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 drivers/gpu/drm/drm_buddy.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 11bb59399471..192c8b99fb43 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -11,10 +11,8 @@
 
 static struct kmem_cache *slab_blocks;
 
-static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
-					       struct drm_buddy_block *parent,
-					       unsigned int order,
-					       u64 offset)
+static struct drm_buddy_block *
+drm_block_alloc(struct drm_buddy_block *parent, unsigned int order, u64 offset)
 {
 	struct drm_buddy_block *block;
 
@@ -32,8 +30,7 @@ static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
 	return block;
 }
 
-static void drm_block_free(struct drm_buddy *mm,
-			   struct drm_buddy_block *block)
+static void drm_block_free(struct drm_buddy_block *block)
 {
 	kmem_cache_free(slab_blocks, block);
 }
@@ -131,7 +128,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 		root_size = rounddown_pow_of_two(size);
 		order = ilog2(root_size) - ilog2(chunk_size);
 
-		root = drm_block_alloc(mm, NULL, order, offset);
+		root = drm_block_alloc(NULL, order, offset);
 		if (!root)
 			goto out_free_roots;
 
@@ -151,7 +148,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
 out_free_roots:
 	while (i--)
-		drm_block_free(mm, mm->roots[i]);
+		drm_block_free(mm->roots[i]);
 	kfree(mm->roots);
 out_free_list:
 	kfree(mm->free_list);
@@ -172,7 +169,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
 
 	for (i = 0; i < mm->n_roots; ++i) {
 		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
-		drm_block_free(mm, mm->roots[i]);
+		drm_block_free(mm->roots[i]);
 	}
 
 	WARN_ON(mm->avail != mm->size);
@@ -191,14 +188,14 @@ static int split_block(struct drm_buddy *mm,
 	BUG_ON(!drm_buddy_block_is_free(block));
 	BUG_ON(!drm_buddy_block_order(block));
 
-	block->left = drm_block_alloc(mm, block, block_order, offset);
+	block->left = drm_block_alloc(block, block_order, offset);
 	if (!block->left)
 		return -ENOMEM;
 
-	block->right = drm_block_alloc(mm, block, block_order,
+	block->right = drm_block_alloc(block, block_order,
 				       offset + (mm->chunk_size << block_order));
 	if (!block->right) {
-		drm_block_free(mm, block->left);
+		drm_block_free(block->left);
 		return -ENOMEM;
 	}
 
@@ -257,8 +254,8 @@ static void __drm_buddy_free(struct drm_buddy *mm,
 
 		list_del(&buddy->link);
 
-		drm_block_free(mm, block);
-		drm_block_free(mm, buddy);
+		drm_block_free(block);
+		drm_block_free(buddy);
 
 		block = parent;
 	}
-- 
2.25.1

