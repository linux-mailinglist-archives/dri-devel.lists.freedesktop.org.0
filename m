Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A523B3C2C77
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 03:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC226EAC2;
	Sat, 10 Jul 2021 01:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F28A6EAB5;
 Sat, 10 Jul 2021 01:23:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="207979481"
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="207979481"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 18:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="411439964"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga006.jf.intel.com with ESMTP; 09 Jul 2021 18:23:53 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/16] drm/i915/guc/slpc: Cache platform frequency limits for
 slpc
Date: Fri,  9 Jul 2021 18:20:22 -0700
Message-Id: <20210710012026.19705-13-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cache rp0, rp1 and rpn platform limits into slpc structure
for range checking while setting min/max frequencies.

Also add "soft" limits which keep track of frequency changes
made from userland. These are initially set to platform min
and max.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 41 +++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index d32274cd1db7..6e978f27b7a6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -86,6 +86,9 @@ static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
 		return err;
 	}
 
+	slpc->max_freq_softlimit = 0;
+	slpc->min_freq_softlimit = 0;
+
 	return err;
 }
 
@@ -384,6 +387,29 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
 			   GEN6_PMINTRMSK, pm_intrmsk_mbz, 0);
 }
 
+static int intel_guc_slpc_set_softlimits(struct intel_guc_slpc *slpc)
+{
+	int ret = 0;
+
+	/* Softlimits are initially equivalent to platform limits
+	 * unless they have deviated from defaults, in which case,
+	 * we retain the values and set min/max accordingly.
+	 */
+	if (!slpc->max_freq_softlimit)
+		slpc->max_freq_softlimit = slpc->rp0_freq;
+	else if (slpc->max_freq_softlimit != slpc->rp0_freq)
+		ret = intel_guc_slpc_set_max_freq(slpc,
+					slpc->max_freq_softlimit);
+
+	if (!slpc->min_freq_softlimit)
+		slpc->min_freq_softlimit = slpc->min_freq;
+	else if (slpc->min_freq_softlimit != slpc->min_freq)
+		ret = intel_guc_slpc_set_min_freq(slpc,
+					slpc->min_freq_softlimit);
+
+	return ret;
+}
+
 /*
  * intel_guc_slpc_enable() - Start SLPC
  * @slpc: pointer to intel_guc_slpc.
@@ -402,6 +428,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	struct slpc_shared_data *data;
 	int ret;
+	u32 rp_state_cap;
 
 	GEM_BUG_ON(!slpc->vma);
 
@@ -445,6 +472,20 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 			DIV_ROUND_CLOSEST(data->task_state_data.max_unslice_freq *
 				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER));
 
+	rp_state_cap = intel_uncore_read(i915->gt.uncore, GEN6_RP_STATE_CAP);
+
+	slpc->rp0_freq = ((rp_state_cap >> 0) & 0xff) * GT_FREQUENCY_MULTIPLIER;
+	slpc->min_freq = ((rp_state_cap >> 16) & 0xff) * GT_FREQUENCY_MULTIPLIER;
+	slpc->rp1_freq = ((rp_state_cap >> 8) & 0xff) * GT_FREQUENCY_MULTIPLIER;
+
+	if (intel_guc_slpc_set_softlimits(slpc))
+		drm_err(&i915->drm, "Unable to set softlimits");
+
+	drm_info(&i915->drm,
+		 "Platform fused frequency values -  min: %u Mhz, max: %u Mhz",
+		 slpc->min_freq,
+		 slpc->rp0_freq);
+
 	return 0;
 }
 
-- 
2.25.0

