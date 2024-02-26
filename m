Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CE5868298
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E66910F243;
	Mon, 26 Feb 2024 21:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LnNyjAeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFB210F19E;
 Mon, 26 Feb 2024 21:11:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3GQeA/5jIRWhUgOUxIudiD9PQWL+N1PEfg497L7BemxlQ9bqtzcOdru42GPeaW1rAsxl/aMlIkURjRK+QvTKQfq5/LNRrklhCy1BjJi2RDi9jVE7FqILUyhDWUpLNx9Y5hICnRckNT596zX6Xxy+2E+GUdpimliRMD9C2NOE3OoOZtXkUIh1jJq7dVz+vxK8n4V9mgintB0nwaYdEGTwgpgBk/587Pz01aKaDT400+FDgEoCWjsq+E3WdNyx+ZrG3Frob6orJ+iLPDcl8s+bv+2SJ5ZInytfcNMpl6TpTwUNvUahszl611YpYHqownKll/b8+slen+m0X0H2I+Ncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsR0SEb99sdSovHOyboxy/MPf5pSK1F/dvKhBpBICCM=;
 b=YTgG0uLrDJADxWwpSjYXF9rVLAxWp6+du8+0iKzasY77/phd8e6CgRzHn3cCqtU8FYmnJzyoLcvbP+67Bm9VK6xvqD+pYQSSAR+Scct2S4cHJKPDxm+F5RiS4d0xb9xHc6RAO98BUipIypIFXfTNE490L9AC8GaZykGts1sghE0sBDsMidJoXnv2lxlHO9V1ACIzuDsuRdCZLBtaGQbaJTyrtaFYMslh6eVpLLACkS2jXKmnc5zc+Mq49B8j1KF2+wf0XJCBHsBPkQbRAFaPbFrnJh4DyMAJdLBQxfsSPKlbPUSSmVOpSuVL0/kULUSAJykkBlMYK8A976mQYeYF8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsR0SEb99sdSovHOyboxy/MPf5pSK1F/dvKhBpBICCM=;
 b=LnNyjAeDuxGvp3pK/ML+ZPCzHVwY9YoZ2bXkJWqekFtO/iamtgPiQDs1qS/bGLh8hVdZ6iiRIPFl40mDAOqVLYnnlyHUkTPzjnf1AMWN3F5MRIqyGIB26oa3BRBBz35xf3e5rL6n4tQBaG5hL8MEgLvjtiphmM6db65JHQo9zbY=
Received: from SJ0PR13CA0069.namprd13.prod.outlook.com (2603:10b6:a03:2c4::14)
 by DM6PR12MB4450.namprd12.prod.outlook.com (2603:10b6:5:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:24 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::57) by SJ0PR13CA0069.outlook.office365.com
 (2603:10b6:a03:2c4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:21 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:21 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:20 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 25/42] drm/vkms: Add tests for CTM handling
Date: Mon, 26 Feb 2024 16:10:39 -0500
Message-ID: <20240226211100.100108-26-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|DM6PR12MB4450:EE_
X-MS-Office365-Filtering-Correlation-Id: c768a0f8-00d7-49d7-b92b-08dc370f7caa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O9gtEVBGOY/c5UzTCA6v1iWU7/+kjPyABRE6E5ilICAcvAwIdYEbCa4Tv6PVtiEABgJsCdm8KVij+m++M8RS91UHX0Qx5CKFCsOVbH9AtT/nTPg90pKvOSl7BfTIp5IXdgbtUObwi5u8VrY3+MiP1M/FJpsLjdfhT/lxa/HanPSrUwNShrKtFugA3yy+7YVrFQxpEzZ5AeZ5bld/U9gsxxV1yr46eclQJPl60mbow3dukUpxhCjgYFszdVatyZeXKnYGrePFGaYw3kxNxcdRmkx5F4sF6XVM5zgZ4Tny0cDaMnhMlAe05/+fUHWCpzTFg/R2cWIxV8Sg/5lLyNIXLfhw+881hCJVQ5I8NwJglShop5WRdtdG9DuaNlK7lPub3IJJaloSyZEQhv7y5i4/utywMS3A7KTGUkZg7CUe2ArkslBDyiOt/B06Uo1IYdVwYB/KU2agyRq3+OtTBY1ht1K/e7Ytxj+rtBvUTYUQARVDFV9SgXK8k3bAOL+LNPS2SiArDLUq4M7sTNk/OFXf/EjoPHhKqz5f+jbn3TZ6QvtGD76p+2CfmIlR+Kcf3kbUMeYFub2muiooryXXMwhNvvFwaEeQHv/KDaAWq/VWYoJat15ZlO48BufeVYxNHj1sRdNWCULU87Q97HxYTJGYgSfHoz53cgT2VANxgntMV9ePwQL05jrUMKwD6weIltTiL1HkiWlypJcGxyaMpiPbPRQwSgnp7nuBT0+oaJEDmdRn7O+AmKE3AfG+Hoeb4iJE
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:23.4743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c768a0f8-00d7-49d7-b92b-08dc370f7caa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4450
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

