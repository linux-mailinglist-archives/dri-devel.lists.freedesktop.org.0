Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A1412D1E9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2019 17:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F25989FC0;
	Mon, 30 Dec 2019 16:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD68089FA7;
 Mon, 30 Dec 2019 16:25:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Dec 2019 08:25:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; d="scan'208";a="251418036"
Received: from unknown (HELO amanna.iind.intel.com) ([10.223.74.53])
 by fmsmga002.fm.intel.com with ESMTP; 30 Dec 2019 08:25:47 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/9] drm/i915/dsb: Send uevent to testapp.
Date: Mon, 30 Dec 2019 21:45:19 +0530
Message-Id: <20191230161523.32222-6-animesh.manna@intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191230161523.32222-1-animesh.manna@intel.com>
References: <20191230161523.32222-1-animesh.manna@intel.com>
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

Send uevent to testapp and set test_active flag. To align with link
compliance design existing intel_dp_compliance tool will be used to
get the phy request in userspace through uevent.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index fa67b8f88e65..cbefda9b6204 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5013,6 +5013,9 @@ static u8 intel_dp_autotest_phy_pattern(struct intel_dp *intel_dp)
 	if (test_result != DP_TEST_ACK)
 		DRM_ERROR("Phy test preparation failed\n");
 
+	/* Set test active flag here so userspace doesn't interrupt things */
+	intel_dp->compliance.test_active = 1;
+
 	return test_result;
 }
 
@@ -5338,8 +5341,11 @@ intel_dp_short_pulse(struct intel_dp *intel_dp)
 
 	intel_psr_short_pulse(intel_dp);
 
-	if (intel_dp->compliance.test_type == DP_TEST_LINK_TRAINING) {
-		DRM_DEBUG_KMS("Link Training Compliance Test requested\n");
+	if (intel_dp->compliance.test_type == DP_TEST_LINK_TRAINING ||
+	    intel_dp->compliance.test_type ==
+	    DP_TEST_LINK_PHY_TEST_PATTERN) {
+		DRM_DEBUG_KMS("Compliance Test requested, test-type = 0x%lx\n",
+			      intel_dp->compliance.test_type);
 		/* Send a Hotplug Uevent to userspace to start modeset */
 		drm_kms_helper_hotplug_event(&dev_priv->drm);
 	}
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
