Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A5A85FD68
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8289210E9A4;
	Thu, 22 Feb 2024 15:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ow0tIsYo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A02810E962;
 Thu, 22 Feb 2024 15:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsZD67BpXCcWBSrwAyS5M6WXrIDawlzKxDgxoQ6rTmmrhhH65u9Vn/VGbjknIdLwTKqGXc6c7wBGbkrLwAM6IksSCJ2uUQkUHzHC1zKviKyhzWLRH48bX3MlWmh/5nZx7ZCYdNOxfU6DS/4At//a8f/mUtS6pTXVVkEXtFQ/6C+2oHvUQmCQjF1RiHh9cZfFl+U0Tk46F/u3K4hfO/b138ZfVfeIC3AWS3drsxdacQi2m2T+7QbYxZty3BP2hvl81l09skDaOecTMJN6oGPcI8/SYsQ7lfk+8y84y1pjruXEUv9rVfcpwpOVTW7H9sDMV3dfZSzRfa4sr3GDzxzMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/SIUbHycRUIV5sYPcyjzki8j7RmcIeGLgJ2RKo6fm0=;
 b=RdspiSsoTkQOxYGyUAIGoK9JtMkk3xEtwY+RRbzKBcE7ZZVIvnjVWLfYFAOpUt4xLIS/2RM4F55y3SfWDMCPS4WDA0AaAx2SYDCKNzAyxqf7uHdPBFXbcSlhJ+2S6kzeJRdeCfzG9qiiVT9N0Gf9cK+gWzu8A0/GwN39su4ndF4X+4+Zl+Ll6GlkKi+Zn5miIHxO1WLzYIRjNUCAoF/zL9pqU2oDsNbdIG45vP8m3e3aT1qV/PSOzT5oiCutDm2aUO4r6crWUQpCHWKxp3z3JaB8a7qNA3OrMXcVtLaMfrC6rPNoqkzImfe6GiMqpdvWuehz+6vwck7/V6yI+SGzqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/SIUbHycRUIV5sYPcyjzki8j7RmcIeGLgJ2RKo6fm0=;
 b=Ow0tIsYowOBtDhPQ4qVoOPSNbE/WL0PNWATEvfuHaNrub2aNTIUrfr8qH/DoYQohn9bb5OVm+FPriRUICUlYdAOgWYtg3URAeMn1CKc4Kv0EPDsbmkiN7IS02+6d5eoFZ91hk9Eib/mQGlWHA/ykI9ORYChVil+LnMNEP/gaHgk=
Received: from PH7PR17CA0026.namprd17.prod.outlook.com (2603:10b6:510:323::19)
 by MW4PR12MB6754.namprd12.prod.outlook.com (2603:10b6:303:1eb::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 15:59:10 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::22) by PH7PR17CA0026.outlook.office365.com
 (2603:10b6:510:323::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.43 via Frontend
 Transport; Thu, 22 Feb 2024 15:59:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 15:59:10 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 22 Feb
 2024 09:59:07 -0600
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
 <javierm@redhat.com>
Subject: [PATCH v5 6/8] drm/amd/display: Introduce KUnit tests for dcn20_fpu
Date: Thu, 22 Feb 2024 08:56:18 -0700
Message-ID: <20240222155811.44096-7-Rodrigo.Siqueira@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|MW4PR12MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f94b22-cc38-472b-dcc8-08dc33bf350f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8IgxNAo+ZTkiC3YU93/OuO1D+eA4CqaAYcU7K3fgH0VxLWn+4ZNBa3aP7xrF6MZMLBjNG8RfOL/XnUivuSjHJVUpjqW98H0NwCjZwwrl1jMYhwCBBu9gy9VwCbZMCk65sx4vOSLCQ4b1mZK7X4U1bu7rUYjYlnEJ5/WewUZgYGj8akxYk1+40uW1aydYWkls2ms2C5rX4VtjB76QWcy1SLQJ/VxBPMd4v4gC/TlilgrLYX692rex7eE4zSV3JsjzniHoOoK4qeYZ68RvMg71c3lzw23O98qLGFIJ5pypC0Qeq9SgwbY5y2aLSB85RhgY6p8ZMPR+hiY861ebt3j8ySmaQjP6L7A32QeRaAxi86TP1aHwec2jDqQiWwz0QOEBUNxpof8Tpf7VALv+ji0kea6o1GC7UI3QnQe5RTHB06jXbnQumULRd+OIibNGbj/xjL60x3vWPYLVMUDuDO+aCRvHJnhNQYP58msrz+fySF2np8Uvq/mq6oYeSDW1Kl9ngim3d44Th3Q82qnwiFHDC7cWGNPQ2bftzjnSKp++IrwxeLsgH9LN4v+nxT/KO5waaDzew+ljfd+gDsL1T/UFWRma1W6zoEl2V87uwmBs243lh2UfrvZEl0NkVZYVgCHf4Xx9oye2W17n9A0W4fStzTbe6b+1H8VXkayDEeEiOAk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(40470700004)(46966006)(921011); DIR:OUT; SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 15:59:10.1301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f94b22-cc38-472b-dcc8-08dc33bf350f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6754
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

From: Magali Lemes <magalilemes00@gmail.com>

This commit adds unit tests to the functions dcn20_cap_soc_clocks and
dcn21_update_bw_bounding_box from dcn20/dcn20_fpu.

Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 .../gpu/drm/amd/display/test/kunit/Makefile   |   3 +-
 .../test/kunit/dc/dml/dcn20/dcn20_fpu_test.c  | 561 ++++++++++++++++++
 2 files changed, 563 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/dcn20_fpu_test.c

diff --git a/drivers/gpu/drm/amd/display/test/kunit/Makefile b/drivers/gpu/drm/amd/display/test/kunit/Makefile
index ec3883029052..a6ad449f9885 100644
--- a/drivers/gpu/drm/amd/display/test/kunit/Makefile
+++ b/drivers/gpu/drm/amd/display/test/kunit/Makefile
@@ -9,7 +9,8 @@ endif
 
 ifdef CONFIG_DML_KUNIT_TEST
 	CFLAGS_$(AMDDALPATH)/test/kunit/dc/dml/display_mode_vba_test.o := $(dml_ccflags)
-	DC_TESTS += dc/dml/display_mode_vba_test.o
+	CFLAGS_$(AMDDALPATH)/test/kunit/dc/dml/dcn20/dcn20_fpu_test.o := $(dml_ccflags)
+	DC_TESTS += dc/dml/display_mode_vba_test.o dc/dml/dcn20/dcn20_fpu_test.o
 endif
 
 AMD_DAL_DC_TESTS = $(addprefix $(AMDDALPATH)/test/kunit/,$(DC_TESTS))
diff --git a/drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/dcn20_fpu_test.c b/drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/dcn20_fpu_test.c
new file mode 100644
index 000000000000..c51a0afbe518
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/dcn20_fpu_test.c
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
+#include "dcn21/dcn21_resource.h"
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
+static int dcn20_fpu_dcn21_update_bw_bounding_box_test_init(struct kunit *test)
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

