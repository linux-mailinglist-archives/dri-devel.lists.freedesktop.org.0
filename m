Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3B67E5B69
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2E110E7C8;
	Wed,  8 Nov 2023 16:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2081.outbound.protection.outlook.com [40.107.100.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E0510E7C6;
 Wed,  8 Nov 2023 16:38:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7CqgTp2QkN4dCYBaCYG0+6nf2Op8l5d8pXvXkZ7iKXwdn++I4r0m2nTnR5c/hX3etOQv1xQdrVBuKcO1lATXjQnRBtirRnomUedpCc7qnM0UthojcH4V6Z1rYo3MOIdk+D8qAM3gtZQO/8pfGZPvJt9TmIJIK0E7rqafne0W7i848ZPGGiZzwsCTwWSrkD/aEuBwfpsvWdIjjSq2jXGDyH4q/o0TL6bsyZe/VPUujagprbsS0AepdHYyriXj39xIbeMkaqpm6zStBNMx5JhNfngrgYjubF9COG8WmQ9Qn6C127qd0rMMPytIvikZkru9xyzZgFk1AvzJVzE7sXOjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++aRnhjcm8Xb6DVwVk35vHYCCz9WzwzrNWjayDq6mHs=;
 b=jzDgclOOWXnLGOCyUj0Va6SeCg5nP+GmmSjdoZQYa+vkmgko/Q0MZ1c2MfnszJps2WIThMQ/bNnkGwwk0RdaYRGcZWuV3U1MbAVcA+41t+d8F1YN8l2Oqmcp8U+i5hNdidL9KgJrE/57F2O0L1mIZ7mIlWuyKPqnIuB+S9fQT0h1wY0O5Dlsh2YPpMKhaJzMXcc0V2QsDRqO3JaWpeyEjBTX7QJsj8LbR5uvD502TjdNbK6FdQU5ygZzKkpTyEqF15sYGKm/d4w0+WqR4sU3RiIiIrFRHbMe+R/5FMVVy2vTXkugALGAam4HvpCgOGzCVmSirQsdugrjPg0PNymp9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++aRnhjcm8Xb6DVwVk35vHYCCz9WzwzrNWjayDq6mHs=;
 b=sPkY0eW3npnM6QcqRM/VY2qQWQLECLbBA5ouKa9NQSZnvKYa6lqKGLKqGk4JHI4Jn0LIAn8tMsJlM/HOMQTUw9LMKKYJmEyuStET6vgw1oaw6AuBYW/xkoPyfB9iZZn1nt9wM3jNFM6CoEkBsGC0xFW2uhG4VtiLdv9QBJJOH24=
Received: from CY5PR22CA0037.namprd22.prod.outlook.com (2603:10b6:930:1d::7)
 by PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:38:04 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:1d:cafe::dc) by CY5PR22CA0037.outlook.office365.com
 (2603:10b6:930:1d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:38:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:38:03 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:38:00 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 08:38:00 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:59 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 23/23] drm/vkms: Add tests for CTM handling
