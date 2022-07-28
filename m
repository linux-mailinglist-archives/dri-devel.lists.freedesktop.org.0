Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E975836C7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6291D10F269;
	Thu, 28 Jul 2022 02:21:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8E210FC2A;
 Thu, 28 Jul 2022 02:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658974834; x=1690510834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IyalwOtL18vCl0280/KkPGvLMPiAN5G8nXgc9WdCsjU=;
 b=Xm7XUJGdKtg2lW9rHpPelqVmUpUJOo6xE+6BxmPOblVH6EUfl9w6Et4n
 LHyUrnt+iysNSmsV2zCG8t+MLZqxNCxBbYtPIBI6nunUmMifxmUKjzqU0
 Z+hHG35wimvc2GNdcIfO2skSvaOYVR/9t09fhcLc6yaf/cCNKRksO8N61
 cBhE9Yra2XpzffJRAxJcAxlKQ15vq+ex7eqobXNkAkrZEjyab+Bpi9i1D
 ay7ZtUjAmeKhxMR2xl2yWBMj1aQFK2IOfY/fLMBX8k0xan7Mm/N27WgDq
 ss6iKq11sXBP5ypA6Kyt8PceG3tlVBfsFedBmYh6hvPw1yI37LpF3enTZ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="285947588"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="285947588"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 19:20:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="600648481"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 27 Jul 2022 19:20:28 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 7/7] drm/i915/guc: Reduce spam from error capture
Date: Wed, 27 Jul 2022 19:20:28 -0700
Message-Id: <20220728022028.2190627-8-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Some debug code got left in when the GuC based register save for error
capture was added. Remove that.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 67 ++++++++-----------
 1 file changed, 28 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index d2ac53d4f3b6e..8f11651460131 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -1383,33 +1383,22 @@ guc_capture_reg_to_str(const struct intel_guc *guc, u32 owner, u32 type,
 	return NULL;
 }
 
