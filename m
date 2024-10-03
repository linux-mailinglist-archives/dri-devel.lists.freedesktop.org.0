Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C0498F7AF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625EF10E95C;
	Thu,  3 Oct 2024 20:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X/gaTdrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541C410E90F;
 Thu,  3 Oct 2024 20:01:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSsRSLCPaYE42H2qo4zySNS9MIvWUxghbs4oR6WPNdp0BEbp5ZHoOfgtKkJFDC1gHndkdTYxZVkCnNSO3f6UTuk1MeLgvkErGtgqtyClo7uFU8o9cIrPW/OipPhR5WFcngSkUjkfME5ziNZLvyKOZBpaiJmcSWBjCf3YCXwLR6HbIgkftE/4F4PcHVlMEzpQkPNTILv9sFasNq1W8PDjJNzEOEC+IJhCU8nPFXZgXPVSWGwcAOft4chM2PCDIdwQrOhTbfxTmck7ZyyRUUu1shZWTkJKrPja5zFEgVPxTiC1LYoSBdAi5yPnu+TUtf2T/7HPp2j25QFJlWA8CM4bug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulwO6BuqA7uaquG9sNAY2j3dUQlN10GCkgkxIwjFSlc=;
 b=fCtaWec/yBOTNEETSC2t+7Ve5PXNDerb/umcjT0XHsBKH/MoY0thVXURr6XnbMmtDdRne4Cz5qx1tw0/4rO7R0aJoSLHh9L3Bb1+LxbVaBO19/nMP+8RulGd7B8Cnm8NPz5gUz6+GOCEH8PgKCS+s2MKvX3UfpETE5Mily7EzW7uLU2MT0SZyh2kHYWzYWrdk33BlD21NcJKbuo19QHeCLPpvZRx8kp2CoQ25FJCH8D0APhaYle/jNJi2R7LKnG3PZdnrNYapZZP8buLDl/t/2HT6cO3Xs2G4R/mCkKqMnld0tbvLd1Yc/EvsIjdh84AR4+Zd/MHwiIzbM4N/u99Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulwO6BuqA7uaquG9sNAY2j3dUQlN10GCkgkxIwjFSlc=;
 b=X/gaTdrP3XNFjF/yF6l60q0Jkb/E94noqzGduUy06q0MY88sot2yGTL2Q/hyM5VR/geJ0WzK9WbYdcIPnR0vghGE6wSgu5ZyjUN48UMz2SPcabefrHBviyAjgShHeMK4aqgy37trr4OncnpkqPaFEntBtDXolqwM3xPKAFtAltE=
Received: from CH0PR03CA0243.namprd03.prod.outlook.com (2603:10b6:610:e5::8)
 by DS0PR12MB7559.namprd12.prod.outlook.com (2603:10b6:8:134::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:46 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::5) by CH0PR03CA0243.outlook.office365.com
 (2603:10b6:610:e5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:41 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:41 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 15/44] drm/vkms: Add kunit tests for linear and sRGB LUTs
