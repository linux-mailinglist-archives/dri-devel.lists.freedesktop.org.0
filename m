Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2CF957605
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC7B10E3BC;
	Mon, 19 Aug 2024 20:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="d3j3mJma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB03A10E3A1;
 Mon, 19 Aug 2024 20:57:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbipISeGi6JOzISr+x5o0pTN2tG8zT8eFEAqYALhNWD02AoGfiljh6ZdPVzRf/VuQeAfAbtwbivjXOnJA+/IngHtY29B9ThNWIs2fk2cWgDzzrYmjWz+cB6ObxA4RvwqPOGCwLtNU02x18vHIjwa3mBWtERgW5rqm7j2PVtp6xx5rrajN6nIceYrKG3JcKDePZCtUuyJ4eD947cDeRtSlSAVJ6ONn+9gJ3YwqCImD5InSX1632v0on2GWpL9jmHO+u0WVG6HdNunm/oTAKy3h9x10BoiHcOjwkvbwLSsnVdKwTTFlv9ET6tcFtsJ2XRN482zwZmYa+FfRcXxvU4yDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuO2cyLqcg63uCOuFOspH6O0yYWsNIK/w4D3JF5ODho=;
 b=F1+01XdssCtxnVvad0Ybd94CiUx3YjxUUGk2wl1Cn2/e+/Fcv4vV/m1OoIpwraSkSw+uZRnyXp/20DaFtA7y0gxTnQs/dhZ3NXc9SlnOW/LSkLc2UO9UBblAbWNL0TAyOFP6fFQONXkBPiOOwe+R4+wpSgy8tp1tvELTPIm8Ch+U9fJN93+rYv0KQtGffR4O4fkys3UTNiSoSKqEsvzH07e48U6nAyxl9A+55ANtdpb0ALadwS+zkrC7FJBSjHMtDVxoEXL/wOtX0mnQxCQW5Plqs8aL9z2lWeCf9zinn4FhsuCP/j1xiuFpZDjQ4IOMhQauhgMMJxf5cGshbz88Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuO2cyLqcg63uCOuFOspH6O0yYWsNIK/w4D3JF5ODho=;
 b=d3j3mJmaMZ/C9SGt7zF3/EgUR4lObTexTAEg0aRVZzTcQHIm1/rh1M5Pv1Z3cQbdmDqDAwYPMyNtMz8yqYzMOmuCdPLHmLCvnshprF1a5n3HrcqySGdAAOrOuvLq8hm+1QjUqTcvcqlfylVyF/6Z0gdpR+NeSln5LijW/f5zCV0=
Received: from MN2PR17CA0036.namprd17.prod.outlook.com (2603:10b6:208:15e::49)
 by BL1PR12MB5826.namprd12.prod.outlook.com (2603:10b6:208:395::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 20:57:32 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::61) by MN2PR17CA0036.outlook.office365.com
 (2603:10b6:208:15e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:28 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:27 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 15/44] drm/vkms: Add kunit tests for linear and sRGB LUTs
