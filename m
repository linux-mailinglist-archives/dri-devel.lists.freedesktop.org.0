Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C4A4C3A0F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 01:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829A010E5A8;
	Fri, 25 Feb 2022 00:06:27 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96A210E13C;
 Fri, 25 Feb 2022 00:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645747584; x=1677283584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hd+sS3aY9x9hQ4QeY0Bv7Q+/oVks4CRBFxdoVKpYlpM=;
 b=UhFhadF2Mn/3JRMmUN2ZTpwD4HKb2pnilB8rbYNRfrr4Nma97t2p0hnQ
 YGMJLGIpFo8jis3K3RwAmyOfObknChPpGlF4H0+/g5SdQmCVbKeEy2sBU
 P0zeuEjJJP/t5dQrmPa+oz9Tmm5QopQ/P2dbCUwIZE/ibWpPDPntOJdTN
 VZwNfk4KrVlHfjwwfeXJ1IhbNiKu9JOL6ZB4QZfSARM3RKNIw2NQY4zVg
 FKDux2QOYWYxVAJfl6PWnrSid/xhFH0aF64L80fvvK9/vO7IO71UYrY5T
 NpF/LYdxQbs87q715qlVVrmy7eoHzAJkO84N9McXQKRJF3dqCpGcaVCZw g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277012937"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="277012937"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 16:06:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="592278962"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2022 16:06:24 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 2/8] drm/i915/guc: Add an explicit 'submission_initialized'
 flag
Date: Thu, 24 Feb 2022 16:06:17 -0800
Message-Id: <20220225000623.1934438-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225000623.1934438-1-John.C.Harrison@Intel.com>
References: <20220225000623.1934438-1-John.C.Harrison@Intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The LRC descriptor pool is going away. So, stop using it as a check
for whether submission has been initialised or not.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h            | 2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 9d779de16613..568eb6352ef0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -137,6 +137,8 @@ struct intel_guc {
 	bool submission_supported;
 	/** @submission_selected: tracks whether the user enabled GuC submission */
 	bool submission_selected;
+	/** @submission_initialized: tracks whether GuC submission has been initialised */
+	bool submission_initialized;
 	/**
 	 * @rc_supported: tracks whether we support GuC rc on the current platform
 	 */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 7fb889e14995..11bf56b5a266 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -511,7 +511,7 @@ static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
 
 static inline bool guc_submission_initialized(struct intel_guc *guc)
 {
-	return !!guc->lrc_desc_pool_vaddr;
+	return guc->submission_initialized;
 }
 
 static inline void _reset_lrc_desc(struct intel_guc *guc, u32 id)
@@ -1813,7 +1813,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	struct intel_gt *gt = guc_to_gt(guc);
 	int ret;
 
-	if (guc->lrc_desc_pool)
+	if (guc->submission_initialized)
 		return 0;
 
 	ret = guc_lrc_desc_pool_create(guc);
@@ -1845,19 +1845,21 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
 	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
 	guc->timestamp.shift = gpm_timestamp_shift(gt);
+	guc->submission_initialized = true;
 
 	return 0;
 }
 
 void intel_guc_submission_fini(struct intel_guc *guc)
 {
-	if (!guc->lrc_desc_pool)
+	if (!guc->submission_initialized)
 		return;
 
 	guc_flush_destroyed_contexts(guc);
 	guc_lrc_desc_pool_destroy(guc);
 	i915_sched_engine_put(guc->sched_engine);
 	bitmap_free(guc->submission_state.guc_ids_bitmap);
+	guc->submission_initialized = false;
 }
 
 static inline void queue_request(struct i915_sched_engine *sched_engine,
-- 
2.25.1

