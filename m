Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BA6ADC029
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D01410E4B3;
	Tue, 17 Jun 2025 04:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YeF4MM5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6719210E4AE;
 Tue, 17 Jun 2025 04:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kunq9IFtrc5OpqdGfFCkjnxE9xmf+sOoNwsZRjuk3RKNsgaGe5OzpiuFGE57e92RYxnVjt32GNCS2L8W90sbdC4yOtY5uCn79GKVwxUfX0T5JCnESur/2r3hRzFZmIsMNB00hefQmBB6wdkdohMJsRwNWCSD6IiokWQmRmDbupNLsZhJ+6UcC6980Tz89OQvWpSN3NGAIyEJCbsvyvA7VS8vV8O9sOd4NFvcegW/vV2pzTiKekFSMV+7T8YQRaqEY3AZg/uTiRYyECRVnYEc0DX1BTVTxb1NFjxPPRpzuxboibfgv2Kw06UkQbBSEzMfsuwAZQWc6wbZ9O04inrCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fL3cjuC/bWo1Ax+Hq7TK19gmTcWub2E3bwv0bh12Xyw=;
 b=R/qA62+pAIyj+n1VtSc1P+F1Bv4oeeEPBTzSgqO1i21QcDP1uCHzcjBj5hIWA2txXfKeanf2I5jzyLCvY8/987R/VR2XIl37fYKmztuVINob4ZhPYQaQCATi9qLKlDzNjWGf9eXWOBqaY3iH/A2WXcDN2zaku7eCQvq2yd9mZRgo2uvMoWZYEHo8KB2q9To8UL1F/dNWXCkqCmFqplCDN1md1wnuBTbf/pEvDeMcLkdLDQo7MLPh6JDJ4C9QtuUflo6wNNyuC+a6bzwgHSnMdZD+XknscBs40q/pQo5oZIYsalOWrNmU2RDpu0D1TUF21rBSXJ4dRknpa2pQeXbBMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fL3cjuC/bWo1Ax+Hq7TK19gmTcWub2E3bwv0bh12Xyw=;
 b=YeF4MM5KgT3IoQXLMwbYEmB8mRW3W3Q5PXrSTouTADXDBrPIcLsJ88aUZK/vt5l6raBg0L7/1bCagwkQRs0FrVH1UMSPdt1TQFfvs48rRiw46dnlGrDRLsKNUtIqTn/UDTzNVaoy9e6xGeshAThAlHTsRaow5xgfgUMlTOh/nZA=
