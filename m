Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5029F751F0B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 12:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E69810E697;
	Thu, 13 Jul 2023 10:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA7010E679;
 Thu, 13 Jul 2023 10:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689244681; x=1720780681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wttXTVZ5s3SuZbsKGAYTRw0dipll03nAt1UlylnnYY8=;
 b=FMjWsuOHYsk8IN/uMR+1WUl71vuA/NX1kREAVmxsQQPeJ+b4AoCA5HHa
 s/wJQtFqk8BovfoMAwyIMivmzLMoGsCyi6ktL/jvxrMsDYVZmkDOcCTT3
 ulZx5c3WNZFaPh2jRhwWOv+EcihmCYpbJIEHn4iTwDemu+QVR9E0OpOVr
 2imMCh9M6/v22poueTdA3YdjkijZeu6Gu8miPrLBb0AzTuM3JNpjHmqk1
 7sqzReJPhJW74dAwrsMUSSbR6/vzZQmhf88kNiSysxMwUdVYVQhEjTJF0
 XuvKkeLkEdD5z33hAPpOeDM81DM8kFq1bFDVKkmMyXLI06MLBWiNYU9dG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="428897626"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="428897626"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 03:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895965399"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="895965399"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 03:37:58 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/19] drm/i915/dp: Avoid forcing DSC BPC for MST case
Date: Thu, 13 Jul 2023 16:03:37 +0530
Message-Id: <20230713103346.1163315-11-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For MST the bpc is hardcoded to 8, and pipe bpp to 24.
So avoid forcing DSC bpc for MST case.

v2: Warn and ignore the debug flag than to bail out. (Jani)

v3: Fix dbg message to mention forced bpc instead of bpp.

v4: Fix checkpatch longline warning.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 12 ++++++------
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  5 +++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 23ede846202c..11e54e6ee985 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1695,14 +1695,14 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format))
 		return -EINVAL;
 
-	if (compute_pipe_bpp)
+	if (intel_dp->force_dsc_bpc && compute_pipe_bpp) {
+		pipe_bpp = intel_dp->force_dsc_bpc * 3;
+		drm_dbg_kms(&dev_priv->drm, "Input DSC BPC forced to %d\n",
+			    intel_dp->force_dsc_bpc);
+	} else if (compute_pipe_bpp) {
 		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
-	else
+	} else {
 		pipe_bpp = pipe_config->pipe_bpp;
-
-	if (intel_dp->force_dsc_bpc) {
-		pipe_bpp = intel_dp->force_dsc_bpc * 3;
-		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d", pipe_bpp);
 	}
 
 	/* Min Input BPC for ICL+ is 8 */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 1f00713fb1ad..dff4717edbd0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -361,6 +361,11 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 	/* enable compression if the mode doesn't fit available BW */
 	drm_dbg_kms(&dev_priv->drm, "Force DSC en = %d\n", intel_dp->force_dsc_en);
 	if (ret || intel_dp->force_dsc_en) {
+		/*
+		 * FIXME: As bpc is hardcoded to 8, as mentioned above,
+		 * WARN and ignore the debug flag force_dsc_bpc for now.
+		 */
+		drm_WARN(&dev_priv->drm, intel_dp->force_dsc_bpc, "Cannot Force BPC for MST\n");
 		/*
 		 * Try to get at least some timeslots and then see, if
 		 * we can fit there with DSC.
-- 
2.40.1

