Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBF185FD67
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B75A10E9AF;
	Thu, 22 Feb 2024 15:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ntnolnnc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8811D10E9AA;
 Thu, 22 Feb 2024 15:59:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHEPq3sn8H8Zhyc82+r+xNp5E4gu4Zd6pAZzaWxcShKtmiAYziWBRM6wNKCdzwqW258b6od6FMA8QlEfAOsjYqAeydaoJnu64hYYxwr7bnyIjTPK5qONQ3B+F7QHBur8fLDSuiz1EzpoJcjQhIFJDysortIreR42pw4PnA0boo/S3lE8LzP6rpr6mBBUk9ORrBjciUp8h4RBv/B6T1gTBeDJUkpDj53LpXHWDnO2fGH4i2sWX6+yjPJLUy2zxHXTQ3gZMlJ0e8HA4myIAOqgxejPQBi2CSKM1gGxWsYTVUD3P2/m8PeQMU8mUXpVvYCNJ66FC7AiDTc35BC7Upfwzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHB5vJQtFzwbDU1rSzUCK8PpDDp8ubMGGoP5Z/ykLBc=;
 b=cxR3+0psoU1R2r9ZT195YyjeLAJAF+JE/nKzsKZ9q6rdKZ0thSMP0KZm19/Qk8p1gVEarbzGlzB/MuVY0TJVPfACD9idOj+PoeBG+LtvcieHghVw0e0Qyw3VhD4vm6FZib+2tXnV5rqxxT7vBgJmbgHkNTZFKmLCI7BMGnCDlsLYamCljg7ZJfBojSpRKTPFg91z06XxqkvvZhmGy7xgOBxaKkKju8Fz6rkia8I7s0IMkSJR83vTaLMaC+FaCp0ITsS+bHmZVRkGiMKPoXDv7MmXYxfdZxGUde+aOTS1I1FRva0/MVLEYb9GvAhTiBNJab5RCwH+SlTk2B6i1/tRzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHB5vJQtFzwbDU1rSzUCK8PpDDp8ubMGGoP5Z/ykLBc=;
 b=ntnolnncGYs628wezCBJqOuKoDB9mAnOja9d++9sNf7PVc4R/tGHadI24Rbw/xlfndhdCmuz9fnydDRjz0UJa/E+0Pr7hx6qNCgb4ea+pzde4nC+bUZ6DTd53VTdaCuUOmUoAlrs8cveW2fZbw5WEkyMT5XQ4TKXYKzkPfwAdds=
Received: from PH0PR07CA0044.namprd07.prod.outlook.com (2603:10b6:510:e::19)
 by PH0PR12MB8173.namprd12.prod.outlook.com (2603:10b6:510:296::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Thu, 22 Feb
 2024 15:59:13 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::75) by PH0PR07CA0044.outlook.office365.com
 (2603:10b6:510:e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.43 via Frontend
 Transport; Thu, 22 Feb 2024 15:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 15:59:13 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 22 Feb
 2024 09:59:09 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, Nicholas Choi
 <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>, David Gow
 <davidgow@google.com>, <hersenxs.wu@amd.com>, <magalilemes00@gmail.com>
CC: <kunit-dev@googlegroups.com>, <tales.aparecida@gmail.com>,
 <amd-gfx@lists.freedesktop.org>, <mwen@igalia.com>, <mairacanal@riseup.net>,
 <dri-devel@lists.freedesktop.org>, Isabella Basso <isabbasso@riseup.net>,
 <andrealmeid@riseup.net>, Trevor Woerner <twoerner@gmail.com>,
 <javierm@redhat.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH v5 7/8] drm/amd/display: Introduce KUnit tests to dc_dmub_srv
 library
Date: Thu, 22 Feb 2024 08:56:19 -0700
Message-ID: <20240222155811.44096-8-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
References: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|PH0PR12MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c82e42-c9d1-43b0-90ea-08dc33bf370f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fXLRZ2K5jkLyl90bZ7Y6TpDAoE0sQDkVxr84ao2FfsGcUkBZgghvMR11/tiEMMoLiWoealwovv1AHi/Yyg3cqeOTFwYlbUp2+Fh45MOdEvY6oqZHNzpOO3jFYSAZiMssPHWQz5+mVAG9hkXpUespMb1Z+LG2UXaBgw15qum3/IJT9+++pONJJhCI4p+LvR6Oaf4AYOKYy5KnYyXPmhjGSXNgyQ1VRHE21n+hMPU2ed6BF9FjpAAXDJU6YAF1nWGKJ9dwFXYLcDwIAOcXHfUBs/zJsfZxNJIlTa1YRI1drg29ZAQeiwkxthbwv0OFeZfHsrjSnBzgssyb0ss/8sHJbowlhpxwAdzjiUBKsuRNWX63+PNbE4d1EmowQkIkbb4jtixzPbbWoUkiTqEus9RxSVZUfD/CxHX4EHJm/1KAqTvmN3i82ExlbBaH0fE4+78gAAJXJCTJkQzbkexv6YGMga33Je0ry+cOjncnbMkJjdoC9x1f4JVvc0PiSO2Zrdke2FX3hD5DVEImUDxa4YSlJjj0qUMeMVscywJUjEs3THI/Ie7irFdLwCuu76v257G+AmhTtWPDFqfJjubD7QpshOKdAxOTIU3bgVohLfQmj7zGED0i21ICHV+pTf1XyUEjiY66aQ8n/O5yJKYjdt2ARlQi8JRzrIz4hrSzEFgr3dI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(46966006)(40470700004)(921011); DIR:OUT; SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 15:59:13.4367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c82e42-c9d1-43b0-90ea-08dc33bf370f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8173
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maíra Canal <mairacanal@riseup.net>

