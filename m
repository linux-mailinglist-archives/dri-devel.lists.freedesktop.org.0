Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D67375A93F6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CEC10E68C;
	Thu,  1 Sep 2022 10:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C98410E681;
 Thu,  1 Sep 2022 10:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662027061; x=1693563061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T5IlUs1IohEim/ITV71jCro/ewpcL2qBFHj7jOu3CV8=;
 b=OR8i0uYQNsQ106gkAeSQBxjfta8Xc1ceS3Wt9w7ZbYdm1YzJ5mOe3Rp/
 TamsuZw8BNMn7tTA0fN6i2beoVGNHjcWcOXJbqWRos2zjf0rnTe0k4CwJ
 k23nBI/bRyJ8H+uxibbHNFF69y7p00fy28+7odG4TQZHVkZOeUnEOMqcu
 /mckOSJxycwta4LdzvYO2Ktc9JE7DxKPJMG7Cnx0pWtJ4en6pPSaupj5Q
 eqPWBc49PGlou1huVTAZUTGRq3lgLgiEo58d8MaTCfIxoL9u+M2gsVi/G
 uj3fTV0JAO/kt36KcTsnnn/c87uOhrGnT1lYmcRmHiBrNf+0rJaQ9xS2q g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="359635656"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="359635656"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 03:11:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="673784264"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga008.fm.intel.com with ESMTP; 01 Sep 2022 03:10:59 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915: Fix intel_dp_mst_compute_link_config
Date: Thu,  1 Sep 2022 13:11:41 +0300
Message-Id: <20220901101143.32316-3-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901101143.32316-1-stanislav.lisovskiy@intel.com>
References: <20220901101143.32316-1-stanislav.lisovskiy@intel.com>
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

Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 13abe2b2170e..c4f92edbdd08 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -60,6 +60,7 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 		&crtc_state->hw.adjusted_mode;
 	bool constant_n = drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_CONSTANT_N);
 	int bpp, slots = -EINVAL;
+	int ret = 0;
 
 	mst_state = drm_atomic_get_mst_topology_state(state, &intel_dp->mst_mgr);
 	if (IS_ERR(mst_state))
@@ -85,10 +86,21 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 						      connector->port, crtc_state->pbn);
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
2.37.3

