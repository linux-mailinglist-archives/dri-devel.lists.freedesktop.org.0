Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8998883DE00
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 16:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6CA10FBC3;
	Fri, 26 Jan 2024 15:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4978710FBC3;
 Fri, 26 Jan 2024 15:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHCOQX+1mQ39b6C4Km5ZrjhGOGfT4O/fGo3I57tnobXPBCFILoaoZJCtrVxj5Mw3reusbHpJCrIUvvh+gU2ZQPp599Jx9HBmxTOJWxw4ozTCDZmUef/wnRqxIgtmCr7ofCn/JFzkiyvSM2nO3yZbxj2KjaDkwwFk4A1RiUcv/reU/cdtBffXXhf76hnDtu4eD1dyr4CnVYIVDfuA/Wh2pBkRpz9tER/vqKfEhhhECskcJfaVjivCQbnZb53JIc6Dzeh6DnytIRMU+UHJidodPSlQXcTUncqAuwtGbPsyFuF7osLesAT0iXrJgqwj7aAFA+foq1a8fGrq0rLcrx4hAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eT1zznPFODcvTivmlIHy/kNDzhT3QH4s6thgYL2wsA4=;
 b=PzGaxiR8cI/yFHtHBYqXbTmUz97HOrTWFAwMbCkSQJr8NDP2PrnQvXSoXwWnJQwIfKlzf/yMu0NzNqcGn0B38cSvoSXOZDXZpQaICG3ZfBOi/FfzRKkqcmQ/IJCcc65wNrxfibt+tm9aS2Ol6T001B7qwg1q8vMSRMkb0XVipwEgrn1DTM+Pn7wM/JlpULT1VZK8gsmv+m4GjgJkCjw8wSWTd3TH5qt1m0Aqj04FrhdZcejO8o5VAZ8k/jnWcCSJb9XDp2qq3cAVKhEjH2zfrkq/aiK1e8FxvUhglajadbf+ZZa5rLus3QSmc8NJkOoz7UB5OpHOxyv4CRU96y9NzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eT1zznPFODcvTivmlIHy/kNDzhT3QH4s6thgYL2wsA4=;
 b=HhjcTt/4xkAqXuMHctpeLahamAMlk8kyHRQHWL4WLoi/rl/sOrYQjSuS/jh/jgYclLOvSvd0gcNiRvlUBuNz/ePmPe5jvAGj0oCmjlR+nD5PNmMzLGwvjAvBpgr9MELnEwaT4KFhikwu8ttxLk0WoMHlhgBdcxnXOJJBV573Cug=
