Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BFE98F798
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7C410E902;
	Thu,  3 Oct 2024 20:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LTFZuDUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D43610E944;
 Thu,  3 Oct 2024 20:01:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntrUj0aSGlf9YlYv/tVnHm8GU69N05TQZ5uNs1RSTkpGIVzNTvPWpRpGGroI5Z9aerizF5rslC4Y3BJIse261TDFnsEezih654U/ALppnbePIHcJNVX5x03Z1C8nTax1G4OMlsL9tR0nRC521TvSaJtYwJA9RURkTqVSBAF4IfqwMx1dpGa6BaY5WnfDxW9g9HH30b71KLl0HTUDVg91/msCKON87TwCYJ32udfcvNHMnmiEps7BM1EX7FKFlPF1izlUlW/mN89Rma4yx97erKQaDNW540S+LxCcVN1JUF9T3ibmcEJxhRex3+hZvB1lv1K2H71++AUPdK2eJ1XmVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcyptxKg8vNclYQHOyNvD0mgjfSMnJ6XIxie57aeGCU=;
 b=FKAqQ0tvXxuownLQHYZnzgNUD5jSGK9l+H0NtPBKKxLJI5d6RnJMcWvCWNSXTp4jfGF7sqk4ZABDlGd2MwmmkX84yRG5jfgy7KnxrCP0hyS4w4Q0Nmz/bSp1OGWTcPpNK2wzH30XvM4WU+v4/BHPjrRlTpMLGGLucIIjCpzr+j4nlHESP+Tid2Zckn6FL0AWcHvgSej7orZY6sbUScYSfaofBCgKA704aYmy5SXSeIurUoNN26qExEwGdv+l8FNkf6s8nz5AmCBJk8N41Q5vdVsfgGeinGONChG9FtgudE/tciH1iVwJGqstmdbUNRnon7f+cNPaPF4pa1AssprVtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcyptxKg8vNclYQHOyNvD0mgjfSMnJ6XIxie57aeGCU=;
 b=LTFZuDUah/o45k52yxlqQznu6OMcrGT57ocsrszUOCtdbOGtrONZTrs8ygiDFmp1fqVmagmBIQupv26CLHymEskfio46RmK5/gwDiyMoePxxuTvpXpFDrDNxfmn7TYD7gnxPbWm0Hyt9oy6TfS6NsSFonJCZoTfefqmbMpE4a4M=
Received: from CH0PR03CA0241.namprd03.prod.outlook.com (2603:10b6:610:e5::6)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:48 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::81) by CH0PR03CA0241.outlook.office365.com
 (2603:10b6:610:e5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:47 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:44 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:44 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 20/44] drm/tests: Add a few tests around drm_fixed.h
Date: Thu, 3 Oct 2024 16:01:02 -0400
Message-ID: <20241003200129.1732122-21-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|MN2PR12MB4047:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d63383-fa39-4779-abde-08dce3e636a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4QYSdp2t/n9kznfToxJxme06KJrOLfv6nRERckwoyieh59sZCDQKym/NtqPj?=
 =?us-ascii?Q?yy+o84ekfYXvIROKoI4zwYVDaEccg4q4zrnwk9fRf9IzvMbjBuDNO24tMBGt?=
 =?us-ascii?Q?9x9ITjKsXp1njarYh+96fnjWUVI/KHnAsxZ39oWTTbp29qDP4V2Xa1yEpasd?=
 =?us-ascii?Q?05qZaMnSmrB5kmrrlSphK2EBTgeUwu3Dsqo8SJD+XA9dVTkwK9U/95yUVg71?=
 =?us-ascii?Q?vcr+cB85UcC1uP/3GLp09lZZF0i7A2Ke4gJ+vOsKRWLglYHXWaqOmHcvKrEn?=
 =?us-ascii?Q?y3uE/s4Kr1WZlY6CgDD6/q2bQusk8rfaohxr26qvY2dADLs21BTCHLemTk3D?=
 =?us-ascii?Q?3nxd7LZwOqPoijkZXZuUBbq56nR9QmwHZ/deEMBXEAdWw5Frcc4oURyS2O2o?=
 =?us-ascii?Q?uSWr5P35tHjnRtPDC+MumhmMiZ9x/jYZB4Z4/ivISlQSM8GpXUW0opd56WK6?=
 =?us-ascii?Q?ltLjOJEZi1VXToIyy0HCZ7QKUrEsY/YRZV3ff4PRwQUKZqEoJRyTW4eEjBtt?=
 =?us-ascii?Q?ojLQ2THPiz0CnFDSoWl70LLf/Rx47aew2uwJPMAMLDG4AEeMYAczGOEDf5+b?=
 =?us-ascii?Q?/mABLTApm9kBlowBrdUkCU4vERHQ6Pm6uj4w8nBjKGRJmt2qzV52MbMdL2OZ?=
 =?us-ascii?Q?E88A6lRgYQAM/atJzuzIZ2MigAtb+ArMFFeWqo986Hd5gD/NqhxEPBiHKCwk?=
 =?us-ascii?Q?yAu4l7+g422e++AIF0zp23NVrJA7RjoeN9xljXwKu+mr6Uay6VVAlZsZsH7Q?=
 =?us-ascii?Q?/CW2S/LLIIMf1SuJWHlfsIKnF/uelOmnNrJK3Jt96VE2MSryUBtI95/L448D?=
 =?us-ascii?Q?3RWmvB8EdkE9/3RQ4lFvOP71y0hTGVJ2D2otfgfYZarXs4DE4S2+aqi/VPlt?=
 =?us-ascii?Q?XrwymceTSSF988TAnMCrScRaIuAiTSM87iyOjrYrg8uvrgnMlzzAsiPF1qCa?=
 =?us-ascii?Q?Jj6AFKV5IoChsXJhvu/0ol8zYSUILT6bR8QuduOYhUmJGqQId2blXSDRLzBm?=
 =?us-ascii?Q?vMMDTLFVoyI5Nt2HJrETlvI65c98GAgO7Lgukb0x+rq3YcvvVmRC6vb5aQeZ?=
 =?us-ascii?Q?onhF/z2i3qBNOaBUVVgnf38xnaD2Sv0zIvhoB4MuC7PW3YEji8mNN4MEzHPB?=
 =?us-ascii?Q?vQaX6HqIEYh/WC6EyzC3I981b7K5ozj515wyVXdZmV7JJtZt41Nb1avImQkE?=
 =?us-ascii?Q?EBjiQmNPj4WZ8OsdP8kSZxphV3zBh16iIQiS8ZuBVJ9cJ4Dlld1sc7pZALeW?=
 =?us-ascii?Q?sOe7wDym6EijT47xYqf5U5VAWE/8jd8BtEDFNZsql8EmJWNHq8dLfAOvI5Ce?=
 =?us-ascii?Q?XiicmqtlG1rrul1EReD0QTqkR91VzKf4vBBx9vj8CJba3W+LUsCUiP/2MjbK?=
 =?us-ascii?Q?W/qf44o=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:47.7615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d63383-fa39-4779-abde-08dce3e636a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
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

v6:
 - add missing MODULE_DESCRIPTION (Jeff Johnson)
 - fix buffer overflow

 drivers/gpu/drm/tests/Makefile        |  3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c | 70 +++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 1 deletion(-)
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
index 000000000000..24a801cf38be
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_fixp_test.c
@@ -0,0 +1,70 @@
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
+MODULE_DESCRIPTION("Unit tests for drm_fixed.h");
\ No newline at end of file
--
2.46.2

