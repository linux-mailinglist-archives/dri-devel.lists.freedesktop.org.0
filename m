Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D429F8B62
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0966610EE8E;
	Fri, 20 Dec 2024 04:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cQI5ujrI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A2910EE8A;
 Fri, 20 Dec 2024 04:39:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFpJ1d80dVZBgJhyMHAEJ6oJiEPMp384GrJyjL9rLxNkVaBWzxGvUHtDKqAfbE+yuNQiVkAt8HVoVowGTTXvlBeXR3HqOhhqnX0r9C43xyd7UfjZuJ4sadBFGxzFndRJTNtdBEClshkrsXev2OIEkDb+o/Ma9O3AeRdk8pQK78lNFa5qglM8Z3Koq+KFzmWVbB5Y9USXRuP+tea1Y5ce9rFFv5B0MHtASTPCJoBIQpFJNy3AdlfHwwE8YbfS0IR3+geGjMimujtM37ZND4zvbYioccy1rwy1c1cRlx5tauBImgwJx0WGHcMYjE99D8srlAxHxTDYJM3ghfxPlPQ8DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfLJfG7e1juPOAlHiOW0eTf2/dDqJEEBPec3eUlHgAE=;
 b=F6rCK+FBDBQCX9Ck8VeWszf9wxL6KMMgZll8TN9GeUT6pOjTNtxSMnqEbsTP+vbMO1ztw7gsyOeABYfMJAjeTix3hpOLDnsH7iwvFePP0ZzSU7SbpzJqmq3fmqj/rhpdS3I2crenRYSe07m54pe41SqxBdzC9G5zqIeeLCaq0kAj5Vtt7pFvbmGTFT/IsRDVNYd9SZhmiDtLyowQFZmqe2rFqshgljk3pWjHJ7VGqt6lZL3AvVCLpm6ef3mW5Zl7td2oWjsnKEXwiVpC9mIY6ab7uzaT7lYB2O19gRdWJeCbvKKCKzMZC9uBP17oR0M5FczOkD35xcFAsBZxc5UdZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfLJfG7e1juPOAlHiOW0eTf2/dDqJEEBPec3eUlHgAE=;
 b=cQI5ujrIxXc0paAOVkhFCYrJbXtrWeila6F6CQqvLfK2cpNWlkN59u4lKubwLNLc96XyXKntaUYSgo2n8vBDn7ll+fECkDhLQOCjrS5R/DPJyoVubGS82209/aCj7NkhHPpbfAXCkn6kUCrubMyu0rLQvyP364wTTIektMYPdeo=
