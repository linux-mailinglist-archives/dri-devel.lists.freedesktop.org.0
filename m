Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9510EA72761
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95A810E7D5;
	Wed, 26 Mar 2025 23:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OPhvdhnH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D43110E7D2;
 Wed, 26 Mar 2025 23:51:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcvrsYfwQvsGWrSmQaXRhpft/7Pas57hIvxe6XxnH6z6lq+CDeeasFVM/yg31iTIc9Cw48z+8BGoaNvKnAI0pVIq6q6sKcERkk9kjxATLencte9vZcEm/ouOgYLE8PcDQ7GGkW9OaQn/2GnqirBW39HH9Q3AHl3CWuIc5nJhTCtLpqmKLZNgbA85+Eu+332Ul2cLbBzaz9iN3bNGuL/ceOKEgp78KOorR1VU4j7AKSoPtRLGe/60p2CkN1QIg8gA6+MzWhsAYjNwfbkKli73KafIQ8mUX1Cap4hJcDCIkx0hoP5rJC86jcmv0iJV94IPZLY5FXehN6e/jNAUUGUpAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRKaltlXLylZUIpF4mjdJ1kNKwCMSjByyKK0ECBNvz0=;
 b=YQntWYNye+vdaHw1J61tWo1b5GIeGsr2TCGwJiWjjVUfnNs/J3W7KtulpFJ87d/QpkbWan1lG4I/y7kmA9vZPj4HNohtjANOsm04hG8SstIBek1xIivZ/wwA7/9O+Acl9djH75o5MAs+GlKxJ7ZFBX0oSiXgOOEOGQTd1VcCHUKUsxOxsyF9fKFeyc4V1farPX7+Ojy/aNCF8z0QmHvpwluL65u0qa53ho+tjZHn5CjaJiLnOqbauRzyjzmlyfRsQS9/6r08+BFm8cljziMgN/I2VJrkTWyrmkPKKR/TMigFDpNPkEgZDXULXrZ5nx2tNU+F3SFRUVUH7Zn1MrjrvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRKaltlXLylZUIpF4mjdJ1kNKwCMSjByyKK0ECBNvz0=;
 b=OPhvdhnHiOUGDTCrLhJjujKtWQ/D/j+ymTKskmYkaibPylm1v70nUzOH2tmqQGQhOhiaG0rNN/6kDUv1MkZxLAR5EpweypBHN+4NSXqwvZOlaatPLfPNuZ7uktp0LBqSe6emr/xVwOVPG6xIu32C7Gd18iwyxegCXhDmehYkN0c=
Received: from BN9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::20)
 by MW4PR12MB7239.namprd12.prod.outlook.com (2603:10b6:303:228::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:51:53 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:408:10b:cafe::db) by BN9P223CA0015.outlook.office365.com
 (2603:10b6:408:10b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:51:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:51:53 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:51:49 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 14/43] drm/vkms: Add kunit tests for linear and sRGB LUTs
