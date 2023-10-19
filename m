Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0327D03DD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD8C10E56B;
	Thu, 19 Oct 2023 21:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E6E10E567;
 Thu, 19 Oct 2023 21:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FG1eO1Nn2Ts7g1bP9xjYfthHTQJJZsnwrDO5SeTQSkZt3imuNZnzxFLWhBPFRAmyFSLY7UKGMYC36PGVJiHuaVTiag2rRCPinJRoezNusqGbkuLPOFGLQ3qREtmqtUloU0PQEdz3Pxr/rDp92EgWezcYUsOQSvfgvTtW2WUkyeNDPWINK/x1NnDqwi3WoSVfDejtGPhzq2QsGvgOd37qWXeb9KXYkGVZPyCPoDhRSa2Xpp+8QEJt4LXAPbmZ79sbPL6cEt2B9s1vkcIt5da6+bu7b2zftI46az6lGbAqPh7kIaBlWwSrrLYjxHxbbAnlvcXhNiMCD1Fogh6hJBf8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzCY4tEWaePunveco7AAoWtk5Dto5jVqKqQPoKjb/kM=;
 b=JO0lfxET2NXvVqhWP5uoZFzOVhuAqoc7MbktlJ3cRLfrbWohqIjW3PWyVrLOf7D3xvDOAHQrYvLO007snNkJEsrAzOMJgA/NWsTRvxvGlLuT4+oudKson9hhFPb/7felzfoKvR8Uw0Id+Kg5Vq/1w0/IRBtDnX5N87bB1ekw8WO/raWevo/0UTMOtn371TULzm0nEC2ZmUBODlmssIACUdohXR5GWePme5pF08on73aMfBkqS7dP3Vc1YTI7SkqIj7x5fluKSKdUut1GNIUXMwv/FCwkGJ59XK0KxV26yaf7Ymr6LS9sgkn9SGvF/vXZ0PEKTeAmSuEv3UlnpKJ2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzCY4tEWaePunveco7AAoWtk5Dto5jVqKqQPoKjb/kM=;
 b=ux6aIqFyRvWTymoIFUjcB9nNL0WUythfqHHjjq6EFSoHYM78l8bNx6ft15HLi/gBXIwLWuidg68tNI+TK6EKC5PsvBJvOXcWDaCQSGOqq2qrVBipNEkvkq6tb/on/C9c830MK2sBZ6vk5tuRNk4yLTwRVeDkyC4sq3cMHNW+BTk=
Received: from MN2PR16CA0064.namprd16.prod.outlook.com (2603:10b6:208:234::33)
 by BN9PR12MB5034.namprd12.prod.outlook.com (2603:10b6:408:104::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 21:23:18 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:234:cafe::23) by MN2PR16CA0064.outlook.office365.com
 (2603:10b6:208:234::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23 via Frontend
 Transport; Thu, 19 Oct 2023 21:23:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Thu, 19 Oct 2023 21:23:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:22:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:22:49 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 19 Oct 2023 16:22:48 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 17/17] drm/vkms: Add kunit tests for linear and sRGB
 LUTs
Date: Thu, 19 Oct 2023 17:21:33 -0400
Message-ID: <20231019212133.245155-18-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019212133.245155-1-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|BN9PR12MB5034:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ae086f-cd31-425a-7467-08dbd0e99d4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nvI5tXxQSgEAf/Y7IiRVTsE9+AsaYIPdb+K9V3kN9V6iQ6a99bCPnUvvSx+v9R2+LOLwJNDtewzlXA1M8yN12aLCUEFeSlzg8TfwaizDOUupEPEcOnW8EjKhSbFiLk1RbuUqm3yOetfFP0tGnw68qrX6lEDfhQRzRGIpdYO+Ax+zz5FTbRpbS/sQ6XXnxNMC8NzXcJloBMCshRVl91joVq9+mSaJHplaRf6O2O0M22RQJkVeUqh/uSrAQuJ1oPb7Jycn+2J5OFamO4Mm6Kja7G8NIFjmRp5GTHTEExviYT54L5E2hc8nBHz48apZxZ+E976VMQah55bA3gYZkJMOmGZFqa3QRDTNgm125hQRM3fM8pJVAgdho7lu4my/j1QiL0UWq0qWOZnRam6+po4rtpobeesnEfbQq4Mhxrc3vpMcaoyfIbOCEj0NF2TvBmedA23zypn8LsO4bIeOyWlj/JnBaXaqMY1xnuQMJWd/SDvPywv4TizdjLJukhTlbu+tsoR9UgxdcB50OBCftbgg5rJ8S4gj+WB0G5hgaS0uQ8AhLh/ux5opHjUpEVRzBfqV/EJRh5zMLccT6ZuTQyuKxAVoY4i62XB7MUq1DEpm493nwVrHp50ldzvsVTzVwXMXR+spLgImET7i/M4jGIyBc0EvpH0s0/QyJGuN44bAoBcHIW8xd01oxA0txYzlcCoRNYg9FsLH7tGgI2Et0EqDlsN702fDbY5HtYLMBhiqlsq4tvx4Vz8FZvyuTam4d3/rI3Sp5NatScDAN7gfNoQheA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(82310400011)(64100799003)(186009)(1800799009)(451199024)(40470700004)(46966006)(36840700001)(40480700001)(86362001)(82740400003)(356005)(40460700003)(26005)(336012)(426003)(66574015)(2616005)(1076003)(81166007)(41300700001)(478600001)(8676002)(44832011)(5660300002)(8936002)(4326008)(2906002)(7416002)(70206006)(316002)(6916009)(36756003)(54906003)(70586007)(6666004)(7696005)(36860700001)(47076005)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 21:23:18.7291 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ae086f-cd31-425a-7467-08dbd0e99d4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5034
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Christopher
 Braga <quic_cbraga@quicinc.com>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Sima <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Hector Martin <marcan@marcan.st>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Sasha McIntosh <sashamcintosh@google.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 38 ++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_composer.c          | 13 +------
 drivers/gpu/drm/vkms/vkms_composer.h          | 14 +++++++
 3 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
index 843b2e1d607e..14decb5d1b64 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
@@ -5,6 +5,7 @@
 #include <drm/drm_fixed.h>
 
 #include "../vkms_composer.h"
+#include "../vkms_luts.h"
 
 #define TEST_LUT_SIZE 16
 
@@ -33,7 +34,6 @@ const struct vkms_color_lut test_linear_lut = {
 	.channel_value2index_ratio = 0xf000fll
 };
 
-
 static void vkms_color_test_get_lut_index(struct kunit *test)
 {
 	int i;
@@ -42,6 +42,19 @@ static void vkms_color_test_get_lut_index(struct kunit *test)
 
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
@@ -49,9 +62,32 @@ static void vkms_color_test_lerp(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, 0x80000000), 0x8);
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
index 73b7d5e94021..24c984f2876f 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -110,18 +110,7 @@ s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
 	return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
 }
 
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
+u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
 				      enum lut_channel channel)
 {
 	s64 lut_index = get_lut_index(lut, channel_value);
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
index 11c5de9cc961..d92497c555eb 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.h
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -8,4 +8,18 @@
 s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
 u16 lerp_u16(u16 a, u16 b, s64 t);
 
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
+u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
+			       enum lut_channel channel);
+
 #endif /* _VKMS_COMPOSER_H_ */
\ No newline at end of file
-- 
2.42.0