Received: from SA9PR11CA0001.namprd11.prod.outlook.com (2603:10b6:806:6e::6)
 by DS0PR12MB8069.namprd12.prod.outlook.com (2603:10b6:8:f0::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 04:18:39 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:6e:cafe::27) by SA9PR11CA0001.outlook.office365.com
 (2603:10b6:806:6e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Tue,
 17 Jun 2025 04:18:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:18:39 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:18:35 -0500
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
Subject: [PATCH V10 02/46] drm/vkms: Add kunit tests for VKMS LUT handling
Date: Mon, 16 Jun 2025 22:16:44 -0600
Message-ID: <20250617041746.2884343-3-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|DS0PR12MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de48ad2-f9fb-4f87-3188-08ddad560969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tqDu2iqm8F/GFGatAen+aYTfcSKw+PhEvaXm88Br1jvzSDYS0tJOpMCTOycA?=
 =?us-ascii?Q?iQBMCXflaoIwHs8LfpmQAKUHXp+Zu49XQl8QW6Y8eAd15OPwdd6fFZSxd94f?=
 =?us-ascii?Q?ruDCs+RbFiVM/fEHYZMydQ0Noch7UWTdh0CelmIcIkVk4dfl7FkZwVy2aNDJ?=
 =?us-ascii?Q?n82oCqzPMWp2pi/P3gwxlFOEfko6tmp0EdK7AEboRVjEmTqaZMgqoEyUpdla?=
 =?us-ascii?Q?zusf2In0Zt98NdvPB9oyqb3gpv8fNvovcvg2NVgIeZ9fBXK++42lC2k0yop3?=
 =?us-ascii?Q?hZe0NaAR5i1iWXeisOdytppaCqkvw+haKLsOrmlCyGHMWXYKvILEtaezA2H5?=
 =?us-ascii?Q?q5Hkvl0YJrxsLELt27xmOZq10RrOasJNuwVD1p1ab+WAD+smVtVJzgGd9WS4?=
 =?us-ascii?Q?Gg9vFJSXFwmKxjQ2l7sXNmjsUyrSm9Jcg/2t3pxTtS0fCx+HbNheTfki6HR9?=
 =?us-ascii?Q?3gtUVmR8ythXRDELtR9Vp49xYqQNPVLGGdxDDo6K7vpUbAXD9SuIS/YPhjeL?=
 =?us-ascii?Q?Gbs7J0O9NWgSf47nH/++WsfqgIfQzyNPfKSDEKKcGRDuCgwWtSOJ/rJF/52v?=
 =?us-ascii?Q?4nWxS6Gnj46G2blGmrua+LPj/pNeqH0wy7chLaaGSuUfBMOeXhrTD17qp0/1?=
 =?us-ascii?Q?/WfYSn8ao16wcwWKVMeybpAD2VJuQiBNezRie9Wslk6n3kXpcLVuXoB9vpGP?=
 =?us-ascii?Q?1DQtlasWwKXudPeBOtSiaJm7FcwVbKxvNzjPtRjiAKSLd9pTipCrTGw8YUy3?=
 =?us-ascii?Q?IlIGTGHfid8bQQBg1go2ZJevDFUSgvpYCyva0gITf7RXb56DyxPPyRMgp7gQ?=
 =?us-ascii?Q?HZLVOTPC7GucLyuLLI4CI6n27JSYbWauwgjTu7RRLYXic+rjcocxb9udGikM?=
 =?us-ascii?Q?mUTdanA4eFk7jN8ppyqcM4WRTvZwUx8nlI2IFtl5DRHCAZzz6z7jG3Tp63uw?=
 =?us-ascii?Q?aBcATPSqJ/fDvt51Uzy+8P05uArLO4kk3yxxLsVB4QZZldpMTOYEr6XGjMSQ?=
 =?us-ascii?Q?yc1QB1IMhXQDyRY6fDmEcH460wgxrf1FVmZtNcDr1YSiPKEVy4036/YY57nI?=
 =?us-ascii?Q?8lPeS0z4TJ6rHZcoxNFK17J4BQ8zbdz0KQmY07W9XR9WG7hpivh9XEcAZzVg?=
 =?us-ascii?Q?43YfXyCV4bkfU3dmisESxUsQPLtdylRxkbdKZTas+vYn/rX/hbBLP0agpwxQ?=
 =?us-ascii?Q?NiWIu4RuOqqpG7qidAOMqpQ7l2DiLAUTdtbYLQYkU8FmrcUwWC6HtbAHke6W?=
 =?us-ascii?Q?ETJNvAD0wtmjsJmikDWqrpvvd2OpxEiTkRuRRO7IlwLKKiJ9iwEu7XCwD29z?=
 =?us-ascii?Q?W6oE7Vzhj4gTH+Wd03y29SaTWajbPZI6w9YN0zoC8ZPj7G5Fs1P8fuo3Fdme?=
 =?us-ascii?Q?xChjLbF7pxG83RCqOMSXGQN+p3ckRhCWbuREtza4/syLaz8xVrVavwBCiGVl?=
 =?us-ascii?Q?DQm7wPwv0nkejzqI3esuWk0dRUtwPu72ztlArTVClTsXvy5qpWdbGMPC8OWB?=
 =?us-ascii?Q?FuAzHHHf+k6/s4mdQSxRKub/iFU4m7crz1YF?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:18:39.2516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de48ad2-f9fb-4f87-3188-08ddad560969
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8069
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

Debugging LUT math is much easier when we can unit test
it. Add kunit functionality to VKMS and add tests for
 - get_lut_index
 - lerp_u16

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v8:
 - Update config names (Louis Chauvet)

v7:
 - Fix checkpatch warnings and errors (Louis Chauvet)
  - Change SPDX-License-Identifier: GPL-2.0+ from /* */ to //
  - Fix checkpatch errors and warnings (new line at EOF, redundant spaces, and long lines)
  - Add static to const struct vkms_color_lut test_linear_lut
 - Add "MODULE_DESCRIPTION" (Jeff Johnson)


v6:
 - Eliminate need to include test as .c file (Louis Chauvet)

v5:
 - Bring back static for lerp_u16 and get_lut_index (Arthur)

v4:
 - Test the critical points of the lerp function (Pekka)

v3:
 - Use include way of testing static functions (Arthur)

 drivers/gpu/drm/vkms/tests/Makefile          |   2 +-
 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 172 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c         |   8 +-
 drivers/gpu/drm/vkms/vkms_composer.h         |  13 ++
 4 files changed, 192 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h

diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
index 9ded37b67a46..e92f7143e540 100644
--- a/drivers/gpu/drm/vkms/tests/Makefile
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms_config_test.o
+obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms_config_test.o vkms_color_test.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
new file mode 100644
index 000000000000..affca56cac7b
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+#include <drm/drm_fixed.h>
+#include <drm/drm_mode.h>
+#include "../vkms_drv.h"
+#include "../vkms_composer.h"
+
+#define TEST_LUT_SIZE 16
+
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
+
+static struct drm_color_lut test_linear_array[TEST_LUT_SIZE] = {
+	{ 0x0, 0x0, 0x0, 0 },
+	{ 0x1111, 0x1111, 0x1111, 0 },
+	{ 0x2222, 0x2222, 0x2222, 0 },
+	{ 0x3333, 0x3333, 0x3333, 0 },
+	{ 0x4444, 0x4444, 0x4444, 0 },
+	{ 0x5555, 0x5555, 0x5555, 0 },
+	{ 0x6666, 0x6666, 0x6666, 0 },
+	{ 0x7777, 0x7777, 0x7777, 0 },
+	{ 0x8888, 0x8888, 0x8888, 0 },
+	{ 0x9999, 0x9999, 0x9999, 0 },
+	{ 0xaaaa, 0xaaaa, 0xaaaa, 0 },
+	{ 0xbbbb, 0xbbbb, 0xbbbb, 0 },
+	{ 0xcccc, 0xcccc, 0xcccc, 0 },
+	{ 0xdddd, 0xdddd, 0xdddd, 0 },
+	{ 0xeeee, 0xeeee, 0xeeee, 0 },
+	{ 0xffff, 0xffff, 0xffff, 0 },
+};
+
+static const struct vkms_color_lut test_linear_lut = {
+	.base = test_linear_array,
+	.lut_length = TEST_LUT_SIZE,
+	.channel_value2index_ratio = 0xf000fll
+};
+
+
+static void vkms_color_test_get_lut_index(struct kunit *test)
+{
+	s64 lut_index;
+	int i;
+
+	lut_index = get_lut_index(&test_linear_lut, test_linear_array[0].red);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(lut_index), 0);
+
+	for (i = 0; i < TEST_LUT_SIZE; i++) {
+		lut_index = get_lut_index(&test_linear_lut, test_linear_array[i].red);
+		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(lut_index), i);
+	}
+}
+
+static void vkms_color_test_lerp(struct kunit *test)
+{
+	/*** half-way round down ***/
+	s64 t = 0x80000000 - 1;
+
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x8);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
+
+	/*** half-way round up ***/
+	t = 0x80000000;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x9);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
+
+	/*** t = 0.0 ***/
+	t = 0x0;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
+
+	/*** t = 1.0 ***/
+	t = 0x100000000;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
+
+	/*** t = 0.0 + 1 ***/
+	t = 0x0 + 1;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
+
+	/*** t = 1.0 - 1 ***/
+	t = 0x100000000 - 1;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
+
+	/*** t chosen to verify the flipping point of result a (or b) to a+1 (or b-1) ***/
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000 - 1), 0x0);
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000), 0x1);
+}
+
+static struct kunit_case vkms_color_test_cases[] = {
+	KUNIT_CASE(vkms_color_test_get_lut_index),
+	KUNIT_CASE(vkms_color_test_lerp),
+	{}
+};
+
+static struct kunit_suite vkms_color_test_suite = {
+	.name = "vkms-color",
+	.test_cases = vkms_color_test_cases,
+};
+
+kunit_test_suite(vkms_color_test_suite);
+
+MODULE_DESCRIPTION("Kunit test for VKMS LUT handling");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index fa269d279e25..b0dc95f971d8 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -12,6 +12,8 @@
 #include <linux/minmax.h>
 
 #include "vkms_drv.h"
