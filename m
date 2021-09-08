Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F6F403256
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 03:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052186E0FF;
	Wed,  8 Sep 2021 01:43:05 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F3F6E0F2;
 Wed,  8 Sep 2021 01:43:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="242653609"
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; d="scan'208";a="242653609"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 18:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; d="scan'208";a="431134815"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga003.jf.intel.com with ESMTP; 07 Sep 2021 18:42:59 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/8] drm/i915: Do not define vma on stack
Date: Tue,  7 Sep 2021 18:42:52 -0700
Message-Id: <20210908014259.50346-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908014259.50346-1-John.C.Harrison@Intel.com>
References: <20210908014259.50346-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>

Defining vma on stack can cause stack overflow, if
vma gets populated with new fields.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 18 +++++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h |  2 ++
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 3a16d08608a5..f632dbd32b42 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -413,20 +413,20 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
 {
 	struct drm_i915_gem_object *obj = uc_fw->obj;
 	struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
-	struct i915_vma dummy = {
-		.node.start = uc_fw_ggtt_offset(uc_fw),
-		.node.size = obj->base.size,
-		.pages = obj->mm.pages,
-		.vm = &ggtt->vm,
-	};
+	struct i915_vma *dummy = &uc_fw->dummy;
+
+	dummy->node.start = uc_fw_ggtt_offset(uc_fw);
+	dummy->node.size = obj->base.size;
+	dummy->pages = obj->mm.pages;
+	dummy->vm = &ggtt->vm;
 
 	GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
-	GEM_BUG_ON(dummy.node.size > ggtt->uc_fw.size);
+	GEM_BUG_ON(dummy->node.size > ggtt->uc_fw.size);
 
 	/* uc_fw->obj cache domains were not controlled across suspend */
-	drm_clflush_sg(dummy.pages);
+	drm_clflush_sg(dummy->pages);
 
-	ggtt->vm.insert_entries(&ggtt->vm, &dummy, I915_CACHE_NONE, 0);
+	ggtt->vm.insert_entries(&ggtt->vm, dummy, I915_CACHE_NONE, 0);
 }
 
 static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
index 99bb1fe1af66..693cc0ebcd63 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -10,6 +10,7 @@
 #include "intel_uc_fw_abi.h"
 #include "intel_device_info.h"
 #include "i915_gem.h"
+#include "i915_vma.h"
 
 struct drm_printer;
 struct drm_i915_private;
@@ -75,6 +76,7 @@ struct intel_uc_fw {
 	bool user_overridden;
 	size_t size;
 	struct drm_i915_gem_object *obj;
+	struct i915_vma dummy;
 
 	/*
 	 * The firmware build process will generate a version header file with major and
-- 
2.25.1

