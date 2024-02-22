Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4498E85FD5D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3C610E57D;
	Thu, 22 Feb 2024 15:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PM2suji4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676BD10E412;
 Thu, 22 Feb 2024 15:59:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVoTDdKrhk7Mx3jmuL3Au/M0Nvx9WKnaXDNSR93uzXRj4Y83ApO77tIJBtbY8BKUpO5wp9jPZwYH4NGUJsjHoF1Ea78DxhWc5wXrR/4cj2IM3XeGZluhpCHwcwh/7JL/llcHh47dOXNv98OBcdq6ay67lLCd9vWvGez5xT/tt1NhIf8hJxXYww1GsIsJldvCZnLmhw08ji+oqcP7atLcgyUn+m6OYTaL0lsOn6EL5IvyhW7d/VeAjzSd1vF9Yzb3qD0DYMeFUMlIgvlINOPJLf2/VXpz5Lkswyy693DY7T8UumsQef59oqvWmHHzhY0XxnBsNGmzP2ODTyBFELmbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhbmX+p45iJj7rG2IzyQXrqCXBX5M4jNAJFYd+u0wJs=;
 b=ghgGKm8alsI8UnfBe5ebhux3dYyiVmYAH+vB9TKE/e0JxspeJ32N7vz82uN/gmMOlGiZ8tBGXqGEPZE5C73AHxefIcQGog25cErdEMP5x2bjuWlID0iXk/mq3xgFXdTkJkyr2ekR5BFMtoittt4D5RdRCkjLZ16Xq5OSRz0TAFGXfWqF9C269gVeZl1hTQiuY4gMEz+qUMjENzm6LeqIzRue8UMhP3cs0gTo5Fg+YS1uswbDNbCgTQWSP8uBKDOsb85KPQYpmYI1LIi9G8QF79TfEUEZTQGPYVl+HDNugAU3akENyJRf3hoaDqhljB43bQPvCw8FFJZLcfViEmGZyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhbmX+p45iJj7rG2IzyQXrqCXBX5M4jNAJFYd+u0wJs=;
 b=PM2suji4bIKgMFDj977VxnbgKImTMn/DehXLjTKRpi3Ki8Ru8nx1Ukw8J34AXo1FvKHEA5HcARkuCoMef72xE5ksDyKkofjL9UkgNfhZG91O8HdAlJpRs1TbsjwqAeT38HI92je8tMrHWfe12bB01Mdd+SQM67hFirZnqTxpKaQ=
Received: from PH0PR07CA0046.namprd07.prod.outlook.com (2603:10b6:510:e::21)
 by SA1PR12MB8161.namprd12.prod.outlook.com (2603:10b6:806:330::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Thu, 22 Feb
 2024 15:59:01 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::3e) by PH0PR07CA0046.outlook.office365.com
 (2603:10b6:510:e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.43 via Frontend
 Transport; Thu, 22 Feb 2024 15:59:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 15:59:01 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 22 Feb
 2024 09:58:58 -0600
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
Subject: [PATCH v5 3/8] drm/amd/display: Introduce KUnit tests to
 display_rq_dlg_calc_20
Date: Thu, 22 Feb 2024 08:56:15 -0700
Message-ID: <20240222155811.44096-4-Rodrigo.Siqueira@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|SA1PR12MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 778c79d4-bb9b-4d58-6dab-08dc33bf2ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tjVDkhOoWGBe6sfxdA69tkunfcoWQ0ma7BgoO0/93hJodp6hsv+zdAqP0a9jg+n4l7+Hw6vhLyGuBaJOAGa3fpJvcTMZTbyW8GictPbrN0VsI6JieBFHxXWmDDa+ms0Hu9M9pfMzg75DRh52OO+7x1W6MKBICr7jlQpeHTbeRJfYIXPjOPXCgAyaG85FSntfZyXlNR8YWVbYv2FHyucXntFSW6+QXsVTh3cUH/FsMZ/8hxT7kEhFtG6OFAyFeJcJy8CuBlc1ucXC8xRixVJ/a+JcBysPqP5g+8VihJ9bXYfLJIoi6ljE2QDCCKbOIynqv/Ugaa1TqMJH3ILs4LWjvK8NK7RuEVY6JOT6KZkGsDGGvIbiACoPQ2jyy+ykM0vpNEVAYtzCjWq5cqXRNvNm0yB8s8gItlXt/YnU7OF17mayHR/7f2tqfkWff3wwaQKy0iYf+I31cYTxtaPs+VIdH4pbJouFmHv64jXhELpVIIiE1FIRp3QMpKn3OlrmP9EzhruAvZWosz4IzHcJ2EoN9KRITNFJwxgBhkBWwii0EQ5NSVP5VzzI05xMEoQPaRnuzdGXmrTrRBcOVygRky+WYxjl9HYbdrwjT8Jq+atDQERScTTDqGZu1qJbYISmib76XcWNwo+wvDZO3Bldh2VlKe5GQTalfC/x12XcseYxI0c=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(46966006)(40470700004)(921011); DIR:OUT; SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 15:59:01.5460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 778c79d4-bb9b-4d58-6dab-08dc33bf2ff4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8161
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

From: Isabella Basso <isabbasso@riseup.net>

This adds tests to the bit encoding format verification functions on the
file. They're meant to be simpler so as to provide a proof of concept on
testing DML code.

Change since v4:
- Use DRM_AMD_DC_FP guard for FPU tests

Signed-off-by: Isabella Basso <isabbasso@riseup.net>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/Kconfig           |  13 ++
 .../dc/dml/dcn20/display_rq_dlg_calc_20.c     |   4 +
 .../drm/amd/display/test/kunit/.kunitconfig   |   1 +
 .../dml/dcn20/display_rq_dlg_calc_20_test.c   | 124 ++++++++++++++++++
 4 files changed, 142 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/display_rq_dlg_calc_20_test.c

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index d54036dcac78..ab52b135db85 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -64,6 +64,19 @@ config DCE_KUNIT_TEST
 
 		If unsure, say N.
 
+config DML_KUNIT_TEST
+	bool "Run all KUnit tests for DML" if !KUNIT_ALL_TESTS
+	depends on DRM_AMD_DC_FP && KUNIT
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
index 548cdef8a8ad..45f75a7f84c7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
@@ -1683,3 +1683,7 @@ static void calculate_ttu_cursor(struct display_mode_lib *mode_lib,
 		ASSERT(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
 	}
 }
+
+#if IS_ENABLED(CONFIG_DML_KUNIT_TEST)
+#include "../../../test/kunit/dc/dml/dcn20/display_rq_dlg_calc_20_test.c"
+#endif
diff --git a/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig b/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
index 7a58f75a8dfc..eb6f81601757 100644
--- a/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
+++ b/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
@@ -5,3 +5,4 @@ CONFIG_DRM_AMDGPU=y
 CONFIG_DRM_AMD_DC=y
 CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
 CONFIG_DCE_KUNIT_TEST=y
+CONFIG_DML_KUNIT_TEST=y
diff --git a/drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/display_rq_dlg_calc_20_test.c b/drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/display_rq_dlg_calc_20_test.c
new file mode 100644
index 000000000000..e6d3e356205c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/display_rq_dlg_calc_20_test.c
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

