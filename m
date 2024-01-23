Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E921838BE7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FEE10F0B0;
	Tue, 23 Jan 2024 10:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0573A10F04A;
 Tue, 23 Jan 2024 10:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005732; x=1737541732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D9x17OGsgUMXNQtN+IT68prTo/7m5b9vdCMqdwFigXU=;
 b=OM5KMXYVSCtOvhI1tWvRiQ0TUxeRQlEgGHq6UIkDSxrLH04qyjkNz9WI
 pMDJ9nNiT+rb2twYdIcz+wWHS0MVAnEiwx03OWFlwphJkq2lIusBzqluz
 pe9Rvebv9doyedDgg3spCXiKQRtPbdGeLA/gHs+Z4j4oL85oaicX356/O
 j/04qjKJDiJpnOlaVKWfDT2psswg/mP2w7DKkzq+hjugupKcEXXmcv8xi
 DUPfxa0IL5o7prfVhQwQ7EeCSZ2WT6mQbCLxwNItEx2hBolRmg14PvvxH
 HmlJUwCy2w1ffR0MJpjUp9fivFoza8oudn7mJTv29j86THJ1GL3DpjGqQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134184"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134184"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283406"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283406"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:49 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/19] drm/i915/dp: Add way to get active pipes with syncing
 commits
Date: Tue, 23 Jan 2024 12:28:41 +0200
Message-Id: <20240123102850.390126-11-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123102850.390126-1-imre.deak@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a way to get the active pipes through a given DP port by syncing
against a related pending non-blocking commit. Atm
intel_dp_get_active_pipes() will only try to sync a given pipe and if
that would block ignore the pipe. A follow-up change enabling the DP
tunnel BW allocation mode will need to ensure that all active pipes are
returned.

A follow-up patchset will add a no-sync mode as well, needed by the
current intel_tc_port_link_reset() user of it, which atm incorrectly
ignores active pipes for which the syncing would block (but otherwise
doesn't require an actual syncing).

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 25 +++++++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp.h |  6 ++++++
 drivers/gpu/drm/i915/display/intel_tc.c |  4 +++-
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9cd675c6d0ee8..323475569ee7f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5019,6 +5019,7 @@ static bool intel_dp_has_connector(struct intel_dp *intel_dp,
 
 int intel_dp_get_active_pipes(struct intel_dp *intel_dp,
 			      struct drm_modeset_acquire_ctx *ctx,
+			      enum intel_dp_get_pipes_mode mode,
 			      u8 *pipe_mask)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
@@ -5053,9 +5054,23 @@ int intel_dp_get_active_pipes(struct intel_dp *intel_dp,
 		if (!crtc_state->hw.active)
 			continue;
 
-		if (conn_state->commit &&
-		    !try_wait_for_completion(&conn_state->commit->hw_done))
-			continue;
+		if (conn_state->commit) {
+			bool synced;
+
+			switch (mode) {
+			case INTEL_DP_GET_PIPES_TRY_SYNC:
+				if (!try_wait_for_completion(&conn_state->commit->hw_done))
+					continue;
+				break;
+			case INTEL_DP_GET_PIPES_SYNC:
+				synced = wait_for_completion_timeout(&conn_state->commit->hw_done,
+								     msecs_to_jiffies(5000));
+				drm_WARN_ON(&i915->drm, !synced);
+				break;
+			default:
+				MISSING_CASE(mode);
+			}
+		}
 
 		*pipe_mask |= BIT(crtc->pipe);
 	}
@@ -5092,7 +5107,9 @@ int intel_dp_retrain_link(struct intel_encoder *encoder,
 	if (!intel_dp_needs_link_retrain(intel_dp))
 		return 0;
 
-	ret = intel_dp_get_active_pipes(intel_dp, ctx, &pipe_mask);
+	ret = intel_dp_get_active_pipes(intel_dp, ctx,
+					INTEL_DP_GET_PIPES_TRY_SYNC,
+					&pipe_mask);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 8b0dfbf06afff..1a7b87787dfa9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -25,6 +25,11 @@ struct intel_encoder;
 
 struct work_struct;
 
+enum intel_dp_get_pipes_mode {
+	INTEL_DP_GET_PIPES_TRY_SYNC,
+	INTEL_DP_GET_PIPES_SYNC,
+};
+
 struct link_config_limits {
 	int min_rate, max_rate;
 	int min_lane_count, max_lane_count;
@@ -59,6 +64,7 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
 					    int link_rate, u8 lane_count);
 int intel_dp_get_active_pipes(struct intel_dp *intel_dp,
 			      struct drm_modeset_acquire_ctx *ctx,
+			      enum intel_dp_get_pipes_mode mode,
 			      u8 *pipe_mask);
 int intel_dp_retrain_link(struct intel_encoder *encoder,
 			  struct drm_modeset_acquire_ctx *ctx);
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index f34743e6eeed2..561d6f97ff189 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -1655,7 +1655,9 @@ static int reset_link_commit(struct intel_tc_port *tc,
 	if (ret)
 		return ret;
 
-	ret = intel_dp_get_active_pipes(intel_dp, ctx, &pipe_mask);
+	ret = intel_dp_get_active_pipes(intel_dp, ctx,
+					INTEL_DP_GET_PIPES_TRY_SYNC,
+					&pipe_mask);
 	if (ret)
 		return ret;
 
-- 
2.39.2

