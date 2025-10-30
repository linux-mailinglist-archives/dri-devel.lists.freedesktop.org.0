Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07EBC1E434
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0951D10E931;
	Thu, 30 Oct 2025 03:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KXqjFY1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010006.outbound.protection.outlook.com
 [40.93.198.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF47910E931;
 Thu, 30 Oct 2025 03:49:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxKlbdx7/ZgxvF8Z+aMIVcUQA5Jz8epxYgnC2JFpE4B1o2ez0olEbQ8ngptqV1GOUIK/tm9683cOH8wZCOF0j+mhSVFX+OYwrR+Uumju+X927McHjbU+1uw9rb6bdix2jV6v+Il2wUYIb+dA1FDt7THTSGp0lyNYZCLpH89GzGxNvqUEVDUqJzyfEAVOTPZtObFG0BlgNHiGFpukLNagj6EvI2UCflrJ1QAc7pBGnvqQDv4tjvvqF40ofrJnwp9Sj7U4E7hRYWgQ3xghbJGH2r2AB2KPaSl03lUHEQj7c6+cuwxRcJSiIlUbt3S+VzvXiXoJNZOc9V1LhM6MB+GGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9KJuem+5RIfi1VVaGOhFiGieNwDMnJBKnoDHoLvCIk=;
 b=opB+eX4CBk9zpKOoDsWoBOlblvPwwU85DlQj6qr9wt7dlZN8S9wQjxKx+Ll4DDx7q9gqF6KvWmKIF2wBag5TSHyAQo/O+/HnTiwefijnFF4tXrxd2SYCHmLwpydf9zEkaHC9Vp2KF/8TWUHIwEfYlxYKFKblshiu7bVKg3+d4wfZU1YBp3K5vtbJlEYQ2tCCmSjpunP68cF+ElSw6oKKkWp/XGN7Hy7F538s6Pq//olif832X1oSBt1NGKo6lYhj/9LEiyti/WuafdT6YQdGfkCQpChViom6jTdWFF1IllUpOd5jbeIszJzRMZI/sy/ZuDXG04k5MSBqUDT1sD94dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9KJuem+5RIfi1VVaGOhFiGieNwDMnJBKnoDHoLvCIk=;
 b=KXqjFY1NfwANAX/MACRF7rQO1VLzdSFx543t7b6xkCLhkoGhOEq4LZvXOh7FI21A1vTGNGAIX68bqhAW/WNqW1LrzoIu5b7xSVjrCSg1SjlKOWHWshbfaJMy9W3oTyhZYcM99dSq8icOTFi5nWqAlWcRD4uKdkLHAlCwXp3T9IM=
Received: from BN9PR03CA0098.namprd03.prod.outlook.com (2603:10b6:408:fd::13)
 by DM3PR12MB9415.namprd12.prod.outlook.com (2603:10b6:8:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 03:49:30 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:fd:cafe::b0) by BN9PR03CA0098.outlook.office365.com
 (2603:10b6:408:fd::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:49:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:49:30 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:49:26 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 19/49] drm/tests: Add a few tests around drm_fixed.h
Date: Wed, 29 Oct 2025 21:42:24 -0600
Message-ID: <20251030034349.2309829-20-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|DM3PR12MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: df9cdbe1-3f83-4814-be6a-08de176754ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1o3dHZxcFhEek5sVXRVYW1Ha2ZoLzBUN3l5cTNZOVZydDBSWXZVZGtPNnBt?=
 =?utf-8?B?cGhFQ2w5OElGakxOMG1QUEJLQmFNOUorZkRRV21CL1paNHR3aUJaMnpnb0FP?=
 =?utf-8?B?VE5vQzI1NXpwQmJYNUJaWFA3R3VldXRidmp4M3BaVU0vNDRQQnhoQzJTMEVa?=
 =?utf-8?B?THdxZlJSV21NSUhuY0ZRVUVqRVR2M2xOSHQ2bFJBT3VCdVVOVEFPUXpXbEVi?=
 =?utf-8?B?eVZuUHdzU3pjeERNa3Zhem1yZmJrMytkRWFOSE1kdWhsV2JKTFZ1bkIrNEFC?=
 =?utf-8?B?NXBEcStPVWlEekdETFBDbjBDcFRPeEtFNEF6SG5TVU95UXRhTWhJazRITHI3?=
 =?utf-8?B?SUdpRUw0aUR6UDZYcGFZM0FjS0l5TnJhS2wxMFd0YU41SDZweGZHTGowOWVn?=
 =?utf-8?B?ak5RcE16Z3oySEV0WTRMWU91NTdSaElOa3F3TlQyUExEYjhUVExsMk9abFBr?=
 =?utf-8?B?U1EwWDdmK2ovRUFyMURDTHhZenBkaU1iWE5ldmVnUFpid0NmTjBEUlJ5Rm5k?=
 =?utf-8?B?VWN0cklYUTZsOFVVMlluWDFWVUJETHhyZGdHZ0NJQk1Pa2ZJU3BMYTh1Rm9S?=
 =?utf-8?B?bEFKeTVXVm8vOUVWV1ZacjBCUGhtS25aNHlUeFJtb0N5MWNzRWlZQnJ5bWJU?=
 =?utf-8?B?M0VkY0daYWEzS1l0NGdtalplRktWUk9yWWQvU2wzM0cwQmVicGhHcGI5c0J6?=
 =?utf-8?B?NHJReHBtWEZpNXJQZTRWN3VLR0ZoUng5ZHQ0c2xaVFdaY2NicDdmN2M2NFlG?=
 =?utf-8?B?aUovUHhaMm1mOG5qa3FKZElFSmZGRU1VbVZLYTlDaWc0c28yb25oTk11Z3hQ?=
 =?utf-8?B?ZGYzU2R6eFFnNGhiTkl0L012YXpBdForTFlMQnhtTkRPMXB0NmpMbWJLVDBr?=
 =?utf-8?B?TlZRWTJQL1dEZW1HazZhSEFYNXFISk96czZoS1U3WWNyMW8xdWdEd0xXUU9m?=
 =?utf-8?B?TGRhaGdwQXBrYkhONm1pZDhFankvR2l5SjY0UWVFYk04OHFTL295czhOUzdF?=
 =?utf-8?B?TmxDY3BucjQ2NXFGTHl6MmRwdVdsVXhlQi90QStCbHdlWGFDc0J3aXdSMmgw?=
 =?utf-8?B?TnBadXJwM2lFeGRJSzE5dUk2VTJVWEZmYkNjWUVGSndFeHFxRWsxQUxUaHI2?=
 =?utf-8?B?YnZpOUloVTgwT1Q0MWNKZkhmcE1pZFhkaHQ3Nk02YVpXMzgzWThlaFJWOFc1?=
 =?utf-8?B?VEpQZVhncGZvbXJtTkllRnNQM0w0U1dJTndlUVpNcmIyVjd4aFRSUlRKT25s?=
 =?utf-8?B?djRaK1JXMVhtdkJXeUlVOXJpRHF5b3NmaFFndWxmM29va2ExektDS1ZlUGZu?=
 =?utf-8?B?UFNLSHI2WXV5UzVzYmZla1Y4aTRweUNyREVPTlRZU3Blc0Nuc1ZJQTdldGs4?=
 =?utf-8?B?dXk0VFpoOXNBRzFYRE02UGJObVlkck9XZTRvR2dNZitZSUVmZlVSZS8wbG9r?=
 =?utf-8?B?bnVJU01qQlR1ZkhRZEJvcEFOZ1lPbUVyL1F4b3dYOEU4SmdjeEorZVNqdWMx?=
 =?utf-8?B?Y2JNUlNtakJYTmplM1pmbzZNbCtNMTFlUHJzSXlXM0t0akFCL1ZWRjAwSXA5?=
 =?utf-8?B?OGlYSUJqY2xRUkxvNGphT3lNSFVpVG9aa1R3dDVQQVBHdjNlSSszRmdYRnNU?=
 =?utf-8?B?MXFoTHFBY1NmRmhoZ2dYWmxGZzU2b0hSMUZEcEZyTzdNbXdsR2ptbDdXRGRI?=
 =?utf-8?B?OU9CQmVhRzNEREpETnhXcTViUCtWK2tLL2lzdzlnaExFNXV2dUtrK0xMWmlo?=
 =?utf-8?B?SEJBNFRuQXo1TXFkbGJOVVQ3cDRUc2pocW9RbGhCd0c3RmE5cUV4d1dEejNH?=
 =?utf-8?B?UCtKOWZlUzVFbVZDRHMxWDBENnZKUzRzRUpIRWEvazJ0dzNRVVpTUmgzc3Jj?=
 =?utf-8?B?bVZaTDhmMDA1MnAwZFoyTjhDS3FIZkhSS0pFQ2ljQVlnZ05GL2t5aW9tL0tQ?=
 =?utf-8?B?ajB6V0w3Qm82YzhQYkZNdTBYZCtFZVlWeExjc1IzUFErZG9UNjFuR3YxK2p6?=
 =?utf-8?B?UitYazhQVW9Od1RnTnhMdGxUbXVrNE5FRXROdzYwWTQ0MnROb1lrbno2TTNF?=
 =?utf-8?B?SkdxUVBoY0pFb2t0TU9VS0EvY2V3TWdMOUpFRGMzdnUzWG5zU25UbEQ5RzZF?=
 =?utf-8?Q?WIZw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:49:30.2433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df9cdbe1-3f83-4814-be6a-08de176754ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9415
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
v11:
 - Update outdated "drm_rect_test_suite" to "drm_fixp_test_suite"
   (Maíra Canal)
 - Update outdated MODULE_LICENSE to Dual MIT/GPL (Maíra Canal)

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
index c0e952293ad0..87d5d5f9332a 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
 	drm_rect_test.o \
-	drm_sysfb_modeset_test.o
+	drm_sysfb_modeset_test.o \
+	drm_fixp_test.o
 
 CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
diff --git a/drivers/gpu/drm/tests/drm_fixp_test.c b/drivers/gpu/drm/tests/drm_fixp_test.c
new file mode 100644
index 000000000000..dd77fdedb2a9
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
+static struct kunit_suite drm_fixp_test_suite = {
+	.name = "drm_fixp",
+	.test_cases = drm_fixp_tests,
+};
+
+kunit_test_suite(drm_fixp_test_suite);
+
+MODULE_AUTHOR("AMD");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Unit tests for drm_fixed.h");
-- 
2.43.0

