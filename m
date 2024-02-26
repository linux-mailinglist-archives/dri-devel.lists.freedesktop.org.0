Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7835868276
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000C910EFA9;
	Mon, 26 Feb 2024 21:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m648Mejd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F71D10E7D0;
 Mon, 26 Feb 2024 21:11:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldJMkqOcMsQ3iQeW7MYytdAbOYxjjKT6ILiyCJXxmTI8U4LA5LvFal6p8mkMWn5Hxjq0lAzmIFCwJqNHrsJR9C0JYJXnuxH+mTvnVV3n8IEZDxDa7iSnu2Dg6VsYa5QD1YEL6y6OChduD5aol49ivlxIPooKK5TrOZMlNNLGWHQKVpt2B/ZUtlo2v+qa58YsQ6Z6r+JRkd8sxV9UbNuC9KEnW2rtqyE6iGyQ87MlmuUipmxqTHaKwbTdx2wK9fBBqjH7Nr/bLkBkZM8SgJfC8BxuT2nXsISzNE93dXJL4s713R08q3OViBUSEiX3GJnMO+a7wyIZnqzc8/pJDHc9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdsPWq8coV9IKdILq7ZMyNqGig8vpOr6qx0OC6tx5l0=;
 b=ah7bECHgg2kf2NWvX3VfFlzaVSPGgPGliAWLoXjaRXzfCdqdCngW5gWaSqPLMZSLELR1pRIlSnGYxkICIaoURhw5guPC0c5eLUT2hU3TYxUy21m+vbbk0QVTwKpTdLIEMIxaOXvWMkU4vCld5xhHJjWx1L1KNGPWCi763NKstOa8NOPLRmg6YfyI166jFLr/vUTRGUsN5dDSdwwAivvjnTozAasSGNs1vzvWt5lqWgb8B3bNoCWnlCxYBS0zw1MjVLKNmxim4aec9eQGe5xU8xtqCdNbZLs8/drIJ9GZyhRaWi1UsEf9RiU86TIHE+wfmOsynjdInmB+G8Io6QDEWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdsPWq8coV9IKdILq7ZMyNqGig8vpOr6qx0OC6tx5l0=;
 b=m648MejdkxoPBCX+YXQaLZ6qnvQY53JCWozngzSR/D4w2jbV9JPNGlg1jxlMNX7YDPNmUd9+nfTwHugRK5Yxn2FcQcmRcVbb2TAzodI0W0ZurqJ46gNsckDA5yR9zwWKpdeG7fdZdwDMXWgtz3U0+mKu/cISaSpSq/baJ7INYyM=
