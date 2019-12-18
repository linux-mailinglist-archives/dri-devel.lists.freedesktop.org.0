Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDFA124B92
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1536E52A;
	Wed, 18 Dec 2019 15:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08898898AF;
 Wed, 18 Dec 2019 15:24:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 07:24:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="205873161"
Received: from unknown (HELO amanna.iind.intel.com) ([10.223.74.53])
 by orsmga007.jf.intel.com with ESMTP; 18 Dec 2019 07:24:56 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/9] drm/i915/dp: Preparation for DP phy compliance auto
 test
Date: Wed, 18 Dec 2019 20:43:45 +0530
Message-Id: <20191218151350.19579-5-animesh.manna@intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191218151350.19579-1-animesh.manna@intel.com>
References: <20191218151350.19579-1-animesh.manna@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, nidhi1.gupta@intel.com,
 Animesh Manna <animesh.manna@intel.com>, manasi.d.navare@intel.com,
 uma.shankar@intel.com, anshuman.gupta@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During DP phy compliance auto test mode, sink will request
combination of different test pattern with differnt level of
vswing, pre-emphasis. Function added to prepare for it.

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 83ea04149b77..c17866f126c9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1205,6 +1205,7 @@ struct intel_dp_compliance_data {
 	u8 video_pattern;
 	u16 hdisplay, vdisplay;
 	u8 bpc;
+	struct drm_dp_phy_test_params phytest;
 };
 
 struct intel_dp_compliance {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ca82835b6dcf..a871834b90d9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4984,9 +4984,33 @@ static u8 intel_dp_autotest_edid(struct intel_dp *intel_dp)
 	return test_result;
 }
 
+static u8 intel_dp_prepare_phytest(struct intel_dp *intel_dp)
+{
+	struct drm_dp_phy_test_params *data =
+		&intel_dp->compliance.test_data.phytest;
+
+	if (drm_dp_get_phy_test_pattern(&intel_dp->aux, data)) {
+		DRM_DEBUG_KMS("DP Phy Test pattern AUX read failure\n");
+		return DP_TEST_NAK;
+	}
+
+	/*
+	 * link_mst is set to false to avoid executing mst related code
+	 * during compliance testing.
+	 */
+	intel_dp->link_mst = false;
+
+	return DP_TEST_ACK;
+}
+
 static u8 intel_dp_autotest_phy_pattern(struct intel_dp *intel_dp)
 {
 	u8 test_result = DP_TEST_NAK;
+
+	test_result = intel_dp_prepare_phytest(intel_dp);
+	if (test_result != DP_TEST_ACK)
+		DRM_ERROR("Phy test preparation failed\n");
+
 	return test_result;
 }
 
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
