Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9492683DDF8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 16:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E3210FBD8;
	Fri, 26 Jan 2024 15:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C78810FBC1;
 Fri, 26 Jan 2024 15:51:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8i2UlnPp08Jmkje3iMKp0JkBf4/xz1tdcUkC5dytmrJzlsCtkFyQxz+5jO/z2AfinolAZmLYQ/Dv2SttM3yGcTetTrqvuCG+o3MZgy0+6dYtf4jtvcF2WHHi5RoOI71Yg5Eq5i8unlR0Px3iYMpTIgyPEt7MpNg9gjksdTKuQ/d3u+6fkm9m+JPnF3wNX+0HRaZgalEkZb71H3PdS6UPHhmLeRKP1UhR4KDGEG5XxufIv8G8woO8KZi2GvjWxoTb+Mu7Q2Fv1KxFdEthOf/LYP8MzoP1YGRLUKwPRYZMwLGvG6PhEr5agGJRjiLe2QT2PB01C0x99Gf9KJjcgTu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpcZbrx8X04XZwgi7BeOtouoGw4aVOZAXGAdjxSlg6I=;
 b=QXNdxLOqQFk9RT5XwI1scKvv3phy0corQpxE6V44YOlk4sPn2tR4xi/b4mfMFnT/6NCp5qvrBTDNVgsYjFJ1i2mO1JROieCk+U9C3Dn1lGYnIst+qzBAX6j4AZYElAbYO9SWO3PQ1PZ3TPtPDU3GNR18Ypu1B6y0IrKMigFdM8hee0MZtMVYstbKHEdyYvXTLESIeVls60MgedU1SgmdT9nSjRWk/ayqpxHXseODSoxHp3BfEUBwwi7g7wCiil8QpTGAxqS33YUYuF3b0BwIB7Eh6Xg3i4aJtEmgnzhDdq1y6Br5kNfhl/BKzyPYkfGP0sxCdq+OlmHLkawUaacC5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpcZbrx8X04XZwgi7BeOtouoGw4aVOZAXGAdjxSlg6I=;
 b=w18yZREZFD1IQF+UIl80DdHb+YqFt5mX25pOat79pAefCLsOJS7mDWxaH4gMwYEv7OUJBJcKIDwzIdsh1XO8IPVL8Z0YLa7aUSwUp7hs+wI1ODhtZrXljN7HpHIUJ90kF3B3xhreZmZblKW7GOThfd8h3Mta+JSDZDHcnDXyDtM=
