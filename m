Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CC67D03C6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274B310E540;
	Thu, 19 Oct 2023 21:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B88010E545;
 Thu, 19 Oct 2023 21:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFU4zfOGjCjtxvLlWkrSx9+k0zOdfijjDlhJViD5KHr1Kio1bfJXnpcgqHZYIbLA71d2EveZuAZmgjvbIi2nSVokUTXkVax+XU3zlJRnlsTgi8MftZETcl6ZXL8I2aQvh3kgv4wTJ+sLBw3Y/GBc1wgKeOWTH7ZQHxXtGh0ipIRaiP2MiqzZ+xSSNzTsMZvycDT7r6xHpERgToYURjGyB1PG3TQUxpW7QKUU1NbXP5gwj5qM+Pm564Z89lz5XKgkx9kRjEXr/Jungn7Q/NAeig9As9i4LnGC/ZvO2imYjkYs1SB9TS4bmrgSCZZzbZ9tqMqAJ8cbHTpRNoQIRE71XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GclRxBmu5NVYrsQxBuoXS07ZIxXO+YUpKHyMpsOMrjQ=;
 b=mTo2OFsDHqgl3pPxE2tjQgAqBhEMBffFUjCmxWhRzhQhuS/HyS5dowjZJMhjOreq6p3QMJGUjkTLfAfjEGC5VzkC63ID+fkGCOGfb6bCM8dx8mfYAzvJGhSrh4gZKCOJaezNrtH9yKyDn0BuEuJJvW7P9bT9l3325nGRkPVa9AGLeycmw3oI0ldOW4TTXMJ80s9/S2YAZZ9PKoplKDv1hFC5fT+YI7qSsmwBLUwtI3EWOt8GP6aU4m9KcknHSGrsxzqqIRKDLd5v8LudvQJOz6Fsy7emhAG+wJ7/dmmS7CB1R48S96m5NGhChjui81pvf98kCsjPIPdo0cVZUU0nZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GclRxBmu5NVYrsQxBuoXS07ZIxXO+YUpKHyMpsOMrjQ=;
 b=uP0TKIEp6KxsrrHGf2UN7xYw5BGHOIpn1YWe5N+8KaqdLl8xVPEqRCOoMbr3+jyjyXZ2glj6SUdlUfP8HwWZvB4AlCRf5GJjfHl8yNXnWj8vajMgFukscqt/375n3A/tyI4jm+QULCwQCRH1bPGOvE8lS24gRCcdnxVTBm8kE/M=
Received: from BL1PR13CA0325.namprd13.prod.outlook.com (2603:10b6:208:2c1::30)
 by PH7PR12MB6562.namprd12.prod.outlook.com (2603:10b6:510:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Thu, 19 Oct
 2023 21:21:57 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2c1:cafe::9e) by BL1PR13CA0325.outlook.office365.com
 (2603:10b6:208:2c1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.18 via Frontend
 Transport; Thu, 19 Oct 2023 21:21:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Thu, 19 Oct 2023 21:21:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:21:53 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 19 Oct 2023 16:21:52 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 04/17] drm/vkms: Add kunit tests for VKMS LUT handling
Date: Thu, 19 Oct 2023 17:21:20 -0400
Message-ID: <20231019212133.245155-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019212133.245155-1-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|PH7PR12MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 04cd6582-e60a-4dd1-3a2c-08dbd0e96c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 07sA1JL0rm4ebERK3lXz0+BIXfpi7Z6LBvsvnyWbXXob0tI3clnR6DiKsYi2+yBb6D+ImbmiJN5oCW2fREwrSPgz9Elu4IdtQRmulrUG6Vq0r3I1W5vYQTq816FnTIs2LSMEfcesLGTqm47mNkZHzQcnEqHuur3AcTVbU/zc/jBWkwU4fOJ/PL/u1kxITDB9tOCS6MN8+8HYqYb03NoqIE5p/MBH9OhLQ3LMq6KJBOGIVgu9HPGsjzbc+zpaq6g4rHGis5kmQ8TOP5GYZa+yo487Dt5gsogtj3L3S94h3IJ+APJu4QlMj0rgHNtcyAOgWh2KFhKWmgO/k+nAIo4r7mR6w7kdRXxb0WYU6111Tewe/G2MRuI9aOfQ7SvZrRz1/LKLHB0gIjPNbyErGakNW/+b9Jr2lpVoe4DkjEAj6nKoebHnh+y9P7a8MY+xDqNeXzlBod8jqVMppXhwf0ITAMNaVE+OHTUrVteNgjZlkjTOi+Pbnl8F9xVqPhzh8IVWGjrQm4oG5J1KA9Fn3K5jl6+i+bLJEHs4kaQD+6PYxL/D8e5p8FZm4lN7Ma2bPLgEuvqFxtxfwBHqrThupTzbsv7Zf8GC/9581zXdvFm8Mx2NZb1xwXhn2Qo2PhdCUCJY4lXq2dIEOhNiWMCW3Ondfb2JvS+9PLwRaO+MWGRW6yrcS+gL/WbyCHDfeoI+BcSXoIrU+Aeybs4Gpp1GBNABmYq6wpEfOvL6Ci11SEGQUadCLAzH+4FisUUDlKQWcg/ss6P7DARrWK9ULQCejAR09g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(82310400011)(186009)(46966006)(40470700004)(36840700001)(40460700003)(2906002)(70586007)(70206006)(54906003)(316002)(6916009)(6666004)(478600001)(8676002)(8936002)(36756003)(5660300002)(41300700001)(44832011)(4326008)(86362001)(7416002)(7696005)(47076005)(36860700001)(2616005)(1076003)(81166007)(83380400001)(356005)(26005)(426003)(336012)(40480700001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 21:21:56.7250 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cd6582-e60a-4dd1-3a2c-08dbd0e96c67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6562
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

Debugging LUT math is much easier when we can unit test
it. Add kunit functionality to VKMS and add tests for
 - get_lut_index
 - lerp_u16

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
 drivers/gpu/drm/vkms/Kconfig                  |  5 ++
 drivers/gpu/drm/vkms/Makefile                 |  2 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |  4 ++
 drivers/gpu/drm/vkms/tests/Makefile           |  4 ++
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 64 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c          |  4 +-
 drivers/gpu/drm/vkms/vkms_composer.h          | 11 ++++
 7 files changed, 92 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h

diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index 1816562381a2..372cc5fa92f1 100644
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
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 1b28a6a32948..d3440f228f46 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -9,3 +9,5 @@ vkms-y := \
 	vkms_writeback.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
+
+obj-y += tests/
\ No newline at end of file
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
index 000000000000..761465332ff2
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += \
+	vkms_color_tests.o
\ No newline at end of file
diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
new file mode 100644
index 000000000000..843b2e1d607e
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#include <kunit/test.h>
+
+#include <drm/drm_fixed.h>
+
+#include "../vkms_composer.h"
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
index 3c99fb8b54e2..a0a3a6fd2926 100644
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
 
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
new file mode 100644
index 000000000000..11c5de9cc961
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_COMPOSER_H_
+#define _VKMS_COMPOSER_H_
+
+#include "vkms_drv.h"
+
+s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
+u16 lerp_u16(u16 a, u16 b, s64 t);
+
+#endif /* _VKMS_COMPOSER_H_ */
\ No newline at end of file
-- 
2.42.0

