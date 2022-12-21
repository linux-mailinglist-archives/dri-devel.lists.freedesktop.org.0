Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B68665398D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 00:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E39910E18E;
	Wed, 21 Dec 2022 23:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3755210E04A;
 Wed, 21 Dec 2022 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671663822; x=1703199822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CZn2cVDnmCgEo3uuieqkgL/QIFH/uiZmaqIaToI+tgU=;
 b=VHUTEfZy4RO34RqRzGWnnC9l7G1V0IbvMUrEYqeXhMcGMJpkAs/OuH7M
 gkUmzLZ2eUfg4pOfrd9nHyV76QpFyI4qVWmT5ATRNMmlHPvntPaXlIZoU
 38kfsBZpiLb6hfvgISN7uHPz9u7dX6sDTrreCpaOOw7zSeJFNKkzbl30H
 11OBEoCPJrniQypusFh5acPOXvEROGYJ5c2bpFwW/FZJagVabCThJLKhc
 lZyq5S5ypjbbrNEvESf0ZsXz0F4zQ/kqi41Mz1makotKJTt6cOZ0D3Cbb
 1GUB3fmpKAag9w5cQgt+nQaeuRoAMTN+2CYvHD9GljqfYHtG3vs113AnN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321905543"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="321905543"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 15:03:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="793864438"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="793864438"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2022 15:03:41 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 5/7] drm/i915/pxp: Trigger the global teardown for before
 suspending
Date: Wed, 21 Dec 2022 15:06:26 -0800
Message-Id: <20221221230628.2715916-6-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221230628.2715916-1-alan.previn.teres.alexis@intel.com>
References: <20221221230628.2715916-1-alan.previn.teres.alexis@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
	Vivi@freedesktop.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rodrigo <rodrigo.vivi@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Juston Li <justonli@chromium.org>,
	Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A driver bug was recently discovered where the security firmware was
receiving internal HW signals indicating that session key expirations
had occurred. Architecturally, the firmware was expecting a response
from the GuC to acknowledge the event with the firmware side.
However the OS was in a suspended state and GuC had been reset.

Internal specifications actually required the driver to ensure
that all active sessions be properly cleaned up in such cases where
the system is suspended and the GuC potentially unable to respond.

This patch adds the global teardown code in i915's suspend_prepare
code path.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp.c         | 60 +++++++++++++++++---
 drivers/gpu/drm/i915/pxp/intel_pxp.h         |  1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c      |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  9 ++-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.h |  5 ++
 5 files changed, 64 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index cfc9af8b3d21..96a988efd237 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -270,6 +270,55 @@ static bool pxp_component_bound(struct intel_pxp *pxp)
 	return bound;
 }
 
+static int __pxp_global_teardown_locked(struct intel_pxp *pxp, bool terminate_for_cleanup)
+{
+	if (terminate_for_cleanup) {
+		if (!pxp->arb_is_valid)
+			return 0;
+		/*
+		 * To ensure synchronous and coherent session teardown completion
+		 * in response to suspend or shutdown triggers, don't user a worker.
+		 */
+		intel_pxp_mark_termination_in_progress(pxp);
+		intel_pxp_terminate(pxp, false);
+	} else {
+		if (pxp->arb_is_valid)
+			return 0;
+		/*
+		 * If we are not in final termination, and the arb-session is currently
+		 * inactive, we are doing a reset and restart due to some runtime event.
+		 * Use the worker that was designed for this.
+		 */
+		pxp_queue_termination(pxp);
+	}
+
+	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(250)))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+void intel_pxp_end(struct intel_pxp *pxp)
+{
+	struct drm_i915_private *i915 = pxp->ctrl_gt->i915;
+	intel_wakeref_t wakeref;
+
+	if (!intel_pxp_is_enabled(pxp))
+		return;
+
+	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
+
+	mutex_lock(&pxp->arb_mutex);
+
+	if (__pxp_global_teardown_locked(pxp, true))
+		drm_dbg(&i915->drm, "PXP end timed out\n");
+
+	mutex_unlock(&pxp->arb_mutex);
+
+	intel_pxp_fini_hw(pxp);
+	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
+}
+
 /*
  * the arb session is restarted from the irq work when we receive the
  * termination completion interrupt
@@ -286,16 +335,9 @@ int intel_pxp_start(struct intel_pxp *pxp)
 
 	mutex_lock(&pxp->arb_mutex);
 
-	if (pxp->arb_is_valid)
-		goto unlock;
-
-	pxp_queue_termination(pxp);
-
-	if (!wait_for_completion_timeout(&pxp->termination,
-					msecs_to_jiffies(250))) {
-		ret = -ETIMEDOUT;
+	ret = __pxp_global_teardown_locked(pxp, false);
+	if (ret)
 		goto unlock;
-	}
 
 	/* make sure the compiler doesn't optimize the double access */
 	barrier();
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index 9658d3005222..3ded0890cd27 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -27,6 +27,7 @@ void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
 void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
 
 int intel_pxp_start(struct intel_pxp *pxp);
+void intel_pxp_end(struct intel_pxp *pxp);
 
 int intel_pxp_key_check(struct intel_pxp *pxp,
 			struct drm_i915_gem_object *obj,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
index 892d39cc61c1..e427464aa131 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
@@ -16,7 +16,7 @@ void intel_pxp_suspend_prepare(struct intel_pxp *pxp)
 	if (!intel_pxp_is_enabled(pxp))
 		return;
 
-	pxp->arb_is_valid = false;
+	intel_pxp_end(pxp);
 
 	intel_pxp_invalidate(pxp);
 }
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index 74ed7e16e481..d8278c4002e3 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -115,11 +115,14 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
 	return ret;
 }
 
-static void pxp_terminate(struct intel_pxp *pxp)
+void intel_pxp_terminate(struct intel_pxp *pxp, bool restart_arb)
 {
 	int ret;
 
-	pxp->hw_state_invalidated = true;
+	if (restart_arb)
+		pxp->hw_state_invalidated = true;
+	else
+		pxp->hw_state_invalidated = false;
 
 	/*
 	 * if we fail to submit the termination there is no point in waiting for
@@ -167,7 +170,7 @@ static void pxp_session_work(struct work_struct *work)
 
 	if (events & PXP_TERMINATION_REQUEST) {
 		events &= ~PXP_TERMINATION_COMPLETE;
-		pxp_terminate(pxp);
+		intel_pxp_terminate(pxp, true);
 	}
 
 	if (events & PXP_TERMINATION_COMPLETE)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
index 903ac52cffa1..4f944b63b5b6 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
@@ -12,9 +12,14 @@ struct intel_pxp;
 
 #ifdef CONFIG_DRM_I915_PXP
 void intel_pxp_session_management_init(struct intel_pxp *pxp);
+void intel_pxp_terminate(struct intel_pxp *pxp, bool restart_arb);
 #else
 static inline void intel_pxp_session_management_init(struct intel_pxp *pxp)
 {
 }
+
+static inline void intel_pxp_terminate(struct intel_pxp *pxp, bool restart_arb)
+{
+}
 #endif
 #endif /* __INTEL_PXP_SESSION_H__ */
-- 
2.34.1

