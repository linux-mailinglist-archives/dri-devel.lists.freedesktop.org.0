Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D493D6ACB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 02:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C60E7339A;
	Tue, 27 Jul 2021 00:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61231731B2;
 Tue, 27 Jul 2021 00:06:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="191932137"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="191932137"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:06:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="662339181"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:06:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/33] drm/i915/guc: Don't complain about reset races
Date: Mon, 26 Jul 2021 17:23:31 -0700
Message-Id: <20210727002348.97202-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210727002348.97202-1-matthew.brost@intel.com>
References: <20210727002348.97202-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

It is impossible to seal all race conditions of resets occurring
concurrent to other operations. At least, not without introducing
excesive mutex locking. Instead, don't complain if it occurs. In
particular, don't complain if trying to send a H2G during a reset.
Whatever the H2G was about should get redone once the reset is over.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 5 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c     | 4 ++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.h     | 2 ++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 18917b443f05..22b4733b55e2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -760,7 +760,10 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 	int ret;
 
 	if (unlikely(!ct->enabled)) {
-		WARN(1, "Unexpected send: action=%#x\n", *action);
+		struct intel_guc *guc = ct_to_guc(ct);
+		struct intel_uc *uc = container_of(guc, struct intel_uc, guc);
+
+		WARN(!uc->reset_in_progress, "Unexpected send: action=%#x\n", *action);
 		return -ENODEV;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index e07c989968f9..77c1fe2ed883 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -550,6 +550,8 @@ void intel_uc_reset_prepare(struct intel_uc *uc)
 {
 	struct intel_guc *guc = &uc->guc;
 
+	uc->reset_in_progress = true;
+
 	/* Nothing to do if GuC isn't supported */
 	if (!intel_uc_supports_guc(uc))
 		return;
@@ -578,6 +580,8 @@ void intel_uc_reset_finish(struct intel_uc *uc)
 {
 	struct intel_guc *guc = &uc->guc;
 
+	uc->reset_in_progress = false;
+
 	/* Firmware expected to be running when this function is called */
 	if (intel_guc_is_fw_running(guc) && intel_uc_uses_guc_submission(uc))
 		intel_guc_submission_reset_finish(guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
index eaa3202192ac..91315e3f1c58 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
@@ -30,6 +30,8 @@ struct intel_uc {
 
 	/* Snapshot of GuC log from last failed load */
 	struct drm_i915_gem_object *load_err_log;
+
+	bool reset_in_progress;
 };
 
 void intel_uc_init_early(struct intel_uc *uc);
-- 
2.28.0

