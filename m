Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CEB957610
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5A810E3CA;
	Mon, 19 Aug 2024 20:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OG09A+vh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C8110E390;
 Mon, 19 Aug 2024 20:57:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OI1KIdaA95aAFxK3rMrGuQuWKYzcug0zU7rkumLi+b8f3ceNwoLpAHMpCy9IoPHfAZNl0RJG+qel88MKB0WYYpD/C3/wFzsAMfD/zeZPqneCFfeVni2GVTCHwU4JkhdkeXPt2sGx1pGrw3zCVP5pfudzrRMSNECL/jHZP5/ckE6q/C9rk6M9s7PJiRIRAxBgIdFTjg6z14G4hvCBOZpZ1p4SkNZq8l/zpCEtxrv37HExPTuPRr3misO8bs0NGRhxoLmV6jKBxi4rSjfn++3P80oRoYD8j74B/aU3VTW8EAwE/EeK2qHCqfIyMKZqpALL5NMKhnXDBiozf35G25J2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZZu9YVkX8lHtUG5OeVaC72hNmfuet14W7gZ+ZLrQpk=;
 b=ULg+KV68JtDEciWDFl7bBvEwSDFGLddjEF3NfnUCo98cw9L2jRxE8E/qG+cuUYeSBk1tc2bxdvXbmL84QIMM4fvOzNfyQQEdVNatSNkl1i37tpY+fqp+ouNPLXee4ASuIcJB/Bhl10RgRDihEkL1taDbvXWMZE4sJmY6A0Osbur852ltwLHUi4I2GgjqXhgP42DG/shAyIhb0vYEz70tnC5Yi8kBQCBdeafLPULwJw23A/v2aJgg2j4s0BdIHIYq7aXCUXaqS4iwGo0crzjV6dKNoRm5ORFBw0CvMUwV/wfFEfd4hhGYbQd5D+xTbudR52+dpQsNPEE3rp5gCj2mvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZZu9YVkX8lHtUG5OeVaC72hNmfuet14W7gZ+ZLrQpk=;
 b=OG09A+vhtohFvEYOI7MHZURWuovM0UaW2HFT4XMBV5ehrnX12SUen1pJWtgrmsvJXNSAQ5JXVOMUKGEESJlYuguV2rPTG8d1MAuno5xMKSHqnT0qnqES5i/ldPPR8pz5RQvoX2nas68NLRwBW6CykPgiJs0/IWLGqt75sovzpkg=
Received: from BN0PR02CA0015.namprd02.prod.outlook.com (2603:10b6:408:e4::20)
 by DS7PR12MB6335.namprd12.prod.outlook.com (2603:10b6:8:94::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:31 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::c) by BN0PR02CA0015.outlook.office365.com
 (2603:10b6:408:e4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:31 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:30 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 20/44] drm/tests: Add a few tests around drm_fixed.h
