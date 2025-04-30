Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9683BAA4040
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59F510E61B;
	Wed, 30 Apr 2025 01:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IBnmZy0e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D7210E61B;
 Wed, 30 Apr 2025 01:15:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGqREctoiYwKMBCPow5yLo8A+wJvMSLPQFglUUuW02igyF/mWJ0ZaLolR1f7Qe8ADHznnTZ8rb5alZQA6bv5aaoAHVNXrbOjj/kRvwI+gt09Pt7wfaNFyv01Ijkuye0eb7KC1njRupOG0ZBznjOufOKNEBh3S+o4mRFDjNm93AVOUJ+8pgFblkir+vi230xGJxBYVPXRzLOoJHmaFCi0eC3n6O3peuk8Pss4yXwiGrAYvpegiaPHyQvCaO/UGp6s7Z9p4Ubu2eQdlJaWn30jsCYph7X+G3vPBenNnxWDWgkU1rwahOZ7LrIp1qMRwpCZiJedQRGQvOhx/2Z87D7uFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNQn+dZLcOgfocjxGmnJ67xSRufVBylGjUvEZCt2a1E=;
 b=MVnvh5Y6s7CrNfXG0YIGF+EE8HLNiU1dQxzYZE2bWxYokHeplFXbCJOPhcZ6QDeKIVb95ycKl5ly/+qy+BpQBUeuqWMQ5CJFvn/b80UZCDrq0/5UUZiFXo7VbVuXLShorLWyFgmdmL7mrcYLLl0A+8XTsA9HG80RAjt4vilV04fdreG/gcs3KFw7iOSq0KwwtOLcMVxq40CI/OjHI7T3uu/PW/qgHVZewE+t1AHqYoAmUCCJ77eFc3hqFdy0R7JGIrlR37itF29lxupj+Vy2sxAmY5x2n2wLxkP7T6Wzk3jIwwn15XF1u2hlyXWXMBDsp4tVwZJuKvBr5z6ZLe5mIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNQn+dZLcOgfocjxGmnJ67xSRufVBylGjUvEZCt2a1E=;
 b=IBnmZy0eMwddNv5ocE8SlvQSgACxBzMfGzcv88h0JBdh4K5doAwPUNLUNeOvWD2b1PY/n1A4D9i6IDO0bePEd91eFhhySKU2GzrOVXg2x+6vKBu/zn8Gc85m4sbrKK1N0URMMXDJ56g8FGSeLp8/6ihd/MzvZ9z20/YYZvG2PPM=
Received: from SJ0PR03CA0229.namprd03.prod.outlook.com (2603:10b6:a03:39f::24)
 by CH2PR12MB4165.namprd12.prod.outlook.com (2603:10b6:610:a4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 01:15:37 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::65) by SJ0PR03CA0229.outlook.office365.com
 (2603:10b6:a03:39f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:15:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:15:36 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:15:32 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 15/43] drm/vkms: Add kunit tests for linear and sRGB LUTs
