Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA561403B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 22:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BCB10E189;
	Mon, 31 Oct 2022 21:58:27 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A271B10E189;
 Mon, 31 Oct 2022 21:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667253504; x=1698789504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CTT7a5QOI5/leb6s+cKcHP3z+adgXTbFv2Q/f663Fh0=;
 b=jNb0MCQ2gJBuFSStH+KECRoVFBH0V68NB6mPYua9lYA6/M6uEg5nIz+l
 4J1/FXecIpuU9lGgEYqmjn0GGIMKnaP8bEpi8ZW954SOxbss8+SN0Wavq
 128P5FqDyva0ePHs1VjCufEQhoFvPaxMDJRpOrRkd1WcHrU7TFxYN+1L6
 E1vCd3a7osWyhy2fxepZt5PoYQwoItMkPGo89i/YAPu+9o1SyTrgIuSBk
 VyyMP9TPQ7Ui4il3MhRT6V728Ozxnr6Pyy0lpauVwaA1FZ2aMICbBUsBC
 aEgFIFv2I/PYR6mwTKHI4vLZHMpX84A62cqJXeH7Jg07nPOwfVwdClvFa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="307733690"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="307733690"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 14:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="636198762"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="636198762"
Received: from relo-linux-5.jf.intel.com ([10.165.21.195])
 by fmsmga007.fm.intel.com with ESMTP; 31 Oct 2022 14:58:23 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Remove excessive line feeds in state dumps
Date: Mon, 31 Oct 2022 15:00:07 -0700
Message-Id: <20221031220007.4176835-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
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

Some of the GuC state dump messages were adding extra line feeds. When
printing via a DRM printer to dmesg, for example, that messes up the
log formatting as it loses any prefixing from the printer. Given that
the extra line feeds are just in the middle of random bits of GuC
state, there isn't any real need for them. So just remove them
completely.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c            | 4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 27b09ba1d295f..1bcd61bb50f89 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -871,14 +871,14 @@ void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p)
 		u32 status = intel_uncore_read(uncore, GUC_STATUS);
 		u32 i;
 
-		drm_printf(p, "\nGuC status 0x%08x:\n", status);
+		drm_printf(p, "GuC status 0x%08x:\n", status);
 		drm_printf(p, "\tBootrom status = 0x%x\n",
 			   (status & GS_BOOTROM_MASK) >> GS_BOOTROM_SHIFT);
 		drm_printf(p, "\tuKernel status = 0x%x\n",
 			   (status & GS_UKERNEL_MASK) >> GS_UKERNEL_SHIFT);
 		drm_printf(p, "\tMIA Core status = 0x%x\n",
 			   (status & GS_MIA_MASK) >> GS_MIA_SHIFT);
-		drm_puts(p, "\nScratch registers:\n");
+		drm_puts(p, "Scratch registers:\n");
 		for (i = 0; i < 16; i++) {
 			drm_printf(p, "\t%2d: \t0x%x\n",
 				   i, intel_uncore_read(uncore, SOFT_SCRATCH(i)));
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 4ccb29f9ac55c..4dbdac8002e32 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4901,7 +4901,7 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
 
 	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
 		   atomic_read(&guc->outstanding_submission_g2h));
-	drm_printf(p, "GuC tasklet count: %u\n\n",
+	drm_printf(p, "GuC tasklet count: %u\n",
 		   atomic_read(&sched_engine->tasklet.count));
 
 	spin_lock_irqsave(&sched_engine->lock, flags);
@@ -4949,7 +4949,7 @@ static inline void guc_log_context(struct drm_printer *p,
 		   atomic_read(&ce->pin_count));
 	drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
 		   atomic_read(&ce->guc_id.ref));
-	drm_printf(p, "\t\tSchedule State: 0x%x\n\n",
+	drm_printf(p, "\t\tSchedule State: 0x%x\n",
 		   ce->guc_state.sched_state);
 }
 
@@ -4978,7 +4978,7 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 					   READ_ONCE(*ce->parallel.guc.wq_head));
 				drm_printf(p, "\t\tWQI Tail: %u\n",
 					   READ_ONCE(*ce->parallel.guc.wq_tail));
-				drm_printf(p, "\t\tWQI Status: %u\n\n",
+				drm_printf(p, "\t\tWQI Status: %u\n",
 					   READ_ONCE(*ce->parallel.guc.wq_status));
 			}
 
@@ -4986,7 +4986,7 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 			    emit_bb_start_parent_no_preempt_mid_batch) {
 				u8 i;
 
-				drm_printf(p, "\t\tChildren Go: %u\n\n",
+				drm_printf(p, "\t\tChildren Go: %u\n",
 					   get_children_go_value(ce));
 				for (i = 0; i < ce->parallel.number_children; ++i)
 					drm_printf(p, "\t\tChildren Join: %u\n",
-- 
2.37.3

