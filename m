Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD97B2772A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965F610E8E2;
	Fri, 15 Aug 2025 03:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="samB2IwO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2049.outbound.protection.outlook.com [40.107.212.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CB610E8E2;
 Fri, 15 Aug 2025 03:52:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWHavU58GRIIhY2gcKZfjhOxJTWyhOrVzXpaQQzXygkFr3AG8INaHI7vbQ5DN0ZTeXrJKqfJtyZoz1QFxkljIWp0fZqD1EiyNj2ULkvUlqNSuZcxeg4kvNXO8Y61nJ33KBzoZ3qHZguC9+acT7X4WK3IxUppEUapv0Jor7Bq4XXXtu6cC53PsyPgv6VXGN3mBFeHc3l3Ztd73Q33Wl2/8ACSFaPo6tuFyOYliQxTUS2Cp25CiU1NnXWfgJrK53UwqpDtfjVRcpD9naix+Jbpkqc8iYrkfNDjDGxLGCfQnVWZzSPi71wn5mUqu1fNbqe1fbjlouk/uj/ECK68YwBJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jv/e5pJwmtQRLaoBv3w7lSVJtPCcT5EJQMJwWJmKeP0=;
 b=ywMG2cpp2SnKZ479V81vGTdJHiUmUtNvkj3nlzPetpAPp0+t9Ux1FoDUxfn0wrb/85q9HTUyxYx/sR2O/6r9qiSFmx6hlrmMR0XxKpcmAIX5CwQPajLXr9z9kgkGdzeMiCCMNjxJ29DjoEXfiDJ2UEPzHgCAA0AJ6HdKcER3zFxCf0QJyNrB4eVgG1PUMGShmQ6SV7AkI0/Xv5ch0xMXBYctZaZ3OApp241ekJGCExRJnXDR2hk7lXMjRpIX8WI790VXytRvStS4KsWRoLoAIveuoYQXkorsjSMbqIf95ctyLtOu9XEdH12dw0q8qeAvOwnRVAhmoJoFRvtd5ipriw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv/e5pJwmtQRLaoBv3w7lSVJtPCcT5EJQMJwWJmKeP0=;
 b=samB2IwOc2mGtfBcFwz/pajuxXSv5gWkPveutrAG8Nc/BWOzAzUc0VYNL/0fDs+6gHqTQuDERdTpafV4ytWsIxyYOnob2Ot6vcMS0B+WJFAaayCU6vgVNoVIDB0hjN7a8SkQ3lP1Ze2jjKJ66HFu8UwQZXai8ZSa4/YgVLg8CEo=