Date: Mon, 19 Aug 2024 16:56:42 -0400
Message-ID: <20240819205714.316380-16-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|BL1PR12MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd09595-5c71-43a3-039f-08dcc0918b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oXxsPSrHUagvbrpJR15ufOyUhy7fDVy24IuMT92wMLPaAKuprF7bjkrYqKEl?=
 =?us-ascii?Q?c8YOZ3oJUK2TJGiUFisJCJZi03lzSvch19r3D00aTCS4SmFSSN6Uy1uS4zcg?=
 =?us-ascii?Q?cFGpBPbT3CWRijbqRKvUbLiUDJRxTi/i6n0cx+97yCFSBgHInvl0iXiVMh8x?=
 =?us-ascii?Q?X53sIakw0VXBUx6EiZ6Cw6TkkEaXzif8K0bKl4iu7EyYNZh0NZ6sAL4M3hJQ?=
 =?us-ascii?Q?dhczQghy/tizj1zjTRQm8MRd4l2qt3VQM9y31gY7YOSSPasTIfOJhvtwGj70?=
 =?us-ascii?Q?GfdNTK8VNBLcKyUdSx1Sb5yeDaFcI4ujg6Js4E4lx2SvB3yjA+vivdMRj4+U?=
 =?us-ascii?Q?J0/gK6TOX/D6yei0MqaN4EcuF2MWRKpeiI/FPYzsklJxnP6v2RcUtDVjYxvw?=
 =?us-ascii?Q?E3WsPu2TQOIxV4CyeyQFQbk7y7yNKParwzoQRid1wZEHp8XkrgmW3Fc2gF63?=
 =?us-ascii?Q?iGuxgJ9J95YkyIeLzBXO2d5BJeb+p5uN4RnhRH/WHRD2wNDqYh4KdR93oirb?=
 =?us-ascii?Q?GsK327MLrdppzacjSAxHvony7TbGxsyzlOWu4dBmwdUyWHH8sWoDFaYxlizO?=
 =?us-ascii?Q?fKauCDSNn5lGYF402qKELAB/gIMFyL1IqgDGU79tEcooK5y2CYwf0UEsM66J?=
 =?us-ascii?Q?x8g5G/VnK/buD8tKzA/EVWDCwYCJN+7LAtzE90tN0CfsM2FKgQCXQ+NtYSwJ?=
 =?us-ascii?Q?hcV0oMkEv1P/bdKMC0rYgk5akK7nUbmKdf64r7gP20SX3jI8Mnjs/FFa0M6C?=
 =?us-ascii?Q?mf7uYRJvoCIg93SjqrZomln1lAPF67ZBzqg2SNQPtfuM3n5BNNNIRb18I8kF?=
 =?us-ascii?Q?Abf9OIU6r9LCZyfx1nv+mQWoaU7ScXmUaPmKB6/mNtMisVLvLYozWFoCcoFP?=
 =?us-ascii?Q?aD/D+8YfgwdhNAodRum6mrPXEq6tfOcq6Qhk2QHlRVLQ9a9P2bE363zVeLBu?=
 =?us-ascii?Q?ID4U44bScVP30SON66kTAAYm4yFLp/sJiTruN6CLUv2OQzkiKMAQROr7xovu?=
 =?us-ascii?Q?SOyAshJSiGCwrSkignpgQQQhJT107DOY0SkmJHTUqwzk7qE0U3bcT1C3QVhH?=
 =?us-ascii?Q?w7lTOsgO8e+osxTdV+ZkvXASP1GiJoPT0PNPh+PlrBJKXkfceBkRhH9GZ91g?=
 =?us-ascii?Q?HkwLoSrCgZj2uMU8vqct5o8Fd4XmZeMvqXkUwCUYhdv5/2QRX7tO01Rg4w0E?=
 =?us-ascii?Q?c3DDLHiEHWYJ0O/k/EELTmyNxOsxlwTffM7vCTnG67Tw8A5nA4VCn64xxrbU?=
 =?us-ascii?Q?tJKubQwz9ILln3uXj4GV7nEpODItwUmE8FHQkgI3P9HmLsqJILFYPs/YTebR?=
 =?us-ascii?Q?YGl+1TXKvp3cwZS2+zYSvTge+8JQ61EfflzbLve+qOJ9TMDG2Rg4+MgmUTnT?=
 =?us-ascii?Q?eSh8T0uYsYLE3U5CBKRx1BNW4CyBYVlyLVjtq5y2LKkzJfvEKuNt9JB8w1W9?=
 =?us-ascii?Q?LIeM+j5rlQ+i9Ens3FSP8DCSYTt3II2a?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:32.3077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd09595-5c71-43a3-039f-08dcc0918b8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5826
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
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 37 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
index fc73e48aa57c..e6ac01dee830 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
@@ -31,7 +31,6 @@ const struct vkms_color_lut test_linear_lut = {
 	.channel_value2index_ratio = 0xf000fll
 };
 
-
 static void vkms_color_test_get_lut_index(struct kunit *test)
 {
 	int i;
@@ -40,6 +39,19 @@ static void vkms_color_test_get_lut_index(struct kunit *test)
 
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
@@ -148,9 +160,32 @@ static void vkms_color_test_lerp(struct kunit *test)
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
 
-- 
2.46.0

