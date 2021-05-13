Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D828137F777
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 14:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388846ED03;
	Thu, 13 May 2021 12:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15156ED03;
 Thu, 13 May 2021 12:08:08 +0000 (UTC)
IronPort-SDR: ud4nSBo/UrF9VlxAdMesTG1rdCv2+Vh3gMe/s0kEzZxBMGOu7eNxCgKs8K6RsU9tMUm+Nz8alT
 oGnFqB5dKscg==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="220921338"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="220921338"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 05:08:06 -0700
IronPort-SDR: H+DcFarT8g/NcLQVwyJIpXXFWhLnI6FseWn7VOgWqKmS+SUcPXXHLlyjHeYy0zwba9RK/z3XS7
 7U1D3ruNAJXQ==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="623602015"
Received: from cjodwyer-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.20.105])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 05:08:04 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gem: Pin the L-shape quirked object as
 unshrinkable
Date: Thu, 13 May 2021 13:07:56 +0100
Message-Id: <20210513120756.622515-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
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
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
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

