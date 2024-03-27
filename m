Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404EA88EFD5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 21:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7351410FFB1;
	Wed, 27 Mar 2024 20:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXVMkoZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB4110FFB1;
 Wed, 27 Mar 2024 20:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711569976; x=1743105976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=am2mj8+T6SMuackNPS20P6/aicAB83dsYfqBlgU/oRc=;
 b=LXVMkoZL+0l3t7nvzWvXep2kvOA2Fsuyc4I2Pu6lqtIimJDbdL6bO+/p
 ZCxNgy92HSh7Ci/EiNO6w8izk113DM3nkt6f8dzmceU7NlF+GIK0tjumq
 +NmXb9IE/62ech/53SZdQ1vqbSiDLOupQ5nwVDHti+Lwv2k5IohU1IxhQ
 Tty+GVHEmapoqAC0frbY86zQxBIbZos/9lzqxQcH0aokklBrsRZQeFqFO
 p9WArJfWy2HBdj/U4yO4nzBPaVV6NY2oCykPo+QPttITADvzSiRTS5pQB
 YxamzHuMphFJY+CCN4riBIBTCkD5WesiScC3kToea1EpDeE2V4sp0D55H A==;
X-CSE-ConnectionGUID: YgM83BlqQBKDHuQctz5rCA==
X-CSE-MsgGUID: P2SsMx3sSH6P/+HmzQ9W1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6526135"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="6526135"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 13:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="21126588"
Received: from unknown (HELO intel.com) ([10.247.118.215])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 13:06:07 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Michal Mrozek <michal.mrozek@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 mateusz.jablonski@intel.com, Andi Shyti <andi.shyti@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH] drm/i915/gt: Limit the reserved VM space to only the
 platforms that need it
Date: Wed, 27 Mar 2024 21:05:46 +0100
Message-ID: <20240327200546.640108-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Commit 9bb66c179f50 ("drm/i915: Reserve some kernel space per
vm") reduces the available VM space of one page in order to apply
Wa_16018031267 and Wa_16018063123.

This page was reserved indiscrimitely in all platforms even when
not needed. Limit it to DG2 onwards.

Fixes: 9bb66c179f50 ("drm/i915: Reserve some kernel space per vm")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 3 +++
 drivers/gpu/drm/i915/gt/intel_gt.c   | 6 ++++++
 drivers/gpu/drm/i915/gt/intel_gt.h   | 9 +++++----
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 1bd0e041e15c..398d60a66410 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -961,6 +961,9 @@ static int gen8_init_rsvd(struct i915_address_space *vm)
 	struct i915_vma *vma;
 	int ret;
 
+	if (!intel_gt_needs_wa_16018031267(vm->gt))
+		return 0;
+
 	/* The memory will be used only by GPU. */
 	obj = i915_gem_object_create_lmem(i915, PAGE_SIZE,
 					  I915_BO_ALLOC_VOLATILE |
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 2c6d31b8fc1a..580b5141ce1e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -1024,6 +1024,12 @@ enum i915_map_type intel_gt_coherent_map_type(struct intel_gt *gt,
 		return I915_MAP_WC;
 }
 
+bool intel_gt_needs_wa_16018031267(struct intel_gt *gt)
+{
+	/* Wa_16018031267, Wa_16018063123 */
+	return IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 55), IP_VER(12, 71));
+}
+
 bool intel_gt_needs_wa_22016122933(struct intel_gt *gt)
 {
 	return MEDIA_VER_FULL(gt->i915) == IP_VER(13, 0) && gt->type == GT_MEDIA;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 6e7cab60834c..b5e114d284ad 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -82,17 +82,18 @@ struct drm_printer;
 		  ##__VA_ARGS__);					\
 } while (0)
 
-#define NEEDS_FASTCOLOR_BLT_WABB(engine) ( \
-	IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 55), IP_VER(12, 71)) && \
-	engine->class == COPY_ENGINE_CLASS && engine->instance == 0)
-
 static inline bool gt_is_root(struct intel_gt *gt)
 {
 	return !gt->info.id;
 }
 
+bool intel_gt_needs_wa_16018031267(struct intel_gt *gt);
 bool intel_gt_needs_wa_22016122933(struct intel_gt *gt);
 
+#define NEEDS_FASTCOLOR_BLT_WABB(engine) ( \
+	intel_gt_needs_wa_16018031267(engine->gt) && \
+	engine->class == COPY_ENGINE_CLASS && engine->instance == 0)
+
 static inline struct intel_gt *uc_to_gt(struct intel_uc *uc)
 {
 	return container_of(uc, struct intel_gt, uc);
-- 
2.43.0

