Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E535B7EB76A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 21:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0464D10E4C4;
	Tue, 14 Nov 2023 20:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DEE10E4AF;
 Tue, 14 Nov 2023 20:08:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMFMwkRu7hFTcTQzKgSySyFoG/FISTceClJJLa4Ast7orOirzzBb7969ph6L4PrDPSGeoGT2t4YDNppcnSJH4PErIm9v4t/fvER5ilvmchutBUUS62KGRz0kR3dGAe8IxHV4yswSWAt9j+iOE0a97mgcBeMvIvTAmn31oB94ou8Y6lcWsQ+DMeRh3XpjgeKcrNK0O0ENZwSNqVsdXWFyM89tUQyify+jevEU6MfL2ePzbWwc6d67Cc7yZ3xMBQv/F0FVYOJ7wePkW+lBTAKJGyn+V48WOX/VwOvecNnykPy53oOhKQIHyF72E9TIYezme1P+fJE+y8ysAb9VTvs/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76JZxh+YJkC8idO+jYAGv9B4q2EqA2RqBtQWU35FY80=;
 b=f4Htq1HE11bGUD0MtWI6cCGB0PGyOcG3UDZrBwA+IP2pjY870LFe4MwGb7z8q4E6vG2lWr6x7QApsH5badK9S3IQOLhyQneDm0hz7jQ+Sp05aee9obKx5CyDK20eW/WOeTua1FKE5g+CFA4kSism/pj7zrhQQWDE+GTSQ4Z2P9odtukDFlqsJIR42A/Aui7OHUPZUzADtg7isk946lRVB+Un9Y5gZ/Gi7ZAD0TFg7tXZLNwAyvXPIggAwFD62Qb3UHJZsmYVuXEsxioHUqziMJAfMDVGV9/AjdFchnbwGIiImjxvqF/4F/hQntk5fyO/YwGO6eKxc4oh0XJtJ3+oxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76JZxh+YJkC8idO+jYAGv9B4q2EqA2RqBtQWU35FY80=;
 b=KcBCsJHkOJCMLK9GKhB1g2hNaSEXpTtKB1lIPb4rch2004n2LDSS2Tk62ickPErfjWN75ow88caGNHUbsnIqWnN74RbQJguNPSe6iC0FmNnrVIztNfTPj2d6v5/sJa9by5n6dMPhNuvlHSA7Bst25igCObrIhanmEXqRHhX9oBk=