A whole slew of tests for CTM handling that greatly helped in
debugging the CTM code. The extent of tests might seem a bit
silly but they're fast and might someday help save someone
else's day when debugging this.

v4:
 - Comment on origin of bt709_enc matrix (Pekka)
 - Use full opaque alpha (Pekka)
 - Add additional check for Y < 0xffff (Pekka)
 - Remove unused code (Pekka)
 - Rename red, green, blue to Y, U, V where applicable

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 251 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c          |   2 +-
 2 files changed, 252 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
index e6ac01dee830..83d07f7bae37 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
@@ -3,6 +3,7 @@
 #include <kunit/test.h>
 
 #include <drm/drm_fixed.h>
+#include <drm/drm_mode.h>
 
 #define TEST_LUT_SIZE 16
 
@@ -181,11 +182,261 @@ static void vkms_color_srgb_inv_srgb(struct kunit *test)
 	}
 }
 
+#define FIXPT_HALF        (DRM_FIXED_ONE >> 1)
+#define FIXPT_QUARTER     (DRM_FIXED_ONE >> 2)
+
+const struct drm_color_ctm_3x4 test_matrix_3x4_50_desat = { {
+	FIXPT_HALF, FIXPT_QUARTER, FIXPT_QUARTER, 0,
+	FIXPT_QUARTER, FIXPT_HALF, FIXPT_QUARTER, 0,
+	FIXPT_QUARTER, FIXPT_QUARTER, FIXPT_HALF, 0
+} };
+
+static void vkms_color_ctm_3x4_50_desat(struct kunit *test)
+{
+	struct pixel_argb_s32 ref, out;
+
+	/* full white */
+	ref.a = 0xffff;
+	ref.r = 0xffff;
+	ref.g = 0xffff;
+	ref.b = 0xffff;
+
+	memcpy(&out, &ref, sizeof(out));
+	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
+
+	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
+
+	/* full black */
+	ref.a = 0xffff;
+	ref.r = 0x0;
+	ref.g = 0x0;
+	ref.b = 0x0;
+
+	memcpy(&out, &ref, sizeof(out));
+	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
+
+	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
+
+	/* 50% grey */
+	ref.a = 0xffff;
+	ref.r = 0x8000;
+	ref.g = 0x8000;
+	ref.b = 0x8000;
+
+	memcpy(&out, &ref, sizeof(out));
+	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
+
+	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
+
+	/* full red to 50% desat */
+	ref.a = 0xffff;
+	ref.r = 0x7fff;
+	ref.g = 0x3fff;
+	ref.b = 0x3fff;
+
+	out.a = 0xffff;
+	out.r = 0xffff;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
+
+	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
+}
+
+/*
+ * BT.709 encoding matrix
+ *
+ * Values printed from within IGT when converting
+ * igt_matrix_3x4_bt709_enc to the fixed-point format expected
+ * by DRM/KMS.
+ */
+const struct drm_color_ctm_3x4 test_matrix_3x4_bt709_enc = { {
+	0x00000000366cf400ull, 0x00000000b7175900ull, 0x0000000127bb300ull, 0,
+	0x800000001993b3a0ull, 0x800000005609fe80ull, 0x000000006f9db200ull, 0,
+	0x000000009d70a400ull, 0x800000008f011100ull, 0x800000000e6f9330ull, 0
+} };
+
+static void vkms_color_ctm_3x4_bt709(struct kunit *test)
+{
+	struct pixel_argb_s32 out;
+
+	/* full white to bt709 */
+	out.a = 0xffff;
+	out.r = 0xffff;
+	out.g = 0xffff;
+	out.b = 0xffff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 255 */
+	KUNIT_EXPECT_GT(test, out.r, 0xfe00);
+	KUNIT_EXPECT_LT(test, out.r, 0x10000);
+
+	/* U 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* V 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* full black to bt709 */
+	out.a = 0xffff;
+	out.r = 0x0;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 0 */
+	KUNIT_EXPECT_LT(test, out.r, 0x100);
+
+	/* U 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* V 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* gray to bt709 */
+	out.a = 0xffff;
+	out.r = 0x7fff;
+	out.g = 0x7fff;
+	out.b = 0x7fff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 127 */
+	KUNIT_EXPECT_GT(test, out.r, 0x7e00);
+	KUNIT_EXPECT_LT(test, out.r, 0x8000);
+
+	/* U 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* V 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* == red 255 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0xffff;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 54 */
+	KUNIT_EXPECT_GT(test, out.r, 0x3500);
+	KUNIT_EXPECT_LT(test, out.r, 0x3700);
+
+	/* U 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* V 157 */
+	KUNIT_EXPECT_GT(test, out.b, 0x9C00);
+	KUNIT_EXPECT_LT(test, out.b, 0x9E00);
+
+
+	/* == green 255 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0x0;
+	out.g = 0xffff;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 182 */
+	KUNIT_EXPECT_GT(test, out.r, 0xB500);
+	KUNIT_EXPECT_LT(test, out.r, 0xB780); /* laxed by half*/
+
+	/* U 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* V 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* == blue 255 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0x0;
+	out.g = 0x0;
+	out.b = 0xffff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 18 */
+	KUNIT_EXPECT_GT(test, out.r, 0x1100);
+	KUNIT_EXPECT_LT(test, out.r, 0x1300);
+
+	/* U 111 */
+	KUNIT_EXPECT_GT(test, out.g, 0x6E00);
+	KUNIT_EXPECT_LT(test, out.g, 0x7000);
+
+	/* V 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* == red 140 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0x8c8c;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 30 */
+	KUNIT_EXPECT_GT(test, out.r, 0x1D00);
+	KUNIT_EXPECT_LT(test, out.r, 0x1F00);
+
+	/* U 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x100);
+
+	/* V 87 */
+	KUNIT_EXPECT_GT(test, out.b, 0x5600);
+	KUNIT_EXPECT_LT(test, out.b, 0x5800);
+
+	/* == green 140 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0x0;
+	out.g = 0x8c8c;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 30 */
+	KUNIT_EXPECT_GT(test, out.r, 0x6400);
+	KUNIT_EXPECT_LT(test, out.r, 0x6600);
+
+	/* U 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x100);
+
+	/* V 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x100);
+
+
+	/* == blue 140 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0x0;
+	out.g = 0x0;
+	out.b = 0x8c8c;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 30 */
+	KUNIT_EXPECT_GT(test, out.r, 0x900);
+	KUNIT_EXPECT_LT(test, out.r, 0xB00);
+
+	/* U 61 */
+	KUNIT_EXPECT_GT(test, out.g, 0x3C00);
+	KUNIT_EXPECT_LT(test, out.g, 0x3E00);
+
+	/* V 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x100);
+
+}
+
 static struct kunit_case vkms_color_test_cases[] = {
 	KUNIT_CASE(vkms_color_test_get_lut_index),
 	KUNIT_CASE(vkms_color_test_lerp),
 	KUNIT_CASE(vkms_color_test_linear),
 	KUNIT_CASE(vkms_color_srgb_inv_srgb),
+	KUNIT_CASE(vkms_color_ctm_3x4_50_desat),
+	KUNIT_CASE(vkms_color_ctm_3x4_bt709),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 8bbfce651526..2c5715242f91 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -164,7 +164,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
-static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
+void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
 {
 	s64 rf, gf, bf;
 
-- 
2.44.0

