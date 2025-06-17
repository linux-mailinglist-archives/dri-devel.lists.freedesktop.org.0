Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CB7ADC050
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E92A10E59D;
	Tue, 17 Jun 2025 04:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ECV1gV+5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C0010E56F;
 Tue, 17 Jun 2025 04:21:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9oKsNugDIZkr8wWPwL3tyk1Eu/0CAf/GtPx/38mDN4KurYuJTTiiyoaA/A+4CaByhdEF7vAOJYgslJ+NBeJ8YqSHkndNJo/GeDErZ2sczHaulodPuB3KzBHAimSxvGTkbMDaYj02eWQbUVDYqndQi2XEB61qltNAhFsNUCTkP6wBu73jeRxNJpNCdlPxgoIsQOR6I7KaL6uesMnfqeLY2zWTQIpGwyFOa5uw3KqkVVGsPMQIdmX8sMAGGMNEfffn6jZ0GkotJjc8PeSRvhH7EFJqmKB0Nk3QxRQxbAOTvnQojBPE+nrpCudtX3tac2snP9cxD9P3Re8DTNwIPX/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNQn+dZLcOgfocjxGmnJ67xSRufVBylGjUvEZCt2a1E=;
 b=Eg0L4qi3ZfDTS32fxvYrWG5DDWPE8MQ9F6Ll/3VQ4JUCoUmZtFRMzRJAb56XJb/Zdc9BHz6WE+NlbFTB03ynuXVdvf0RDcrqN6Ksjq6Nl/evsOavRsD9XlD4i2tkR3xI1fEn8gkcQEmDK8XCqWUjXKLty94nEi7kbd4Yq79eRuPEpe718qoV8EMHcHNdIAtLNYSWvMa+VF49bZAwR3nLcdc3/ktDN8A+ku1jem5K441D167iuuA7bNklL2nW79VBzpsBvOopKR0lrERPwOuEeg7+cPm9y4SFaqpicWo64IILNZx6Sk8buTCcEa2003iz2izmEfou5/OZXZNWvig+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNQn+dZLcOgfocjxGmnJ67xSRufVBylGjUvEZCt2a1E=;
 b=ECV1gV+5YfHmouMfkNTkl2DQ+M3m6po5yOiMxREWgwXeSYyWKw7ieNSkIYieazz84fTkklRneUg7xHrQ4hyp2ivavgbO7ZTYwqfGYsQSDbcMF7zAqyC8X7gMrxRS9/GvtQ3DjvqKAt8rEPq0LQngkdgvTbLTMTJbbhy8HKi2tng=
