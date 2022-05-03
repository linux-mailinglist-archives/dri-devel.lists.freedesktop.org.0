Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0454518731
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 16:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B299710E0F9;
	Tue,  3 May 2022 14:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC93610E0F9;
 Tue,  3 May 2022 14:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651589385; x=1683125385;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pL+dZ/5RhaWr7cYfhGuCJLds3wUU0UfefMumRYILrhg=;
 b=BxOlbV6LqGJYpYAzu+e2J3uF0Uy6mQYHopjatEjtVcLO42fjpob7xaGn
 hV9vqg+6rHEBG329KgGzXi/Hoq7sElt/v4uss0Fyu/i2VNWl0+Nu7v31L
 HnGVnnbcxJepvNsFOeRbJ2SJUYpFeAM5UtPfIudqc31qjaYkW61iwTOIj
 vUm/o3R+rw2TM7nIXQSJFXSbz/BHljjU4lr24CAgVamfbs04k1OAVeHe6
 sk/7i6wcX62uUo9i266rZZrVQvelmhTiXajyrwWav6hnjR8GbUTtNL+cZ
 Kz+GJUmntiYr6X2DOyx7A680ZdH9qYCqFjI4W5JM/bRpaqZbo3WdG2DQP g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="330481842"
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; d="scan'208";a="330481842"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 07:49:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; d="scan'208";a="536361312"
Received: from doshaugh-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.236.211])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 07:49:44 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [CI] drm/i915: use IOMEM_ERR_PTR() directly
Date: Tue,  3 May 2022 15:49:37 +0100
Message-Id: <20220503144937.679424-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kefeng Wang <wangkefeng.wang@huawei.com>

Use IOMEM_ERR_PTR() instead of self defined IO_ERR_PTR().

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 4 ++--
 drivers/gpu/drm/i915/i915_vma.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index e782ebfcc0ca..ed8f334cb831 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -548,7 +548,7 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
 	int err;
 
 	if (WARN_ON_ONCE(vma->obj->flags & I915_BO_ALLOC_GPU_ONLY))
-		return IO_ERR_PTR(-EINVAL);
+		return IOMEM_ERR_PTR(-EINVAL);
 
 	if (!i915_gem_object_is_lmem(vma->obj)) {
 		if (GEM_WARN_ON(!i915_vma_is_map_and_fenceable(vma))) {
@@ -601,7 +601,7 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
 err_unpin:
 	__i915_vma_unpin(vma);
 err:
-	return IO_ERR_PTR(err);
+	return IOMEM_ERR_PTR(err);
 }
 
 void i915_vma_flush_writes(struct i915_vma *vma)
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 6034991d89fe..88ca0bd9c900 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -317,7 +317,6 @@ static inline bool i915_node_color_differs(const struct drm_mm_node *node,
  * Returns a valid iomapped pointer or ERR_PTR.
  */
 void __iomem *i915_vma_pin_iomap(struct i915_vma *vma);
-#define IO_ERR_PTR(x) ((void __iomem *)ERR_PTR(x))
 
 /**
  * i915_vma_unpin_iomap - unpins the mapping returned from i915_vma_iomap
-- 
2.32.0