Received: from BL1PR13CA0283.namprd13.prod.outlook.com (2603:10b6:208:2bc::18)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 20:08:31 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:2bc:cafe::a8) by BL1PR13CA0283.outlook.office365.com
 (2603:10b6:208:2bc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15 via Frontend
 Transport; Tue, 14 Nov 2023 20:08:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Tue, 14 Nov 2023 20:08:31 +0000
Received: from test-TBI1100B.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 14 Nov
 2023 14:08:30 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Mika
 Westerberg" <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v3 2/7] drm/radeon: Switch from pci_is_thunderbolt_attached()
 to dev_is_removable()
Date: Tue, 14 Nov 2023 14:07:50 -0600
Message-ID: <20231114200755.14911-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231114200755.14911-1-mario.limonciello@amd.com>
References: <20231114200755.14911-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: dc57d657-717d-4614-c480-08dbe54d797b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T4BahmZU3Un4oNd/2ljiPUI+hjuf1N6261Mk/6iGoLxzfcNtKSZMLkQhSlFx3hPJR8huikvqI+2MinzGPclyI7gAZrPwl19qSnqRzx1IGLwjqVp10AI1Hb436/G5Bvo+9aDdRvvsdWoRsoug0oFCGquuD+547R3PC0+QW5/6aM0rGiaCb7/pHqEV4yBDkifbddsrs81zxEkS1GEhegn5j23pO5nVP9zeihu7CNvmgCrKAnnOZsLrjxyEx55PpHfpnD/2Oh5Q2v48yYyChwWNnK2DYuD28tqNAq816xoQn/IwkmhYCQQTC7adYWRVy15rLhIi8o8P0KkzWMw70kXozxdpKO3LrFRuktJF8KWsiJjqRKwO84UgzkoeIvPdUYUdcWnE6Tr0yEOigGUhPf5qC25Ku0Q6AGiI0atuoToSj2PFQZwi1IMXmeHPTulSe5qypyeCUFSVG0TaHnK1ShdgQP/+2Oig+jBP1PQSKwheMEWVPXnq/r5r6Tyc64tR3Sv7CdBU62zdpivenrSW9VquwoIp8ToReH9jNIjFS93YXmQzHxouqyiNTFL0QLGoJWWde25QBe78z6pSnvypK2TbXZSVb0mtQbDkO+78j/aBdUwgSLX5VsJi6ULRWj5B50tGDNfIwkjjvdLQmgVddB/X0o8XbXhj8VByGzlAmZohKAqCAQ5bA7edN4MMo02wfPIf+Z1XvKYaEYQ62eb2NbMqXatHp1SG1LFoCMuNHr3ouZIpJ0Duwh+Rg1AEGVfhW7fTTwXODgqvniDymkXcw+1lItrBLOBA9UaVBIUHvY+NnviqZxpxG3PJsQA5Fym7qjPN
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230273577357003)(230922051799003)(230173577357003)(82310400011)(186009)(1800799009)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(41300700001)(2906002)(70206006)(36860700001)(426003)(2616005)(110136005)(86362001)(356005)(70586007)(82740400003)(81166007)(16526019)(26005)(336012)(1076003)(7696005)(6666004)(83380400001)(47076005)(66574015)(478600001)(4326008)(8936002)(316002)(8676002)(44832011)(40460700003)(5660300002)(54906003)(7416002)(36756003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 20:08:31.5516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc57d657-717d-4614-c480-08dbe54d797b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990
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
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 "open list:RADEON and AMDGPU DRM
 DRIVERS" <amd-gfx@lists.freedesktop.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, open
 list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVER FOR
 NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 Mario Limonciello <mario.limonciello@amd.com>, "open list:DRM
 DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Maciej
 W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pci_is_thunderbolt_attached() looks at the hierarchy of the PCIe device
to determine if any bridge along the way has the is_thunderbolt bit set.
This bit will only be set when one of the devices in the hierarchy is an
Intel Thunderbolt device.

However PCIe devices can be connected to USB4 hubs and routers which won't
necessarily set the is_thunderbolt bit. These devices will however be
marked as externally facing which means they are marked removable by
pci_set_removable().

Look whether the device is marked removable to determine it's
connected to a Thunderbolt controller or USB4 router.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2->v3:
 * Update commit message
---
 drivers/gpu/drm/radeon/radeon_device.c | 4 ++--
 drivers/gpu/drm/radeon/radeon_kms.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index afbb3a80c0c6..ba0ca0694d18 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1429,7 +1429,7 @@ int radeon_device_init(struct radeon_device *rdev,
 
 	if (rdev->flags & RADEON_IS_PX)
 		runtime = true;
-	if (!pci_is_thunderbolt_attached(rdev->pdev))
+	if (!dev_is_removable(&rdev->pdev->dev))
 		vga_switcheroo_register_client(rdev->pdev,
 					       &radeon_switcheroo_ops, runtime);
 	if (runtime)
@@ -1519,7 +1519,7 @@ void radeon_device_fini(struct radeon_device *rdev)
 	radeon_bo_evict_vram(rdev);
 	radeon_audio_component_fini(rdev);
 	radeon_fini(rdev);
-	if (!pci_is_thunderbolt_attached(rdev->pdev))
+	if (!dev_is_removable(&rdev->pdev->dev))
 		vga_switcheroo_unregister_client(rdev->pdev);
 	if (rdev->flags & RADEON_IS_PX)
 		vga_switcheroo_fini_domain_pm_ops(rdev->dev);
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index a16590c6247f..ead912a58ab8 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -138,7 +138,7 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	if ((radeon_runtime_pm != 0) &&
 	    radeon_has_atpx() &&
 	    ((flags & RADEON_IS_IGP) == 0) &&
-	    !pci_is_thunderbolt_attached(pdev))
+	    !dev_is_removable(&pdev->dev))
 		flags |= RADEON_IS_PX;
 
 	/* radeon_device_init should report only fatal error
-- 
2.34.1

