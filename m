Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F9783DE04
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 16:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5188C10FBCF;
	Fri, 26 Jan 2024 15:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0000E10FBCE;
 Fri, 26 Jan 2024 15:51:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+rzMToUX4rGDbD8yYJYNgdhRaaHWGKfpgqM/oT3KyqPnjF1jFkoxlF7Lea3f5j/dnaXucF9wsbGMWd7kEc8dOum3eYSmUBOkjRKlEBdUmnt1ze0sY1TAuaT6ikw0cr1Fu9+iqF5VEJH7TU32Ga9gaQXT2M493ONmQqLrcGxsxvRpSZWCQTn6+t4CiI7zc+TZ6POg13klgVDkTriXJBli+CALFLp6cVT9IgzMqMk2JwRhQHqFzMrgBxzRI2qH6jolFyPN33B6lBLy7LZquGw0Rk2s0Ug0w3bTc+1VO8mr+yxswsIBjtSVrUziD1lN6zS065usp+MW2NMJHP4ZRTXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7opKPDW2k9gFFGTydi7qJ406j3JTfN/1HUjdxLd922g=;
 b=YGMcGwMuc2WsDAd6VrC3z6xBsIBFIjpuvjiqysL9M2Kepr8l9aYrYRSDkFdf9N1bRRDBG3b6aet1IkcCsa3+4c3kPhdNnlIMszhSYy7j+ribaneWoPS/hX7ZvRvDHPrk9Fc9VLC/V04gEkuRSWMbV5BbhLFU1J350ewv4sxHY7nmm+rIckowBplI9y6B/wMuiKqm+hB5W63Oga+jhaZgupOm3xNvgpZ/AfPfoyLN9/2bSrHgcwYAuSgEYIdfHt4++rFgG9JKsuTwdPzVoCBdsDcFh+vpQcSUJnj2ViAbZFbPxD/APvaZ7dYMdQlKuLI/mtXbfQQM0S0r111q0gg2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7opKPDW2k9gFFGTydi7qJ406j3JTfN/1HUjdxLd922g=;
 b=Z2cxeeJDbuf0MhCHaGpnkjbCHoJ77xUD3huhnahD3Bsf+0/yFpj5CvNM8urV23EgExghpioVbBRDb//hdbqGqxBdOO/ryCOheNvB5tXqRexOIOnc/IBoI/XwBSHVE6Eeg1Shvx3GUHc7DJpPdlZT3Kj+1vhDUD3gu7l6S1HD/+g=
Received: from BYAPR21CA0020.namprd21.prod.outlook.com (2603:10b6:a03:114::30)
 by MW4PR12MB7000.namprd12.prod.outlook.com (2603:10b6:303:208::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.39; Fri, 26 Jan
 2024 15:51:40 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::a6) by BYAPR21CA0020.outlook.office365.com
 (2603:10b6:a03:114::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.8 via Frontend
 Transport; Fri, 26 Jan 2024 15:51:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 26 Jan 2024 15:51:39 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 26 Jan
 2024 09:51:35 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, Nicholas Choi
 <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>, David Gow
 <davidgow@google.com>, <hersenxs.wu@amd.com>, <magalilemes00@gmail.com>
Subject: [PATCH v4 7/8] drm/amd/display: Introduce KUnit tests to dc_dmub_srv
 library
Date: Fri, 26 Jan 2024 08:48:07 -0700
Message-ID: <20240126155022.1184856-8-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126155022.1184856-1-Rodrigo.Siqueira@amd.com>
References: <20240126155022.1184856-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|MW4PR12MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b2d0743-e58a-432f-796d-08dc1e86af76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JeDCPr6/T6k6v6/pPFSW1PzP6mHAGS0nn8WNbnxJevOHlBNA+9dGxCQEhGHAcwWEycG8rOKFKb6dy+gMpf1/u0ztOesk2sXRpa28WfDhtr4QSbdYmO5HKOKBHSvy2phuV+b7D9kkLGVtDZgc0VgbmnuumtBP/8z1wvY8DY/AWjPJLoqKIL3GqNTRXVrgDQVYTZJQUEXdmM69EDYX4YYjdvma8R8ZrSCXmcTnT6ggsYml5CEQ25bzqI7nmM7cOl8nRS8O32bd+cgP5WKKdB4OTt23u2W+COQYM298UOrm4iqRLqPuitrNkhdD5rIHiRZSBsYX0tU6KvficYa5oQawQoFwCmi9CkWpyUOCjKbhf66xCUboJO8UQj3BgE47SVsziQ3v6MdGaaGAHxoSxKBb8rQstTTh9w4naDBN5r411HjYosxAEesfR59uPeprBVIhQ5Yx3LRbYpupua1J4+Nrsg1fn9FFI3mrSLzqk3D4VPxVAW3EougJn/YAV09kdkbNxEuI/z6/rwxIjl6iGeSm2e6W2ufkk2ucY8g44zAoD/eFN7GJJOYSezrFeTJZ1f+yXTL5WsHiEIBwnLF/1f2SIf3uVLaqAwMqu8KCMTGkeJlHvaNO0lsVrw9RAAA1P9pC6/fdOjZp6lH5Jz5nJ4FXNdhLNgwTFFkc4EtLO93x5DWjhoYLyjqnB5O0PULPjLaq+rEs31NIu97lS46KtTJkVmM0omTycep9+yLwMIoaVOXG0FilcNsko9SmSCpLlGhgFyR8Mi1beY8EW7fOGysHKtnLFXtNAAi//WjdJSSvvJg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799012)(36840700001)(40470700004)(46966006)(54906003)(70206006)(478600001)(356005)(336012)(82740400003)(81166007)(86362001)(36756003)(41300700001)(83380400001)(426003)(26005)(8936002)(8676002)(4326008)(316002)(1076003)(36860700001)(110136005)(7416002)(70586007)(5660300002)(6666004)(2906002)(2616005)(16526019)(47076005)(66574015)(921011)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 15:51:39.5183 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2d0743-e58a-432f-796d-08dc1e86af76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7000
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
Cc: kernel test robot <lkp@intel.com>, tales.aparecida@gmail.com,
 Trevor Woerner <twoerner@gmail.com>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maíra Canal <mairacanal@riseup.net>

Add a unit test to the SubVP feature in order to avoid possible
regressions and ensure code robustness. In particular, this new test
validates the expected parameters when using 4k144 and 4k240 displays.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/amd/display/Kconfig           |  13 ++
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |   4 +
 .../amd/display/tests/dc/dc_dmub_srv_test.c   | 159 ++++++++++++++++++
 3 files changed, 176 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dc_dmub_srv_test.c

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 877ba3be6aed..9724162d7509 100644
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
index 2b79a0e5638e..181d1bcabb0f 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -1415,3 +1415,7 @@ bool dc_wake_and_execute_gpint(const struct dc_context *ctx, enum dmub_gpint_com
 
 	return result;
 }
+
+#if IS_ENABLED(CONFIG_AMD_DC_KUNIT_TEST)
+#include "../tests/dc/dc_dmub_srv_test.c"
+#endif
diff --git a/drivers/gpu/drm/amd/display/tests/dc/dc_dmub_srv_test.c b/drivers/gpu/drm/amd/display/tests/dc/dc_dmub_srv_test.c
new file mode 100644
index 000000000000..d12c4e3816b5
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/dc/dc_dmub_srv_test.c
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

