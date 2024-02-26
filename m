Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA66868279
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC5710F03D;
	Mon, 26 Feb 2024 21:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ij4vX1sd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC97010EEF5;
 Mon, 26 Feb 2024 21:11:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3Wd6B+hDXuCv1I6nhtLyBtZP7beAkUWBbJMp41OqyrZMhvVgAr9L6eKhLpV+gG6o1Ud7hOem7ywV6jXfJpwKVluccDekd1WHKHJ64l3CObK8lJ07kCftqlrH2AmJYppL99b2xwqmrWkrn/0Wb4rc40DVE7tYjUmhlq/KLdONRSpqRs+Ky/W6p4aLKjvaPwF1LImzo3S3oiCKzrUdFYG+lJpusyZ4RC0mqnVgvhh1gwG/LSgzKCo/OXQmiy10lZBi7db1RT0h5xcVRpHnolMCEvqPBHyDAf3tiR1AFWFbjmGZjedQsT7g/xo8csPDQ+2X7gYqFgEfSsLj5Ky7AGAoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APfKi6shYFaKOk8XxkyklmP4hVg2fYoXf/cGZCqQNsU=;
 b=B3zBEHXTnOX5P8OV2l7KmAJjQLO92BJLddTUir1Ft1gUCqJwW7IGVfppE7fHfnunLfyxmmqetaZnCDaZCmUFBRu9QHgngXniJE+u6TAYtRUjbemHrbI8xYdETk+ICh8pJFZGDlcmn7kUa9MZOS3+T4MAhDSqhaHE3XoTYrvBqzIXryPhZH2nNgP2SkWr2IiTtm8GjUNzmy7jSZo+WRzUu+P7jQSZL3HMgluvyI67UywKSB18vEV8oO3lP70KWgzUlQ4+sX9uIquO4ZZBdi3cy426vu8uh1TD6HPtXBAca2VWGK4ov3h/diqxV3QRK4vbibXOX/3LcqvKyE2d+GI/dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APfKi6shYFaKOk8XxkyklmP4hVg2fYoXf/cGZCqQNsU=;
 b=Ij4vX1sdvPHHTWITJYG2dkNDSdQj7BSzX6qq/OHUBtgrf7hixBw8GgnLTdQnnakCBc7BPvX2ygji0a7FgDQqxFjny+JC1ZxC2N8k5B7v0QlcKZPvBi2izRBozE/Ktn/fa2NsPj4cLDIeNBG7D3lPcU4wz2pRZwCSwTY2X4i033k=
Received: from BL0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:208:2d::16)
 by SJ2PR12MB8720.namprd12.prod.outlook.com (2603:10b6:a03:539::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:19 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:2d:cafe::53) by BL0PR03CA0003.outlook.office365.com
 (2603:10b6:208:2d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:17 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:16 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 18/42] drm/vkms: Add kunit tests for linear and sRGB
 LUTs
Date: Mon, 26 Feb 2024 16:10:32 -0500
Message-ID: <20240226211100.100108-19-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|SJ2PR12MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: 653607db-e3a5-4efd-46a0-08dc370f7a5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7+QDsM/Uwc7zHQ38Q4OS+YGHcoMNDyXVij7xz9p7wFXj7UI92d/wDuk6zz9mP3sg4AqJkmBAtl90NfQVPXngGvhOw9TUbaAwfSS3tSuFxV499POWmKtsbR7ONIisN/MGu/NpOzmH3NcKtiafGLXGBimZVQE6sdQVxq/wHidYo/xQUvNl/rtNyUiwKEX+Kko+mgLzomliZp0pSTAtsV9iJ5sPhLBDMUAtoc5UgI5Rb2QW1sbyT2PZE2z6Ds59QBzzpWy6f4cGQCD/4nOnNIl0DyaNBT6m7epQexI1ntiDnQSoPF3yFUMHLRiuM+r9OKNb3zF/HhGxdHjeMoITSq/Os70A5FwupWIjaUaws+PXUPD/fnrJWveuLaqDU8U3T4XoAz82T55ALromQWC+SxNjcraMr94qszCOejsC9S3XW4SGGwD2Zd3r7EUslxrQUuNWzGSQLddNpcpZ2lHJIY/WfvZYARK8U/EqWH5mDl2VOQO9NiJ35TUXeOgRFi90N3tUk4tSRGi8+2TlGyZ48U8j2cr+e8iu2SzH1csOvEw76URRghVV3PfdlA83k12YVTu6Z5AJc530xs7gpttEFrHmyYMBLz4IwJ9/+j9jAsvBbBwKvrwOMrbLUI00nikfk6Q0NuEX2WFWh0Nief4jGgL479NAkCkcRtTAzhgjnTu465Ws9lLcREiESQUll4RehluCvJwLatKrrthjzv7eouhJoO7drLtg/UMsJ3HVT8yIkBT+QnD4brDdaukIUgUrkaQz
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:19.6203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 653607db-e3a5-4efd-46a0-08dc370f7a5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
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
2.44.0

