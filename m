Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02257563C91
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 00:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A961125B9;
	Fri,  1 Jul 2022 22:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B2D1125A7;
 Fri,  1 Jul 2022 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656715878; x=1688251878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YUEPFON9WjBvXA+Sv1QyZi7oYbiiZInsuDd+EG4gmbA=;
 b=fVh9t0gKca4ngyhhVxzeWZWe/UyIVtOa04720DGEiw7oyKsxUR2jowgw
 lUl10h305Sl/3Nc0aiLSyxlfRpzNbpDhoNkSiLi5zsvm6fFzAyqEX7cSp
 wFxy1r+17cKDfccvEz/+PjnNDeCWiDkQbHi06dbzHtwIYbXNnpiN354cF
 NLYUQ4fA7t8hA5qMpIPpnfQeuO9RTHhoWI7EUqvtvFrFbOvAPgKZ9mSmd
 IL1d3Ow3voikumwkGaxPdERTeWvVIrfnwn0lf5Uu+4jyvNfyN4Oms/p5U
 2dDEotpzJq1/vWIAKeWbKpsZttCDzXFjG+WO+CAscsJjF7THZTcO6X0RG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="282789057"
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="282789057"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 15:51:18 -0700
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="918645116"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 01 Jul 2022 15:51:18 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 10/10] drm/i915/vm_bind: Fix vm->vm_bind_mutex and vm->mutex
 nesting
Date: Fri,  1 Jul 2022 15:50:55 -0700
Message-Id: <20220701225055.8204-11-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 lionel.g.landwerlin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, jason@jlekstrand.net, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VM_BIND functionality maintain that vm->vm_bind_mutex will never be taken
while holding vm->mutex.
However, while closing 'vm', vma is destroyed while holding vm->mutex.
But vma releasing needs to take vm->vm_bind_mutex in order to delete vma
from the vm_bind_list. To avoid this, destroy the vma outside vm->mutex
while closing the 'vm'.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 4ab3bda644ff..4f707d0eb3ef 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -109,7 +109,8 @@ int map_pt_dma_locked(struct i915_address_space *vm, struct drm_i915_gem_object
 	return 0;
 }
 
-static void clear_vm_list(struct list_head *list)
+static void clear_vm_list(struct list_head *list,
+			  struct list_head *destroy_list)
 {
 	struct i915_vma *vma, *vn;
 
@@ -138,8 +139,7 @@ static void clear_vm_list(struct list_head *list)
 			i915_vm_resv_get(vma->vm);
 			vma->vm_ddestroy = true;
 		} else {
-			i915_vma_destroy_locked(vma);
-			i915_gem_object_put(obj);
+			list_move_tail(&vma->vm_link, destroy_list);
 		}
 
 	}
@@ -147,16 +147,29 @@ static void clear_vm_list(struct list_head *list)
 
 static void __i915_vm_close(struct i915_address_space *vm)
 {
+	struct i915_vma *vma, *vn;
+	struct list_head list;
+
+	INIT_LIST_HEAD(&list);
+
 	mutex_lock(&vm->mutex);
 
-	clear_vm_list(&vm->bound_list);
-	clear_vm_list(&vm->unbound_list);
+	clear_vm_list(&vm->bound_list, &list);
+	clear_vm_list(&vm->unbound_list, &list);
 
 	/* Check for must-fix unanticipated side-effects */
 	GEM_BUG_ON(!list_empty(&vm->bound_list));
 	GEM_BUG_ON(!list_empty(&vm->unbound_list));
 
 	mutex_unlock(&vm->mutex);
+
+	/* Destroy vmas outside vm->mutex */
+	list_for_each_entry_safe(vma, vn, &list, vm_link) {
+		struct drm_i915_gem_object *obj = vma->obj;
+
+		i915_vma_destroy(vma);
+		i915_gem_object_put(obj);
+	}
 }
 
 /* lock the vm into the current ww, if we lock one, we lock all */
-- 
2.21.0.rc0.32.g243a4c7e27

