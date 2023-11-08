Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC0B7E5B6D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8AB10E7E2;
	Wed,  8 Nov 2023 16:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C6010E7CA;
 Wed,  8 Nov 2023 16:38:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqSoKjC+8xBsUTMUjmyGgqmJFmnwjNIj5P24ZCIPod6ii6jxvtdc28OGJX8+OxCBTf9XFp1LzSsYca5MZtOt6B3xTuS0ufggu3bg62EJRrHMt+VY2cx5n1miOJIR87q61498/g1dh5JBPAnBH43qq0WmBSkP6yov0o7GxL9WfywNBP3IeJcaagCmbffTBGoz2AX2DhiUVXmJlCpPyw1b3LeuaoRa8dFdoEEH3/eEkXy9LTMhuhJf3+i039xFsYvuWZR+ai7YHwqIODTzcGNTLOvndInXlBh66PCmxY6qJzo4qc17skXQO3D3rdWX+7YQgBXFQwFQ6T7tYS0hedD0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSCfOPX3d79FWbw9Vx5WD9dbambldPAAOktljmehn/I=;
 b=ADB6Qoyd7sSnD/gaudHgIWfVIPFG2sw6D9PeZdjWWPvWYs7+45oIHV9/z8BUIvFqDZNfJuXLU1HE3zuLCNKTYtIbiu8H4mc53kAuvz/7OO7X5zkHytfCj3KmV/MvtmIc/r2VitTle6OdbQVE/kRtCjwoRikWFRElkxLlKgg3uIwjQhOaQH8BofqU8Er0U8VcZQaX1PaogqNdJaokfGgBDWXURCTnB2h4i6AW65YXD8ZfGMHKdXo3XwpKQE7y3fsonF1tv4UwaAX9VDKv5r8kOUsQXkgIwSYVVncUS5ENRIrzi9leoDUPyiCChaiaK78yNUqsDtG2uskfIv1noTQ5EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSCfOPX3d79FWbw9Vx5WD9dbambldPAAOktljmehn/I=;
 b=mnu9rsHnmG9uSO8vmHf1Emi2iTKYGIIFG0euGcVvO95D50dMmIaQMXTqg5UqwI6kCJwLboRHZvqpgyMZDxjpABhZqvfDVPI+kcMEsBzTMHgeLq145MKF8xLq2CrSL/FFpYv7a0LQOdE4Npg/wTSxjkBTjoa/FLGS6+dy+3niD8w=
Received: from DM6PR07CA0131.namprd07.prod.outlook.com (2603:10b6:5:330::19)
 by IA1PR12MB8466.namprd12.prod.outlook.com (2603:10b6:208:44b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:38:03 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::a3) by DM6PR07CA0131.outlook.office365.com
 (2603:10b6:5:330::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:38:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:38:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:59 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:58 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 22/23] drm/tests: Add a few tests around drm_fixed.h
Date: Wed, 8 Nov 2023 11:36:41 -0500
Message-ID: <20231108163647.106853-23-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|IA1PR12MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: e8bd7e95-6c73-4421-6a5e-08dbe07913e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2+l7FtRYb2NlmpmNC+hP2DvjnsQuLUdoMoSRwfLfdESgZi7apKOPSKWjMWVvsRQ3NMxvpqiumS1dW36MZad9eu1uzx9E55r/lna035GcLubq6ZRqEoKONvfg3VTZ3HVSwS0cIEwXRzjk8HVUbS3FzRZwGQKHjUMt9OTA2v/mHOJFPoCYrszlCoPJTuVbt5/cs29DiSxBlFr6cV7oKPyjfhMzG06mjOyFfnp0WZfy+x0pLUiLMkDMIgquo45YAlQcvZNPqQ+Rl3vnX6rr0Dq/RdftgQ31hF0fr8b/xmis/+iZ7ZNcLbjIObxLPmj89BPHjNqs2TgTt+ZRiSqrNBXUY2vigdvGeP0MY4hiWOgzESOT/zPeUcJ5rMi1NnXCcNF9aUu836XzKKmS8IVO9eNxTgAauNrONREBO6L1rdk37ju9Pr+yKtoqlv/ov8/sLj6U3/M+CaUsyE486QnQt1AwGjaHaj6Sn3s4zMkyD10yriptsiW3YgEmFEKptajGrJE3G2d43aTtGWyxg2Pv3IF7uUgevShjk4e0KbqwKaNVgRj0AA7iTleS+n2DNMXAPDqPIsxfeMk9Qv7JxMDAVTuHjjldj9I7V4+8StKJSCLqnQguaBVV0QORVY7uXFJ7NyhdnYzkVfOmH28O5PPRu8sbsehVC0GVqtVL4hho0QFrFsotXgiu2RuK6M36aaoIFNz0ILdHZ+m8/NTjaIf6tcYJtoUdi/x7Am7kDMOZ6t7zARM48F6gQYd+ikVnaXO2Xn2OUwt/lFQYoTJc1NMf0AetXg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(451199024)(82310400011)(1800799009)(186009)(64100799003)(40470700004)(46966006)(36840700001)(4326008)(83380400001)(1076003)(70206006)(70586007)(26005)(2616005)(336012)(426003)(478600001)(40480700001)(450100002)(8676002)(8936002)(316002)(6916009)(54906003)(47076005)(6666004)(44832011)(36860700001)(40460700003)(41300700001)(86362001)(82740400003)(81166007)(5660300002)(356005)(2906002)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:38:03.1430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8bd7e95-6c73-4421-6a5e-08dbe07913e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8466
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

