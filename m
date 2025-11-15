Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EB5C5FAC2
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A5310EBD8;
	Sat, 15 Nov 2025 00:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yL4yZfPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012043.outbound.protection.outlook.com [52.101.48.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B4510EBD8;
 Sat, 15 Nov 2025 00:07:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHfqjpUE3XY9r2EJGq2PBCCiU/UVkVxNamNyHdlwGbekYPjiitG0l9b+QjekIBBxe8Ux2CndrM5cvXCLl6lb4BOqksLk6iCbTebr5XjyJ/ETNCeqndvDtXojqYn9/nIs+QMrIRZkerStMqyN+QxIfcSrEebvQ153MlUEIMsxxQ/2XqYiSaBT8Go8k/SZKGhmzZ2k3tq1nd8hbkO4M+pvLQagG68ZSmviEkPTtngl5ceP7RfFgoVBHfaFHD7YVmor2JP1iPqNOi06ca6qD/lY5rPk95iAgrCoVgzzuCanowMURHdtTtJVoxlsx0rxDVEqwjheWKTQw1TVCiCuNz3YHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7bxdQy50DbS/rALib2r4V2zdY/z/FoRf3JZDwcp0Pc=;
 b=sTvs7SA4lKGzz1jzIX2PYpdHLAysiv3aTKzPBKt+MFL4v8ydquL3s1UCTp1UfF5Zjfvlw1nPLxroUjUVz17QOvKR8EcZehDPTQVYEqaHxp2ky8nNGBI5nJF1yBhlzUaZqULrp5x8N82cr7wMlB4i7R6z1cL+6k9+4Alo0yovHsho9Xd0fPWrZ4a9APGRZGVCMEDLknyKAdxURg2zw7glxsM3oRe0noEBfED6KB2/+1qdW4T6pRXxQAHMahLbvmb36Umb4CpaMUs51BroAUKZ3hHXpQPaa2xxK54fRdviXyF/aVAgHSubLXcScYRQezSfoIIamVnTqLf4trEGFAgdog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7bxdQy50DbS/rALib2r4V2zdY/z/FoRf3JZDwcp0Pc=;
 b=yL4yZfPPxBRPRWN8MvA9v6anj5CeStyF+xFSLfum/tN6VtjLHQnl7gSTgzFPb81tEiCJLg2S+swylG8zzr1XyQmrdzAni4qgU+v3KEsa5pngY7viX3sraELHC9xPAydLTkjzDkITgBbvg2m/N+IMNnaHVg84+duDMZrKPcYINUU=
Received: from SJ0PR05CA0058.namprd05.prod.outlook.com (2603:10b6:a03:33f::33)
 by SJ2PR12MB8720.namprd12.prod.outlook.com (2603:10b6:a03:539::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Sat, 15 Nov
 2025 00:07:51 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::76) by SJ0PR05CA0058.outlook.office365.com
 (2603:10b6:a03:33f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Sat,
 15 Nov 2025 00:07:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:07:50 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:07:47 -0800
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
Subject: [PATCH V13 17/51] drm/vkms: Add kunit tests for linear and sRGB LUTs
Date: Fri, 14 Nov 2025 17:01:42 -0700
Message-ID: <20251115000237.3561250-18-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|SJ2PR12MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ef3040-beb7-4bc8-b1ee-08de23db0456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rUmcgDUjlhORHmndLA3byQc4L/l6f/bBeBdZc9VU6xd10StAGB8ErvDAtFcS?=
 =?us-ascii?Q?Rko2c9jbJcIvxUm/XYzgDgFAwZQVi5MOlhAlmm/YL007Ddbkr/Abhz8PDWII?=
 =?us-ascii?Q?9wmEVxGbSrInQHziCrA/kY0d5qVtgpMqgft/82iM6XLJNJ3VH8JhTWVPG0kZ?=
 =?us-ascii?Q?X2MIF55vjBfKxWNfFsc7zQIJvNs3E2DIVlnZ5KXcEyt52bPbaxoTI+p9zwV9?=
 =?us-ascii?Q?0XgXVimQvWSAqFRITChIuVUMOxA/fv4xKKVFQp1sy0afQtNpsSkVIQWjyi7C?=
 =?us-ascii?Q?hdJXNNs8H5Ts4Wakw35C8oJCJCQKFZLUpg/WGde0A8Ck3lgHoFLnQwjiiK+6?=
 =?us-ascii?Q?Oaz22q16jgOJqLQTPFgd5CWC/XaDI+gCQ1+Uo+0IsiIXjQw8EIYB2xh9qjdH?=
 =?us-ascii?Q?aPrvDAl4DgO7YX2n/hnBu5pVoPHg05+FPTf5dlRDNpGpratEcYC8h3rSKFQu?=
 =?us-ascii?Q?wOfi8UgziJ7B3auj8hVtbuKo1iUQzSv4t2trjTGsmU1+ZF1QVGTRYZSFInZK?=
 =?us-ascii?Q?mFs/fcZ2aTjufLQZgJTf/Wboz5c2h7CYZsMOahIw2I18hZHceCohc34rHjTx?=
 =?us-ascii?Q?8nWKXvy34ZJAq9LtcpowACkcj2LMBU7Xv7npc4/N0ORKc4lFxRhWuencTgms?=
 =?us-ascii?Q?m/2oWFPmiK3z6hWA9kQ/+hlvtOmlztpS6GF3eNlwK1T1uIJLxgtOz549iaWi?=
 =?us-ascii?Q?QwM4XR9KaiVXFLy5NyidCZXXc7rn4PyfyUAvaIqiCmtD9ghmvXolNo3jrAAf?=
 =?us-ascii?Q?Hm4o0iTDN0chgOc9wfeQ5GuuGezhavsxtQhQ53aIyjGTkT8pkJFHGzQQG3EE?=
 =?us-ascii?Q?yqBc7Nmatoa6QH+wT7/ucEPxKU07X0ipuF692VZQhzK98+nfYLNBLOc3OlZP?=
 =?us-ascii?Q?0OcmFhBTDTikFJqnW0REW8JAN2GnERUxk9Drv9Ma2g3KhB6R7GoczX8S9qaB?=
 =?us-ascii?Q?nTI0WRvRBW5JoBgBGhgC8A1tHBnc2GJ3t4NyqLCQ+Q9oRRpCing5Gf5uQwyn?=
 =?us-ascii?Q?+SEhFBXSmHSS2SUb6LG32R6Ezdl5xFEz93803eSw/Ix7wVQ913N1Kpea8FQl?=
 =?us-ascii?Q?C9APsMRbaiTUxrkOSWeeeuzvHuVxAGd1UHPwmh5pI+i3Z7qlF07/v2aeNd9r?=
 =?us-ascii?Q?Na27BlhxkOuCm5mmmmS9pNHdhn/zNZE3dRAPVtcX0CfA62hViGGLoolXJT9J?=
 =?us-ascii?Q?OMEIZ+XYo9H82AiY7z/JZkgsz9vzbG/CmomEQQi2HF+5v0YoVbd+tpsh+JMZ?=
 =?us-ascii?Q?TDwSvWMljHWkbWvAqjOGY4MbblVr41+Lk0xiPfjNlt9kTY/d8qckFkHXd7p9?=
 =?us-ascii?Q?187vvcgyN8v8lmSpujSN8LJ5bC0TLfanfLZZOTbh+Oc58vjAMPnPo+Hvcorv?=
 =?us-ascii?Q?SzGsKKFsJ23+MkGOx+z+C2vLhtW2OoV/4lBnR763KxhUE6gGAtHT4/BOKxqf?=
 =?us-ascii?Q?ggLNiVmPirG/6ntrhLPMJmL6zZ26MTD38I43Aj1TcnVQlL5uonwBBQty7DL0?=
 =?us-ascii?Q?eaZ2CEIz2yS++EYtGPTkA/BqA/8VkGKXdAMMxJCrXRNBdIWDRBUyp1YYY94y?=
 =?us-ascii?Q?GEfPnhl6Mz4d8bZjic8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:07:50.9454 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ef3040-beb7-4bc8-b1ee-08de23db0456
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8720
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
index ba810cc940fa..82116e283e6a 100644
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

