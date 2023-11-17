Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB37EF545
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 16:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF52E10E2F6;
	Fri, 17 Nov 2023 15:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA5310E2F6;
 Fri, 17 Nov 2023 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700234861; x=1731770861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JRM7GD/ZrcmknMOenAWbkih7WHV+0UbHbULosm9DKOQ=;
 b=bBFbHUz02/j3/Cx2r42alRrkmeZzF6pcBJG8zIHoHVukCU0lfe0Q8ERP
 mGU7rhEp2REJNqwSaSpKA7UN/QgbtlKeZMTzUSQy4ZWsKksouiZ8SaUCS
 SE2um7k2341WRZHGschbXsoNs9W6HJIn3vX9vhZCKPV1Cadr3rRsF/T++
 U5/EHyk2tzQc9CLBu9gvlHXhzcws2udN2DrtOV+wTUk6O4wrG5qB5b77G
 9lvlU9xCX4YYL+BaSVK/GuyjM38dru38s4O39JBYdM1nt5qVQqPWXsjHe
 YFtBVRoHQnZu6WRWh9k0k36Ukb4vFQoPaQOa2Mpu6kVxz+oYEnCEBmMbZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4460550"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4460550"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 07:27:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="1097128779"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="1097128779"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 07:27:37 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 03/11] drm/dp_mst: Add kunit tests for
 drm_dp_get_vc_payload_bw()
Date: Fri, 17 Nov 2023 17:27:37 +0200
Message-Id: <20231117152737.1782690-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231117150929.1767227-2-imre.deak@intel.com>
References: <20231117150929.1767227-2-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add kunit test cases for drm_dp_get_vc_payload_bw() with all the DP1.4
and UHBR link configurations.

v2:
- List test cases in decreasing rate,lane count order matching the
  corresponding DP Standard tables. (Ville)
