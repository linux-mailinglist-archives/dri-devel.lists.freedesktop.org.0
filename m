Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9445178C2
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 23:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D9C10E5C4;
	Mon,  2 May 2022 21:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F9A10E5C4;
 Mon,  2 May 2022 21:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651525411; x=1683061411;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oyTLKG4ZgxZ9sVXPBSjZZSFgBrcDWsWUKNWXpkOx5uU=;
 b=XznhtWd1WCl0QNQ2YoCEvWppMzevxuWJjoKM1MLwkkCtj/rT5iSXNOqB
 sPFWVyT9DHYhSsmmC+pZAUv6GMdmoKRrDkSORkgG2nuoAM6l8NjTPuxkk
 z4cDanjp92AIYGu0ky5YmBOY8w19YIT1k2HZnIJ90rKW6JVa8pKosHp7r
 DliWGC0MjknOjj0stVAWPmAbnTg20MBUXqybEBtPufoJ/FjlwOq+Mf8nK
 dadLs9VCWCRGpOcqJ6p2LL2q3KIlQQXmTzb/JxEs5O6YJYXCbCQ+vr9g9
 z9ACanae+W9GSvHAZ/vh/NccdKlfeBuKFEZNDCz/RsJKqTqKvqn4sds/o Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247877006"
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="247877006"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 14:03:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="663696114"
Received: from alwohlse-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.11.126])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 14:03:30 -0700
Date: Mon, 2 May 2022 14:03:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 03/11] drm/i915/pvc: Define MOCS table for PVC
Message-ID: <20220502210328.x6jvlln2e6x7zxlc@ldmartin-desk2>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-4-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220502163417.2635462-4-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>, Fei Yang <fei.yang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 09:34:09AM -0700, Matt Roper wrote:
>From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
>
>Bspec: 45101, 72161
>Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
>Signed-off-by: Fei Yang <fei.yang@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
> drivers/gpu/drm/i915/gt/intel_mocs.c        | 24 ++++++++++++++++++++-
> drivers/gpu/drm/i915/gt/intel_workarounds.c | 13 ++++++++---
> drivers/gpu/drm/i915/i915_drv.h             |  2 ++
> drivers/gpu/drm/i915/i915_pci.c             |  3 ++-
> drivers/gpu/drm/i915/intel_device_info.h    |  1 +
> 6 files changed, 39 insertions(+), 5 deletions(-)
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

I don't like much writting the bspec in code like this. For commit
message it's acceptable/desired, but for code I think it's not great as
1) it's not something generally available and 2) it will likely get
outdated so one would have to rely on git log/blame to see when this was
actually valid.


> 	} mocs;
>
> 	struct intel_pxp pxp;
>diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
>index c4c37585ae8c..265812589f87 100644
>--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
>+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
>@@ -23,6 +23,7 @@ struct drm_i915_mocs_table {
> 	unsigned int n_entries;
> 	const struct drm_i915_mocs_entry *table;
> 	u8 uc_index;
>+	u8 wb_index; /* Only for platforms listed in Bspec: 72161 */
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
>index a05c4b99b3fb..a656d9c2ca2b 100644
>--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>@@ -1994,7 +1994,7 @@ void intel_engine_apply_whitelist(struct intel_engine_cs *engine)
> static void
> engine_fake_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
> {
>-	u8 mocs;
>+	u8 mocs_w, mocs_r;
>
> 	/*
> 	 * RING_CMD_CCTL are need to be programed to un-cached
>@@ -2002,11 +2002,18 @@ engine_fake_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
> 	 * Streamers on Gen12 onward platforms.
> 	 */
> 	if (GRAPHICS_VER(engine->i915) >= 12) {
>-		mocs = engine->gt->mocs.uc_index;
>+		if (HAS_L3_CCS_READ(engine->i915) &&
>+		    engine->class == COMPUTE_CLASS)
>+			mocs_r = engine->gt->mocs.wb_index;
>+		else
>+			mocs_r = engine->gt->mocs.uc_index;

shouldn't we add a warning in get_mocs_settings() if HAS_L3_CCS_READ(engine->i915)
and mocs.wb_index is 0 (since index 0 shouldn't really be used in latest
platforms)?

Lucas De Marchi

>+
>+		mocs_w = engine->gt->mocs.uc_index;
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
>index 2dddc27a1b0e..8c8e7308502b 100644
>--- a/drivers/gpu/drm/i915/i915_drv.h
>+++ b/drivers/gpu/drm/i915/i915_drv.h
>@@ -1369,6 +1369,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
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
