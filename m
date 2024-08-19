Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054F9957613
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A16D10E3CC;
	Mon, 19 Aug 2024 20:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TxDDXFt2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E8410E3B3;
 Mon, 19 Aug 2024 20:57:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Shfz5BrcdpWCgdXZs93aFRRxEQQ0GyGEG5kiWIN2xKYP/dzAeX1fMW6/lDeUM2BOYnBUbwkn3C25ykK1haeHaYDkZJRCusS3BSLwGnlNwXkjXdDuHI6qZk3eR3JTY9GQBhMOFlHFszHk3TwNy/L8q0IfBIPFnToxilz7x5UOeMZ/iIrerufd0KzLriwAghCNyOxACS4NWMmkgl0itH+UjgSmJ+E8fqujKfvFvIBibD/Eq5wQiWjE8OqapIu4twIu9s4idOsqcbsaTbNr6w82Um59ILBG0JNfJ33M88pcf4mI0cX4o6rVWEdcpv8NjB5UeQoRd6Gtr9htRP07HNM66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvDCq0cnOkzzUvv4eJySbI4jQABBPpK4e8pIs3Oyxjk=;
 b=LGnVNp+qKZVRJ8+LbsiTzX/yEmtmQyu1SQWOyG1z74gpcb9GGXaVpNj1VojWHTHOjGgJjd/q206/Lso8CgLEsxUzEVPaprIjYQHCpSsk2VnApy4pmNuTI4wfXMf3JzH08o2RER6aE2dFcLtzS893EBTMlndbX6/lRvg8+AkpJOIeRp//75IrV4Sy6NvloUVKD2JgE8Hc+t6OX3wXbGVfuQUIxzx8bM8BYEqjRo/7PTr40dsIboNKQjAf3SGkScHrQ91in2Ucry2vqe1l4EcP7bcxy4bqeb3OY/mQTddOLfmP8adsuWOqvjrA2i1kO6aod3q5YT16Cb3nQX1nEmf+4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvDCq0cnOkzzUvv4eJySbI4jQABBPpK4e8pIs3Oyxjk=;
 b=TxDDXFt2rfy/1Ruqlg7YONEdfSQj0kWvvMOyOv0HBw6D1K1fYucoIXXPDPHnzZruuuMmkJpSsaBklkL3H8wxDmaAiQnqR5uIUKvePCUmeyl+0+jk9Vn0dqqiKlOP5HBsxqBPgDKAjGKbcxMo5gSi7U4u23QeihUX/tdmWxFCcO8=
Received: from MN2PR17CA0006.namprd17.prod.outlook.com (2603:10b6:208:15e::19)
 by CH3PR12MB8236.namprd12.prod.outlook.com (2603:10b6:610:121::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:33 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::6a) by MN2PR17CA0006.outlook.office365.com
 (2603:10b6:208:15e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:32 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:31 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 21/44] drm/vkms: Add tests for CTM handling
