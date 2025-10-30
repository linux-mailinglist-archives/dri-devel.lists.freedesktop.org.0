Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A7C1E43D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F31410E939;
	Thu, 30 Oct 2025 03:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Y6Ct48Gc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013068.outbound.protection.outlook.com
 [40.93.196.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B69F10E939;
 Thu, 30 Oct 2025 03:49:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzQvJFmC1f28dsPcIZXnf6pSsdj92zGpEvdRWBB1RZQxBUqzEjOMXkZZIaxR5nIhdUaiUBGRKQ73rUazcF2tb2ORCyZ+0hE1gIfySi7JiRhSxT7q2oiTqgaeg3NJqYsJdWa8b9GXM6OHbPpSUOqVb9KzKW72CnMlF05KX3wakcPep5kHBCSMXx/suL251AiMwC+PB/HYRx4ipEx3+f3EbVfXo4WabmGRePSqegbbcBfSMxtKU3CgXl4gJroghsUczV2YkwsYVZQCJ4RAU0IbomzcFwGpRFQaXbgb4PXCWSwh+MsXNiatUPQHJE9nwx9eAqu82PzsSmEQetzbk4gqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TU11Q4DbmLBYPXHUvbf5WCeEqbm8XsMHYs/zh/q4Zs=;
 b=STYhbvTAGs+E9vhwReTNfmAz2N5PbaEG6CH12u12C09WDMZSNOj7TP3JfdbdTJKenzcd6bLd5YqFz/4/YLwa2vNp+4E5+yhmrPNU43yc7MYlGz0UP06i31vC2zmj7F1yz6VpkUON4OTwaiHPn5bW8aylGtH9yiYKWYpNPO54ItMFBDBs/P6+NG35T567NOL9gGna7li4DUaNt044YZouCEWpNtIeMp9+uerc9oTgmRzq8hqU5tkOEFB4BlDYVw/yKhOdpYJsHDgchAEOOtp0g3xAQY2CqZKd+dP0Qh46ERolYgZdgt32xootnNgPQsc7uEvsI6X8xDBwQ1iNFknGUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TU11Q4DbmLBYPXHUvbf5WCeEqbm8XsMHYs/zh/q4Zs=;
 b=Y6Ct48GcvnKTuPooSDnLERnBpMoyumwhgGet+4F2WplTDyprxXqkPJkcRuVkfQ3GgLzvVS0Z1UIcG/Syi96tddCxTJWecBmh1mQ1Vzlj/nDrBEbm38CNg34D467pdVzub1WEROTyqjW3zagGAP/EJ5ZZruySFn79vmTrE5O/Rd8=
Received: from BN0PR04CA0030.namprd04.prod.outlook.com (2603:10b6:408:ee::35)
 by BY5PR12MB4115.namprd12.prod.outlook.com (2603:10b6:a03:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 03:49:45 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:ee:cafe::cb) by BN0PR04CA0030.outlook.office365.com
 (2603:10b6:408:ee::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:49:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:49:45 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:49:41 -0700
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
Subject: [PATCH V12 20/49] drm/vkms: Add tests for CTM handling
Date: Wed, 29 Oct 2025 21:42:25 -0600
Message-ID: <20251030034349.2309829-21-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|BY5PR12MB4115:EE_
X-MS-Office365-Filtering-Correlation-Id: d9cfb27f-aac6-403d-7774-08de17675d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MlPTXJ5Gcqv76UgD418VOUcL6C6X6StwXsbzdUqP1ICBXaXVAEEf135GtcJp?=
 =?us-ascii?Q?mkghX5F2iZkyqx6c/9uxk/6HBf7b2jGI7JT7AjrW3M0/ga/1D3MOxGs2a9a2?=
 =?us-ascii?Q?r3odI+3nhyFo/mFiV+xrFNv+z0UBSdZfMqNvtqsxwfFYte9CQcKdGC2eBO2V?=
 =?us-ascii?Q?5ys23mV0jv1+rcZekqauQlY8IsdE56zjAtXVHdH3pPmNZiiU2x4VI+k1+X3q?=
 =?us-ascii?Q?ka6F6OJ86hBaDQUQqPqdcd1LJZQJ1ouqnFiPTj+CDAfTaacPvJ40wnceAuz1?=
 =?us-ascii?Q?J4HB+PttnPgiCsd8NmrzLrkF6sFtflgNU/SZ9R1XZFhh3x8rNwSy++Cbk2ai?=
 =?us-ascii?Q?QwHJHrFGwkplAX1NAJH9l/Fb0nJlbTtAkLcWyQVgKU8PYCkvuG1KADeDg27G?=
 =?us-ascii?Q?NWQJV2PkaX7m3iuvLPe57k3DWaKzV81vF57BGsNWUakpPjnbeo4vOBGUXJ0F?=
 =?us-ascii?Q?Vy4vxoZrRnnv6Q5Oc0l4/Zwb4Tu2Pp/vhqJ9kXTDFQvHpeKAelp8UtmwvddY?=
 =?us-ascii?Q?YAwzTZbxkMvcbtmNhRL6mZp/Zx9QpvaZe5u17fmjUIlLt69MqV2Z9ShvjCUd?=
 =?us-ascii?Q?tASxDrD72AwoZ2Xji5vxMoEBOzXX1KFfGz98bbIUZ4NdRNFHl4rHRqfSlz+F?=
 =?us-ascii?Q?8m/h0XVNhOlEQ5q/x+6oN7A8kgSYAqgnO/gb60nVbw5E0fSHfRC11A6qdw+O?=
 =?us-ascii?Q?/xJ1YRX5qlfHwUbtfCYf8dSl55FsBBwl8gSkLHHBozhatDCBn+E9zuceAj9K?=
 =?us-ascii?Q?rMXXbttX6JnzzagRpcByxHjg5p4+jAURWDkhFrdSF9jM0E3oZEK9Rgphk4Fn?=
 =?us-ascii?Q?d2LzBKOE8wjsPhyAs5L7CJVHLMxjYHDkdl7QY6cyNoX+/F3nuYZ5xPGSxCox?=
 =?us-ascii?Q?EGEvcI+UZTPlvuC0cJP7VivZClWu66YSv+WlfF0k9sCfdj4W/sks4HRAp1tV?=
 =?us-ascii?Q?chMijihTN0lo4BNL+Ll1YxFp1/shgTf6/2nSJrlaUEB9sKhEEMd3OYeMHbvV?=
 =?us-ascii?Q?tH4FgxGAPaf77lr9WjPjXl18Zra8+kGrptRvrHd0r1tbbX/ByTPfolmt+CCc?=
 =?us-ascii?Q?8xtqvn4mZfif734F6suxNXGczV8WIgf76YvDlcHbeQllpops4IWH6KO7Q6sM?=
 =?us-ascii?Q?mIlipPwN75CHub59cWXGzprxIZgpswP3yKhNgRMGFQKCSgvYETB1T4HrglNO?=
 =?us-ascii?Q?etlZybEsAgvPdy+okuqjLML4kZXWa2NjHgFS+YcTnVazvm8+G745KjZLT9ws?=
 =?us-ascii?Q?sJaZdob26E8wO7Vq4aUb8ecycyBTJVP5xCRS0fKRH4EIm/n7G2FybR6gXr8Z?=
 =?us-ascii?Q?LcCj0sQZBcyeCTeRzykhXiAFEK1Z6gj0S3tzgS+Ky54PAHxGKbP5na3+BY+e?=
 =?us-ascii?Q?f3dkjO1YQ6UDQaXYUEZCeckO+3Xp4W3x9wBm7/hfwDbgdLmPZ9nM5ifhjofU?=
 =?us-ascii?Q?FfD4H7N4fKca/4lLHxQszfgB09uCfpLhCM7KopIB02Ad/p1Y1idKJ3WvEsky?=
 =?us-ascii?Q?Yff519Z5J8E6cBseht+dByp35WoE/hzCrdjmcXvkA1G1u9xCF7IRW5tJAb3w?=
 =?us-ascii?Q?X0eusDYw8CzsgVCRSkA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:49:45.1385 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cfb27f-aac6-403d-7774-08de17675d8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4115
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

A whole slew of tests for CTM handling that greatly helped in
debugging the CTM code. The extent of tests might seem a bit
silly but they're fast and might someday help save someone
else's day when debugging this.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v7:
 - Fix a checkpatch a long-line warning (Louis Chauvet)

v6:
 - update reference values since we're now rounding

v5:
 - Make apply_3x4_matrix static

v4:
 - Comment on origin of bt709_enc matrix (Pekka)
 - Use full opaque alpha (Pekka)
 - Add additional check for Y < 0xffff (Pekka)
 - Remove unused code (Pekka)

 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 250 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c         |   4 +-
 drivers/gpu/drm/vkms/vkms_composer.h         |   1 +
 3 files changed, 254 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
index 8ede657e8e34..56e96a5659d9 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -148,11 +148,261 @@ static void vkms_color_srgb_inv_srgb(struct kunit *test)
 	}
 }
 