Received: from CH0P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::7)
 by LV2PR12MB5893.namprd12.prod.outlook.com (2603:10b6:408:175::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Tue, 17 Jun
 2025 04:21:53 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::7) by CH0P221CA0029.outlook.office365.com
 (2603:10b6:610:11d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 04:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:21:53 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:21:41 -0500
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
Subject: [PATCH V10 15/46] drm/vkms: Add kunit tests for linear and sRGB LUTs
Date: Mon, 16 Jun 2025 22:16:57 -0600
Message-ID: <20250617041746.2884343-16-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|LV2PR12MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: ca517c7c-5794-41af-b5a4-08ddad567d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?raNgI31dK4nrX0HKlkAID5Kpfool7PaFccXAyckm5s03ODJpYv2N+Y0n+/Y3?=
 =?us-ascii?Q?LK9Ql2UdLHt7TqQhJa4uCzOZvLlpK4eYLwIoGBkNmVktvuBS1V+nJgjuqbVF?=
 =?us-ascii?Q?UbI+2B4+kkK9kvTSwxj9sFp/qx+yhrsThAz3Anxgvs1MB5Ne+9W/ozC4D6WN?=
 =?us-ascii?Q?dVAzFji/UtIHjNvc8WBVEsztXNk95nJlkGad42/qkw5IctS27UNe0BBzJwLA?=
 =?us-ascii?Q?KLuv7xsClYN6x0cytVK3x+0+oPBeZ5wZMpliOJEAi2gdmtwlCcEAzm0JGYUx?=
 =?us-ascii?Q?nVXBvUBe08zaOEfvc+BXe1bKLVMn3xvzFU0uA6ejOs8Ps2dNPv6sppmCZMcz?=
 =?us-ascii?Q?EoH1FJJ/IVCF4CHECSpjPjaPSNsGET7iMTputkn3GuUR9Tovis2+WJKRPohm?=
 =?us-ascii?Q?Qmj222PNi0fdEREbo04/rgx8AboKVWRJ8m1goc5R2hrwRVtK2J8fzzD0JJNP?=
 =?us-ascii?Q?PH4uT25saP7Y10hXvM2gtEJvJPOWV1vahUUi4gIK2pXLPvdCqqoEk5bjpDM/?=
 =?us-ascii?Q?Wp4TOQ16hycKghSOwH3h6j+7wQNi+3IkWkOKI0/LP1fCCd40Fw594yCYDfqV?=
 =?us-ascii?Q?9lul4QuBPL1J+chGRb1TY1k/Xjj0SEGAVMba7joAIsjxrxl/WdyQpzahw572?=
 =?us-ascii?Q?KtyWBdLksGra+CdczIau9ftK7vb2VZFe+/9LvRlW5J9ONHf4oG8NoTjkNiKk?=
 =?us-ascii?Q?KEP5DDMiG3dZtzyR79AsklWTyYvX7gR5fcIY5BjHI/zTlau5bKQ/EsxTQVZr?=
 =?us-ascii?Q?beH+KPHfFAnmKQe+UPOASUqaKS0rPU8CuPFMCUPNL9HzjWF6XTkDtgZA77/C?=
 =?us-ascii?Q?91IOQ8zhq7u+UbjJet9kyL1ej3CoFF2f1hvvY5p3/2p/3gV/s3HWxzKQx8kb?=
 =?us-ascii?Q?1mU1bvtQIfYSAscBKdJlPY5aogxqihAY+3mV51NPpA/8v4ktiDz7cgPH3WWP?=
 =?us-ascii?Q?kJNXI7aHeSGc//8uHK76YSQomK+IamoSrYe/MHQC2UhE92KFA2xSXyCNIx0V?=
 =?us-ascii?Q?2wv2i8TGZaZg9LZGZWGAFO754IK6m4y2Eau23bAE4Y8Dl1aLB+GSb22q9Thl?=
 =?us-ascii?Q?BucGp4LwMsEXOEorLRH4JR/dt4TVzKQe8m5pSnYypyXFt48WAei69BIXYSGS?=
 =?us-ascii?Q?gka/eGayDnM/Ajci9/ROabUu7lVgZHs7MKRlJrfEwiPuckQgzmvFpo+pZwpq?=
 =?us-ascii?Q?CZsCFMG0Kaku8i+ZODyMv7KnrKd1qvhKWye1uSk3JdwYGh8ILeflSwJlQYCM?=
 =?us-ascii?Q?I+G8lH5LejCZS5n7bdyaSNao7P6oDNrSKt3G8ttFyEi7yJs/40gtMBT7imbu?=
 =?us-ascii?Q?EVO2Zy4P6aKIp0BV1IQS+pJQAVVCgxXZ+pLH5aFhaNb1UGB/Jbg4qnd4SCsU?=
 =?us-ascii?Q?hpJIgJJH12jCvspOi+QFZd/PYmoiFVboJVlswCCcEIrikTQZDMBcNBfNJRXQ?=
 =?us-ascii?Q?P/N0wh4nwIucndNVEED9CAZgWQ2sr1f61rzA0l+gW2XF1BkLivO4ArW+JE8C?=
 =?us-ascii?Q?MfozzblITE6GUpLqLu8Zgdp49EBhaDH+jZ9H?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:21:53.2712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca517c7c-5794-41af-b5a4-08ddad567d0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5893
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

Two tests are added to VKMS LUT handling:
- linear
- inv_srgb

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v7:
 - Fix checkpatch warnings (Louis Chauvet)
  - Adde a commit messages
  - Fix code styles by adding and removing spaces (new lines, tabs and so on)

 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 39 +++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_composer.c         | 17 ++-------
 drivers/gpu/drm/vkms/vkms_composer.h         | 13 +++++++
 3 files changed, 55 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
index affca56cac7b..02fbe19c744a 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -6,6 +6,7 @@
 #include <drm/drm_mode.h>
 #include "../vkms_drv.h"
 #include "../vkms_composer.h"
+#include "../vkms_luts.h"
 
 #define TEST_LUT_SIZE 16
 
@@ -36,7 +37,6 @@ static const struct vkms_color_lut test_linear_lut = {
 	.channel_value2index_ratio = 0xf000fll
 };
 
-
 static void vkms_color_test_get_lut_index(struct kunit *test)
 {
 	s64 lut_index;
@@ -49,6 +49,19 @@ static void vkms_color_test_get_lut_index(struct kunit *test)
 		lut_index = get_lut_index(&test_linear_lut, test_linear_array[i].red);
 		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(lut_index), i);
 	}
