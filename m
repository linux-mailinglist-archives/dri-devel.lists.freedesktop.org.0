Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229AEADC058
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBE510E596;
	Tue, 17 Jun 2025 04:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HKd6fs/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC2E10E57B;
 Tue, 17 Jun 2025 04:23:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1FWT7Y/Z/+ZX++ihIRbzwsnlI9q9b+KW1J/uwH6xthBVIMtt2XQsOHamc8PbkSmMP5A6zAOnv07JCYvO8//enSbrV2vBxVLEQL1VgXIc3heLAj3loy7IFhNGJhf7BWoQtAv+skaX9D/AGYsFj0A46W6OQAaLglIoShzfneSE5UgetlgR9mePDhhRocJ0Cs7HKEMbuDzY3zZl+LBMjYu1EkyR1Ei7v8nd0o6lL4XiAgEeutufqlA9xvjEr7BAqEkg/uvt8fMx/6qhdgY/731IM7UEqKRJqxcfqr6wszc/VFqhx+iHqWwA6C0JgeaR86EntA7e+mp7NWWL7PLYZujdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6zgYWc2akZqbSXrTp8U1z5g5sTweoKPBjNUT0lgvNg=;
 b=GA6insL1om+2IlbdUsKerr6IoBfQOeuWKuCnYc4vy2Lp4KClZOVPXefmhNNz1BqOPtPpCk3VPOLJw+krn0CCmejIb+QkbRQiHRgpJIhMkWES3mxAiWjaxoklrR0UYkqpLXovJt+T+AFAZWCluH5CyfWB4XhKCuzfDu7TAhmc7nrDGvYWullcTA/tngCKsTl01dV9CSD+sIYpv7DmwDUCT5uzA4n2egl+6BeIHvCTAR9nCSGUgdSip6EPIn9hc0YuZe+gY6xGcxv8qWJqzr6u9eBaf0NqQPQ9WfiJRLFXI7PSrKtyzx0KwPZc5eaj1KsUV9cel4Mc92XseIJqKlDsJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6zgYWc2akZqbSXrTp8U1z5g5sTweoKPBjNUT0lgvNg=;
 b=HKd6fs/VTLUEiIO4YpxYPGLbDV1JWVsBL1ph92G174CpQyah6Gla6/hRO2Zk8IhVDd3W3eWUVVnJaUu6uBc1Z2u036Q9A9who6XuuDqEZaEh201spKIf+dHTh9Cnra14NApHEyiPqjzYQKHmgHG8OtyX19WGHB/w5p8FpY24hYI=
Received: from CH0P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::7)
 by SN7PR12MB6670.namprd12.prod.outlook.com (2603:10b6:806:26e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:22:56 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::e3) by CH0P221CA0029.outlook.office365.com
 (2603:10b6:610:11d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 04:22:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:22:56 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:22:41 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 19/46] drm/tests: Add a few tests around drm_fixed.h
