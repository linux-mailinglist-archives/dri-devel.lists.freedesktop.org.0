Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 189F32C651A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2A36ECCE;
	Fri, 27 Nov 2020 12:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56AB6ECC7;
 Fri, 27 Nov 2020 12:10:46 +0000 (UTC)
IronPort-SDR: uJ40Ey1rTIjxVsGQmj/GNLaMw2lLy6/FZpjm3z24xcQIdJ+DX9cDxF7LGr8wBxfDgikNg5iwLd
 PJwcmc3Kiv1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092782"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092782"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:30 -0800
IronPort-SDR: OWBGh2GZOPmWY/iOIy+sohrSoF/mUHVrsVHja/RCYk4ew6zCJ35CRMw+MSPbyCrbAMgkBNy4Az
 dDDPmFaQbazg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029375"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:29 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 099/162] drm/i915/gtt/dgfx: place the PD in LMEM
Date: Fri, 27 Nov 2020 12:06:15 +0000
Message-Id: <20201127120718.454037-100-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's a requirement that for dgfx we place all the paging structures in
device local-memory.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c |  5 ++++-
 drivers/gpu/drm/i915/gt/intel_gtt.c  | 27 +++++++++++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_gtt.h  |  1 +
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index a3093dd4b86d..f67e0332ccbc 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -702,7 +702,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt)
 	 */
 	ppgtt->vm.has_read_only = !IS_GEN_RANGE(gt->i915, 11, 12);
 
-	ppgtt->vm.alloc_pt_dma = alloc_pt_dma;
+	if (IS_DGFX(gt->i915))
+		ppgtt->vm.alloc_pt_dma = alloc_pt_lmem;
+	else
+		ppgtt->vm.alloc_pt_dma = alloc_pt_dma;
 
 	err = gen8_init_scratch(&ppgtt->vm);
 	if (err)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index f3a263f09368..2605bfd39a15 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -7,10 +7,23 @@
 
 #include <linux/fault-inject.h>
 
+#include "gem/i915_gem_lmem.h"
 #include "i915_trace.h"
 #include "intel_gt.h"
 #include "intel_gtt.h"
 
+struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz)
+{
+	struct drm_i915_gem_object *obj;
+
+	obj = i915_gem_object_create_lmem(vm->i915, sz, 0);
+
+	/* ensure all dma objects have the same reservation class */
+	if (!IS_ERR(obj))
+		obj->base.resv = &vm->resv;
+	return obj;
+}
+
 struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz)
 {
 	struct drm_i915_gem_object *obj;
@@ -27,9 +40,14 @@ struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz)
 
 int map_pt_dma(struct i915_address_space *vm, struct drm_i915_gem_object *obj)
 {
+	enum i915_map_type type;
 	void *vaddr;
 
-	vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
+	type = I915_MAP_WB;
+	if (i915_gem_object_is_lmem(obj))
+		type = I915_MAP_WC;
+
+	vaddr = i915_gem_object_pin_map_unlocked(obj, type);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
@@ -39,9 +57,14 @@ int map_pt_dma(struct i915_address_space *vm, struct drm_i915_gem_object *obj)
 
 int map_pt_dma_locked(struct i915_address_space *vm, struct drm_i915_gem_object *obj)
 {
+	enum i915_map_type type;
 	void *vaddr;
 
-	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
+	type = I915_MAP_WB;
+	if (i915_gem_object_is_lmem(obj))
+		type = I915_MAP_WC;
+
+	vaddr = i915_gem_object_pin_map(obj, type);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 5b8ea9c8c654..bdbdfded60cc 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -522,6 +522,7 @@ int setup_scratch_page(struct i915_address_space *vm);
 void free_scratch(struct i915_address_space *vm);
 
 struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz);
+struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz);
 struct i915_page_table *alloc_pt(struct i915_address_space *vm);
 struct i915_page_directory *alloc_pd(struct i915_address_space *vm);
 struct i915_page_directory *__alloc_pd(int npde);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
