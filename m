Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEFC83DE06
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 16:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B5110FBD1;
	Fri, 26 Jan 2024 15:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A460210FBCF;
 Fri, 26 Jan 2024 15:51:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kifs67r8Fn+Buuw370hrQ0vp9wtAT/tWNjwxtnuG7+GUGbo2gN4t0rUQkjlKB8CIGSKYsX7BhJdQjsfCq8XkhUTOzfJFOY/Sg+lULmwWGuAwsBRFXVeUZCqP7BoorArI+tILqMb9t2vcf34AG1kAZ6qRXt0BA3P5QVvTWVoKR3IL1iqCmGlKgOdjhAMvG7HXwKyXomegDZ7kPT73mZ6fQE5SZBWAEPx45usq6nXzY0RundLILcVx0V6Qyxkd7qxfsY0scaWhw/wecpzw1gOqiA9xm/Oat5mgNRUWXYhQlqKZCsJqq9Be9j+z6iEjM8dgH3OVylOMPn/9USB46TPLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FK4M+PwvBidx5CFED5WYjetAQS5TrwEOkenqwr6IKCg=;
 b=h+fvRjvewlm4ZpjPQmNipkrNzyYbGGY1BBN36y760A4cQAPX7YvGOd63RKz+ecr+g5n6RcGo4+G4gG51hnkm14WEkOaNlxeZ3YVCLWiWqJgBgNdsC83Us1o5HuEKF/6mlCXqWc/6V4pVaCRtpHG1zPB+Iz0Kn9S2+ZXgUn/AgB+fUqbK8xoMo/jhbktE2fjy2ra+qanZzyHpFTWo0f2+ggZOUN1ybHnWFfYiUzUxxDNyg4hNn4xqCLR6ZDJSpFS60n6CDZVwoyRzfeLTf0lQ0W20VS6GYRMfh9l4FIA/dGh422G9lmqJO+5AP+0UP1nd1Yg81US8X6/WKtcqO5Z2AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FK4M+PwvBidx5CFED5WYjetAQS5TrwEOkenqwr6IKCg=;
 b=u0rdC0l56HSdWE35eIVoZnRZVfttmjHWhzMvN6RKc2VErWaipF9HBHhip8QqfiSOrDeMNzKfCl7OogveqHEN+GEk4KM2MWXF9G6NWWabN69Y44ieEoXalzKHWIiFfopx4BVbCINHUmAzLomyoeNqoeG0f/web+fS0cVwyZkgf2s=
