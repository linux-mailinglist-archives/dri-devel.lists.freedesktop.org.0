Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A9D4A8531
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDC110F7D0;
	Thu,  3 Feb 2022 13:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC63910F7CE;
 Thu,  3 Feb 2022 13:32:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1rP3wZ/X9cIwlOUVM8qmGO4MZ9AnDBeV352BEQABWXN9SpfwhwlZe1Prr8X6jwiA/dDAKV6vDavs3aQicU3ZO2bCIJx2dtKU81HPIIT6MtshJ/n8FGL8coQCoGK0CbEZzqd66RXVchgumawxD6CDDNwcqhmec1Td2plqIbruLZnl24/Xjuj29Awu5mImOi09aUlDk4JzX4pQq5KIQttTG4/nMh4YU5Ti+0f0Eek3KwOQmLrHslJbgy9pxEJzd+w5pcboGGT7M5Gh3ritgzF9nEtmJ8HKrkqOaQb0AcLXzFWTFFfY58cynh3aG/kPEzatdg8QryeQOVvFXB0uw/4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+0Vc/m6fnGYy5tAaJh0fWUeZJR79dokkHdBpFhtfF0=;
 b=QYa9EJPoqdxIWeWj0tDFbANYkNrV/ZEf+N6VRLwOtynWqtZ0WAXmfOEcA66Z5gxB27L94VaTvZCRs4eG41pWFD4HensWLnO534h3E3XxXHqhN5ncDimSYQR76YyovL4p2GgoxeLwUCgf02j/5RXq1SKzRcoxhIT3jRD3WErGHkk+rO3IHTrAD/PlX/nhjljVzB+eA2Et5+W7vXNTs6Cu/JnIJ+8DUJ/zHrPwj3g3P8pfV+rB4GzoyQxauBvj4V5axLOG9y94XdqocZykgzo7P8mtxDBWGLkMoTCpxmxzciwEhT5UuqWZ8afVuztQQLuHJrU+VVY58B/trSynQA7odA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+0Vc/m6fnGYy5tAaJh0fWUeZJR79dokkHdBpFhtfF0=;
 b=twuAmZ8RcOC0jhsajofHvjc6/VPABb4l8TYi3kJjq9Rmydy6MqcS38lDI5Ih7dvQHmwgyMpkPcvOI27VuH0aZawFBURRtf6plf+UmlUubqCGW9Pj9FZdg/Al1AsAGtor/d/xk6zxzhvZ9Cakbl260+eyCjm70HcP7KNb7c1u/RA=
Received: from BN9PR03CA0674.namprd03.prod.outlook.com (2603:10b6:408:10e::19)
 by SN1PR12MB2526.namprd12.prod.outlook.com (2603:10b6:802:2a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 13:32:57 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::c5) by BN9PR03CA0674.outlook.office365.com
 (2603:10b6:408:10e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 13:32:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 13:32:56 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 07:32:53 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/7] drm/selftests: Move i915 buddy selftests into drm
Date: Thu, 3 Feb 2022 19:02:28 +0530
Message-ID: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3f665f1-e411-4385-a25b-08d9e719b05c
X-MS-TrafficTypeDiagnostic: SN1PR12MB2526:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB25267A9E620B574CB2EF2A54E4289@SN1PR12MB2526.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pntX5WHCZd6J8+hU/s+GpCxDRY0aCaugoVewGASPB8T3JT7ugYrd/xFbAVJUYt2kJIDgpn8GBYkw61jQ7crvqGfjVeXl4cxiRvCKmSVUgVg5a9ii+3emVCLDbg5oAiPyP8XYYx6CtyHBc++Hij1kKxBF/mbvWNAEsxLdkKQv1B5vgJr/6M6iESSCAjwUedANeB6xIh/vf9Y/PmWHLKt6F6CtC++DYbllcblU/MW90gqzYtzw5ouz22lrBhtZ5RjrCSYFOL2JjmC493G9bDzDCfm7iFJWOCZow006cQ3q3N2bwJrdItKMZq9Q5laBloRFCyuEeXctGJmFk7MdvUFvaJR+AFgbbLjumE3jLJQelvhuUbWz9YWwLB/hxZNkQSHveqr658qDiSiie0esVXNQJGtfKB7SqkIH7VVHXOIYBlVxxMKfQdu6YGMOnDoAKbJS1BLySfSV/0jiaIFFYaxHm7N08hI2Ud7HjqjuG4RDrHC61EpGQ338P32VS/gmhRzRym71GsGeu/8Eexzmru5JsfIXviQbSFzEBYdX61AZWCbS+VShWKWz41tf2AxjcL7Tdhijs6HRWrjgGJcPu87Qir6clX0MB5gEWJqzSsfNVrwCXPmHosqE1tmOwy49yK65q7xwwgVSw8mTvOPlPiQiDI8Uh7X2Vcmb47DdNFOvVPN9XCIXvCCaBqlf+Yy7z/5f4/ku5EkZAgn4nO4to9a20g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(54906003)(316002)(8936002)(70206006)(110136005)(70586007)(8676002)(4326008)(2616005)(7696005)(2906002)(36756003)(5660300002)(508600001)(6666004)(16526019)(336012)(426003)(86362001)(356005)(81166007)(186003)(26005)(1076003)(47076005)(40460700003)(36860700001)(82310400004)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 13:32:56.8070 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f665f1-e411-4385-a25b-08d9e719b05c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2526
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
---
 drivers/gpu/drm/Kconfig                       |  1 +
 drivers/gpu/drm/selftests/Makefile            |  3 +-
 .../gpu/drm/selftests/drm_buddy_selftests.h   |  9 ++++
 drivers/gpu/drm/selftests/test-drm_buddy.c    | 49 +++++++++++++++++++
 4 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/selftests/drm_buddy_selftests.h
 create mode 100644 drivers/gpu/drm/selftests/test-drm_buddy.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index eb5a57ae3c5c..ff856df3f97f 100644
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
-- 
2.25.1

