Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6564463C9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 14:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950BF6E24D;
	Fri,  5 Nov 2021 13:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E0C6E24D;
 Fri,  5 Nov 2021 13:03:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="295336187"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="295336187"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 06:03:43 -0700
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="532581578"
Received: from inechita-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.167])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 06:03:41 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/gem: Fix gem_madvise for ttm+shmem objects
Date: Fri,  5 Nov 2021 14:03:33 +0100
Message-Id: <20211105130333.797862-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gem-TTM objects that are backed by shmem might have populated
page-vectors without having the Gem pages set. Those objects
aren't moved to the correct shrinker / purge list by the
gem_madvise. Furthermore they are purged directly on
MADV_DONTNEED rather than waiting for the shrinker to do that.

For such objects, identified by having the
_SELF_MANAGED_SHRINK_LIST set, make sure they end up on the
correct list and defer purging to the shrinker.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_gem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index d0e642c82064..da972c8d45b1 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1005,7 +1005,8 @@ i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
 			obj->ops->adjust_lru(obj);
 	}
 
-	if (i915_gem_object_has_pages(obj)) {
+	if (i915_gem_object_has_pages(obj) ||
+	    i915_gem_object_has_self_managed_shrink_list(obj)) {
 		unsigned long flags;
 
 		spin_lock_irqsave(&i915->mm.obj_lock, flags);
@@ -1024,7 +1025,8 @@ i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
 
 	/* if the object is no longer attached, discard its backing storage */
 	if (obj->mm.madv == I915_MADV_DONTNEED &&
-	    !i915_gem_object_has_pages(obj))
+	    !i915_gem_object_has_pages(obj) &&
+	    !i915_gem_object_has_self_managed_shrink_list(obj))
 		i915_gem_object_truncate(obj);
 
 	args->retained = obj->mm.madv != __I915_MADV_PURGED;
-- 
2.31.1

