Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3051382767
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 10:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04566E8F8;
	Mon, 17 May 2021 08:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAC16E8F8;
 Mon, 17 May 2021 08:46:59 +0000 (UTC)
IronPort-SDR: k8KrP1D3gQLrxWkuJqKP2evSavCgDleGJiEyGu9d6LiuLqYsxxPiuzMsmeG7LUz36pZCL+4v/o
 dncMqmLGttlA==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="200106513"
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; d="scan'208";a="200106513"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 01:46:55 -0700
IronPort-SDR: qbnw3j/sMfnpND7O8/DvWfpGFo0sYfwtiNxOnebd0UPggG7Uuk+I075QNOhjLNc92YdaN8G6mb
 hoXrMONyEjGg==
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; d="scan'208";a="438820736"
Received: from cqi-mobl.ccr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.215.160.214])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 01:46:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gem: Pin the L-shape quirked object as unshrinkable
Date: Mon, 17 May 2021 09:46:40 +0100
Message-Id: <20210517084640.18862-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

When instantiating a tiled object on an L-shaped memory machine, we mark
the object as unshrinkable to prevent the shrinker from trying to swap
out the pages. We have to do this as we do not know the swizzling on the
individual pages, and so the data will be scrambled across swap out/in.

Not only do we need to move the object off the shrinker list, we need to
mark the object with shrink_pin so that the counter is consistent across
calls to madvise.

v2: in the madvise ioctl we need to check if the object is currently
shrinkable/purgeable, not if the object type supports shrinking

Fixes: 0175969e489a ("drm/i915/gem: Use shrinkable status for unknown swizzle quirks")
References: https://gitlab.freedesktop.org/drm/intel/-/issues/3293
References: https://gitlab.freedesktop.org/drm/intel/-/issues/3450
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Tested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: <stable@vger.kernel.org> # v5.12+
---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c |  2 ++
 drivers/gpu/drm/i915/i915_gem.c           | 11 +++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index aed8a37ccdc9..7361971c177d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -63,6 +63,8 @@ void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 	    i915->quirks & QUIRK_PIN_SWIZZLED_PAGES) {
 		GEM_BUG_ON(i915_gem_object_has_tiling_quirk(obj));
 		i915_gem_object_set_tiling_quirk(obj);
+		GEM_BUG_ON(!list_empty(&obj->mm.link));
+		atomic_inc(&obj->mm.shrink_pin);
 		shrinkable = false;
 	}
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index d0018c5f88bd..cffd7f4f87dc 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1009,12 +1009,11 @@ i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
 		obj->mm.madv = args->madv;
 
 	if (i915_gem_object_has_pages(obj)) {
-		struct list_head *list;
+		unsigned long flags;
 
-		if (i915_gem_object_is_shrinkable(obj)) {
-			unsigned long flags;
-
-			spin_lock_irqsave(&i915->mm.obj_lock, flags);
+		spin_lock_irqsave(&i915->mm.obj_lock, flags);
+		if (!list_empty(&obj->mm.link)) {
+			struct list_head *list;
 
 			if (obj->mm.madv != I915_MADV_WILLNEED)
 				list = &i915->mm.purge_list;
@@ -1022,8 +1021,8 @@ i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
 				list = &i915->mm.shrink_list;
 			list_move_tail(&obj->mm.link, list);
 
-			spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
 		}
+		spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
 	}
 
 	/* if the object is no longer attached, discard its backing storage */
-- 
2.26.3