While working on the CTM implementation of VKMS I had to ascertain
myself of a few assumptions. One of those is whether drm_fixed.h
treats its numbers using signed-magnitude or twos-complement. It is
twos-complement.

In order to make someone else's day easier I am adding the
drm_test_int2fixp test that validates the above assumption.

I am also adding a test for the new sm2fixp function that converts
from a signed-magnitude fixed point to the twos-complement fixed
point.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/tests/Makefile        |  3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c | 69 +++++++++++++++++++++++++++
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index ba7baa622675..61f44ad0e862 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
 	drm_rect_test.o	\
-	drm_exec_test.o
+	drm_exec_test.o \
+	drm_fixp_test.o
 
 CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
diff --git a/drivers/gpu/drm/tests/drm_fixp_test.c b/drivers/gpu/drm/tests/drm_fixp_test.c
new file mode 100644
index 000000000000..f420f173ff66
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_fixp_test.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ */
+
+#include <kunit/test.h>
+#include <drm/drm_fixed.h>
+
+static void drm_test_sm2fixp(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1LL << 63) - 1));
+
+	/* 1 */
+	KUNIT_EXPECT_EQ(test, drm_int2fixp(1), drm_sm2fixp(1ull << DRM_FIXED_POINT));
+
+	/* -1 */
+	KUNIT_EXPECT_EQ(test, drm_int2fixp(-1), drm_sm2fixp((1ull << 63) | (1ull << DRM_FIXED_POINT)));
+
+	/* 0.5 */
+	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(1, 2), drm_sm2fixp(1ull << (DRM_FIXED_POINT - 1)));
+
+	/* -0.5 */
+	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(-1, 2), drm_sm2fixp((1ull << 63) | (1ull << (DRM_FIXED_POINT - 1))));
+
+}
+
+static void drm_test_int2fixp(struct kunit *test)
+{
+	/* 1 */
+	KUNIT_EXPECT_EQ(test, 1ll << 32, drm_int2fixp(1));
+
+	/* -1 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 32), drm_int2fixp(-1));
+
+	/* 1 + (-1) = 0 */
+	KUNIT_EXPECT_EQ(test, 0, drm_int2fixp(1) + drm_int2fixp(-1));
+
+	/* 1 / 2 */
+	KUNIT_EXPECT_EQ(test, 1ll << 31, drm_fixp_from_fraction(1, 2));
+
+	/* -0.5 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(-1, 2));
+
+	/* (1 / 2) + (-1) = 0.5 */
+	KUNIT_EXPECT_EQ(test, 1ll << 31, drm_fixp_from_fraction(-1, 2) + drm_int2fixp(1));
+
+	/* (1 / 2) - 1) = 0.5 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(1, 2) + drm_int2fixp(-1));
+
+	/* (1 / 2) - 1) = 0.5 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(1, 2) - drm_int2fixp(1));
+
+}
+
+static struct kunit_case drm_fixp_tests[] = {
+	KUNIT_CASE(drm_test_int2fixp),
+	KUNIT_CASE(drm_test_sm2fixp),
+	{ }
+};
+
+static struct kunit_suite drm_rect_test_suite = {
+	.name = "drm_fixp",
+	.test_cases = drm_fixp_tests,
+};
+
+kunit_test_suite(drm_rect_test_suite);
+
+MODULE_AUTHOR("AMD");
+MODULE_LICENSE("GPL and additional rights");
\ No newline at end of file
-- 
2.42.1

