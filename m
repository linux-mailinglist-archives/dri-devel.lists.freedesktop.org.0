Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0174EB27752
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F30A10E9E5;
	Fri, 15 Aug 2025 03:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CiP8Cu0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0B810E9E5;
 Fri, 15 Aug 2025 03:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHdfGk9z68yODTf6Kq4mP3nw56Tm65zT/MJvlHbgNOtmEYnp4ThC8E+kG4DLnnL29p26FcrAiBbuswrQmXOJ3GmGkslQ/fIftfvPE6pjq10WN3VuVNd10ext7bPg5bVXs+HFBVXVtxPG/2nrAz9W3fDVW0h1IIE/tZr6jVFD0/SGsay8U6zKmFcmTXsWBd+Uulz+Gz1FJuxYz3/Neh4eDFusgtNzegaRQjpUX/eZxYZF96KQW7SPUYWDNFE50dxHnYu3zKNnojTUod84AmAspVi4UT3pIAo7PQv2L3bJKqYbDNyxoT/0+9xnfg9yrDuGxJHFLvpAyfsRxGJqtUs32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9KJuem+5RIfi1VVaGOhFiGieNwDMnJBKnoDHoLvCIk=;
 b=W2HLqwx3OmxO9iF/U4EtRO5LXkhYSZIWGvhwniDbCiX31jwi7ykwRjHTLlU10Tkc7trggMJTkhcD/cokX+maI53GEjnGm05pzIOEElioBKC+LXm+PaVoGuVeO7mRuOTc135asVG4T/W9iCABncD89XBHWUL4hai05gbIl68h/6TGjQh7gpthxPL/8l3C/xsdv9mtqX6jH4LGoE6VHfbV7DlXyp8EreUkkxLp/mv9jxSfwRdECC/Lqm6bNQaPYEfVC8UxevsvEnPOsTYvTHh2c5tTlSkWfM1vnJ11PoQooQ9igfwhNF6uevmEtuEBd5ltsnuwIlgfUG5cNVHHFcTT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9KJuem+5RIfi1VVaGOhFiGieNwDMnJBKnoDHoLvCIk=;
 b=CiP8Cu0M9y+Z7a+CxIUPd45EDDZRK8BzY2CqfR1drtl2TYQT4nBXeetP+agEeVVTadNgrMu/EPPoSun78FWAsxo8DZIq/3Peii5pQXT+l+0cS4ENdHQ0IFjOSD+kWpTYj5L8XHpSYJ0h9ZlhVHg497n62POQ5JPIDj81wgaY6O4=
Received: from BY5PR13CA0015.namprd13.prod.outlook.com (2603:10b6:a03:180::28)
 by CYYPR12MB8921.namprd12.prod.outlook.com (2603:10b6:930:c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 03:56:14 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::5d) by BY5PR13CA0015.outlook.office365.com
 (2603:10b6:a03:180::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.6 via Frontend Transport; Fri,
 15 Aug 2025 03:56:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:56:13 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:56:09 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 19/47] drm/tests: Add a few tests around drm_fixed.h
