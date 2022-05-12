Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD8C524950
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 11:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11BC10EF89;
	Thu, 12 May 2022 09:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE2F10EE75;
 Thu, 12 May 2022 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652348570; x=1683884570;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KyhwnmTj1nvzWT5k5c53PwuQu4XkAT/gmtroG5qPJZQ=;
 b=m4P8w09m6f0j5VFZbJAQNn7pGTxj1la0h0ZYRm8b3sxWICWJBdcpgD2e
 h5u9MyeGkU6K0/64FEkwn2c51wQwz3CT+WC6COBPfUaQuwhh6ZAQKTpTS
 uKXuSvgHslwQiV+g9q12aTQMf1KPJrOMoD7apH/NDHtYKfFd4yiqJnU93
 tEyRj67seq5MSC87Ofv+LcL0zQEZADWzNrjp/PwUtkzo5YYsVVx2R5rPz
 ZREzm9hJXwCaQxG429xzRgWPbXfJ0NcBX/4LX/2I1TCAFRW5yvnSq/uNW
 k+YV8SdESn9V+78DgRW2hbdro/NO1+kxYCIEp9WEkjyY3gtR9AK4Rnmz1 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="356373600"
X-IronPort-AV: E=Sophos;i="5.91,219,1647327600"; d="scan'208";a="356373600"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 02:41:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,219,1647327600"; d="scan'208";a="553699442"
Received: from xiaoleiy-mobl1.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.142])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 02:41:13 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fix vm use-after-free in vma destruction
Date: Thu, 12 May 2022 11:40:45 +0200
Message-Id: <20220512094045.792373-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
vm gt pointer, leadin go a use-after free.

However, __i915_vm_release() grabs the vm->mutex so the vm won't be
destroyed before vma->vm->mutex is released, so extract the gt pointer
under the vm->mutex to avoid the vma->vm dereference in
release_references().

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5944
Fixes: e1a7ab4fca ("drm/i915: Remove the vm open count")

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 4f6db539571a..5d6850a91a69 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1636,10 +1636,10 @@ static void force_unbind(struct i915_vma *vma)
 	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
 }
 
-static void release_references(struct i915_vma *vma, bool vm_ddestroy)
+static void release_references(struct i915_vma *vma, struct intel_gt *gt,
+			       bool vm_ddestroy)
 {
 	struct drm_i915_gem_object *obj = vma->obj;
-	struct intel_gt *gt = vma->vm->gt;
 
 	GEM_BUG_ON(i915_vma_is_active(vma));
 
@@ -1694,11 +1694,12 @@ void i915_vma_destroy_locked(struct i915_vma *vma)
 
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
@@ -1706,8 +1707,11 @@ void i915_vma_destroy(struct i915_vma *vma)
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
2.34.1

