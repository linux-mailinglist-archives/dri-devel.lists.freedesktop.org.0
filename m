Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0339575FF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6637A10E39A;
	Mon, 19 Aug 2024 20:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eInevpMB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCDE10E389;
 Mon, 19 Aug 2024 20:57:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkW4nvjTf2f9LiZ4/pJy55AUjEm9FRrNg5WEFzHXSAY5k0Rz5X5qzbcTQzk7IQPnNWDbuKzu2fkAr0Zw7vrlqNtBMoE/INBJOy1B2f5OTk6bqnx6HS4dNXcQnOQtV8I2/kjPc8WyfKAX3dsUryLZucyGHgJ7qKY3QKw8S2IqFJMdrzYIzpl/QPr4dTSJ6frTej5HJ9pJfa8cAoVfPCoW8SC1y7Qc1bc+Rbfy0b8ZEKQdKb9LYvMI+I9X1gWD/6/c09Ur68dGNP26OHuCGRI0Y0K+0oGdnE0XALg8pKLFTSsHKXo0Ib8kFiUXDoJF7hD3NF0HNJoe+RhwOSsgb19zzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hqou/XtM12XWZGLyfQbTXmPXYE2iANg58Cng75qeizE=;
 b=ETySb4nXmPkNtm4tiDYpHDVHrNPRB+W6jtF1O3PE2VZdg5MLkDIzjj39pcGSXHr9Aa7w8ehv4K7qsnP17eWXU4sBfMzd68kaziLg+vU7QGbAND7mVaAp27FjDvGYA44H9JL1tPDBvlsu/zEuzniq0NCrbqFDJ4vsbfMnyr+1MCZxrT952VwwjwMvhEXHElkgiwJx98HyB6fCwE+/5tzIDITKxClo6m6boiEp0vklD1h4CFOXeDjsEDQanXAw3rc6rJ+k9oLBh388h5qokEIZzDAdk/v6d64uMYwBquT6KXRzhXM+iCHyDd1nrV1S+WAVH+zj4OyhddPVJd3UOHLlJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hqou/XtM12XWZGLyfQbTXmPXYE2iANg58Cng75qeizE=;
 b=eInevpMBpVKmp4W5FVJYyodljct9goQI4T9oTDTnduIbl/bA2mnt0TfHezmJ+gOqX+lUDhT15VBLalDhQXADIewJfFNW9x4S1Z4JcvU4MESoUkdKg3NntELeZ3Q90qcqxF/QklP2+deOKvXvuhmsE+oTuAVmKVoi8nQJu/HvYd0=
Received: from MN2PR17CA0024.namprd17.prod.outlook.com (2603:10b6:208:15e::37)
 by SJ0PR12MB6968.namprd12.prod.outlook.com (2603:10b6:a03:47b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:22 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::e8) by MN2PR17CA0024.outlook.office365.com
 (2603:10b6:208:15e::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:20 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:20 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>, Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v5 03/44] drm/vkms: Add kunit tests for VKMS LUT handling
