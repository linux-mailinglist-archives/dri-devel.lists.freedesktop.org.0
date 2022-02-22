Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E9C4C005A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 18:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF0D10EA2F;
	Tue, 22 Feb 2022 17:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760B810E8C6;
 Tue, 22 Feb 2022 17:49:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asqZkXTLEoM6amFn9v2cHcbAaT1iHev/XeCY69CHZ0bY2eBI92yvryyN+GUghdMXGVZDC9O+KU1RCfKUGmiVvHAATtd4ZaGDiWNwMyigJQ/oi4OFHjZSx8pp/j8Bel3aSgQjzLUsa4fQD+A+heZzy1MEVGOgDhPhFI3yLnfJjmRtJl0THjUMmx1OtRR037W6NLR8muuI7u5vSweQ3IeNRSkle15FRi1bA+0MJG/j48fU5Yffprr8hnvyFneZOSJZIOAKoxkpUZDQzf4bCCOukX15lzcjhO/IaDbepkt5Bjc4DIGxutJfNhU9ChsJzWYCThhrax31fzOfK+SrVzGdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+FcYb+weATilwFsC9QtonKx9K/4mJRwnV6AAXyU854=;
 b=Wuq8GASzTzv2pZ1h/iJrp3zHeJUmEeOoeHUHqs0Oht4wxOEsFwMCTLCE9+Sm7S+kDlwQ55OOg0EpS4JOkMfC6GL53nCCfQmcbYWIJ/jaUBBmJenj+cj74mtKPt7UOoihkh193vJLQPXbcATclRGHmzhCUn/OHbcSnoCOMtAvuBYUtWgDrPY6NqLN/6GC+wgsBOl7siYC56lIQh2g/cXr7Uui5Q5tJGMRF1I+HvqNFYhfwmifw3EdM45d3jSGHFhmEVMq1S+xJTA/9cKcv/HvzwO7v5Es2FvzGQyXkOMZaTDNw9WZEWnr0bez7HrvmO60aZa3mEVh2aDlae9PJdJWug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+FcYb+weATilwFsC9QtonKx9K/4mJRwnV6AAXyU854=;
 b=IZHrLXAYR+I5ToCO832FSwnJNbauCzpL46hVbjzUWtmlfLaevWgO+x4Kg+ps6kQI7AJirUhnqGNzpy43EuCqmWD/5q+7NpPtGKvW+fxwAj2zgzE0T/On8bUvm1MoTs1qGDstsEpKXYk7yKELVmK+t6Encv68SZDU7BdwY6LvCV8=
Received: from DS7PR06CA0047.namprd06.prod.outlook.com (2603:10b6:8:54::27) by
 DM5PR12MB2517.namprd12.prod.outlook.com (2603:10b6:4:bb::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.24; Tue, 22 Feb 2022 17:49:18 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::27) by DS7PR06CA0047.outlook.office365.com
 (2603:10b6:8:54::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22 via Frontend
 Transport; Tue, 22 Feb 2022 17:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.20 via Frontend Transport; Tue, 22 Feb 2022 17:49:18 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 11:49:08 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 1/7] drm/selftests: Move i915 buddy selftests into drm
Date: Tue, 22 Feb 2022 23:18:39 +0530
Message-ID: <20220222174845.2175-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d92a4b4-1d18-47bd-5071-08d9f62ba678
X-MS-TrafficTypeDiagnostic: DM5PR12MB2517:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2517D3F93CFA9B70592DDE4EE43B9@DM5PR12MB2517.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XPPOn/O8E9fxvErFgrTkVVWuqEXrN9GyHo8CR8gBpoztb+UL2VskZ9ZmjpNpra+yZoHPbRprXavHbsRbeS/QW3fZvgw/7Vn42lxIqvJxq3CXh975E3PTNBSZQ6q7Ewjan/La2gCMnqdsVQ5RnjbcVH8dytnKteY3vksbYKQaMTz6Mel9FgJK1JO9uhn/jZDP6uk5We3gLhYDgrV9s6SgNT9aNEJB1GTsZLf1fCNRQywusBsjvf2IWa8hjSkGlOZHILA7N2WBmfX9kd2GmmWoQsiN5eeSpbUxuRaOqPea8HsDEBF1LAAkxVVzB7Rk8Ph66OOGhH8wl5sGWIlt+sJbz5fB/5zkJBxthBGLjy2Kf3VadDCJcV++J34RViB1C6PWiBZU/Vu2ZdE2apYrbw4Pg2NMT0vsa0MChvKswyBsgaj7+fFmhQlJsQ0GlMMP0Dtm9wPprbQocqIum08RrDw1vZpe7d/YH/Hv1a+pan8H2DNBqJh+jCecyCv9nJR/BjPLu2VcDLux88mIJV8mBz8DUaxfZA0it6ozfh0N3XK6VNw313A6fBcgxTFAfHNqOq8XtjT+/ExpAWS64erKpZXbJN7Ti34CKWU3F8WVlrJKKS1Pt02TL9rSwQgwihgibEdLt6aeh5ExC6AwkqDNglTEXtYHUfpobpADVpMW3W3JgvTq7QBfeR6Ls4mIoDi465rv4OZ9NvQXdjZ14tEw60+GIg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(110136005)(54906003)(66574015)(26005)(8936002)(1076003)(186003)(5660300002)(16526019)(83380400001)(70586007)(70206006)(4326008)(8676002)(356005)(316002)(82310400004)(426003)(81166007)(336012)(86362001)(7696005)(2616005)(40460700003)(36756003)(6666004)(2906002)(47076005)(36860700001)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 17:49:18.5471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d92a4b4-1d18-47bd-5071-08d9f62ba678
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2517
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
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>, matthew.auld@intel.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- move i915 buddy selftests into drm selftests folder
- add Makefile and Kconfig support
- add sanitycheck testcase

