Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 748554FC463
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 20:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5EA10E634;
	Mon, 11 Apr 2022 18:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AAA10E053;
 Mon, 11 Apr 2022 18:51:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFTdoW8F5j/P9T2NkzZTBgX+OS7JgtRO2O8elxLYs2QoSBeN9DxxGfQbRM+YJQ29YF6pYNo05J3sFxQf6+f5zW3qgZ04LZnv8BI8vqofk7S/hizJhrSaYk4whnQ7cgvwd4COWTktbZhCA2xD5X/PpNECULyfff141l3Zp9kkKkqZdybkDrXrCZektf+zPuE5KhZqTMEQcobBebRPr1YGXA6zhPTIU6B/dnioXXIHmuvKlp5Cn2LOAanxs/fm+BY/aqwfLU045kcchUlYh7cDLFbMZHdnRkzWIYTz30czMYWRc3fr+cQzgrKS+7lFIAF4LpkUyOsiq6KVzP++je9M2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNR41bqIRskitPGO6HlBXHwKS0pJXtfRdm3+52Ad1WE=;
 b=WB4JzpCbmp/E6TGsXjc+QOEk3pqRme1pXmobuww38jC62TQCRgn/+aLIMZUXot3rNEVcGZmGlE7AyBvhVjAFOE0NaNXg2DL5XweI+ME/FqPXXsaLgC/UTTgpDonEYLeuptCxGUiT09FFNqN9XmwSoY7Aj+iOVMYBYJV6VRfMrkfxZMFh3SzmxLKivu9X7nzAWjp2DMz6Qgmq5rERI/YKPrMouXsZrpho/j6VXqMAEbbiJroB1/SxXgDm22Pjkh1NWjXIT7GbN+/yw61E2dzJIqPZD+6zYc7qNlltGk8V5Khh+sTD+LFvghhEKRa6nVQE0QAYe9OFxHoLqYbXOOegKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNR41bqIRskitPGO6HlBXHwKS0pJXtfRdm3+52Ad1WE=;
 b=ArxTDsEJlultm0kZjVXA/G1qgXQWG33cQ58ZuI4K3LmSBMEuDjpYjRgtcekLAZb39YgFEB/pv43o9sp56czSBkLbBio02tSHpPESKy1OCBW5v6tMRxsgo8INLpA8dIzZFKlNZqmn072LxgiKJ3eQcDw6QcZvfNZixZFnonuLT+A=
Received: from BN0PR10CA0002.namprd10.prod.outlook.com (2603:10b6:408:143::16)
 by PH7PR12MB5619.namprd12.prod.outlook.com (2603:10b6:510:136::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 18:51:02 +0000
Received: from BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:143:cafe::60) by BN0PR10CA0002.outlook.office365.com
 (2603:10b6:408:143::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 18:51:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT054.mail.protection.outlook.com (10.13.177.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Mon, 11 Apr 2022 18:51:02 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 11 Apr
 2022 13:50:59 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <igt-dev@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [igt-dev] [PATCH i-g-t v2] tests/drm_buddy: Add drm buddy test cases
Date: Tue, 12 Apr 2022 00:20:42 +0530
Message-ID: <20220411185042.24338-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7317f60e-3d6e-4d0a-b428-08da1bec39c2
X-MS-TrafficTypeDiagnostic: PH7PR12MB5619:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB56190B0BA81B7FDC46E5609FE4EA9@PH7PR12MB5619.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qpxcJAV6gsPaycz4ACwdsT2B5zV9H2wbmfBcaLm0zKlK7S2T4TjAbFgBM9Mu2hCD6e8J+JqHuKP6J9TTle23mp8uLdR8aJEr76hSxU/YaSZt0QJdhnNlsyEaV0vZFlp5aYyFDrhMLOw0SpYLZViQhJzaL+F+dETq12RqOZ1Hr9sdyFI0RT5T303Gah++DdyjUYA44cMvMcqagCfv+AbObki6Q/ypE3dm0/b4jiN6ASbKKONxGUeHiv/fu6AI8HpwhKje3VK3HjRkJfyxTjO2FB3dMutaoTHpk2bCY76//gAB8x9I4l3zfUNbgA8zkTYaIUQ2E/9usETDGx0ulMgBZIhAIahx6ufqLv37WIAj2yXJeL0ntwY3WR/SUNwaMzQvg/MUAr09aRXwiYqTNFSpo+UXVXIMZqucvUi9+TOqZvhMetl8j7FU6QojPom4hs9uXlztfrAzoSI0qu1G6haGL7rQDzVG1mFn9sh5E6vQBTQy8LgeA1y0Kvmr+dDbDOoJUUZwsTxztgr0GSAk/CeNewAhT0I1j5A6UF8ECw9wtFFkeEils2GaZi+NkCjpN6WYXO/XoMdDiMVIb/sjqwcdp2Bj0aoXdWbm30q3p5QV/rx/f+iI5LCXHDvaZr9chk2+YOXcvCI8L//0waNwZRXgXmXFxecPLhu2njqo2qQJYy9rR7I3U/guG3zJ4T6lE0TtdUXspQ+mkmpuCw+IfhHNOg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8676002)(5660300002)(70586007)(82310400005)(110136005)(7696005)(36756003)(8936002)(40460700003)(2906002)(81166007)(356005)(316002)(336012)(70206006)(2616005)(4326008)(54906003)(1076003)(36860700001)(6666004)(83380400001)(26005)(47076005)(86362001)(186003)(16526019)(508600001)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 18:51:02.1014 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7317f60e-3d6e-4d0a-b428-08da1bec39c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5619
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 matthew.auld@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a set of drm buddy test cases to validate the
drm/drm_buddy.c memory allocator.

v2: sorted in alphabetical order

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/drm_buddy.c | 14 ++++++++++++++
 tests/meson.build |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 tests/drm_buddy.c

diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
new file mode 100644
index 00000000..06876e0c
--- /dev/null
+++ b/tests/drm_buddy.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_kmod.h"
+
+IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_buddy)");
+
+igt_main
+{
+	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
+}
diff --git a/tests/meson.build b/tests/meson.build
index b0eab3d6..7261e9aa 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -8,6 +8,7 @@ test_progs = [
 	'debugfs_test',
 	'dmabuf',
 	'device_reset',
+	'drm_buddy',
 	'drm_import_export',
 	'drm_mm',
 	'drm_read',
-- 
2.25.1

