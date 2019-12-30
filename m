Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A0912D1EA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2019 17:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B308489FC3;
	Mon, 30 Dec 2019 16:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA64289FC0;
 Mon, 30 Dec 2019 16:25:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Dec 2019 08:25:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; d="scan'208";a="251418048"
Received: from unknown (HELO amanna.iind.intel.com) ([10.223.74.53])
 by fmsmga002.fm.intel.com with ESMTP; 30 Dec 2019 08:25:51 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/9] drm/i915/dp: Add debugfs entry for DP phy compliance.
Date: Mon, 30 Dec 2019 21:45:20 +0530
Message-Id: <20191230161523.32222-7-animesh.manna@intel.com>
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

These debugfs entry will help testapp to understand the test request
during dp phy compliance mode.

Acked-by: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 0ac98e39eb75..a903ed0632cb 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -3177,6 +3177,16 @@ static int i915_displayport_test_data_show(struct seq_file *m, void *data)
 					   intel_dp->compliance.test_data.vdisplay);
 				seq_printf(m, "bpc: %u\n",
 					   intel_dp->compliance.test_data.bpc);
+			} else if (intel_dp->compliance.test_type ==
+				   DP_TEST_LINK_PHY_TEST_PATTERN) {
+				seq_printf(m, "pattern: %d\n",
+					   intel_dp->compliance.test_data.phytest.phy_pattern);
+				seq_printf(m, "Number of lanes: %d\n",
+					   intel_dp->compliance.test_data.phytest.num_lanes);
+				seq_printf(m, "Link Rate: %d\n",
+					   intel_dp->compliance.test_data.phytest.link_rate);
+				seq_printf(m, "level: %02x\n",
+					   intel_dp->train_set[0]);
 			}
 		} else
 			seq_puts(m, "0");
@@ -3209,7 +3219,7 @@ static int i915_displayport_test_type_show(struct seq_file *m, void *data)
 
 		if (encoder && connector->status == connector_status_connected) {
 			intel_dp = enc_to_intel_dp(&encoder->base);
-			seq_printf(m, "%02lx", intel_dp->compliance.test_type);
+			seq_printf(m, "%02lx\n", intel_dp->compliance.test_type);
 		} else
 			seq_puts(m, "0");
 	}
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
