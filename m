Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 320374B5EC0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 01:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396DE10E374;
	Tue, 15 Feb 2022 00:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB23D10E35F;
 Tue, 15 Feb 2022 00:04:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7SDydtPsm8NwwlhElWLH440O4nJKOpENInPvCKt/YhN/d6eMKLt2D6HtlTWCmDAkn6GNYvA1V36m9cbiCLTwkCWfJsz4e/X1zqUoXEcZ3+muPFw8/ZSveaPhd9xteyJr72n0YDdSDIwlvuEyrpDppRfimRSZM8Zku9d24BTxa7tOFOVhNr/TPm235KXFqXGuI4B2r4YHWfUrtP+X3eJQOUkDAmESkMECdEcurs0W7CAct3iP9Fg8GHU4vRL3t2tSOkcjpciij+6ncjo1a5l7VRlmYqEcRiwhaKxdmBrRuAf2OB+xenWJXOYI+kyOig3bxPO9XXUIWHuy2rnQGL0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neyootgBRunSQAJPnXb1dPCfoyhMOxPxpCnyWraQL7E=;
 b=avx2os7OBH1D98HtvZ8ehIl/WHaqLbfKmbd25pswlQt06kSjf2/UBoMxrpsLPsM7iuTkU7MCOeplpnak6VHF+OsggoqZHsvOFPQryr51oUdoUhWOY82CjcCF1/qaDW/R4U8DrgeznLEEppifmWn6EtW5vMPHtIXBbZV+x5zGy7vm85A8GnmS++w1uSjHcfzPfaoZ5X9ssUgafOcltQ7neXWtpgClIYuBOoLDpfVa/PtKdPmHfYAZvIa5HkvoGmu5DBJaJCKI2ZnEC40yssd58ZVntU7R4ll6i48zqi2ATZCDb6vvD3AcU/nz6q5k9D07r483s/619Hk/t+L2qHCisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neyootgBRunSQAJPnXb1dPCfoyhMOxPxpCnyWraQL7E=;
 b=Lcy08OtthC1oKd6/6J7dRb7xsUE9+yos/MAG9XiYU416Y1mu+o3IDIDX/dCMdBxUX76312Y1LsVYX04Pv0JP1ekdjO0U1A7NL61rISSY/ahcXNnjPmHdBntML/YEscEW6oqFhY8nL69grJZEabzuRW2RCVKnxHVoPY30ptlCdIs=
Received: from MWHPR12CA0046.namprd12.prod.outlook.com (2603:10b6:301:2::32)
 by BN9PR12MB5307.namprd12.prod.outlook.com (2603:10b6:408:104::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 00:04:22 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::65) by MWHPR12CA0046.outlook.office365.com
 (2603:10b6:301:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Tue, 15 Feb 2022 00:04:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 00:04:21 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Feb
 2022 18:04:17 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 09/10] drm/radeon: drop the use of
 `pci_is_thunderbolt_attached`
Date: Mon, 14 Feb 2022 18:01:59 -0600
Message-ID: <20220215000200.242799-10-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215000200.242799-1-mario.limonciello@amd.com>
References: <20220215000200.242799-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf652107-504a-4938-c1c2-08d9f016b847
X-MS-TrafficTypeDiagnostic: BN9PR12MB5307:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB530720ACF2703AD67AE20276E2349@BN9PR12MB5307.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eXXYW+k/WOevwzdz4z7+mhwJxqCctucaWkfR4WqQynPxOVi1rTGv42iBQLB73x2BOkmwz9rfMN9uXQYMMFqS+jstE4Q8mcFiq4dZhFKlm/wr4ox0sIVQahZwlstENM27W5dgbCZ2PhQhrw+266UZ7qZPGPvy5p+g1pGPOiVg1K1y6nhfsaQp3jxPyfFYKw7NqIiF2V78jlwUOWo+vjLsegfw+Jd7Cq+ZooaTdsVK5fjozvR47Y47tKzcFIE0ALJlqYK2goRjzsxH1hhBL5Os7ii0junstZ39irUO9S4fRAoIhZ48mcF04HAlQ940Yh25pcNqMi1iV+eTmPO/Hht0bsQjvQ/MRAttUrzbIIhOC99UzYO+gca4ZfGWynz54mq1HkLK+V0xadaJlS2DBCcupAmc24NpZmRHI/1xWxrDVVnPaS917ErGDhcs+WPvEvF9ladY3nCqZURbisGn/XFgV6m9xFhawW/If0PSPqG8L+Fl8zSTX+Q6JmTMl65Te2DLqCT9U9eTvfCji+A25omrNisBg5AopsJ507JNphMAhKPh7zEfThZHWOKNYavG48iSwC7zt4c2rIa+qxMuRSIbESt+Q4atVMlmGuDZ5haED8l5sP/4Kaw1hvHIgjJbNfsQorG56pd3xv3aVXgxyM7pwRu5mW5FxonlNgitMC1qj2+Bz/BLrJzGXpvzloxJUqIU1KOecefyMxvRu1hMxLqK4d40gU0DAito4WF0k95RVQ0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(7416002)(5660300002)(86362001)(81166007)(2616005)(16526019)(8936002)(186003)(26005)(44832011)(508600001)(82310400004)(1076003)(6666004)(356005)(2906002)(110136005)(36860700001)(40460700003)(316002)(336012)(47076005)(54906003)(36756003)(426003)(4326008)(83380400001)(8676002)(70586007)(70206006)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 00:04:21.9886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf652107-504a-4938-c1c2-08d9f016b847
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5307
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Alexander.Deucher@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>,
 Andreas Noever <andreas.noever@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently `pci_is_thunderbolt_attached` is used to indicate a device
is connected externally.

The PCI core now marks such devices as removable and downstream drivers
can use this instead.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/radeon/radeon_device.c | 4 ++--
 drivers/gpu/drm/radeon/radeon_kms.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 4f0fbf667431..5117fce23b3f 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1439,7 +1439,7 @@ int radeon_device_init(struct radeon_device *rdev,
 
 	if (rdev->flags & RADEON_IS_PX)
 		runtime = true;
-	if (!pci_is_thunderbolt_attached(rdev->pdev))
+	if (!dev_is_removable(&rdev->pdev->dev))
 		vga_switcheroo_register_client(rdev->pdev,
 					       &radeon_switcheroo_ops, runtime);
 	if (runtime)
@@ -1527,7 +1527,7 @@ void radeon_device_fini(struct radeon_device *rdev)
 	/* evict vram memory */
 	radeon_bo_evict_vram(rdev);
 	radeon_fini(rdev);
-	if (!pci_is_thunderbolt_attached(rdev->pdev))
+	if (!dev_is_removable(&rdev->pdev->dev))
 		vga_switcheroo_unregister_client(rdev->pdev);
 	if (rdev->flags & RADEON_IS_PX)
 		vga_switcheroo_fini_domain_pm_ops(rdev->dev);
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 11ad210919c8..e01ee7a5cf5d 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -139,7 +139,7 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	if ((radeon_runtime_pm != 0) &&
 	    radeon_has_atpx() &&
 	    ((flags & RADEON_IS_IGP) == 0) &&
-	    !pci_is_thunderbolt_attached(pdev))
+	    !dev_is_removable(&pdev->dev))
 		flags |= RADEON_IS_PX;
 
 	/* radeon_device_init should report only fatal error
-- 
2.34.1

