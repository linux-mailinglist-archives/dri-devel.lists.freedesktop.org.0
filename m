Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BA4A7273B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C7F10E7A2;
	Wed, 26 Mar 2025 23:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xtznJUUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066A710E793;
 Wed, 26 Mar 2025 23:49:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPA+LLB2ec9z8JR15/YsXTC2cBhOQXKzvRMdtl5/Srs/JmrJH+UFwxgqQ+xJ1hB+Cbg1n8IbPnRwR7Tz2qWgcSbRVQHIm/jKFYMi9BIQAn3GLhuDKp/lFljwlpiJfOJDH2+d364lY+w8AE2Dq94sGXatscFwNEkqQBsfMK/0KC60SVXMiKtLUFFQD41PG4AsazrZ/uRiJO4SauWm1gapPpm4M5tjwjx4vLEtCwpnq5mFzaWtjOAE3Gd8o9aMfZpaX/Q49ldoi+MphgKIuDUfp4rX+68F/QeWnJPm7e8UXA9tDfimmL9obmfHNyG1XtQV/q0nb5HTSmji6rqX7ORcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lANCZFdYlvHpWCmyhHLPoh8cksxsJh1lYTkOCNnP8E=;
 b=M2F6H8rNvyeQSGzMmVO4nHvs0bH60H2kaw/cqZpf8GiI54m3VFNtvcEgYiWd6z2UkgNsAQpcp4qZz1iU/MnGOQcMThItuf9ly5QHhMdRGErXGp2QZndeEyHSnFdBjg0MC2naZryafSQfgW3HKS5BtO2E5+TbLfeysuPLxhDWwaP7zmVFQvnp7w/qmdYIejv8wF6cC2hjW3eOxigCro+ocQAE/ZsHqdk3SRutXInFwPKboDKMPqOWHtAsuigrlihkBScUexKT08GcgKQ8cDHPGxIdRZTDxgR2VzIOw9Tl5HKNwfUmotWNh83ikDOo6S9PuopiRcbhlJm9NaVpjCkFcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lANCZFdYlvHpWCmyhHLPoh8cksxsJh1lYTkOCNnP8E=;
 b=xtznJUUGRKsI9Ra4MKlDP6xKMhMm68dpepU74ovvrrghBojNdc4ExBDrPrILlIcwB1fP/YXBdPwONKFXpbT9hI0H9xuF0r/bk2SGjOU9HD3JK44eX4tffKJAuXE9PZAfQFixcoVhuzc8SIFhIITgHV9c9PbSQQLTT+ASbog17MI=
