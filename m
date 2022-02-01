Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D43854A57D2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 08:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D23A10E5D2;
	Tue,  1 Feb 2022 07:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1909610E5AD;
 Tue,  1 Feb 2022 07:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643700876; x=1675236876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TMKmgYidnZjfOzkcJemBcA0gQya76NlnK70kvcLMHRc=;
 b=FlChZy8+7Ax6/T15rQDIgv/sXCE6ayGG2abPIQqhpa4XULbB+kzkyHC2
 02elb2UekeDdF+WGVpmm/J3qKMWQTItgC4vEbWQZLq0YJrTf9t1QLoacP
 6Pk8DymtgNM+mAYZ5bvUXdnhEJGhxKpnuYrDj8prHViVCxTccHKMCqzmK
 UZDKhVKmwD5LvSQNqDVnWAcTznbBdtJ4qUnvMxtWdzt8iWj37bjfXGyUZ
 c+8KmQ7BMVMsT3dsLl5/PtT0HPiEa3qlLL7Ut8AwPvHj9hpriNaTPENri
 e1vuCTDp2Iy6l47DStEG2IJcXxEcFBKTX35NN47CvISlXgqkvGEXcQu/S A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="245227833"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="245227833"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 23:34:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="698315973"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 23:34:33 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/i915/dp: Use the drm helpers for getting max FRL
 rate
Date: Tue,  1 Feb 2022 12:50:29 +0530
Message-Id: <20220201072030.1466446-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201072030.1466446-1-ankit.k.nautiyal@intel.com>
References: <20220201072030.1466446-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Re-use the drm helpers for getting max FRL rate for an HDMI sink.
This patch removes the duplicate code and calls the already defined
drm helpers for the task.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4d4579a301f6..f7fe7de7e553 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2190,22 +2190,13 @@ static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
 {
 	struct intel_connector *intel_connector = intel_dp->attached_connector;
 	struct drm_connector *connector = &intel_connector->base;
-	int max_frl_rate;
-	int max_lanes, rate_per_lane;
-	int max_dsc_lanes, dsc_rate_per_lane;
+	int max_frl = drm_hdmi_sink_max_frl(connector);
+	int dsc_max_frl = drm_hdmi_sink_dsc_max_frl(connector);
 
-	max_lanes = connector->display_info.hdmi.max_lanes;
-	rate_per_lane = connector->display_info.hdmi.max_frl_rate_per_lane;
-	max_frl_rate = max_lanes * rate_per_lane;
+	if (dsc_max_frl)
+		return min(max_frl, dsc_max_frl);
 
-	if (connector->display_info.hdmi.dsc_cap.v_1p2) {
-		max_dsc_lanes = connector->display_info.hdmi.dsc_cap.max_lanes;
-		dsc_rate_per_lane = connector->display_info.hdmi.dsc_cap.max_frl_rate_per_lane;
-		if (max_dsc_lanes && dsc_rate_per_lane)
-			max_frl_rate = min(max_frl_rate, max_dsc_lanes * dsc_rate_per_lane);
-	}
-
-	return max_frl_rate;
+	return max_frl;
 }
 
 static bool
-- 
2.25.1