Date: Mon, 19 Aug 2024 16:56:48 -0400
Message-ID: <20240819205714.316380-22-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|CH3PR12MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b78ad3a-c72c-4ae4-c298-08dcc0918c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WQGXR5j0HBhcEnVYXan2gbvSkg9QKwaPvS5piSaQ4+qr+21VlCzVUM9dR+d5?=
 =?us-ascii?Q?dznrb4Dj8xn4F/x5/8LSPWXqUdHKJuCA5c2y9T8l78+sW93GnciROQhM2lvS?=
 =?us-ascii?Q?0EAAN0oHT6SRBmT0tjY/IX6nmi1dQbaAirLSYiHZeVWUDTC7UdmsHXCu/6AV?=
 =?us-ascii?Q?SgJwtzz9qAdlCMVlStNli22nCy7hYxNhkiSPpRMvKbpvkWXnsyepDjWjrVoZ?=
 =?us-ascii?Q?1Z4xc1h7B2IDJVt8bl57jgqXeToNkLBRZJUy1ra83zQTUZQyV8bX1XuDu3nP?=
 =?us-ascii?Q?HWn4KkwpaoOXG1tTmZRjPybLNyhh9YOEE7rnVYo17Tr7VFIvdJf7ExQubUcg?=
 =?us-ascii?Q?c9ooCowBcVydy9DhJG3VFhS3mH3jpWZ58vxXOVHndfKxMKSJC3YLYo2zgOaM?=
 =?us-ascii?Q?DEaj8qB1qfAiIOzDTe7yKpnXwIFY223JWxz36et5IOE1PBbiW9nhM+ccqgEQ?=
 =?us-ascii?Q?4gKJ34AWCRq5+dXhjtnYIv8L9VV2xmwvokkOqv2FsypUy4H+i3vf05J4JsUZ?=
 =?us-ascii?Q?ZzfXXjcTwwOlKNIalHhyoKXnxM9m2l4W6EnBnK3U4qJGsz/OP1qHuHiI64q7?=
 =?us-ascii?Q?NKUzf91tmuy27QhWhfo9QtHu28+CrkFhgvPcNrL2+kVlAcmmoxuC3KEGUoBE?=
 =?us-ascii?Q?QVZs33ENGe0FDGyEqGEtBEl4rUgwh+ZcqyMeQUK2HrXHe4WR5nM/KR8BLjUN?=
 =?us-ascii?Q?h8WkYgiR4tKQnhNX/qaeI+4m+Fg9bimV931/nVo6UYw6RUSlGAgjQXWtm7iA?=
 =?us-ascii?Q?nXj4VCVqxdjeh3yucRD8rPibcOAbNBioC6NClc2KLh48XO2OF0locwZ8XCrX?=
 =?us-ascii?Q?sXyVR1Rb+Xs7s2z2WJe39ggutlWlIBV4ULI9Bn27sY8T2Q9W2jGyRPbg8fDL?=
 =?us-ascii?Q?eint3kLZZJ63oBewGSbejkRXsWyW4vUjm+eOQMS4ZpiiGZRfAxavMmzey0U/?=
 =?us-ascii?Q?GwA05BOnYavjjrsnblhkFdZFSeh4oDgPpYCX5YilpDaR38QSKwYrJjwAq0b2?=
 =?us-ascii?Q?NrkZWDrML8pwmMt22B8/l0HWJ3HlJghw7imtV9uv4tIHkvGMCF5CjuBnXmHt?=
 =?us-ascii?Q?7rPzu0/54NEIYTYJLM2js/y2FRoCPC1Fozx0cODGl4CwvjtQCLrXVWziD+zJ?=
 =?us-ascii?Q?T2lL2SptUMWOyyeOA1JZyR9VkXquFTCbQsmZvtLkLHOOXB0fH9Rf2aOuCM/m?=
 =?us-ascii?Q?NKE3mC9/a/144viVBkGp3TLgCiMJrdkQivfK4yXqhFtN3M6RWPZveV2OdXTN?=
 =?us-ascii?Q?PEqDnwOi6fA/rU4fD+rmj8n6C/VtU9u4QwUoaiH/mkIRYbgLnTmdd6NPVB/f?=
 =?us-ascii?Q?18DMdSNHvx3YidYin96Mfkx93ZlTtqJ4kyLuLf5tmdyeZhQTu3I5cUmmERrI?=
 =?us-ascii?Q?WmyquZ5uCh9KLN4bWdXzRbC4Xe0kThpblPgeGEnow3yiYLRCBT36zZPr+Q3E?=
 =?us-ascii?Q?yAYXvv25YpJ0dP7y9D0BD2dnXJA3S2ZY?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:33.1514 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b78ad3a-c72c-4ae4-c298-08dcc0918c0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8236
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

v5:
 - Make apply_3x4_matrix static

v4:
 - Comment on origin of bt709_enc matrix (Pekka)
 - Use full opaque alpha (Pekka)
 - Add additional check for Y < 0xffff (Pekka)
 - Remove unused code (Pekka)
 - Rename red, green, blue to Y, U, V where applicable

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 251 ++++++++++++++++++
 1 file changed, 251 insertions(+)

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
 
-- 
2.46.0

