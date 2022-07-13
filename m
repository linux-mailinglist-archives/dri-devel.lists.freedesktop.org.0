Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472C2573295
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3681B98A8F;
	Wed, 13 Jul 2022 09:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A166398A79;
 Wed, 13 Jul 2022 09:30:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA3E061CC4;
 Wed, 13 Jul 2022 09:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6096BC341E3;
 Wed, 13 Jul 2022 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657704622;
 bh=J2Sa3hm2zBlgOEeZya1e1BBIqVwbiPlLAjT/AUvYXTE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lYftaMgrB8JRa6YDJa9IORDSoDop3EuYuVcAN2TD2kSI5wZ4T/PNkcPY2yLUWFSj1
 ViBSrvqxZoGwFOzJHGOtSOw9LEP1lcFMYMCyMobcaQlEK68votQfeE4sfulYt9mchC
 AeeT6e+mX23zVbUX0HGZkNzJYmD7f2K68lhf6EuinbUGKURGdYUxkArnUbKbBqYgOm
 CUoKG9/nDljTVTTI8jWZgxW1rxAieP9gPvL9pmN3H1ZL9DRaBwDxGa5tcBLEXD44hH
 tEsj45BUf1P4iSOvYKfhweIggJaopyHmgHXRtT91sAQaGV4XrwkD6+JbI+lSirmHNc
 Kp0n7eL+Z38CA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBYhH-0050M0-TG;
 Wed, 13 Jul 2022 10:30:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 16/21] drm/i915: Define GuC Based TLB invalidation routines
Date: Wed, 13 Jul 2022 10:30:13 +0100
Message-Id: <06135f47cc14dc64a370d9800ae1ee689689cb71.1657703926.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657703926.git.mchehab@kernel.org>
References: <cover.1657703926.git.mchehab@kernel.org>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 David Airlie <airlied@linux.ie>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>, Borislav Petkov <bp@suse.de>,
 intel-gfx@lists.freedesktop.org,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>

Add routines to interface with GuC firmware for selective TLB invalidation
supported on XeHP.

Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 00/21] at: https://lore.kernel.org/all/cover.1657703926.git.mchehab@kernel.org/

 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 90 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 10 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  3 +
 4 files changed, 106 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index fb0af33e43cc..5c019856a269 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -188,6 +188,9 @@ enum intel_guc_state_capture_event_status {
 #define INTEL_GUC_TLB_INVAL_FLUSH_CACHE (1 << 31)
 
 enum intel_guc_tlb_invalidation_type {
+	INTEL_GUC_TLB_INVAL_FULL = 0x0,
+	INTEL_GUC_TLB_INVAL_PAGE_SELECTIVE = 0x1,
+	INTEL_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX = 0x2,
 	INTEL_GUC_TLB_INVAL_GUC = 0x3,
 };
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 8a104a292598..98260a7bc90b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -923,6 +923,96 @@ static int guc_send_invalidate_tlb(struct intel_guc *guc, u32 *action, u32 size)
 	return err;
 }
 
