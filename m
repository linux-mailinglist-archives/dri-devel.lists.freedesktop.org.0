Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D6EB2774B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF7610E96A;
	Fri, 15 Aug 2025 03:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HzX0Mszh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20F110E96A;
 Fri, 15 Aug 2025 03:55:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hA3jGgIZ61k7qPS5Huh69xWkHSV7gjZ+k5A2BV5dwZCeVcwhBSE+XRAAC5azUVvynJ9nwnxzMoOPfNy8sBv3suZqPEYWdpvo35zYDuiFkLZOGhwSFNWzRzPX7dtOzd+WViIqgzsFperybYvM4xEFyseX4z/ak5SQg72W9f5YsDph8yvK5QKdrfMah+RKLqWBlrZMP8YPspK6avQHjb+Hn/ExaHSPgfh4KgcsJW2KNy7o7C7rLhBfpiq6/0JltXmTfKTt8OPMS3JCGPnWFG27vgHRxtMYMpQBcja9beYrYQDR5D3x9nT7bf20RUVO5/u25grs2Og8/JYzFLhhoZmqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsIJ+py1T7Lqg7g0/okYVdgpp8JkSBAzebZBF8Z+Wvw=;
 b=giMvuquNTevG62VHkpdMjcSdlXwxXLqUS5Xz3Jcd23yJlMoReKvKFQWzM5xoyti4rHWYIDVbxdMnJGYlurzRDjP4s4q5+Txk38rvCMEj+nwCaVu2aJJ1V+YxZaQG2RKFyLCg/Et+KWcHdFO7ipQxSIzOM+1ch3LPX8xC89qQpvkf5VY/hFu6XCmZu+OvaUde1Tb7UZBn3XbTEy2wKHG6RQkM9Opn/RDD5o67WwsykGCOb3wfSEHG6B6mkOBoSqiVmE7RsX/8NkGU8DmGuvdX02VZUD/bqqG556d6/zt5WO8OumfcpD+IvQfyh1yX7bVcAByF6uKhqK3eLFYMuy+9vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsIJ+py1T7Lqg7g0/okYVdgpp8JkSBAzebZBF8Z+Wvw=;
 b=HzX0MszhYC0ZTVTA4g+Jl81N4WcDnFoo6bIoRDqkM6rE9tl8I1YFhU0qr0uH8rqrZoK6iJkcJddYJLWBd6Rzuhi7zx/CLsDpCNXW7AhT7zlqGDj0HfmnBgbJCRN87gH39GiyGV1noD/9W4N2ivRoc+hhj2QwdJ5tlr7DMiIHUIA=
Received: from MW4PR04CA0221.namprd04.prod.outlook.com (2603:10b6:303:87::16)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 03:55:16 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:303:87:cafe::13) by MW4PR04CA0221.outlook.office365.com
 (2603:10b6:303:87::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:55:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:55:15 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:55:11 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 15/47] drm/vkms: Add kunit tests for linear and sRGB LUTs
