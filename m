Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C585E6F6F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 00:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F6D10E4D3;
	Thu, 22 Sep 2022 22:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD9210E476;
 Thu, 22 Sep 2022 22:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663884629; x=1695420629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RYwxRZruxrDAGthgoYb/+OShSUr1Fx8Keq5fyLpmU8U=;
 b=aCMhU2G5+yXHYSmxnGUAqk3bcacCHJJZdvu42uBUlE6l8uawi2emQ5ub
 IX/0AlbrF/FEq30SEmIGbtsrT77VJOnw7MydtWNyIqAVd6B5Ynp2RO8cd
 ek13I35akgQrZmLugL6/80yPFMXb2oCBOHW5m1bwLsqExEvutvFF2RAeY
 YRdRMCc+aNSkco8NkrXo3t0/atiZ5cEgb72hwVwOg+AXNlTx4YcDIWY43
 98GCEyxHL+y9PhpWHKFrn3DZD6WbEw8wVfB2lXZAV1B6/7b69QJjTJAZ8
 7Dr0Q2G6czdqqBHUIOlSGp04gkqIDnLVn0Z7FiWB/PVwSk6J9TBzgjBQa A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280815502"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="280815502"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 15:10:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="682416243"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 15:10:29 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/7] drm/i915/uc: use different ggtt pin offsets for uc loads
Date: Thu, 22 Sep 2022 15:11:13 -0700
Message-Id: <20220922221117.458087-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our current FW loading process is the same for all FWs:

- Pin FW to GGTT at the start of the ggtt->uc_fw node
- Load the FW
- Unpin

This worked because we didn't have a case where 2 FWs would be loaded on
the same GGTT at the same time. On MTL, however, this can happend if both
GTs are reset at the same time, so we can't pin everything in the same
spot and we need to use separate offset. For simplicity, instead of
calculating the exact required size, we reserve a 2MB slot for each fw.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index b91ad4aede1f..d6ca772e9f4b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -666,16 +666,33 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	return err;
 }
 
+/*
+ * The reserved GGTT space is ~18 MBs. All our blobs are well below 1MB, so for
+ * safety we reserve 2MB each.
+ */
+#define INTEL_UC_RSVD_GGTT_PER_FW SZ_2M
 static u32 uc_fw_ggtt_offset(struct intel_uc_fw *uc_fw)
 {
-	struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
+	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
+	struct i915_ggtt *ggtt = gt->ggtt;
 	struct drm_mm_node *node = &ggtt->uc_fw;
+	u32 offset = uc_fw->type * INTEL_UC_RSVD_GGTT_PER_FW;
+
+	/*
+	 * To keep the math simple, we use 8MB for the root tile and 8MB for
+	 * the media one.
+	 */
+	BUILD_BUG_ON(INTEL_UC_FW_NUM_TYPES * INTEL_UC_RSVD_GGTT_PER_FW > SZ_8M);
+	if (gt->type == GT_MEDIA)
+		offset += SZ_8M;
 
 	GEM_BUG_ON(!drm_mm_node_allocated(node));
 	GEM_BUG_ON(upper_32_bits(node->start));
 	GEM_BUG_ON(upper_32_bits(node->start + node->size - 1));
+	GEM_BUG_ON(offset + uc_fw->obj->base.size > node->size);
+	GEM_BUG_ON(uc_fw->obj->base.size > INTEL_UC_RSVD_GGTT_PER_FW);
 
-	return lower_32_bits(node->start);
+	return lower_32_bits(node->start + offset);
 }
 
 static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
@@ -690,7 +707,6 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
 	dummy->bi.pages = obj->mm.pages;
 
 	GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
-	GEM_BUG_ON(dummy->node_size > ggtt->uc_fw.size);
 
 	/* uc_fw->obj cache domains were not controlled across suspend */
 	if (i915_gem_object_has_struct_page(obj))
-- 
2.37.3

