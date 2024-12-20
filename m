Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C5C9F8B49
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F49610EE5D;
	Fri, 20 Dec 2024 04:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="joWRlLfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2044.outbound.protection.outlook.com [40.107.101.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41B110EE5A;
 Fri, 20 Dec 2024 04:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+IhwMgiILFjQfPtuj6uNT5X7yKeuty5ZQXI9o/syR1usx8wU3PzB6awCutoZUm6JsBimPfOudU2fgqHZUynPAvJtcu2m2hfuf1QDyHit10Dd+IwIkYpoa6L0pe2XNm/aj4LRbJauWqG9+HEFmmUGYYliiK6vk7cfbVe7JF9dlVaE0Dda05dP1lMDPCHp2g5mvdXOgYK4Zb0b/INKTI+dNpxHnL+3WR20lvsGUXaITdgebTStp7g1rOYgqM2NdngLdr/0jTd8jvJk3oZYf5ukH3neRGut1ykdCaBBw6hF27me9Wbhy3+ywFH0SbEBy6vvSRMZW9SNBb7daqf4kFj6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1rfNp8DNsQB1VbYHcwlUOHSgRBAYprAVydCupY0pdI=;
 b=xHycTK0XS1vgIYvLk2B8Pia62USn/tzjnis4lGNu3cCL5DDrhgdas8+rXMSOO7LpdJEr927ZKSItqvd4VARmPQS5xtQeQ8LOV3v5t7TgDq+AorKFhVH88EeqD4RWr8SrEaK5zLBiYAA32byM6syWXP/VY6FrKibgLj7YSHiKkIXRgBmOTSOdU3TTjv9Ig2kRSLFKnmwovRmulVASrcVvyUhA2d8n+AFKVBhLqWDX2UL4EU/oV6ZmrLrlOIPHT5Z1k6jPA01b2Lp4BInciQapB4vkqvvcaX/9SbIlNFWNyAevJ8ngz1RGv/HsBLPP+GIgQNkqbJhIE1Z0tiuC+UNLiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1rfNp8DNsQB1VbYHcwlUOHSgRBAYprAVydCupY0pdI=;
 b=joWRlLfxWCip10HuVZ5237JDK8pgJeHLmJ2PvTiQlHbY32n/hfBdlVsAwDQdj2IGDNEui+7rNM1P374Q6jcetxMbn05+DyPhEyfgUXUzkaWVpYOZoHmSK3ZpKXIESo2+ixLJKpVi5HORSQvaGLBhft6TOzLNsGyVeeW71VHde0s=
