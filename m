Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFA75FCF22
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 02:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C4B10E2DC;
	Thu, 13 Oct 2022 00:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE2F10E11E;
 Thu, 13 Oct 2022 00:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665619293; x=1697155293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DEDfmlby7snXBqn8eVdxMM6vc+hX5tmfIhvgYMcqoSI=;
 b=bIWbdxIAeQzNo7OWOSvXFFYv51+mwOWLgTM+bh7gdnCBGT83bF0OhBKQ
 z9EmDQNa1JtOl4g7L9l8lYw9lGQaQthF8IcbNdGZjI4hd1ZtB3tSwm+9q
 I0TOuUlaobfg4iUXpZCC/2kEhiLUT+gt+PLHuDbp/EX7+GMrv4rB0xiNl
 aCypPKGwKGoMc2CpA5Yfe78c3kvGlVyjIW+AK1Z7NtcE0pBj7ioEDxip8
 9KO2WvackEwNvitaLwCzJyGd7LeEdxPR7wqHqeRm0xSDbHNYvJbeAc2Dx
 hCkLAIOnT7p4q8WrWkLwP5Z43SlwGZahGI58Ektpb1lqyKq0Kpp2yVbWc g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="292263363"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="292263363"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 17:01:33 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="802031105"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="802031105"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 17:01:33 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/7] drm/i915/uc: use different ggtt pin offsets for uc
 loads
Date: Wed, 12 Oct 2022 17:03:28 -0700
Message-Id: <20221013000332.1738078-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
References: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
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

v2: fail fetch if FW is > 2MBs, improve comments (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 30 +++++++++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h | 13 ++++++++++
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index de2843dc1307..021290a26195 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -575,6 +575,17 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	err = firmware_request_nowarn(&fw, uc_fw->file_selected.path, dev);
 	memcpy(&file_ideal, &uc_fw->file_wanted, sizeof(file_ideal));
 
+	if (!err && fw->size > INTEL_UC_RSVD_GGTT_PER_FW) {
+		drm_err(&i915->drm,
+			"%s firmware %s: size (%zuKB) exceeds max supported size (%uKB)\n",
+			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+			fw->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
+
+		/* try to find another blob to load */
+		release_firmware(fw);
+		err = -ENOENT;
+	}
+
 	/* Any error is terminal if overriding. Don't bother searching for older versions */
 	if (err && intel_uc_fw_is_overridden(uc_fw))
 		goto fail;
@@ -677,14 +688,28 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 
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
+	 * the media one. This will need to be updated if we ever have more
+	 * than 1 media GT
+	 */
+	BUILD_BUG_ON(INTEL_UC_FW_NUM_TYPES * INTEL_UC_RSVD_GGTT_PER_FW > SZ_8M);
+	GEM_BUG_ON(gt->type == GT_MEDIA && gt->info.id > 1);
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
@@ -699,7 +724,6 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
 	dummy->bi.pages = obj->mm.pages;
 
 	GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
-	GEM_BUG_ON(dummy->node_size > ggtt->uc_fw.size);
 
 	/* uc_fw->obj cache domains were not controlled across suspend */
 	if (i915_gem_object_has_struct_page(obj))
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
index cb586f7df270..7b3db41efa6e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -6,6 +6,7 @@
 #ifndef _INTEL_UC_FW_H_
 #define _INTEL_UC_FW_H_
 
+#include <linux/sizes.h>
 #include <linux/types.h>
 #include "intel_uc_fw_abi.h"
 #include "intel_device_info.h"
@@ -114,6 +115,18 @@ struct intel_uc_fw {
 						     (uc)->fw.file_selected.minor_ver, \
 						     (uc)->fw.file_selected.patch_ver))
 
+/*
+ * When we load the uC binaries, we pin them in a reserved section at the top of
+ * the GGTT, which is ~18 MBs. On multi-GT systems where the GTs share the GGTT,
+ * we also need to make sure that each binary is pinned to a unique location
+ * during load, because the different GT can go through the FW load at the same
+ * time. Given that the available space is much greater than what is required by
+ * the binaries, to keep things simple instead of dynamically partitioning the
+ * reserved section to make space for all the blobs we can just reserve a static
+ * chunk for each binary.
+ */
+#define INTEL_UC_RSVD_GGTT_PER_FW SZ_2M
+
 #ifdef CONFIG_DRM_I915_DEBUG_GUC
 void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 			       enum intel_uc_fw_status status);
-- 
2.37.3

