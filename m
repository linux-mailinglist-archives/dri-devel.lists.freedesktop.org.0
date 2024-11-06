Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0874C9BE6DD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 13:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE2010E6BD;
	Wed,  6 Nov 2024 12:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5BC5A10E6BD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 12:07:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAB551063;
 Wed,  6 Nov 2024 04:08:27 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 74AF03F6A8;
 Wed,  6 Nov 2024 04:07:56 -0800 (PST)
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>
Subject: [PATCH] drm/panthor: Lock XArray when getting entries for heap and VM
Date: Wed,  6 Nov 2024 12:07:48 +0000
Message-ID: <20241106120748.290697-1-liviu.dudau@arm.com>
X-Mailer: git-send-email 2.47.0
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

Similar to cac075706f29 ("drm/panthor: Fix race when converting
group handle to group object") we need to use the XArray's internal
locking when retrieving a pointer from there for heap and vm.

Reported-by: Jann Horn <jannh@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panthor/panthor_heap.c | 15 +++++++++++++--
 drivers/gpu/drm/panthor/panthor_mmu.c  |  2 ++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 3796a9eb22af2..fe0bcb6837f74 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -351,6 +351,17 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 	return ret;
 }
 
+static struct panthor_heap *panthor_heap_from_id(struct pathor_heap_pool *pool, u32 id)
+{
+	struct panthor_heap *heap;
+
+	xa_lock(&pool->xa);
+	heap = xa_load(&pool->xa, id);
+	xa_unlock(&pool->va);
+
+	return heap;
+}
+
 /**
  * panthor_heap_return_chunk() - Return an unused heap chunk
  * @pool: The pool this heap belongs to.
@@ -375,7 +386,7 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
 		return -EINVAL;
 
 	down_read(&pool->lock);
-	heap = xa_load(&pool->xa, heap_id);
+	heap = panthor_heap_from_id(pool, heap_id);
 	if (!heap) {
 		ret = -EINVAL;
 		goto out_unlock;
@@ -438,7 +449,7 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
 		return -EINVAL;
 
 	down_read(&pool->lock);
-	heap = xa_load(&pool->xa, heap_id);
+	heap = panthor_heap_from_id(pool, heap_id);
 	if (!heap) {
 		ret = -EINVAL;
 		goto out_unlock;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 8ca85526491e6..8b5cda9d21768 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1580,7 +1580,9 @@ panthor_vm_pool_get_vm(struct panthor_vm_pool *pool, u32 handle)
 {
 	struct panthor_vm *vm;
 
+	xa_lock(&pool->xa);
 	vm = panthor_vm_get(xa_load(&pool->xa, handle));
+	xa_unlock(&pool->va);
 
 	return vm;
 }
-- 
2.47.0