+#include <kunit/visibility.h>
+#include "vkms_composer.h"
 
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 {
@@ -60,7 +62,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 }
 
 // lerp(a, b, t) = a + (b - a) * t
-static u16 lerp_u16(u16 a, u16 b, s64 t)
+VISIBLE_IF_KUNIT u16 lerp_u16(u16 a, u16 b, s64 t)
 {
 	s64 a_fp = drm_int2fixp(a);
 	s64 b_fp = drm_int2fixp(b);
@@ -69,13 +71,15 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
 
 	return drm_fixp2int_round(a_fp + delta);
 }
+EXPORT_SYMBOL_IF_KUNIT(lerp_u16);
 
-static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
+VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
 {
 	s64 color_channel_fp = drm_int2fixp(channel_value);
 
 	return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
 }
+EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
 
 /*
  * This enum is related to the positions of the variables inside
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
new file mode 100644
index 000000000000..9316a053e7d7
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_COMPOSER_H_
+#define _VKMS_COMPOSER_H_
+
+#include <kunit/visibility.h>
+
+#if IS_ENABLED(CONFIG_KUNIT)
+u16 lerp_u16(u16 a, u16 b, s64 t);
+s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
+#endif
+
+#endif /* _VKMS_COMPOSER_H_ */
-- 
2.43.0