Date: Mon, 19 Aug 2024 16:56:47 -0400
Message-ID: <20240819205714.316380-21-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|DS7PR12MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: fa372589-6275-4671-d6fc-08dcc0918b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nUCULyZ0rUqYonEUjGqSTfRstOgK+LaQUMim+5KRJs76ai9dE4ZUMyDyGxdU?=
 =?us-ascii?Q?+RqKxpQ+kFAZRosvndubN4TbeWoM6yIemhLfF9+pL4WLg2Aqbu5/apEP+Ykv?=
 =?us-ascii?Q?1LufEDqP1ScZKPA/j+GcKUMjUx+LIX7pC4/r98m+L726McoR6YpXhADW5oIE?=
 =?us-ascii?Q?7q9dTHyLL6lDzFK1XcTVachx4hAWm8EZb+nOJoX4hT7FoxWxtyBBfXl3VJtI?=
 =?us-ascii?Q?j9Gtv0kOpNSga0RB0O1JtRU9t816cPR1V1P79kkZ/bh6yPzYZ1EGcdZ6Pdxp?=
 =?us-ascii?Q?vyIg8dO5ZOVWgT6kwNXrWGHiFu9GW5d3Hjzudw1wRILB4bDPDiCB6zM2TuPx?=
 =?us-ascii?Q?D6dHij+Wioc+6S4CwXg2vScABX41x0/87ifzPL3UDvLwi9222ZuuuGxNbYUx?=
 =?us-ascii?Q?mJXaGz6pL3D4GEIFlU+5r+xyM4a4e9+tuH4blSNNZQEeoGU+/TQe7qB3P7A0?=
 =?us-ascii?Q?mxAV5Sl6SlAVspiRTnYhOuhl/mrHqdhc8qoxyqZULNOh6AQT80Cs4aAYKX3f?=
 =?us-ascii?Q?dDjKX6t6ujDykh8HX/WKTqCKqnra+HRj/8EbqYEv8OnLF0nk8Vfw3ZdhT3T8?=
 =?us-ascii?Q?iwQHHpIKEa/S1wqfmtVLXAqM5Ekxi9TMNEN1Wva5+/jS8N1/bkM1m6zSyoDt?=
 =?us-ascii?Q?DnfeWKQVDSLVW/C3cu/IeABsj+EJ8bJVs3XNqWL+duupYSl+QF1eiozo3K2I?=
 =?us-ascii?Q?o3cApLW+vMgoaMk4BvRQdnqg4PEA0R1/p0XTCypINviVqWMbPyO22v7h4Eg3?=
 =?us-ascii?Q?pEvfKRhZ1bMduz9uoOJyzosuTSMZJUaWWCwM/FX4BprUZDpEuuGITs0iRMCY?=
 =?us-ascii?Q?P1djuOnTZrPskTg/2i4EAu+tTnrrxFt7KYO0gRk1vraX35AfBwhO2R3yjLm2?=
 =?us-ascii?Q?8Bd2WsOW9wnKXR98sK/jRYviU7W4+RIlELw+wUHbmLG97uTlE5zv91xRwZKv?=
 =?us-ascii?Q?zw2mvzfjSsrShwKpBEBXMOmiS2XzV1VYBAKKsHnN5eZgk783Ld/EtL5E4k6N?=
 =?us-ascii?Q?YNppa7+J5L/gmcaU2dVvNG3OJkZWPvzcXcECr5aqqwe3aALNgg6hkNWrmJQ4?=
 =?us-ascii?Q?vwziIKo5LWaCfMgLQdu5/jvRK92FR0RkLSr4O0BC2j71dDcy6E7FRREUF4Gi?=
 =?us-ascii?Q?owECtSoEJfqi2mndLbL/gRAhu1eqVWGL8HN2puYJBW7+M6ht14uN1dbJFaxK?=
 =?us-ascii?Q?QMC0eB4p7haanrd3KT/H9lIs1zK+y0M7/UKutFtqtBQ788EP8G34U3mwhPfm?=
 =?us-ascii?Q?xSKS971ZJHTY7Da5H19C2qtkJavTSr9Bfrob6WK2EoU/qv4za21D18pxaEs2?=
 =?us-ascii?Q?cX5whyDOan+a45xCE36jdiKxl489AJXl5Ik1EfW1WrqaEjJam0P2krRp7Fqs?=
 =?us-ascii?Q?Yde6x4sfO0biEuGIiH+KcMRUO2Mef7QIlV7psCUe4FbC6zVNHcNr/aJZEsgu?=
 =?us-ascii?Q?FUk7xcm0+oH3K5qb5xSgPJlSZ21ZXzDK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:31.6774 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa372589-6275-4671-d6fc-08dcc0918b2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6335
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

While working on the CTM implementation of VKMS I had to ascertain
myself of a few assumptions. One of those is whether drm_fixed.h
treats its numbers using signed-magnitude or twos-complement. It is
twos-complement.

In order to make someone else's day easier I am adding the
drm_test_int2fixp test that validates the above assumption.

I am also adding a test for the new sm2fixp function that converts
from a signed-magnitude fixed point to the twos-complement fixed
point.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/tests/Makefile        |  3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c | 69 +++++++++++++++++++++++++++
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 56dab563abd7..bd69df0eee33 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_modes_test.o \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
-	drm_rect_test.o
+	drm_rect_test.o	\
+	drm_fixp_test.o
 
 CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
diff --git a/drivers/gpu/drm/tests/drm_fixp_test.c b/drivers/gpu/drm/tests/drm_fixp_test.c
new file mode 100644
index 000000000000..f420f173ff66
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_fixp_test.c
@@ -0,0 +1,69 @@
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
+	KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1LL << 63) - 1));
+
+	/* 1 */
+	KUNIT_EXPECT_EQ(test, drm_int2fixp(1), drm_sm2fixp(1ull << DRM_FIXED_POINT));
+
+	/* -1 */
+	KUNIT_EXPECT_EQ(test, drm_int2fixp(-1), drm_sm2fixp((1ull << 63) | (1ull << DRM_FIXED_POINT)));
+
+	/* 0.5 */
+	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(1, 2), drm_sm2fixp(1ull << (DRM_FIXED_POINT - 1)));
+
+	/* -0.5 */
+	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(-1, 2), drm_sm2fixp((1ull << 63) | (1ull << (DRM_FIXED_POINT - 1))));
+
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
+
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
\ No newline at end of file
-- 
2.46.0

