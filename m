Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87145A2412
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E563710E7CC;
	Fri, 26 Aug 2022 09:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3973410E7B3;
 Fri, 26 Aug 2022 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661505578; x=1693041578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OuPCg52ceeZOOTBIwiP8J9jgAG7NiF23YnqsfYe2+Q0=;
 b=FlZc1dzjj9ixksUy/ILKYMLoFwVw7elxT69Fvs2RSy5onjmQNh/TgdL1
 tfyhqZJPVUcRchYMIQaXJKiX/LD2auKKHdmu7pvuCQCdbOldO60L/f+h+
 SVAwMJ8guPSYuEmsIDlnK/MQ8drcCuoFDKrGgjPIxhVmSaG/LYTvBSaUQ
 WV9yjQvybdR/YuMeF9gRU8N8B9ibXU8En8CpYySCqHUSeJSof/wPh4LHn
 78UZlm/81estVFR1jACHqNJwhLihRmhGZs8QdFdoTWqiHVc5sNz9EoBAX
 Rhfa1U0outkEfyRMh5sdJt0xyvrIl9Ib5m60DzC+EuYw64VyKTB+aFiIZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="274217126"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="274217126"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 02:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="752816374"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2022 02:19:36 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915: Fix intel_dp_mst_compute_link_config
Date: Fri, 26 Aug 2022 12:20:17 +0300
Message-Id: <20220826092019.23151-3-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
In-Reply-To: <20220826092019.23151-1-stanislav.lisovskiy@intel.com>
References: <20220826092019.23151-1-stanislav.lisovskiy@intel.com>
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
Cc: manasi.d.navare@intel.com, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We currently always exit that bpp loop because drm_dp_atomic_find_vcpi_slots
doesn't care if we actually can fit those or not.
I think that wasn't the initial intention here, especially when
we keep trying with lower bpps, we are supposed to keep trying
until we actually find some _working_ configuration, which isn't the
case here.
So added that drm_dp_mst_check here, so that we can make sure
that try all the bpps before we fail.

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 14d2a64193b2..c61fd8b39c27 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -59,6 +59,7 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 		&crtc_state->hw.adjusted_mode;
 	bool constant_n = drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_CONSTANT_N);
 	int bpp, slots = -EINVAL;
+	int ret = 0;
 
 	crtc_state->lane_count = limits->max_lane_count;
 	crtc_state->port_clock = limits->max_rate;
@@ -78,10 +79,21 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 									       crtc_state->lane_count));
 		if (slots == -EDEADLK)
 			return slots;
-		if (slots >= 0)
-			break;
+		if (slots >= 0) {
+			ret = drm_dp_mst_atomic_check(state);
+			/*
+			 * If we got slots >= 0 and we can fit those based on check
+			 * then we can exit the loop. Otherwise keep trying.
+			 */
+			if (!ret)
+				break;
+		}
 	}
 
+	/* Despite slots are non-zero, we still failed the atomic check */
+	if (ret && slots >= 0)
+		slots = ret;
+
 	if (slots < 0) {
 		drm_dbg_kms(&i915->drm, "failed finding vcpi slots:%d\n",
 			    slots);
-- 
2.24.1.485.gad05a3d8e5

