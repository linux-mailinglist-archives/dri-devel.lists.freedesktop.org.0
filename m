Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB18F4863A5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 12:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B28010E81D;
	Thu,  6 Jan 2022 11:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F1610E814;
 Thu,  6 Jan 2022 11:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641468047; x=1673004047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VNmXsfHG4KOAqTK4nzhp1l4IKSjvmLFZ25K36gEw5Kg=;
 b=hWCaOcGb2okY6sN8GgGXqzQNHrrfTeklbxpJrfzQXDyJufmw34ETvy/J
 pQ3weg8bRlkX109+hgSLAB0rdMRzkQteteZllf+8DYCYhgjY34fnpWkiQ
 Fp5fVlrFMFbpnRhfaXnS4ZZPHxedMaU6TuRFTr/3yg7KS6Q055GC+q5Np
 t6JmuvyqxG0TDD1OJQzK0RsMLDHJxGCemAB7SCjuWxRj/u7to8iDazKb1
 cAyLp/pcQb9QKrdmASVe7iKiGwvq31FizjUp25UUV5ujr3w9nddLna/av
 hU37GeP8WxQeKM4sFLc3inmzchyiYNUfkd6gX57l+KW2j+HE8J3TklUD1 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="305992106"
X-IronPort-AV: E=Sophos;i="5.88,266,1635231600"; d="scan'208";a="305992106"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 03:20:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,266,1635231600"; d="scan'208";a="556892149"
Received: from lsgoh-mobl1.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.249.65.184])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 03:20:45 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/i915/ttm: add unmap_virtual callback
Date: Thu,  6 Jan 2022 11:20:25 +0000
Message-Id: <20220106112026.247459-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220106112026.247459-1-matthew.auld@intel.com>
References: <20220106112026.247459-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ensure we call ttm_bo_unmap_virtual when releasing the pages.
Importantly this should now handle the ttm swapping case, and all other
places that already call into i915_ttm_move_notify().

Fixes: cf3e3e86d779 ("drm/i915: Use ttm mmap handling for ttm bo's.")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c         | 3 +++
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c          | 6 ++++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index ee5ec0fd4807..5ac2506f4ee8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -538,6 +538,9 @@ void i915_gem_object_release_mmap_offset(struct drm_i915_gem_object *obj)
 {
 	struct i915_mmap_offset *mmo, *mn;
 
+	if (obj->ops->unmap_virtual)
+		obj->ops->unmap_virtual(obj);
+
 	spin_lock(&obj->mmo.lock);
 	rbtree_postorder_for_each_entry_safe(mmo, mn,
 					     &obj->mmo.offsets, offset) {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index f9f7e44099fe..4b4829eb16c2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -67,6 +67,7 @@ struct drm_i915_gem_object_ops {
 	int (*pwrite)(struct drm_i915_gem_object *obj,
 		      const struct drm_i915_gem_pwrite *arg);
 	u64 (*mmap_offset)(struct drm_i915_gem_object *obj);
+	void (*unmap_virtual)(struct drm_i915_gem_object *obj);
 
 	int (*dmabuf_export)(struct drm_i915_gem_object *obj);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 8d61d4538a64..1530d9f0bc81 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -950,6 +950,11 @@ static u64 i915_ttm_mmap_offset(struct drm_i915_gem_object *obj)
 	return drm_vma_node_offset_addr(&obj->base.vma_node);
 }
 
+static void i915_ttm_unmap_virtual(struct drm_i915_gem_object *obj)
+{
+	ttm_bo_unmap_virtual(i915_gem_to_ttm(obj));
+}
+
 static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.name = "i915_gem_object_ttm",
 	.flags = I915_GEM_OBJECT_IS_SHRINKABLE |
@@ -965,6 +970,7 @@ static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.migrate = i915_ttm_migrate,
 
 	.mmap_offset = i915_ttm_mmap_offset,
+	.unmap_virtual = i915_ttm_unmap_virtual,
 	.mmap_ops = &vm_ops_ttm,
 };
 
-- 
2.31.1