Date: Thu, 3 Oct 2024 16:00:57 -0400
Message-ID: <20241003200129.1732122-16-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|DS0PR12MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: f97ecc63-ee2d-4998-3fbe-08dce3e635b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CSE+B6COor4u8EPXYmFoySVlkouVM1wxDftklq38eyruvbFAuFcSyCziEJXK?=
 =?us-ascii?Q?NKNvGo9nFjHC1CEsjsr/k8RUl9wygHe0DCbkBqPaJEDg138aVxbhd2eVfXc1?=
 =?us-ascii?Q?ayx7Rt27wgVJTKHhskIM7DmfQRKROFNYEBQL0BqW56tTFY1svvSAUqV57+AL?=
 =?us-ascii?Q?Dj3QcSt8zH82B2OHA8ZoHYh+ungWPNtSxKigbNlyIPfkPfcGhwtNXdhBrzxj?=
 =?us-ascii?Q?auCFFJz5aMEU2Uf3E1ydRwDkUInEkhU9CFdNgFxzXs5RCfI1DF2BuOvQwLzU?=
 =?us-ascii?Q?DF75PLneQ/lGTh9JgcwHAfeX9GnDHAHoXyQoPW9HJcdpkKI9xN9AYJYknT6r?=
 =?us-ascii?Q?NvDPrSV/Gw7FcH8fEFbbu9Mjtl6a5cVDP7gwRp32TkITkaQaLjVThBZya0h6?=
 =?us-ascii?Q?rs2VrmfTEqx/fpHMrBH1x5UH9E4GW0LsgEjnU/wH8IXeuRneeGB1gRCu/Te2?=
 =?us-ascii?Q?dCgLNKhk0tdvwa/3QEnGMMpImYhTini+p6vlZmyQbyUXux9OmET5axUwFFdW?=
 =?us-ascii?Q?NeK18pw8QPo/dU6SZq1e2DhYiRBsV5dCKCAZrk0jXbYCVsJeh39CSLmFGNo7?=
 =?us-ascii?Q?7tBUCI4fQfg9ZmaNmf51kSAfF6NPJzXvgoJRuhLnWHzrzXpRIBHu7axAWgtZ?=
 =?us-ascii?Q?KBqepUkeVFBivfmLaVH2c2cJQyTAWJZea5G376dW6/4UYbc1ocKw8juemHZH?=
 =?us-ascii?Q?l11QtwWFTJFHhnaBhyMKJoACDA2HD4F2i+CGkC2mbUSTAd7SU/XWre1wGZ8O?=
 =?us-ascii?Q?7h+WCmDnH08PifWC2u76aQJMhsXxzhzgeqpeoIgVpqc3cgupr8uIUGs+TL1l?=
 =?us-ascii?Q?GTgPYKdcWqLoVOI3WEhcfDkcN2/ROmGBzWMo8bY9x0DhLPPOI2P+IECDVFXQ?=
 =?us-ascii?Q?S4MdSLXe2jXdC6dwWsSM2ED+DIVakvqtPEsZRWsDKzDOXeCMsasSwnHjHFPE?=
 =?us-ascii?Q?WVDWxmHdkIntGgSWqCh3SWLHvVVxLJu0BXXm6IFBYJp5XWyvWPvoODC8EYe0?=
 =?us-ascii?Q?jvpep2cNcpJN66Rqxz9gHf5CdIb9qAlyxYZ4s7YF7RXxubjNiYxmqJSDg/d7?=
 =?us-ascii?Q?KD+xVw9vdod5oi8Q9k9L8v6Jwey37Ykkijv3zZopUC81KtY3VjQ2KMtL0VxF?=
 =?us-ascii?Q?1yiz0MwhKmPXMxGyt0D3rdEs9+lgd1o9ak7k5CqWd2UDq7iyqbncPMrCqJWs?=
 =?us-ascii?Q?eAoV0hzRPY+ElQ/4gV6QMdeFCREnIWufcdSLmmIGkmnShFpsVjD6vuyAV2sO?=
 =?us-ascii?Q?l/P73w7ieLuJYG5VZjpToh4g5mMXuNpJKCi/iRp2Fqggnk3BKIon9UFkUBkz?=
 =?us-ascii?Q?jyTmUDfT4DF/S9hwf5dUwjqDK2fBP1vpbEnr2zc7vkHxjEqQUEq3hMd/Dgh6?=
 =?us-ascii?Q?cTJ7wl832aXlFBBLD4H1sfh4DYo0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:46.1677 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f97ecc63-ee2d-4998-3fbe-08dce3e635b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7559
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 38 +++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_composer.c         | 15 ++------
 drivers/gpu/drm/vkms/vkms_composer.h         | 13 +++++++
 3 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
index efe139978860..c36e67c7909e 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -6,6 +6,7 @@
 #include <drm/drm_mode.h>
 #include "../vkms_drv.h"
 #include "../vkms_composer.h"
+#include "../vkms_luts.h"
 
 #define TEST_LUT_SIZE 16
 
@@ -36,7 +37,6 @@ const struct vkms_color_lut test_linear_lut = {
 	.channel_value2index_ratio = 0xf000fll
 };
 
-
 static void vkms_color_test_get_lut_index(struct kunit *test)
 {
 	int i;
@@ -45,6 +45,19 @@ static void vkms_color_test_get_lut_index(struct kunit *test)
 
 	for (i = 0; i < TEST_LUT_SIZE; i++)
 		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&test_linear_lut, test_linear_array[i].red)), i);
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
@@ -153,9 +166,32 @@ static void vkms_color_test_lerp(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000), 0x1);
 }
 
+static void vkms_color_test_linear(struct kunit *test)
+{
+	for (int i = 0; i < LUT_SIZE; i++) {
+		int linear = apply_lut_to_channel_value(&linear_eotf, i * 0x101, LUT_RED);
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
+		KUNIT_EXPECT_GE(test, final / 0x101, i-1);
+		KUNIT_EXPECT_LE(test, final / 0x101, i+1);
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
index a35466e68237..b4aaad2bf45f 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -113,18 +113,7 @@ VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel
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
+VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
 				      enum lut_channel channel)
 {
 	s64 lut_index = get_lut_index(lut, channel_value);
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
2.46.2

