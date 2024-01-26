Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93A983DDFE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 16:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D4310FBC1;
	Fri, 26 Jan 2024 15:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587C510FBC2;
 Fri, 26 Jan 2024 15:51:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+Y1Bjqavcpo3NLYycdh9IPpHr/aPA6cb8gbvNu9P1dtoBoxTIoAHCRwkM4oDsSOcfZoZiiCag58rinSFzoHVi3bKOE4PkJ1k19hBWUwDJ+dAPCfYc9NAXYWUj2pGL7RUxqw/u4wvudBxNAaP1qqalsggRSe46HyicgZjlJPg12CXhFzB/t70JoDzILi8gJSKzaDDXowCrQZara500TbB3M31j/nji1ERNnZjyHy0BugUUrCCwbvnLGf+Jcq4u9vK2nVPxyaOZmK21ty+lXU8B68zWBhYWMLgFEZnBDQjC6h6RMe2V0mZMLT9SYcOqqDVxJYnUk3xY2vSuJsSFZiqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgNSpUKd2DbYguJdVHuJS3Znb09skLDIA8fhHAnCZSo=;
 b=RDOfaXK/IQMsPMZ5CfPJL7YILTJEZwbRGZvCcncCucq4b7OjCMa4HR23/iT2E9Cebmi1zMr7WRCW5cGiUwjinyHfp2OoES2BLFYtiVQ6rouNbybvmq/vZ5sQtqIrMG8lzwsxjTMAHO9OQfdAfZi5kAWYCkSfux5Gv38lwA/+JwiL2JlIcC8aAv8pjMLwzIa05KJ5RhE/oXFNiwVPrQZY3//bqvY5lwtoPBk1ElZ7vvkHif4its3BAAAZbfu81gWWsp4ZhSHz3Uc0VGbWV/g2ehO2PYBCjEQkIeTiDGLaEyw14koZxHniOdtoztpVGwX4oSdQBFghcSBhYUL/736I9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgNSpUKd2DbYguJdVHuJS3Znb09skLDIA8fhHAnCZSo=;
 b=BlTxOvb827z2ETACHE2PUO1HyuPfvVfpU/gH9X8whf5fRWFJrwYrd4sm2iT84z1pydSD4KZwm4CpeJSpqf/UqES0ZnB64stzyU8PjrhD+0ScI3RVhVGkgO5c168BbFlr18RsyOnI1C14Mr/5hUL2shHnF87RAKLyNnuVPDJ0rTc=
