Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EBE4C99F2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAD610E930;
	Wed,  2 Mar 2022 00:34:05 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C06B10E1D5;
 Wed,  2 Mar 2022 00:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646181238; x=1677717238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j0Ivf9NEDIPFNCNJ6EoBQrWoWTTEdmV0xfkB+Ek7DkQ=;
 b=FANa8KzjYSQ212GLT9wq23SIHZ+enE+ExkuHJKofFeXlGx2NZ5WN4BGF
 q6LbAkSMfHPcs3mzMEMW6vee6EHQbHCAOJtKHQiXORdVBRiNe4tYLD6ux
 ravu9+Bg3G5OANhwRcPCdhL7gwUT3DQFr25u5OxWfSWvRv/j+vAkrvDru
 WAKdXnO5deSvDME1s4agIMx4sz1QPGazUGrq9SqaGYyyjfp01+k9bbk5j
 jKZHfOmjnAZ4ez4Zzyvb7dc3W0Crpf7pZLyfG3URaahCceAf/aDIbMl/D
 o040dfS5i0La8UucwDete8UHn0nBXp3zmG7A6TblJb+dZusTgaz50ZUJI g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233243138"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="233243138"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 16:33:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="639577371"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga002.fm.intel.com with ESMTP; 01 Mar 2022 16:33:57 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 2/8] drm/i915/guc: Add an explicit 'submission_initialized'
 flag
Date: Tue,  1 Mar 2022 16:33:51 -0800
Message-Id: <20220302003357.4188363-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302003357.4188363-1-John.C.Harrison@Intel.com>
References: <20220302003357.4188363-1-John.C.Harrison@Intel.com>
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
index bf7079480d47..e439e6c1ac8b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -138,6 +138,8 @@ struct intel_guc {
 	bool submission_supported;
 	/** @submission_selected: tracks whether the user enabled GuC submission */
 	bool submission_selected;
+	/** @submission_initialized: tracks whether GuC submission has been initialised */
+	bool submission_initialized;
 	/**
 	 * @rc_supported: tracks whether we support GuC rc on the current platform
 	 */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 2f5f2099a9fc..f2251ce8776e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -508,7 +508,7 @@ static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
 
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
@@ -1832,19 +1832,21 @@ int intel_guc_submission_init(struct intel_guc *guc)
 
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

