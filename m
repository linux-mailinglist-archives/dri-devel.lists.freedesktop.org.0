Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AFBAA404A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B6710E633;
	Wed, 30 Apr 2025 01:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Bto6DR5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2059.outbound.protection.outlook.com [40.107.212.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D8F10E633;
 Wed, 30 Apr 2025 01:16:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyRfJlsC9kI7I3P2AsYffgB8OdXvevXRy6KlXBmwOTlJDbhCPqVJa09tFJ6p4aRJLSQ8jmuyPX3PUxyYObZNH6ky53UyqFy6yohLf0bs88uwNJL/Jt0QXGAyMXk2rLtoHYlyxGOFhE9Eq7ncHpr1twceq1dcAYbaf9Xur3HG93ITRMdj6WGVINZC4mrMCbvWaqysTYgU3W3WOb/nC/97KAINWKXhQfueasxO1b89sI9qBsiEsaYAk3VDWLN2gLhrjeEHsvQhpWetQduz7C5vThoUeoNZfMQ5OMVf/cHYrqfC9q+UDxGo+83V2LkDW+/xyw7fChW9NcvK63QzcLkAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6zgYWc2akZqbSXrTp8U1z5g5sTweoKPBjNUT0lgvNg=;
 b=AB6c6mbmp/PVTcrH9eiMBFlqAS/c8ZTXUV2+UN4hafAm3LnpvZbfTIVKa1Omg1LdX3rGbycj+Kc6Igqgb+OoBi/AhKD+nT/C+aafy0SA5p2FXR4gVIiOegSS7lNJOM9NELnKI/ULrRilTq97lY/KWnbjKouAHUPuReNJY1iY3pHi24t/BsZh5dBMmwWfqTBaPyxlDmWGzixsuDawggZPL5PFlATh2RPzzZfvZf7Z7bZLZZNO8pxDu1vb8p/CMUNBftl9v1gISMNh54ZANCw7ftuAv3LBe/0iD94lLEaqPOTApZBWIGpSbAAEwmWuhMFk7694CKdW9ZJAlsgyPhDarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6zgYWc2akZqbSXrTp8U1z5g5sTweoKPBjNUT0lgvNg=;
 b=Bto6DR5YIJ3sjetU20efDYvGe0ugYoh3QpRD5immb7Cm4gVRClMWeB6/9a1elaiz8rOtia4+Gp6g5o13TKOFfrehVZwhzkwM0wyd7l16smWAonckJi/lHxEhNys84YGKt7yig4Aa11CN7Zvgjb+KQnr1+S6F62cBQJm1WPdw7Xc=
Received: from SJ0PR03CA0134.namprd03.prod.outlook.com (2603:10b6:a03:33c::19)
 by IA1PR12MB9467.namprd12.prod.outlook.com (2603:10b6:208:594::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 01:16:36 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::9a) by SJ0PR03CA0134.outlook.office365.com
 (2603:10b6:a03:33c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:16:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:16:35 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:16:31 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 19/43] drm/tests: Add a few tests around drm_fixed.h
Date: Tue, 29 Apr 2025 19:10:49 -0600
Message-ID: <20250430011115.223996-20-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|IA1PR12MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: 879db249-6e68-44dc-aeb4-08dd8784a691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|7416014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8KlysYZzI+LPO8mX0Gwg6f0w2zV3uS5cBV0W3+3Ce+8wNx8EPVTiIxd+45PE?=
 =?us-ascii?Q?oBLQ96Kt9gM7d+3FULhVPXBIUQxwtowH1gRwTAz7fXdFTMmBpaJ6oNwXVpxe?=
 =?us-ascii?Q?uzovA0YaIJwCTwl2+ZY3MkRSk6JDji2D4adhdlm/izUcUxbia9ENIBtrnuOr?=
 =?us-ascii?Q?aZgK93gknojPAIohcGW/6R26lgGc6Cs0ktboK+7VWt6mpbRcYiPr/UdZAu+P?=
 =?us-ascii?Q?n7f18lG1rOP56Ivtv6qSJcXZqvGCfrgt0t2ayj2sY4QSsEVpVd1Z3zbJ2JsD?=
 =?us-ascii?Q?GFypLdwf9yuKeBDM8OxNuFjTzzxJwWBFsBVo37BzyqN+pWSfK7lXiwCVD7SF?=
 =?us-ascii?Q?frZhDrKxaXmUMZ+E0Akl6rRHTdU+c6e24dvqqO3U6OKCMF7a+c23tC/dT3hy?=
 =?us-ascii?Q?u4MYE8M+LAPynArl0EP45NVEoPt9F08Au21NyIajpqJSX7Tt5x+z5YZHsH8c?=
 =?us-ascii?Q?FjU0CwfqZ3IHOiWjDMn5fZ7MCz/wpeklT0VgnKhjmOrgod4X1evOib4Sktp6?=
 =?us-ascii?Q?hOLZadh8e4SzSLc3F8KqhVbIOw5SZ7BgpjljLoamMv+l4o82fd2RN5YM3RIB?=
 =?us-ascii?Q?HACG5UtyxtZWlE+bPXIXL9cyAF9Bf0CeHTkDciAjlszIC8KCMAQT3tvGeLiB?=
 =?us-ascii?Q?HNhfKMU+UHT4zHcBu5dcl/eylWeXfoWy4frksFmJNVTlNNwvBDVcOvl/6fym?=
 =?us-ascii?Q?D1x6KZIjaHpHfiX0ulE7wJI4AA/zE/ZdTH62Lp+bd/rHMQgcetUEUX3BNS3n?=
 =?us-ascii?Q?mT3rLhy5CE2rA5qoR4OghleyzjKutgQT4C9aYYSDwCwHom4uArfaIDZw7ZVV?=
 =?us-ascii?Q?alj9YwOp6ZFbuWx/2ooA47P69c+VOLIcmFddEMgPMC0z25RPFCMI7qRxyujo?=
 =?us-ascii?Q?evBXMK1J/3hXVcTvEOOByPdN9ApNI5iIj2j86znbej+YseFzI0/NudpsMTtW?=
 =?us-ascii?Q?0Ii4oWDjzFXJHKY6r6NO032Dc+zqLKTbhiRe306jItcpPTnU6V22EMeji2Qw?=
 =?us-ascii?Q?FVN5xJ+PNeU7CXYGZCJZj6IqayNVT8XRZv3CHV+V6IPQnMrO+4tG8b/u/ceB?=
 =?us-ascii?Q?8OeZWT+CmrcymcfFghEb/AiBpIIpCTe0314NA5EwSRP0GjBlhFKWAS0jbbWp?=
 =?us-ascii?Q?UevQrtnaSZpYBxingBqPXEH9jCf/sZ5aPFcAGka3nGARfgeQY9kU3/VP0cfT?=
 =?us-ascii?Q?x2zAcEngUQk6zDMXWW5aS4aF2/aHsf4kHZkG/PFvqvYl7nPl5XEgOkSnT4Vt?=
 =?us-ascii?Q?s36PAIbVNsaYzaxNJE6o6ywOwFKPrz76BaquE88GO0bevOVDZCP4MJ+qFBlY?=
 =?us-ascii?Q?Y/LmI0JvaOZmCjWAeuTdDWqbSgI2P+swh/EhPePopDhOc6cfd9TKJWxuNvGL?=
 =?us-ascii?Q?0POTDfbW3eOj/BcGOHCprTQd6NTBhShUNEJ2COlYGx+TnPrNQ10PxV+E/3fb?=
 =?us-ascii?Q?DbjqO8dqc4P9V02MgNjQSU9floq9gFCCd7lXQmtZZMLmN40MIDxRRAUiy8g/?=
 =?us-ascii?Q?Y5DflUpA5s92nRDf17eq8g3OQS573KoKyvep?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:16:35.5678 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 879db249-6e68-44dc-aeb4-08dd8784a691
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9467
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

From: Harry Wentland <harry.wentland@amd.com>

While working on the CTM implementation of VKMS I had to ascertain
myself of a few assumptions. One of those is whether drm_fixed.h
treats its numbers using signed-magnitude or twos-complement. It is
twos-complement.

In order to make someone else's day easier I am adding the
drm_test_int2fixp test that validates the above assumption.

I am also adding a test for the new sm2fixp function that converts
from a signed-magnitude fixed point to the twos-complement fixed
point.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v7:
 - Fix checkpatch warnings (Louis Chauvet)

v6:
 - add missing MODULE_DESCRIPTION (Jeff Johnson)
 - fix buffer overflow


 drivers/gpu/drm/tests/Makefile        |  3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c | 71 +++++++++++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 3afd6587df08..91437cf34d92 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_modes_test.o \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
-	drm_rect_test.o
+	drm_rect_test.o	\
+	drm_fixp_test.o
 
 CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
diff --git a/drivers/gpu/drm/tests/drm_fixp_test.c b/drivers/gpu/drm/tests/drm_fixp_test.c
new file mode 100644
index 000000000000..de91177af213
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_fixp_test.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ */
+
+#include <kunit/test.h>
+#include <drm/drm_fixed.h>
+
+static void drm_test_sm2fixp(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1ull << 63) - 1));
+
+	/* 1 */
+	KUNIT_EXPECT_EQ(test, drm_int2fixp(1), drm_sm2fixp(1ull << DRM_FIXED_POINT));
+
+	/* -1 */
+	KUNIT_EXPECT_EQ(test, drm_int2fixp(-1),
+			drm_sm2fixp((1ull << 63) | (1ull << DRM_FIXED_POINT)));
+
+	/* 0.5 */
+	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(1, 2),
+			drm_sm2fixp(1ull << (DRM_FIXED_POINT - 1)));
+
+	/* -0.5 */
+	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(-1, 2),
+			drm_sm2fixp((1ull << 63) | (1ull << (DRM_FIXED_POINT - 1))));
+}
+
+static void drm_test_int2fixp(struct kunit *test)
+{
+	/* 1 */
+	KUNIT_EXPECT_EQ(test, 1ll << 32, drm_int2fixp(1));
+
+	/* -1 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 32), drm_int2fixp(-1));
+
+	/* 1 + (-1) = 0 */
+	KUNIT_EXPECT_EQ(test, 0, drm_int2fixp(1) + drm_int2fixp(-1));
+
+	/* 1 / 2 */
+	KUNIT_EXPECT_EQ(test, 1ll << 31, drm_fixp_from_fraction(1, 2));
+
+	/* -0.5 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(-1, 2));
+
+	/* (1 / 2) + (-1) = 0.5 */
+	KUNIT_EXPECT_EQ(test, 1ll << 31, drm_fixp_from_fraction(-1, 2) + drm_int2fixp(1));
+
+	/* (1 / 2) - 1) = 0.5 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(1, 2) + drm_int2fixp(-1));
+
+	/* (1 / 2) - 1) = 0.5 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(1, 2) - drm_int2fixp(1));
+}
+
+static struct kunit_case drm_fixp_tests[] = {
+	KUNIT_CASE(drm_test_int2fixp),
+	KUNIT_CASE(drm_test_sm2fixp),
+	{ }
+};
+
+static struct kunit_suite drm_rect_test_suite = {
+	.name = "drm_fixp",
+	.test_cases = drm_fixp_tests,
+};
+
+kunit_test_suite(drm_rect_test_suite);
+
+MODULE_AUTHOR("AMD");
+MODULE_LICENSE("GPL and additional rights");
+MODULE_DESCRIPTION("Unit tests for drm_fixed.h");
-- 
2.43.0