Date: Tue, 29 Apr 2025 19:10:45 -0600
Message-ID: <20250430011115.223996-16-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|CH2PR12MB4165:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce644ae-3707-44d6-336c-08dd8784834a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MA+72KGv+P3XgpT56Em586HakT9ZH010+PY9hTyRgOD4Nw3XjrhS5Ay7ub6g?=
 =?us-ascii?Q?DF0IAfrLc0bStt9sx5Op3VEmJzhxJku/CrIdyn3bhTV/gfMFsB65fBkG2ubI?=
 =?us-ascii?Q?WllylkUW9u7iSHmdjoHVtIQIgRDzFJTQ7uC0IeMp+uX1npNRFo/Yf7adFsgK?=
 =?us-ascii?Q?WlAeORZlMz5MRUqBNhcytcIFyUSr3rVgGGRUO15jUpuIppJcmsrGLtcW09W+?=
 =?us-ascii?Q?lR5UjvBp1LiMn+I1jcmtABkUNaCXm4lHqlJfuGOihMwXxOm7Arw+KEkuNNCT?=
 =?us-ascii?Q?Emog+UXG6A21zJxF6EJ4v9H8TkEwQB/S2RhydF7GCS+c92Y3x0hx+dIohMIy?=
 =?us-ascii?Q?2mW0Gz9DTitScoIBa7f1ed3LBwpv3Hf6Js1W6c1RW4wvDedtKUhLKtXWdklM?=
 =?us-ascii?Q?mPxXNS6WNx71y3zvrm8T/6Rc2ZfAh/IY7i5rQGtzeByvdvX6E0nBnyzV3cf1?=
 =?us-ascii?Q?4xld3PFr7PSufZfk+68qkJNcoVTvmhrzhVvFd5L+G5zDUGhTonkQtWYXHrVH?=
 =?us-ascii?Q?BfdxINqOhi5F24zX4qhc7QXc85l5oq9D8OIBdJvsQp7wm0MBpOmYDun85K0a?=
 =?us-ascii?Q?/JBbvQZMNO6zkiuJse+hJWAi6MOUItYn3y9S2Y3bJxmPflrHp7fdf0gGRlnI?=
 =?us-ascii?Q?u57dgqIFxP72j5FUOS5BTkMvgiGZPj6sxt2PVXi+YytosVbqqrQwsKSJSjSs?=
 =?us-ascii?Q?hU88kBi+np01yjb9C2ugwMGkgbiO/R62iCv6AutXOOakdzvpLjp32YBMzJtY?=
 =?us-ascii?Q?M613mFvzk1msuHhLY5TVKMCDxVEai6TPCMbRA33nz8rBdUo5tmFnSYZ2NlbX?=
 =?us-ascii?Q?4Tg3hdoAZJlVe/3PFYJGHQ2ykGMugcVnaSO2zqHTs0HkV3pzv8sA2r2YerUi?=
 =?us-ascii?Q?Ix6F9ZYecPGEa8jswOXrelBsKs1fApikAKqQqr+UJSobGIPziFW0arFsbpNM?=
 =?us-ascii?Q?fgx6yU1ekpcOQh4EWn3exQEG+Sg+v8Try4fPZEck3G1k7+nEvENQxsnAIhBj?=
 =?us-ascii?Q?h0EQApO4bkh1kpw2lu3i7x7vom6rcwzydEmqtMQNDaqenO+1EInJB1T6D/9d?=
 =?us-ascii?Q?Xf5odRzcEWCObQPzGvWkNNY4HDZulQJm+UQq0+YfpTccUskFt8JkJuqmre9j?=
 =?us-ascii?Q?UF1EOpy7QH7D6O+rYF7XrOP4vq6awIDPTNwEKChz1rIf9OjtYR3kgogJPZl2?=
 =?us-ascii?Q?gUyyTPwRFdJu4qFEjp++cF505FCcl+m6+SJa7GF0WDXA1nNPgSPxucHLf/8n?=
 =?us-ascii?Q?AFYJGEppY/7WgGn4DQ6Mg8omL9IcUXtlUfjmAt6Vksc1301+Y4K5LURCNlsz?=
 =?us-ascii?Q?9Cxp+Lx24FCUP0u15AY6NGu3wak7NwOwuGUtneltoHIqjuti7hiqnykqyi5V?=
 =?us-ascii?Q?oz8YkkYIBBDokDQbxLiK3M2Dlm/Rw2U9vcu4ZWQJ0lPHdIofeXgRwUFzRYSD?=
 =?us-ascii?Q?kU7vEfHG7ZQe7wgMZlD7nJWd8OiyEOs4WLwVfkC/ype00O9N7lsujgHnrqwg?=
 =?us-ascii?Q?0QtbLs1xACi73c6YE32Ff9X2lFpGJDlhcTgS?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:15:36.3797 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce644ae-3707-44d6-336c-08dd8784834a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4165
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

