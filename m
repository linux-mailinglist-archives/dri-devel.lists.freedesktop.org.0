Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B0A55190A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 14:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A446C10E11A;
	Mon, 20 Jun 2022 12:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9313810E10E;
 Mon, 20 Jun 2022 12:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655728633; x=1687264633;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qFwvu1OGOezNEAXE7rT68a715m4aP7a3YO5THxJS9pw=;
 b=hkb2lCdDj/tnAchZdDZoKV61neM1am996Fy+MkpIgNcf4lamCDFpyvQM
 EOhMsCzGp76jUQ31c6omObS1NFo3dPQez9CGCK8rt0xuNSrmeUPH58k5N
 7lRYK4QAMZN5wNc3L5qMrbe267bbpMHeDAFFu7slGRHio9vxeJRUV+k4B
 1eCsb8L7w3UtNU7TYalf1D+K9Lev+bpmHT/rs+ZKslV5238OHvaDe5udV
 4xqPjLM+28rPiETozilId+0RlWD+19PW0rsYlxrF6YtAF3LE59AUAp171
 Py9aQMHIzwB3efo2oc8YwcbZf4Ycs5bLQK26cIXdja9aRAtcfytFlrn4J w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280939792"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="280939792"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 05:37:12 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="729367457"
Received: from ahashmi-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.225])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 05:37:10 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Fix vm use-after-free in vma destruction
Date: Mon, 20 Jun 2022 14:36:59 +0200
Message-Id: <20220620123659.381772-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.34.3
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
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In vma destruction, the following race may occur:

Thread 1:	    		  Thread 2:
i915_vma_destroy();

  ...
  list_del_init(vma->vm_link);
  ...
  mutex_unlock(vma->vm->mutex);
				  __i915_vm_release();
release_references();

And in release_reference() we dereference vma->vm to get to the
vm gt pointer, leading to a use-after free.

However, __i915_vm_release() grabs the vm->mutex so the vm won't be
destroyed before vma->vm->mutex is released, so extract the gt pointer
under the vm->mutex to avoid the vma->vm dereference in
release_references().

v2: Fix a typo in the commit message (Andi Shyti)

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5944
Fixes: e1a7ab4fca ("drm/i915: Remove the vm open count")

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 0bffb70b3c5f..04d12f278f57 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1637,10 +1637,10 @@ static void force_unbind(struct i915_vma *vma)
 	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
 }
 
-static void release_references(struct i915_vma *vma, bool vm_ddestroy)
+static void release_references(struct i915_vma *vma, struct intel_gt *gt,
+			       bool vm_ddestroy)
 {
 	struct drm_i915_gem_object *obj = vma->obj;
-	struct intel_gt *gt = vma->vm->gt;
 
 	GEM_BUG_ON(i915_vma_is_active(vma));
 
@@ -1695,11 +1695,12 @@ void i915_vma_destroy_locked(struct i915_vma *vma)
 
 	force_unbind(vma);
 	list_del_init(&vma->vm_link);
-	release_references(vma, false);
+	release_references(vma, vma->vm->gt, false);
 }
 
 void i915_vma_destroy(struct i915_vma *vma)
 {
+	struct intel_gt *gt;
 	bool vm_ddestroy;
 
 	mutex_lock(&vma->vm->mutex);
@@ -1707,8 +1708,11 @@ void i915_vma_destroy(struct i915_vma *vma)
 	list_del_init(&vma->vm_link);
 	vm_ddestroy = vma->vm_ddestroy;
 	vma->vm_ddestroy = false;
+
+	/* vma->vm may be freed when releasing vma->vm->mutex. */
+	gt = vma->vm->gt;
 	mutex_unlock(&vma->vm->mutex);
-	release_references(vma, vm_ddestroy);
+	release_references(vma, gt, vm_ddestroy);
 }
 
 void i915_vma_parked(struct intel_gt *gt)
-- 
2.34.3

