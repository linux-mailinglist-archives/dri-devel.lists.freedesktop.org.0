Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A64435F4B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 12:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81EA16EC68;
	Thu, 21 Oct 2021 10:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861C46EC3E;
 Thu, 21 Oct 2021 10:36:12 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 23/28] drm/i915: Call i915_gem_evict_vm in vm_fault_gtt to
 prevent new ENOSPC errors
Date: Thu, 21 Oct 2021 12:36:00 +0200
Message-Id: <20211021103605.735002-23-maarten.lankhorst@linux.intel.com>
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

Now that we cannot unbind kill the currently locked object directly
because we're removing short term pinning, we may have to unbind the
object from gtt manually, using a i915_gem_evict_vm() call.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 65fc6ff5f59d..6d557bb9926f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -357,8 +357,22 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 			vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
 		}
 
-		/* The entire mappable GGTT is pinned? Unexpected! */
-		GEM_BUG_ON(vma == ERR_PTR(-ENOSPC));
+		/*
+		 * The entire mappable GGTT is pinned? Unexpected!
+		 * Try to evict the object we locked too, as normally we skip it
+		 * due to lack of short term pinning inside execbuf.
+		 */
+		if (vma == ERR_PTR(-ENOSPC)) {
+			ret = mutex_lock_interruptible(&ggtt->vm.mutex);
+			if (!ret) {
+				ret = i915_gem_evict_vm(&ggtt->vm, &ww);
+				mutex_unlock(&ggtt->vm.mutex);
+			}
+			if (ret)
+				goto err_reset;
+			vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
+		}
+		GEM_WARN_ON(vma == ERR_PTR(-ENOSPC));
 	}
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
-- 
2.33.0