Date: Thu, 14 Aug 2025 21:50:08 -0600
Message-ID: <20250815035047.3319284-20-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|CYYPR12MB8921:EE_
X-MS-Office365-Filtering-Correlation-Id: ae68070f-aa3d-47f2-7c65-08dddbafadb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTRQSVNteDhEOWZ0aWVsZnhkUVZvbVc5Zm9MQThmMEVIY2dHUlc2OSs5Zmxw?=
 =?utf-8?B?UnRpQitUV3U3U1ZMY1dSb1FqSEZiNllGRk9BMGNOdnBleGRCUGRnbWppQjFj?=
 =?utf-8?B?S3lEVXVXMnhxMXA1dGxnTDJUdzExdGZRUVI3aVBEamhpY2NBVkNUZHhtNUVV?=
 =?utf-8?B?SlIxU3REMWE5dmptVHJxU0dSNzNwN3R3cHVxMU9Xdk9VbExld0ltTmE5aGZn?=
 =?utf-8?B?NkdHaFBkT1lYTXo1ekN5b1ZSc0swREYreWhKdndvNmpCaTh4N2dWL1pUMm54?=
 =?utf-8?B?Z2phU1gzT0NjR3IrWXVkR01ZbzRsWFB6Q1hLYTlTTTRiVytTVS9adGlFYjR4?=
 =?utf-8?B?cUNtbnZLNlN0aTRvYkczQTN2Y3ZhanJZcFlBZjVQMUlCc3ZFRk9ya2lpdm1h?=
 =?utf-8?B?OTNSRVhXRFk3Q2RuaVpXWG1zZ1hsN2lpVExsbHNQRWtZYkF0T3hhMVlxbWZW?=
 =?utf-8?B?R3JJKzNrQm0zL29XQ3FjNUhjdWdBSzdtTEpXRnM5Z2lGd2pNNTdsYkxSOGN2?=
 =?utf-8?B?RTlDNE9vWkRoOHlvWUFGYXIwY1o3VkRkUGVxS2JBNzNzWVNMV2NUSS8yU3Ex?=
 =?utf-8?B?OTZTM0l4d2xqaHptSGV3S1R3TG5yMVpOWGliN0oySzlZUFNOOUF1NHFRcmN3?=
 =?utf-8?B?NVlIV0xkWVRzV1YzWVpCbS9sbmtkRksvR2xjVWwvVURhanlES1VydjBrcXR1?=
 =?utf-8?B?RkdrSUN6ZnBuaEpGOGgxR2cwQ2hyS1BiMCtLdFRiemxHV0kxQlUvNnZ0V25Y?=
 =?utf-8?B?cytIL1dQSStFUGlLZzhUN1ZIWG1BSXJrSGJZS3ZzcGNtZGxBdk04NFRkNWp0?=
 =?utf-8?B?MWlWUFV4cWIycXVxaHNwWFMxRzlXa0tTZ2duNFUrUk5uak42V2ZLUXoyUDZ3?=
 =?utf-8?B?eEcyNEY2T29nUW1CYXh3QkNtcHR3ckJZb3NVRWxpTGUzZGprTEpUeGVLTER5?=
 =?utf-8?B?UWp1ZS9ndk9kTCtlWFBHT2IvM1gyRVJkL2x1dmNVWlczVkhLaDJYbHl3b0FZ?=
 =?utf-8?B?WXQyUW1laEFZdS9jSEMrclg5Y2ZhaXh2YmtudHp5ZEdNemcrTzc5Q2RwOSsr?=
 =?utf-8?B?bTBYejlJamZYNEx3SFRnNGFVbkhqbjhnL2ZKR290UzZrSUI1MHA5a2J0VGxZ?=
 =?utf-8?B?c2dZbjZDalJmZVRxckJRSFhwOVZ6bWpVNzVWY2RvRTIra1hucDV6NExBVzd3?=
 =?utf-8?B?ZzhpRmlGdjZmTFpndzJxcnBxYjR3TzNHZG9ZbnFvL0RtR3NNV0VvcENiSFM0?=
 =?utf-8?B?eXo0dmVlSWw2WUh6Yk9ld1NLN3dUVWxVUi9aTm54eGZ2dENxQjVxSGR2d0Vt?=
 =?utf-8?B?Tk1lMXBUY1hQTnFZeDhKNFJGNit4OUFLUGozZExCNHdlVitnd2g4WDQzakVh?=
 =?utf-8?B?cmM4N2Z5R21yZEdGT1k4OFNMSHIwQzZwMHp4U0RPaHIrM3E2dUpoSUY4bWRH?=
 =?utf-8?B?N3E2REdKWjVpbERXTzR5RjJrRnpnR0YyTUNYaWNkczMyQjhHUStOdUsxNkV4?=
 =?utf-8?B?eWtjRlNaNEE4R1VoM1djcGJSWGdraGV1WlEvTHl5SmpRNEZpQmNQNXdEZVBW?=
 =?utf-8?B?MVJLNGFsOWJTZm9qRUJpM2NHNjEwOU4vZ3ZSTHpFVmI0YXNZMWpMWmJuVG1H?=
 =?utf-8?B?bGxRMksrZUlmUjBER0tNRm9DNDJoWjl4WEVOdmRlUnlVU0V1eDZYZVg4UFRU?=
 =?utf-8?B?d2tNc3I5WUgwUFQ3N3dIbHYxOVlDN3Q3VUxTRy9nUW9SMDJDV0dNMlVFcnAx?=
 =?utf-8?B?dUZCaEhMQ2tYYXlFKzlGaDFFZC9UMG5ld2pMclpVUzZUTFZnYkVSY2ZJWUtm?=
 =?utf-8?B?VWhrRHUvV1U5dGk4RlpPd2tHT2NOVlhqVnBlSVpDUnZHck1XUjA4N2I0UlpB?=
 =?utf-8?B?M2JRNkRRMU9WbEtoQk8xUmdOVDUrSjZOa1hqYnZmcTNScDYzYm8vdDE3TU54?=
 =?utf-8?B?NVM5RkdUeFNYdURwd1ZNOWFiS3dEZU54a3pXUkFQTVB1bEZSaCs3Sk9wb2Jt?=
 =?utf-8?B?VHVtaVBCNDFBWE8wSWwwQ2FDTGJUeDdEVng0elYyK01FOFVEQy9DcVhrYklm?=
 =?utf-8?Q?8BlUnU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:56:13.5891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae68070f-aa3d-47f2-7c65-08dddbafadb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8921
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