Received: from SJ0PR03CA0063.namprd03.prod.outlook.com (2603:10b6:a03:331::8)
 by DS0PR12MB7946.namprd12.prod.outlook.com (2603:10b6:8:151::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 15:51:23 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::5f) by SJ0PR03CA0063.outlook.office365.com
 (2603:10b6:a03:331::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27 via Frontend
 Transport; Fri, 26 Jan 2024 15:51:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 26 Jan 2024 15:51:22 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 26 Jan
 2024 09:51:18 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, Nicholas Choi
 <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>, David Gow
 <davidgow@google.com>, <hersenxs.wu@amd.com>, <magalilemes00@gmail.com>
Subject: [PATCH v4 1/8] drm/amd/display: Introduce KUnit tests for fixed31_32
 library
Date: Fri, 26 Jan 2024 08:48:01 -0700
Message-ID: <20240126155022.1184856-2-Rodrigo.Siqueira@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|DS0PR12MB7946:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a9f236-f5f6-4957-dbe3-08dc1e86a592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n8auX/zENLpccWpuaeiDjA2kajixzgYgQcJWD0YNjq0VPNk27QV1aE4L2/7Tt7/1IMbA/3N75o15RovIfpx5HkhTxOW/bBI/E2CrgRiWxtL9KUoBlFx+h1xtu+fePKDmy2S5xZo4qgG2KgFakgLiM8nHt7lhCfM+1VRplROCxOjfHRZI+Ria0yPP++PtQhOg3E9LTlbYTpOwb9epE2ajfRZ3DfqwMyhOzn5dNkitYTgVNWuipZWsPLBSGl+hUaBj7LXgE1tkxx6y1zvbx3YULIeyK49/5WdRDvb6QG12uXEPo01PI4PYP09oBQizPbUd8xMpNRx+t0ri0B5grZN/bF3ig0V1BxLhnfhenvhz2lvIKMg5MY+AUvq2UgW7aDZdStzrlLeQ/DQAW+m+qqp7DFlOA/TBUsybA7HMcaskwzp3cCerrcK8prWnGIFtVajrUWgMfsDZK0vprmZ88j60beZkP7buUBUF3nPxRgaaG87/8Daprtwt9C8OQGrwG2B6biLfnEI27OTt6ZwspQjMRp1gtC2qe1cOXStQWaGdmEOi0CLoSC58Y1x+QG69DxLIO+Wib0vk1O+/xy5pCq+ocse3Dzh2Ce3iZhJW6rKtHWYWn2ICbbWbnRpBn7dt6caSuaANtZUCpNwlLKzVZgd3H2h31DL1nmBagQwDFCTbVFLh0D/J6xUbe4tYFSD2l3IHOAjQ0u0usuXpMmx9UWpOeqj1jn0yhMJiKcrtXsjT9PXQeayTgy0cIPXCXvvXQJDcoDzO4lFuWzVSAAFoOjlhPpUREOoOIEaDLjTlk6MMIhs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(82310400011)(40470700004)(36840700001)(46966006)(921011)(41300700001)(426003)(336012)(26005)(66574015)(2616005)(40460700003)(40480700001)(1076003)(83380400001)(36756003)(36860700001)(54906003)(478600001)(16526019)(6666004)(47076005)(82740400003)(356005)(81166007)(5660300002)(110136005)(70586007)(7416002)(2906002)(316002)(86362001)(70206006)(30864003)(8676002)(8936002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 15:51:22.9115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a9f236-f5f6-4957-dbe3-08dc1e86a592
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7946
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

From: Tales Aparecida <tales.aparecida@gmail.com>

The fixed31_32 library performs a lot of the mathematical operations
involving fixed-point arithmetic and the conversion of integers to
fixed-point representation.

This unit tests intend to assure the proper functioning of the basic
mathematical operations of fixed-point arithmetic, such as
multiplication, conversion from fractional to fixed-point number,
and more. Use kunit_tool to run:

$ ./tools/testing/kunit/kunit.py run --arch=x86_64 \
	--kunitconfig=drivers/gpu/drm/amd/display/tests/

Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/Kconfig           |  13 +
 drivers/gpu/drm/amd/display/Makefile          |   2 +-
 drivers/gpu/drm/amd/display/tests/Makefile    |  12 +
 .../display/tests/dc/basics/fixpt31_32_test.c | 232 ++++++++++++++++++
 4 files changed, 258 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/display/tests/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 901d1961b739..e35eef026097 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -51,4 +51,17 @@ config DRM_AMD_SECURE_DISPLAY
 	  This option enables the calculation of crc of specific region via
 	  debugfs. Cooperate with specific DMCU FW.
 
+config AMD_DC_BASICS_KUNIT_TEST
+	bool "Enable KUnit tests for the 'basics' sub-component of DAL" if !KUNIT_ALL_TESTS
+	depends on DRM_AMD_DC && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+		Enables unit tests for the Display Core. Only useful for kernel
+		devs running KUnit.
+
+		For more information on KUnit and unit tests in general please refer to
+		the KUnit documentation in Documentation/dev-tools/kunit/.
+
+		If unsure, say N.
+
 endmenu
diff --git a/drivers/gpu/drm/amd/display/Makefile b/drivers/gpu/drm/amd/display/Makefile
index 92a5c5efcf92..e732a0987d9d 100644
--- a/drivers/gpu/drm/amd/display/Makefile
+++ b/drivers/gpu/drm/amd/display/Makefile
@@ -45,7 +45,7 @@ subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/modules/hdcp
 #TODO: remove when Timing Sync feature is complete
 subdir-ccflags-y += -DBUILD_FEATURE_TIMING_SYNC=0
 
-DAL_LIBS = amdgpu_dm dc	modules/freesync modules/color modules/info_packet modules/power dmub/src
+DAL_LIBS = amdgpu_dm dc	modules/freesync modules/color modules/info_packet modules/power dmub/src tests
 
 DAL_LIBS += modules/hdcp
 
diff --git a/drivers/gpu/drm/amd/display/tests/Makefile b/drivers/gpu/drm/amd/display/tests/Makefile
new file mode 100644
index 000000000000..ef16497318e8
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: MIT
+#
+# Makefile for the KUnit Tests for DC
+#
+
+ifdef CONFIG_AMD_DC_BASICS_KUNIT_TEST
+	DC_TESTS += dc/basics/fixpt31_32_test.o
+endif
+
+AMD_DAL_DC_TESTS = $(addprefix $(AMDDALPATH)/tests/,$(DC_TESTS))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_DC_TESTS)
diff --git a/drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c b/drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c
new file mode 100644
index 000000000000..2fc489203499
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: MIT
+/* Unit tests for display/include/fixed31_32.h and dc/basics/fixpt31_32.c
+ *
+ * Copyright (C) 2022, Tales Aparecida <tales.aparecida@gmail.com>
+ */
+
+#include <kunit/test.h>
+#include "os_types.h"
+#include "fixed31_32.h"
+
+static const struct fixed31_32 dc_fixpt_minus_one = { -0x100000000LL };
+
+/**
+ * dc_fixpt_from_int_test - KUnit test for dc_fixpt_from_int
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_from_int_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+
+	res = dc_fixpt_from_int(0);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_zero.value);
+
+	res = dc_fixpt_from_int(1);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_from_int(-1);
+	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
+
+	res = dc_fixpt_from_int(INT_MAX);
+	KUNIT_EXPECT_EQ(test, res.value, 0x7FFFFFFF00000000LL);
+
+	res = dc_fixpt_from_int(INT_MIN);
+	KUNIT_EXPECT_EQ(test, res.value,
+			0x8000000000000000LL); /* implicit negative signal */
+}
+
+/**
+ * dc_fixpt_from_fraction_test - KUnit test for dc_fixpt_from_fraction
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_from_fraction_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+
+	/* Assert signal works as expected */
+	res = dc_fixpt_from_fraction(1LL, 1LL);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(-1LL, 1LL);
+	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(1LL, -1LL);
+	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(-1LL, -1LL);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	/* Assert that the greatest parameter values works as expected */
+	res = dc_fixpt_from_fraction(LLONG_MAX, LLONG_MAX);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(LLONG_MIN, LLONG_MIN);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	/* Edge case using the smallest fraction possible without LSB rounding */
+	res = dc_fixpt_from_fraction(1, 1LL << (FIXED31_32_BITS_PER_FRACTIONAL_PART));
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_epsilon.value);
+
+	/* Edge case using the smallest fraction possible with LSB rounding */
+	res = dc_fixpt_from_fraction(1, 1LL << (FIXED31_32_BITS_PER_FRACTIONAL_PART + 1));
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_epsilon.value);
+
+	/* Assert an nil numerator is a valid input */
+	res = dc_fixpt_from_fraction(0LL, LLONG_MAX);
+	KUNIT_EXPECT_EQ(test, res.value, 0LL);
+
+	/* Edge case using every bit of the decimal part without rounding */
+	res = dc_fixpt_from_fraction(8589934590LL, 8589934592LL);
+	KUNIT_EXPECT_EQ(test, res.value, 0x0FFFFFFFFLL);
+
+	res = dc_fixpt_from_fraction(-8589934590LL, 8589934592LL);
+	KUNIT_EXPECT_EQ(test, res.value, -0x0FFFFFFFFLL);
+
+	/* Edge case using every bit of the decimal part then rounding LSB */
+	res = dc_fixpt_from_fraction(8589934591LL, 8589934592LL);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(-8589934591LL, 8589934592LL);
+	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
+	/*  A repeating decimal in binary representation that doesn't round up the LSB */
+	res = dc_fixpt_from_fraction(4, 3);
+	KUNIT_EXPECT_EQ(test, res.value, 0x0000000155555555LL);
+
+	res = dc_fixpt_from_fraction(-4, 3);
+	KUNIT_EXPECT_EQ(test, res.value, -0x0000000155555555LL);
+
+	/* A repeating decimal in binary representation that rounds up the LSB */
+	res = dc_fixpt_from_fraction(5, 3);
+	KUNIT_EXPECT_EQ(test, res.value, 0x00000001AAAAAAABLL);
+
+	res = dc_fixpt_from_fraction(-5, 3);
+	KUNIT_EXPECT_EQ(test, res.value, -0x00000001AAAAAAABLL);
+}
+
+/**
+ * dc_fixpt_mul_test - KUnit test for dc_fixpt_mul
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_mul_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+	struct fixed31_32 arg;
+
+	/* Assert signal works as expected */
+	res = dc_fixpt_mul(dc_fixpt_one, dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_mul(dc_fixpt_minus_one, dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_minus_one.value);
+
+	res = dc_fixpt_mul(dc_fixpt_one, dc_fixpt_minus_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_minus_one.value);
+
+	res = dc_fixpt_mul(dc_fixpt_minus_one, dc_fixpt_minus_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	/* Assert that the greatest parameter values works as expected */
+	arg.value = LONG_MAX;
+	res = dc_fixpt_mul(arg, dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, arg.value);
+
+	arg.value = LONG_MIN;
+	res = dc_fixpt_mul(arg, dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, arg.value);
+
+	arg.value = LONG_MAX;
+	res = dc_fixpt_mul(dc_fixpt_one, arg);
+	KUNIT_EXPECT_EQ(test, res.value, arg.value);
+
+	arg.value = LONG_MIN;
+	res = dc_fixpt_mul(dc_fixpt_one, arg);
+	KUNIT_EXPECT_EQ(test, res.value, arg.value);
+
+	/* Assert it doesn't round LSB as expected */
+	arg.value = 0x7FFFFFFF7fffffffLL;
+	res = dc_fixpt_mul(arg, dc_fixpt_epsilon);
+	KUNIT_EXPECT_EQ(test, res.value, 0x000000007FFFFFFF);
+
+	/* Assert it rounds LSB as expected */
+	arg.value = 0x7FFFFFFF80000000LL;
+	res = dc_fixpt_mul(arg, dc_fixpt_epsilon);
+	KUNIT_EXPECT_EQ(test, res.value, 0x0000000080000000);
+}
+
+/**
+ * dc_fixpt_sqr_test - KUnit test for dc_fixpt_sqr
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_sqr_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+	struct fixed31_32 arg;
+
+	arg.value = dc_fixpt_one.value;
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	arg.value = dc_fixpt_minus_one.value;
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	arg.value = 0;
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value, 0);
+
+	/* Test some recognizable values */
+	arg = dc_fixpt_from_int(100);
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_from_int(10000).value);
+
+	arg = dc_fixpt_from_fraction(1, 100);
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value,
+			dc_fixpt_from_fraction(1, 10000).value);
+
+	/* LSB rounding */
+	arg = dc_fixpt_from_fraction(3, 2);
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value,
+			dc_fixpt_from_fraction(9, 4).value + 1LL);
+}
+
+/**
+ * dc_fixpt_recip_test - KUnit test for dc_fixpt_recip
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_recip_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+	struct fixed31_32 arg;
+
+	/* Assert 1/1 works as expected */
+	res = dc_fixpt_recip(dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	/* Assert smallest parameters work as expected. */
+	arg.value = 3LL;
+	res = dc_fixpt_recip(arg);
+	KUNIT_EXPECT_EQ(test, res.value, 0x5555555555555555LL);
+
+	arg.value = -3LL;
+	res = dc_fixpt_recip(arg);
+	KUNIT_EXPECT_EQ(test, res.value, -0x5555555555555555LL);
+}
+
+static struct kunit_case dc_basics_fixpt31_32_test_cases[] = {
+	KUNIT_CASE(dc_fixpt_from_int_test),
+	KUNIT_CASE(dc_fixpt_from_fraction_test),
+	KUNIT_CASE(dc_fixpt_mul_test),
+	KUNIT_CASE(dc_fixpt_sqr_test),
+	KUNIT_CASE(dc_fixpt_recip_test),
+	{}
+};
+
+static struct kunit_suite dc_basics_fixpt31_32_test_suite = {
+	.name = "dc_basics_fixpt31_32",
+	.test_cases = dc_basics_fixpt31_32_test_cases,
+};
+
+kunit_test_suites(&dc_basics_fixpt31_32_test_suite);
+
-- 
2.43.0