Add a unit test to the SubVP feature in order to avoid possible
regressions and ensure code robustness. In particular, this new test
validates the expected parameters when using 4k144 and 4k240 displays.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
Co-developed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/amd/display/Kconfig           |  13 ++
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |   4 +
 .../drm/amd/display/test/kunit/.kunitconfig   |   1 +
 .../display/test/kunit/dc/dc_dmub_srv_test.c  | 159 ++++++++++++++++++
 4 files changed, 177 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/dc/dc_dmub_srv_test.c

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index ab52b135db85..11b0e54262f3 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -90,4 +90,17 @@ config AMD_DC_BASICS_KUNIT_TEST
 
 		If unsure, say N.
 
+config AMD_DC_KUNIT_TEST
+	bool "Enable KUnit tests for the 'utils' sub-component of DAL" if !KUNIT_ALL_TESTS
+	depends on DRM_AMD_DC && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+		Enables unit tests for the basics folder of Display Core. Only useful for
+		kernel devs running KUnit.
+
+		For more information on KUnit and unit tests in general please refer to
+		the KUnit documentation in Documentation/dev-tools/kunit/.
+
+		If unsure, say N.
+
 endmenu
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 6083b1dcf050..7aafdfeac60e 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -1438,3 +1438,7 @@ bool dc_wake_and_execute_gpint(const struct dc_context *ctx, enum dmub_gpint_com
 
 	return result;
 }
+
+#if IS_ENABLED(CONFIG_AMD_DC_KUNIT_TEST)
+#include "../test/kunit/dc/dc_dmub_srv_test.c"
+#endif
diff --git a/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig b/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
index eb6f81601757..4c5861ad58bd 100644
--- a/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
+++ b/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
@@ -4,5 +4,6 @@ CONFIG_DRM=y
 CONFIG_DRM_AMDGPU=y
 CONFIG_DRM_AMD_DC=y
 CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
+CONFIG_AMD_DC_KUNIT_TEST=y
 CONFIG_DCE_KUNIT_TEST=y
 CONFIG_DML_KUNIT_TEST=y