Date: Mon, 16 Jun 2025 22:17:01 -0600
Message-ID: <20250617041746.2884343-20-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|SN7PR12MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: 501f77fb-0ea3-404c-71fe-08ddad56a2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y4nlyDswy9c3wGcek3ou4fJpomTqR/FOW06IuWgaUwJSxsRsao73C2wSp9U+?=
 =?us-ascii?Q?vlIvRFIfr/3IAfh6647LNocA3wSO04htapgtG2zwIchb1KtMpdxYciYXFL5J?=
 =?us-ascii?Q?wC3014i0/7zR0gdQ+ndcyard9ZLQOIrMMO10iCHfCliBOLLzLEoLsIl2zKtP?=
 =?us-ascii?Q?3mBMvxVafGZ4UK+y6tDMzZ7QNvJwGADXPY4QT1LXCqxWZ/78F+z73BemgMn8?=
 =?us-ascii?Q?FlAHurZGBAUO8Ef96w6uABOJN4rQUv5Cug+N70dUuWNa4qXx/jZh0Odij4BY?=
 =?us-ascii?Q?E9agnj/z5iPO131EZMHn/+zOV/qr8MAoEnp/6yK0BlpzlkG72iK486i2bByC?=
 =?us-ascii?Q?sGnXUH6jdXd1VJsz7DyNecRJz9q43DbrOjaetUmbqxbDSTchcpOMN4bO2bbG?=
 =?us-ascii?Q?ZMfFDDSZxZyh0g1Cq+BIdu07woH6WUavH4mNqVCl/mNGAyWjbWTb5pxg22O4?=
 =?us-ascii?Q?oG9za44pQ90OaQkJiUQ0dBA3JonULJZrxodnfvmIrtcvBVbr8JS3AmMiklP/?=
 =?us-ascii?Q?I3gVGnIjwlDNcdNoLq+188Kgd66FELOqJrzx1I1bln1Tk5PBQiWnTXg/7TxI?=
 =?us-ascii?Q?0f+HFSDC7RtHTMLVdPY/eh17L0/F4lxkPFwbdUms7eAtWYNNWOy5q0YwRTK0?=
 =?us-ascii?Q?h75ahy15iKVf4UBHn9kGHRNIA7ZqOiuEAhtktKCW9StrFUmOxj0RxYLz5IdL?=
 =?us-ascii?Q?oQP5Y/avBVT+/nTbv/hi0T+e13/XlwwnIjoNlG18li3CBWPe0jsaGrgu/EUv?=
 =?us-ascii?Q?HhthwPKRHT4syLlm8UDHUXM74im1WyhvMx6iRprcZ+0keWWb0noVTuf6/dZT?=
 =?us-ascii?Q?5wmiSasr2Lv40zUwTriw9F9qoIgX+FZ8WGPGf8ZWwQrcNIPWEN9ulGSR9NiW?=
 =?us-ascii?Q?8w/VxnKBBIf7fQoFLsiSrQrWU3HmHvte/BhDgxWk4vOiIXB9dyzHW3FLU02x?=
 =?us-ascii?Q?OCWEs7uod43SlLWm5RJFLpQ5cBEM7r+7Z6939tEELUutcaqJYE3+H+VP1HkP?=
 =?us-ascii?Q?MINQ4WVrLwzdUKaTxpqkc/lA3HcLK39tubkDW0944IJ3v1M81u9TNK+eCZ8B?=
 =?us-ascii?Q?DQG/clUUVUTSEgVeE0siv/bBiL232r/PwP0nITl28QMZH0lOi7qEPw03kuOk?=
 =?us-ascii?Q?rxIrS1YD0XOmHz3bnaTL/YsoCLiDedcuh21au1fZ5PwRs1VJVkikmKqkik1u?=
 =?us-ascii?Q?eONNgQB+8CBRr+T9JfezDET0dvExVdUTXits4hXfjy1nSW4O8EpPS4CPWcIS?=
 =?us-ascii?Q?pz+TRtufmMYq/JssR5JdY1znkB7lzVOKynLRlNBBj9Uuk/K59MkunVSnAdDI?=
 =?us-ascii?Q?chLbFubWhPKN1Rzobghl4edqSAeIv+J1S5fol/eZGIKvpRmLRoZ+9pXJBc8c?=
 =?us-ascii?Q?wEjt9VyCavyDdhTJHnCPkMNEvvbOqoAvCfC+tlalx3E5QBIGvXsa+pHHXXJ6?=
 =?us-ascii?Q?7PXT0qqYUKuqA7w/LAXZ6je7fTIIFM20qKcq+nygT+hKDT4Nug8dLBCRG8FB?=
 =?us-ascii?Q?FD/tEKKkM/eINUzkc3aIUFXcYv/9hj0GNMSa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:22:56.4839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 501f77fb-0ea3-404c-71fe-08ddad56a2ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6670
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