While working on the CTM implementation of VKMS I had to ascertain
myself of a few assumptions. One of those is whether drm_fixed.h
treats its numbers using signed-magnitude or twos-complement. It is
twos-complement.

In order to make someone else's day easier I am adding the
drm_test_int2fixp test that validates the above assumption.

I am also adding a test for the new sm2fixp function that converts
from a signed-magnitude fixed point to the twos-complement fixed
point.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v11:
 - Update outdated "drm_rect_test_suite" to "drm_fixp_test_suite"
   (Maíra Canal)
 - Update outdated MODULE_LICENSE to Dual MIT/GPL (Maíra Canal)

v7:
 - Fix checkpatch warnings (Louis Chauvet)

v6:
 - add missing MODULE_DESCRIPTION (Jeff Johnson)
 - fix buffer overflow

 drivers/gpu/drm/tests/Makefile        |  3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c | 71 +++++++++++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index c0e952293ad0..87d5d5f9332a 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
 	drm_rect_test.o \
-	drm_sysfb_modeset_test.o
+	drm_sysfb_modeset_test.o \
+	drm_fixp_test.o
 
 CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
diff --git a/drivers/gpu/drm/tests/drm_fixp_test.c b/drivers/gpu/drm/tests/drm_fixp_test.c
new file mode 100644
index 000000000000..dd77fdedb2a9
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_fixp_test.c
@@ -0,0 +1,71 @@
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
+	KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1ull << 63) - 1));
+
+	/* 1 */
+	KUNIT_EXPECT_EQ(test, drm_int2fixp(1), drm_sm2fixp(1ull << DRM_FIXED_POINT));
+
+	/* -1 */
+	KUNIT_EXPECT_EQ(test, drm_int2fixp(-1),
+			drm_sm2fixp((1ull << 63) | (1ull << DRM_FIXED_POINT)));
+
+	/* 0.5 */
+	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(1, 2),
+			drm_sm2fixp(1ull << (DRM_FIXED_POINT - 1)));
+
+	/* -0.5 */
+	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(-1, 2),
+			drm_sm2fixp((1ull << 63) | (1ull << (DRM_FIXED_POINT - 1))));
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
+}
+
+static struct kunit_case drm_fixp_tests[] = {
+	KUNIT_CASE(drm_test_int2fixp),
+	KUNIT_CASE(drm_test_sm2fixp),
+	{ }
+};
+
+static struct kunit_suite drm_fixp_test_suite = {
+	.name = "drm_fixp",
+	.test_cases = drm_fixp_tests,
+};
+
+kunit_test_suite(drm_fixp_test_suite);
+
+MODULE_AUTHOR("AMD");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Unit tests for drm_fixed.h");
-- 
2.43.0

