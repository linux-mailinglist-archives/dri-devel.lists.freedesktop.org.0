Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E61C5FADA
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AF710EC12;
	Sat, 15 Nov 2025 00:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HsnVUzWo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012045.outbound.protection.outlook.com [52.101.48.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ED110EC24;
 Sat, 15 Nov 2025 00:08:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4/r1D4YXlZtMIEOCxxQv3phDnkBEQDurHcAU46E+aChaXU3iVfSUTrLABEPHt/70obO9c8RDSIDmZtkwkoy8DCYvIQOWXBEUjiU3Tcv5jeJum6sHCeWAPsJKTwc6TcploO34F8rFVd6DAyS6FQrKkqzvOiQyaRN8a7GeXUaIBf4rVIiRlPZ6DTd4fMqfCYC/HHEgU9UMHEn3dD5kCJkbnZPenmWL4T0yN28uUnrefq7m3BsANWMmY8hyfh9CzEMMvY0jae0uVxVzlcPCvUPwby5gkwh5XRQcbA+Oal5G0TlwonDdVPVs4QTQ87cgfMK80HEdd/sg/ioJK64+tsOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9KJuem+5RIfi1VVaGOhFiGieNwDMnJBKnoDHoLvCIk=;
 b=Xm+QOiI1f+heNuVqDzd/DZVLX2ygmqn70SYrjXMJrMAhxiHJpmSb6RtOIp6gpwLK+LfhVrz+We3sHDTDZT/TtCkCY1UddAt/zzthQbZNDH6uzVrvclew4MthQJUcpEdIzU4SZ7ETcQCs+8cW/0CQz8psGAzavrQmbw4oD4Jjpodg9Ps7UvKcUItQVticOiwlBJJ4qKfShhT7CUxnLmM0zvJHmtleqvKCTXmkvFAAW1ODlZxUbE3Jm+HUKNvfQulKjhAkv5xcV0vfl0YTyyCp8kPz+uAuNKb6Md8ldKb75PYFkUnuxDRW12BCZ7uyy0WSd77oanJCSKPGtx1GEW8IZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9KJuem+5RIfi1VVaGOhFiGieNwDMnJBKnoDHoLvCIk=;
 b=HsnVUzWo4HJ5L1XAI6giqv6GWHCBDtrePc0AXNHZbmJ8j29H2DTF4xLoriGWCbSqMF5niMtB8PGobGcJbZmpWjsml/yPHr4tHfd3+9sr54Ue1PSIohXPTPuiqtfbhblHwhVpH2IoRNE41V/r9rLc7QMzWf9/J5K3cu4Pb1dtYr8=
Received: from CY3P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:fb::13)
 by MW5PR12MB5599.namprd12.prod.outlook.com (2603:10b6:303:194::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:08:48 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:fb:cafe::a0) by CY3P220CA0010.outlook.office365.com
 (2603:10b6:930:fb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:09:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:08:48 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:08:44 -0800
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V13 21/51] drm/tests: Add a few tests around drm_fixed.h
Date: Fri, 14 Nov 2025 17:01:46 -0700
Message-ID: <20251115000237.3561250-22-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|MW5PR12MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f04665-c6a9-4c59-f38d-08de23db2667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmRUL3lpLy82RVFibUhWMUdsdFFoWDFUS3ljaHJ3U0dyWVphMlRXRDFuam40?=
 =?utf-8?B?T3NoMHF1cTd0MlhLeUh6aXRJNnNzYVpNbW5adjRkeUROUkZoZlRMckpGdVlw?=
 =?utf-8?B?ZlpXUFgwMkV2dVc0R25GdUZaRkRWVHZiY1FxenJtSWhFMi82aDdJV1lJS054?=
 =?utf-8?B?akJ2akExdUQxSHZBRjBkaFA4VVQvTGZDeEU0Um5GUWhhY202ZHFkOFZvOVBs?=
 =?utf-8?B?aHRzN2Vyem9jTXdHUzhUSit3SkRSY0JjZitxWUU1STcwK1dCMmVOTFJmUzFn?=
 =?utf-8?B?LzlKdFRlb2xJd2x3SUMwclBNMUNCWklwUzRJS29TTk5NYjI3LzAyN1dxOWVI?=
 =?utf-8?B?S0tkazVhVk5KN25tc3YxL1hGME5GM0ZTWFhTSHppRHliaUtKQy95S25XUHBo?=
 =?utf-8?B?WTV4Ym9kZ3BkNVJKUm9CaWtGUCtadWFleUFDSUhQWXpDdXZCWjdMOXNQbWN5?=
 =?utf-8?B?SERmQXBuYVk1YnFYYmRTMGFWUEg4b3ViYmhrR2ZjY1BYTFlUekVpRFhZZURR?=
 =?utf-8?B?V21WWC9zWGR0d2taWm9uaXU2c1NuTXVYOHpKeTNrYXJKUlFVU0hKM1I1K0tL?=
 =?utf-8?B?c2ZRYXNKWkFza1E1VUJLWHZUcHJRZEVPelJnNC9EaEJBVkpLb244UWtOYm52?=
 =?utf-8?B?U2JrNmh3UW9PcG1uNFBjbXdBVUxnREY0QTc5Tit6dTBMczB5b01USlZ2b1Vp?=
 =?utf-8?B?ejFRZHFwNHI0MFplSUpwVVJBWDFRQ2IwRC8xZWhEVmFDWWZrd3A5QnBJVXR0?=
 =?utf-8?B?cmIrNGdVSkQxWXBRb2NDVDNva1kzcm05MW5kcFZ1Sm1hcnhWR05lVEYxQ3NC?=
 =?utf-8?B?VjQyN01RUFlTWHR2ZHBMaVg1UEhqYW0rTkhUTHA1b2twTzJLNmVvWkxvWENu?=
 =?utf-8?B?cnoyVkFOMHdOdVdndVZiVnZLYWx0UjhMLytWR1NwclltZmw5VEM4QVY5cnk0?=
 =?utf-8?B?YkNxTm1ncUZoTFA5bm5lQU0zZEF4U05STW9HTWlBNUVRZDVWR2U4OFdLdmFa?=
 =?utf-8?B?VjgzOGVHSzFtWXJ0S0hwamRLZHVJbjdUcWhvTlp4a29DamR1NXBzV2hkTjhT?=
 =?utf-8?B?TGQxV2lTVkFBOTVzcWV1c2xzZlI0MHZ1RjZUbVZTcHB1UE9PRFhOOVV4a0h1?=
 =?utf-8?B?eWpqZ2g1Z3MzQVk4Rnc3UWl4VlhUbUd2S1lZME84R3duQ2ZyT1hrS3l5MUhP?=
 =?utf-8?B?eHR6YlgzSDhFWS9jS2dwOWJ2WUFVN0VPOU44bEV4QzN5NVpNNllnREhiRmV2?=
 =?utf-8?B?R3FDNXR0bHk0ZkpEd1hIcTQwMkh5NUo3TjJkbk9zMW96dWk2eGNqbFY4ZnNo?=
 =?utf-8?B?NGlHL21BbGVGTkJEdG5oNk9iWFFGUkFIay8yaGpoU3ZBckVoRHBUeXJGZUVS?=
 =?utf-8?B?VW13SVdtcmVNWnk1L3RzNEtMWFpZaG1BdnRXWUVtWVNnb2o3eEJEVXhHR0d2?=
 =?utf-8?B?WG5BRDVWTlB3UHRZclpteDlyb0w4dnBqK1hRZnJ4em5lcFQyNmtoTlFoOXZa?=
 =?utf-8?B?U3Q4Wmplc00ybkMrNzVWNVlHWS9PZ0V0UVkwdUkzNVJobnBIZWxZNTE2TDhy?=
 =?utf-8?B?UCtFdkpHaWV2aWREWWFiUm9ITTR1OFhibVBBb3AzV1dHeVNZeUtQUUFaYXN6?=
 =?utf-8?B?Mm9vNnVhUmRGMU1YL1JGNmVObGRYaUNjazhhRVBTRHdhZ2xYdG85aGUxUFVj?=
 =?utf-8?B?V2hRTGJJVnZ0Tjg4LzhiNHN5NFdPNERIOTNIeTJqeWpXZjFSTmdpdzEzUnNn?=
 =?utf-8?B?RjFHaXZxYWcrc3V0aXJlSEJXSFdnd0FMM2VNVmR6Y1l0RjBNUXpIMjhSQzh5?=
 =?utf-8?B?d3NHallPdi9wczRDRkVvR29EN2RjQkx2MzBkN2JtbjAwdVkyYktRbmZxdnJW?=
 =?utf-8?B?dHYvakgzQnpSTG1tRm9lRjUrSjVoL3F5R1pNbjlsNXpTZldNcGNyekpRWGFy?=
 =?utf-8?B?dUJwVmp3eFJwWGZTZVhyR1cvMHR6WTVNaGFpNUk5K09EeHE1RWk2S1hCdlYz?=
 =?utf-8?B?NXZ4MFhkOUtrRUFRdEVZTE5QeE5aL3pxTjhaUjcvbmltbk9JVG1XYzVveHNl?=
 =?utf-8?B?U1FJOHhVVkdSMkRob3BpWTgvdzRpdkYzRkVUUy8yRnJjdnY3MlY0OHdSamgy?=
 =?utf-8?Q?wklA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:08:48.1476 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f04665-c6a9-4c59-f38d-08de23db2667
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5599
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

