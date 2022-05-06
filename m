Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 784AD51DE2A
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 19:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CD110E427;
	Fri,  6 May 2022 17:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327AB10E28B;
 Fri,  6 May 2022 17:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651856908; x=1683392908;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0RvMAe9WcJf5smD6IVOi2SkfWOCWwZgw6DXwZx9bO/U=;
 b=TQhoLtzOvPyNh0derQw1Ix9yrZzSSaez6zeiu4UZjT9htCLANZT61kPI
 tloXW7TkwKC39kdaovrk3D6cThOeO4Bg2m1LGQnJOA6V7FVrJqWUbPZlP
 OvM3FbkgwQm6jVGfaNVk/h50UAZIpVL0kgWgCIkQqwXjAt6NNYFW0qlvA
 WXE7fUV7/yAb3ofpshWSAIMLeBuKQICpmO2XJ1PJLS/SNdm+XhgCjv8ua
 o5MH90IZhJGDFFjA2oPekgVhgDeo3zjkwqXrO6pdFfOxwzjp/UhuKyA+2
 PEF7fiqaGIAgn/SV9lEt0Q00/46ycor25bGNM5NxK+w+681m0AxaQlPhl Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="268418232"
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="268418232"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 10:08:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="537977659"
Received: from bhausman-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.22.165])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 10:08:27 -0700
Date: Fri, 6 May 2022 10:08:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 03/12] drm/i915/pvc: Define MOCS table for
 PVC
Message-ID: <20220506170827.fqqsisrdxfu4mn6j@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220505213812.3979301-1-matthew.d.roper@intel.com>
 <20220505213812.3979301-4-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220505213812.3979301-4-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 05, 2022 at 02:38:03PM -0700, Matt Roper wrote:
>From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
>
>v2 (MattR):
> - Clarify comment above RING_CMD_CCTL programming.
> - Remove bspec reference from field definition.  (Lucas)
> - Add WARN if we try to use a (presumably uninitialized) wb_index of 0.
>   On most platforms 0 is an invalid MOCS entry and even on the ones
>   where it isn't, it isn't the right setting for wb_index.  (Lucas)
>
>Bspec: 45101, 72161
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
>Signed-off-by: Fei Yang <fei.yang@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
> drivers/gpu/drm/i915/gt/intel_mocs.c        | 24 ++++++++++++++++-
> drivers/gpu/drm/i915/gt/intel_workarounds.c | 30 ++++++++++++++++-----
> drivers/gpu/drm/i915/i915_drv.h             |  2 ++
> drivers/gpu/drm/i915/i915_pci.c             |  3 ++-
> drivers/gpu/drm/i915/intel_device_info.h    |  1 +
> 6 files changed, 53 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>index b06611c1d4ad..7853ea194ea6 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>@@ -221,6 +221,7 @@ struct intel_gt {
>
> 	struct {
> 		u8 uc_index;
>+		u8 wb_index; /* Only for platforms listed in Bspec: 72161 */

doesn't correspond to changelog

other than that,  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> 	} mocs;
>
> 	struct intel_pxp pxp;
>diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
>index c4c37585ae8c..c6ebe2781076 100644
>--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
>+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
>@@ -23,6 +23,7 @@ struct drm_i915_mocs_table {
> 	unsigned int n_entries;
> 	const struct drm_i915_mocs_entry *table;
> 	u8 uc_index;
>+	u8 wb_index; /* Only used on HAS_L3_CCS_READ() platforms */
> 	u8 unused_entries_index;
> };
>
>@@ -47,6 +48,7 @@ struct drm_i915_mocs_table {
>
> /* Helper defines */
> #define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
>+#define PVC_NUM_MOCS_ENTRIES	3
>
> /* (e)LLC caching options */
> /*
>@@ -394,6 +396,17 @@ static const struct drm_i915_mocs_entry dg2_mocs_table_g10_ax[] = {
> 	MOCS_ENTRY(3, 0, L3_3_WB | L3_LKUP(1)),
> };
>
>+static const struct drm_i915_mocs_entry pvc_mocs_table[] = {
>+	/* Error */
>+	MOCS_ENTRY(0, 0, L3_3_WB),
>+
>+	/* UC */
>+	MOCS_ENTRY(1, 0, L3_1_UC),
>+
>+	/* WB */
>+	MOCS_ENTRY(2, 0, L3_3_WB),
>+};
>+
> enum {
> 	HAS_GLOBAL_MOCS = BIT(0),
> 	HAS_ENGINE_MOCS = BIT(1),
>@@ -423,7 +436,14 @@ static unsigned int get_mocs_settings(const struct drm_i915_private *i915,
> 	memset(table, 0, sizeof(struct drm_i915_mocs_table));
>
> 	table->unused_entries_index = I915_MOCS_PTE;
>-	if (IS_DG2(i915)) {
>+	if (IS_PONTEVECCHIO(i915)) {
>+		table->size = ARRAY_SIZE(pvc_mocs_table);
>+		table->table = pvc_mocs_table;
>+		table->n_entries = PVC_NUM_MOCS_ENTRIES;
>+		table->uc_index = 1;
>+		table->wb_index = 2;
>+		table->unused_entries_index = 2;
>+	} else if (IS_DG2(i915)) {
> 		if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_B0)) {
> 			table->size = ARRAY_SIZE(dg2_mocs_table_g10_ax);
> 			table->table = dg2_mocs_table_g10_ax;
>@@ -622,6 +642,8 @@ void intel_set_mocs_index(struct intel_gt *gt)
>
> 	get_mocs_settings(gt->i915, &table);
> 	gt->mocs.uc_index = table.uc_index;
>+	if (HAS_L3_CCS_READ(gt->i915))
>+		gt->mocs.wb_index = table.wb_index;
> }
>
> void intel_mocs_init(struct intel_gt *gt)
>diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>index a05c4b99b3fb..756807c4b405 100644
>--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>@@ -1994,19 +1994,37 @@ void intel_engine_apply_whitelist(struct intel_engine_cs *engine)
> static void
> engine_fake_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
> {
>-	u8 mocs;
>+	u8 mocs_w, mocs_r;
>
> 	/*
>-	 * RING_CMD_CCTL are need to be programed to un-cached
>-	 * for memory writes and reads outputted by Command
>-	 * Streamers on Gen12 onward platforms.
>+	 * RING_CMD_CCTL specifies the default MOCS entry that will be used
>+	 * by the command streamer when executing commands that don't have
>+	 * a way to explicitly specify a MOCS setting.  The default should
>+	 * usually reference whichever MOCS entry corresponds to uncached
>+	 * behavior, although use of a WB cached entry is recommended by the
>+	 * spec in certain circumstances on specific platforms.
> 	 */
> 	if (GRAPHICS_VER(engine->i915) >= 12) {
>-		mocs = engine->gt->mocs.uc_index;
>+		mocs_r = engine->gt->mocs.uc_index;
>+		mocs_w = engine->gt->mocs.uc_index;
>+
>+		if (HAS_L3_CCS_READ(engine->i915) &&
>+		    engine->class == COMPUTE_CLASS) {
>+			mocs_r = engine->gt->mocs.wb_index;
>+
>+			/*
>+			 * Even on the few platforms where MOCS 0 is a
>+			 * legitimate table entry, it's never the correct
>+			 * setting to use here; we can assume the MOCS init
>+			 * just forgot to initialize wb_index.
>+			 */
>+			drm_WARN_ON(&engine->i915->drm, mocs_r == 0);
>+		}
>+
> 		wa_masked_field_set(wal,
> 				    RING_CMD_CCTL(engine->mmio_base),
> 				    CMD_CCTL_MOCS_MASK,
>-				    CMD_CCTL_MOCS_OVERRIDE(mocs, mocs));
>+				    CMD_CCTL_MOCS_OVERRIDE(mocs_w, mocs_r));
> 	}
> }
>
>diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>index 00d7eeae33bd..b389674b5210 100644
>--- a/drivers/gpu/drm/i915/i915_drv.h
>+++ b/drivers/gpu/drm/i915/i915_drv.h
>@@ -1370,6 +1370,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>
> #define HAS_LSPCON(dev_priv) (IS_DISPLAY_VER(dev_priv, 9, 10))
>
>+#define HAS_L3_CCS_READ(i915) (INTEL_INFO(i915)->has_l3_ccs_read)
>+
> /* DPF == dynamic parity feature */
> #define HAS_L3_DPF(dev_priv) (INTEL_INFO(dev_priv)->has_l3_dpf)
> #define NUM_L3_SLICES(dev_priv) (IS_HSW_GT3(dev_priv) ? \
>diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
>index 498708b33924..07722cdf63ac 100644
>--- a/drivers/gpu/drm/i915/i915_pci.c
>+++ b/drivers/gpu/drm/i915/i915_pci.c
>@@ -1076,7 +1076,8 @@ static const struct intel_device_info ats_m_info = {
>
> #define XE_HPC_FEATURES \
> 	XE_HP_FEATURES, \
>-	.dma_mask_size = 52
>+	.dma_mask_size = 52, \
>+	.has_l3_ccs_read = 1
>
> __maybe_unused
> static const struct intel_device_info pvc_info = {
>diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
>index e7d2cf7d65c8..09e33296157a 100644
>--- a/drivers/gpu/drm/i915/intel_device_info.h
>+++ b/drivers/gpu/drm/i915/intel_device_info.h
>@@ -150,6 +150,7 @@ enum intel_ppgtt_type {
> 	func(has_heci_pxp); \
> 	func(has_heci_gscfi); \
> 	func(has_guc_deprivilege); \
>+	func(has_l3_ccs_read); \
> 	func(has_l3_dpf); \
> 	func(has_llc); \
> 	func(has_logical_ring_contexts); \
>-- 
>2.35.1
>
