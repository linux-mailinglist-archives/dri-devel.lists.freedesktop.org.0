Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E4333E853
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 05:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6902F6E4C9;
	Wed, 17 Mar 2021 04:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C216E4C9;
 Wed, 17 Mar 2021 04:13:50 +0000 (UTC)
IronPort-SDR: M4cTSEfzZusDJGPC8YSlmuMjrQPgHg/7fGRkKwwLH5rsRPBUpSQfYcommXCOCIi4SCUg2dorgS
 S3+wdJW4EF+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="188746440"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="188746440"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 21:13:49 -0700
IronPort-SDR: nlQL0RdzOSERrOoBCLE1E14gmCnaKUHvj7Z/M53qI9Obsi8h/G2EAeDH/WA5lwstdN6GBqqmHO
 2DOWICF9O8iw==
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="511595975"
Received: from mlarue-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.239.229])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 21:13:49 -0700
Date: Tue, 16 Mar 2021 21:13:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add Wa_14011060649
Message-ID: <20210317041347.fdogwipcpk2pjj4n@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210316235746.19900-1-swathi.dhanavanthri@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316235746.19900-1-swathi.dhanavanthri@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Daniel

On Tue, Mar 16, 2021 at 04:57:46PM -0700, Swathi Dhanavanthri wrote:
>This is a permanent workaround for TGL,RKL,DG1 and ADLS.
>
>Signed-off-by: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_workarounds.c | 27 +++++++++++++++++++++
> drivers/gpu/drm/i915/i915_reg.h             |  3 +++
> 2 files changed, 30 insertions(+)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>index 3b4a7da60f0b..01f34a6bdf3e 100644
>--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>@@ -1117,11 +1117,38 @@ icl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
> 			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
> }
>
>+/*
>+ * Though there are per-engine instances of these registers,
>+ * they retain their value through engine resets and should
>+ * only be provided on the GT workaround list rather than
>+ * the engine-specific workaround list.
>+ *

extra blank line here. Otherwise:

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Daniel, where/how should we land this and next pending WAs? I have 3 more
already reviewed that I need to re-submit to dri-devel.
Should we get an ack and merge intel-gt-next? Or maybe create a
topic branch to be merged somewhere later?

thanks
Lucas De Marchi

>+ */
>+static void
>+wa_14011060649(struct drm_i915_private *i915, struct i915_wa_list *wal)
>+{
>+	struct intel_engine_cs *engine;
>+	struct intel_gt *gt = &i915->gt;
>+	int id;
>+
>+	for_each_engine(engine, gt, id) {
>+		if ((engine->class != VIDEO_DECODE_CLASS) ||
>+		    (engine->instance % 2))
>+			continue;
>+
>+		wa_write_or(wal, VDBOX_CGCTL3F10(engine->mmio_base),
>+			    IECPUNIT_CLKGATE_DIS);
>+	}
>+}
>+
> static void
> gen12_gt_workarounds_init(struct drm_i915_private *i915,
> 			  struct i915_wa_list *wal)
> {
> 	wa_init_mcr(i915, wal);
>+
>+	/* Wa_14011060649:tgl,rkl,dg1,adls */
>+	wa_14011060649(i915, wal);
> }
>
> static void
>diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>index e5dd0203991b..cc60556306e2 100644
>--- a/drivers/gpu/drm/i915/i915_reg.h
>+++ b/drivers/gpu/drm/i915/i915_reg.h
>@@ -2715,6 +2715,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
> #define RING_INDIRECT_CTX_OFFSET(base)	_MMIO((base) + 0x1c8) /* gen8+ */
> #define RING_CTX_TIMESTAMP(base)	_MMIO((base) + 0x3a8) /* gen8+ */
>
>+#define VDBOX_CGCTL3F10(base)		_MMIO((base) + 0x3f10)
>+#define   IECPUNIT_CLKGATE_DIS		REG_BIT(22)
>+
> #define ERROR_GEN6	_MMIO(0x40a0)
> #define GEN7_ERR_INT	_MMIO(0x44040)
> #define   ERR_INT_POISON		(1 << 31)
>-- 
>2.20.1
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
