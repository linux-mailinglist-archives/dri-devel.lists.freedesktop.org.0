Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9F0A7276C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA1810E04B;
	Wed, 26 Mar 2025 23:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="drMkWjry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2063.outbound.protection.outlook.com [40.107.96.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A62410E04B;
 Wed, 26 Mar 2025 23:52:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkU64Klma8v3xf1CH3F8s38L/Kd/0RMINITDvOwQh69j6N4ObUeasjfZgZgUrlJSlOjXcKUfNxmK2tOcJW08C+/XBrtpIM4HPW4fOBXWfLvGsga8hc9owOXtR0+7zVEJSQHEW0VzJ5n7xX/utAAb4H9AfWHlHVXJMycAuddDfVExPThF2VwadTWTTt+w1weZTtNXxI/a0hDbNCUH2GWzADUcjd5LwQG5uLVm66ZINr8/obhbxjk8Bdz5THAJfn3BYbcLiMVkhOCUzaj6b6F0jzmJwDHbHB4T2JOHkhzY+pzg4NfpAZ1F5NQOkphOsGVKQUVLWaqib6UFcjxM/2UPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGhRiXCCX4Gd4sILgvWtTS5i5ewFpRtctZD9ZSWgjeM=;
 b=XXtkmAScUnvS1g0aiH/HP0BsXWWM6FwHljTVAIdN/QPB42cCcz0RMVFUNQLmrbhX1KatuEbrWI+7bJw+cmiw09zK2F5gwG07T4oMAZB0oahM9FZNzCpF6xNBGR7G4QSqIwjTiKgjQbgHZ07WcMxcmZLqxuk8zMCl8Nd5OZcKag+fdDoSLuFKImHoonQGNUvIeC+Lzy8WeQ+jKEwsdQu+elpxRjS3MxGSO8dDhI0T+fz9GYGAz7ddqhoV3u8nMNBHFuVRHVUg9AqOckbmuqItZJOFtD6ipt/SHNWtKRruyaMgxowVv9bazOQtN1m4GHtJjoxJoLpHI0N5zACwdBohng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGhRiXCCX4Gd4sILgvWtTS5i5ewFpRtctZD9ZSWgjeM=;
 b=drMkWjryTSL4bCJKoIotTLTIZ0x1Ij41s3OIwQGwYuk3fF22/CSVIuvyUi7VyUkEBye9Dvixa5nT99sTZVV3s66Ywdgnv21qMJh8Y80ch0+dUy1dMKXKJKolCLMpSgB70zoVy8btHoKHFif0zpAFFmmeyAG4Nr804G5hEBlvP+U=
Received: from MN2PR13CA0028.namprd13.prod.outlook.com (2603:10b6:208:160::41)
 by SJ1PR12MB6266.namprd12.prod.outlook.com (2603:10b6:a03:457::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:52:50 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:160:cafe::b3) by MN2PR13CA0028.outlook.office365.com
 (2603:10b6:208:160::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:52:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:52:49 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:52:46 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 18/43] drm/tests: Add a few tests around drm_fixed.h