Received: from SA1PR02CA0009.namprd02.prod.outlook.com (2603:10b6:806:2cf::14)
 by PH7PR12MB7890.namprd12.prod.outlook.com (2603:10b6:510:268::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Fri, 20 Dec
 2024 04:36:18 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:2cf:cafe::d1) by SA1PR02CA0009.outlook.office365.com
 (2603:10b6:806:2cf::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 04:36:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:36:18 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:36:16 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, Louis Chauvet <louis.chauvet@bootlin.com>, Arthur Grillo
 <arthurgrillo@riseup.net>
Subject: [V7 03/45] drm/vkms: Add kunit tests for VKMS LUT handling
Date: Thu, 19 Dec 2024 21:33:09 -0700
Message-ID: <20241220043410.416867-4-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|PH7PR12MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce4d949-1216-4f0d-0785-08dd20afd88c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HRWbv+yA+4bPnpEKB3y+IWzQkvMqTwNPKRWDzBj5lhfG6bR7SFjPJd3kfdhq?=
 =?us-ascii?Q?mN0aFjX/XbioPzCemIOu0NNBiiOZkmA28MKaGutj5T0OKLbUX8UO3s/gQtt8?=
 =?us-ascii?Q?h+ZcqxxHnfZnkVkb1/Z615hO0NW54XTOe6KwoV1G6K2PZSXx5HN40EZJe6Jk?=
 =?us-ascii?Q?cxcsYqF61LrDdTrH1ackf2QLPo6gD5CVrNKelvwpdXndyyMnuV1pAQPiLH1a?=
 =?us-ascii?Q?JbbKq6XpEym+VUb14Y7o8OuQBpnY5hYcuo7etWIVV30WSWHklsZR3VjEqrSy?=
 =?us-ascii?Q?vhja1rTuqdCa5pm9S4Yqw3wPEP11dnFRAOTc0z8LLRtn+RG+Jp8A5C91b7tu?=
 =?us-ascii?Q?1eMUBTDURHTKbedx3COugUessJswONTuq2LkPYuMMz/Fpr660Or+qmA1q9pJ?=
 =?us-ascii?Q?nQvR2VBcsz4KnuSqe2+ZRFJRK1dIEJiO2iCBxVZhdgMmjJ9dTEnrUfp73f/L?=
 =?us-ascii?Q?jlyk1QdGSQyK6ySJWAP/vIc+gJM5tCWW+CLTCeIbyYfIkOyY3+sfPdyGtQcW?=
 =?us-ascii?Q?o/eBiaHEuPD4Vfjp/a7GP6r1WQMKdIPEcSAnc2Bi1RXKwcr6rYyEL6hy5beK?=
 =?us-ascii?Q?Jhnvjwec0z0R1OsokNi8nTqi1l+bMkqPVzncHXT5jN1+NvJSbh3Vou1Sv1tW?=
 =?us-ascii?Q?sgGmoWy344NTC2GUButOGRim4AA3H82AK/U/vGTR5nyuDH7YF3NY2AH9+NGk?=
 =?us-ascii?Q?s2yMCfbma02b91ykM2WhFL3qfHtzlm5Su3gB2BSocYu1qrjuVxCioT9uHUdn?=
 =?us-ascii?Q?xJOB2Cnvsnka9v6I9usHN+cgGY2I85fOnYUiwsRo2gZXSUjN5oXzPPB25BsA?=
 =?us-ascii?Q?FGAKlhHsgzcbOn2nSP0R4gFxpz/d3xrfZhUFLTAy58893ARDH9S0dyRqgiLa?=
 =?us-ascii?Q?rlUUv5matf/EjgihufFaOqo4OdfI7dNqgPE+EbvtQIKcjL0R5wQ+vhkLy8Ja?=
 =?us-ascii?Q?BCj4PiA+AqsMVio7xAFoitapl9Qp0yEPTmRvlCaoFPt+Pb4Y7k26dlhDALye?=
 =?us-ascii?Q?A5CqIwwj4SgR6Vr/LIws/BgmASTuVj3m5YhUjUl8/WzZahnWCLXeWD7kk3xu?=
 =?us-ascii?Q?jlN7J/pwI52YsLD+AipNcc2DmGGW5nomn4+jhpUYyIcZ9lQ7eRHOjS5YBAHh?=
 =?us-ascii?Q?zoBpZ8TLdFQDTr82mtEMDbcxDyoXd3Q825/7oKFI0cdfUJihoEm8yIH3FnKP?=
 =?us-ascii?Q?Mws5G373mjtY7gFatLuGowURlj1zJCIWOsDDwfUlipsV6BjLDdnVq8yRviIx?=
 =?us-ascii?Q?6PAljMx+ArVkkYymaZ8Z6YVx1MjkT+j3BlEil9a/D6GF1cyT0f4VPMWvouqK?=
 =?us-ascii?Q?GuX/pNc40FWTg84kwiN+DrigfqK1wLaDBtSR80MGQWiu0dFbIVNL7TUKzUce?=
 =?us-ascii?Q?neUD2HYJCGAkSlvg2tQLBJv/SRT55VoaNrM3CQ0nx0qWc2chzFSdC8jrzes4?=
 =?us-ascii?Q?wegEMHDJFVwjrVLIz5slL7dsP2+S1vr/YRvgGI1MnspJjxoyFrHQsalzGFem?=
 =?us-ascii?Q?toZlImtvR5czmWg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:36:18.0118 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce4d949-1216-4f0d-0785-08dd20afd88c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7890
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

Debugging LUT math is much easier when we can unit test
it. Add kunit functionality to VKMS and add tests for
 - get_lut_index
 - lerp_u16

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
---
v7:
 - Fix checkpatch warnings and errors (Louis Chauvet)
  - Change SPDX-License-Identifier: GPL-2.0+ from /* */ to //
  - Fix checkpatch errors and warnings (new line at EOF, redundant spaces, and long lines)
  - Add static to const struct vkms_color_lut test_linear_lut
 - Add "MODULE_DESCRIPTION" (Jeff Johnson)

v6:
 - Eliminate need to include test as .c file (Louis Chauvet)

v5:
 - Bring back static for lerp_u16 and get_lut_index (Arthur)

v4:
 - Test the critical points of the lerp function (Pekka)

v3:
 - Use include way of testing static functions (Arthur)
 
 drivers/gpu/drm/vkms/Kconfig                 |  15 ++
 drivers/gpu/drm/vkms/Makefile                |   1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig      |   4 +
 drivers/gpu/drm/vkms/tests/Makefile          |   3 +
 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 172 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c         |   8 +-
 drivers/gpu/drm/vkms/vkms_composer.h         |  13 ++
 7 files changed, 214 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h

diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index b9ecdebecb0b..59c4a32adb9d 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -13,3 +13,18 @@ config DRM_VKMS
 	  a VKMS.
 
 	  If M is selected the module will be called vkms.
+
+config DRM_VKMS_KUNIT_TESTS
+	tristate "KUnit tests for VKMS." if !KUNIT_ALL_TESTS
+	depends on DRM_VKMS=y && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds unit tests for VKMS. This option is not useful for
+	  distributions or general kernels, but only for kernel
+	  developers working on VKMS.
+
+	  For more information on KUnit and unit tests in general,
+	  please refer to the KUnit documentation in
+	  Documentation/dev-tools/kunit/.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 1b28a6a32948..8d3e46dde635 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -9,3 +9,4 @@ vkms-y := \
 	vkms_writeback.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
new file mode 100644
index 000000000000..70e378228cbd
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
@@ -0,0 +1,4 @@
+CONFIG_KUNIT=y
+CONFIG_DRM=y
+CONFIG_DRM_VKMS=y
+CONFIG_DRM_VKMS_KUNIT_TESTS=y
diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
new file mode 100644
index 000000000000..7876ca7a3c42
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_color_test.o
\ No newline at end of file
diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
new file mode 100644
index 000000000000..b53beaac2703
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+#include <drm/drm_fixed.h>
+#include <drm/drm_mode.h>
+#include "../vkms_drv.h"
+#include "../vkms_composer.h"
+
+#define TEST_LUT_SIZE 16
+
+MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+
+static struct drm_color_lut test_linear_array[TEST_LUT_SIZE] = {
+	{ 0x0, 0x0, 0x0, 0 },
+	{ 0x1111, 0x1111, 0x1111, 0 },
+	{ 0x2222, 0x2222, 0x2222, 0 },
+	{ 0x3333, 0x3333, 0x3333, 0 },
+	{ 0x4444, 0x4444, 0x4444, 0 },
+	{ 0x5555, 0x5555, 0x5555, 0 },
+	{ 0x6666, 0x6666, 0x6666, 0 },
+	{ 0x7777, 0x7777, 0x7777, 0 },
+	{ 0x8888, 0x8888, 0x8888, 0 },
+	{ 0x9999, 0x9999, 0x9999, 0 },
+	{ 0xaaaa, 0xaaaa, 0xaaaa, 0 },
+	{ 0xbbbb, 0xbbbb, 0xbbbb, 0 },
+	{ 0xcccc, 0xcccc, 0xcccc, 0 },
+	{ 0xdddd, 0xdddd, 0xdddd, 0 },
+	{ 0xeeee, 0xeeee, 0xeeee, 0 },
+	{ 0xffff, 0xffff, 0xffff, 0 },
+};
+
+static const struct vkms_color_lut test_linear_lut = {
+	.base = test_linear_array,
+	.lut_length = TEST_LUT_SIZE,
+	.channel_value2index_ratio = 0xf000fll
+};
+
+
+static void vkms_color_test_get_lut_index(struct kunit *test)
+{
+	s64 lut_index;
+	int i;
+
+	lut_index = get_lut_index(&test_linear_lut, test_linear_array[0].red);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(lut_index), 0);
+
+	for (i = 0; i < TEST_LUT_SIZE; i++) {
+		lut_index = get_lut_index(&test_linear_lut, test_linear_array[i].red);
+		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(lut_index), i);
+	}
+}
+
+static void vkms_color_test_lerp(struct kunit *test)
+{
+	/*** half-way round down ***/
+	s64 t = 0x80000000 - 1;
+
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x8);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
+
+	/*** half-way round up ***/
+	t = 0x80000000;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x9);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
+
+	/*** t = 0.0 ***/
+	t = 0x0;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
+
+	/*** t = 1.0 ***/
+	t = 0x100000000;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
+
+	/*** t = 0.0 + 1 ***/
+	t = 0x0 + 1;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
+
+	/*** t = 1.0 - 1 ***/
+	t = 0x100000000 - 1;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
+
+	/*** t chosen to verify the flipping point of result a (or b) to a+1 (or b-1) ***/
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000 - 1), 0x0);
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000), 0x1);
+}
+
+static struct kunit_case vkms_color_test_cases[] = {
+	KUNIT_CASE(vkms_color_test_get_lut_index),
+	KUNIT_CASE(vkms_color_test_lerp),
+	{}
+};
+
+static struct kunit_suite vkms_color_test_suite = {
+	.name = "vkms-color",
+	.test_cases = vkms_color_test_cases,
+};
+
+kunit_test_suite(vkms_color_test_suite);
+
+MODULE_DESCRIPTION("Kunit test for VKMS LUT handling");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 3d6785d081f2..d15ceac6c56f 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -12,6 +12,8 @@
 #include <linux/minmax.h>
 
 #include "vkms_drv.h"
