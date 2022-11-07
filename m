Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B8E61EBA9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 08:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9A610E20E;
	Mon,  7 Nov 2022 07:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB0010E1F3;
 Mon,  7 Nov 2022 07:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667805614; x=1699341614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PqBHuxjSOL6kOrgZgQpfkV1/LMDYXXkwLwD+ugeOX/k=;
 b=O8uRXL2igtwyekTArAEebEgQBX1e885OJMyvlzHaIn9fsI+b5Hp32N8v
 roMpfxqAoGZNAtgmhnTb3Rhe8XiPHx/N0hjNpJmtDHPFphFghwDF53hXt
 gh/x4MKCX6oDtj8IY2iy3c90Op3wrb+yMVS/ZOzhAa3C+d1RfSsfuhKxJ
 FyHGExHMyF1ZkjtVUCiR5Zzuui9lVj2TY3x/BJsZabfqK2Wy0T98UxNrp
 FT1VsKqugReGSd7C6LN7FoxucAs97y2mi28i4amFTPLi7xfN/Aw75C7aC
 V5I47R+CbYT9ixcVSrJdVFMBSJzDm1XjP1wDLhUyQ3Mhk3OMLgRGXfIwD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372463329"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372463329"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704767235"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="704767235"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:11 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 02/15] drm/i915/dp: Use the drm helpers for getting max FRL rate
Date: Mon,  7 Nov 2022 12:50:32 +0530
Message-Id: <20221107072045.628895-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
References: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, mika.kahola@intel.com,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Re-use the drm helpers for getting max FRL rate for an HDMI sink.
This patch removes the duplicate code and calls the already defined
drm helpers for the task.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7400d6b4c587..ef2383ca8d7d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2398,20 +2398,11 @@ static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
 {
 	struct intel_connector *intel_connector = intel_dp->attached_connector;
 	struct drm_connector *connector = &intel_connector->base;
-	int max_frl_rate;
-	int max_lanes, rate_per_lane;
-	int max_dsc_lanes, dsc_rate_per_lane;
+	int max_frl_rate = drm_hdmi_sink_max_frl_rate(connector);
+	int dsc_max_frl_rate = drm_hdmi_sink_dsc_max_frl_rate(connector);
 
-	max_lanes = connector->display_info.hdmi.max_lanes;
-	rate_per_lane = connector->display_info.hdmi.max_frl_rate_per_lane;
-	max_frl_rate = max_lanes * rate_per_lane;
-
-	if (connector->display_info.hdmi.dsc_cap.v_1p2) {
-		max_dsc_lanes = connector->display_info.hdmi.dsc_cap.max_lanes;
-		dsc_rate_per_lane = connector->display_info.hdmi.dsc_cap.max_frl_rate_per_lane;
-		if (max_dsc_lanes && dsc_rate_per_lane)
-			max_frl_rate = min(max_frl_rate, max_dsc_lanes * dsc_rate_per_lane);
-	}
+	if (dsc_max_frl_rate)
+		return min(max_frl_rate, dsc_max_frl_rate);
 
 	return max_frl_rate;
 }
-- 
2.25.1