Received: from SJ0PR13CA0048.namprd13.prod.outlook.com (2603:10b6:a03:2c2::23)
 by BL0PR12MB4994.namprd12.prod.outlook.com (2603:10b6:208:1ca::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 15:51:31 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::fd) by SJ0PR13CA0048.outlook.office365.com
 (2603:10b6:a03:2c2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.15 via Frontend
 Transport; Fri, 26 Jan 2024 15:51:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 26 Jan 2024 15:51:30 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 26 Jan
 2024 09:51:26 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, Nicholas Choi
 <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>, David Gow
 <davidgow@google.com>, <hersenxs.wu@amd.com>, <magalilemes00@gmail.com>
Subject: [PATCH v4 4/8] drm/amd/display: Introduce KUnit tests to the
 display_mode_vba library
Date: Fri, 26 Jan 2024 08:48:04 -0700
Message-ID: <20240126155022.1184856-5-Rodrigo.Siqueira@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|BL0PR12MB4994:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ce4cc1d-c8d8-4d5f-e439-08dc1e86aa59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7X8poANjSnzZIl8NqiA49pH/i1SeSs+Z2duMolQTFoRvrdxuIBLvcj7Ly/GF7PAruP+9SD+3fZeKJcKt48MvDRF1RIsMWVyy1cG+NBI1AjJLalMhVU7bC7/1pRLkQKMo1PjTPo8G9Qywfjx4pvTmG11M8RJ7js1orH+nWnqkZCRq5KeKmxDn1m9tvAf9NBO7Q7NoVo0nZLCziGLCkNHHUO4yucFRG0WyKJBb4i/LRlB7U6QoVZbRD4G4bQrbYhwW7Z41fmmEbdxOR97qTMETZkc+rZLwE2xvFgTfQJkzwBigqup//Vrf2hW1TY2/HR6viKYMn+IUExOun+o6n43w08V4WgoLW09OtvXC5uQkyyK+2WPdOKyFR2SlOCd0ftvrs+QNxvy4/g1xroEe5vCAWMsDMpBaf1llllqHiL7y8H4mC1q9VZ/d+hekS7Mde3HqtUnbxfsJcrpukSZEJ4rr/n1m55IIR2wfDOMVqKbMLYO+/ytuwWmlneVgjGnUNwtrI3GNyHXJCXBAnaG0V7FP8AnvuMfuZwptauoUyCqhF6ppoaKcBPSwoWDsfPSOlLT+MAoyIQ4YbY6O32mVSjxnF0rk8u48WRJ9LjfUFlgRL8LZ+NoRKhuITiPVmUF+1AtEFoq9tUDceYGMplTxaHyXKWnAhYpeinAXdHjhxQt2Hzxknw0fPgYJab/PIqyl9bjQBSzs5IvxpaVP1FophVfF1AYku5qiDN9KNTBMiK/mlDAQv8LKNY5znanzVPwzGaKTKf3zWjRVJ+owfpyUjjNa4CtirAc7gBuXgwNX0RX+kNI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(82310400011)(64100799003)(451199024)(186009)(1800799012)(40470700004)(36840700001)(46966006)(110136005)(70206006)(70586007)(86362001)(36860700001)(356005)(19627235002)(54906003)(316002)(478600001)(82740400003)(81166007)(16526019)(26005)(6666004)(2616005)(1076003)(4326008)(8676002)(8936002)(5660300002)(83380400001)(426003)(336012)(30864003)(7416002)(40460700003)(40480700001)(2906002)(36756003)(921011)(47076005)(41300700001)(66899024)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 15:51:30.9267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce4cc1d-c8d8-4d5f-e439-08dc1e86aa59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4994
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
Cc: tales.aparecida@gmail.com, Trevor Woerner <twoerner@gmail.com>,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maíra Canal <mairacanal@riseup.net>

The display_mode_vba library deals with hundreds of display parameters
and sometimes does it in odd ways. The addition of unit tests intends to
assure the quality of the code delivered by HW engineers and, also make
it possible to refactor the code decreasing concerns about adding bugs
to the codebase.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/tests/Makefile    |   5 +
 .../tests/dc/dml/display_mode_vba_test.c      | 741 ++++++++++++++++++
 2 files changed, 746 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/display_mode_vba_test.c

diff --git a/drivers/gpu/drm/amd/display/tests/Makefile b/drivers/gpu/drm/amd/display/tests/Makefile
index ef16497318e8..cc1e9edd38c3 100644
--- a/drivers/gpu/drm/amd/display/tests/Makefile
+++ b/drivers/gpu/drm/amd/display/tests/Makefile
@@ -7,6 +7,11 @@ ifdef CONFIG_AMD_DC_BASICS_KUNIT_TEST
 	DC_TESTS += dc/basics/fixpt31_32_test.o
 endif
 
+ifdef CONFIG_DML_KUNIT_TEST
+	CFLAGS_$(AMDDALPATH)/tests/dc/dml/display_mode_vba_test.o := $(dml_ccflags)
+	DC_TESTS += dc/dml/display_mode_vba_test.o
+endif
+
 AMD_DAL_DC_TESTS = $(addprefix $(AMDDALPATH)/tests/,$(DC_TESTS))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_DC_TESTS)