Date: Wed, 8 Nov 2023 11:36:42 -0500
Message-ID: <20231108163647.106853-24-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|PH7PR12MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: 9334beb5-bd72-48ce-66b2-08dbe079144a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/0yKO2n/QheU+/RsUVyVKOBP3JXFUjzRNTDINrd0CXQdGS1Xd9pUm3/ennitSyoV4Xstvm18zH3lBYmhiww5/L3Euy1c5BCxtdOa1/SuqJWFVQeaK4Q1CrHphQS1suSJ6zfKl8RR0GI+C9WgsdLp/vcqCBzP47uTTWsvVJBycixiw3HC88O2QkpQ4yDPgtqkTLVO/pcqxhLpYLZGLrGZzmM0qYk3Dz7f+10Ajis693ZS7xMpasoxlkSEFJzVbSIZZGfKqIS4COFS2FSEyStJqILn5fc2E7Mh5IREzqVoOMCUD0lBgT7oEHUWsuSAr3R1thDWm6wgLQa+FE2BowEUT5oatIbQEZzbUOD6oizXMDvHzSdclz1pglQW6QhU3Zlzs5ZW/hkn1irEtGI/ItJbFOoksnkYIkEo4bTcuVj7/bctUH9AdaFdOKF1lvB7ZnFx+UB2i8dMW10qm9Za7B0roc+Zf/7avnt9SAh+U12YGi8Ptn7/jOcJBh8k7k3TcYdiWHEKlfDNrAgvN27jOywygColfTl7mA7axEdZxHemcu6hxtArjvu5hy9/UZKMvasIDQZlZvpLdoKlkjX03NguihGkkygCwHMZcj1XQNqfIbQ9yeWymLA0dvJc8nX473xBiF7QCplqBXqt+yhWWYDhY28q3+6PqCqsA4odIKNc7HoQpSWuhEw7dRntohfl24uKoPbk0xIYQdEhVur/10xn8ZxqbcT+ewfXkW6lKVABgd5dcc2mXSUdouZHJZfwsYq2jNAxt7ZEtcvLIoTw/2B9A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(64100799003)(82310400011)(451199024)(186009)(1800799009)(36840700001)(40470700004)(46966006)(5660300002)(4326008)(40480700001)(2906002)(81166007)(356005)(86362001)(47076005)(36860700001)(83380400001)(8936002)(41300700001)(8676002)(82740400003)(70586007)(70206006)(336012)(40460700003)(426003)(44832011)(1076003)(2616005)(66899024)(316002)(6916009)(6666004)(54906003)(26005)(450100002)(478600001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:38:03.8204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9334beb5-bd72-48ce-66b2-08dbe079144a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6611
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
Cc: wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A whole slew of tests for CTM handling that greatly helped in
debugging the CTM code. The extent of tests might seem a bit
silly but they're fast and might someday help save someone
else's day when debugging this.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 258 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c          |   2 +-
 2 files changed, 259 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
index ad4c2f72fd1e..3eaa2233afbb 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
@@ -3,6 +3,7 @@
 #include <kunit/test.h>
 
 #include <drm/drm_fixed.h>
+#include <drm/drm_mode.h>
 
 #define TEST_LUT_SIZE 16
 
@@ -80,11 +81,268 @@ static void vkms_color_srgb_inv_srgb(struct kunit *test)
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
+	ref.a = 0x0;
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
+	ref.a = 0x0;
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
+	ref.a = 0x0;
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
+	ref.a = 0x0;
+	ref.r = 0x7fff;
+	ref.g = 0x3fff;
+	ref.b = 0x3fff;
+
+	out.a = 0x0;
+	out.r = 0xffff;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
+
+	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
+}
+
+const struct drm_color_ctm_3x4 test_matrix_3x4_bt709_enc = { {
+	0x00000000366cf400ull, 0x00000000b7175900ull, 0x0000000127bb300ull, 0,
+	0x800000001993b3a0ull, 0x800000005609fe80ull, 0x000000006f9db200ull, 0,
+	0x000000009d70a400ull, 0x800000008f011100ull, 0x800000000e6f9330ull, 0
+} };
+
+static void vkms_color_ctm_3x4_bt709(struct kunit *test)
+{
+	struct pixel_argb_s32 ref, out;
+
+	/* full white to bt709 */
+	ref.a = 0x0;
+	ref.r = 0xfffe; /* off by one in 16bpc not a big deal */
+	ref.g = 0x0;
+	ref.b = 0x0;
+
+	out.a = 0x0;
+	out.r = 0xffff;
+	out.g = 0xffff;
+	out.b = 0xffff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 255 */
+	KUNIT_EXPECT_GT(test, out.r, 0xfe00);
+
+	/* green 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* blue 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* full black to bt709 */
+	ref.a = 0x0;
+	ref.r = 0x0; /* off by one in 16bpc not a big deal */
+	ref.g = 0x0;
+	ref.b = 0x0;
+
+	out.a = 0x0;
+	out.r = 0x0;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 0 */
+	KUNIT_EXPECT_LT(test, out.r, 0x100);
+
+	/* green 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* blue 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* gray to bt709 */
+	ref.a = 0x0;
+	ref.r = 0x7fff; /* off by one in 16bpc not a big deal */
+	ref.g = 0x0;
+	ref.b = 0x0;
+
+	out.a = 0x0;
+	out.r = 0x7fff;
+	out.g = 0x7fff;
+	out.b = 0x7fff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 127 */
+	KUNIT_EXPECT_GT(test, out.r, 0x7e00);
+	KUNIT_EXPECT_LT(test, out.r, 0x8000);
+
+	/* green 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* blue 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* == red 255 - bt709 enc == */
+	out.a = 0x0;
+	out.r = 0xffff;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 54 */
+	KUNIT_EXPECT_GT(test, out.r, 0x3500);
+	KUNIT_EXPECT_LT(test, out.r, 0x3700);
+
+	/* green 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* blue 157 */
+	KUNIT_EXPECT_GT(test, out.b, 0x9C00);
+	KUNIT_EXPECT_LT(test, out.b, 0x9E00);
+
+
+	/* == green 255 - bt709 enc == */
+	out.a = 0x0;
+	out.r = 0x0;
+	out.g = 0xffff;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 182 */
+	KUNIT_EXPECT_GT(test, out.r, 0xB500);
+	KUNIT_EXPECT_LT(test, out.r, 0xB780); /* laxed by half*/
+
+	/* green 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* blue 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* == blue 255 - bt709 enc == */
+	out.a = 0x0;
+	out.r = 0x0;
+	out.g = 0x0;
+	out.b = 0xffff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 18 */
+	KUNIT_EXPECT_GT(test, out.r, 0x1100);
+	KUNIT_EXPECT_LT(test, out.r, 0x1300);
+
+	/* green 111 */
+	KUNIT_EXPECT_GT(test, out.g, 0x6E00);
+	KUNIT_EXPECT_LT(test, out.g, 0x7000);
+
+	/* blue 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* == red 140 - bt709 enc == */
+	out.a = 0x0;
+	out.r = 0x8c8c;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 30 */
+	KUNIT_EXPECT_GT(test, out.r, 0x1D00);
+	KUNIT_EXPECT_LT(test, out.r, 0x1F00);
+
+	/* green 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x100);
+
+	/* blue 87 */
+	KUNIT_EXPECT_GT(test, out.b, 0x5600);
+	KUNIT_EXPECT_LT(test, out.b, 0x5800);
+
+	/* == green 140 - bt709 enc == */
+	out.a = 0x0;
+	out.r = 0x0;
+	out.g = 0x8c8c;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 30 */
+	KUNIT_EXPECT_GT(test, out.r, 0x6400);
+	KUNIT_EXPECT_LT(test, out.r, 0x6600);
+
+	/* green 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x100);
+
+	/* blue 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x100);
+
+
+	/* == blue 140 - bt709 enc == */
+	out.a = 0x0;
+	out.r = 0x0;
+	out.g = 0x0;
+	out.b = 0x8c8c;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* red 30 */
+	KUNIT_EXPECT_GT(test, out.r, 0x900);
+	KUNIT_EXPECT_LT(test, out.r, 0xB00);
+
+	/* green 61 */
+	KUNIT_EXPECT_GT(test, out.g, 0x3C00);
+	KUNIT_EXPECT_LT(test, out.g, 0x3E00);
+
+	/* blue 0 */
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
index c278fb223188..4ead5346007a 100644
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
2.42.1

