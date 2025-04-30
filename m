Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D55BAA4020
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F60010E5ED;
	Wed, 30 Apr 2025 01:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wBe7OGE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BAB10E5DF;
 Wed, 30 Apr 2025 01:12:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6lTTlup10qnhB8suUTf9ucE2+461PbhHEGZYFUZDND462DgI8xfBe5SAlTANf+okoMrY95SVJqBzHwtV4/Ustq/HTzp3LZwXC04Lt0A3Pa3ivRo/RjzTGaFRFNnGkmjzF71kWbgj5CaB95O3tQ8FbyqZYcLDBPR6oXqJkela3QqxNGqE5YNbcGHsUC+llt0bD226P+z0vTlT0L5wTQPEFxrmGv7dR8rJDbhIIyRzI156T7/Z2JpE4/Id8ZKvk072d6CGanjlb80//arCQhZpw9Hy7WxxuNb4fgxDD+sjI1Igi7Iq9wXZfyU/FFhYyqQmY8FDZSphmw/FUy2UlcjYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fL3cjuC/bWo1Ax+Hq7TK19gmTcWub2E3bwv0bh12Xyw=;
 b=T8j6Z6sIY16F+CGoEa+/s/Kwn2LX3na+X1RV+wMfZVP3RMuOZzsBSfkSwRtupzQ3bg8zpGShueN2F/6lSGDav9vSUFfqOvDFkFeQxk5T8Skw3tvB3q2BnbrLmfM5vAUhkO1QuoozB2Kb9DywCLLt4wljahgRbREXHp9k41WCD7UaFaBC+vaLaaMMDfp5TKEMBIPrN3HCABe2Y531r8ynrq0kx0zXCacigibGdZDVWljPlTFGyeZ5crEbfDSkLxr7SLjOcow8p9tZjp5jUr8gDxNvtqsD5pACURDrQytcW4ZnwNr0n04ZyCJt00RZhLKRdn66ZAeH66HJLkU0c7f4Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fL3cjuC/bWo1Ax+Hq7TK19gmTcWub2E3bwv0bh12Xyw=;
 b=wBe7OGE3N1kojs6+MHwcP5f2XNxSlbmOf6rjcMFWIv8Qnm/HTUgCP0bz2S3/kfWiEQ98m59E4mMBxVWkR0Vw42ZWteyiO2ukXEhvWP6CSdLfZYUJo6bN5MKsACPxkl0ZCeDkhPVPgbuvbZtNXnozPARGcXzi7Zcty4NIlvC1aKA=
Received: from SJ0PR05CA0158.namprd05.prod.outlook.com (2603:10b6:a03:339::13)
 by SA1PR12MB7443.namprd12.prod.outlook.com (2603:10b6:806:2b7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:12:24 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::48) by SJ0PR05CA0158.outlook.office365.com
 (2603:10b6:a03:339::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.16 via Frontend Transport; Wed,
 30 Apr 2025 01:12:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:12:24 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:12:20 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V9 02/43] drm/vkms: Add kunit tests for VKMS LUT handling