Date: Thu, 14 Aug 2025 21:50:04 -0600
Message-ID: <20250815035047.3319284-16-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|MN2PR12MB4342:EE_
X-MS-Office365-Filtering-Correlation-Id: e6bb25ae-aa23-4853-fa78-08dddbaf8b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gnA6Qq+ZW5tDJsyITCENBJ7nLDY1Ysq3lgXDxyORc7kqZK79b6I2WIhPGscr?=
 =?us-ascii?Q?U8isi7jBG1YlbGQi4pqaWs5dejgQFcDjU3Y9aj5BRdLr3U7gD1el1+gteiyM?=
 =?us-ascii?Q?eJ5rGDjEYrg8DouW2RltosMczTxYspusCknA20WpMCpwoPQlKmA2aN1Ev7VD?=
 =?us-ascii?Q?wzAfSuXvmLMmwidjpxYUopau+5wBfCXFuGClYmfcvqXdYGIRwiEkSTYfPEjK?=
 =?us-ascii?Q?IhlQznLF/DKrw87/zXd9t2GNtW5dZyyVwABB/Vbpd3iERKNlq6Jfrh80IAab?=
 =?us-ascii?Q?/NYCp38GbppLwEQvQokk52RIE3ObDbtxw3cxc827c/Xupu7AfZvBgrrCE3e8?=
 =?us-ascii?Q?oq37CH+XtJgH0+BJZ2CqA6YtzChPjgX47kCzLiqZYw4V/mn/XetSqyZeoGhZ?=
 =?us-ascii?Q?0dFRKptrzRBQdNAnHI4lEtp/zr1UZkKkg3VqpE2Fx+fXdj2HWYH8m9X5ieik?=
 =?us-ascii?Q?6tjCbc8EJkRsVVtZ32X17rzo261hDsk9DvmvwvSK0ckTG0HUbdYlwnsP4A4l?=
 =?us-ascii?Q?Iu3vhzIELwl6R7kiZAuyWxShCSw4f9HkDdvIL6u42aHyhoTcN7mq532K2GBb?=
 =?us-ascii?Q?KPneOtwFwGjYA3RcJE7itWXlgvG957daBQXe0HzUimClujWLtsT3Bj8p9OFf?=
 =?us-ascii?Q?EuSa/k8FPvbgjLGBlSh48T/GrxXxpkhWdiO4+fHqugtfW5a0Lv7f8DWwaqwU?=
 =?us-ascii?Q?9aG7hI7FtmwaR2JDfw91WtSVOa0XCKDH5uwVMvq5dYl4taJIAub85aNc6bvR?=
 =?us-ascii?Q?LBxcUeLsoj4a+pI4vcAbYpTjoZ0B5uQzkBdC5tR0Z86f6Xb3ZCNnYN3qlBOQ?=
 =?us-ascii?Q?TN/asIDYOoQmT3xeZNIFCUOdi9KcoEg2+zsUKkKqUzCRGy2MD9TCRnaWvMOG?=
 =?us-ascii?Q?Lk9UjDMXCndvEmwHYlm9BIwFkGNJIswUYc7uiJPbqwX2PanIHvefWD72gfR1?=
 =?us-ascii?Q?jOPkdiEpHnQSe1VDZS56GMbAC2QX3hFwl/V+F4TrA2vkg5Jgm8lEJtrnPZD6?=
 =?us-ascii?Q?TY29xGa/oEfCTlpQIzslQpvf57RGDHDLOW9aAUfxtoTAQ795oFWZTS3eRqVJ?=
 =?us-ascii?Q?7tnGL1iTzK6CmM9tULu1NNRE+Wc7jn9smL+rYY7SBD9YKAsZ4VLNQnynwFJn?=
 =?us-ascii?Q?4WWn3Z4p4Iac7n9vtCCLoFsjYmEupb8/Icv2DKmp0J5Qq3WYXMwzH3b/fGAk?=
 =?us-ascii?Q?rnPmG+DIINiLraraK3a67+UH6HeF4xn4PJyzu95aeh/Lw0WscaEI919IaTVx?=
 =?us-ascii?Q?H3I7Jqfl0FWTAdL++mWr9xVMM7zhSa1DeW/RGbSUW5Yh3OchDSOjDZayEYA4?=
 =?us-ascii?Q?mGfzKvaGUshHI/I5JNZLA9kC3I+un5Z+YzJ3jF2fzh6z/YVG+e5ygBU2NJ3y?=
 =?us-ascii?Q?R/nnGqWCpFqTIb+ppzd5RRqpNhK8sgYJKIGpwnP5OJhoHh30OUthb6daQdwC?=
 =?us-ascii?Q?64+vabWVBmav2Fw9MSvEHgltrqoAaDggTIknqqRhaqVUkHhDLSHsRytqkfvi?=
 =?us-ascii?Q?8Pdy6xiUrieZh10tloaz72oV7wBULjE+8a5X?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:55:15.6793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6bb25ae-aa23-4853-fa78-08dddbaf8b33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
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
index ee4dc7c62d73..2890aaa9d2c9 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -6,6 +6,7 @@
 #include <drm/drm_mode.h>
 #include "../vkms_drv.h"
 #include "../vkms_composer.h"
+#include "../vkms_luts.h"
 
 #define TEST_LUT_SIZE 16
 
@@ -87,7 +88,6 @@ static const struct vkms_color_lut test_linear_lut = {
 	.channel_value2index_ratio = 0xf000fll
 };
 
-
 static void vkms_color_test_get_lut_index(struct kunit *test)
 {
 	s64 lut_index;
@@ -100,6 +100,19 @@ static void vkms_color_test_get_lut_index(struct kunit *test)
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
@@ -113,9 +126,33 @@ static void vkms_color_test_lerp(struct kunit *test)
 	}
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
index 2b9838ef23d3..0f3fcd6a5925 100644
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