+ /* Full TLB invalidation */
+int intel_guc_invalidate_tlb_full(struct intel_guc *guc,
+				  enum intel_guc_tlb_inval_mode mode)
+{
+	u32 action[] = {
+		INTEL_GUC_ACTION_TLB_INVALIDATION,
+		0,
+		INTEL_GUC_TLB_INVAL_FULL << INTEL_GUC_TLB_INVAL_TYPE_SHIFT |
+			mode << INTEL_GUC_TLB_INVAL_MODE_SHIFT |
+			INTEL_GUC_TLB_INVAL_FLUSH_CACHE,
+	};
+
+	if (!INTEL_GUC_SUPPORTS_TLB_INVALIDATION(guc)) {
+		DRM_ERROR("Tlb invalidation: Operation not supported in this platform!\n");
+		return 0;
+	}
+
+	return guc_send_invalidate_tlb(guc, action, ARRAY_SIZE(action));
+}
+
+/*
+ * Selective TLB Invalidation for Address Range:
+ * TLB's in the Address Range is Invalidated across all engines.
+ */
+int intel_guc_invalidate_tlb_page_selective(struct intel_guc *guc,
+					    enum intel_guc_tlb_inval_mode mode,
+					    u64 start, u64 length)
+{
+	u64 vm_total = BIT_ULL(INTEL_INFO(guc_to_gt(guc)->i915)->ppgtt_size);
+	u32 address_mask = (ilog2(length) - ilog2(I915_GTT_PAGE_SIZE_4K));
+	u32 full_range = vm_total == length;
+	u32 action[] = {
+		INTEL_GUC_ACTION_TLB_INVALIDATION,
+		0,
+		INTEL_GUC_TLB_INVAL_PAGE_SELECTIVE << INTEL_GUC_TLB_INVAL_TYPE_SHIFT |
+			mode << INTEL_GUC_TLB_INVAL_MODE_SHIFT |
+			INTEL_GUC_TLB_INVAL_FLUSH_CACHE,
+		0,
+		full_range ? full_range : lower_32_bits(start),
+		full_range ? 0 : upper_32_bits(start),
+		full_range ? 0 : address_mask,
+	};
+
+	if (!INTEL_GUC_SUPPORTS_TLB_INVALIDATION_SELECTIVE(guc)) {
+		DRM_ERROR("Tlb invalidation: Operation not supported in this platform!\n");
+		return 0;
+	}
+
+	GEM_BUG_ON(!IS_ALIGNED(start, I915_GTT_PAGE_SIZE_4K));
+	GEM_BUG_ON(!IS_ALIGNED(length, I915_GTT_PAGE_SIZE_4K));
+	GEM_BUG_ON(range_overflows(start, length, vm_total));
+
+	return guc_send_invalidate_tlb(guc, action, ARRAY_SIZE(action));
+}
+
+/*
+ * Selective TLB Invalidation for Context:
+ * Invalidates all TLB's for a specific context across all engines.
+ */
+int intel_guc_invalidate_tlb_page_selective_ctx(struct intel_guc *guc,
+						enum intel_guc_tlb_inval_mode mode,
+						u64 start, u64 length, u32 ctxid)
+{
+	u64 vm_total = BIT_ULL(INTEL_INFO(guc_to_gt(guc)->i915)->ppgtt_size);
+	u32 address_mask = (ilog2(length) - ilog2(I915_GTT_PAGE_SIZE_4K));
+	u32 full_range = vm_total == length;
+	u32 action[] = {
+		INTEL_GUC_ACTION_TLB_INVALIDATION,
+		0,
+		INTEL_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX << INTEL_GUC_TLB_INVAL_TYPE_SHIFT |
+			mode << INTEL_GUC_TLB_INVAL_MODE_SHIFT |
+			INTEL_GUC_TLB_INVAL_FLUSH_CACHE,
+		ctxid,
+		full_range ? full_range : lower_32_bits(start),
+		full_range ? 0 : upper_32_bits(start),
+		full_range ? 0 : address_mask,
+	};
+
+	if (!INTEL_GUC_SUPPORTS_TLB_INVALIDATION_SELECTIVE(guc)) {
+		DRM_ERROR("Tlb invalidation: Operation not supported in this platform!\n");
+		return 0;
+	}
+
+	GEM_BUG_ON(!IS_ALIGNED(start, I915_GTT_PAGE_SIZE_4K));
+	GEM_BUG_ON(!IS_ALIGNED(length, I915_GTT_PAGE_SIZE_4K));
+	GEM_BUG_ON(range_overflows(start, length, vm_total));
+
+	return guc_send_invalidate_tlb(guc, action, ARRAY_SIZE(action));
+}
+
 /*
  * Guc TLB Invalidation: Invalidate the TLB's of GuC itself.
  */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 01c6478451cc..df6ba1c32808 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -384,6 +384,16 @@ int intel_guc_allocate_and_map_vma(struct intel_guc *guc, u32 size,
 int intel_guc_self_cfg32(struct intel_guc *guc, u16 key, u32 value);
 int intel_guc_self_cfg64(struct intel_guc *guc, u16 key, u64 value);
 
+int intel_guc_g2g_register(struct intel_guc *guc);
+
+int intel_guc_invalidate_tlb_full(struct intel_guc *guc,
+				  enum intel_guc_tlb_inval_mode mode);
+int intel_guc_invalidate_tlb_page_selective(struct intel_guc *guc,
+					    enum intel_guc_tlb_inval_mode mode,
+					    u64 start, u64 length);
+int intel_guc_invalidate_tlb_page_selective_ctx(struct intel_guc *guc,
+						  enum intel_guc_tlb_inval_mode mode,
+						  u64 start, u64 length, u32 ctxid);
 int intel_guc_invalidate_tlb_guc(struct intel_guc *guc,
 				 enum intel_guc_tlb_inval_mode mode);
 int intel_guc_invalidate_tlb_all(struct intel_guc *guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 3edf567b3f65..29e402f70a94 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -436,5 +436,8 @@ enum intel_guc_recv_message {
 	((intel_guc_ct_enabled(&(guc)->ct)) && \
 	 (intel_guc_submission_is_used(guc)) && \
 	 (GRAPHICS_VER(guc_to_gt((guc))->i915) >= 12))
+#define INTEL_GUC_SUPPORTS_TLB_INVALIDATION_SELECTIVE(guc) \
+	(INTEL_GUC_SUPPORTS_TLB_INVALIDATION(guc) && \
+	HAS_SELECTIVE_TLB_INVALIDATION(guc_to_gt(guc)->i915))
 
 #endif
-- 
2.36.1