Date: Wed, 26 Mar 2025 17:46:59 -0600
Message-ID: <20250326234748.2982010-19-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|SJ1PR12MB6266:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f58d44a-67db-4be8-64d2-08dd6cc150e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6yINp4oYw9kWPbpyBsGhUoN8rWBc5OVK8JlyKIWcBA8RnL6ATMy6nf48kwN9?=
 =?us-ascii?Q?gNxLYbeZzXisKwqAcpTpgVMbPz/79Fjr+9YyQ2P8ehRt75mpgMV137PeJECA?=
 =?us-ascii?Q?nbTuNuVSmZrMmN8BD4SpPwuMEn1G6Iur5puYf2Gg0xsZc8+ABUPqJsqYqyfx?=
 =?us-ascii?Q?5U6lzeLapmiAiN09ggMfR8yKaebfA2cHM1ez5Zi9jXYarpVZ6q7vy8SkujVr?=
 =?us-ascii?Q?bFaqh9lhCV17vK2m1EYNfjcw1OhKMwQixQd7wQbb0bP60o19EAysz2fu5uF4?=
 =?us-ascii?Q?Xdv6SX3NT7gsN/GkssUeuu2AzfQsA+/2VIiDAyYokAebV7CG2BpZfVL/uYal?=
 =?us-ascii?Q?avomy+xDvnNDKd2bqETK9R7eTMgKWO0oLtzlStB7aFSk9RX4cqG+H4qbtYsh?=
 =?us-ascii?Q?CzM3kYIvhHrhOPybdEirMjI18g4PT2xyN5O6X+UaHuPLnrn144TPfV8tXMec?=
 =?us-ascii?Q?stYksuHlcjzXjViV236W+cU8Pu2XOrZfayhQ5w2IXOCWexWYPUv5Gk/1noSN?=
 =?us-ascii?Q?SxmXYjblgg3BRhKtcsQ1GBc9kuhMtInvCWkjJpTCBx3COMcpclxxUx2IvPPJ?=
 =?us-ascii?Q?g4F/8iHUlQhivnTaYZB2o3ZEP3XUUKw65cPsoQiQEemmcf719SjGgOfuKa9h?=
 =?us-ascii?Q?Y9dLtQwlK1sjjJBGWH1Qe/N0cfcClnGDYcd3FvLDDhmYsZ5X/wkEY5mIZgpk?=
 =?us-ascii?Q?AnrMQndifnNcA2cE5T2a+WmXx7qjpB+g9Wm5lcLL0T/+46qeDq/8o7cGnN6g?=
 =?us-ascii?Q?8lcRCnOopDA7pMJpfhMqz6NdoSAOcWqMLSIoyzTjra4BMe5CgOxckHnGRSy9?=
 =?us-ascii?Q?juKi4HRpr3+aTT/KHn7QRrIURercOln4YF1ZvZRkKAbT5fGxnYjdwtEVLC2K?=
 =?us-ascii?Q?4ZTNbaWgmehzfhqu7XOxdcZMU6eoub3a9eGUKDQ90a6vMRRPRwHiC8O+QZ6X?=
 =?us-ascii?Q?+cMtD4br+nqGnBN6FohacH0f5atjpHDntunXfluBkleCnhrcZIhymgTAF+Ob?=
 =?us-ascii?Q?KD/zNq9y+j2HatyzH7LW/+2ipcjIiB8eAvzpbTrhDkVy99K8Kczloj/hf6BF?=
 =?us-ascii?Q?ogg0SXmx0nNh3jiiulGW7skqteFDCJzt3kGitsAYrXrx/pVsHO/00MQOpq3s?=
 =?us-ascii?Q?icBV7tn57gnhXVe7AbgfetAeePeqJqpb3VeNf6Z7NsOCeE3b4CKavqCSypEO?=
 =?us-ascii?Q?Luj5FKOguEUsJIgS9mb8bgymc56we4Qj5/Jn9Pdl4NLuexZnr8NUG4NvGaPN?=
 =?us-ascii?Q?WSdQoKqYi/Eciu5JNngJ7iLH0MNl2oz/WuifHyV0W0UVRxX25/+tUw90ftAE?=
 =?us-ascii?Q?AXU+TM6WWTUmRuJJ21NYHUE+Tu2UFU30mJF7g05P9o8zwdrTi+z1ohWE5XqN?=
 =?us-ascii?Q?tEAwgtgpfOjU6CsoHmqIy229JTJBoMwe0MUfkgGfHYM+G/48QvguINhlOZyI?=
 =?us-ascii?Q?h51N0Sg+8MxftcPezz/k6iCymfPIdb6tJsNECmZY/SjicPo2kyxNrw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:52:49.7421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f58d44a-67db-4be8-64d2-08dd6cc150e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6266
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
index 0109bcf7faa5..1fbb8e9e2869 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
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