Received: from CH5P223CA0021.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::22)
 by SA5PPF6CDAEAF48.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8cf) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:49:02 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:1f3:cafe::89) by CH5P223CA0021.outlook.office365.com
 (2603:10b6:610:1f3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:49:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Wed, 26 Mar 2025 23:49:02 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:48:59 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Arthur Grillo
 <arthurgrillo@riseup.net>
Subject: [PATCH V8 02/43] drm/vkms: Add kunit tests for VKMS LUT handling
Date: Wed, 26 Mar 2025 17:46:43 -0600
Message-ID: <20250326234748.2982010-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|SA5PPF6CDAEAF48:EE_
X-MS-Office365-Filtering-Correlation-Id: 255ae18c-ec52-4fd2-7b7c-08dd6cc0c95e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GL0NL4FYBTZLo6kYggd23z82wbjBosOgJ5y4d7034VO3C+3wXd2idKTYRlRZ?=
 =?us-ascii?Q?enQ/kwsEcFPemZE17UHUyph2qxphYc7eXALkj8rw3jbIURE1UrzW4+rLhaFi?=
 =?us-ascii?Q?N6fTnXUNVULxo54Ik0QhuHIEECN/7Agvsa5ZNaOE5SlAwIAZSlZzuZgz/zjJ?=
 =?us-ascii?Q?mGIrX1ZyUu/+ut++qx8f31PKrr5ckA32k9BHyjyfu4rPD8xTqAaNdl5mFtXq?=
 =?us-ascii?Q?R+jNh9pOuFiSdVePaj4ftICQHP7OoVyLRNTWpD9LJn4UNqDA4Tphdbut9uYW?=
 =?us-ascii?Q?7FBVFrXVwyBvZZo6KuCYp8/eD8kx9L1CC3WLw6JEAbp6w+fsvolkDJajGctA?=
 =?us-ascii?Q?XIHE0YMm0sgg+5Ok1uGQjZfqZhE4cZAgW41U9HBe35WSLRQkZm2Ho/c/xrOJ?=
 =?us-ascii?Q?Gqy1PFm7vHoRGNXmKRTGzZR1vJSntXwaW2ib51lmsqlumcOFYsztPBPQ9iVd?=
 =?us-ascii?Q?J/NegtFSC295qSfZm8wORuuUQ9azoT6OPev5wnVqXI7VkjmbWTDvWj9rBLle?=
 =?us-ascii?Q?OuksoalulRGhcHRaLgSlMI5cKHb+aUFpJtbBvNb289Ozz2Q2sFVjxOXAhnRF?=
 =?us-ascii?Q?6hWfctY3jNWX4GemEnIkUQ8yb5NH96/jrPJAjckkA/iPno3Tep+XpSNbHxYh?=
 =?us-ascii?Q?dbfcncvfBF6Hc1Pzh9UppY2/rau4oLin5kP2b/+gml7asGal/HS3uD5NhgUb?=
 =?us-ascii?Q?fwOd4TWHFsOqdtS/9ejFqvna/jWSBexpR2uRrRvvNA5xfOP2QoPX2PYYwRt4?=
 =?us-ascii?Q?T4gt1WKlgh1pTCh4EPBUGg2JBe+eo9ddJMDmfcIP1hChrpq2qEU70dio6usL?=
 =?us-ascii?Q?3fMlaIpZIGFMHBoZV/+nBKX6swb77ALY1mGWvQoH3rbZ1jrFWA46wIgcMIke?=
 =?us-ascii?Q?yijADa8lve9g4xpewxOShs6Bs8ZEn3GuTdxJW0dgj2tmchrdqxBQPRy5GzaA?=
 =?us-ascii?Q?hcWZANk9Q1Hf55b5IgwvnxKKG5pHmV8VB2+foVCmkHSPqn8APtoCBvjpKiSA?=
 =?us-ascii?Q?iv/Db4LcB56ypUKzG179nYx3cJPQK/gwM9JkVbOkMEkMnHDywjJNPI4f3CwE?=
 =?us-ascii?Q?9hP2SZJACfe2ba2CH53D00GQ6zjQ4VCqTsgEhPvyC6YMfjL0vrDaOqcKWZ3h?=
 =?us-ascii?Q?pnHjy/Nl3XGpu7Fjaux58CFVohFYoSmUx0R7o+v5Td9lP9+iblEl5kx4fCG7?=
 =?us-ascii?Q?VDMZtFYUsl3f5LNE5X8OTw2tlY7jnJJLBftTm2O22xbhTYOoSsvCHN2ES+fV?=
 =?us-ascii?Q?PdW/X3lcl/JCD78L/56fGGxqsigTarHeIv45c/9qBzZe132ZyP76fQNTal0C?=
 =?us-ascii?Q?LCBKJx6jQI7V3QUS/YN4IDqdorXuRcxMadStLUNgnp8zWbyTI8KmNDQTFK22?=
 =?us-ascii?Q?UB9HrgABajGKlsbElCrZx1hqMqs9vJSUoPZmrT5E0aJGi6OBmjlJdc4BjGFK?=
 =?us-ascii?Q?uzNN9YoTvJCZ6jhHnHxVQ2kDxaDh5pO8zEogLUMJlijRblexnX/M34g9E0Bg?=
 =?us-ascii?Q?+2HnJsUpUAomtHo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:49:02.4016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 255ae18c-ec52-4fd2-7b7c-08dd6cc0c95e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6CDAEAF48
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
v8:
 - Update config names (Louis Chauvet)

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
index 9def079f685b..3c02f928ffe6 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -14,3 +14,18 @@ config DRM_VKMS
 	  a VKMS.
 
 	  If M is selected the module will be called vkms.
+
+config DRM_VKMS_KUNIT_TEST
+	tristate "KUnit tests for VKMS" if !KUNIT_ALL_TESTS
+	depends on DRM_VKMS && KUNIT
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
index 1b28a6a32948..490b26d2e69d 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -9,3 +9,4 @@ vkms-y := \
 	vkms_writeback.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
+obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += tests/
diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
new file mode 100644
index 000000000000..6a2d87068edc
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
@@ -0,0 +1,4 @@
+CONFIG_KUNIT=y
+CONFIG_DRM=y
+CONFIG_DRM_VKMS=y
+CONFIG_DRM_VKMS_KUNIT_TEST=y
diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
new file mode 100644
index 000000000000..de1af87cbb11
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms_color_test.o
\ No newline at end of file
diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
new file mode 100644
index 000000000000..affca56cac7b
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
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
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
index fa269d279e25..b0dc95f971d8 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -12,6 +12,8 @@
 #include <linux/minmax.h>
 
 #include "vkms_drv.h"
+#include <kunit/visibility.h>
+#include "vkms_composer.h"
 
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 {
@@ -60,7 +62,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 }
 
 // lerp(a, b, t) = a + (b - a) * t
-static u16 lerp_u16(u16 a, u16 b, s64 t)
+VISIBLE_IF_KUNIT u16 lerp_u16(u16 a, u16 b, s64 t)
 {
 	s64 a_fp = drm_int2fixp(a);
 	s64 b_fp = drm_int2fixp(b);
@@ -69,13 +71,15 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
 
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

