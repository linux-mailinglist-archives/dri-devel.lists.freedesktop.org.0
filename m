Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B232F83DDF9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 16:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F9710FBE2;
	Fri, 26 Jan 2024 15:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2075.outbound.protection.outlook.com [40.107.96.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FC810FBC3;
 Fri, 26 Jan 2024 15:51:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHNXgACxssF/ykug+Oefm9GXL0xtpPmVsoVFT32q9XgCIcMOOH/DQ7+nPekIGp5Qgw/cocihVN1KlyN4d75I178lv/4xX4utxSRMWGzaU1TzM+ElroHfr9xPEChk3cRwvyCsKHu3uyC3x0t5CUVFSNcCNxj8Xt8iynjdBaeiOdsIqo1eGl0uZlL+F7FrZ0QuYrwSQxCg1TivRdH3kQiWsyVOrwys2WCKYPmZfeCSkVjam19nbjVG870JqFzNYjHhxiLAyuwmRY0G56jOBQ0+ZLilUa1KbTsjXCvjvDxDrpfKypNc29dP478r3Qjw3Y7LLnKh9nsOTs+ooR/og3WYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guALh/LN/DFE1aPxTpITIvXFX9nEMMw3k+9LpnRm5nY=;
 b=BxLXZJfPNK+rBD3CWMwVIeN6FmoT7WYmnlcAjgDa1siobjKguUeqMyLjx24zoUWyabSeZ8W6RNyEKlfirexcuA344t45M5SoEONcpv/4lxj/fSy6rE9jvbmKBk8QoIsSW8KlI0NiSzKu5xOMPYURCnsxMX/Hysc8jcWCz4LgU/dntECQfDnkUjovr0l6L3d3q6F/YXqND8KHxHXfvD15Fdz+NhdrAoCXi2foiju7FlHVgrqFzr1MwwvqF0U+yV0Ikj69YxhrEWZTHlixVwE0aI+0Rab9D256aAw2VTTWr4MjFWrPHp1CdSosCkh+PdWwndZ2ZzQBHXVpHDP1wKrWZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guALh/LN/DFE1aPxTpITIvXFX9nEMMw3k+9LpnRm5nY=;
 b=0NBiwnbWfczfn/8FsXAlRC1m6T9X35s4Kl4+SUZLpILdW4mUVG85bcwbRepv4ijvVyj4cLgTezQK8FFkvWvsdeh16PGcjpNLXKWc0TJfuz/R7/GmbfCQPgx5kAkuLJp2lanKGBwGOidhFLYVeZQTvoz1sXmqZC7hllEjqN2HYi0=
Received: from SJ0PR03CA0074.namprd03.prod.outlook.com (2603:10b6:a03:331::19)
 by DM4PR12MB7599.namprd12.prod.outlook.com (2603:10b6:8:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 15:51:28 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::49) by SJ0PR03CA0074.outlook.office365.com
 (2603:10b6:a03:331::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24 via Frontend
 Transport; Fri, 26 Jan 2024 15:51:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 26 Jan 2024 15:51:27 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 26 Jan
 2024 09:51:24 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, Nicholas Choi
 <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>, David Gow
 <davidgow@google.com>, <hersenxs.wu@amd.com>, <magalilemes00@gmail.com>
Subject: [PATCH v4 3/8] drm/amd/display: Introduce KUnit tests to
 display_rq_dlg_calc_20
Date: Fri, 26 Jan 2024 08:48:03 -0700
Message-ID: <20240126155022.1184856-4-Rodrigo.Siqueira@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|DM4PR12MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 00089b16-2411-41f2-f510-08dc1e86a875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8IozJTWwcPkwCSKbIQwtj3IAmFFMEjSguoAZXSkO97Gp/s99OWcRok/Vo/M9sB710CjAj77hZJJNY8qZHM9hqVvzFDuFtfqWum4kKAdW04FPj6+0M20KB/PJutQkpz9hn8KlUiLtlmowrwB3UTpAmbakSqeD+LvKUzezUkaR4+biqnYw11LengWgDNgCeQOBxTLA9aivadN4h/TnT3oRsYp5Y6A0cBADOkldMcHcZYa3rFUai7/GCROJ0MlBPWimXrcD+GtfXAOjr8FTA6SZhcMprYMx3m3qcU5Wfyhlg0LxvR57wj7OcMhkPBB5aREPFFHaUJDcMbVZcaYGt6OkvhVia11evcRattgIY+M4G5wKm3yu5b5/Ld4HBXQD7JKVb0WJTrRXcrBk5CCjf+SWzYB/rDBxWaNMQtRAJlBKsHoTUMH2kQYL3pa4v+GpCNYn/6X1uOxqQhIvHWX5pB3mPa3LirgB1tGpMnGC/TtxyQ1KhxFfwKK6IWKxbaLSd2Ede2thkJp17+f5E7AWUmffAEhJcsRlXcF8VsqVTrHu9TNIMbcbZkTupv7zEI9bGt/FAZFMvOyzu+rhvHierF4GJyGxqs/obe3iAHnHCXEn6iiO88/QlikhMQwACe9yisccqY798wRNPk0RrVo07DS5q1PJpEzXFouSxfFKEweOdmRQS/L6CdU4YGOIPVhh1J54FROEBVr3g4mW9JnNYhU8jrJuHoDZ9sLaumblORqJwytezK4SeDsNKCYwf/rzmOlenGrjedEQn+Pn4LPCaPFNBSaC1m97aU/X85Lpg5OzdeY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(186009)(64100799003)(82310400011)(1800799012)(451199024)(36840700001)(46966006)(40470700004)(356005)(6666004)(41300700001)(478600001)(40480700001)(82740400003)(36860700001)(40460700003)(47076005)(81166007)(26005)(336012)(426003)(66574015)(16526019)(2616005)(83380400001)(316002)(54906003)(5660300002)(7416002)(2906002)(8936002)(36756003)(4326008)(8676002)(110136005)(70586007)(70206006)(86362001)(1076003)(921011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 15:51:27.7709 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00089b16-2411-41f2-f510-08dc1e86a875
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7599
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

From: Isabella Basso <isabbasso@riseup.net>

This adds tests to the bit encoding format verification functions on the
file. They're meant to be simpler so as to provide a proof of concept on
testing DML code.

Signed-off-by: Isabella Basso <isabbasso@riseup.net>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/Kconfig           |  13 ++
 .../dc/dml/dcn20/display_rq_dlg_calc_20.c     |   4 +
 .../dml/dcn20/display_rq_dlg_calc_20_test.c   | 124 ++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_rq_dlg_calc_20_test.c

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index d54036dcac78..877ba3be6aed 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -64,6 +64,19 @@ config DCE_KUNIT_TEST
 
 		If unsure, say N.
 
+config DML_KUNIT_TEST
+	bool "Run all KUnit tests for DML" if !KUNIT_ALL_TESTS
+	depends on DRM_AMD_DC_DCN && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+		Enables unit tests for the Display Controller Engine. Only useful for kernel
+		devs running KUnit.
+
+		For more information on KUnit and unit tests in general please refer to
+		the KUnit documentation in Documentation/dev-tools/kunit/.
+
+		If unsure, say N.
+
 config AMD_DC_BASICS_KUNIT_TEST
 	bool "Enable KUnit tests for the 'basics' sub-component of DAL" if !KUNIT_ALL_TESTS
 	depends on DRM_AMD_DC && KUNIT
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
index 548cdef8a8ad..ab688c9ba0d1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
@@ -1683,3 +1683,7 @@ static void calculate_ttu_cursor(struct display_mode_lib *mode_lib,
 		ASSERT(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
 	}
 }
+
+#if IS_ENABLED(CONFIG_DML_KUNIT_TEST)
+#include "../../../tests/dc/dml/dcn20/display_rq_dlg_calc_20_test.c"
+#endif
diff --git a/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_rq_dlg_calc_20_test.c b/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_rq_dlg_calc_20_test.c
new file mode 100644
index 000000000000..e6d3e356205c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_rq_dlg_calc_20_test.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: MIT
+/*
+ * KUnit tests for dml/dcn20/display_rq_dlg_calc_20.c
+ *
+ * Copyright (c) 2022, Isabella Basso <isabbasso@riseup.net>
+ */
+
+#include <kunit/test.h>
+#include "dml/display_mode_lib.h"
+
+/**
+ * get_bytes_per_element_test - KUnit test for get_bytes_per_element
+ * @test: represents a running instance of a test.
+ */
+static void get_bytes_per_element_test(struct kunit *test)
+{
+	/* last numbers should tell us the horizontal 4-element region binary
+	 * size N used for subsampling, thus giving us N/8 bytes per element
+	 */
+	/* note that 4:4:4 is not subsampled */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_16, false), 2);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_32, false), 4);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_64, false), 8);
+
+	/* dcn20 doesn't support bit depths over 10b */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_420_12, false), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_420_12, true), 0);
+
+	/* dm_444_XX are not dual plane */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_16, true), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_32, true), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_64, true), 0);
+
+	/* in the dm_42* values, last numbers specify bit depth, demanding we
+	 * treat chroma and luma channels separately
+	 */
+	/* thus we'll now have ceil(N/8) bytes for luma */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_420_8, false), 1);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_420_10, false), 2);
+	/* and double the luma value for accommodating blue and red chroma
+	 * channels
+	 */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_420_8, true), 2);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_420_10, true), 4);
+
+	/* monochrome encodings should mirror non-subsampled variants */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_mono_8, false),
+			get_bytes_per_element(dm_444_8, false));
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_mono_16, false),
+			get_bytes_per_element(dm_444_16, false));
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_mono_16, true), 0);
+
+	/* dcn20 doesn't support 4:2:2 chroma subsampling */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_422_8, false), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_422_8, true), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_422_10, false), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_422_10, true), 0);
+
+	/* dcn20 doesn't support RGBE encodings */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_rgbe, false), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_rgbe, true), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_rgbe_alpha, false), 0);
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_rgbe_alpha, true), 0);
+
+	/* as in the first values, _8 here represents horizontal binary length */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_8, false), 1);
+	/* in a non-subsampled monochrome encoding chroma and luma should be the
+	 * same length
+	 */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_444_8, false),
+			get_bytes_per_element(dm_444_8, true));
+
+	/* as dm_mono_8 == dm_444_8, it must behave the same way */
+	KUNIT_ASSERT_EQ(test, get_bytes_per_element(dm_mono_8, false),
+			get_bytes_per_element(dm_mono_8, true));
+}
+
+/**
+ * is_dual_plane_test - KUnit test for is_dual_plane
+ * @test: represents a running instance of a test.
+ */
+static void is_dual_plane_test(struct kunit *test)
+{
+	/* strictly speaking monochrome formats are not dual plane, but they're
+	 * included here for completeness
+	 */
+	int source_format_count = 11;
+
+	for (int i = 0; i < source_format_count; i++) {
+		/* dcn20 doesn't support other dual plane formats */
+		if (i == 3 || i == 4)
+			KUNIT_ASSERT_TRUE(test, is_dual_plane(i));
+		else
+			KUNIT_ASSERT_FALSE(test, is_dual_plane(i));
+	}
+}
+
+/**
+ * get_blk_size_bytes_test - KUnit test for get_blk_size_bytes
+ * @test: represents a running instance of a test.
+ */
+static void get_blk_size_bytes_test(struct kunit *test)
+{
+	/* corresponds to 4^4 kB tiles */
+	KUNIT_ASSERT_EQ(test, get_blk_size_bytes(dm_256k_tile), 256 * 1024);
+	/* corresponds to 4^3 kB tiles */
+	KUNIT_ASSERT_EQ(test, get_blk_size_bytes(dm_64k_tile), 64 * 1024);
+	/* corresponds to 4^1 kB tiles */
+	KUNIT_ASSERT_EQ(test, get_blk_size_bytes(dm_4k_tile), 4 * 1024);
+}
+
+static struct kunit_case dcn20_rq_dlg_calc_20_test_cases[] = {
+	KUNIT_CASE(get_bytes_per_element_test),
+	KUNIT_CASE(is_dual_plane_test),
+	KUNIT_CASE(get_blk_size_bytes_test),
+	{  }
+};
+
+static struct kunit_suite dcn20_rq_dlg_calc_20_test_suite = {
+	.name = "display_rq_dlg_calc_20",
+	.test_cases = dcn20_rq_dlg_calc_20_test_cases,
+};
+
+kunit_test_suites(&dcn20_rq_dlg_calc_20_test_suite);
-- 
2.43.0

