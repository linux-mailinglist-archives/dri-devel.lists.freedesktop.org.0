Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE6AADC05A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9109510E5E9;
	Tue, 17 Jun 2025 04:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3Z09vOjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB9110E5DF;
 Tue, 17 Jun 2025 04:23:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmJFEqHgZlDGwDQopPTxkpGpBuhMVvgQff1APyKOMGMOT0DLjtXrgWXwxMHswqOQ2rHSLKuSwJv6OJDkhT3X/mbcUrsaytTCdne1wnxN47wyyyu56ye+aWAlHmGoLUJcNn8kFtMfp7T029r6lCTH3eKkeqfRh2MXjlnxzcSrd6868om9ZqH+WPmntqJ1RquyiUQM8+sHaV8ChYsQ99EVjK9sa3nf8jbnt44tNZlscHaOo82b572fbcG4BYjChMmXLw1a1jdspgVEjRSGcdoIGEl4O48Okt6c5L5goD6tsQKGhqxYiQROSze+Vt75kZOFz6NfQj29nn28F2F1txRTwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/VVE0jpks0HhAGH0R+zpcrkh6daCwcpjJfNYn/DBqk=;
 b=NEiNbTHUCEb+jukoEnHvxQXa3XMa0Xg+XJKNrb2dkELIoepKwfPMFQRg5J1NO+3iwL7z0fATlfLwm75ftT/lx/e9RHSvMORmX2f1U7PUmhPIh+vgsxOY5IwUo/Lnb9C5+Gh4xLRFnPLODgmMfxqkt1tOl3c7cWIKwNzOTsPHKmJZSsTlB8lThrr2T4SEKeK3m1ufPu0NZYLJDlNScLbqKgMzq3HYOjSZ03xeaGU4Bny86me0MIHtg/iQZOaUxNIfVA9V0ENDarGcQuPWm7RQKThZttEYyAMlvQIKhx+lwcGPeWbTuU+6aqbjwHGTHaCZYyN/UHrRuXP2N6n1/7xRUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/VVE0jpks0HhAGH0R+zpcrkh6daCwcpjJfNYn/DBqk=;
 b=3Z09vOjgw2ENfhk2KxsYCABDXBKIOf15xFGtEzs+TMFWeWIFZ7eUFhkAEMeJC/JXK4LgYAoGWdN1bh9auP31YwsNaccRW9YSHEyOihvxE0iqaKti/EJt4jbgZiRnxqvicvhF58RsW16uLnEI1SDNrf6RTdmS330ktG6NeJRIZiY=
Received: from CH0P221CA0036.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::14)
 by SN7PR12MB6790.namprd12.prod.outlook.com (2603:10b6:806:269::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 04:23:00 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::ae) by CH0P221CA0036.outlook.office365.com
 (2603:10b6:610:11d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 04:23:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:23:00 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:22:55 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 20/46] drm/vkms: Add tests for CTM handling