Date: Mon, 19 Aug 2024 16:56:30 -0400
Message-ID: <20240819205714.316380-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SJ0PR12MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: 294d47cb-924e-44dd-c57d-08dcc0918516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/4rOyAPc/UwTmo/voNP/vhJjUEHfDTI0GhrYUC7wDDzydHTUAk2I+NC3MS2u?=
 =?us-ascii?Q?1eONP65DFHQEgZKqkbr6SG1LF9L2aM3Uxo78rw47ymr1HPdlEx6FAf1o1H4A?=
 =?us-ascii?Q?ucYHvpBKHTLp3amQMJgiKuxg3B6lMUzekE1qB8Spr1bUzNjr+tsjeS0M9wow?=
 =?us-ascii?Q?/hvLZ09oCALxIqNGtRXRnMYuQxB/zzohgnfJUEZ6E2xvjSES6aQwxGhykafd?=
 =?us-ascii?Q?B1RmyfjLB2aGkbPCg0bT3HRGMQjpbaZhkUCiYNjUK6jH985B1UnIwaxorp3G?=
 =?us-ascii?Q?65lixgSArhjWMJJkRuq8ZoRN7UXO9kOIPcZDByGr8TrdUzZHhuxVr46WItIS?=
 =?us-ascii?Q?Dt9yofeFJ6uivetpFHDL6sHC3cd8g/J8cZqfZdQLzrswiSQhjO2xWBFLb0xI?=
 =?us-ascii?Q?cEPSnhBLFayx04U8KQF7ZjTAbefL0w1PxIxFm9dWl1HMlxdJKlhub1jM47Xc?=
 =?us-ascii?Q?hOwLX6IAkVXMte0b8XO5483TeAwyA/HKTOVn+gmYm1TILYrG8ycMKWS5rBaD?=
 =?us-ascii?Q?xqw/c+vi4inmF/1hyOKSuaB7mNd+DLsnRmvq67eferSOfvf9gatjnZq9bgl2?=
 =?us-ascii?Q?zcW22pEiz+qXcOfWkOD1iIbCQPPVD0DbvGo3W1tEFqXR+os4wKKiztqFdIEs?=
 =?us-ascii?Q?ObwnF4kmUIPboSUvSGqbpy+c0d6qKW9PWb7TV/3TEXpPf2QzR3nx36AIctkS?=
 =?us-ascii?Q?FHoBx6ZLr2mU4hGl5RvLDqEcB/Ulbgn7Qlf5m6Pul0fiAL6imqI/tMOOTrwD?=
 =?us-ascii?Q?SE0+ae0Kq8v4po0fnWNMr6oLPEjeHlY3mtyxFyPChqcosNFpnP3mNUzM22Xz?=
 =?us-ascii?Q?8nECY4z8qqCfFv0UA0LE6CZZQpWJlAK0pUbIlzMb4GNwuxlRmE1kKykENjno?=
 =?us-ascii?Q?aZRO6NwsvU0VamtFNU2CUTySlgdoqTsB0x+1alBnRt3NKPS94CbmowBigemp?=
 =?us-ascii?Q?rChsF5ti0ggpbN0j6ZJTiUeAfy8aI9jR4QZcnELJ1gEsylMPiFon4Q2RzkRR?=
 =?us-ascii?Q?RWkFEqq5e+A4LR9mGkQgI81SPZN3qeNFo4OsI4PEHqG504k2p6P0FvyX7xqN?=
 =?us-ascii?Q?3WEJYBUzaQbw235eTIiFAKGi0tnn+1ce5u6mbGHFqAaitd1VTKpy+vISIbbt?=
 =?us-ascii?Q?q4NO6lW7fMXxhGfjpBLpVpOfqzU/TppqqwAzZXwWbquRMBEs4tGubaQh7Ekv?=
 =?us-ascii?Q?j7LaiXDBpknkRumJA/HF3p6oVluaA6MlTHB1oWXif3yB1sejNe5TJ7rYPvLw?=
 =?us-ascii?Q?GU1xVrcmahm+e6wOcZXOrd+MPhrSem8VBeUDF16CK+LoInYC81LAaKFZb27g?=
 =?us-ascii?Q?xPRxnO0xbt93U12Pib3nkQR8heCQhZ0J38/OEakZMl3VnyldtI6fTSJ7dSlF?=
 =?us-ascii?Q?F0OYCKV5Gjhwype74vdIPTZmLaz+GfeR4S6IfU3eog2hM5pZIVSkFauFNrEJ?=
 =?us-ascii?Q?bmw4AMs/ywalHU7BC8qGbvqcAg2Znv9D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:21.4639 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 294d47cb-924e-44dd-c57d-08dcc0918516
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6968
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

v5:
 - Bring back static for lerp_u16 and get_lut_index (Arthur)

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
 drivers/gpu/drm/vkms/vkms_composer.c          |   4 +
 4 files changed, 176 insertions(+)
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
index 3d6785d081f2..3ecda70c2b55 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -435,3 +435,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 	return ret;
 }
+
+#ifdef CONFIG_DRM_VKMS_KUNIT_TESTS
+#include "tests/vkms_color_tests.c"
+#endif
-- 
2.46.0

