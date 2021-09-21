Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 962E54138CA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E976E9CC;
	Tue, 21 Sep 2021 17:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE9A89EBD;
 Tue, 21 Sep 2021 17:40:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="220232975"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="220232975"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 10:36:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="518295650"
Received: from twallyn-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.83.37])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 10:36:41 -0700
Date: Tue, 21 Sep 2021 10:36:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2 5/6] drm/i915/uncore: Drop gen11 mmio read handlers
Message-ID: <20210921173641.zkkyt2wygd7g3xq2@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210910201030.3436066-1-matthew.d.roper@intel.com>
 <20210910201030.3436066-6-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210910201030.3436066-6-matthew.d.roper@intel.com>
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

On Fri, Sep 10, 2021 at 01:10:29PM -0700, Matt Roper wrote:
>Consolidate down to just a single 'fwtable' implementation.  For reads
>we don't need to worry about shadow tables.  Also, the
>NEEDS_FORCE_WAKE() check we previously had in the fwtable implementation
>can be dropped --- if a register is outside that range on one of the old
>platforms, then it won't belong to any forcewake range and 0 will be
>returned anyway.
>
>v2:
> - Restore NEEDS_FORCE_WAKE() check.  (Chris, Tvrtko)
>
>Cc: Chris Wilson <chris@chris-wilson.co.uk>
>Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/intel_uncore.c | 40 ++++++++++++-----------------
> 1 file changed, 17 insertions(+), 23 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
>index bfb2a6337f9d..10f124297e7c 100644
>--- a/drivers/gpu/drm/i915/intel_uncore.c
>+++ b/drivers/gpu/drm/i915/intel_uncore.c
>@@ -935,9 +935,6 @@ static const struct intel_forcewake_range __vlv_fw_ranges[] = {
> 	__fwd; \
> })
>
>-#define __gen11_fwtable_reg_read_fw_domains(uncore, offset) \
>-	find_fw_domain(uncore, offset)
>-
> /* *Must* be sorted by offset! See intel_shadow_table_check(). */
> static const struct i915_range gen8_shadowed_regs[] = {
> 	{ .start =  0x2030, .end =  0x2030 },
>@@ -1570,33 +1567,30 @@ static inline void __force_wake_auto(struct intel_uncore *uncore,
> 		___force_wake_auto(uncore, fw_domains);
> }
>
>-#define __gen_read(func, x) \
>+#define __gen_fwtable_read(x) \
> static u##x \
>-func##_read##x(struct intel_uncore *uncore, i915_reg_t reg, bool trace) { \
>+fwtable_read##x(struct intel_uncore *uncore, i915_reg_t reg, bool trace) \
>+{ \
> 	enum forcewake_domains fw_engine; \
> 	GEN6_READ_HEADER(x); \
>-	fw_engine = __##func##_reg_read_fw_domains(uncore, offset); \
>+	fw_engine = __fwtable_reg_read_fw_domains(uncore, offset); \
> 	if (fw_engine) \
> 		__force_wake_auto(uncore, fw_engine); \
> 	val = __raw_uncore_read##x(uncore, reg); \
> 	GEN6_READ_FOOTER; \
> }
>
>-#define __gen_reg_read_funcs(func) \
>-static enum forcewake_domains \
>-func##_reg_read_fw_domains(struct intel_uncore *uncore, i915_reg_t reg) { \
>-	return __##func##_reg_read_fw_domains(uncore, i915_mmio_reg_offset(reg)); \
>-} \
>-\
>-__gen_read(func, 8) \
>-__gen_read(func, 16) \
>-__gen_read(func, 32) \
>-__gen_read(func, 64)
>+static enum forcewake_domains
>+fwtable_reg_read_fw_domains(struct intel_uncore *uncore, i915_reg_t reg) {
>+	return __fwtable_reg_read_fw_domains(uncore, i915_mmio_reg_offset(reg));
>+}
>
>-__gen_reg_read_funcs(gen11_fwtable);
>-__gen_reg_read_funcs(fwtable);
>+__gen_fwtable_read(8)
>+__gen_fwtable_read(16)
>+__gen_fwtable_read(32)
>+__gen_fwtable_read(64)
>
>-#undef __gen_reg_read_funcs
>+#undef __gen_fwtable_read
> #undef GEN6_READ_FOOTER
> #undef GEN6_READ_HEADER
>
>@@ -2062,22 +2056,22 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
> 		ASSIGN_FW_DOMAINS_TABLE(uncore, __dg2_fw_ranges);
> 		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
> 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
>-		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
>+		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
> 	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> 		ASSIGN_FW_DOMAINS_TABLE(uncore, __xehp_fw_ranges);
> 		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
> 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
>-		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
>+		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
> 	} else if (GRAPHICS_VER(i915) >= 12) {
> 		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen12_fw_ranges);
> 		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
> 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
>-		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
>+		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
> 	} else if (GRAPHICS_VER(i915) == 11) {
> 		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen11_fw_ranges);
> 		ASSIGN_SHADOW_TABLE(uncore, gen11_shadowed_regs);
> 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
>-		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
>+		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);

these together with patch 1 make the fwtable variant be the only one
used for reads.... so, should we pull these assignments out of if/else
chain? gen < 6 don't have forcewake so afaics we cover all the
platforms.

this can be done as a separate patch though.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> 	} else if (IS_GRAPHICS_VER(i915, 9, 10)) {
> 		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen9_fw_ranges);
> 		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
>-- 
>2.25.4
>
