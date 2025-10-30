Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2261C1E41C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110CF10E8F4;
	Thu, 30 Oct 2025 03:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1QCzvrPW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013039.outbound.protection.outlook.com
 [40.93.201.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5F510E8F4;
 Thu, 30 Oct 2025 03:48:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjezqUD3MnB9PakYYf9qAVEpwp1NBI/IOV8F5vseyL0QKqJ/JxPfVMOq7vvbnfc/12cdxwVopRS1bbG+7LoFGRQjnEk2HceCN/3e1eY/royXfacnHdl9ENBzvlBdg+Hsyt+ZX3ls8Qzsqaz8+9Be8ULK08MUKiJA4o7VMq3DrkUHMXu+tnwp9bl6xwvFP+02efLS9lyJt1HqZhnqqxyuRgC5kIVmTjGHyaUzjf5RU1tSVn6J+CnTu89Cqmg6q0WgVX4LllNrxdN0oml7eexGLi/JYkERpwHTgRu34ChVr1NscHpaU9HhRZTc0TckFwstgUWPG0kB3AL18COmUx/cQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfDZAqGKcWEtte3KUG5j0OdVjNdfN3yp0V0F/c4Idpo=;
 b=cG1Jj3UUskjHO7qIj/adX711zYd2SSlerpK+V0FvDTsQN0GPeXurH+kBAdjgaQy7FW0pVsdyDoBHCYWbB81lz8W5tcpMrbueXZwyxf/FMSkmKbnMtfL//ghzuFUN7XI8cTCZ1Cz8lU+VaOcV1CKP+BDPFz+QPKHf8Ru3E7Wt+DCaT86elHnVRfk0uXAygrtiqkX0KsdF5F/XJYqWTRnz0fFlJ9QEYfi4XzJtYTjjkqGmq2r/W+l74e8fmYO9goVhsyNJbMgHy0LdRsV3EA1xrJmsvlXln5ieNjlj3J25KkCm/sD/3c274Mfw+jUM+JkCV8GF45kbdJCnVvwc+D81oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfDZAqGKcWEtte3KUG5j0OdVjNdfN3yp0V0F/c4Idpo=;
 b=1QCzvrPWvjs5kGtY7esvR+G9bYcFJNEH/C0n06iDZRVJjPmMInfKxwoMF7WjiDIpIcWtnVjRnN2pzDflfI3P2ASQH2e8T5pb/r2bsoN8FHGu6CCyKUkfH65e6T5u501CpsawXbkecwLkxfZ5Y6y6WtoqfyRmUvDnVFTlACqrSRs=
Received: from BN0PR10CA0006.namprd10.prod.outlook.com (2603:10b6:408:143::32)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Thu, 30 Oct
 2025 03:48:30 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:143:cafe::b3) by BN0PR10CA0006.outlook.office365.com
 (2603:10b6:408:143::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Thu,
 30 Oct 2025 03:48:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:48:30 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:48:26 -0700
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
Subject: [PATCH V12 15/49] drm/vkms: Add kunit tests for linear and sRGB LUTs
Date: Wed, 29 Oct 2025 21:42:20 -0600
Message-ID: <20251030034349.2309829-16-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 7332f90c-742e-41ee-229b-08de176730d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2MJDVIlZ0DvQypLc81n6rB9+I2bNhj9I7MW0CX5DitvrYzcnP109jqrcCnZW?=
 =?us-ascii?Q?HnYBg7xoubYTcTVwfljaWCKZeBmsTP8nA2o12TnzU58TXuE3+SiYN0T/Oivc?=
 =?us-ascii?Q?SyhmLLV5aetSz5JvEJZyvVdwHwSSn5s/sa2ebQozk8Sc8+pu5z65PqBnkFwx?=
 =?us-ascii?Q?27BPoozArCMZaulziNTqw9MvJHGkHqygTpqYOGqLXzAHgrqx2Ei0h084pw5d?=
 =?us-ascii?Q?mqFq6RH97v6Om++q8IdP9lQWUHK6avwTele8ODSJESocuBXNKEi/qlFE8NOw?=
 =?us-ascii?Q?wFMrTM+m1BT0AZjufJ2EHlEpUokymHVj3dpK0wKESlT2ceg4MdH5rU7GiBcW?=
 =?us-ascii?Q?q96cguBMx7CNLpBWcjv8m2UrNEzyZDJKwFr1QM+Jbw7/XZnCL82iWRoUO6iw?=
 =?us-ascii?Q?Mkx6SYK2WOt5K1b1RcQGaR5+u3VJpwg9QyNYJRYZHmJDYy7Qw9gtpHMfBLa1?=
 =?us-ascii?Q?iylEbjiCTV3INA3oMMHZhqW50s4rf48Mnj89JNh8iD58pc7PkhG544d4AsKZ?=
 =?us-ascii?Q?7FxsskY698Xt36Aw3ixBig6YKaBSNfPsu6sj9Nfx5lNogbuboLgsvgCOX9B4?=
 =?us-ascii?Q?IQs0g6KAejpkINbBZA0WXfhLjRM2K6ZbW5hVX85/b1JaF4QjEl6YQrPra6XG?=
 =?us-ascii?Q?0bqbHB06xKKRoKVkUzvO7IWLjbv7QPunwMmsgiDh4Op9MHjfY1QOQNuFpJpR?=
 =?us-ascii?Q?/1mmYEhqmNjjE3CR4XtvEXNUJBwtjTJVOT76uNwst1sAB5PeH0w2JwOSHyU/?=
 =?us-ascii?Q?wLUmgb6vZz9mPLB6a8a7PvmdydeAYWhDJfuQMxyJHnN1iIL0YhyDF4Ds/cQI?=
 =?us-ascii?Q?ZetYUjuHH9+AEz2oPTEXLGGkTYUubajrD3i6aX252fEOoLbZ4ZMvzl4+kxsw?=
 =?us-ascii?Q?FzsDWgPTw5Ok5EzaFSTwi4cblxNAEXzeO+Hq8M0nEJEEGyCrS9ONq8TzkYGP?=
 =?us-ascii?Q?RXnuBf/7rDb+k4UQzn5eo5pqHlQcNXMHQvTq9+bKYSWAqnC63AWz9KX2DWZ+?=
 =?us-ascii?Q?ZAGeZWtJJevblq0SH6WG7aycoijEnyrF94WKOwISJYTpdSr6YoB81IDbqCwR?=
 =?us-ascii?Q?WZ/MZUWuim20Y0xKZOaZ1UdV0Fm2IJX4OTYsu2M0I/AcISWANFbrES/trBSG?=
 =?us-ascii?Q?rhPPd/1TPU8Pz7B9COI1o0IwI5SWOLABOafrusxkkYS6rYkeGw43TmHpjkR0?=
 =?us-ascii?Q?CgLkDdzoy+3EZ8ATnv+PqEUqin/fKL1Se4uLHQR+F9c9/X5ujRTrqmSuPvY3?=
 =?us-ascii?Q?AOHjCbl61NqTITNI1mgoTy732gsxdaHkIh9r4CsV4qTKAfVPkDaELxC87kSt?=
 =?us-ascii?Q?VgYx+gSk4PsYiOaRRszzNOXmmSWHtwXD+WOqUXCF9dMwx2s6toSeye41byfH?=
 =?us-ascii?Q?T0YQ/V/ji5aDvje/cwfC35CwEps0/5Iqr0YTRzHSDhrFywJcp9u/4SapsBpn?=
 =?us-ascii?Q?zPZTLzGbPZEFF1ICu31FQ6y5VRFL2qcqz2qztmtFySd16eeBl/Ti+5nXQiBR?=
 =?us-ascii?Q?DQPJb0fOjN5b9RJjfEmR8oz2szeiIeFQPN3VIFcKD82N04waDWpSE+8tzR9E?=
 =?us-ascii?Q?ORr8e0W37Ak7QIu/pL0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:48:30.1238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7332f90c-742e-41ee-229b-08de176730d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375
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
index 582fae1f3220..8ede657e8e34 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -6,6 +6,7 @@
 #include <drm/drm_mode.h>
 #include "../vkms_composer.h"
 #include "../vkms_drv.h"
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
index 1f2d2265bec0..589324a806a5 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -81,19 +81,8 @@ VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel
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
@@ -118,6 +107,8 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
 	return lerp_u16(floor_channel_value, ceil_channel_value,
 			lut_index & DRM_FIXED_DECIMAL_MASK);
 }
+EXPORT_SYMBOL_IF_KUNIT(apply_lut_to_channel_value);
+
 
 static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buffer *output_buffer)
 {
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
index 45f5e6a4986e..4dba69f46092 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.h
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -6,9 +6,22 @@
 #include <kunit/visibility.h>
 #include "vkms_drv.h"
 
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

