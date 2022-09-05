Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7782E5ACE50
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8728310E221;
	Mon,  5 Sep 2022 08:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B7A10E218;
 Mon,  5 Sep 2022 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662368220; x=1693904220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tXF2dUxIwHZVPATHxXztZhVOzhEsfFaeE/5dUi9cPfw=;
 b=kSb+TZRhtF7lhJaEXFsr0/XRozB0vdeaS2YvrI3M4/ALuiQvN8B9Hfll
 3xWmK/fPnZLNrYILhA2IsUlbAmQOOqLJ7LEdf8UG+kaOuH9hwK4Bwpc8o
 JpbzCPPUp17rIElOfAf71AasqoRSklhhFmD8jozsNwV/M6akl3Xp7dR7K
 06LH/srvo3Y+EFEmyTKLU8GtcjTd9ZtxCCcSySScbxYpEAsrdaY2nnPNr
 v01R8rUAq2PeMHHc/UxHvxkXW9cxzCVeTz4biaEdXjkLN+uTwacPdJ3GV
 AWKvm0foq7KzBGz9N2KcqrFPz/wkQMl+YAa/uZFoTQ43MQAHKbnIbUED3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="296347057"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="296347057"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 01:57:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="755961723"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2022 01:56:58 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915: Fix intel_dp_mst_compute_link_config
Date: Mon,  5 Sep 2022 11:57:42 +0300
Message-Id: <20220905085744.29637-3-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220905085744.29637-1-stanislav.lisovskiy@intel.com>
References: <20220905085744.29637-1-stanislav.lisovskiy@intel.com>
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

We currently always exit that bpp loop because
drm_dp_atomic_find_vcpi_slots doesn't care if we actually
can fit those or not.
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
index 7713c19042f3..24d6a287a6e3 100644
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