Date: Tue, 29 Apr 2025 19:10:32 -0600
Message-ID: <20250430011115.223996-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|SA1PR12MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a292c9d-1e5c-4514-9427-08dd878410fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pe+UTwk2KwrJpG8/2iywAu0qDe8bRp4hwk8pEGiLiBGddLyMsf5aAi8m6VpP?=
 =?us-ascii?Q?BgzRPO155A3Br6zx2ZaKrRZ2VMaEhbr+9A/Q5LGKbac8vuBmWmcWxkkL9nmf?=
 =?us-ascii?Q?7nFf04lonTiYUgx5hdVS2d37rslHmUwK2NeUqfEhvW6eh7qvi1Lv1L7TAuxk?=
 =?us-ascii?Q?X26KoMcVQITmQY37Iy3swnIvXFf4C57G2j12A4RhZw/P0jq8D2llGfe7uCXu?=
 =?us-ascii?Q?FIFgdjeUqDZjCx/YJOOXxbaAuD+2IMfeQNSn/Tn/fdTYPVy0sQBNe0jpYlbM?=
 =?us-ascii?Q?pRFs7seKuPXvANFOUe2DezZd4qWVPqWt0CUI8y4fjBjF+srTggEJPBEfQb0E?=
 =?us-ascii?Q?FaewBFXAIv8iV0BBhzp12pRsxLWwKfup+l/b6pVczbO/cYaXTVHY34JueR6x?=
 =?us-ascii?Q?N+3u+gudpFhYHuQDIMNNaLWPKDIkqUUfJOoSTnNgWhh5Jlb9VXhjx3bY3WZq?=
 =?us-ascii?Q?PPqbLp6BfjeeYkgXGuFB8la+4e+XduPYFHcZo9sdQA40fJD9zy9ZXwrNc8Hp?=
 =?us-ascii?Q?aqkFWYgTDolEYiOVxzbvfHZW5+Fv5FR19FOdbVIT3uBeDW3Iz8EGteiPERYg?=
 =?us-ascii?Q?xam8h/GUrEkrAt/xGQkAftqEpHK0N/p2WCtqBU4reu/5YjHBZfELsVjuBFW6?=
 =?us-ascii?Q?Bf/BosyfptvRyBNl9Cvqaj3sbjEqfa80qNPYE1x0VHensjZYjF4kE3+OnsIQ?=
 =?us-ascii?Q?0TInT1qne0Ch7DYuid+Ea4XnfnjehKPWWV2lS4s5t73bOELZARwzp3hzsQHy?=
 =?us-ascii?Q?Uq/kNUKKW9WmDgDfhdLxzt8pQtAAcq0eDc/rdNzZdgwuS3hI5eLuVEDpVYI/?=
 =?us-ascii?Q?b2Hx1FJstZ6NVQz1Zu4p4unA0/q+S5IMv9VxD1h0pNmvaRDtb/s74AeLKJOk?=
 =?us-ascii?Q?Shq+7eRzPFfavRqH0FE+FyUqOcashL18msmvUCCrRBWJEx4sVscS5HhOwIh1?=
 =?us-ascii?Q?iFuDOkoBK8pLmynKZ4uLTJqFXqIdViCCXWRiWMGIDou0W8Uwrw9MKTccZtOm?=
 =?us-ascii?Q?9ANt09HdVdRPIlJRRkjFTNZrQ+0axV/9r3pHCQZ8KjyMzwZrt32xgSD9F4/0?=
 =?us-ascii?Q?9+oO209wmPOVRpg/SxrY2uURwLXAwFIrJ71Le3CyQsT/DcsGuDMXwcGVDBm9?=
 =?us-ascii?Q?6xNciuMKfNoQrbcjnar6/B1yilAjwn4b/u7+P0CDdHvC0Y7kjcvrBXy15B5K?=
 =?us-ascii?Q?8VPxOxAP2rSisGwj7NoHvOkvnck226rRkKd1f7s7XXD03Neqrib1H1BFoKUK?=
 =?us-ascii?Q?G/Y1qJ4kEbRqVq36Iar+lEPgL12lALoMfES1vc4MhN1uZwtaYJIdIzE4fLh+?=
 =?us-ascii?Q?HZWJNG3qUW9z3MGM24ZvgSBhQ5PR1D5WVekVb94UWmc0Cu+d9fS1fBuUm3eH?=
 =?us-ascii?Q?kVNklYYomJtCiMMVX/okR3ED1nP/JS2A6ahVdWOUMctg9UTbfjXCnzxtLwno?=
 =?us-ascii?Q?o3qV6z7luke7Da1oY7wBTQbU9hwLci0OCHHooCMhaVroy48BbcZzICRVzerO?=
 =?us-ascii?Q?hAj8hvfXCAEgKYDN1jxpa0RtoqDZi5ZU7O14?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:12:24.5387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a292c9d-1e5c-4514-9427-08dd878410fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7443
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
 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 172 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c         |   8 +-
 drivers/gpu/drm/vkms/vkms_composer.h         |  13 ++
 4 files changed, 192 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h

diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
index 9ded37b67a46..e92f7143e540 100644
--- a/drivers/gpu/drm/vkms/tests/Makefile
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms_config_test.o
+obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms_config_test.o vkms_color_test.o
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