Received: from DM6PR12CA0020.namprd12.prod.outlook.com (2603:10b6:5:1c0::33)
 by CH2PR12MB5001.namprd12.prod.outlook.com (2603:10b6:610:61::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:10 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:1c0:cafe::46) by DM6PR12CA0020.outlook.office365.com
 (2603:10b6:5:1c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:09 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:09 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:08 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>, Arthur Grillo <arthurgrillo@riseup.net>
Subject: [RFC PATCH v4 06/42] drm/vkms: Add kunit tests for VKMS LUT handling
Date: Mon, 26 Feb 2024 16:10:20 -0500
Message-ID: <20240226211100.100108-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|CH2PR12MB5001:EE_
X-MS-Office365-Filtering-Correlation-Id: f7d64e2a-c994-4220-01a6-08dc370f749d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W0Hjrka4mJO9nifqg+czLICWQdy0rG2MkvUIu9pa9D7OD/8tNJMA0P4sVKvPdKL39hlJn2NvxQyvfvNquCfxnrvbjtSrCUNJ4OCv7z/ZZ+RGtP7LdxRCNzLlT9rO+XRplP0qKEEYhoZZKYfyOnGSPQKlLhjbjb8zCzbpj/a5Ybvvc0AY4k2c1I/HQ1ANI4J1BZOYbYUp3Wvu6ATzo996Q+x2nus0cUlnjxzzfjbMwWDngcJToXqpIBlmkm8R3k1ifDNPB7441Yd+qqwgHCEn7GJFBeIXMiNPZ8qHCcB3cZ+1Ib+qprg+1ikaoXKnqWJcHTBy/4z1j7SWmh2ob9pxkY9uKXI1BX+8mYMyVg+Q6QOY/Mhwf9hGjLA6n6xTHT4ZbgQaBnKL+my8PNvbS1yLqVpXOmjMOo0jfvtQ1Ta4n3JBZKNKwCoNFxmZuV2BavINpo7o2hoAv3IIv63tAaIJmgBAQRf2UhHYvuPbjKm8G9DWc+6O61eZQ0XdYZBpKdhIwJ3B07zsN0twbJYih/Ig5fbbqhTatKjp6gwVd9BhfGOid6VTUWAXSiNB35JwSukctsfaOULt2WCW/dep2M6RCYTdYv/Gcg2mXQzDVk3009DTglFp4S9tXwpWU6BUbSzWY08XI2crLBpqKT6jxbiZCZaVO4a9Yb+5gr8C/IadddY43/X71d6lM94JZijeOGaTecrCxSvTLuZiFP6SrD5Sr3f8hWIDYkeflhTdB2+u/jc7aB9XtN2SzyE08nGmOrmM
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:09.9470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d64e2a-c994-4220-01a6-08dc370f749d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5001
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

Debugging LUT math is much easier when we can unit test
it. Add kunit functionality to VKMS and add tests for
 - get_lut_index
 - lerp_u16

v4:
 - Test the critical points of the lerp function (Pekka)

v3:
 - Use include way of testing static functions (Arthur)

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/vkms/Kconfig                  |   5 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 163 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c          |   8 +-
 4 files changed, 178 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c

diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index b9ecdebecb0b..c1f8b343ff0e 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -13,3 +13,8 @@ config DRM_VKMS
 	  a VKMS.
 
 	  If M is selected the module will be called vkms.
+
+config DRM_VKMS_KUNIT_TESTS
+	tristate "Tests for VKMS" if !KUNIT_ALL_TESTS
+	depends on DRM_VKMS && KUNIT
+	default KUNIT_ALL_TESTS
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
diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
new file mode 100644
index 000000000000..fc73e48aa57c
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#include <kunit/test.h>
+
+#include <drm/drm_fixed.h>
+
+#define TEST_LUT_SIZE 16
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
+const struct vkms_color_lut test_linear_lut = {
+	.base = test_linear_array,
+	.lut_length = TEST_LUT_SIZE,
+	.channel_value2index_ratio = 0xf000fll
+};
+
+
+static void vkms_color_test_get_lut_index(struct kunit *test)
+{
+	int i;
+
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&test_linear_lut, test_linear_array[0].red)), 0);
+
+	for (i = 0; i < TEST_LUT_SIZE; i++)
+		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&test_linear_lut, test_linear_array[i].red)), i);
+}
+
+static void vkms_color_test_lerp(struct kunit *test)
+{
+	/*** half-way round down ***/
+	s64 t = 0x80000000 - 1;
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
+kunit_test_suite(vkms_color_test_suite);
+
+MODULE_LICENSE("GPL");
\ No newline at end of file
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index e70cd473e3be..d178f2a400f6 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -91,7 +91,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 }
 
 // lerp(a, b, t) = a + (b - a) * t
-static u16 lerp_u16(u16 a, u16 b, s64 t)
+u16 lerp_u16(u16 a, u16 b, s64 t)
 {
 	s64 a_fp = drm_int2fixp(a);
 	s64 b_fp = drm_int2fixp(b);
@@ -101,7 +101,7 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
 	return drm_fixp2int_round(a_fp + delta);
 }
 
-static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
+s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
 {
 	s64 color_channel_fp = drm_int2fixp(channel_value);
 
@@ -429,3 +429,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 	return ret;
 }
+
+#ifdef CONFIG_DRM_VKMS_KUNIT_TESTS
+#include "tests/vkms_color_tests.c"
+#endif
-- 
2.44.0

