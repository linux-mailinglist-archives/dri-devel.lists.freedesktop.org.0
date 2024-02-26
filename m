Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D091886828B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B0510F226;
	Mon, 26 Feb 2024 21:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BLAuLBFt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7479510F054;
 Mon, 26 Feb 2024 21:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkGsArOhbiL0IOSm3rrQDlCAh47tUFPj3422WOwFIhbSuwHYJkAHgzFLx79MMphYyDh5bNMMWyFRh+BZKHXEaKRU7z0Auo22WWPvC8XVR3XzNYzNJtwXMkk73Pd3Uqx6W8RGYmcFA0aJf9TTHv8eCapnAl5H+HVdpsja/EZV4FKieP/VMxP7zzWsS+D+JGWVGLrWf2ZqJB2Nto4lvqaOgLIjUvClvI+9as9y5wdS9ePktC0pICwPf/8xOwi8NY/xWkYfwn01sdu9IVumC73OZ5wM8EW3/58KKM2W/mxyG0UoyVXhZ5gZcO6oGx3+ZSJ7ocuIiV/ICTq+C9hnL+pmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zre10MpKVMnItHByitttvPJK7WtqRgawl1DYJkEXybI=;
 b=KArITva88KOlq/+a3nzPIkeKjdQRvBUTmJIGum0wiATxjvziq2Gzmsznv0KkmV7tS3Pzzex22UHUiZkBFUHd9wDQl+Fxx/kRJYnIbHa1urHuXWmCFp52P1vg0qh3q1b3q9u0KvXi5ZgTO/f+iCLjZGGHku+7QPFJLVY/RqNEvBds4DggDgcVoJ/nk4+HITfCkbY12vDRpw4odlhARVK5BRh2xlUTXgNOh1TCajJTFCN8nQ0JDR/2FfCL6Wf0jcCNTPMwUGG5h0WZJQ0wpsjJOBth6aSZRh2Z4p/JLJtRzH+R4j4JlnSH+9sDJX50LLt7bjyxdPVDWoD3iFd5LMHV2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zre10MpKVMnItHByitttvPJK7WtqRgawl1DYJkEXybI=;
 b=BLAuLBFtqKtTQ/QhzArDyn11LiB7rx95NYtlkL/X15etn2EgDCmAVyzsHF4eaI5AES646VW8G5ia8ajg/5OL4EK0LWc9+9t3EvLjQ+EoCDgIOtJbE3cR32ZC/Zu3xBl6aXLK8n0EWDbXTIYpLSbwzlddJmy6jOUcfZ9YQYc8izQ=
Received: from CH0PR04CA0067.namprd04.prod.outlook.com (2603:10b6:610:74::12)
 by PH8PR12MB7158.namprd12.prod.outlook.com (2603:10b6:510:22a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 21:11:24 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::90) by CH0PR04CA0067.outlook.office365.com
 (2603:10b6:610:74::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:20 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:20 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 24/42] drm/tests: Add a few tests around drm_fixed.h
Date: Mon, 26 Feb 2024 16:10:38 -0500
Message-ID: <20240226211100.100108-25-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|PH8PR12MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e28188d-cbd7-448a-8e7d-08dc370f7c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjF69jwZNexKp7IT7sqKT4kZfjDn0Aop1OsmMkWXf0duu98QjQ1iX3/UAjJtDUQWLErCwEZsbxw7ripNvFrIRKE7C+bZFjEJ8U1kSC8o6KflPLgM+3eoca0aLQTsKt934XFcrjGV0DAKXd/Cvs4Zm82iVW5wzsvjMr16HabsDQbUZag4feDSH9rYltPjZ6qVtFQektptrw6S5PYZZqEp0HpSiWY3KcZJev0TR95o8jQ19OirJfIrR6sAyX78XCAIsmn8wHRj53XNHkjceO+HfyhF5+yuvTRvp30IEYkzU67x2rHyFhQ6Ey3D+bTR5KKZTKYnQhSOXJs0r+pqhQaTDD0wYkmKm5zQ44Pv8s+A0lpkEQpiR5JNblBNabFYBWTRdstvEcXu1/k3vrsMA4Ww1w5QZNlQjxsBIp0iKoK7K6Ej3IqYD1l/EaidgTrtuanPhNBr7s+jknF9pXYn85w7MTxLTPcjYK+H3FCf9dQpG9Vzm3lFHvjyN7e4hWESvaP72h8A3noI+bSwZqTYS6hpgoblIXfRRDrVcjJZKK936WogKVxOpdi658dza8dMzumXeIp9p1kv+SdBtMrYeyDR61OtoQ7hs13BDxr5YN+WlMhfeqP6hiiulLnf1Fn4Twji9fR2Mr6mIaMNz/OavEKcbz/VDTDShoAFWc4MsrAU+F8/Aqq1io6luXLpe6d7ToWH2Sgl2ikZv+lH+9RUnld7YxAH1Mo7RL9oM/FXY3H18voy+CMwGzTgrDRe/wbWWCge
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:22.9137 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e28188d-cbd7-448a-8e7d-08dc370f7c57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7158
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
index d6183b3d7688..98468f7908dd 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
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
2.44.0

