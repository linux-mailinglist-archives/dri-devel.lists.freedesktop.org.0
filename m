Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB1183DDFB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 16:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D4610FBDD;
	Fri, 26 Jan 2024 15:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2041.outbound.protection.outlook.com [40.107.95.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373F310FBDF;
 Fri, 26 Jan 2024 15:51:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlfWYX7R2jKC0klCsRRLy2p5vNCwUNJSsiBnI63Z+NMjHivXVEjN/JcNZyaoqHAm+znJsPEfjIU1eKkKtIYj0+nUDbIeMl8zNP9jKENayOkLrD03fSfuFPsNMEJmk+HFaTNV8bKOaECJl0TppnsjxxA2HIeWZBV7H6p1xGjjQU45678cnFtNCfcaRPhHKa3wRavlpxx+UN+CNeXXXaEf+GPDtgobmMuUvYQLC0f9qOPGYiIrv4H9YNm71cBqDe7mFRRC/18NLPLOI/pDgza705047FlmwH6g3e1POB6X+nLcCH6ENfziQTZaxiDf6cwZwRFvqjZADAHbsOvKgA1/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fN/5aNfC9JxG/zdJCDq/JT8RYgv+ff2R5BBQPJJ4uY=;
 b=R7zOSDjDoCD4pW4vOE/gsi/c3w4KdNQMAACXciHQOIkq+zCgg2+jH2sNH6kMp4BBED9K6aDhMR5kMnz+zTGsKrZgkAdocI1NeTXtDfm40fd349d13SyNdivsWkPlL+iC0+dxu5IYizs9qeLhgixYnQiOVmyF5VWZ3I7pIWeoANMzxXDZJJFS6bBOkzspg6aRHCp0iexXLQiuG+Bb2aly+nhPjjOytL9kiXyVY3PAD3iurZfDZpttlRzYA4spKQcYlIbgSLRe97GSwumxBqEUxPm1Bc2UUk/z28y/fIiNN+E4yP9+Bl083FSXVL6B+riJIQ4DLu1PX+oZ5HRAPXNfrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fN/5aNfC9JxG/zdJCDq/JT8RYgv+ff2R5BBQPJJ4uY=;
 b=Dxk+dVxZbpY6Gwy4ywMLjLmfjAiVrMQrHGiLyzmJpYDVqKPoD2IlkJYr2AmV1Z/wbP8ZtSmdGtjT/7/2ViL0zBxkTX4p0dArK4RJ8mdZTm1s6iUVfNIy+yol41SuWr/tspw67jzoVBKyuI1uAHDKSoflgGETjaF4nKy26/bPfT8=
Received: from SJ0PR03CA0086.namprd03.prod.outlook.com (2603:10b6:a03:331::31)
 by DS0PR12MB7557.namprd12.prod.outlook.com (2603:10b6:8:130::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 15:51:34 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::4a) by SJ0PR03CA0086.outlook.office365.com
 (2603:10b6:a03:331::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Fri, 26 Jan 2024 15:51:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 26 Jan 2024 15:51:33 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 26 Jan
 2024 09:51:29 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, Nicholas Choi
 <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>, David Gow
 <davidgow@google.com>, <hersenxs.wu@amd.com>, <magalilemes00@gmail.com>
Subject: [PATCH v4 5/8] drm/amd/display: Introduce KUnit to
 dcn20/display_mode_vba_20 library
Date: Fri, 26 Jan 2024 08:48:05 -0700
Message-ID: <20240126155022.1184856-6-Rodrigo.Siqueira@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|DS0PR12MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: da497d78-074f-4ff4-cc1a-08dc1e86abf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lb038lHlPiuE094OfGLrOnMV/oYRVCctRWelVIwGxbZLniGJ3D0IeYrTeO5CCoykIBBOde/Nv+RtGhVTyFLkUK6AWKcu5kEe3X+NXmlUZt5kZ3OGu/7dCapFbIeAKG+dMwt6CbyQ/XM18t9WzmgCwa+7WQHR4BTArmzXLHSax0p1wTZfEmXFYS57zakudtQiUPvgUZ3WnDswM8rAieUSK0F6bejrPPN1mffJWH/aV82vYv3LC5ZSlQwxQZIkp1WmnM7EWsTZECudIuDsSEs8IkR6cuF8HE4BO98r1j2no6p7Is7gn6jcOqHpKLoZBboYlSOT0P1PhybTt2sOed9XMMMrr+pVS9oCaMCqGSDIeQ/rpUPIeT1HyypxzQTcouO/AB65yeOcWkhrYNIZwhdwWSEGE3KT86rNgIQMQW1Pw+IDrwg+fs5Y44sy7CP4VNv038ntfDU/uFzk1o2aJS1N8bWFry8/YpZf1dBIfunGsXK1SX60muanuklqWwinnpx5X0UzloSh3+qK3gJ+vW5mSLxUS/XbuZ565DbloPtgVPdI1YMh6BCN5wA5WsXJVxRqdM60r4xwvdTy2qmJr46kHSPgAArSSwV8xrrKzzbukRfM+YUsnALCNR1btFOFL4r1gMlF+5s9lahLBrQFLrSHkHSf/ka+E7xrfqRi43Oiw++1tn5MPwzIOAITBUiPVxxcugKp4ZPZTrVMU//IrsyGlFu3uIeSWpyAN41YSm0sq+ODGysqw1vA7IlbRMMZZHyuynOWwFUBC7PECneDToQvUM52P9i2HxQVdf1MRg7TCfw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(82310400011)(36840700001)(40470700004)(46966006)(921011)(66899024)(47076005)(316002)(70206006)(70586007)(2616005)(54906003)(478600001)(7416002)(110136005)(83380400001)(5660300002)(2906002)(30864003)(82740400003)(36860700001)(8676002)(4326008)(8936002)(6666004)(66574015)(336012)(1076003)(426003)(16526019)(26005)(86362001)(36756003)(41300700001)(356005)(40460700003)(40480700001)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 15:51:33.6615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da497d78-074f-4ff4-cc1a-08dc1e86abf8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7557
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

The display_mode_vba_20 deals with hundreds of display parameters for
the DCN20 and sometimes does it in odd ways. The addition of unit tests
intends to assure the quality of the code delivered by HW engineers and,
also make it possible to refactor the code decreasing concerns about adding
bugs to the codebase.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 .../dc/dml/dcn20/display_mode_vba_20.c        |   4 +
 .../dc/dml/dcn20/display_mode_vba_20_test.c   | 888 ++++++++++++++++++
 2 files changed, 892 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_mode_vba_20_test.c

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
index 7bf4bb7ad044..29ef47028630 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
@@ -5116,3 +5116,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 				locals->OutputBppPerState[mode_lib->vba.VoltageLevel][k];
 	}
 }
