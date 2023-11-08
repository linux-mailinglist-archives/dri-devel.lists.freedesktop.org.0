Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0267E5B60
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA50510E7CC;
	Wed,  8 Nov 2023 16:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC36E10E7BA;
 Wed,  8 Nov 2023 16:38:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mw6vrCh1+m03KS4j+Tep7rEx9zSvXRdZ0JBgk/RwWl8Z9u+UtOzsADEE/jK88CAhL6tFo662JLlezBaDuME2kW4Lo+FK+Xbth+SiwM6WWy7VpgYUwPrpiwfl22ceyQv/RoFlHVmMQiSywKwFiBx81jo8pTV7wez3kHTaG+qGrh0v0nrzJblqsg25cVuCEXmrjtliPgT49puysHBbjLeJhgCIHqBLxzPCoKi/IuAemrTX7gqaZEw2AN68sBnpjl9dpEGuRiVJrygoDg2/qQwtNq50UKWlTeYUyrIA+QrVBOEefTntkhEwlVtalQtnSVaWXPWMHLMltbuM+dAGmpueNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9L4ftbPp6MUO2LeV8x/oyM4UfgB9GnFuvp/F61RgIAA=;
 b=Cy02si0qQneobVH7+PGg7hMdrKGqA+Tw3qqj5X2G31boMzqlt0wEQvfZIXP78TzmbZsQ2R9zrJsvTxXDnF5GO3Jpvx8njJxKhy7HUker1qlVkESYpblUyZHi4HkdYDDoOIcAN/dEVNgaikN7zvSzwP/rZyufOizHaaZcFhbzEQGr0OUOBTfbYbLwoAnzf4ogFQlIU1YpuANhIdM5Al2gTNBBmCEyvv4wJlnsZ8ZgpmfdncbJhRIpjdclraxIOnudun2Ndlz3xpvBHI/xoWt6qA/F8+fTTMi5rSpaFQKhg9sRVtTfNz7uSVK+yRRB2idd/7t34NPC+XMVeYKZ/JUsJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9L4ftbPp6MUO2LeV8x/oyM4UfgB9GnFuvp/F61RgIAA=;
 b=UvjctXoD/41YeHbmp2S00laic1E05voydF3grLprQqWcGfXzD+JVvpGxNXkLRbikNIzegKdtnLO0Iao2UUF+tz4RbQD3GkMO5qVdz92w2TBq7Q6/yaPHepcyaCler6qPN5SbmV/C6JHBvh149HS1K3Cy4ino223/WQR9H9l6Tu4=
Received: from DM6PR07CA0125.namprd07.prod.outlook.com (2603:10b6:5:330::7) by
 SA1PR12MB6773.namprd12.prod.outlook.com (2603:10b6:806:258::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:37:58 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::aa) by DM6PR07CA0125.outlook.office365.com
 (2603:10b6:5:330::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:37:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:37:58 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:12 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 08:37:11 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:11 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 04/23] drm/vkms: Add kunit tests for VKMS LUT handling
Date: Wed, 8 Nov 2023 11:36:23 -0500
Message-ID: <20231108163647.106853-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|SA1PR12MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c84415-a14a-46ce-284f-08dbe079111a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: spKCFnwjTIUqsUdiBK36xV4F0YP41XSSPql1/zXL6xegD0AO6ohSsqAqEkB+9xTW6sJIRy79udgc604YV5Y2p7paE+UHCrML0pD2S9/l+rKxDDAH0MReCo6Vwwx3jR5JnUSDIPpTcEVRlMNVd367knYRnIhhlu6Q0MBtwBTV34gteBBP44H7rwnOXxbtJz3brgzzGE2C38NvVcrkr28o8IAOocwPtWTfmpbq6W6t3LzSAEQCNlGvOIC2TN/04GYd7VDPABTqtxEjBZMZCjwhtzXfrBPWWoc8O9kAoH9nnpLgyCsMwgibnAEwMgz9KGc7oC/cwxfqDChI6Q/nDhLCf3SLsbsyZt5HXJB8c54/ZpGysL67qmdgnqZFQD0R+Z79dGRAQSyMBYFPBXD8oRXaF/9p2AqQHjVkV8JB9MWchAPa9q4lb/oFx48752YfGxEVjPtWfrGk6WiBCCgLXUrIj9fjCwaoSkMOWEbk5SWuVMnuNYgx6Pi1blK3k2bFoKIUPd6Otcc7YGJKagiAunACPW+BptQchYibIBrk+bSLxt2bfgAWNObJSRP9mP5RgAic5Icap+aKly++sICOCxMrSLA+KuGblPBetlLwJDWTZwPoVz0o++2Ns+r/aJV9zfVwT1diUQnKfvTlTZbVMn1y7iHvhPppGcYtBti+qClqJ1Hbuv5b1a7VmThR+bOlPE9zXVo1PRFSQ2wzF1HEb1njwE9mq2mB6xec+KjEdRLVzNxmTDeeaCG+VCACVixzAZYYwPVPRgHPQPvav5BaBCOZvw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(64100799003)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(40460700003)(2906002)(40480700001)(5660300002)(8676002)(4326008)(356005)(81166007)(86362001)(36860700001)(47076005)(83380400001)(41300700001)(426003)(70586007)(336012)(82740400003)(70206006)(44832011)(8936002)(1076003)(2616005)(316002)(6916009)(6666004)(54906003)(478600001)(26005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:37:58.4554 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c84415-a14a-46ce-284f-08dbe079111a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6773
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
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Debugging LUT math is much easier when we can unit test
it. Add kunit functionality to VKMS and add tests for
 - get_lut_index
 - lerp_u16

v3:
 - Use include way of testing static functions (Arthur)

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/vkms/Kconfig                  |  5 ++
 drivers/gpu/drm/vkms/tests/.kunitconfig       |  4 ++
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 62 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c          |  8 ++-
 4 files changed, 77 insertions(+), 2 deletions(-)
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
index 000000000000..b995114cf6b8
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
@@ -0,0 +1,62 @@
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
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, 0x80000000), 0x8);
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
index 3c99fb8b54e2..6f942896036e 100644
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
 	return drm_fixp2int(a_fp + delta);
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
2.42.1