+#include <kunit/visibility.h>
+#include "vkms_composer.h"
 
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 {
@@ -91,7 +93,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 }
 
 // lerp(a, b, t) = a + (b - a) * t
-static u16 lerp_u16(u16 a, u16 b, s64 t)
+VISIBLE_IF_KUNIT u16 lerp_u16(u16 a, u16 b, s64 t)
 {
 	s64 a_fp = drm_int2fixp(a);
 	s64 b_fp = drm_int2fixp(b);
@@ -100,13 +102,15 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
 
 	return drm_fixp2int_round(a_fp + delta);
 }
+EXPORT_SYMBOL_IF_KUNIT(lerp_u16);
 
-static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
+VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
 {
 	s64 color_channel_fp = drm_int2fixp(channel_value);
 
 	return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
 }
+EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
 
 /*
  * This enum is related to the positions of the variables inside
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
new file mode 100644
index 000000000000..9316a053e7d7
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_COMPOSER_H_
+#define _VKMS_COMPOSER_H_
+
+#include <kunit/visibility.h>
+
+#if IS_ENABLED(CONFIG_KUNIT)
+u16 lerp_u16(u16 a, u16 b, s64 t);
+s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
+#endif
+
+#endif /* _VKMS_COMPOSER_H_ */
-- 
2.43.0