Received: from SJ0PR13CA0166.namprd13.prod.outlook.com (2603:10b6:a03:2c7::21)
 by SA1PR12MB7319.namprd12.prod.outlook.com (2603:10b6:806:2b5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 15:51:37 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::8a) by SJ0PR13CA0166.outlook.office365.com
 (2603:10b6:a03:2c7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.21 via Frontend
 Transport; Fri, 26 Jan 2024 15:51:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 26 Jan 2024 15:51:36 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 26 Jan
 2024 09:51:32 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, Nicholas Choi
 <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>, David Gow
 <davidgow@google.com>, <hersenxs.wu@amd.com>, <magalilemes00@gmail.com>
Subject: [PATCH v4 6/8] drm/amd/display: Introduce KUnit tests for dcn20_fpu
Date: Fri, 26 Jan 2024 08:48:06 -0700
Message-ID: <20240126155022.1184856-7-Rodrigo.Siqueira@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|SA1PR12MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: 2258eada-f18b-4ed5-b11e-08dc1e86adb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4BsWX/q0gOLYXB5o9JoGVKiUwf3jyOnYtrZW4GTCVOel6iIsZf5ygV21rKGKcLxmf9XODy/up0xlxwQ8EGKLVeS+2neuKC3tPSvJtE2g0b7PvHtIYZ5iKlhw+gYS3WQeKyXnCXdwRVHAzbZmNXq0rFWltsX9azXcGkhkruVDd0Pep4XWfINzAyfU5+PTflfxjXODuLmDVj9BBTNpK0cWMee5kJ6e3+pZj3JsTDpcpDHv3QOuRo7qa4WjTpoOl4fuHNwrIsW8RSoMYImrWYJLdQVGifEMy7c+yfL+GdYcX66f14Vs9OITVS0+OYE+z2BaRED5x0gKhqpWBDlf1NR7qKF4dnCdQ+d3crCKyXXc4lbkrZCvLvIo18KsfcoV1ucnsx5gQP+b8By7PHAJl+8L8iQ5te8Lb7arG4n6jgsxODN77TpaZmPrm2lcwZAe6vN6zzi8RDIvkBen4aIvr/Wph8xOMybHseU2KwKclOl+QHScKOiNw/C5byQosGi3WX0bcDcNFoJ0JMlPTLHccDl4RlpzgUshGUXpTpOHEA8nPmPiAFAThqiX4YGMg1aFDMfUWnTEsh38bJaJS4I9ZGYQ1Ds6J78yUGzUX6rvWgaT5LGxAC9pZaUY4zWhlKWUe733lf3B3HCT+b2Eox/nQofcfagJHWXkCi8kGK45envfTOkSdmmbEbMtV1/KyDKdXSi7J1KfIVRdnE2GLb1p9avON6hp3tmkVfQD1fnwmIWOO9iMnSyEU+ynnbbCY+YHVKuWwO6gAZ4UI8KuFe62HuL1Fs/kSw+Vm6XWI4Og3sMFlBk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(1800799012)(186009)(451199024)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(41300700001)(83380400001)(36756003)(921011)(86362001)(36860700001)(81166007)(2616005)(30864003)(16526019)(26005)(1076003)(426003)(66574015)(336012)(4326008)(82740400003)(356005)(110136005)(478600001)(2906002)(8936002)(316002)(70206006)(6666004)(70586007)(54906003)(47076005)(5660300002)(7416002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 15:51:36.5393 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2258eada-f18b-4ed5-b11e-08dc1e86adb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7319
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

From: Magali Lemes <magalilemes00@gmail.com>

This commit adds unit tests to the functions dcn20_cap_soc_clocks and
dcn21_update_bw_bounding_box from dcn20/dcn20_fpu.

Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/tests/Makefile    |   3 +-
 .../tests/dc/dml/dcn20/dcn20_fpu_test.c       | 561 ++++++++++++++++++
 2 files changed, 563 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/dcn20_fpu_test.c

diff --git a/drivers/gpu/drm/amd/display/tests/Makefile b/drivers/gpu/drm/amd/display/tests/Makefile
index cc1e9edd38c3..a34677808e48 100644
--- a/drivers/gpu/drm/amd/display/tests/Makefile
+++ b/drivers/gpu/drm/amd/display/tests/Makefile
@@ -9,7 +9,8 @@ endif
 
 ifdef CONFIG_DML_KUNIT_TEST
 	CFLAGS_$(AMDDALPATH)/tests/dc/dml/display_mode_vba_test.o := $(dml_ccflags)
-	DC_TESTS += dc/dml/display_mode_vba_test.o
+	CFLAGS_$(AMDDALPATH)/tests/dc/dml/dcn20/dcn20_fpu_test.o := $(dml_ccflags)
+	DC_TESTS += dc/dml/display_mode_vba_test.o dc/dml/dcn20/dcn20_fpu_test.o
 endif
 
 AMD_DAL_DC_TESTS = $(addprefix $(AMDDALPATH)/tests/,$(DC_TESTS))
diff --git a/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/dcn20_fpu_test.c b/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/dcn20_fpu_test.c
new file mode 100644
index 000000000000..6b7ebb78fec9
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/dcn20_fpu_test.c
@@ -0,0 +1,561 @@
+// SPDX-License-Identifier: MIT
+/*
+ * KUnit tests for dml/dcn20/dcn20_fpu.h
+ *
+ * Copyright (C) 2022, Magali Lemes <magalilemes00@gmail.com>
+ */
+
+#include <kunit/test.h>
+
+#include "dc/inc/resource.h"
+#include "dc/inc/hw/clk_mgr.h"
+#include "dc/dcn21/dcn21_resource.h"
+
+#include "dml/dcn20/dcn20_fpu.h"
+
+/**
+ * DOC: Unit tests for AMDGPU DML dcn20/dcn20_fpu.h
+ */
+
+struct dcn20_cap_soc_clocks_test_case {
+	const char *desc;
+	struct _vcs_dpi_soc_bounding_box_st bb;
+	struct pp_smu_nv_clock_table max_clocks;
+	const int clock_states;
+	const struct _vcs_dpi_voltage_scaling_st expected_clock_limits[DC__VOLTAGE_STATES];
+};
+
+struct dcn21_update_bw_bounding_box_test_case {
+	const char *desc;
+	struct dc dc;
+	struct clk_bw_params bw_params;
+	const int clocks_to_compare;
+	const struct _vcs_dpi_voltage_scaling_st expected_clock_limits[DC__VOLTAGE_STATES];
+};
+
+struct dcn20_cap_soc_clocks_test_case dcn20_cap_soc_clocks_test_cases[] = {
+	{
+		.desc = "4-state bounding box clock limits ",
+		.bb = {
+			.clock_limits = {
+				{
+					.dcfclk_mhz = 506.0,
+					.fabricclk_mhz = 506.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 400.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 506.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 1600.0,
+				},
+				{
+					.dcfclk_mhz = 540.0,
+					.fabricclk_mhz = 540.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 1284.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 540.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 8000.0,
+				},
+				{
+					.dcfclk_mhz = 675.0,
+					.fabricclk_mhz = 675.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 1284.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 675.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 10000.0,
+				},
+				{
+					.dcfclk_mhz = 1265.0,
+					.fabricclk_mhz = 1266.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 1284.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 1266.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 15000.0,
+				},
+			},
+			.num_states = 4,
+		},
+		.max_clocks = {
+			.dcfClockInKhz = 1265000,
+			.uClockInKhz = 875000,
+			.fabricClockInKhz = 0,
+			.displayClockInKhz = 1284000,
+			.dppClockInKhz = 0,
+			.phyClockInKhz = 810000,
+			.socClockInKhz = 1266000,
+			.dscClockInKhz = 0,
+		},
+		.clock_states = 4,
+		.expected_clock_limits = {
+			{
+				.dcfclk_mhz = 506.0,
+				.fabricclk_mhz = 506.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 506.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 1600.0,
+			},
+			{
+				.dcfclk_mhz = 540.0,
+				.fabricclk_mhz = 540.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 1284.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 540.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 8000.0,
+			},
+			{
+				.dcfclk_mhz = 675.0,
+				.fabricclk_mhz = 675.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 1284.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 675.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 10000.0,
+			},
+			{
+				.dcfclk_mhz = 1265.0,
+				.fabricclk_mhz = 1266.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 1284.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 1266.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 14000.0,
+			},
+		},
+	},
+	{
+		.desc = "One duplicate clock state",
+		.bb = {
+			.clock_limits = {
+				{
+					.dcfclk_mhz = 506.0,
+					.fabricclk_mhz = 506.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 400.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 506.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 1600.0,
+				},
+				{
+					.dcfclk_mhz = 675.0,
+					.fabricclk_mhz = 675.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 1284.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 675.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 10000.0,
+				},
+				{
+					.dcfclk_mhz = 675.0,
+					.fabricclk_mhz = 675.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 1284.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 675.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 10000.0,
+				},
+				{
+					.dcfclk_mhz = 1265.0,
+					.fabricclk_mhz = 1266.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 1284.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 1266.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 15000.0,
+				},
+			},
+			.num_states = 4,
+		},
+		.max_clocks = {
+			.dcfClockInKhz = 1265000,
+			.uClockInKhz = 875000,
+			.fabricClockInKhz = 0,
+			.displayClockInKhz = 1284000,
+			.dppClockInKhz = 0,
+			.phyClockInKhz = 810000,
+			.socClockInKhz = 1266000,
+			.dscClockInKhz = 0,
+		},
+		.clock_states = 3,
+		.expected_clock_limits = {
+			{
+				.dcfclk_mhz = 506.0,
+				.fabricclk_mhz = 506.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 506.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 1600.0,
+			},
+			{
+				.dcfclk_mhz = 675.0,
+				.fabricclk_mhz = 675.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 1284.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 675.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 10000.0,
+			},
+			{
+				.dcfclk_mhz = 675.0,
+				.fabricclk_mhz = 675.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 1284.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 675.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 10000.0,
+			},
+		},
+	},
+	{
+		.desc = "Zeroed max clocks",
+		.bb = {
+			.clock_limits = {
+				{
+					.dcfclk_mhz = 506.0,
+					.fabricclk_mhz = 506.0,
+					.dispclk_mhz = 1284.0,
+					.dppclk_mhz = 400.0,
+					.phyclk_mhz = 810.0,
+					.socclk_mhz = 506.0,
+					.dscclk_mhz = 428.0,
+					.dram_speed_mts = 1600.0,
+				},
+			},
+			.num_states = 1,
+		},
+		.max_clocks = {
+			.dcfClockInKhz = 0,
+			.uClockInKhz = 0,
+			.fabricClockInKhz = 0,
+			.displayClockInKhz = 0,
+			.dppClockInKhz = 0,
+			.phyClockInKhz = 0,
+			.socClockInKhz = 0,
+			.dscClockInKhz = 0,
+		},
+		.clock_states = 1,
+		.expected_clock_limits = {
+			{
+				.dcfclk_mhz = 506.0,
+				.fabricclk_mhz = 506.0,
+				.dispclk_mhz = 1284.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 810.0,
+				.socclk_mhz = 506.0,
+				.dscclk_mhz = 428.0,
+				.dram_speed_mts = 1600.0,
+			},
+		},
+	},
+};
+
+struct dcn21_update_bw_bounding_box_test_case dcn21_update_bw_bounding_box_test_data[] = {
+	{
+		.desc = "5-entry bounding box clocks table",
+		.dc = {
+			.res_pool = &(struct resource_pool) {
+				.pipe_count = 2,
+				.res_cap = &(struct resource_caps) {
+					.num_timing_generator = 3
+				},
+			},
+		},
+		.bw_params = {
+			.num_channels = 1,
+			.clk_table = {
+				.entries = {
+					{
+						.voltage = 0,
+						.dcfclk_mhz = 200,
+						.fclk_mhz = 400,
+						.memclk_mhz = 800,
+						.socclk_mhz = 0,
+					},
+					{
+						.voltage = 0,
+						.dcfclk_mhz = 201,
+						.fclk_mhz = 800,
+						.memclk_mhz = 1600,
+						.socclk_mhz = 0,
+					},
+					{
+						.voltage = 0,
+						.dcfclk_mhz = 553,
+						.fclk_mhz = 1067,
+						.memclk_mhz = 1067,
+						.socclk_mhz = 0,
+					},
+					{
+						.voltage = 0,
+						.dcfclk_mhz = 602,
+						.fclk_mhz = 1333,
+						.memclk_mhz = 1600,
+						.socclk_mhz = 0,
+					},
+					{
+						.voltage = 0,
+						.dispclk_mhz = 1372,
+						.dppclk_mhz = 1372,
+						.phyclk_mhz = 810,
+						.phyclk_d18_mhz = 667,
+						.dtbclk_mhz = 600,
+					},
+				},
+
+				.num_entries = 5,
+			},
+		},
+		.expected_clock_limits = {
+			{
+				.state = 0,
+				.dcfclk_mhz = 200.0,
+				.fabricclk_mhz = 400.0,
+				.dispclk_mhz = 600.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 0.0,
+				.dscclk_mhz = 205.67,
+				.dram_speed_mts = 1600.0,
+			},
+			{
+				.state = 1,
+				.dcfclk_mhz = 200.0,
+				.fabricclk_mhz = 400.0,
+				.dispclk_mhz = 600.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 0.0,
+				.dscclk_mhz = 205.67,
+				.dram_speed_mts = 1600.0,
+			},
+			{
+				.state = 2,
+				.dcfclk_mhz = 201,
+				.fabricclk_mhz = 800.0,
+				.dispclk_mhz = 600.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 0.0,
+				.dscclk_mhz = 205.67,
+				.dram_speed_mts = 3200.0,
+			},
+			{
+				.state = 3,
+				.dcfclk_mhz = 553.0,
+				.fabricclk_mhz = 1067.0,
+				.dispclk_mhz = 757.89,
+				.dppclk_mhz = 685.71,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 0.0,
+				.dscclk_mhz = 287.67,
+				.dram_speed_mts = 2134.0,
+			},
+			{
+				.state = 4,
+				.dcfclk_mhz = 602.0,
+				.fabricclk_mhz = 1333.0,
+				.dispclk_mhz = 847.06,
+				.dppclk_mhz = 757.89,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 0.0,
+				.dscclk_mhz = 318.334,
+				.dram_speed_mts = 3200.0,
+			},
+			{
+				.state = 5,
+				.dcfclk_mhz = 0.0,
+				.fabricclk_mhz = 0.0,
+				.dispclk_mhz = 600.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 0.0,
+				.dscclk_mhz = 205.67,
+				.dram_speed_mts = 0.0,
+			},
+			{
+				.state = 6,
+				.dcfclk_mhz = 0.0,
+				.fabricclk_mhz = 0.0,
+				.dispclk_mhz = 600.0,
+				.dppclk_mhz = 400.0,
+				.phyclk_mhz = 600.0,
+				.socclk_mhz = 0.0,
+				.dscclk_mhz = 205.67,
+				.dram_speed_mts = 0.0,
+			},
+		},
+		.clocks_to_compare = 6,
+	},
+};
+
+/**
+ * dcn20_cap_soc_clocks_test - KUnit test for dcn20_cap_soc_clocks
+ * @test: represents a running instance of a test.
+ */
+static void dcn20_cap_soc_clocks_test(struct kunit *test)
+{
+	struct dcn20_cap_soc_clocks_test_case *test_param =
+		(struct dcn20_cap_soc_clocks_test_case *)test->param_value;
+	int i;
+
+	DC_FP_START();
+	dcn20_cap_soc_clocks(&test_param->bb, test_param->max_clocks);
+	DC_FP_END();
+
+	/* Check if no clock limit is higher than the specified maximum */
+	for (i = 0; i < test_param->bb.num_states; i++) {
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].dcfclk_mhz,
+				test_param->expected_clock_limits[i].dcfclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].fabricclk_mhz,
+				test_param->expected_clock_limits[i].fabricclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].dispclk_mhz,
+				test_param->expected_clock_limits[i].dispclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].dppclk_mhz,
+				test_param->expected_clock_limits[i].dppclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].phyclk_mhz,
+				test_param->expected_clock_limits[i].phyclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].socclk_mhz,
+				test_param->expected_clock_limits[i].socclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].dscclk_mhz,
+				test_param->expected_clock_limits[i].dscclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->bb.clock_limits[i].dram_speed_mts,
+				test_param->expected_clock_limits[i].dram_speed_mts);
+	}
+
+	KUNIT_EXPECT_EQ(test, test_param->clock_states, test_param->bb.num_states);
+}
+
+static struct _vcs_dpi_soc_bounding_box_st original_dcn2_1_soc;
+static struct _vcs_dpi_ip_params_st original_dcn2_1_ip;
+
+/**
+ * dcn20_fpu_dcn21_update_bw_bounding_box_test_init - Store backup copies of DCN global structures
+ * @test: represents a running instance of a test.
+ */
+int dcn20_fpu_dcn21_update_bw_bounding_box_test_init(struct kunit *test)
+{
+	memcpy(&original_dcn2_1_soc, &dcn2_1_soc, sizeof(struct _vcs_dpi_soc_bounding_box_st));
+	memcpy(&original_dcn2_1_ip, &dcn2_1_ip, sizeof(struct _vcs_dpi_ip_params_st));
+
+	return 0;
+}
+
+/**
+ * dcn20_fpu_dcn21_update_bw_bounding_box_test_exit - Restore original values
+ * of DCN global structures
+ * @test: represents a running instance of a test.
+ */
+static void dcn20_fpu_dcn21_update_bw_bounding_box_test_exit(struct kunit *test)
+{
+	memcpy(&dcn2_1_soc, &original_dcn2_1_soc, sizeof(struct _vcs_dpi_soc_bounding_box_st));
+	memcpy(&dcn2_1_ip, &original_dcn2_1_ip, sizeof(struct _vcs_dpi_ip_params_st));
+}
+
+/**
+ * dcn21_update_bw_bounding_box_test - KUnit test for dcn21_update_bw_bounding_box
+ * @test: represents a running instance of a test.
+ */
+static void dcn21_update_bw_bounding_box_test(struct kunit *test)
+{
+	struct dcn21_update_bw_bounding_box_test_case *test_param =
+		(struct dcn21_update_bw_bounding_box_test_case *)test->param_value;
+	int i;
+
+	DC_FP_START();
+	dcn21_update_bw_bounding_box(&test_param->dc, &test_param->bw_params);
+	DC_FP_END();
+
+	KUNIT_EXPECT_EQ(test, test_param->dc.res_pool->res_cap->num_timing_generator,
+			dcn2_1_ip.max_num_otg);
+	KUNIT_EXPECT_EQ(test, test_param->dc.res_pool->pipe_count, dcn2_1_ip.max_num_dpp);
+	KUNIT_EXPECT_EQ(test, test_param->bw_params.num_channels, dcn2_1_soc.num_chans);
+
+	for (i = 0; i <= test_param->clocks_to_compare; i++) {
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].state,
+				dcn2_1_soc.clock_limits[i].state);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].dcfclk_mhz,
+				dcn2_1_soc.clock_limits[i].dcfclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].fabricclk_mhz,
+				dcn2_1_soc.clock_limits[i].fabricclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].dispclk_mhz,
+				dcn2_1_soc.clock_limits[i].dispclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].dppclk_mhz,
+				dcn2_1_soc.clock_limits[i].dppclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].phyclk_mhz,
+				dcn2_1_soc.clock_limits[i].phyclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].socclk_mhz,
+				dcn2_1_soc.clock_limits[i].socclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].dscclk_mhz,
+				dcn2_1_soc.clock_limits[i].dscclk_mhz);
+		KUNIT_EXPECT_EQ(test, test_param->expected_clock_limits[i].dram_speed_mts,
+				dcn2_1_soc.clock_limits[i].dram_speed_mts);
+	}
+
+	if (test_param->bw_params.clk_table.num_entries)
+		KUNIT_EXPECT_EQ(test, test_param->bw_params.clk_table.num_entries,
+				dcn2_1_soc.num_states);
+}
+
+static void dcn20_cap_soc_clocks_test_to_desc(struct dcn20_cap_soc_clocks_test_case *t, char *desc)
+{
+	strcpy(desc, t->desc);
+}
+
+static void dcn21_update_bw_bounding_box_test_to_desc
+(struct dcn21_update_bw_bounding_box_test_case *t, char *desc)
+{
+	strcpy(desc, t->desc);
+}
+
+KUNIT_ARRAY_PARAM(dcn20_cap_soc_clocks,
+		  dcn20_cap_soc_clocks_test_cases,
+		  dcn20_cap_soc_clocks_test_to_desc);
+
+static struct kunit_case dcn20_fpu_test_cases[] = {
+	KUNIT_CASE_PARAM(dcn20_cap_soc_clocks_test, dcn20_cap_soc_clocks_gen_params),
+	{  }
+};
+
+static struct kunit_suite dcn20_fpu_test_suite = {
+	.name = "dml_dcn20_fpu",
+	.test_cases = dcn20_fpu_test_cases,
+};
+
+KUNIT_ARRAY_PARAM(dcn21_update_bw_bounding_box,
+		  dcn21_update_bw_bounding_box_test_data,
+		  dcn21_update_bw_bounding_box_test_to_desc);
+
+static struct kunit_case dcn20_fpu_dcn21_update_bw_bounding_box_test_cases[] = {
+	KUNIT_CASE_PARAM(dcn21_update_bw_bounding_box_test,
+			 dcn21_update_bw_bounding_box_gen_params),
+	{  }
+};
+
+static struct kunit_suite dcn21_update_bw_bounding_box_test_suite = {
+	.name = "dml_dcn20_fpu_dcn21_update_bw_bounding_box_test",
+	.init = dcn20_fpu_dcn21_update_bw_bounding_box_test_init,
+	.exit = dcn20_fpu_dcn21_update_bw_bounding_box_test_exit,
+	.test_cases = dcn20_fpu_dcn21_update_bw_bounding_box_test_cases,
+};
+
+kunit_test_suites(&dcn20_fpu_test_suite, &dcn21_update_bw_bounding_box_test_suite);
-- 
2.43.0

