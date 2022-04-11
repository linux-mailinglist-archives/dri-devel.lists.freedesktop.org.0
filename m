Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B794FB4C8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 09:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9199810EF9E;
	Mon, 11 Apr 2022 07:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5181510EF9E;
 Mon, 11 Apr 2022 07:28:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXgXSccE/vt7FYZ3kAmKFrWAXl9I2YPSt3PD+jjxNcZF+ZADkCu0ubZPQW0fYSTeOame+6wgk8KUDmDa0k0LcPI49gyldC0jBDT6GAJpLn4um8xyom6AU9GfjLjfY37hKKiFzeDa9K/dte7mdgkTrIdCiIxICdgceao9WPIJ0W5bPB34CaSSNW/A417O2JTsWiiEb9TNImYmEc2ZC7C8E1ajmdC/m9mHF2e0grzhh7MvkpWckMaL+3Ph3LN2iDlOaFaK1XY6ec/ZH8hYfQ54mGUOY7+K3UHDhYx8/NWq2Bh9+xTpRT7qbkGbydmplDqBLWEuwZZyWlGXYHQ+pXHM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PiBswdLlqiTot9KhqB3nBNPfvGt1aX6CkjA+nRUkp0=;
 b=EjHEvYgAcvKyK4samlsYF4KEcnQ+iTjSNFEiPhpG7bW0hFRAQmkHYQcAMGGbOT+0dSakD4IsdL0zFp1W5brdvEQNqvO3lkkbwEnXLfNwBPN73Z/q9H5qLCAirOAAqcpnolj2XSKuQ5vSHBObHQH1/voTpDOiGh3hDV8E2OrfysY0kqtnFpMpFYLukvKi/d5b98yKHN0+E8zgbem2akCxlAx8dbnOrVMwQloeBbeOK2/9RF8D/acfc2GJpQcdIpL9OuO6iktXb8Nd8ww8XD9ptrb0QYYBWCGBvdDrOOjvTPpCrS4vqWtupm0gOBBgrd9Qc+k1o1NoMif2JzH7zEyYEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PiBswdLlqiTot9KhqB3nBNPfvGt1aX6CkjA+nRUkp0=;
 b=gw75cS+YsvcKS9Lml1rsCfTT+bchahqxMgYVTVCuNf/hjNJOJ6hHS9SeTU6fWs4JrjIoXCyIrJfwGyknuwDLLDQcNiHax+BvtAbYsXinS7JNRd4JrjBbQorwooGAcTX5RrsGc/ztDS1wHRgzdUyPXg0nZG40BFwNxkYrV4tONBU=
Received: from BN9PR03CA0230.namprd03.prod.outlook.com (2603:10b6:408:f8::25)
 by BN9PR12MB5276.namprd12.prod.outlook.com (2603:10b6:408:101::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 07:28:34 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8:cafe::32) by BN9PR03CA0230.outlook.office365.com
 (2603:10b6:408:f8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 07:28:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Mon, 11 Apr 2022 07:28:34 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 11 Apr
 2022 02:28:31 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <igt-dev@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] tests/drm_buddy: Add drm buddy test cases
Date: Mon, 11 Apr 2022 12:58:01 +0530
Message-ID: <20220411072801.15097-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0154cc28-d6cf-4f48-11ea-08da1b8ce323
X-MS-TrafficTypeDiagnostic: BN9PR12MB5276:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5276411342C12D4C66AAE759E4EA9@BN9PR12MB5276.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nMqcDSMJLYyrrFMsBEBm+ngBWNyJ9auStvI867CXMEuT8qyFgV5XyWWZpzsNgBWoPhP6uTgd68bfIkh1HegGtHYFCg113mliN+PFaTyS+5xJwowEeRRi1/7rRpnlHGJ5+5yRWl5h95sm2AMUHawgFvlFxaumo0iG3E1GBzsu8HL37IUU7bv3YCHsFAvjVC7c6FoJ9p9A31XHuX9BR+scEqkCCxK/x2QQHRamksmEZEC0oe6v2FxSBP4TobsmQM/O4YD02oUKpAn6/nj0pjXVaFAF6/T4cJt3XdWFHk4vm0Wg1cbhCzKceKJv1VLHYFDW1iNrMLJA1Keu8fuCFq51o0KujhrH910eTCDVnnWVOVuppWwcseeJ9MjQnRvX3XJ44LR8RFcMZqYpo1dD59/+Vs+P4ggyOigalDw0+AXVy05yvVQnWG2xXUkbMe6ofrr3GKjA3Pyd7/MeXJ8X6qaMi5x5mWlXBC2qiLCrwmWmzZ/8VDAt+3YpA5RfqupvTs913JIwhX95XWpyXtoiZYPK23gEvyf/qifE89IuSCSxMPbFTzFgVF7fdS/RyCh4t78x+CdTFDEC6SRSR+sIHCrut2iL5WtlfnVJBdx6zYTq00dUR6hr0niA+6qs16Q6BApYHoAtzQRJ40hR4uXX7pJabBp5NTCS7rusFTfUA8kSbeB0Bvy+mbq0yR1jMvv0SyFFHjzy/qho5t+2wdb9wYAhmQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70586007)(70206006)(8936002)(5660300002)(47076005)(36860700001)(2616005)(1076003)(82310400005)(426003)(7696005)(186003)(16526019)(26005)(6666004)(336012)(508600001)(36756003)(2906002)(40460700003)(86362001)(110136005)(54906003)(83380400001)(8676002)(356005)(4326008)(81166007)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 07:28:34.5350 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0154cc28-d6cf-4f48-11ea-08da1b8ce323
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5276
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

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
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
index b0eab3d6..4ed8e610 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -10,6 +10,7 @@ test_progs = [
 	'device_reset',
 	'drm_import_export',
 	'drm_mm',
+	'drm_buddy',
 	'drm_read',
 	'fbdev',
 	'feature_discovery',

base-commit: 016a7169e66b710a6720ed8ff94815a7e8076541
-- 
2.25.1

