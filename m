Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7749F8B6D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C02610EE9B;
	Fri, 20 Dec 2024 04:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="asWE8xuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFBD10EE96;
 Fri, 20 Dec 2024 04:40:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkzeSsfvmIl12YE4PD5yqBHuXmzt1gz2yPh/YDR4GhWV8qEzSi37dnLr0JRnkiFLZjTB7b0cyKh9HICHAfLrwMC11RIy8WQL1w86ctrH/iX65QocBp3xt2zR+F5HDwk3R6EylvN3G6SmXrO0vMOxfVFCYGqUdfqIxdJ99gV/CCVVlrJmOwzSIxEYeqh+Xc6piUilV15heZreRXc4d/unu2NrYifhOpEjZE2MwmWR+E7kYlwZzKK3dU24JCm0Ka5icIKx8B/uEshau5Ao/M6UJGKit4AmYSTY/WE4efCC5ZqYsuR6BA2FdtjlQdcWv8djb+GHqzzeR4iZfi4SBv/0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfOl/b6EJRVOdMjN/1IIcgsE2LJvVOt1tJjJkwBnn1g=;
 b=sDxWSzjHTx+SW35t2s7T3yYKMVxXturZ0QFbIH3+qQK0p7CwYB664A6YTfdZVXLaNaCYa84HAQpQOb6QcOPCwMUbQ4ZDKxbWZZimd/ZyH5ui6phUieOo3Fu1R5E8ntSDU5UxEouNU/zODdtF93iBHz96VQZW+MaoPTdbeH7ENlvjJDoTos6kjn75FhywNk4STVQEyDAlJpT53XolsTPU646OJXoraYO9kiXl7xrao2+BGlLsUru/H5a/mWT7w1zAv+LkBuRHw2uxMWa3ClQau4HxDd4HRpZAhZKqNLjEQQ/wPA+eavPdYIpuxSkJtV1KFWVM2bJsjRP+n8GF8+/2uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfOl/b6EJRVOdMjN/1IIcgsE2LJvVOt1tJjJkwBnn1g=;
 b=asWE8xuVR+Oi2t7NHTCtYom3YFAHyv6yxs83IvQIV5BBSHbXFRCbvYbf4y5gBY4iUOA2vuNTvN9WCtNy5Iep0mFFcxO8f5xNvfJRUCthiebGOPYk/YWguyKNL1IzCgQLcuQYFgmPZYzm2flox3qQPSeZcwjdAUEbCcdKoIKwuXI=