diff --git a/drivers/gpu/drm/amd/display/tests/dc/dml/display_mode_vba_test.c b/drivers/gpu/drm/amd/display/tests/dc/dml/display_mode_vba_test.c
new file mode 100644
index 000000000000..d3e3a9f50c3d
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/dc/dml/display_mode_vba_test.c
@@ -0,0 +1,741 @@
+// SPDX-License-Identifier: MIT
+/*
+ * KUnit tests for dml/display_mode_vba.h
+ *
+ * Copyright (C) 2022, Maíra Canal <mairacanal@riseup.net>
+ */
+
+#include <kunit/test.h>
+#include "dml/display_mode_lib.h"
+
+struct pixel_clock_adjustment_for_progressive_to_interlace_unit_expected {
+	const double pixel_clock[DC__NUM_DPP__MAX];
+	const double pixel_clock_backend[DC__NUM_DPP__MAX];
+};
+
+struct pixel_clock_adjustment_for_progressive_to_interlace_unit_test_case {
+	const char *desc;
+	const unsigned int number_of_active_planes;
+	const bool interlace[DC__NUM_DPP__MAX];
+	const bool progressive_to_interlace_unit_in_OPP;
+	const double pixel_clock[DC__NUM_DPP__MAX];
+	const struct pixel_clock_adjustment_for_progressive_to_interlace_unit_expected expected;
+};
+
+struct calculate_256B_block_sizes_test_case {
+	const char *desc;
+	const enum source_format_class source_pixel_format;
+	const enum dm_swizzle_mode surface_tiling;
+	const unsigned int byte_per_pixel_Y;
+	const unsigned int byte_per_pixel_C;
+	const unsigned int block_height_256_bytes_Y;
+	const unsigned int block_height_256_bytes_C;
+	const unsigned int block_width_256_bytes_Y;
+	const unsigned int block_width_256_bytes_C;
+};
+
+struct calculate_write_back_DISPCLK_test_case {
+	const char *desc;
+	const enum source_format_class writeback_pixel_format;
+	const double pixel_clock;
+	const double writeback_HRatio;
+	const double writeback_VRatio;
+	const unsigned int writeback_luma_HTaps;
+	const unsigned int writeback_luma_VTaps;
+	const unsigned int writeback_chroma_HTaps;
+	const unsigned int writeback_chroma_VTaps;
+	const double writeback_destination_width;
+	const unsigned int HTotal;
+	const unsigned int writeback_chroma_line_buffer_width;
+	const double calculate_write_back_DISPCLK;
+};
+
+/**
+ * pclk_adjustment_for_progressive_to_interlace_unit_test - KUnit test
+ * for PixelClockAdjustmentForProgressiveToInterlaceUnit
+ * @test: represents a running instance of a test.
+ */
+static void pclk_adjustment_for_progressive_to_interlace_unit_test(struct kunit *test)
+{
+	const struct pixel_clock_adjustment_for_progressive_to_interlace_unit_test_case
+		*test_param = test->param_value;
+	struct display_mode_lib *mode_lib;
+	size_t pixel_clock_size = DC__NUM_DPP__MAX * sizeof(const double);
+	size_t interlace_size = DC__NUM_DPP__MAX * sizeof(const bool);
+
+	mode_lib = kunit_kzalloc(test, sizeof(struct display_mode_lib),
+				 GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode_lib);
+
+	mode_lib->vba.NumberOfActivePlanes = test_param->number_of_active_planes;
+	memcpy(mode_lib->vba.Interlace, test_param->interlace, interlace_size);
+	mode_lib->vba.ProgressiveToInterlaceUnitInOPP =
+		test_param->progressive_to_interlace_unit_in_OPP;
+	memcpy(mode_lib->vba.PixelClock, test_param->pixel_clock, pixel_clock_size);
+
+	PixelClockAdjustmentForProgressiveToInterlaceUnit(mode_lib);
+
+	KUNIT_EXPECT_TRUE(test, !memcmp(mode_lib->vba.PixelClock,
+					test_param->expected.pixel_clock,
+					pixel_clock_size));
+	KUNIT_EXPECT_TRUE(test, !memcmp(mode_lib->vba.PixelClockBackEnd,
+					test_param->expected.pixel_clock_backend,
+					pixel_clock_size));
+}
+
+/**
+ * calculate_256B_block_sizes_test - KUnit test for Calculate256BBlockSizes
+ * @test: represents a running instance of a test.
+ */
+static void calculate_256B_block_sizes_test(struct kunit *test)
+{
+	const struct calculate_256B_block_sizes_test_case *test_param =
+		test->param_value;
+	unsigned int *block_height_256_bytes_Y, *block_height_256_bytes_C;
+	unsigned int *block_width_256_bytes_Y, *block_width_256_bytes_C;
+
+	block_height_256_bytes_Y = kunit_kzalloc(test, sizeof(unsigned int), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, block_height_256_bytes_Y);
+
+	block_height_256_bytes_C = kunit_kzalloc(test, sizeof(unsigned int), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, block_height_256_bytes_C);
+
+	block_width_256_bytes_Y = kunit_kzalloc(test, sizeof(unsigned int), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, block_width_256_bytes_Y);
+
+	block_width_256_bytes_C = kunit_kzalloc(test, sizeof(unsigned int), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, block_width_256_bytes_C);
+
+	Calculate256BBlockSizes(test_param->source_pixel_format,
+				test_param->surface_tiling,
+				test_param->byte_per_pixel_Y,
+				test_param->byte_per_pixel_C,
+				block_height_256_bytes_Y,
+				block_height_256_bytes_C,
+				block_width_256_bytes_Y,
+				block_width_256_bytes_C);
+
+	KUNIT_EXPECT_EQ(test, *block_height_256_bytes_Y,
+			test_param->block_height_256_bytes_Y);
+	KUNIT_EXPECT_EQ(test, *block_height_256_bytes_C,
+			test_param->block_height_256_bytes_C);
+	KUNIT_EXPECT_EQ(test, *block_width_256_bytes_Y,
+			test_param->block_width_256_bytes_Y);
+	KUNIT_EXPECT_EQ(test, *block_width_256_bytes_C,
+			test_param->block_width_256_bytes_C);
+}
+
+/**
+ * calculate_min_and_max_prefetch_mode_test - KUnit test for CalculateMinAndMaxPrefetchMode
+ * @test: represents a running instance of a test.
+ */
+static void calculate_min_and_max_prefetch_mode_test(struct kunit *test)
+{
+	unsigned int *min_prefetch_mode, *max_prefetch_mode;
+
+	min_prefetch_mode = kunit_kzalloc(test, sizeof(unsigned int), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, min_prefetch_mode);
+
+	max_prefetch_mode = kunit_kzalloc(test, sizeof(unsigned int), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, max_prefetch_mode);
+
+	/* Try to allow DRAM self-refresh and MCLK switch */
+	KUNIT_EXPECT_FALSE(test, CalculateMinAndMaxPrefetchMode
+			  (dm_try_to_allow_self_refresh_and_mclk_switch,
+			   min_prefetch_mode, max_prefetch_mode));
+	KUNIT_EXPECT_EQ(test, *min_prefetch_mode, 0);
+	KUNIT_EXPECT_EQ(test, *max_prefetch_mode, 2);
+
+	/* Allow DRAM self-refresh and MCLK switch */
+	KUNIT_EXPECT_FALSE(test, CalculateMinAndMaxPrefetchMode
+			  (dm_allow_self_refresh_and_mclk_switch,
+			   min_prefetch_mode, max_prefetch_mode));
+	KUNIT_EXPECT_EQ(test, *min_prefetch_mode, 0);
+	KUNIT_EXPECT_EQ(test, *max_prefetch_mode, 0);
+
+	/* Allow only DRAM self-refresh  */
+	KUNIT_EXPECT_FALSE(test, CalculateMinAndMaxPrefetchMode
+			  (dm_allow_self_refresh,
+			   min_prefetch_mode, max_prefetch_mode));
+	KUNIT_EXPECT_EQ(test, *min_prefetch_mode, 1);
+	KUNIT_EXPECT_EQ(test, *max_prefetch_mode, 1);
+
+	/* Allow neither DRAM self-refresh nor MCLK switch */
+	KUNIT_EXPECT_FALSE(test, CalculateMinAndMaxPrefetchMode
+			  (dm_neither_self_refresh_nor_mclk_switch,
+			   min_prefetch_mode, max_prefetch_mode));
+	KUNIT_EXPECT_EQ(test, *min_prefetch_mode, 2);
+	KUNIT_EXPECT_EQ(test, *max_prefetch_mode, 2);
+
+	/* Invalid self-refresh affinity */
+	KUNIT_EXPECT_TRUE(test, CalculateMinAndMaxPrefetchMode(-1,
+							       min_prefetch_mode,
+							       max_prefetch_mode));
+	KUNIT_EXPECT_EQ(test, *min_prefetch_mode, 0);
+	KUNIT_EXPECT_EQ(test, *max_prefetch_mode, 2);
+}
+
+/**
+ * calculate_write_back_DISPCLK_test - KUnit test for CalculateWriteBackDISPCLK
+ * @test: represents a running instance of a test.
+ */
+static void calculate_write_back_DISPCLK_test(struct kunit *test)
+{
+	const struct calculate_write_back_DISPCLK_test_case *test_param = test->param_value;
+	double calculate_write_back_DISPCLK;
+
+	DC_FP_START();
+	calculate_write_back_DISPCLK = CalculateWriteBackDISPCLK
+		(test_param->writeback_pixel_format,
+		 test_param->pixel_clock, test_param->writeback_HRatio,
+		 test_param->writeback_VRatio, test_param->writeback_luma_HTaps,
+		 test_param->writeback_luma_VTaps, test_param->writeback_chroma_HTaps,
+		 test_param->writeback_chroma_VTaps,
+		 test_param->writeback_destination_width, test_param->HTotal,
+		 test_param->writeback_chroma_line_buffer_width);
+	DC_FP_END();
+
+	KUNIT_EXPECT_EQ(test, test_param->calculate_write_back_DISPCLK,
+			calculate_write_back_DISPCLK);
+}
+
+static const struct pixel_clock_adjustment_for_progressive_to_interlace_unit_test_case
+pixel_clock_adjustment_for_progressive_to_interlace_unit_cases[] = {
+	{
+		.desc = "No active planes",
+		.number_of_active_planes = 0,
+		.interlace = {false, false, false, false, false, false, false, false},
+		.progressive_to_interlace_unit_in_OPP = false,
+		.pixel_clock = {0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00},
+		.expected = {
+			.pixel_clock = {0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00},
+			.pixel_clock_backend = {0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00},
+		},
+	},
+	{
+		.desc = "Two active planes with no interlaced output",
+		.number_of_active_planes = 2,
+		.interlace = {false, false, false, false, false, false, false, false},
+		.progressive_to_interlace_unit_in_OPP = true,
+		.pixel_clock = {3200.00, 1360.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00},
+		.expected = {
+			.pixel_clock = {3200.00, 1360.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00},
+			.pixel_clock_backend = {3200.00, 1360.00, 0.00, 0.00, 0.00, 0.00,
+				0.00, 0.00},
+		},
+	},
+	{
+		.desc = "Three active planes with one interlaced plane",
+		.number_of_active_planes = 3,
+		.interlace = {false, true, false, false, false, false, false, false},
+		.progressive_to_interlace_unit_in_OPP = true,
+		.pixel_clock = {3200.00, 1360.00, 400.00, 0.00, 0.00, 0.00, 0.00, 0.00},
+		.expected = {
+			.pixel_clock = {3200.00, 2720.00, 400.00, 0.00,
+				0.00, 0.00, 0.00, 0.00},
+			.pixel_clock_backend = {3200.00, 1360.00, 400.00, 0.00,
+				0.00, 0.00, 0.00, 0.00},
+		},
+	},
+	{
+		.desc = "Five active planes with three interlaced planes",
+		.number_of_active_planes = 5,
+		.interlace = {false, true, false, true, true, false, false, false},
+		.progressive_to_interlace_unit_in_OPP = true,
+		.pixel_clock = {3200.00, 1360.00, 400.00, 340.00, 680.00, 0.00, 0.00, 0.00},
+		.expected = {
+			.pixel_clock = {3200.00, 2720.00, 400.00, 680.00,
+				1360.00, 0.00, 0.00, 0.00},
+			.pixel_clock_backend = {3200.00, 1360.00, 400.00, 340.00,
+				680.00, 0.00, 0.00, 0.00},
+		},
+	},
+	{
+		.desc = "Eight active planes with five interlaced planes",
+		.number_of_active_planes = 8,
+		.interlace = {true, true, false, true, true, false, true, false},
+		.progressive_to_interlace_unit_in_OPP = true,
+		.pixel_clock = {3200.00, 1360.00, 400.00, 340.00, 680.00, 1360.00, 2720.00, 340.00},
+		.expected = {
+			.pixel_clock = {6400.00, 2720.00, 400.00, 680.00,
+				1360.00, 1360.00, 5440.00, 340.00},
+			.pixel_clock_backend = {3200.00, 1360.00, 400.00, 340.00,
+				680.00, 1360.00, 2720.00, 340.0},
+		},
+	},
+	{
+		.desc = "Eight active planes with all planes interlaced",
+		.number_of_active_planes = 8,
+		.interlace = {true, true, true, true, true, true, true, true},
+		.progressive_to_interlace_unit_in_OPP = true,
+		.pixel_clock = {3200.00, 1360.00, 400.00, 340.00, 680.00, 1360.00, 2720.00, 340.00},
+		.expected = {
+			.pixel_clock = {6400.00, 2720.00, 800.0, 680.00,
+				1360.00, 2720.00, 5440.0, 680.00},
+			.pixel_clock_backend = {3200.00, 1360.00, 400.00, 340.00,
+				680.00, 1360.00, 2720.00, 340.00},
+		},
+	},
+	{
+		.desc = "Eight active planes with no interlaced plane",
+		.number_of_active_planes = 8,
+		.interlace = {false, false, false, false, false, false, false, false},
+		.progressive_to_interlace_unit_in_OPP = false,
+		.pixel_clock = {3200.00, 1360.00, 400.00, 340.00, 680.00, 1360.00, 2720.00, 340.00},
+		.expected = {
+			.pixel_clock = {3200.00, 1360.00, 400.00, 340.00,
+				680.00, 1360.00, 2720.00, 340.00},
+			.pixel_clock_backend = {3200.00, 1360.00, 400.00, 340.00,
+				680.00, 1360.00, 2720.00, 340.00},
+		},
+	},
+	{
+		.desc = "Eight active planes with no progressive_to_interlace_unit_in_OPP",
+		.number_of_active_planes = 8,
+		.interlace = {true, true, true, true, true, true, true, true},
+		.progressive_to_interlace_unit_in_OPP = false,
+		.pixel_clock = {3200.00, 1360.00, 400.00, 340.00, 680.00, 1360.00, 2720.00, 340.00},
+		.expected = {
+			.pixel_clock = {3200.00, 1360.00, 400.00, 340.00,
+				680.00, 1360.00, 2720.00, 340.00},
+			.pixel_clock_backend = {3200.00, 1360.00, 400.00, 340.00,
+				680.00, 1360.00, 2720.00, 340.00},
+		},
+	},
+};
+
+static const struct calculate_256B_block_sizes_test_case calculate_256B_block_sizes_cases[] = {
+	/*
+	 * Here 16-bit specifies the number of bits in the horizontal 4-element region
+	 * used for subsampling
+	 */
+	{
+		.desc = "4:4:4 16-bit encoding with linear swizzle",
+		.source_pixel_format = dm_444_16,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 2,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 128,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "4:4:4 16-bit encoding with 256B standard swizzle",
+		.source_pixel_format = dm_444_16,
+		.surface_tiling = dm_sw_256b_s,
+		.byte_per_pixel_Y = 2,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 8,
+		.block_width_256_bytes_Y = 16,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	/*
+	 * Here 32-bit specifies the number of bits in the horizontal
+	 * 4-element region used for subsampling
+	 */
+	{
+		.desc = "4:4:4 32-bit encoding with linear swizzle",
+		.source_pixel_format = dm_444_32,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 4,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 64,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "4:4:4 32-bit encoding with 256B display swizzle",
+		.source_pixel_format = dm_444_32,
+		.surface_tiling = dm_sw_256b_d,
+		.byte_per_pixel_Y = 4,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 8,
+		.block_width_256_bytes_Y = 8,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	/*
+	 * Here 64-bit specifies the number of bits in the horizontal 4-element region
+	 * used for subsampling
+	 */
+	{
+		.desc = "4:4:4 64-bit encoding with linear swizzle",
+		.source_pixel_format = dm_444_64,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 8,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 32,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "4:4:4 64-bit encoding with 4KB standard swizzle",
+		.source_pixel_format = dm_444_64,
+		.surface_tiling = dm_sw_4kb_s,
+		.byte_per_pixel_Y = 8,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 4,
+		.block_width_256_bytes_Y = 8,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "4:4:4 8-bit encoding with linear swizzle",
+		.source_pixel_format = dm_444_8,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 1,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 256,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "4:4:4 8-bit encoding with 4KB display swizzle",
+		.source_pixel_format = dm_444_8,
+		.surface_tiling = dm_sw_4kb_d,
+		.byte_per_pixel_Y = 1,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 16,
+		.block_width_256_bytes_Y = 16,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "8-bit mono encoding with linear swizzle",
+		.source_pixel_format = dm_mono_8,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 1,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 256,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "8-bit mono encoding with 64KB standard swizzle",
+		.source_pixel_format = dm_mono_8,
+		.surface_tiling = dm_sw_64kb_s,
+		.byte_per_pixel_Y = 1,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 16,
+		.block_width_256_bytes_Y = 16,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "16-bit mono encoding with linear swizzle",
+		.source_pixel_format = dm_mono_16,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 2,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 128,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "16-bit mono encoding with 64KB display swizzle",
+		.source_pixel_format = dm_mono_16,
+		.surface_tiling = dm_sw_64kb_d,
+		.byte_per_pixel_Y = 2,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 8,
+		.block_width_256_bytes_Y = 16,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "8-bit 4:2:0 encoding with linear swizzle",
+		.source_pixel_format = dm_420_8,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 1,
+		.byte_per_pixel_C = 2,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 256,
+		.block_height_256_bytes_C = 1,
+		.block_width_256_bytes_C = 128,
+	},
+	{
+		.desc = "8-bit 4:2:0 encoding with VAR standard swizzle",
+		.source_pixel_format = dm_420_8,
+		.surface_tiling = dm_sw_var_s,
+		.byte_per_pixel_Y = 1,
+		.byte_per_pixel_C = 2,
+		.block_height_256_bytes_Y = 16,
+		.block_width_256_bytes_Y = 16,
+		.block_height_256_bytes_C = 8,
+		.block_width_256_bytes_C = 16,
+	},
+	{
+		.desc = "10-bit 4:2:0 encoding with linear swizzle",
+		.source_pixel_format = dm_420_10,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 4.0 / 3.0,
+		.byte_per_pixel_C = 8.0 / 3.0,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 256,
+		.block_height_256_bytes_C = 1,
+		.block_width_256_bytes_C = 128,
+	},
+	{
+		.desc = "10-bit 4:2:0 encoding with VAR display swizzle",
+		.source_pixel_format = dm_420_10,
+		.surface_tiling = dm_sw_var_d,
+		.byte_per_pixel_Y = 4.0 / 3.0,
+		.byte_per_pixel_C = 8.0 / 3.0,
+		.block_height_256_bytes_Y = 8,
+		.block_width_256_bytes_Y = 32,
+		.block_height_256_bytes_C = 8,
+		.block_width_256_bytes_C = 16,
+	},
+};
+
+static const struct calculate_write_back_DISPCLK_test_case calculate_write_back_DISPCLK_cases[] = {
+	{
+		.desc = "Trivial test",
+		.writeback_pixel_format = dm_444_32,
+		.pixel_clock = 0.00,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 4,
+		.writeback_luma_VTaps = 4,
+		.writeback_chroma_HTaps = 5,
+		.writeback_chroma_VTaps = 5,
+		.writeback_destination_width = 2400.0,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 2,
+		.calculate_write_back_DISPCLK = 0,
+	},
+	{
+		.desc = "Simple Writeback Ratio",
+		.writeback_pixel_format = dm_444_32,
+		.pixel_clock = 1800.00,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 4,
+		.writeback_luma_VTaps = 4,
+		.writeback_chroma_HTaps = 5,
+		.writeback_chroma_VTaps = 5,
+		.writeback_destination_width = 2400.0,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 2,
+		.calculate_write_back_DISPCLK = 0x1.e7c6a11ep+11,
+	},
+	{
+		.desc = "Non-integer WritebackVRatio with same number of Luma and Chroma taps",
+		.writeback_pixel_format = dm_444_32,
+		.pixel_clock = 1360.00,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.5,
+		.writeback_luma_HTaps = 7,
+		.writeback_luma_VTaps = 7,
+		.writeback_chroma_HTaps = 7,
+		.writeback_chroma_VTaps = 7,
+		.writeback_destination_width = 400.56,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 4,
+		.calculate_write_back_DISPCLK = 0x1.5766666666666p+11,
+	},
+	{
+		.desc = "No Writeback to Chroma Taps",
+		.writeback_pixel_format = dm_444_32,
+		.pixel_clock = 2720.72,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.5,
+		.writeback_luma_HTaps = 5,
+		.writeback_luma_VTaps = 5,
+		.writeback_chroma_HTaps = 0,
+		.writeback_chroma_VTaps = 0,
+		.writeback_destination_width = 2400.0,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 4,
+		.calculate_write_back_DISPCLK = 0x1.ba5e02226985ep+12,
+	},
+	{
+		.desc = "No Writeback to Luma Taps",
+		.writeback_pixel_format = dm_444_32,
+		.pixel_clock = 1800.66,
+		.writeback_HRatio = 2.0,
+		.writeback_VRatio = 1.5,
+		.writeback_luma_HTaps = 0,
+		.writeback_luma_VTaps = 0,
+		.writeback_chroma_HTaps = 3,
+		.writeback_chroma_VTaps = 3,
+		.writeback_destination_width = 2400.0,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 4,
+		.calculate_write_back_DISPCLK = 0x1.85b6dabefdfd9p+11,
+	},
+	{
+		.desc = "Reduce numeric error by decreasing pixel clock",
+		.writeback_pixel_format = dm_444_32,
+		.pixel_clock = 400.756,
+		.writeback_HRatio = 2.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 5,
+		.writeback_luma_VTaps = 5,
+		.writeback_chroma_HTaps = 5,
+		.writeback_chroma_VTaps = 5,
+		.writeback_destination_width = 2400.0,
+		.HTotal = 1100,
+		.writeback_chroma_line_buffer_width = 2,
+		.calculate_write_back_DISPCLK = 0x1.4bb8ddb60f598p+10,
+	},
+	{
+		.desc = "Increase numeric error by increasing pixel clock",
+		.writeback_pixel_format = dm_444_32,
+		.pixel_clock = 3200.8,
+		.writeback_HRatio = 2.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 4,
+		.writeback_luma_VTaps = 4,
+		.writeback_chroma_HTaps = 2,
+		.writeback_chroma_VTaps = 2,
+		.writeback_destination_width = 1686.7,
+		.HTotal = 1100,
+		.writeback_chroma_line_buffer_width = 2,
+		.calculate_write_back_DISPCLK = 0x1.847ced698147bp+12,
+	},
+	{
+		.desc = "Simple Writeback Ratio for 4:4:4 8-bit encoding",
+		.writeback_pixel_format = dm_444_8,
+		.pixel_clock = 1800.00,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 4,
+		.writeback_luma_VTaps = 4,
+		.writeback_chroma_HTaps = 5,
+		.writeback_chroma_VTaps = 5,
+		.writeback_destination_width = 2400.0,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 2,
+		.calculate_write_back_DISPCLK = 0x1.24aa62p+12,
+	},
+	{
+		.desc = "Non-integer WritebackVRatio with same number of Luma and Chroma taps for 4:4:4 64-bit encoding",
+		.writeback_pixel_format = dm_444_64,
+		.pixel_clock = 1360.00,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.5,
+		.writeback_luma_HTaps = 7,
+		.writeback_luma_VTaps = 7,
+		.writeback_chroma_HTaps = 7,
+		.writeback_chroma_VTaps = 7,
+		.writeback_destination_width = 400.56,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 4,
+		.calculate_write_back_DISPCLK = 0x1.576666p+11,
+	},
+	{
+		.desc = "No Writeback to Chroma Taps for 4:2:0 8-bit encoding",
+		.writeback_pixel_format = dm_420_8,
+		.pixel_clock = 2720.72,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.5,
+		.writeback_luma_HTaps = 8,
+		.writeback_luma_VTaps = 8,
+		.writeback_chroma_HTaps = 0,
+		.writeback_chroma_VTaps = 0,
+		.writeback_destination_width = 1333.56,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 5,
+		.calculate_write_back_DISPCLK = 0x1.717f8p+12,
+	},
+	{
+		.desc = "No Writeback to Luma Taps for 4:2:0 10-bit encoding",
+		.writeback_pixel_format = dm_420_10,
+		.pixel_clock = 1800.66,
+		.writeback_HRatio = 2.0,
+		.writeback_VRatio = 1.5,
+		.writeback_luma_HTaps = 0,
+		.writeback_luma_VTaps = 0,
+		.writeback_chroma_HTaps = 3,
+		.writeback_chroma_VTaps = 3,
+		.writeback_destination_width = 996.0,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 4,
+		.calculate_write_back_DISPCLK = 0x1.43767ep+10,
+	},
+	{
+		.desc = "Reduce numeric error by decreasing pixel clock for 4:4:4 16-bit encoding",
+		.writeback_pixel_format = dm_444_16,
+		.pixel_clock = 340.456,
+		.writeback_HRatio = 2.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 5,
+		.writeback_luma_VTaps = 5,
+		.writeback_chroma_HTaps = 5,
+		.writeback_chroma_VTaps = 5,
+		.writeback_destination_width = 2400.0,
+		.HTotal = 1181,
+		.writeback_chroma_line_buffer_width = 3,
+		.calculate_write_back_DISPCLK = 0x1.067b3p+10,
+	},
+	{
+		.desc = "Increase numeric error by increasing pixel clock for 4:4:4 16-bit encoding",
+		.writeback_pixel_format = dm_444_16,
+		.pixel_clock = 4000.92,
+		.writeback_HRatio = 2.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 3,
+		.writeback_luma_VTaps = 3,
+		.writeback_chroma_HTaps = 2,
+		.writeback_chroma_VTaps = 2,
+		.writeback_destination_width = 1686.7,
+		.HTotal = 1100,
+		.writeback_chroma_line_buffer_width = 2,
+		.calculate_write_back_DISPCLK = 0x1.84b5b8p+12,
+	},
+};
+
+static void pixel_clock_adjustment_for_progressive_to_interlace_unit_test_to_desc
+(const struct pixel_clock_adjustment_for_progressive_to_interlace_unit_test_case *t,
+	char *desc)
+{
+	strcpy(desc, t->desc);
+}
+
+KUNIT_ARRAY_PARAM(pixel_clock_adjustment_for_progressive_to_interlace_unit,
+		  pixel_clock_adjustment_for_progressive_to_interlace_unit_cases,
+		  pixel_clock_adjustment_for_progressive_to_interlace_unit_test_to_desc);
+
+static void calculate_256B_block_sizes_test_to_desc
+(const struct calculate_256B_block_sizes_test_case *t, char *desc)
+{
+	strcpy(desc, t->desc);
+}
+
+KUNIT_ARRAY_PARAM(calculate_256B_block_sizes, calculate_256B_block_sizes_cases,
+		  calculate_256B_block_sizes_test_to_desc);
+
+static void calculate_write_back_DISPCLK_test_to_desc(const struct
+		calculate_write_back_DISPCLK_test_case * t, char *desc)
+{
+	strcpy(desc, t->desc);
+}
+
+KUNIT_ARRAY_PARAM(calculate_write_back_DISPCLK, calculate_write_back_DISPCLK_cases,
+		  calculate_write_back_DISPCLK_test_to_desc);
+
+static struct kunit_case display_mode_vba_test_cases[] = {
+	KUNIT_CASE_PARAM(pclk_adjustment_for_progressive_to_interlace_unit_test,
+			 pixel_clock_adjustment_for_progressive_to_interlace_unit_gen_params),
+	KUNIT_CASE_PARAM(calculate_256B_block_sizes_test,
+			 calculate_256B_block_sizes_gen_params),
+	KUNIT_CASE(calculate_min_and_max_prefetch_mode_test),
+	KUNIT_CASE_PARAM(calculate_write_back_DISPCLK_test,
+			 calculate_write_back_DISPCLK_gen_params),
+	{}
+};
+
+static struct kunit_suite display_mode_vba_test_suite = {
+	.name = "dml_display_mode_vba",
+	.test_cases = display_mode_vba_test_cases,
+};
+
+kunit_test_suite(display_mode_vba_test_suite);
-- 
2.43.0

