Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE87340A5A3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 06:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5346E400;
	Tue, 14 Sep 2021 04:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF896E3D6;
 Tue, 14 Sep 2021 04:54:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="220001355"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="220001355"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 21:54:37 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="552120054"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 21:54:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>
Subject: [PATCH 1/5] drm/i915: Do not define vma on stack
Date: Mon, 13 Sep 2021 21:49:29 -0700
Message-Id: <20210914044933.22932-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210914044933.22932-1-matthew.brost@intel.com>
References: <20210914044933.22932-1-matthew.brost@intel.com>
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

From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>

Defining vma on stack can cause stack overflow, if
vma gets populated with new fields.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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
2.32.0