Received: from SN6PR2101CA0009.namprd21.prod.outlook.com
 (2603:10b6:805:106::19) by SA1PR12MB6822.namprd12.prod.outlook.com
 (2603:10b6:806:25d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 04:40:05 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:805:106:cafe::67) by SN6PR2101CA0009.outlook.office365.com
 (2603:10b6:805:106::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.8 via Frontend Transport; Fri,
 20 Dec 2024 04:40:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:40:05 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:40:04 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [V7 19/45] drm/tests: Add a few tests around drm_fixed.h
Date: Thu, 19 Dec 2024 21:33:25 -0700
Message-ID: <20241220043410.416867-20-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|SA1PR12MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 645e9874-13ad-44e5-e69f-08dd20b0602c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2QS/aHAX05XpccQRANi2Ws+r8E/GEk+QL80UdAVeKJM/gyUkAiOrEgwWl5fh?=
 =?us-ascii?Q?FIzBdjLPLheWAxZONxcnkgvzQg+pRMzU/piz0sgGZLLKoJ1sqU6yiX2WNo+v?=
 =?us-ascii?Q?HF/eTnceACW+jXLs4Qnp7s2+Z3OFSJdv8YosBtyuY60K8DNMJbr5tGrXahSH?=
 =?us-ascii?Q?QJaj2F5JIhiB93LYtD3na4ZCSo7BqL0q33ctFIo3HmIvoOIdhgC1cf7ItNv6?=
 =?us-ascii?Q?DUGh1bnIOoPfY0xmThy+t6hGXNkKoMkTtKGsEyYZCSS8Y8FUQyspkcPT0+on?=
 =?us-ascii?Q?zyhHcDLQjtU5zJj15MNUrkkEhnCXL3LcV2CmOSNgqtafE+KPArh1P6Hrbh+z?=
 =?us-ascii?Q?uB9rWJPi5DFyuUq7ZS6j6Z+gfD0cWYuTk1hDxPzHEXVMtI+2dzdGK6n/wVjS?=
 =?us-ascii?Q?koTKSYFUQCsMEIAbhciexM6i+CF4iof1Fxfvrz/XXxxqSD7StTrSUrAkIp7Y?=
 =?us-ascii?Q?1l+rTSVrxodSiVaSApNUSU7ZItEsJA+yaN2+oz31dy9N6JJqh55GbAb41oZU?=
 =?us-ascii?Q?ekMiOYUtl5V3fxOuq1+NBlfJ243hq0A2qSe1gTgAOsz5/atV77ykluYy2Zei?=
 =?us-ascii?Q?cG4gm3mpzQ4F3ETmPRFEFvfkhgrOlaIf3d45FdFF2HdNb/VbLZOhrX2JMuz+?=
 =?us-ascii?Q?iGRafdalFV26fKi921HHV1g77YADVJf9PkBLrcJHXiXIYvZS0o5Rc/PM+SD1?=
 =?us-ascii?Q?XukUJVPzm84pUhYwXgtmBBVC0H0jKAW3RjQZ+VfOCNYaX5xkZFsYAqQsVqd9?=
 =?us-ascii?Q?XIITsYfAUOyQJFkXsQgkDAw9ZuFb6yP6dI0+qDX6PB64lmJtNVbZ6kWjTRPE?=
 =?us-ascii?Q?6A6ZK8rTntqvOB9S+uAfZ33h54UUmP0qkayAZTMEHQgV3qmQO+nYupR4adDz?=
 =?us-ascii?Q?Rq0f4Ye3qu/tF2qchKHvxplWQ2Zm8O5dkoMRmyDtZUdXFONLTjDbK4MA92az?=
 =?us-ascii?Q?RxzHCeDkM7XJJGhBVTgt6KUmOcxidhAx/m0aSLH/dNmGwCFIFypDqxeJ7FBX?=
 =?us-ascii?Q?F+K9XGTg+oxgmwaWrtlOGTAMBkqm0eoXwwHNm1vFNazLNZjliKgChmwqa+R6?=
 =?us-ascii?Q?/9a/M4nT44G8IHN0sixGEnHGXZMWCML6ZUcMD546vG++Fs532sFKuJdTqQdZ?=
 =?us-ascii?Q?VARUuR9GzF6VGiyy5BM8Nn5VtEg9KEaKk26YPTGlZ3gvGpXXLnA5VUUJjF7N?=
 =?us-ascii?Q?1YAZTPH6lqFAz9QVY2Fau46ePzN3gtLn0FeVnmIvcmLKf9uv0HnCligh4y9i?=
 =?us-ascii?Q?1AHbmgyvqs/WcY3LoPuP3SjuRabWC6BX+/TQ6udBfKkAukswPsZ/Rm2qNDaf?=
 =?us-ascii?Q?obIlRl+qASc+XiHwwxIxnkDak+0PzuSxSToIY3dHSZNLyU0edvKy9GogYy1Q?=
 =?us-ascii?Q?XpIxhSEDLxZ9TItERy6J4zf7XB3xsoHzr7Bbqgliwz1nBFGqwRNCWIT7KtKN?=
 =?us-ascii?Q?eGAtC+OZThuQ5I+NvA0jTOeNDokLN7dQ7g/Sx5RQcpwfjd00UNJgn6D6MLtc?=
 =?us-ascii?Q?a24NVkw/ieZZOZ4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:40:05.5585 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 645e9874-13ad-44e5-e69f-08dd20b0602c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6822
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