+
+#if IS_ENABLED(CONFIG_DML_KUNIT_TEST)
+#include "../../tests/dc/dml/dcn20/display_mode_vba_20_test.c"
+#endif
diff --git a/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_mode_vba_20_test.c b/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_mode_vba_20_test.c
new file mode 100644
index 000000000000..eeeacc2758a3
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_mode_vba_20_test.c
@@ -0,0 +1,888 @@
+// SPDX-License-Identifier: MIT
+/*
+ * KUnit tests for dml/dcn20/display_mode_vba_20.c
+ *
+ * Copyright (C) 2022, Maíra Canal <mairacanal@riseup.net>
+ */
+
+#include <kunit/test.h>
+#include "dml/display_mode_enums.h"
+
+struct calculate_write_back_delay_test_case {
+	const char *desc;
+	const enum source_format_class writeback_pixel_format;
+	const double writeback_HRatio;
+	const double writeback_VRatio;
+	const unsigned int writeback_luma_HTaps;
+	const unsigned int writeback_luma_VTaps;
+	const unsigned int writeback_chroma_HTaps;
+	const unsigned int writeback_chroma_VTaps;
+	const unsigned int writeback_destination_width;
+	const double calculate_write_back_delay;
+};
+
+struct calculate_active_row_bandwidth_test_case {
+	const char *desc;
+	const bool GPUVM_enable;
+	const enum source_format_class source_pixel_format;
+	const double VRatio;
+	const bool DCC_enable;
+	const double line_time;
+	const unsigned int meta_row_byte_luma;
+	const unsigned int meta_row_byte_chroma;
+	const unsigned int meta_row_height_luma;
+	const unsigned int meta_row_height_chroma;
+	const unsigned int pixel_PTE_bytes_per_row_luma;
+	const unsigned int pixel_PTE_bytes_per_row_chroma;
+	const unsigned int dpte_row_height_luma;
+	const unsigned int dpte_row_height_chroma;
+	const double meta_row_bw;
+	const double dpte_row_bw;
+	const double qual_row_bw;
+};
+
+/**
+ * dscce_compute_delay_test - KUnit test for dscceComputeDelay
+ * @test: represents a running instance of a test.
+ */
+static void dscce_compute_delay_test(struct kunit *test)
+{
+	/* Testing all the valid values for bits per color (bpc): {8, 10, 12} */
+	/* Testing all the valid values for number of slices: {1, 2, 3, 4} */
+
+	/*
+	 * For 4:4:4 encoding, the minimum bpp value is 8 and is incremented by
+	 * 1/16 of a bit. Moreover, the sliceWidth must be less than or equal to
+	 * 5184/numSlices.
+	 */
+
+	/* Minimum sliceWidth value on 4:4:4 encoding */
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(8, 8.0, 1, 1, dm_444), 2004);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(8, 8.0625, 5184, 1, dm_444), 885);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(10, 8.125, 2592, 2, dm_444), 3495);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(10, 8.1875, 1728, 3, dm_444), 4356);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(12, 8.25, 864, 3, dm_444), 4425);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(12, 8.3125, 1296, 4, dm_444), 4854);
+
+	/*
+	 * For 4:2:0 encoding, the minimum bpp value is 6 and is incremented by
+	 * 1/16 of a bit. Moreover, the sliceWidth must be less than or equal to
+	 * 4096/numSlices.
+	 */
+
+	/* Minimum sliceWidth value on 4:2:0 encoding */
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(8, 6.0, 2, 1, dm_420), 2982);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(8, 6.0625, 4096, 1, dm_420), 1428);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(10, 6.125, 2048, 2, dm_420), 3522);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(10, 6.1875, 1365, 3, dm_420), 4200);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(12, 6.25, 682, 3, dm_420), 5706);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(12, 6.3125, 1024, 4, dm_420), 7746);
+
+	/*
+	 * For 4:2:2 encoding, the minimum bpp value is 7 and is incremented by
+	 * 1/16 of a bit. Moreover, the sliceWidth must be less than or equal to
+	 * 5184/numSlices.
+	 */
+
+	/* Minimum sliceWidth value on n-4:2:2 encoding */
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(8, 7.0, 2, 1, dm_n422), 2694);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(8, 7.0625, 5184, 1, dm_n422), 1332);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(10, 7.125, 2592, 2, dm_n422), 3966);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(10, 7.1875, 1728, 3, dm_n422), 4824);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(12, 7.25, 864, 3, dm_n422), 4962);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(12, 7.3125, 1296, 4, dm_n422), 9282);
+
+	/* Minimum sliceWidth value on s-4:2:2 encoding */
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(8, 7.0, 1, 1, dm_s422), 2226);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(8, 7.0625, 5184, 1, dm_s422), 960);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(10, 7.125, 2592, 2, dm_s422), 3570);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(10, 7.1875, 1728, 3, dm_s422), 4428);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(12, 7.25, 864, 3, dm_s422), 4497);
+
+	KUNIT_EXPECT_EQ(test, dscceComputeDelay(12, 7.3125, 1296, 4, dm_s422), 4923);
+}
+
+/**
+ * DSC_compute_delay_test - KUnit test for dscComputeDelay
+ * @test: represents a running instance of a test.
+ */
+static void DSC_compute_delay_test(struct kunit *test)
+{
+	/* 4:4:4 encoding */
+	KUNIT_EXPECT_EQ(test, dscComputeDelay(dm_444), 30);
+
+	/* 4:2:0 encoding */
+	KUNIT_EXPECT_EQ(test, dscComputeDelay(dm_420), 48);
+
+	/* 4:2:2 n-encoding */
+	KUNIT_EXPECT_EQ(test, dscComputeDelay(dm_n422), 49);
+
+	/* 4:2:2 s-encoding */
+	KUNIT_EXPECT_EQ(test, dscComputeDelay(dm_s422), 30);
+}
+
+/**
+ * calculate_TWait_test - KUnit test for CalculateTWait
+ * @test: represents a running instance of a test.
+ */
+static void calculate_TWait_test(struct kunit *test)
+{
+	/* Zeroed Prefetch Mode */
+
+	/* DRAMClockChangeLatency > UrgentLatencyPixelDataOnly > SREnterPlusExitTime*/
+	KUNIT_EXPECT_EQ(test, CalculateTWait(0, 1300000, 1200000, 1000000), 2500000);
+
+	/* DRAMClockChangeLatency > SREnterPlusExitTime > UrgentLatencyPixelDataOnly */
+	KUNIT_EXPECT_EQ(test, CalculateTWait(0, 1300000, 900000, 1200000), 2200000);
+
+	/* UrgentLatencyPixelDataOnly > DRAMClockChangeLatency > SREnterPlusExitTime */
+	KUNIT_EXPECT_EQ(test, CalculateTWait(0, 1000000, 2000000, 900000), 3000000);
+
+	/* UrgentLatencyPixelDataOnly > SREnterPlusExitTime > DRAMClockChangeLatency */
+	KUNIT_EXPECT_EQ(test, CalculateTWait(0, 1000000, 1200000, 1100000), 2200000);
+
+	/* SREnterPlusExitTime > DRAMClockChangeLatency > UrgentLatencyPixelDataOnly */
+	KUNIT_EXPECT_EQ(test, CalculateTWait(0, 1000000, 900000, 2000000), 2000000);
+
+	/* SREnterPlusExitTime > UrgentLatencyPixelDataOnly > DRAMClockChangeLatency */
+	KUNIT_EXPECT_EQ(test, CalculateTWait(0, 1000000, 1200000, 1300000), 2200000);
+
+	/* Prefetch Mode equals 1 */
+	KUNIT_EXPECT_EQ(test, CalculateTWait(1, 2500000, 2000000, 900000), 2000000);
+	KUNIT_EXPECT_EQ(test, CalculateTWait(1, 1300000, 900000, 1200000), 1200000);
+	KUNIT_EXPECT_EQ(test, CalculateTWait(1, 1100000, 1200000, 1000000), 1200000);
+	KUNIT_EXPECT_EQ(test, CalculateTWait(1, 1000000, 1200000, 1100000), 1200000);
+	KUNIT_EXPECT_EQ(test, CalculateTWait(1, 1000000, 900000, 2000000), 2000000);
+	KUNIT_EXPECT_EQ(test, CalculateTWait(1, 1000000, 1200000, 1300000), 1300000);
+
+	/* Prefetch Mode greater than 1 */
+	KUNIT_EXPECT_EQ(test, CalculateTWait(1, 2500000, 2000000, 900000), 2000000);
+	KUNIT_EXPECT_EQ(test, CalculateTWait(2, 2500000, 900000, 2000000), 900000);
+	KUNIT_EXPECT_EQ(test, CalculateTWait(5, 1100000, 1200000, 1000000), 1200000);
+	KUNIT_EXPECT_EQ(test, CalculateTWait(4, 1000000, 1300000, 1200000), 1300000);
+	KUNIT_EXPECT_EQ(test, CalculateTWait(6, 1000000, 900000, 2000000), 900000);
+	KUNIT_EXPECT_EQ(test, CalculateTWait(3, 1000000, 1200000, 1300000), 1200000);
+}
+
+/**
+ * calculate_write_back_delay_test - KUnit test for CalculateWriteBackDelay
+ * @test: represents a running instance of a test.
+ */
+static void calculate_write_back_delay_test(struct kunit *test)
+{
+	const struct calculate_write_back_delay_test_case *test_param = test->param_value;
+	double calculate_write_back_delay;
+
+	DC_FP_START();
+	calculate_write_back_delay = CalculateWriteBackDelay
+		(test_param->writeback_pixel_format,
+		 test_param->writeback_HRatio,
+		 test_param->writeback_VRatio,
+		 test_param->writeback_luma_HTaps,
+		 test_param->writeback_luma_VTaps,
+		 test_param->writeback_chroma_HTaps,
+		 test_param->writeback_chroma_VTaps,
+		 test_param->writeback_destination_width);
+	DC_FP_END();
+
+	KUNIT_EXPECT_EQ(test, test_param->calculate_write_back_delay,
+			calculate_write_back_delay);
+}
+
+/**
+ * calculate_active_row_bandwidth_test - KUnit test for CalculateActiveRowBandwidth
+ * @test: represents a running instance of a test.
+ */
+static void calculate_active_row_bandwidth_test(struct kunit *test)
+{
+	const struct calculate_active_row_bandwidth_test_case *test_param = test->param_value;
+	double *meta_row_bw, *dpte_row_bw, *qual_row_bw;
+
+	meta_row_bw = kunit_kzalloc(test, sizeof(double), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, meta_row_bw);
+
+	dpte_row_bw = kunit_kzalloc(test, sizeof(double), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dpte_row_bw);
+
+	qual_row_bw = kunit_kzalloc(test, sizeof(double), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, qual_row_bw);
+
+	DC_FP_START();
+	CalculateActiveRowBandwidth(test_param->GPUVM_enable,
+				    test_param->source_pixel_format,
+				    test_param->VRatio,
+				    test_param->DCC_enable,
+				    test_param->line_time,
+				    test_param->meta_row_byte_luma,
+				    test_param->meta_row_byte_chroma,
+				    test_param->meta_row_height_luma,
+				    test_param->meta_row_height_chroma,
+				    test_param->pixel_PTE_bytes_per_row_luma,
+				    test_param->pixel_PTE_bytes_per_row_chroma,
+				    test_param->dpte_row_height_luma,
+				    test_param->dpte_row_height_chroma,
+				    meta_row_bw,
+				    dpte_row_bw,
+				    qual_row_bw);
+	DC_FP_END();
+
+	KUNIT_EXPECT_EQ(test, test_param->meta_row_bw, *meta_row_bw);
+	KUNIT_EXPECT_EQ(test, test_param->dpte_row_bw, *dpte_row_bw);
+	KUNIT_EXPECT_EQ(test, test_param->qual_row_bw, *qual_row_bw);
+}
+
+/**
+ * trunc_to_valid_BPP_test - KUnit test for TruncToValidBPP
+ * @test: represents a running instance of a test.
+ */
+static void trunc_to_valid_BPP_test(struct kunit *test)
+{
+	/* HDMI output for 4:2:0 encoding */
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(18.01, true, dm_hdmi, dm_420, 0), 18);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(18, true, dm_hdmi, dm_420, 10), 18);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(15.01, false, dm_hdmi, dm_420, 0), 15);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(15, false, dm_hdmi, dm_420, 8), 15);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(12.01, true, dm_hdmi, dm_420, 0), 12);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(12, true, dm_hdmi, dm_420, 5), 12);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(11.99, false, dm_hdmi, dm_420, 5), BPP_INVALID);
+
+	/* HDMI output for 4:2:0 encoding */
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(36.01, true, dm_hdmi, dm_444, 0), 36);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(36, true, dm_hdmi, dm_444, 10), 36);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(30.01, false, dm_hdmi, dm_444, 0), 30);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(30, false, dm_hdmi, dm_444, 8), 30);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(24.01, true, dm_hdmi, dm_444, 0), 24);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(24, true, dm_hdmi, dm_444, 5), 24);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(18.01, true, dm_hdmi, dm_444, 0), 18);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(18, true, dm_hdmi, dm_444, 5), 18);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(17.99, false, dm_hdmi, dm_444, 5), BPP_INVALID);
+
+	/* HDMI output for different encoding types */
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(36.01, true, dm_hdmi, dm_n422, 0), 24);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(36, true, dm_hdmi, dm_s422, 10), 24);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(30.01, false, dm_hdmi, dm_n422, 0), 20);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(30, false, dm_hdmi, dm_s422, 8), 20);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(24.01, true, dm_hdmi, dm_n422, 0), 16);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(24, true, dm_hdmi, dm_s422, 5), 16);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(15.99, false, dm_hdmi, dm_n422, 5), BPP_INVALID);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(-1, true, dm_hdmi, dm_s422, 0), BPP_INVALID);
+
+	/* Display Port output with DSC enabled and 4:2:0 encoding */
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(5.99, true, dm_dp, dm_420, 0), BPP_INVALID);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(-1, true, dm_dp, dm_420, 0), BPP_INVALID);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(12, true, dm_dp, dm_420, 8), 12);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(1.5 * 8 - 1 / (double)16, true, dm_dp,
+					      dm_420, 8), 11);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(7, true, dm_dp, dm_420, 3), 4);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(1.5 * 9 - 1 / (double)16, true, dm_dp,
+					      dm_420, 9), 13);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(6, true, dm_dp, dm_420, 8), 6);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(6.25, true, dm_dp, dm_420, 8), 6);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(6 + 1 / (double)3, true, dm_dp, dm_420, 8), 6);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(6.50, true, dm_dp, dm_420, 8), 6);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(6.75, true, dm_dp, dm_420, 8), 6);
+
+	/* Embedded Display Port output with DSC enabled and n-4:2:2 encoding */
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(6.99, true, dm_edp, dm_n422, 0), BPP_INVALID);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(-1, true, dm_edp, dm_n422, 0), BPP_INVALID);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(16, true, dm_edp, dm_n422, 7), 14);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(2 * 7 - 1 / (double)16, true, dm_edp,
+					      dm_n422, 7), 13);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(7, true, dm_edp, dm_n422, 3), 6);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(2 * 9 - 1 / (double)16, true, dm_edp,
+					      dm_n422, 9), 17);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(11, true, dm_edp, dm_n422, 8), 11);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(11 + 1 / (double)3, true, dm_edp,
+					      dm_n422, 8), 11);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(11.40, true, dm_edp, dm_n422, 8), 11);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(11.50, true, dm_edp, dm_n422, 8), 11);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(11.75, true, dm_edp, dm_n422, 8), 11);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(11.95, true, dm_edp, dm_n422, 8), 11);
+
+	/* Display Port 2.0 output with DSC enabled and 4:4:4 encoding */
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(7.99, true, dm_dp2p0, dm_444, 0), BPP_INVALID);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(-1, true, dm_dp2p0, dm_444, 0), BPP_INVALID);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(22, true, dm_dp2p0, dm_444, 11), 22);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(3 * 7 - 1 / (double)16, true, dm_dp2p0,
+					      dm_444, 7), 20);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(14, true, dm_dp2p0, dm_444, 3), 9);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(3 * 9 - 1 / (double)16, true, dm_dp2p0,
+					      dm_444, 9), 26);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(17, true, dm_dp2p0, dm_444, 7), 17);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(17 + 1 / (double)3, true, dm_dp2p0, dm_444, 7), 17);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(17.40, true, dm_dp2p0, dm_444, 7), 17);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(17.50, true, dm_dp2p0, dm_444, 7), 17);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(17.75, true, dm_dp2p0, dm_444, 7), 17);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(17.95, true, dm_dp2p0, dm_444, 7), 17);
+
+	/* WB output with DSC enabled and 4:2:2 s-encoding */
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(7.99, true, dm_wb, dm_s422, 0), BPP_INVALID);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(-1, true, dm_wb, dm_s422, 0), BPP_INVALID);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(22, true, dm_wb, dm_s422, 11), 22);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(3 * 7 - 1 / (double)16, true, dm_wb, dm_s422, 7), 20);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(18, true, dm_wb, dm_s422, 3), 9);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(3 * 9 - 1 / (double)16, true, dm_wb, dm_s422, 9), 26);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(17, true, dm_wb, dm_s422, 7), 17);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(17 + 1 / (double)3, true, dm_wb, dm_s422, 7), 17);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(17.40, true, dm_wb, dm_s422, 7), 17);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(17.50, true, dm_wb, dm_s422, 7), 17);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(17.75, true, dm_wb, dm_s422, 7), 17);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(17.95, true, dm_wb, dm_s422, 7), 17);
+
+	/* Display Port output with DSC disabled for 4:2:0 encoding */
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(18.01, false, dm_dp, dm_420, 0), 18);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(18, false, dm_dp, dm_420, 10), 18);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(15.01, false, dm_dp, dm_420, 0), 15);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(15, false, dm_dp, dm_420, 8), 15);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(12.01, false, dm_dp, dm_420, 0), 12);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(12, false, dm_dp, dm_420, 5), 12);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(11.99, false, dm_dp, dm_420, 5), BPP_INVALID);
+
+	/* Embedded Display Port output with DSC disabled for 4:2:2 encoding */
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(24.01, false, dm_edp, dm_s422, 0), 24);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(24, false, dm_edp, dm_n422, 10), 24);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(20.01, false, dm_edp, dm_s422, 0), 20);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(20, false, dm_edp, dm_n422, 8), 20);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(16.01, false, dm_edp, dm_s422, 0), 16);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(16, false, dm_edp, dm_n422, 5), 16);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(15.99, false, dm_edp, dm_s422, 5), BPP_INVALID);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(-1, false, dm_edp, dm_n422, 5), BPP_INVALID);
+
+	/* WB output with DSC disabled for 4:4:4 encoding */
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(36.01, false, dm_wb, dm_444, 0), 36);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(36, false, dm_wb, dm_444, 10), 36);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(30.01, false, dm_wb, dm_444, 0), 30);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(30, false, dm_wb, dm_444, 8), 30);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(24.01, false, dm_wb, dm_444, 0), 24);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(24, false, dm_wb, dm_444, 5), 24);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(18.01, false, dm_wb, dm_444, 0), 18);
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(18, false, dm_wb, dm_444, 5), 18);
+
+	KUNIT_EXPECT_EQ(test, TruncToValidBPP(17.99, false, dm_wb, dm_444, 5), BPP_INVALID);
+}
+
+static const struct calculate_write_back_delay_test_case calculate_write_back_delay_cases[] = {
+	{
+		.desc = "Trivial test",
+		.writeback_pixel_format = dm_444_32,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 0,
+		.writeback_luma_VTaps = 0,
+		.writeback_chroma_HTaps = 0,
+		.writeback_chroma_VTaps = 0,
+		.writeback_destination_width = 0,
+		.calculate_write_back_delay = 0x1p+2,
+	},
+	{
+		.desc = "High Writeback HRatio and VRatio and zeroed taps",
+		.writeback_pixel_format = dm_444_32,
+		.writeback_HRatio = 2400.0,
+		.writeback_VRatio = 2500.0,
+		.writeback_luma_HTaps = 0,
+		.writeback_luma_VTaps = 0,
+		.writeback_chroma_HTaps = 0,
+		.writeback_chroma_VTaps = 0,
+		.writeback_destination_width = 0,
+		.calculate_write_back_delay = 0x1p+2,
+	},
+	{
+		.desc = "Simple Writeback Ratio",
+		.writeback_pixel_format = dm_444_32,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 4,
+		.writeback_luma_VTaps = 4,
+		.writeback_chroma_HTaps = 5,
+		.writeback_chroma_VTaps = 5,
+		.writeback_destination_width = 2400,
+		.calculate_write_back_delay = 0x1.2cap+11,
+	},
+	{
+		.desc = "Non-integer WritebackVRatio with same number of Luma and Chroma taps",
+		.writeback_pixel_format = dm_444_32,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 2567.56,
+		.writeback_luma_HTaps = 7,
+		.writeback_luma_VTaps = 7,
+		.writeback_chroma_HTaps = 7,
+		.writeback_chroma_VTaps = 7,
+		.writeback_destination_width = 400,
+		.calculate_write_back_delay = 0x1.61p+9,
+	},
+	{
+		.desc = "No Writeback to Chroma Taps",
+		.writeback_pixel_format = dm_444_32,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.5,
+		.writeback_luma_HTaps = 5,
+		.writeback_luma_VTaps = 5,
+		.writeback_chroma_HTaps = 0,
+		.writeback_chroma_VTaps = 0,
+		.writeback_destination_width = 2400,
+		.calculate_write_back_delay = 0x1.77cp+11,
+	},
+	{
+		.desc = "No Writeback to Luma Taps",
+		.writeback_pixel_format = dm_444_32,
+		.writeback_HRatio = 2.0,
+		.writeback_VRatio = 1.5,
+		.writeback_luma_HTaps = 0,
+		.writeback_luma_VTaps = 0,
+		.writeback_chroma_HTaps = 3,
+		.writeback_chroma_VTaps = 3,
+		.writeback_destination_width = 3700,
+		.calculate_write_back_delay = 0x1p+2,
+	},
+	{
+		.desc = "High Writeback HRatio and VRatio",
+		.writeback_pixel_format = dm_444_32,
+		.writeback_HRatio = 2500000.0,
+		.writeback_VRatio = 2000000.0,
+		.writeback_luma_HTaps = 4,
+		.writeback_luma_VTaps = 4,
+		.writeback_chroma_HTaps = 5,
+		.writeback_chroma_VTaps = 5,
+		.writeback_destination_width = 3400,
+		.calculate_write_back_delay = 0x1.be4cd8p-10,
+	},
+	{
+		.desc = "Increase numeric error by increasing taps' Writeback",
+		.writeback_pixel_format = dm_444_32,
+		.writeback_HRatio = 3000.0,
+		.writeback_VRatio = 2450.0,
+		.writeback_luma_HTaps = 100,
+		.writeback_luma_VTaps = 100,
+		.writeback_chroma_HTaps = 200,
+		.writeback_chroma_VTaps = 200,
+		.writeback_destination_width = 1687,
+		.calculate_write_back_delay = 0x1.49eap+15,
+	},
+	{
+		.desc = "Turning point of the Writeback HRatio and VRatio",
+		.writeback_pixel_format = dm_444_32,
+		.writeback_HRatio = 100000.0,
+		.writeback_VRatio = 100000.0,
+		.writeback_luma_HTaps = 100,
+		.writeback_luma_VTaps = 100,
+		.writeback_chroma_HTaps = 200,
+		.writeback_chroma_VTaps = 200,
+		.writeback_destination_width = 1687,
+		.calculate_write_back_delay = 0x1.b06ccap-2,
+	},
+	{
+		.desc = "Simple Writeback Ratio for 4:4:4 8-bit encoding",
+		.writeback_pixel_format = dm_444_8,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 4,
+		.writeback_luma_VTaps = 4,
+		.writeback_chroma_HTaps = 5,
+		.writeback_chroma_VTaps = 5,
+		.writeback_destination_width = 2400,
+		.calculate_write_back_delay = 0x1.77cp+11,
+	},
+	{
+		.desc = "Non-integer WritebackVRatio with same number of Luma and Chroma taps for 4:4:4 64-bit encoding",
+		.writeback_pixel_format = dm_444_64,
+		.writeback_HRatio = 100000.0,
+		.writeback_VRatio = 100000.56,
+		.writeback_luma_HTaps = 7,
+		.writeback_luma_VTaps = 7,
+		.writeback_chroma_HTaps = 7,
+		.writeback_chroma_VTaps = 7,
+		.writeback_destination_width = 400,
+		.calculate_write_back_delay = 0x1.ceae7cp-8,
+	},
+	{
+		.desc = "No Writeback to Chroma Taps for 4:2:0 8-bit encoding",
+		.writeback_pixel_format = dm_420_8,
+		.writeback_HRatio = 100000.00,
+		.writeback_VRatio = 100000.56,
+		.writeback_luma_HTaps = 8,
+		.writeback_luma_VTaps = 8,
+		.writeback_chroma_HTaps = 0,
+		.writeback_chroma_VTaps = 0,
+		.writeback_destination_width = 1333,
+		.calculate_write_back_delay = 0x1.b6c2d6p-6,
+	},
+	{
+		.desc = "No Writeback to Luma Taps for 4:2:0 10-bit encoding",
+		.writeback_pixel_format = dm_420_10,
+		.writeback_HRatio = 200000.0,
+		.writeback_VRatio = 100000.56,
+		.writeback_luma_HTaps = 0,
+		.writeback_luma_VTaps = 0,
+		.writeback_chroma_HTaps = 3,
+		.writeback_chroma_VTaps = 3,
+		.writeback_destination_width = 996,
+		.calculate_write_back_delay = 0x1.ecd3f6p-9,
+	},
+	{
+		.desc = "Reduce numeric error by decreasing Writeback HRatio and VRatio for 4:4:4 16-bit encoding",
+		.writeback_pixel_format = dm_444_16,
+		.writeback_HRatio = 2.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 5,
+		.writeback_luma_VTaps = 5,
+		.writeback_chroma_HTaps = 5,
+		.writeback_chroma_VTaps = 5,
+		.writeback_destination_width = 2400.0,
+		.calculate_write_back_delay = 0x1.77cp+11,
+	},
+};
+
+static const struct calculate_active_row_bandwidth_test_case calculate_active_row_bandwidth_cases[] = {
+	{
+		.desc = "Trivial Test",
+		.GPUVM_enable = false,
+		.source_pixel_format = -1,
+		.VRatio = 0.00,
+		.DCC_enable = false,
+		.line_time = 0.00,
+		.meta_row_byte_luma = 0,
+		.meta_row_byte_chroma = 0,
+		.meta_row_height_luma = 0,
+		.meta_row_height_chroma = 0,
+		.pixel_PTE_bytes_per_row_luma = 0,
+		.pixel_PTE_bytes_per_row_chroma = 0,
+		.dpte_row_height_luma = 0,
+		.dpte_row_height_chroma = 0,
+		.meta_row_bw = 0.00,
+		.dpte_row_bw = 0.00,
+		.qual_row_bw = 0.00,
+	},
+	{
+		.desc = "Zeroed Bandwidth with non-zeroed values",
+		.GPUVM_enable = false,
+		.source_pixel_format = dm_420_8,
+		.VRatio = 1000.00,
+		.DCC_enable = false,
+		.line_time = 1000.00,
+		.meta_row_byte_luma = 120,
+		.meta_row_byte_chroma = 150,
+		.meta_row_height_luma = 200,
+		.meta_row_height_chroma = 200,
+		.pixel_PTE_bytes_per_row_luma = 8,
+		.pixel_PTE_bytes_per_row_chroma = 8,
+		.dpte_row_height_luma = 100,
+		.dpte_row_height_chroma = 100,
+		.meta_row_bw = 0.00,
+		.dpte_row_bw = 0.00,
+		.qual_row_bw = 0.00,
+	},
+	{
+		.desc = "GPUVM enabled and DCC not enabled with 4:2:0 8-bit encoding",
+		.GPUVM_enable = true,
+		.source_pixel_format = dm_420_8,
+		.VRatio = 1000.00,
+		.DCC_enable = false,
+		.line_time = 1000.00,
+		.meta_row_byte_luma = 120,
+		.meta_row_byte_chroma = 150,
+		.meta_row_height_luma = 200,
+		.meta_row_height_chroma = 200,
+		.pixel_PTE_bytes_per_row_luma = 8,
+		.pixel_PTE_bytes_per_row_chroma = 8,
+		.dpte_row_height_luma = 100,
+		.dpte_row_height_chroma = 100,
+		.meta_row_bw = 0x0p+0,
+		.dpte_row_bw = 0x1.eb851eb851eb8p-4,
+		.qual_row_bw = 0x1.eb851eb851eb8p-4,
+	},
+	{
+		.desc = "GPUVM enabled and DCC not enabled with 4:2:0 10-bit encoding",
+		.GPUVM_enable = true,
+		.source_pixel_format = dm_420_10,
+		.VRatio = 1000.00,
+		.DCC_enable = false,
+		.line_time = 1000.00,
+		.meta_row_byte_luma = 120,
+		.meta_row_byte_chroma = 150,
+		.meta_row_height_luma = 200,
+		.meta_row_height_chroma = 200,
+		.pixel_PTE_bytes_per_row_luma = 9,
+		.pixel_PTE_bytes_per_row_chroma = 9,
+		.dpte_row_height_luma = 230,
+		.dpte_row_height_chroma = 170,
+		.meta_row_bw = 0x0p+0,
+		.dpte_row_bw = 0x1.0cb3a88722f67p-4,
+		.qual_row_bw = 0x1.0cb3a88722f67p-4,
+	},
+	{
+		.desc = "GPUVM enabled and DCC not enabled with 4:2:0 12-bit encoding",
+		.GPUVM_enable = true,
+		.source_pixel_format = dm_420_12,
+		.VRatio = 100.00,
+		.DCC_enable = false,
+		.line_time = 100.00,
+		.meta_row_byte_luma = 120,
+		.meta_row_byte_chroma = 150,
+		.meta_row_height_luma = 200,
+		.meta_row_height_chroma = 200,
+		.pixel_PTE_bytes_per_row_luma = 2,
+		.pixel_PTE_bytes_per_row_chroma = 2,
+		.dpte_row_height_luma = 10,
+		.dpte_row_height_chroma = 10,
+		.meta_row_bw = 0x0p+0,
+		.dpte_row_bw = 0x1.999999999999ap-3,
+		.qual_row_bw = 0x0p+0,
+	},
+	{
+		.desc = "GPUVM enabled and DCC not enabled with 4:4:4 16-bit encoding",
+		.GPUVM_enable = true,
+		.source_pixel_format = dm_444_16,
+		.VRatio = 1000.00,
+		.DCC_enable = false,
+		.line_time = 1000.00,
+		.meta_row_byte_luma = 120,
+		.meta_row_byte_chroma = 150,
+		.meta_row_height_luma = 200,
+		.meta_row_height_chroma = 200,
+		.pixel_PTE_bytes_per_row_luma = 9,
+		.pixel_PTE_bytes_per_row_chroma = 9,
+		.dpte_row_height_luma = 230,
+		.dpte_row_height_chroma = 170,
+		.meta_row_bw = 0x0p+0,
+		.dpte_row_bw = 0x1.408e78356d141p-5,
+		.qual_row_bw = 0x0p+0,
+	},
+	{
+		.desc = "GPUVM not enabled and DCC enabled with 4:2:0 8-bit encoding",
+		.GPUVM_enable = false,
+		.source_pixel_format = dm_420_8,
+		.VRatio = 1000.00,
+		.DCC_enable = true,
+		.line_time = 1000.00,
+		.meta_row_byte_luma = 120,
+		.meta_row_byte_chroma = 150,
+		.meta_row_height_luma = 200,
+		.meta_row_height_chroma = 200,
+		.pixel_PTE_bytes_per_row_luma = 8,
+		.pixel_PTE_bytes_per_row_chroma = 8,
+		.dpte_row_height_luma = 100,
+		.dpte_row_height_chroma = 100,
+		.meta_row_bw = 0x1.f333333333333p-1,
+		.dpte_row_bw = 0x0p+0,
+		.qual_row_bw = 0x1.f333333333333p-1,
+	},
+	{
+		.desc = "GPUVM not enabled and DCC enabled with 4:2:0 10-bit encoding",
+		.GPUVM_enable = false,
+		.source_pixel_format = dm_420_10,
+		.VRatio = 700.00,
+		.DCC_enable = true,
+		.line_time = 1300.00,
+		.meta_row_byte_luma = 170,
+		.meta_row_byte_chroma = 350,
+		.meta_row_height_luma = 300,
+		.meta_row_height_chroma = 280,
+		.pixel_PTE_bytes_per_row_luma = 8,
+		.pixel_PTE_bytes_per_row_chroma = 8,
+		.dpte_row_height_luma = 100,
+		.dpte_row_height_chroma = 100,
+		.meta_row_bw = 0x1.4888888888889p-1,
+		.dpte_row_bw = 0x0p+0,
+		.qual_row_bw = 0x1.4888888888889p-1,
+	},
+	{
+		.desc = "GPUVM not enabled and DCC enabled with 4:2:2 8-bit encoding",
+		.GPUVM_enable = false,
+		.source_pixel_format = dm_422_8,
+		.VRatio = 700.00,
+		.DCC_enable = true,
+		.line_time = 1300.00,
+		.meta_row_byte_luma = 170,
+		.meta_row_byte_chroma = 350,
+		.meta_row_height_luma = 300,
+		.meta_row_height_chroma = 280,
+		.pixel_PTE_bytes_per_row_luma = 8,
+		.pixel_PTE_bytes_per_row_chroma = 8,
+		.dpte_row_height_luma = 100,
+		.dpte_row_height_chroma = 100,
+		.meta_row_bw = 0x1.3873873873874p-2,
+		.dpte_row_bw = 0x0p+0,
+		.qual_row_bw = 0x0p+0,
+	},
+	{
+		.desc = "GPUVM not enabled and DCC enabled with 4:4:4 8-bit encoding",
+		.GPUVM_enable = false,
+		.source_pixel_format = dm_444_8,
+		.VRatio = 1000.00,
+		.DCC_enable = true,
+		.line_time = 2000.00,
+		.meta_row_byte_luma = 190,
+		.meta_row_byte_chroma = 333,
+		.meta_row_height_luma = 200,
+		.meta_row_height_chroma = 210,
+		.pixel_PTE_bytes_per_row_luma = 9,
+		.pixel_PTE_bytes_per_row_chroma = 9,
+		.dpte_row_height_luma = 230,
+		.dpte_row_height_chroma = 170,
+		.meta_row_bw = 0x1.e666666666666p-2,
+		.dpte_row_bw = 0x0p+0,
+		.qual_row_bw = 0x0p+0,
+	},
+	{
+		.desc = "GPUVM enabled and DCC enabled with 4:2:0 8-bit encoding",
+		.GPUVM_enable = true,
+		.source_pixel_format = dm_420_8,
+		.VRatio = 1000.00,
+		.DCC_enable = true,
+		.line_time = 2000.00,
+		.meta_row_byte_luma = 120,
+		.meta_row_byte_chroma = 150,
+		.meta_row_height_luma = 200,
+		.meta_row_height_chroma = 200,
+		.pixel_PTE_bytes_per_row_luma = 8,
+		.pixel_PTE_bytes_per_row_chroma = 8,
+		.dpte_row_height_luma = 100,
+		.dpte_row_height_chroma = 100,
+		.meta_row_bw = 0x1.f333333333333p-2,
+		.dpte_row_bw = 0x1.eb851eb851eb8p-5,
+		.qual_row_bw = 0x1.1851eb851eb85p-1,
+	},
+	{
+		.desc = "GPUVM enabled and DCC enabled with 4:2:0 10-bit encoding",
+		.GPUVM_enable = true,
+		.source_pixel_format = dm_420_10,
+		.VRatio = 7000.00,
+		.DCC_enable = true,
+		.line_time = 1300.00,
+		.meta_row_byte_luma = 170,
+		.meta_row_byte_chroma = 350,
+		.meta_row_height_luma = 300,
+		.meta_row_height_chroma = 280,
+		.pixel_PTE_bytes_per_row_luma = 8,
+		.pixel_PTE_bytes_per_row_chroma = 8,
+		.dpte_row_height_luma = 100,
+		.dpte_row_height_chroma = 100,
+		.meta_row_bw = 0x1.9aaaaaaaaaaaap+2,
+		.dpte_row_bw = 0x1.4ad4ad4ad4ad5p-1,
+		.qual_row_bw = 0x1.c405405405405p+2,
+	},
+	{
+		.desc = "GPUVM enabled and DCC enabled with 4:4:4 16-bit encoding",
+		.GPUVM_enable = true,
+		.source_pixel_format = dm_444_16,
+		.VRatio = 700.00,
+		.DCC_enable = true,
+		.line_time = 1300.00,
+		.meta_row_byte_luma = 70,
+		.meta_row_byte_chroma = 550,
+		.meta_row_height_luma = 310,
+		.meta_row_height_chroma = 280,
+		.pixel_PTE_bytes_per_row_luma = 7,
+		.pixel_PTE_bytes_per_row_chroma = 7,
+		.dpte_row_height_luma = 190,
+		.dpte_row_height_chroma = 340,
+		.meta_row_bw = 0x1.f2065a3416de5p-4,
+		.dpte_row_bw = 0x1.4506d72a14507p-6,
+		.qual_row_bw = 0x0p+0,
+	},
+	{
+		.desc = "GPUVM enabled and DCC enabled with 4:4:4 32-bit encoding",
+		.GPUVM_enable = true,
+		.source_pixel_format = dm_444_32,
+		.VRatio = 700.00,
+		.DCC_enable = true,
+		.line_time = 1300.00,
+		.meta_row_byte_luma = 170,
+		.meta_row_byte_chroma = 350,
+		.meta_row_height_luma = 300,
+		.meta_row_height_chroma = 280,
+		.pixel_PTE_bytes_per_row_luma = 8,
+		.pixel_PTE_bytes_per_row_chroma = 8,
+		.dpte_row_height_luma = 100,
+		.dpte_row_height_chroma = 100,
+		.meta_row_bw = 0x1.3873873873874p-2,
+		.dpte_row_bw = 0x1.60e2dafa7c749p-5,
+		.qual_row_bw = 0x0p+0,
+	},
+};
+
+static void calculate_write_back_delay_test_to_desc(const struct
+		calculate_write_back_delay_test_case * t, char *desc)
+{
+	strcpy(desc, t->desc);
+}
+
+KUNIT_ARRAY_PARAM(calculate_write_back_delay, calculate_write_back_delay_cases,
+		  calculate_write_back_delay_test_to_desc);
+
+static void calculate_active_row_bandwidth_test_to_desc(const struct
+		calculate_active_row_bandwidth_test_case * t, char *desc)
+{
+	strcpy(desc, t->desc);
+}
+
+KUNIT_ARRAY_PARAM(calculate_active_row_bandwidth, calculate_active_row_bandwidth_cases,
+		  calculate_active_row_bandwidth_test_to_desc);
+
+static struct kunit_case display_mode_vba_20_cases[] = {
+	KUNIT_CASE(dscce_compute_delay_test),
+	KUNIT_CASE(DSC_compute_delay_test),
+	KUNIT_CASE(calculate_TWait_test),
+	KUNIT_CASE_PARAM(calculate_write_back_delay_test, calculate_write_back_delay_gen_params),
+	KUNIT_CASE_PARAM(calculate_active_row_bandwidth_test,
+			 calculate_active_row_bandwidth_gen_params),
+	KUNIT_CASE(trunc_to_valid_BPP_test),
+	{  }
+};
+
+static struct kunit_suite display_mode_vba_20_suite = {
+	.name = "display_mode_vba_20",
+	.test_cases = display_mode_vba_20_cases,
+};
+
+kunit_test_suite(display_mode_vba_20_suite);
-- 
2.43.0

