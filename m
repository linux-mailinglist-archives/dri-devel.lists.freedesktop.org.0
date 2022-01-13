Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8086448D6D7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 12:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBD510E36C;
	Thu, 13 Jan 2022 11:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F9110E14B;
 Thu, 13 Jan 2022 11:45:06 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 1/6] drm/i915: Call i915_gem_evict_vm in vm_fault_gtt to
 prevent new ENOSPC errors, v2.
Date: Thu, 13 Jan 2022 12:44:55 +0100
Message-Id: <20220113114500.2039439-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113114500.2039439-1-maarten.lankhorst@linux.intel.com>
References: <20220113114500.2039439-1-maarten.lankhorst@linux.intel.com>
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

Now that we cannot unbind kill the currently locked object directly
because we're removing short term pinning, we may have to unbind the
object from gtt manually, using a i915_gem_evict_vm() call.

Changes since v1:
- Remove -ENOSPC warning, can still happen with concurrent mmaps
  where we can't unbind the other mmap because of the lock held.
  This  fixes the gem_mmap_gtt@cpuset tests.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 5ac2506f4ee8..fafd158e5313 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -21,6 +21,7 @@
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
 #include "i915_gem_ttm.h"
+#include "i915_gem_evict.h"
 #include "i915_vma.h"
 
 static inline bool
@@ -358,8 +359,21 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
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
+				ret = i915_gem_evict_vm(&ggtt->vm);
+				mutex_unlock(&ggtt->vm.mutex);
+			}
+			if (ret)
+				goto err_reset;
+			vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
+		}
 	}
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
-- 
2.34.1

