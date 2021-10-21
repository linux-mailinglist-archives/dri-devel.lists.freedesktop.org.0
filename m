Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A138435F3E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 12:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74A06E42C;
	Thu, 21 Oct 2021 10:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB036EC42;
 Thu, 21 Oct 2021 10:36:12 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 22/28] drm/i915: Make i915_gem_evict_vm work correctly for
 already locked objects
Date: Thu, 21 Oct 2021 12:35:59 +0200
Message-Id: <20211021103605.735002-22-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
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

i915_gem_execbuf will call i915_gem_evict_vm() after failing to pin
all objects in the first round. We are about to remove those short-term
pins, but even without those the objects are still locked. Add a special
case to allow i915_gem_evict_vm to evict locked objects as well.

This might also allow multiple objects sharing the same resv to be evicted.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_gem_evict.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index 24f5e3345e43..f502a617b35c 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -410,21 +410,42 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
 	do {
 		struct i915_vma *vma, *vn;
 		LIST_HEAD(eviction_list);
+		LIST_HEAD(locked_eviction_list);
 
 		list_for_each_entry(vma, &vm->bound_list, vm_link) {
 			if (i915_vma_is_pinned(vma))
 				continue;
 
+			/*
+			 * If we already own the lock, trylock fails. In case the resv
+			 * is shared among multiple objects, we still need the object ref.
+			 */
+			if (ww && (dma_resv_locking_ctx(vma->obj->base.resv) == &ww->ctx)) {
+				__i915_vma_pin(vma);
+				list_add(&vma->evict_link, &locked_eviction_list);
+				continue;
+			}
+
 			if (!i915_gem_object_trylock(vma->obj, ww))
 				continue;
 
 			__i915_vma_pin(vma);
 			list_add(&vma->evict_link, &eviction_list);
 		}
-		if (list_empty(&eviction_list))
+		if (list_empty(&eviction_list) && list_empty(&locked_eviction_list))
 			break;
 
 		ret = 0;
+		/* Unbind locked objects first, before unlocking the eviction_list */
+		list_for_each_entry_safe(vma, vn, &locked_eviction_list, evict_link) {
+			__i915_vma_unpin(vma);
+
+			if (ret == 0)
+				ret = __i915_vma_unbind(vma);
+			if (ret != -EINTR) /* "Get me out of here!" */
+				ret = 0;
+		}
+
 		list_for_each_entry_safe(vma, vn, &eviction_list, evict_link) {
 			__i915_vma_unpin(vma);
 			if (ret == 0)
-- 
2.33.0