Received: from BN9PR03CA0866.namprd03.prod.outlook.com (2603:10b6:408:13d::31)
 by MN2PR12MB4077.namprd12.prod.outlook.com (2603:10b6:208:1da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 03:52:09 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::5b) by BN9PR03CA0866.outlook.office365.com
 (2603:10b6:408:13d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:52:08 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:52:03 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Arthur Grillo
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V11 02/47] drm/vkms: Add kunit tests for VKMS LUT handling
Date: Thu, 14 Aug 2025 21:49:51 -0600
Message-ID: <20250815035047.3319284-3-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|MN2PR12MB4077:EE_
X-MS-Office365-Filtering-Correlation-Id: be476151-b218-4f69-95fd-08dddbaf1b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkZLQkcwUXNvWjZQTEM5UEV2SWExQWdEWmZDVjEzaVlYL1ZnNmsxQlJMbVRR?=
 =?utf-8?B?dDlnQUhqQkkwOXdJMk85ME9obkwwbmZJZXg3K3JmbnFZcmt1djg4U1JneDFS?=
 =?utf-8?B?bXRqdVdxdVBpNlZXL1FKeGQvSTB4QVl0Wlc5MEEvc3RHS2xGVWMvQ0wyK3ZD?=
 =?utf-8?B?dDB1Zi9aV01tbDMxL0RIcjB1Ny9kellscytmVDZxMDEvNU1saTZrbzdHUUF0?=
 =?utf-8?B?a1JmemkzZHdqNGJYUlduZG5nNnJyL2luVHdpQ2JxUHA1ekhJb3hORWJkOXVh?=
 =?utf-8?B?MGtlUVl0VjFVNGY0WmFvTE4rL1pQL3VoOFBvUUZvOXZTbHlrMXFjQjV5L01T?=
 =?utf-8?B?RnlxNEd2Z1JEemJ1bmw4U3kwRVFBdGdvY09LL09lSURTWDYyQ2J1Z09QRlA0?=
 =?utf-8?B?SWZwcWZkTU1wK1FpbzNRU3VKM24waGxud2RySHlCT3ZOMDhqUUUySzlyNkV3?=
 =?utf-8?B?aFZjakpVYzJpYlRXY1hnRCs1RWZLM0tZdVF4a21jL3N6NkZpd0RGZlYvTUIx?=
 =?utf-8?B?UWhGVExxdjhxRWJQMmpSWG1kUjNPSVpPVW5PVGl2U0RyRzZ4ZGpBcHdVempp?=
 =?utf-8?B?WEd4dkdHajRsankrbU1jbyt0emVjei94YnRYbytSak9ubnZnTktWd0pJWHZz?=
 =?utf-8?B?UTROM2ZaTkZEUmxyQm5PY1MwblZKN281SHYxM2YyeUY0dHFMZ0VOUVhyM0hB?=
 =?utf-8?B?c2g5OGprdWhXUDdpRVJjUXhSR21Va2NuQU56bXgrNHNZYjI3aWEzanQvY3V1?=
 =?utf-8?B?MWRQMGppVzhvMm5sZ3JHU0dIZFdXdlI0aUpLdzlqL3dpMHpabEFHK2F2b0dq?=
 =?utf-8?B?UGkxZk8yeFZBY3JseE5URkFkU0RjMS9mVllRRFlNei81OXYrd3k3SDFyRlVL?=
 =?utf-8?B?dzQ1cTYrKzQzL09KUDg0QjllZXUrZml4RjhrWFVOd0EyZEx5TXJQRVcwSmRE?=
 =?utf-8?B?WE9NcEZQTG53cmV3R2hmQy81RXRza1RiK0syYkUrMHRJUlVjNWY5YTFDQW44?=
 =?utf-8?B?NUxGMUhKb1ljTVExWEcwdUdFS3dxeEVybmV1NjQ5TURaLzg3T3FBalRkbWNv?=
 =?utf-8?B?Y1JRcXpFNG5BRG1iUDIwSGV0S2k5N3plL2t1R1lNeUx6SGZ4ZnF6QklUei80?=
 =?utf-8?B?UFk1YWhJbWJzZThJa3p0aElUZGZRM3hyN3UzUDZoWWJTcnF2VUtLWWsxeklK?=
 =?utf-8?B?QUNKRVM5U3hKeTBsdTRwL0pBV251ZG95UVRheitBYWV5SU9JNzkrL254OFVI?=
 =?utf-8?B?ZGdRazh5UXNObHB0RUVIZjZWMzBtYmYvTGNqdkN0NXM1RjFhY3dBN1RMYlZh?=
 =?utf-8?B?U0VQTUFQQjRuZE8vVUJlSmRaZTRvRXkwODVrdHVFa2NlOGVGNnVCcFpOaVpj?=
 =?utf-8?B?b2xlZXdvVTdaYlB6T05paFN3cmV6S2tuTGlKWERFOWFrYVdsNGVxa3N4ckJO?=
 =?utf-8?B?VXhEeUs2RUhsVkQ0N0xUSUt2bnE1SlBIbmtQWVltU2tzVGNUclp5QmNGNjZ2?=
 =?utf-8?B?a2s1cGNmNkdyanlqNXNSUG5FYmhZcDVTVzJBTEdHTFFHWWJRMGFvSVpKK3Ix?=
 =?utf-8?B?SGtMd0FaUXR2c3FsSEpyVzNDcGZvVzRXeGJiV3NuQ0cyVkFxOHNhVCtDQnlV?=
 =?utf-8?B?K2dxL2JNNmVPR3V2VVZUTTVZMWJ6U2cvczFhb1dPMFRQSG8ydnlGMmt1OGZn?=
 =?utf-8?B?TjNpaG5HaXJFcmZkU0Z6NnpQRzFNNzRraUg4VFdNRTB4WWtnM056VHhQWHZ3?=
 =?utf-8?B?MU5GeUVSbFJoZXJwTkxFRkJwd2JKam9ITldTZjN1bXFUczFkR1k2UFJkek1r?=
 =?utf-8?B?cDJFUHFIM1BPQ2hjRy83dHpOKzloSG1IbEtYU2t5Z3ovdUhrTXVlakdqalhl?=
 =?utf-8?B?UGt6TldncXNEM2tEYnJSeGp1V1JncEtycHlINFhKU2I2emJ6TXJvejYzdkxr?=
 =?utf-8?B?cXZsa2pjblFFR0h4OVJ2elZEV2c0QkZCNDM0K3R4Q05SUjJ3M0xsemYvWlZZ?=
 =?utf-8?B?U2tPZDY1WkpKKzNnUXFzeVlYaU1mTUo1aEMrZnZ2QW1EZWhSNVVsbFFiSS83?=
 =?utf-8?Q?iWMBDw?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:52:08.4962 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be476151-b218-4f69-95fd-08dddbaf1b9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4077
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
 drivers/gpu/drm/vkms/vkms_composer.c         |   8 +-
 drivers/gpu/drm/vkms/vkms_composer.h         |  13 ++
 4 files changed, 150 insertions(+), 3 deletions(-)
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
index 000000000000..ee4dc7c62d73
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -0,0 +1,130 @@
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
index fa269d279e25..a375f4a65acf 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -10,7 +10,9 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_vblank.h>
 #include <linux/minmax.h>
+#include <kunit/visibility.h>
 
+#include "vkms_composer.h"
 #include "vkms_drv.h"
 
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
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

