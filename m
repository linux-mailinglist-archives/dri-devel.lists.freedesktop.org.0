Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A66C5FA65
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E93110EB59;
	Sat, 15 Nov 2025 00:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0x9o4mDQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012010.outbound.protection.outlook.com [52.101.48.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12F810EB5F;
 Sat, 15 Nov 2025 00:04:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEabwmbpedvLBXBtGJpgK/H0DRcH6CjOISVigudLbbH0TDho80jt1iIos/tnyzT82MrglhybpTQCwaIzjncsHCK1RmsKHPDC9rRgovdXCNecckVIUxmAICC3R4WDWQXyJvf2XmziRWylZRpxybPucj11OFieLHkDGIUfOqzw0gRxmxjBm3X+wUlhw4pHWWVvz1PddmwIEVeVkysLDGwGALZZXzRlNlnHV5ZWh8pgBkbYs2csRfnd9olpDYmE3wsJbbWn6pHbftscAd2wkU3DDleAC680Z4JqSYUiY4dZPE/ot1zKcLaMRnj9d7qKb2fAI8dp4HTaCtYz5AtZ6CUjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5wnJOaWSVyGvgV4u9mp+lhe89AXf4lmDg2ZqJ1lGzo=;
 b=QAsUwMS9CVhAHvxYIr/wnC3ra4YpC2WO0tuDuSsw3BNkV4HwCWdoYXFeMX41Xp+RzYUg6UmMBiK8dKvav9ePDVjAQltINFRa5d+QXcMdMp3MrD9cyTctqpfAodpD2ETLttadl5Fc9hRcEcMQILWZoA4SiHk06nAKENSzNPcnO3GiMKSdDJDAya5tADp4OxLe4K3ykfgXrofdGcB3ljwrBCgZZ7wYRPvg8vVVYQ/er/Yzi3fVjZCrNcXJvgoaZEuaG/uZ66sI95kGuAQ+YzpedX7EDmiwcrP/Xz4Uuoo4Mr+1yj6XOpf8Hp/yuDbZ8Uzknz91hLJ85H9m0kPmzklDpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5wnJOaWSVyGvgV4u9mp+lhe89AXf4lmDg2ZqJ1lGzo=;
 b=0x9o4mDQOBumr4b1UA4nx+gRHbukeaYYUlhMi9SGDlQNgwNFy68tycFvqgyx2gUHvbxjXusXj+1fmOJSGZF//QLxOzq/fxCqDjxBn1dD75eDcEAw86YygWXfVgE0Gagsyr0WfrWIMzqsBLI2TvgMDpdSIyRqwxXwKjZSZUiB06A=
Received: from BYAPR21CA0002.namprd21.prod.outlook.com (2603:10b6:a03:114::12)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:04:17 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::27) by BYAPR21CA0002.outlook.office365.com
 (2603:10b6:a03:114::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Sat,
 15 Nov 2025 00:04:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:04:16 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:04:12 -0800
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
Subject: [PATCH V13 02/51] drm/vkms: Add kunit tests for VKMS LUT handling
Date: Fri, 14 Nov 2025 17:01:27 -0700
Message-ID: <20251115000237.3561250-3-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 794de81b-3638-49cb-d305-08de23da84bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmFaOUx6L1o0NGVveFVHL0Ira3NMTEwrZFlxU2pwSTlzR2NabGI5WjRCOWNr?=
 =?utf-8?B?dWx6aVpzSjZZNWdpOGhvZVRIcUZhN1dmSU1WRGtrMEdLaGs4NkpXVjR2QXN5?=
 =?utf-8?B?ZjY3eE9aWVh4UFZmYTROWEFDOUJFWS9kV09oY1dlRUFzSFFCN2tkN2N0dXJ3?=
 =?utf-8?B?WnpHNmNpQzJXK3hMUkw2WkdrZkFhcE5jOWFLWmIzL2c4MDRDTXZzNnhsNU5y?=
 =?utf-8?B?YTBHUVc5aGxOaC9MQW1SNURHNmlpSWsvZ2NlQVR3dk5yUk9JTmlPeEpDYlVW?=
 =?utf-8?B?ZVV4bjhNV0cxa3RYSDFIbzJUWjBQMUg2YWFKZURWcEFyTE03RnhCN1JQSXVi?=
 =?utf-8?B?aWdFeFNPRkxiWm5KSDE3OGdQZ09zY21UbnJnQWcveC9DSFVZdGpyWTNRVFVy?=
 =?utf-8?B?WkF3UnMvNmFMa1dab0pnaUYyRmFEb1JjaG5Kc1NhOEVvRURFS0JRNXB5VHBv?=
 =?utf-8?B?MXJrS1lJVTVtSTY4L3RXU01DWi9Gay83S1ZMY0JNQlc3ajBBKzJaYnZHYnZE?=
 =?utf-8?B?Z2Z0MXkxUVlOb2puWWZJUXlnWGx3cGxWNk5VcGpHcFY2STMyYktTTDBzOVpz?=
 =?utf-8?B?NHIzdDBpVVVJTy9vdXlTdDFXWURoTGswTHdqcVg1RnE5VHpyMHBjcWQxMTFT?=
 =?utf-8?B?OU1JSmNkTWxPMkxlL3l4RGI3Z1JhRE1TNldJZE00cERLdmdOd0xCdzQyQmtY?=
 =?utf-8?B?a3lROXFCZGFraDBJMzRBbWJxSTh6VlAvM05SZ1RkVG8rR3FyOGxkbEFRdmNZ?=
 =?utf-8?B?TEgrNHpmMDdKeHBtUEdha1FQeTVzUHh5U3VOYmZwTHBZWDBNOFJOaTFwMjk4?=
 =?utf-8?B?bGhtMkpJR0YyQlNjOUV6dk5LdDg5TFdWWWF5T1BvUWptTjFYbnBBbHdHczEy?=
 =?utf-8?B?M2U1M1FmanAzU2dzREhPNHRiTkFVb2IyRmV2L3NSdDFvYk5tRXdDRHNON0kv?=
 =?utf-8?B?Z1F5NmhJNFJGb1l0NGFPOWFoNHVpdEkrZ3ZtOGRDVGNTb21NekhYUkRxbFd2?=
 =?utf-8?B?MUw2YXM3ZE9JcTJsbGthanp5Vi9HcFRmQTJQaUlLV0hvTFlRR2k1KzZnZ0lG?=
 =?utf-8?B?ZzBZcE5aN3V4bVdwaVNhWUdOR1NIOVNpUW1paDNhazhqVU9OaTl3bi9yQmVB?=
 =?utf-8?B?bm05bVVsc3ZMQ2o3Mk5MOGEzRXI0eWZiYi9nOTE1eE5hdXYxS3VsR0RzdzVO?=
 =?utf-8?B?dnFzbmE2cjZkc3pTVEtDWGtWNGZna0ZRdzNpc0pLMGF2eFNsOTg3dlhxU3h1?=
 =?utf-8?B?UlFCSmt3eG1DdHhjMmFxdy9KYmlJYkQ5TnlLU20xWDhIVFNTOEtQTlgrRzFM?=
 =?utf-8?B?WW5xamtjNVhFaWVpbTdrWjRZWDRuUWs3eWtoYWM0SmdLSVFZbmJMR1FTalQ5?=
 =?utf-8?B?dkJmd3FPRHBaWFNON2UrVTlMdTVNWmVMVnNSeUtKRGxuRzBhTURlS0hsK2My?=
 =?utf-8?B?RmZLOFRMNnVGSFFOamt0Ym41R2FrdzhkTXQ2RXJNVWdxL1pMWG1qbjdGWThU?=
 =?utf-8?B?d3NncUpZU1pvSUx5a04zZmxvcnB0WjlmTjVJUC9hYmhhZVJhWEoxeTBENkVB?=
 =?utf-8?B?Rk9hdTNxN0pWMXZrdDQ1MmFqditKN1gveE02Nzk4ODcwTUZ3MlJ6L2dsZHdP?=
 =?utf-8?B?WnZqa211RlJQaFFIWjR0MTVHWkRKcjNoV01Ja2oxODhlQ0w4aGxyMThkaWdW?=
 =?utf-8?B?Y3JNOExiTlA1eHhlbEVTakZHcWYzWFgzQzVVUGE4Z1NjblZZQnVoWEwwLzV3?=
 =?utf-8?B?aGtKWWNOeXV4ZlVsbWsxSEVjeUwva0ZSbUJCdmlreGlCdE9Nd083ZXpSbXFD?=
 =?utf-8?B?eWJPYkYvU2JxU2EvT1hKeDU5Mmp1c2REQldhT0xLRFN5REQxQytmWTVKaTU4?=
 =?utf-8?B?dGxqcWRvZXBLKzhpWTFHcFdCRXIzYVhmcE1mTzJQSm1XUHdyVjQvSEltRjlY?=
 =?utf-8?B?ZW10SFpTYWQ5dEhEazhjKzhKK0RvOW5XTEluUTlFd1cwcGw3RmFtcmZsamFR?=
 =?utf-8?B?UlBMS2k0OU5YN09BZzByT1UzdktVT05MY2psamIzOTNMMjlvQTNPVU9wYU9I?=
 =?utf-8?B?MC9abytXa1BmM0pnb1JGc2tkS0pCRE1uM0pEeG1ZdXNBSjFoa2NEUmx3UlNZ?=
 =?utf-8?Q?AIQA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:04:16.8719 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 794de81b-3638-49cb-d305-08de23da84bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v13:
 - Update vkms test Makefile (Louis Chauvet)

v12:
 - Reorder header files (Louis Chauvet)
 - Add header file "vkms_drv.h" to vkms_composer.h to avoid compile errors (kernel test robot)

v11:
 - Refactor vkms_color_test_lerp() to parametized tests (Maíra Canal)
 - Sort include file alphabetically (Maíra Canal)

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

 drivers/gpu/drm/vkms/tests/Makefile          |   3 +-
 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 130 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c         |   9 +-
 drivers/gpu/drm/vkms/vkms_composer.h         |  14 ++
 4 files changed, 152 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h

diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
index 5750f0bd9d40..d4d9ba8d4c54 100644
--- a/drivers/gpu/drm/vkms/tests/Makefile
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -2,6 +2,7 @@
 
 vkms-kunit-tests-y := \
 	vkms_config_test.o \
-	vkms_format_test.o
+	vkms_format_test.o \
+	vkms_color_test.o
 
 obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
new file mode 100644
index 000000000000..582fae1f3220
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+#include <drm/drm_fixed.h>
+#include <drm/drm_mode.h>
+#include "../vkms_composer.h"
+#include "../vkms_drv.h"
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
+/* lerp test parameters */
+struct vkms_color_test_lerp_params {
+	s64 t;
+	__u16 a;
+	__u16 b;
+	__u16 expected;
+};
+
+/* lerp test cases */
+static const struct vkms_color_test_lerp_params color_test_lerp_cases[] = {
+	/* Half-way round down */
+	{ 0x80000000 - 1, 0x0, 0x10, 0x8 },
+	{ 0x80000000 - 1, 0x1, 0x10, 0x8 },	/* Odd a */
+	{ 0x80000000 - 1, 0x1, 0xf, 0x8 },	/* Odd b */
+	{ 0x80000000 - 1, 0x10, 0x10, 0x10 },	/* b = a */
+	{ 0x80000000 - 1, 0x10, 0x11, 0x10 },	/* b = a + 1*/
+	/* Half-way round up */
+	{ 0x80000000, 0x0, 0x10, 0x8 },
+	{ 0x80000000, 0x1, 0x10, 0x9 },		/* Odd a */
+	{ 0x80000000, 0x1, 0xf, 0x8 },		/* Odd b */
+	{ 0x80000000, 0x10, 0x10, 0x10 },	/* b = a */
+	{ 0x80000000, 0x10, 0x11, 0x11 },	/* b = a + 1*/
+	/*  t = 0.0 */
+	{ 0x0, 0x0, 0x10, 0x0 },
+	{ 0x0, 0x1, 0x10, 0x1 },		/* Odd a */
+	{ 0x0, 0x1, 0xf, 0x1 },			/* Odd b */
+	{ 0x0, 0x10, 0x10, 0x10 },		/* b = a */
+	{ 0x0, 0x10, 0x11, 0x10 },		/* b = a + 1*/
+	/*  t = 1.0 */
+	{ 0x100000000, 0x0, 0x10, 0x10 },
+	{ 0x100000000, 0x1, 0x10, 0x10 },	/* Odd a */
+	{ 0x100000000, 0x1, 0xf, 0xf },		/* Odd b */
+	{ 0x100000000, 0x10, 0x10, 0x10 },	/* b = a */
+	{ 0x100000000, 0x10, 0x11, 0x11 },	/* b = a + 1*/
+	/*  t = 0.0 + 1 */
+	{ 0x0 + 1, 0x0, 0x10, 0x0 },
+	{ 0x0 + 1, 0x1, 0x10, 0x1 },		/* Odd a */
+	{ 0x0 + 1, 0x1, 0xf, 0x1 },		/* Odd b */
+	{ 0x0 + 1, 0x10, 0x10, 0x10 },		/* b = a */
+	{ 0x0 + 1, 0x10, 0x11, 0x10 },		/* b = a + 1*/
+	/*  t = 1.0 - 1 */
+	{ 0x100000000 - 1, 0x0, 0x10, 0x10 },
+	{ 0x100000000 - 1, 0x1, 0x10, 0x10 },	/* Odd a */
+	{ 0x100000000 - 1, 0x1, 0xf, 0xf },	/* Odd b */
+	{ 0x100000000 - 1, 0x10, 0x10, 0x10 },	/* b = a */
+	{ 0x100000000 - 1, 0x10, 0x11, 0x11 },	/* b = a + 1*/
+	/*  t chosen to verify the flipping point of result a (or b) to a+1 (or b-1) */
+	{ 0x80000000 - 1, 0x0, 0x1, 0x0 },
+	{ 0x80000000, 0x0, 0x1, 0x1 },
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
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(color_test_lerp_cases); i++) {
+		const struct vkms_color_test_lerp_params *params = &color_test_lerp_cases[i];
+
+		KUNIT_EXPECT_EQ(test, lerp_u16(params->a, params->b, params->t), params->expected);
+	}
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
index c1ab12a44621..5127e3be9e1a 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -11,8 +11,9 @@
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <linux/minmax.h>
+#include <kunit/visibility.h>
 
-#include "vkms_drv.h"
+#include "vkms_composer.h"
 
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 {
@@ -61,7 +62,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 }
 
 // lerp(a, b, t) = a + (b - a) * t
-static u16 lerp_u16(u16 a, u16 b, s64 t)
+VISIBLE_IF_KUNIT u16 lerp_u16(u16 a, u16 b, s64 t)
 {
 	s64 a_fp = drm_int2fixp(a);
 	s64 b_fp = drm_int2fixp(b);
@@ -70,13 +71,15 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
 
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
index 000000000000..45f5e6a4986e
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_COMPOSER_H_
+#define _VKMS_COMPOSER_H_
+
+#include <kunit/visibility.h>
+#include "vkms_drv.h"
+
+#if IS_ENABLED(CONFIG_KUNIT)
+u16 lerp_u16(u16 a, u16 b, s64 t);
+s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
+#endif
+
+#endif /* _VKMS_COMPOSER_H_ */
-- 
2.43.0