Prerequisites
- These series of selftests patches are created on top of
  drm buddy series
- Enable kselftests for DRM as a module in .config

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/Kconfig                       |  1 +
 drivers/gpu/drm/selftests/Makefile            |  3 +-
 .../gpu/drm/selftests/drm_buddy_selftests.h   |  9 ++++
 drivers/gpu/drm/selftests/test-drm_buddy.c    | 49 +++++++++++++++++++
 4 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/selftests/drm_buddy_selftests.h
 create mode 100644 drivers/gpu/drm/selftests/test-drm_buddy.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 763355330b17..f1422bee3dcc 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -71,6 +71,7 @@ config DRM_DEBUG_SELFTEST
 	select DRM_DP_HELPER
 	select DRM_LIB_RANDOM
 	select DRM_KMS_HELPER
+	select DRM_BUDDY
 	select DRM_EXPORT_FOR_TESTS if m
 	default n
 	help
diff --git a/drivers/gpu/drm/selftests/Makefile b/drivers/gpu/drm/selftests/Makefile
index 0856e4b12f70..5ba5f9138c95 100644
--- a/drivers/gpu/drm/selftests/Makefile
+++ b/drivers/gpu/drm/selftests/Makefile
@@ -4,4 +4,5 @@ test-drm_modeset-y := test-drm_modeset_common.o test-drm_plane_helper.o \
 		      test-drm_damage_helper.o test-drm_dp_mst_helper.o \
 		      test-drm_rect.o
 
-obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_modeset.o test-drm_cmdline_parser.o
+obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_modeset.o test-drm_cmdline_parser.o \
+				    test-drm_buddy.o
diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
new file mode 100644
index 000000000000..a4bcf3a6dfe3
--- /dev/null
+++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* List each unit test as selftest(name, function)
+ *
+ * The name is used as both an enum and expanded as igt__name to create
+ * a module parameter. It must be unique and legal for a C identifier.
+ *
+ * Tests are executed in order by igt/drm_buddy
+ */
+selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
new file mode 100644
index 000000000000..51e4d393d22c
--- /dev/null
+++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#define pr_fmt(fmt) "drm_buddy: " fmt
+
+#include <linux/module.h>
+
+#include <drm/drm_buddy.h>
+
+#include "../lib/drm_random.h"
+
+#define TESTS "drm_buddy_selftests.h"
+#include "drm_selftest.h"
+
+static unsigned int random_seed;
+
+static int igt_sanitycheck(void *ignored)
+{
+	pr_info("%s - ok!\n", __func__);
+	return 0;
+}
+
+#include "drm_selftest.c"
+
+static int __init test_drm_buddy_init(void)
+{
+	int err;
+
+	while (!random_seed)
+		random_seed = get_random_int();
+
+	pr_info("Testing DRM buddy manager (struct drm_buddy), with random_seed=0x%x\n",
+		random_seed);
+	err = run_selftests(selftests, ARRAY_SIZE(selftests), NULL);
+
+	return err > 0 ? 0 : err;
+}
+
+static void __exit test_drm_buddy_exit(void)
+{
+}
+
+module_init(test_drm_buddy_init);
+module_exit(test_drm_buddy_exit);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL");

base-commit: 95ee2a8b4b3cd1fb25f7e14e2202da4045030173
-- 
2.25.1