+
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&srgb_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x101)), 0x1);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x202)), 0x2);
+
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x101)), 0x1);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x202)), 0x2);
+
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0xfefe)), 0xfe);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0xffff)), 0xff);
 }
 
 static void vkms_color_test_lerp(struct kunit *test)
@@ -155,9 +168,33 @@ static void vkms_color_test_lerp(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000), 0x1);
 }
 
+static void vkms_color_test_linear(struct kunit *test)
+{
+	for (int i = 0; i < LUT_SIZE; i++) {
+		int linear = apply_lut_to_channel_value(&linear_eotf, i * 0x101, LUT_RED);
+
+		KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(linear, 0x101), i);
+	}
+}
+
+static void vkms_color_srgb_inv_srgb(struct kunit *test)
+{
+	u16 srgb, final;
+
+	for (int i = 0; i < LUT_SIZE; i++) {
+		srgb = apply_lut_to_channel_value(&srgb_eotf, i * 0x101, LUT_RED);
+		final = apply_lut_to_channel_value(&srgb_inv_eotf, srgb, LUT_RED);
+
+		KUNIT_EXPECT_GE(test, final / 0x101, i - 1);
+		KUNIT_EXPECT_LE(test, final / 0x101, i + 1);
+	}
+}
+
 static struct kunit_case vkms_color_test_cases[] = {
 	KUNIT_CASE(vkms_color_test_get_lut_index),
 	KUNIT_CASE(vkms_color_test_lerp),
+	KUNIT_CASE(vkms_color_test_linear),
+	KUNIT_CASE(vkms_color_srgb_inv_srgb),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 3ab829556db2..72890ffea13a 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -82,19 +82,8 @@ VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel
 }
 EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
 
-/*
- * This enum is related to the positions of the variables inside
- * `struct drm_color_lut`, so the order of both needs to be the same.
- */
-enum lut_channel {
-	LUT_RED = 0,
-	LUT_GREEN,
-	LUT_BLUE,
-	LUT_RESERVED
-};
-
-static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
-				      enum lut_channel channel)
+VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
+						enum lut_channel channel)
 {
 	s64 lut_index = get_lut_index(lut, channel_value);
 	u16 *floor_lut_value, *ceil_lut_value;
@@ -119,6 +108,8 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
 	return lerp_u16(floor_channel_value, ceil_channel_value,
 			lut_index & DRM_FIXED_DECIMAL_MASK);
 }
+EXPORT_SYMBOL_IF_KUNIT(apply_lut_to_channel_value);
+
 
 static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buffer *output_buffer)
 {
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
index 9316a053e7d7..67ae09913460 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.h
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -5,9 +5,22 @@
 
 #include <kunit/visibility.h>
 
+/*
+ * This enum is related to the positions of the variables inside
+ * `struct drm_color_lut`, so the order of both needs to be the same.
+ */
+enum lut_channel {
+	LUT_RED = 0,
+	LUT_GREEN,
+	LUT_BLUE,
+	LUT_RESERVED
+};
+
 #if IS_ENABLED(CONFIG_KUNIT)
 u16 lerp_u16(u16 a, u16 b, s64 t);
 s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
+u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
+			       enum lut_channel channel);
 #endif
 
 #endif /* _VKMS_COMPOSER_H_ */
-- 
2.43.0

