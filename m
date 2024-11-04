Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF4A9BC039
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 22:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C62E10E4F5;
	Mon,  4 Nov 2024 21:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zu7ixEtr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FE910E4ED;
 Mon,  4 Nov 2024 21:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730756465; x=1762292465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HsacipRl6oK5Bx9BeK3qF5d/NqJRxft6tYde6WPFSEg=;
 b=Zu7ixEtrJFbahDmihGOTcP5M5OqJrnft5z4Q5nHfsfN9nh7+ycBFY0bk
 +QgSZ1ztsMIflBE+YmRBntoOaos3PWFABkIL3VMTgQPG5wKsUm9SABZph
 GyocruXtmHXQ+XXoEPkw3McB7bkmHM7pq+3SWP3T3WXi/8MhNu5FlhyRe
 5+cNXLkPJbZmNumHLl0hukEWyDn29k+xLf8NnErsOY4Nr7X/MvglfFsqe
 suLjJ/1bgYLrhSwQQQCJQmsxPdknnY1mjqbI+dzujU58bFtcBbkhv6CyA
 J10EGODuQOYL6tNhM+G4JktrRXTKwHWd+WR5YvpttzgLWJSO0vm4G3Sur g==;
X-CSE-ConnectionGUID: vZZR2fdVQ2ygocLNU1JbfA==
X-CSE-MsgGUID: vrD3BfAIQLaZ64HZ7XMpbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33314202"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="33314202"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 13:41:05 -0800
X-CSE-ConnectionGUID: 12EurFWkRpKtiVIgYoOe8g==
X-CSE-MsgGUID: kgMkARL6Q9GOkl9pYfiXvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="121261470"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa001.jf.intel.com with ESMTP; 04 Nov 2024 13:41:04 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH v2] drm/i915/guc: Flush ct receive tasklet during reset
 preparation
Date: Mon,  4 Nov 2024 13:41:03 -0800
Message-Id: <20241104214103.214702-1-zhanjun.dong@intel.com>
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

GuC to host communication is interrupt driven, the handling has 3
parts: interrupt context, tasklet and request queue worker.
During GuC reset prepare, interrupt is disabled before destroy
contexts steps start. The IRQ and worker are flushed to finish
any outstanding in-progress message handling. But, the tasklet
flush is missing, it might causes 2 race conditions:
1. Tasklet runs after IRQ flushed, add request to queue after worker
flush started, causes unexpected G2H message request processing,
meanwhile, reset prepare code already get the context destroyed.
This will causes error reported about bad context state.
(https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349 and
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12303)
2. Tasklet runs after intel_guc_submission_reset_prepare,
ct_try_receive_message start to run, while intel_uc_reset_prepare
already finished guc sanitize and set ct->enable to false. This will
causes warning on incorrect ct->enable state.
(https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12439)

Add the missing tasklet flush to flush all 3 parts.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9ede6f240d79..353a9167c9a4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1688,6 +1688,10 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 	spin_lock_irq(guc_to_gt(guc)->irq_lock);
 	spin_unlock_irq(guc_to_gt(guc)->irq_lock);
 
+	/* Flush tasklet */
+	tasklet_disable(&guc->ct.receive_tasklet);
+	tasklet_enable(&guc->ct.receive_tasklet);
+
 	guc_flush_submissions(guc);
 	guc_flush_destroyed_contexts(guc);
 	flush_work(&guc->ct.requests.worker);
-- 
2.34.1