- Add references to the DP Standard tables.
v3:
- Sort the testcases properly.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 .../gpu/drm/tests/drm_dp_mst_helper_test.c    | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
index e3c818dfc0e6d..98d57d28aab6f 100644
--- a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
@@ -68,6 +68,152 @@ static void dp_mst_calc_pbn_mode_desc(const struct drm_dp_mst_calc_pbn_mode_test
 KUNIT_ARRAY_PARAM(drm_dp_mst_calc_pbn_mode, drm_dp_mst_calc_pbn_mode_cases,
 		  dp_mst_calc_pbn_mode_desc);
 
+struct drm_dp_mst_calc_pbn_div_test {
+	int link_rate;
+	int lane_count;
+	fixed20_12 expected;
+};
+
+#define fp_init(__int, __frac) { \
+	.full = (__int) * (1 << 12) + \
+		(__frac) * (1 << 12) / 100000 \
+}
+
+static const struct drm_dp_mst_calc_pbn_div_test drm_dp_mst_calc_pbn_div_dp1_4_cases[] = {
+	/*
+	 * UHBR rates (DP Standard v2.1 2.7.6.3, specifying the rounded to
+	 *             closest value to 2 decimal places):
+	 * .expected = .link_rate * .lane_count * 0.9671 / 8 / 54 / 100
+	 * DP1.4 rates (DP Standard v2.1 2.6.4.2):
+	 * .expected = .link_rate * .lane_count * 0.8000 / 8 / 54 / 100
+	 *
+	 * truncated to 5 decimal places.
+	 */
+	{
+		.link_rate = 2000000,
+		.lane_count = 4,
+		.expected = fp_init(179,  9259),  /* 179.09259 */
+	},
+	{
+		.link_rate = 2000000,
+		.lane_count = 2,
+		.expected = fp_init(89, 54629),
+	},
+	{
+		.link_rate = 2000000,
+		.lane_count = 1,
+		.expected = fp_init(44, 77314),
+	},
+	{
+		.link_rate = 1350000,
+		.lane_count = 4,
+		.expected = fp_init(120, 88750),
+	},
+	{
+		.link_rate = 1350000,
+		.lane_count = 2,
+		.expected = fp_init(60, 44375),
+	},
+	{
+		.link_rate = 1350000,
+		.lane_count = 1,
+		.expected = fp_init(30, 22187),
+	},
+	{
+		.link_rate = 1000000,
+		.lane_count = 4,
+		.expected = fp_init(89, 54629),
+	},
+	{
+		.link_rate = 1000000,
+		.lane_count = 2,
+		.expected = fp_init(44, 77314),
+	},
+	{
+		.link_rate = 1000000,
+		.lane_count = 1,
+		.expected = fp_init(22, 38657),
+	},
+	{
+		.link_rate = 810000,
+		.lane_count = 4,
+		.expected = fp_init(60, 0),
+	},
+	{
+		.link_rate = 810000,
+		.lane_count = 2,
+		.expected = fp_init(30, 0),
+	},
+	{
+		.link_rate = 810000,
+		.lane_count = 1,
+		.expected = fp_init(15, 0),
+	},
+	{
+		.link_rate = 540000,
+		.lane_count = 4,
+		.expected = fp_init(40, 0),
+	},
+	{
+		.link_rate = 540000,
+		.lane_count = 2,
+		.expected = fp_init(20, 0),
+	},
+	{
+		.link_rate = 540000,
+		.lane_count = 1,
+		.expected = fp_init(10, 0),
+	},
+	{
+		.link_rate = 270000,
+		.lane_count = 4,
+		.expected = fp_init(20, 0),
+	},
+	{
+		.link_rate = 270000,
+		.lane_count = 2,
+		.expected = fp_init(10, 0),
+	},
+	{
+		.link_rate = 270000,
+		.lane_count = 1,
+		.expected = fp_init(5, 0),
+	},
+	{
+		.link_rate = 162000,
+		.lane_count = 4,
+		.expected = fp_init(12, 0),
+	},
+	{
+		.link_rate = 162000,
+		.lane_count = 2,
+		.expected = fp_init(6, 0),
+	},
+	{
+		.link_rate = 162000,
+		.lane_count = 1,
+		.expected = fp_init(3, 0),
+	},
+};
+
+static void drm_test_dp_mst_calc_pbn_div(struct kunit *test)
+{
+	const struct drm_dp_mst_calc_pbn_div_test *params = test->param_value;
+	/* mgr->dev is only needed by drm_dbg_kms(), but it's not called for the test cases. */
+	struct drm_dp_mst_topology_mgr mgr = {};
+
+	KUNIT_EXPECT_EQ(test, drm_dp_get_vc_payload_bw(&mgr, params->link_rate, params->lane_count).full,
+			params->expected.full);
+}
+
+static void dp_mst_calc_pbn_div_desc(const struct drm_dp_mst_calc_pbn_div_test *t, char *desc)
+{
+	sprintf(desc, "Link rate %d lane count %d", t->link_rate, t->lane_count);
+}
+
+KUNIT_ARRAY_PARAM(drm_dp_mst_calc_pbn_div, drm_dp_mst_calc_pbn_div_dp1_4_cases,
+		  dp_mst_calc_pbn_div_desc);
+
 static u8 data[] = { 0xff, 0x00, 0xdd };
 
 struct drm_dp_mst_sideband_msg_req_test {
@@ -416,6 +562,7 @@ KUNIT_ARRAY_PARAM(drm_dp_mst_sideband_msg_req, drm_dp_mst_sideband_msg_req_cases
 
 static struct kunit_case drm_dp_mst_helper_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_dp_mst_calc_pbn_mode, drm_dp_mst_calc_pbn_mode_gen_params),
+	KUNIT_CASE_PARAM(drm_test_dp_mst_calc_pbn_div, drm_dp_mst_calc_pbn_div_gen_params),
 	KUNIT_CASE_PARAM(drm_test_dp_mst_sideband_msg_req_decode,
 			 drm_dp_mst_sideband_msg_req_gen_params),
 	{ }
-- 
2.39.2