Date: Mon, 16 Jun 2025 22:17:02 -0600
Message-ID: <20250617041746.2884343-21-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|SN7PR12MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: 5241bf5a-be7d-4dd6-710f-08ddad56a4dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1M6VdBKULcFDIl28FDcDGAaai79G6sF0D5/UrN5btpZb9kTaG/chdlIwMK5C?=
 =?us-ascii?Q?cSOUXcbjSJgifuTaHjtUoIVFBXPn+y7yPfnFXxQW00Zcco10bvWtB7vA+zYV?=
 =?us-ascii?Q?vrkyirI3rQzjB7FttqcjJ24Wbm+edvCz8OJvs14vXIOKWfvteTPbwuUV6+Pk?=
 =?us-ascii?Q?WQCPKNTXvS0zlExuVecY4Lp89R6GL10wx3RM9j+xrvtIuTu5SIXTohel0hfC?=
 =?us-ascii?Q?8Q7LYm7YQgDeOW6G/wmX/rwSJm27otQIV1gB2LR57rebjm1ckJoAHvkbO7gL?=
 =?us-ascii?Q?fE8/hjq0oe/eCAQoffwgCCtOjr+s4Fuyahq4Q2mc5LqCNfEfyPAzZ+0PvrAq?=
 =?us-ascii?Q?UULBxgC56Fq6zcqWJ+Bb36Ctb+Q6mnfc6AwpbU/IIrLNeKsJNOiLOGUvo2eg?=
 =?us-ascii?Q?97NgYKuc/s9ECQJr61ib5U68T+kHdG9XA8FGuD0m0SreaYHCNvmFUx2cBipe?=
 =?us-ascii?Q?eykA9In5KN4/pj6e7FvhFbAIonOsJbslJFoo9TW3VTT1nE7tKf7vlxeK6CCP?=
 =?us-ascii?Q?nEpkOpMgzvgqp9/j3U2Qz3+zaVmfGuyimz0xFys16yIPwc3iTTUDVigJkYoA?=
 =?us-ascii?Q?lqWbuctQ2sqTOgxoV6+QQEe96TsDbwBbJhyIZvTKj9swOXeoxNZ3uK6mUlVC?=
 =?us-ascii?Q?hS8rXyGtP2XFAJuZefNWUqOdHNMhIL/4XzPeP5EWWPg4x1eOWdS6SH9R0amF?=
 =?us-ascii?Q?W5Keh+zMHezdFOEQb9aaWaNf5+OWnh20efBcB4LtZ/Ulxnhw/fghFXD6L8my?=
 =?us-ascii?Q?L74yNCyM6cd7mo/ZyKhFak8dxZeZ36fxZuvrsFcmL9Y0mVWgBkuSsHAdSmlw?=
 =?us-ascii?Q?FcQ5oI9VLV6LqRZfTMVo4+o4J1jzdT2us7BLtwg3yECl8yDf0M6tHj72WkxI?=
 =?us-ascii?Q?NfbJ0j7WTjUtwzHMJUxvZTI+WZ3fVMHTUAQEgG0jge+T/h6BM1ao3coPpWIX?=
 =?us-ascii?Q?nyERtY45nYnqZkNu+0lN02TE9d4zOH8BATzH3CiRFjKy0SSa4r58Un4bnj4e?=
 =?us-ascii?Q?VXPWpdy86t7opzsiGSgWTZaQucD/IwDVMKvumSxsJDJx7xLN/IfO6Z6n0mRq?=
 =?us-ascii?Q?OUeJt29SZmt27KiEUjmX+XdPcY9JsOCh0f3/IeuXsKwvY4B4qn97zxM5eC10?=
 =?us-ascii?Q?hI5UoOxt/4dVKlyyN6j7WsOuZzXA6gXNGx1Ikcq8v+ktlf0i6VGVP1ZdE2k/?=
 =?us-ascii?Q?wq3DStmj2GEdauf7EkyjPwOKzjGvSOWyAbUSSiO9HQy5waYy/KMsFVknkNti?=
 =?us-ascii?Q?GKI1IoFCAwg35ut9nNrVy3v2MvVbh1PSvyERxy0FdmRbekJ4+UOSk4z+2rra?=
 =?us-ascii?Q?+RTp8Z7RMGfwj10eul+b9ASQdKGYZPWP/RdSIsTRGr+lViq/ab8FduhLzF4F?=
 =?us-ascii?Q?Nbi6Rrpj5fo16bbYFzG1V/LyIvoj5U/9pkumsaoZ3ouKinaShhiw7qR6IuvS?=
 =?us-ascii?Q?tUkmNShr9CroDwg1xGR6f27N1AUsssMdQAEARFsFDWOP+lKyt1hnbXfxsmts?=
 =?us-ascii?Q?nPrxW4I5RnI0xab6d34sBhRT4xla1vrlyyGZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:23:00.0619 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5241bf5a-be7d-4dd6-710f-08ddad56a4dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6790
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
index 02fbe19c744a..a9c3af5025b3 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -190,11 +190,261 @@ static void vkms_color_srgb_inv_srgb(struct kunit *test)
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
index 8fe16d26d680..54fd00b49360 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -128,7 +128,8 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
-static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
+VISIBLE_IF_KUNIT void apply_3x4_matrix(struct pixel_argb_s32 *pixel,
+				       const struct drm_color_ctm_3x4 *matrix)
 {
 	s64 rf, gf, bf;
 	s64 r, g, b;
@@ -156,6 +157,7 @@ static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_colo
 	pixel->g = drm_fixp2int_round(gf);
 	pixel->b = drm_fixp2int_round(bf);
 }
+EXPORT_SYMBOL_IF_KUNIT(apply_3x4_matrix);
 
 static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
 {
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
index 67ae09913460..afef65a5c3ba 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.h
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -21,6 +21,7 @@ u16 lerp_u16(u16 a, u16 b, s64 t);
 s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
 u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
 			       enum lut_channel channel);
+void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix);
 #endif
 
 #endif /* _VKMS_COMPOSER_H_ */
-- 
2.43.0