-#ifdef CONFIG_DRM_I915_DEBUG_GUC
-#define __out(a, ...) \
-	do { \
-		drm_warn((&(a)->i915->drm), __VA_ARGS__); \
-		i915_error_printf((a), __VA_ARGS__); \
-	} while (0)
-#else
-#define __out(a, ...) \
-	i915_error_printf(a, __VA_ARGS__)
-#endif
-
 #define GCAP_PRINT_INTEL_ENG_INFO(ebuf, eng) \
 	do { \
-		__out(ebuf, "    i915-Eng-Name: %s command stream\n", \
-		      (eng)->name); \
-		__out(ebuf, "    i915-Eng-Inst-Class: 0x%02x\n", (eng)->class); \
-		__out(ebuf, "    i915-Eng-Inst-Id: 0x%02x\n", (eng)->instance); \
-		__out(ebuf, "    i915-Eng-LogicalMask: 0x%08x\n", \
-		      (eng)->logical_mask); \
+		i915_error_printf(ebuf, "    i915-Eng-Name: %s command stream\n", \
+				  (eng)->name); \
+		i915_error_printf(ebuf, "    i915-Eng-Inst-Class: 0x%02x\n", (eng)->class); \
+		i915_error_printf(ebuf, "    i915-Eng-Inst-Id: 0x%02x\n", (eng)->instance); \
+		i915_error_printf(ebuf, "    i915-Eng-LogicalMask: 0x%08x\n", \
+				  (eng)->logical_mask); \
 	} while (0)
 
 #define GCAP_PRINT_GUC_INST_INFO(ebuf, node) \
 	do { \
-		__out(ebuf, "    GuC-Engine-Inst-Id: 0x%08x\n", \
-		      (node)->eng_inst); \
-		__out(ebuf, "    GuC-Context-Id: 0x%08x\n", (node)->guc_id); \
-		__out(ebuf, "    LRCA: 0x%08x\n", (node)->lrca); \
+		i915_error_printf(ebuf, "    GuC-Engine-Inst-Id: 0x%08x\n", \
+				  (node)->eng_inst); \
+		i915_error_printf(ebuf, "    GuC-Context-Id: 0x%08x\n", (node)->guc_id); \
+		i915_error_printf(ebuf, "    LRCA: 0x%08x\n", (node)->lrca); \
 	} while (0)
 
 int intel_guc_capture_print_engine_node(struct drm_i915_error_state_buf *ebuf,
@@ -1441,57 +1430,57 @@ int intel_guc_capture_print_engine_node(struct drm_i915_error_state_buf *ebuf,
 
 	guc = &ee->engine->gt->uc.guc;
 
-	__out(ebuf, "global --- GuC Error Capture on %s command stream:\n",
-	      ee->engine->name);
+	i915_error_printf(ebuf, "global --- GuC Error Capture on %s command stream:\n",
+			  ee->engine->name);
 
 	node = ee->guc_capture_node;
 	if (!node) {
-		__out(ebuf, "  No matching ee-node\n");
+		i915_error_printf(ebuf, "  No matching ee-node\n");
 		return 0;
 	}
 
-	__out(ebuf, "Coverage:  %s\n", grptype[node->is_partial]);
+	i915_error_printf(ebuf, "Coverage:  %s\n", grptype[node->is_partial]);
 
 	for (i = GUC_CAPTURE_LIST_TYPE_GLOBAL; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
-		__out(ebuf, "  RegListType: %s\n",
-		      datatype[i % GUC_CAPTURE_LIST_TYPE_MAX]);
-		__out(ebuf, "    Owner-Id: %d\n", node->reginfo[i].vfid);
+		i915_error_printf(ebuf, "  RegListType: %s\n",
+				  datatype[i % GUC_CAPTURE_LIST_TYPE_MAX]);
+		i915_error_printf(ebuf, "    Owner-Id: %d\n", node->reginfo[i].vfid);
 
 		switch (i) {
 		case GUC_CAPTURE_LIST_TYPE_GLOBAL:
 		default:
 			break;
 		case GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS:
-			__out(ebuf, "    GuC-Eng-Class: %d\n", node->eng_class);
-			__out(ebuf, "    i915-Eng-Class: %d\n",
-			      guc_class_to_engine_class(node->eng_class));
+			i915_error_printf(ebuf, "    GuC-Eng-Class: %d\n", node->eng_class);
+			i915_error_printf(ebuf, "    i915-Eng-Class: %d\n",
+					  guc_class_to_engine_class(node->eng_class));
 			break;
 		case GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE:
 			eng = intel_guc_lookup_engine(guc, node->eng_class, node->eng_inst);
 			if (eng)
 				GCAP_PRINT_INTEL_ENG_INFO(ebuf, eng);
 			else
-				__out(ebuf, "    i915-Eng-Lookup Fail!\n");
+				i915_error_printf(ebuf, "    i915-Eng-Lookup Fail!\n");
 			GCAP_PRINT_GUC_INST_INFO(ebuf, node);
 			break;
 		}
 
 		numregs = node->reginfo[i].num_regs;
-		__out(ebuf, "    NumRegs: %d\n", numregs);
+		i915_error_printf(ebuf, "    NumRegs: %d\n", numregs);
 		j = 0;
 		while (numregs--) {
 			regs = node->reginfo[i].regs;
 			str = guc_capture_reg_to_str(guc, GUC_CAPTURE_LIST_INDEX_PF, i,
 						     node->eng_class, 0, regs[j].offset, &is_ext);
 			if (!str)
-				__out(ebuf, "      REG-0x%08x", regs[j].offset);
+				i915_error_printf(ebuf, "      REG-0x%08x", regs[j].offset);
 			else
-				__out(ebuf, "      %s", str);
+				i915_error_printf(ebuf, "      %s", str);
 			if (is_ext)
-				__out(ebuf, "[%ld][%ld]",
-				      FIELD_GET(GUC_REGSET_STEERING_GROUP, regs[j].flags),
-				      FIELD_GET(GUC_REGSET_STEERING_INSTANCE, regs[j].flags));
-			__out(ebuf, ":  0x%08x\n", regs[j].value);
+				i915_error_printf(ebuf, "[%ld][%ld]",
+					FIELD_GET(GUC_REGSET_STEERING_GROUP, regs[j].flags),
+					FIELD_GET(GUC_REGSET_STEERING_INSTANCE, regs[j].flags));
+			i915_error_printf(ebuf, ":  0x%08x\n", regs[j].value);
 			++j;
 		}
 	}
-- 
2.37.1

