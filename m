Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CAF9B3E64
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 00:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813EE10E240;
	Mon, 28 Oct 2024 23:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccgt84oV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF2610E240;
 Mon, 28 Oct 2024 23:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730157995; x=1761693995;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kaCFeEXIskP9cvkK2CCjL4RXRuBE5hYbX83iXHBAnMw=;
 b=ccgt84oVU8o6cLqVSR3ozcV/KD+uNeRyvOUEqDMyyDYcxUbsgS7YDram
 sf9/QbaYQKSNoixrZ5aqFN1cJ/IoICMc1dimQfkd+Z5bl8xFb6Ctba2hu
 hNs0uGzAxklV1+UtHU7SiI1xlkpKcf9ofp2kzL8TRWreZ9wB/ygvbxa7x
 PBxw8LcMVbC0EHyhCO1Jhd27JAeOcgtJuykuOpX11cgg73A285ggpJvnq
 d4MgMB9VbmOnXO8sX2Kx0X8YjH2mpEuAxUI6MlPAhChjdMbWeDbvP/ENV
 To/uHH/cjPHDTbEuOTnU/G3cr3b0SvVivM5MOFAV1ggL8ZI5kj+tFmIGV g==;
X-CSE-ConnectionGUID: WK5O+YIiQImkUPSdvhNXLA==
X-CSE-MsgGUID: Ovpd1fqgSK6sRJjO1fKpRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29918459"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29918459"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 16:26:35 -0700
X-CSE-ConnectionGUID: iTevsw8jQVOvPAbFbvvueQ==
X-CSE-MsgGUID: UfmgdthaQ8OB0t0zmJlYQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="81391579"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 28 Oct 2024 16:26:35 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1] FOR-CI: drm/i915/guc: Disable ct receive tasklet during
 reset preparation
Date: Mon, 28 Oct 2024 16:26:32 -0700
Message-Id: <20241028232632.1951286-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

During GuC reset prepare, interrupt is disabled, if the interrupt
event already happens and is in progress, from interrupt event to
tasklet get running, there is alway some kind of latency. In long
latency case, it might have 2 rare race conditions:
1. Tasklet runs after IRQ flush, add request to queue after worker
flush started, causes unexpected G2H message request processing,
while reset prepare code already get context destroyed. Request
handler will report error about bad context state.
2. Tasklet runs after intel_guc_submission_reset_prepare,
ct_try_receive_message start to run, while intel_uc_reset_prepare
already finished guc sanitize and set ct->enable to false. This will
causes warning on incorrect ct->enable state.

Fixed by disable ct receive tasklet during reset preparation to avoid
the above race condition.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9ede6f240d79..f82fec33c432 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1684,15 +1684,20 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 	guc->interrupts.disable(guc);
 	__reset_guc_busyness_stats(guc);
 
-	/* Flush IRQ handler */
-	spin_lock_irq(guc_to_gt(guc)->irq_lock);
-	spin_unlock_irq(guc_to_gt(guc)->irq_lock);
+	/*
+	 * Disable tasklet until end of prepare, if tasklet is active,
+	 * tasklet_disable will wait until it finished
+	 */
+	tasklet_disable(&guc->ct.receive_tasklet);
 
 	guc_flush_submissions(guc);
 	guc_flush_destroyed_contexts(guc);
 	flush_work(&guc->ct.requests.worker);
 
 	scrub_guc_desc_for_outstanding_g2h(guc);
+
+	/* Enable tasklet at the end, before HW reset */
+	tasklet_enable(&guc->ct.receive_tasklet);
 }
 
 static struct intel_engine_cs *
-- 
2.34.1