Received: from SN6PR08CA0014.namprd08.prod.outlook.com (2603:10b6:805:66::27)
 by IA0PR12MB8930.namprd12.prod.outlook.com (2603:10b6:208:481::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 04:39:15 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:805:66:cafe::58) by SN6PR08CA0014.outlook.office365.com
 (2603:10b6:805:66::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Fri,
 20 Dec 2024 04:39:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:39:14 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:39:13 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [V7 15/45] drm/vkms: Add kunit tests for linear and sRGB LUTs
Date: Thu, 19 Dec 2024 21:33:21 -0700
Message-ID: <20241220043410.416867-16-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|IA0PR12MB8930:EE_
X-MS-Office365-Filtering-Correlation-Id: dce7ddcd-a9e6-4cab-4091-08dd20b041e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tuPervfxnjm8HwuJTHEQOij0BsY3w/JSivdew7guzBmNK9S+4kxAeguJQzwH?=
 =?us-ascii?Q?TdPnAoLOQMVsrmNKw4EmEl+wr9zTjhVIVpRcKbYB2ZJzgy/BH1wl46GwbI1f?=
 =?us-ascii?Q?bU/biwaCCU8Cv0/gPuMSQgEckfnau4HfHJdlfqIgBGmoJAm8g0IIMIutKaTs?=
 =?us-ascii?Q?f/3N3CEYQLCvkVD2JJLeommln5sfKmqAi0sUnd/bfVusJsdYg7LJC0OzjAsJ?=
 =?us-ascii?Q?Qvi1LehMeJ4eXORsTD5r/on9dJGAQnh5XnYTERjH0mxqWQs+ZfZxOCoijmGE?=
 =?us-ascii?Q?f/cTaE5iTk5gC7xbvLAuwwX9p9YAmCxe/32kh1Dk6umYoRDUaGaZWm6s7g4z?=
 =?us-ascii?Q?+so8zwWimE3hIkO9hqmBss1FG2nrX6DA9N5Hw31iozALDiIxUihyLMcly9sV?=
 =?us-ascii?Q?unOGGYgQHJcydEr9a5Dp5cZvlWDcbxUDRh5B3F3hKDx9DOtDpS0vqrj+NQm1?=
 =?us-ascii?Q?SRpskbsVUb5d57vpKZgRsa2N6BsHDuKmQUPzKUxvosBo5HclMxARWjhZmDg9?=
 =?us-ascii?Q?3Ut26HTZUJMjAi1Qe+T7r5+l+Un+ViBQb2ZRLL4YHXQ82CrP/Z3v5eqYlvL5?=
 =?us-ascii?Q?KspsouI4MAEaA7ACcgsRmwSrCsMRdCzn8e5Oa6fr+UhZaWep5Bkj5Eq3Hol4?=
 =?us-ascii?Q?xZw86i6bI30dJfuMxIq42RANrUnNkygsiX+5XRlB3ntC4svFQ378PU1F/7Ls?=
 =?us-ascii?Q?x119/r1FIOL15ArQm8WRI+bmUJB7Lpa44ayrZ9JsxRE8U4/l30iI06Oiko+9?=
 =?us-ascii?Q?ELkos8npoKtGAoyN+mRXTq4yEbec+cZWRvOGI2g83oTKn4SxsuiICXIW06h9?=
 =?us-ascii?Q?NCVBZjFe0Ie103szD1NW68jQiCo3AcJ7gWtWbp6uUV4OFA4BhPErk6c0ECFZ?=
 =?us-ascii?Q?g1LZm8fu74N5Uq7k3SJwftBqd3jWd9HRfxKy3BZiTIOmkUvZSVd/YqrIZCcf?=
 =?us-ascii?Q?WO4mOKcBIMK3shjGnGPE2mtOSCwPF6LwmUwfIxa84ardC9GxHppDZE8DE3/Y?=
 =?us-ascii?Q?JFfkN7uudVE/I65leXjt67bXMuDCID1IWQU5t/SJPs5uLD46I1SJSKBFBjzX?=
 =?us-ascii?Q?lpI1HfSdERuXXM2KdaIIfQlWsVS418zTBzP9jgYr2B6ZR2VRo/6+dpZUQZ9s?=
 =?us-ascii?Q?hE9rU+zv2hLQBRu3Co/wHQOb07dmyMLRaE6jQyr2cmiBFwB29EBNxKv8cbWX?=
 =?us-ascii?Q?jkX0Lg94YVfPJ53ajvaISzt2lc64B9ieVz6OHR8UjJznJsS3wS4uol4O+bz6?=
 =?us-ascii?Q?1JYehDUboBez27EXWrm+hK3SUD+plBBNOB4L8RkqelUuVOMAdW+FtRrOzlW/?=
 =?us-ascii?Q?nJ/R9iZbg8+wCVz+RIxJCR0fvrcUN0Gb5dDBUH8Do4aWHI8Fviu82gxf7vBS?=
 =?us-ascii?Q?vGndbLF4GZCxCHAaN958zGtuFJuTrtY3m7uZpHmhqth+vDjqothOYe5S2Dv0?=
 =?us-ascii?Q?mafFyC0URXLmDP4yH6LzsK48hGuVKoUkIJFghoVvbeMZrX/+MPsLfQOTj5XP?=
 =?us-ascii?Q?dAoPvfKdnJFvyBU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:39:14.7638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dce7ddcd-a9e6-4cab-4091-08dd20b041e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8930
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
index b53beaac2703..d765c5eb5d88 100644
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
index 983654540ee5..ee3cfe153d8f 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -113,19 +113,8 @@ VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel
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
@@ -150,6 +139,8 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
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

