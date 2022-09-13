Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFF75B6F5D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 16:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0A010E721;
	Tue, 13 Sep 2022 14:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1735210E4CC;
 Tue, 13 Sep 2022 14:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663078411; x=1694614411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EbUnMm7W7g3cPFHACFbAYmVgDTww01Lb+rVM/PImf1k=;
 b=enWbdyESTxpcZxze40mHKXnd0VzWyYXpfVCidtye9PQDFxVt2CYq+M3X
 keIBXD9lPS7GqgxBT7hkwzW05LKAPfklQChWf5C0AYKRX6O/jr+Mv/fxt
 GUqdlpGZZE9xId/niUwA7NaWVASMaEk+vOMmfCIeVgsonh3pT6Oe5fr+N
 PrrYrDAWzAS+S5tU4Vvi64TaqfgIus8Gg8vGDn9L7IZRr7/LsA3rrD0Qf
 HESdjh2q1GRX1IePi+4+4fzQO/I9+8xV/EsAIovC4Mp40MLiNEMwOIG5c
 uhOePTcJ8gilWl9ytzWEb3fq9KRQwhAcsg7Ntou8mu0BfJWGvD0OV+HyD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="299484622"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="299484622"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 07:13:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="678584528"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga008.fm.intel.com with ESMTP; 13 Sep 2022 07:13:28 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915: Fix intel_dp_mst_compute_link_config
Date: Tue, 13 Sep 2022 17:14:15 +0300
Message-Id: <20220913141417.8131-3-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913141417.8131-1-stanislav.lisovskiy@intel.com>
References: <20220913141417.8131-1-stanislav.lisovskiy@intel.com>
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
index 5adfd226d6c4..8c89570e76f8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -59,6 +59,7 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	int bpp, slots = -EINVAL;
+	int ret = 0;
 
 	mst_state = drm_atomic_get_mst_topology_state(state, &intel_dp->mst_mgr);
 	if (IS_ERR(mst_state))
@@ -84,10 +85,21 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
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