Date: Wed, 26 Mar 2025 17:46:55 -0600
Message-ID: <20250326234748.2982010-15-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|MW4PR12MB7239:EE_
X-MS-Office365-Filtering-Correlation-Id: 84590c9e-4ddf-4b61-aacf-08dd6cc12f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LIkmqM9ihcoKhf5lURcGeSyZLaYpAUGEtQpa1CVWGHg+P+G+ltk48gruYHMB?=
 =?us-ascii?Q?j3ebRxGwrt1Om+2IIJqbOpFBedJdDKbJuY5V5y8IC5+xTHjTmDSZvRjtgmAB?=
 =?us-ascii?Q?ti2Z2H1jnLOdyyi9s7coZrKYY/llW7HcoJYjanlNuM5p3yc1Tuz505xMEDU0?=
 =?us-ascii?Q?N+n1cnI/oVzWQaErOyVu3Xf0vYycAGXwdcc7nbJ+TQYd5dEu/S1VAJawL19Y?=
 =?us-ascii?Q?3zZClgKz3fgKeWi4aBmDay/SIRPPdVbqYBbTSydJGTBfzWw3qavHa3ebKtzc?=
 =?us-ascii?Q?ytHtAhox+3c6vNkzA2oM+Ss8NPW2qoZ2k8C3fYzzrDr2jNOVy1cDjf3RnPXJ?=
 =?us-ascii?Q?vUPCh0cNUcsNa0ISY63OIk5yzL/5pwDOuDHo9p9Vzx4X5PzjRcQ+wsaAtbJn?=
 =?us-ascii?Q?fGgGN5zqo/9s/WMysUvBzWEdTVu8OmzYMS3iVUPg73o9NYMHvfSaaJ+Xiz7x?=
 =?us-ascii?Q?V9HTb5BhlmTmfUm/4N9EzNJxfaumJo4W9HRMZVJMIHIzhv5qm3LgVjC1ZQAQ?=
 =?us-ascii?Q?9ZOD7Au6I70ERVdYLzc4EYhG8UKHhxBu6+0cV6LZsFF6IEHzvCJgUsxuLvv3?=
 =?us-ascii?Q?sHQmMTEAY400pQlsC4jMGLeSFvFq6lzpBRQirPKqD5Ps4BuwXH0IV9/tjwDx?=
 =?us-ascii?Q?RjKF7bwGZnU2NennwIQnFF2Wn8PhyKwOq5IWjm9m8BscXuoFy7aQFAeGZLqw?=
 =?us-ascii?Q?qDVMzkpQUYWjk18+4wYFGHn5bL+/I3uIUN1Gjy4TGw1ZGgbhv4e+j9vI3JAH?=
 =?us-ascii?Q?DZ0wGWCfRVAYO/MS1lRoRDRKK5qDjiEEiqg3bP7pCopcQomLnMYqqC6vNsri?=
 =?us-ascii?Q?NgebVEUOtumMxdfqbQk7wRv6SnxoUOjEU4Lkufvwx/G5nQWB5oYiJrFLJQ8T?=
 =?us-ascii?Q?5ljUKZKufPPdq00aPuOeXd7v6IGB+/IhauQgIahtxEbBz2v/73aEeLMCRgdG?=
 =?us-ascii?Q?0bunMda3sD3pBfAZC4j/IGWlzFH9TDYsj528cqKhnDIrnn4uXmO8cNYStnDt?=
 =?us-ascii?Q?Rpuo7hCKenuNhiLx04KkkXkijPuNssKFIJQ9rMuianZZDmuunxrVvF1uNRTc?=
 =?us-ascii?Q?IdNXDZvGbjG9y4PR02bhoq71vW8/z0nZbeKWJ6PAXTUkyUKunShE3cuE93Et?=
 =?us-ascii?Q?UuZXh4a71xn9iVTNp5ogFE22X+7Cmc/Hm8SNank5NE+JX9IgbO5oFGqJw+rD?=
 =?us-ascii?Q?0LvseD7usRcM6TW/837TBPqfG9eLXQwvOMXEpYn3FSAruHjQytMMJ1l4K5RQ?=
 =?us-ascii?Q?9b/6GVjHk4Z5fBIYQlCpKEBXSInK0pPlsLJAxrRkf6XX9POilVwCx3DmXFBu?=
 =?us-ascii?Q?EpXNJ1BB5P75paus8j6FlULl5m+UUJ+l8J1lK7zcx8pqluVI7Kn8co2DIm6S?=
 =?us-ascii?Q?2nQwuWaph0Klhlt5YSav2SZGCNtkG0IlsG+LGe/7Y+1SL3dkOCpr9T16rt5r?=
 =?us-ascii?Q?X3rE3kwpd7ZaA5JdPUPPDoCDRsnfs5bpbnuN7+czHODM79sJWzEQUB7zOSNy?=
 =?us-ascii?Q?XiOqhxn3HGsMBC1nifEKd24DL4eCNPqFi/rx?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:51:53.0905 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84590c9e-4ddf-4b61-aacf-08dd6cc12f1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7239
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