+#define FIXPT_HALF        (DRM_FIXED_ONE >> 1)
+#define FIXPT_QUARTER     (DRM_FIXED_ONE >> 2)
+
+static const struct drm_color_ctm_3x4 test_matrix_3x4_50_desat = { {
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
+	ref.r = 0x8000;
+	ref.g = 0x4000;
+	ref.b = 0x4000;
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
+static const struct drm_color_ctm_3x4 test_matrix_3x4_bt709_enc = { {
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
index 3e32e9a16ef4..5d65bb59089e 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -127,7 +127,8 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
-static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
+VISIBLE_IF_KUNIT void apply_3x4_matrix(struct pixel_argb_s32 *pixel,
+				       const struct drm_color_ctm_3x4 *matrix)
 {
 	s64 rf, gf, bf;
 	s64 r, g, b;
@@ -155,6 +156,7 @@ static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_colo
 	pixel->g = drm_fixp2int_round(gf);
 	pixel->b = drm_fixp2int_round(bf);
 }
+EXPORT_SYMBOL_IF_KUNIT(apply_3x4_matrix);
 
 static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
 {
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
index 4dba69f46092..04dd5646f672 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.h
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -22,6 +22,7 @@ u16 lerp_u16(u16 a, u16 b, s64 t);
 s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
 u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
 			       enum lut_channel channel);
+void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix);
 #endif
 
 #endif /* _VKMS_COMPOSER_H_ */
-- 
2.43.0