Received: from SJ0PR03CA0075.namprd03.prod.outlook.com (2603:10b6:a03:331::20)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 15:51:25 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::48) by SJ0PR03CA0075.outlook.office365.com
 (2603:10b6:a03:331::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.28 via Frontend
 Transport; Fri, 26 Jan 2024 15:51:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 26 Jan 2024 15:51:24 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 26 Jan
 2024 09:51:21 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, Nicholas Choi
 <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>, David Gow
 <davidgow@google.com>, <hersenxs.wu@amd.com>, <magalilemes00@gmail.com>
Subject: [PATCH v4 2/8] drm/amd/display: Introduce KUnit tests to the bw_fixed
 library
Date: Fri, 26 Jan 2024 08:48:02 -0700
Message-ID: <20240126155022.1184856-3-Rodrigo.Siqueira@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a383a1f-4152-49d6-7f66-08dc1e86a6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SIWY43HfKAMOLs0snIzulcgCoVWp39HeeofrbImOwkNiexeB03/+iJ0FloqR2MkUHP0/eqxRI6LaGTS5exsmbbl2NnLdtA++k8hVmcLS13KBM2wDey3uY2rF3sBE2CquoToH5cUSDtOgCLGX0EMYAA97OYEL8ikrXvnVzZC0KDPQSjRcEYO0bWkwkqw1i2/IqFleNFe5aDIW9tzm9BHF6a44gUnNa5nwT4KSNUYiF/btiOj6Q5cdLTTcQyWVgsGtmnoummHM0FfRJSTcY652bgEFrdpwwY9wA2ODvlk+HEoeDabMdpZDHLoh4uQkzRbAHNnmyM5f/iRWnrE26i5yJptLRqQgzrFWmRhXDpJifWdx7tlmIqf7wAhByH36qGcwJ/P5u9672C0Ezng6A8zM1hHmopAxQiuMNOCT7CmpwMWzranplNcC2EEbzOfYxCsU8ozw4CYSq887BWEZTyHqFDE7ABfc3pL3ddPCs4mwrXw+Uq8pAgtzIZ5PNbu+9qXyPfllRUrmvA/AI+8rufpElY9VxUoRu0Gt09uNWk98iy7CM8slvuFvJOQybcAJESqvrzc2qBapbyqEZ2y720ptZlMeFE75gSdWYOGai3TtqRqmfzouWhFC2WzZWlUyNghwDVgozb984abnBE2nJhbtPa6n99hfB8n7qt1SbAKND7pR7AfQPfg0JHG1agdTJ1qNxB130XvfRNqle2mi2OzYMVaOZ21dxmzSq3oELwP1VucgHn5iMzVsho+WezbzQFXAzflE4kAd4Uj8RHA1sAw7bg49Rlu1PVGhBRx7PoEp5G4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(46966006)(36840700001)(40470700004)(5660300002)(2906002)(30864003)(40460700003)(6666004)(426003)(82740400003)(83380400001)(26005)(36756003)(356005)(478600001)(81166007)(16526019)(41300700001)(7416002)(86362001)(2616005)(1076003)(36860700001)(336012)(47076005)(70206006)(316002)(54906003)(8936002)(8676002)(4326008)(921011)(110136005)(40480700001)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 15:51:24.8958 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a383a1f-4152-49d6-7f66-08dc1e86a6ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
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

KUnit unifies the test structure and provides helper tools that simplify
the development of tests. Basic use case allows running tests as regular
processes, which makes easier to run unit tests on a development machine
and to integrate the tests in a CI system.

This commit introduces a unit test to the bw_fixed library, which
performs a lot of the mathematical operations involving fixed-point
arithmetic and the conversion of integers to fixed-point representation
inside the Display Mode Library.

As fixed-point representation is the base foundation of the DML calcs
operations, this unit tests intend to assure the proper functioning of
the basic mathematical operations of fixed-point arithmetic, such as
multiplication, conversion from fractional to fixed-point number, and
more.  You can run it with: ./tools/testing/kunit/kunit.py run \
	--arch=x86_64 \
	--kunitconfig=drivers/gpu/drm/amd/display/tests/

Co-developed-by: Magali Lemes <magalilemes00@gmail.com>
Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
Co-developed-by: Tales Aparecida <tales.aparecida@gmail.com>
Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/Kconfig           |  13 +
 .../tests/dc/dml/calcs/bw_fixed_test.c        | 323 ++++++++++++++++++
 2 files changed, 336 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/calcs/bw_fixed_test.c

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index e35eef026097..d54036dcac78 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -51,6 +51,19 @@ config DRM_AMD_SECURE_DISPLAY
 	  This option enables the calculation of crc of specific region via
 	  debugfs. Cooperate with specific DMCU FW.
 
+config DCE_KUNIT_TEST
+	bool "Run all KUnit tests for DCE" if !KUNIT_ALL_TESTS
+	depends on DRM_AMD_DC && KUNIT
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
diff --git a/drivers/gpu/drm/amd/display/tests/dc/dml/calcs/bw_fixed_test.c b/drivers/gpu/drm/amd/display/tests/dc/dml/calcs/bw_fixed_test.c
new file mode 100644
index 000000000000..1369da49f444
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/dc/dml/calcs/bw_fixed_test.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: MIT
+/*
+ * KUnit tests for dml/calcs/bw_fixed.h
+ *
+ * Copyright (C) 2022, Magali Lemes <magalilemes00@gmail.com>
+ * Copyright (C) 2022, Maíra Canal <mairacanal@riseup.net>
+ * Copyright (C) 2022, Tales Aparecida <tales.aparecida@gmail.com>
+ */
+
+#include <kunit/test.h>
+#include <drm/drm_util.h>
+#include "bw_fixed.h"
+
+/**
+ * DOC: Unit tests for AMDGPU DML calcs/bw_fixed.h
+ *
+ * bw_fixed.h performs a lot of the mathematical operations involving
+ * fixed-point arithmetic and the conversion of integers to fixed-point
+ * representation.
+ *
+ * As fixed-point representation is the base foundation of the DML calcs
+ * operations, these tests intend to assure the proper functioning of the
+ * basic mathematical operations of fixed-point arithmetic, such as
+ * multiplication, conversion from fractional to fixed-point number, and more.
+ *
+ */
+
+/**
+ * abs_i64_test - KUnit test for abs_i64
+ * @test: represents a running instance of a test.
+ */
+static void abs_i64_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 0ULL, abs_i64(0LL));
+
+	/* Argument type limits */
+	KUNIT_EXPECT_EQ(test, (uint64_t)MAX_I64, abs_i64(MAX_I64));
+	KUNIT_EXPECT_EQ(test, (uint64_t)MAX_I64 + 1, abs_i64(MIN_I64));
+}
+
+/**
+ * bw_int_to_fixed_nonconst_test - KUnit test for bw_int_to_fixed_nonconst
+ * @test: represents a running instance of a test.
+ */
+static void bw_int_to_fixed_nonconst_test(struct kunit *test)
+{
+	struct bw_fixed res;
+
+	/* Add BW_FIXED_BITS_PER_FRACTIONAL_PART trailing 0s to binary number */
+	res = bw_int_to_fixed_nonconst(1000);          /* 0x3E8 */
+	KUNIT_EXPECT_EQ(test, 16777216000, res.value); /* 0x3E8000000 */
+
+	res = bw_int_to_fixed_nonconst(-1000);          /* -0x3E8 */
+	KUNIT_EXPECT_EQ(test, -16777216000, res.value); /* -0x3E8000000 */
+
+	res = bw_int_to_fixed_nonconst(0LL);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	/**
+	 * Test corner cases, as the function's argument has to be an int64_t
+	 * between BW_FIXED_MIN_I32 and BW_FIXED_MAX_I32.
+	 */
+	res = bw_int_to_fixed_nonconst(BW_FIXED_MAX_I32 - 1);  /* 0x7FFFFFFFFE */
+	KUNIT_EXPECT_EQ(test, 9223372036821221376, res.value); /* 0x7FFFFFFFFE000000 */
+
+	res = bw_int_to_fixed_nonconst(BW_FIXED_MIN_I32 + 1);   /* -0x7FFFFFFFFF */
+	KUNIT_EXPECT_EQ(test, -9223372036837998592, res.value); /* -0x7FFFFFFFFF000000 */
+}
+
+/**
+ * bw_frc_to_fixed_test - KUnit test for bw_frc_to_fixed
+ * @test: represents a running instance of a test.
+ */
+static void bw_frc_to_fixed_test(struct kunit *test)
+{
+	struct bw_fixed res;
+
+	/* Extreme scenarios */
+
+	/* A fraction of N/N should result in "1.0" */
+	res = bw_frc_to_fixed(MAX_I64, MAX_I64);
+	KUNIT_EXPECT_EQ(test, 1LL << BW_FIXED_BITS_PER_FRACTIONAL_PART, res.value);
+
+	res = bw_frc_to_fixed(1, MAX_I64);
+	KUNIT_EXPECT_EQ(test, 0LL, res.value);
+
+	res = bw_frc_to_fixed(0, MAX_I64);
+	KUNIT_EXPECT_EQ(test, 0LL, res.value);
+
+	/* Turn a repeating decimal to the fixed-point representation */
+
+	/* A repeating decimal that doesn't round up the LSB */
+	res = bw_frc_to_fixed(4, 3);
+	KUNIT_EXPECT_EQ(test, 22369621LL, res.value);     /* 0x1555555 */
+
+	res = bw_frc_to_fixed(-4, 3);
+	KUNIT_EXPECT_EQ(test, -22369621LL, res.value);    /* -0x1555555 */
+
+	res = bw_frc_to_fixed(99999997, 100000000);
+	KUNIT_EXPECT_EQ(test, 16777215LL, res.value);     /* 0x0FFFFFF */
+
+	/* A repeating decimal that rounds up the MSB */
+	res = bw_frc_to_fixed(5, 3);
+	KUNIT_EXPECT_EQ(test, 27962027LL, res.value);     /* 0x1AAAAAB */
+
+	res = bw_frc_to_fixed(-5, 3);
+	KUNIT_EXPECT_EQ(test, -27962027LL, res.value);    /* -0x1AAAAAB */
+
+	res = bw_frc_to_fixed(99999998, 100000000);
+	KUNIT_EXPECT_EQ(test, 1LL << BW_FIXED_BITS_PER_FRACTIONAL_PART, res.value);
+
+	/* Turn a terminating decimal to the fixed-point representation */
+	res = bw_frc_to_fixed(62609, 100);
+	KUNIT_EXPECT_EQ(test, 10504047165LL, res.value);  /* 0X272170A3D */
+
+	res = bw_frc_to_fixed(-62609, 100);
+	KUNIT_EXPECT_EQ(test, -10504047165LL, res.value); /* -0X272170A3D */
+}
+
+/**
+ * bw_floor2_test - KUnit test for bw_floor2
+ * @test: represents a running instance of a test.
+ */
+static void bw_floor2_test(struct kunit *test)
+{
+	struct bw_fixed arg;
+	struct bw_fixed significance;
+	struct bw_fixed res;
+
+	/* Round 10 down to the nearest multiple of 3 */
+	arg.value = 10;
+	significance.value = 3;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 9, res.value);
+
+	/* Round 10 down to the nearest multiple of 5 */
+	arg.value = 10;
+	significance.value = 5;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 10, res.value);
+
+	/* Round 100 down to the nearest multiple of 7 */
+	arg.value = 100;
+	significance.value = 7;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 98, res.value);
+
+	/* Round an integer down to its nearest multiple should return itself */
+	arg.value = MAX_I64;
+	significance.value = MAX_I64;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MAX_I64, res.value);
+
+	arg.value = MIN_I64;
+	significance.value = MIN_I64;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MIN_I64, res.value);
+
+	/* Value is a multiple of significance, result should be value */
+	arg.value = MAX_I64;
+	significance.value = MIN_I64 + 1;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MAX_I64, res.value);
+
+	/* Round 0 down to the nearest multiple of any number should return 0 */
+	arg.value = 0;
+	significance.value = MAX_I64;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	arg.value = 0;
+	significance.value = MIN_I64;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+}
+
+/**
+ * bw_ceil2_test - KUnit test for bw_ceil2
+ * @test: represents a running instance of a test.
+ */
+static void bw_ceil2_test(struct kunit *test)
+{
+	struct bw_fixed arg;
+	struct bw_fixed significance;
+	struct bw_fixed res;
+
+	/* Round 10 up to the nearest multiple of 3 */
+	arg.value = 10;
+	significance.value = 3;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 12, res.value);
+
+	/* Round 10 up to the nearest multiple of 5 */
+	arg.value = 10;
+	significance.value = 5;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 10, res.value);
+
+	/* Round 100 up to the nearest multiple of 7 */
+	arg.value = 100;
+	significance.value = 7;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 105, res.value);
+
+	/* Round an integer up to its nearest multiple should return itself */
+	arg.value = MAX_I64;
+	significance.value = MAX_I64;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MAX_I64, res.value);
+
+	arg.value = MIN_I64 + 1;
+	significance.value = MIN_I64 + 1;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MIN_I64 + 1, res.value);
+
+	/* Value is a multiple of significance, result should be value */
+	arg.value = MAX_I64;
+	significance.value = MIN_I64 + 1;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MAX_I64, res.value);
+
+	/* Round 0 up to the nearest multiple of any number should return 0 */
+	arg.value = 0;
+	significance.value = MAX_I64;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	arg.value = 0;
+	significance.value = MIN_I64;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+}
+
+/**
+ * bw_mul_test - KUnit test for bw_mul
+ * @test: represents a running instance of a test.
+ */
+static void bw_mul_test(struct kunit *test)
+{
+	struct bw_fixed arg1;
+	struct bw_fixed arg2;
+	struct bw_fixed res;
+	struct bw_fixed expected;
+
+	/* Extreme scenario */
+	arg1.value = MAX_I64;
+	arg2.value = MIN_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, BW_FIXED_MAX_I32 + 1, res.value);
+
+	/* Testing multiplication property: x * 1 = x */
+	arg1.value = 1;
+	arg2.value = MAX_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, BW_FIXED_MAX_I32 + 1, res.value);
+
+	arg1.value = 1;
+	arg2.value = MIN_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, BW_FIXED_MIN_I32, res.value);
+
+	/* Testing multiplication property: x * 0 = 0 */
+	arg1.value = 0;
+	arg2.value = 0;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	arg1.value = 0;
+	arg2.value = MAX_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	arg1.value = 0;
+	arg2.value = MIN_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	/* Testing multiplication between integers */
+	res = bw_mul(bw_int_to_fixed(8), bw_int_to_fixed(10));
+	KUNIT_EXPECT_EQ(test, 1342177280LL, res.value); /* 0x50000000 */
+
+	res = bw_mul(bw_int_to_fixed(10), bw_int_to_fixed(5));
+	KUNIT_EXPECT_EQ(test, 838860800LL, res.value); /* 0x32000000 */
+
+	res = bw_mul(bw_int_to_fixed(-10), bw_int_to_fixed(7));
+	KUNIT_EXPECT_EQ(test, -1174405120LL, res.value); /* -0x46000000 */
+
+	/* Testing multiplication between fractions and integers */
+	res = bw_mul(bw_frc_to_fixed(4, 3), bw_int_to_fixed(3));
+	expected = bw_int_to_fixed(4);
+
+	/*
+	 * As bw_frc_to_fixed(4, 3) didn't round up the fixed-point representation,
+	 * the expected must be subtracted by 1.
+	 */
+	KUNIT_EXPECT_EQ(test, expected.value - 1, res.value);
+
+	res = bw_mul(bw_frc_to_fixed(5, 3), bw_int_to_fixed(3));
+	expected = bw_int_to_fixed(5);
+
+	/*
+	 * As bw_frc_to_fixed(5, 3) rounds up the fixed-point representation,
+	 * the expected must be added by 1.
+	 */
+	KUNIT_EXPECT_EQ(test, expected.value + 1, res.value);
+}
+
+static struct kunit_case bw_fixed_test_cases[] = {
+	KUNIT_CASE(abs_i64_test),
+	KUNIT_CASE(bw_int_to_fixed_nonconst_test),
+	KUNIT_CASE(bw_frc_to_fixed_test),
+	KUNIT_CASE(bw_floor2_test),
+	KUNIT_CASE(bw_ceil2_test),
+	KUNIT_CASE(bw_mul_test),
+	{  }
+};
+
+static struct kunit_suite bw_fixed_test_suite = {
+	.name = "dml_calcs_bw_fixed",
+	.test_cases = bw_fixed_test_cases,
+};
+
+kunit_test_suites(&bw_fixed_test_suite);
-- 
2.43.0

