Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF86C1E3C5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A4010E88E;
	Thu, 30 Oct 2025 03:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4JzqVaiM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011025.outbound.protection.outlook.com [52.101.62.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E07B10E88E;
 Thu, 30 Oct 2025 03:45:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhSvsYfk+UdNAOh2GQ6Yj+tkO3bkQDZvWN0/iypVTxKW+au97SPyu5v0Lm98LJUiIA1ffkcmm4eO6UxKYKW2dirNHsnP0paIBOFrNp/ANnMaY8TWgRmn9zdskHICjSD4ymycoyvDErs2LkQyqx0R7pu61V1qNL4KHaDjXCaxCC+S/1rR7ZQt6HT+shgEShpV7T047Phg14gQCb6IHZGyfwjWEEC553LOgbygiM4JfFfEB6w/LKPXNr1wo2lYvBG2nZZnx4jMIXDnPuVL7uvALAlImnuUurjLuLOse5cGeVFBM12H8hDB8Mtm2Ykjj/g5B/1i+iC7Hwv5ESwdRssu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhnK2+ivw3bgYu0wirIaRctGcr/s32igV0cxdbW7X1w=;
 b=vAMegQ3Xb6LICpiTbedcJfd/VpXtrwcfcMxHsmQs+3S0OHG+oErL4/zbmR3UhEQorv2nA6VZf3GbAYBJVfGbo45mVGbcbAxVG3it4lCkm8Y0AlIHx/k6Lv00xeZYjq5qH+5rpX5To6f14SWxF1P9AKSVR1ngx/fcgiVhtIQIA8TSKZhaWka5/moUEnTqSB4lMcsoQ2zNVbLcbwoZYtwaccnj2iofb7frLBYV06sf1DJPD2t9I1d4O1x3uHRelSM4XkW1XJLSIWCqd96hJ21z1Vl6M9eo11DriEBGm5Rx0kmQDdrQVi40KhbgHb/qHRktAssZfDWibQqAb9Fe+5IKtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhnK2+ivw3bgYu0wirIaRctGcr/s32igV0cxdbW7X1w=;
 b=4JzqVaiMRQFt8JSFv4nmIOo5DJKZeMzyzhQqFJ5v90siLEpEDvFgVNf4+wczqdr8cJw4vRrDlBNq/fwYLYCjSMgDFbVMoVp033pR5r4nRF2JjzmkXfZIYUe53gqYTlqOGqOQPygNLCJEYeudVk8amw6uHyOR0VDrCYfM1/qaxyw=
Received: from BN9PR03CA0739.namprd03.prod.outlook.com (2603:10b6:408:110::24)
 by CH3PR12MB8536.namprd12.prod.outlook.com (2603:10b6:610:15e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 03:44:56 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:110:cafe::5d) by BN9PR03CA0739.outlook.office365.com
 (2603:10b6:408:110::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Thu,
 30 Oct 2025 03:44:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 03:44:56 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:44:52 -0700
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
Subject: [PATCH V12 02/49] drm/vkms: Add kunit tests for VKMS LUT handling
Date: Wed, 29 Oct 2025 21:42:07 -0600
Message-ID: <20251030034349.2309829-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|CH3PR12MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: 57118540-6628-467a-364a-08de1766b19f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmNoYklvYUVIb2VBc2d6RFJndFhERmdSTU15cnl3YXRCa2tGZWRRNThVQlM3?=
 =?utf-8?B?SkJTRStOMkZ1ak5ramxIcEM4R0o0cUczSHJ6ZWM4OEw5NnJtR0djYnJ0YW1Y?=
 =?utf-8?B?SHBhWk9LZVEybTNwZ1B6SUJPanBDbFdOM3Nzc1hkVkVieXdodzZzZDZVK2NW?=
 =?utf-8?B?YjBIc1BLSlZJNWhwalhkbVladDhSWXg3NEVYdXhHUzV5TnVwVzA5OW9oNDdu?=
 =?utf-8?B?Y3A5STd4ZENZM2xPWFlacU93bkpMUDBCbW9BVWpCN3RQNC8wUE5aSzlGbXg5?=
 =?utf-8?B?MWNhK2szeTZMcmdyL0RkUUl4d004Y09GVERrOWdmSThrK25iYUptZ0VveThZ?=
 =?utf-8?B?STkzaVFtMndqUGt4ZzJqRUI5TEJsL3NYcm1aeDB4Q1VTTDlmODNCQVNON3l3?=
 =?utf-8?B?dnpBdTRReVp4cm1taVF5Sko5Y2xJcUxIT0Zhem9vem5ZTDU3MmYwcW4wZG1y?=
 =?utf-8?B?UlpibS9WN0FONjBQS3g4b25PeExmc25sSkFicHN4dHI0WFlmVUZKLy9WTkN3?=
 =?utf-8?B?TFhMOTBPb3pTSHdLSDU2YWV1eHAyRzBiOWFiM0gza1lkSnhWbm9Ecm9GOXpP?=
 =?utf-8?B?eTlaMGZ5UGMyUHhxM1JUUlBDcUJBcnZmN2RFczFjR2VWTkgvQUZaYVlPQ05D?=
 =?utf-8?B?WE5YTjhSbHl1MWtLRWVRcTBKeGVzOTBHb21YUHptVEVCTUR5YzBHWXAzazQ0?=
 =?utf-8?B?ZW1Qckl2NktvV1NKeS9BVzdhVFF5bk92VGpzN09YY2RhaG9xWlN5UU5ENW9i?=
 =?utf-8?B?MWgwbnZmWjZVRWJNSFY2Q3VJcE96K0EyYkRnYm5jOWlwSC9xdGtsZlp4QlIy?=
 =?utf-8?B?QWozWEUvZ0ovY3ZhdTluYUhzOTJkdU4vVSt4dGhZTE81UDFGZE1OOU94MUhD?=
 =?utf-8?B?SGlBTTBrRnJqclpqUkNTUkNiUEMwSTNXUVFCNDFJUGpnUVRGTGl4MFR2RU1h?=
 =?utf-8?B?MTJ4dm9zLy92ajZCaHlYaHRsZFRrM2U0MEgva0d0ZllWTVl1VW9QSEJQd21M?=
 =?utf-8?B?emZtbkFvVTRqWWF1T2hDZFR5NXZvUlJJaWswVHlGMXlIMU1BWXhOckRPMURn?=
 =?utf-8?B?ZUdzT2FjeWFDV3BsNU9pK21IQXBTcWFheHM0OGRUdENxb0tscFRkY2E0ZUgv?=
 =?utf-8?B?ZkdWSEFBeFF2VWlsNG5PQjJ2dzRTWE1rdTEwbU42TXB6ZTZIM2tOTnJwR1Rj?=
 =?utf-8?B?QmRzZS9sTHkrcFNxVHFYWHp2Zk0yNUhiODZzcWVBQW1XeG1tV1l3M1pwTHox?=
 =?utf-8?B?NEQxclVpUEVVUkk1L0VOZWRZYldvR0VYWnN6RXByd1Q2cmRQbnAyRjVWbnhv?=
 =?utf-8?B?SjlUZXI2TGMvZHUxbjVOK2ZMYWRONzZDakFyRWtFaHg4clA2cWxhbWU0bzMz?=
 =?utf-8?B?RWt4dkpQTDE3L3ZGMzVCaDZwN093TnVEMFRFeHBFWFpJYVpoZEtMRjRMOWJC?=
 =?utf-8?B?eks4S3hwNXZHMlVBSXpBZ3JjQjlua2NHYTZuRmFCNldqUFk2VGRSTEpHTW1F?=
 =?utf-8?B?a2MvZkxocnJ4aExmM1Z2L25LZzVxZU5qbkVnT0RwdXRKMlNUNHRyWXFzQ2l2?=
 =?utf-8?B?TUhlKzkvZHhsYmFucXg0MmVKZ3FvdFprWTBQak02aXNmQVpKZTN3ck5QNi9r?=
 =?utf-8?B?bmRZeW4vdzhWVlNOVnlrL0xSdjV4ZnltSkQwRitQeUxnMnhneHkwRVVkTy9q?=
 =?utf-8?B?ZERUVHdIaURDVjhqSXVZblVrQU9tWWl4NTJhWDJsZUFVSzlHa2x5K21mR1pI?=
 =?utf-8?B?Vi92TVBNdXlscmVvMy90RzZDTlRsQloxeHFWSEhoUmViWllCREhBOUJweFBL?=
 =?utf-8?B?Q2crOUgvZTJMQzRqWEhwa3VoWjNhMHVhaERuNmJJb0d1dUlGRTRIRTgrRFBk?=
 =?utf-8?B?bkVyOTRFSi9QRGp0YUYzQXNqcTVsR1dwczNVL1JMWG01NGhSTmFmeSticHF5?=
 =?utf-8?B?b3d0YjArbFlyOGZLWlhLcG9IWXordERmWTlrZFZmOXVIWWZiblBVaU1kVFNJ?=
 =?utf-8?B?cTd5a1pCTEo3WHdXTFVYbWdzQlQwRk1oTWRFTGFmZ0owYXRXZFBrTDNvUDF2?=
 =?utf-8?B?YkVZVy9VVVpweCtHRXc4aGU4VVQwWnE3M01NSVRuUmNOK3NzYi8yNllnK2R4?=
 =?utf-8?Q?7Q6A=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:44:56.6855 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57118540-6628-467a-364a-08de1766b19f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8536
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

 drivers/gpu/drm/vkms/tests/Makefile          |   2 +-
 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 130 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c         |   9 +-
 drivers/gpu/drm/vkms/vkms_composer.h         |  14 ++
 4 files changed, 151 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h

diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
index 5750f0bd9d40..a834d182b022 100644
--- a/drivers/gpu/drm/vkms/tests/Makefile
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -4,4 +4,4 @@ vkms-kunit-tests-y := \
 	vkms_config_test.o \
 	vkms_format_test.o
 
-obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o
+obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o vkms_config_test.o vkms_color_test.o
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
index fa269d279e25..a0ca28a253d2 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -10,8 +10,9 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_vblank.h>
 #include <linux/minmax.h>
+#include <kunit/visibility.h>
 
-#include "vkms_drv.h"
+#include "vkms_composer.h"
 
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 {
@@ -60,7 +61,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 }
 
 // lerp(a, b, t) = a + (b - a) * t
-static u16 lerp_u16(u16 a, u16 b, s64 t)
+VISIBLE_IF_KUNIT u16 lerp_u16(u16 a, u16 b, s64 t)
 {
 	s64 a_fp = drm_int2fixp(a);
 	s64 b_fp = drm_int2fixp(b);
@@ -69,13 +70,15 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
 
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