diff --git a/drivers/gpu/drm/amd/display/test/kunit/dc/dc_dmub_srv_test.c b/drivers/gpu/drm/amd/display/test/kunit/dc/dc_dmub_srv_test.c
new file mode 100644
index 000000000000..d12c4e3816b5
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/test/kunit/dc/dc_dmub_srv_test.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: MIT
+/*
+ * KUnit tests for dc_dmub_srv.c
+ *
+ * Copyright (C) 2022, Maíra Canal <mairacanal@riseup.net>
+ */
+
+#include <kunit/test.h>
+#include "dc_dmub_srv.h"
+
+/**
+ * DOC: overview
+ *
+ * The file dc_dumb_srv.c has many functions that work as an interface to
+ * generate some of the DMUB parameters. To offload some of the complexity from
+ * the DMUB, the 'dc_dmub_srv.c' file provides functions that perform
+ * mathematical calculations to generate the parameter that will be passed to
+ * the DMUB to enable specific configurations.
+ */
+
+/**
+ * struct populate_subvp_cmd_drr_info_test_case - Fields for subvp validation
+ *
+ * The function populate_subvp_cmd_drr_info() performs calculations based on
+ * different pipe context timing values. This struct maintains those fields
+ * required to be passed to the populate_subvp_cmd_drr_info.
+ */
+struct populate_subvp_cmd_drr_info_test_case {
+	const char *desc;
+	/**
+	* @dc: In the specific context of populate_subvp_cmd_drr_info() test,
+	* we only care about the DC capabilities.
+	*/
+	struct dc *dc;
+
+	/**
+	 * @subvp_pipe: This parameter plays an essential role in the
+	 * populate_subvp_cmd_drr_info validation because it will be used to
+	 * derive some of the parameters for the max VTotal, but it is also
+	 * employed in a pointer validation that extracts the phantom timing
+	 * from the context.
+	 */
+	struct pipe_ctx *subvp_pipe;
+
+	/**
+	 * @vblank_pipe: This field keeps the DRR timing values used in the Max
+	 * and Min VTotal calculation.
+	 */
+	struct pipe_ctx *vblank_pipe;
+
+	/**
+	 * @context: In the context of populate_subvp_cmd_drr_info(), this
+	 * field it is only necessary to fulfill the requirements for
+	 * dc_state_get_paired_subvp_stream() helper.
+	 */
+	struct dc_state *context;
+};
+
+const struct dc_stream_status mock_dc_stream_state_returned_from_get_paired = {
+	.mall_stream_config =  (struct mall_stream_config) {
+		.paired_stream = &(struct dc_stream_state) {
+			.timing = {
+				.v_total = 216,
+				.h_total = 4000,
+				.v_addressable = 149,
+				.pix_clk_100hz = 5332500,
+				.v_front_porch = 1,
+			},
+		}
+	}
+};
+
+struct pipe_ctx mock_vblank_pipe_parameter = {
+	.stream = &(struct dc_stream_state) {
+		.timing = {
+			.v_total = 2250,
+			.h_total = 4400,
+			.v_addressable = 2160,
+			.pix_clk_100hz = 23760000,
+		},
+	},
+};
+
+const struct pipe_ctx mock_subvp_pipe_parameter = {
+	.stream = &(struct dc_stream_state) {
+		.timing = {
+			.h_total = 4000,
+			.v_addressable = 2160,
+			.pix_clk_100hz = 5332500,
+		},
+	},
+};
+
+struct populate_subvp_cmd_drr_info_test_case subvp_4k144_4k240_case = {
+	.desc = "4k144 and 4k240 displays are the perfect scenario for SubVP",
+	.dc = &(struct dc) {
+		.caps = {
+			.subvp_prefetch_end_to_mall_start_us = 15,
+			.subvp_fw_processing_delay_us = 15,
+		}
+	},
+
+	.subvp_pipe = (struct pipe_ctx *) &mock_subvp_pipe_parameter,
+	.vblank_pipe = &mock_vblank_pipe_parameter,
+	.context = &(struct dc_state) {
+		.stream_count = 1,
+		.streams[0] = mock_subvp_pipe_parameter.stream,
+		.stream_status[0] = mock_dc_stream_state_returned_from_get_paired,
+	},
+};
+
+/**
+ * populate_subvp_cmd_drr_info_with_4k144_4k240_parameters - Check two display with 4k144 and 4k240
+ *
+ * @test: Kunit parameter
+ *
+ * One of the scenarios where SubVP can perform really well is in a
+ * high-resolution display with a high refresh rate. In this sense, this test
+ * targets the parameter configuration for 4k144 and 4k240.
+ */
+static void populate_subvp_cmd_drr_info_with_4k144_4k240_parameters(struct kunit *test)
+{
+	struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 *pipe_data;
+	struct populate_subvp_cmd_drr_info_test_case tmp = subvp_4k144_4k240_case;
+
+	pipe_data = kunit_kzalloc(test,
+				  sizeof(struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2),
+				  GFP_KERNEL);
+
+	populate_subvp_cmd_drr_info(tmp.dc,
+				    tmp.context,
+				    tmp.subvp_pipe,
+				    tmp.vblank_pipe,
+				    pipe_data);
+
+	// DRR must be in use
+	KUNIT_EXPECT_EQ(test, true, pipe_data->pipe_config.vblank_data.drr_info.drr_in_use);
+
+	// Use ramp should not be enable
+	KUNIT_EXPECT_EQ(test, false, pipe_data->pipe_config.vblank_data.drr_info.use_ramping);
+
+	// Expects 4ms for the DRR window size
+	KUNIT_EXPECT_EQ(test, 4, pipe_data->pipe_config.vblank_data.drr_info.drr_window_size_ms);
+
+	KUNIT_EXPECT_EQ(test, 2906, pipe_data->pipe_config.vblank_data.drr_info.min_vtotal_supported);
+	KUNIT_EXPECT_EQ(test, 7267, pipe_data->pipe_config.vblank_data.drr_info.max_vtotal_supported);
+}
+
+static struct kunit_case dc_dmub_srv_cases[] = {
+	KUNIT_CASE(populate_subvp_cmd_drr_info_with_4k144_4k240_parameters),
+	{  }
+};
+
+static struct kunit_suite dc_dmub_srv_suite = {
+	.name = "dc_dmub_srv",
+	.test_cases = dc_dmub_srv_cases,
+};
+
+kunit_test_suite(dc_dmub_srv_suite);
-- 
2.43.0

