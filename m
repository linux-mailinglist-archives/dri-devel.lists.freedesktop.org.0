Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424E34B2DA1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10A910EB17;
	Fri, 11 Feb 2022 19:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C13810EB08;
 Fri, 11 Feb 2022 19:35:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guTxax8IAaV2yPQlgRCaTgAxMM41DMrhDxHnSFAKIcaKPSItEl4uWCbkUEHXx1sJYzmz+0ZHfjNUqkTe+nTkzFHv1oFbryfu8TX+QzGNf2ZEThMJ45pP59Dz2DVkXwxtnCcUWqGDY0IMn7DvATkrXLfsmS2GtcHAPKR1e8kJppX2e/SXvlGUMVhzNYQhANu2XxhB9pSVQWcQQo22BojMpeyLW1imJ1sNGxp5x8tcQEQjw5ptvcwQ16baYVaabqYIoLJidzsfbjWEnIe49/mhWVTGtgBdiBwMzGKxpgKZqkOKn+r4ilBqpRYKgGR6YYLYu2tSsP6SelWXYaxu5TU2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4yk8hvDmhzfiKFK+3l63Ar/Gg2nsFdd8RGrNekuAok=;
 b=Bz1OzRDCbGxAiwhrfFNQm30jBq1YG4o4XOrbqd0MFrmBVCC9Fw74Xvlfc7vuZhp5dMNi19M7hp8r22ErnzdLARDmAHaHYH8cPPLTTC21flcWbh2yzQP1rwlLCewe0y17V5d7ddBvhzcxt1LSnHjxG+nbdYidzmGJYFwTgkSvVrG9w0icIAP/pO6ke0SbvQaTowENM0vcM44H+zxJk5n2ye8QefbvWYzFZxxZhYPTQ1s0PmKjR2e6H/npqNxCX+HHrdH/Ue35kl3VPoG/Hu8mCzC6X9ShE2Gfvejlhixgbs6YCE+ed5x+aydlCvTXcJfNMlqheQzLwB06aVmhmNZwhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4yk8hvDmhzfiKFK+3l63Ar/Gg2nsFdd8RGrNekuAok=;
 b=zPQzEyY2VkAIyt/DzmjYFcqPlFkjqqK+n+FSasL52EMFc1S5bNxN2kywOJLQPMsystKhVf1ydslwHvHL/vw3deds/jEQbnZ9QADpjRtSVDPJzSVkA7olA4MA4UOPFSuwO4tV4JCzuH+3p1DT+647YgQm+d1AM7aQtAnef2agrss=
Received: from DS7PR07CA0024.namprd07.prod.outlook.com (2603:10b6:5:3af::6) by
 DM6PR12MB4155.namprd12.prod.outlook.com (2603:10b6:5:221::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11; Fri, 11 Feb 2022 19:35:11 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::b0) by DS7PR07CA0024.outlook.office365.com
 (2603:10b6:5:3af::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.13 via Frontend
 Transport; Fri, 11 Feb 2022 19:35:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 19:35:11 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Feb
 2022 13:35:10 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 08/12] drm/amd: drop the use of
 `pci_is_thunderbolt_attached`
Date: Fri, 11 Feb 2022 13:32:46 -0600
Message-ID: <20220211193250.1904843-9-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211193250.1904843-1-mario.limonciello@amd.com>
References: <20220211193250.1904843-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b703fca4-0194-4a77-9918-08d9ed959e6f
X-MS-TrafficTypeDiagnostic: DM6PR12MB4155:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB415567EAA595F86B5D743804E2309@DM6PR12MB4155.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZrVuK1jDjReuRyJNtH94sPOFI6KoCSR0cKRsTvcgVppCVwPMzkMJUqcy2M02cT8nJiSmrO3myxpeudN5H5B+jXau2dYw1XeW4AQJ8gck/Cyj0JcJQQg51ROQZNbVWElKaOOplyUUIBcT3Nt69cwGx33uD+if/Z1skvbeIVh6A8CBzuBBGbUlAS6afiah0kGtSkkEb6SlcfQzXFB4cw9eoVEolmaqpTk62Pb0SxjrjcJb1K2UUDR8o8dlC3z7oEvtT4mPV2kLi2rl7H+/uu6zdLu3hzSMNbzpIvrH1ShXporR7xerjyUGXyy3GAYbx5/gl6D/lF1iLX4RFnaOk9amPql4DbYEe2pTGmaxb7hQbnBBxWAAmgoB7jbEQbbIRDT5JPoLmsRSkStcIGYE1nNjpVahqwfaCpISTb6bglK1ZWmJSLtWhMVpNHZRT7z/n1fCW1THjtYmgzF9bHpmZ8DWikgtukpNGAa7k+tMtZg3vljamprfNZbdbeguzbreY6M8DyN5ffCcaEZh/V4EwC9mpHLPLaauXnHT5oUBV0rkM66BFO2woTbB+C7CBmX7/gz1FfWrXrUuygpTQwtto7deQVS3QLi7odct1SEPFfluy3S8qPi8zDv1B8XcRcHTGJsUS/FgtiUkEExSDUZ0Ojn2VXmrBrmXf+TYHqz0a/dZc7XpiCX77/FFcvX+UWoPSch3qpvAC+ou+BJgfIsdKF0dFMlT0LaRgq06WiUrlKDvkgc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36860700001)(336012)(16526019)(426003)(508600001)(6666004)(316002)(40460700003)(36756003)(86362001)(8676002)(4326008)(70206006)(70586007)(54906003)(110136005)(83380400001)(47076005)(356005)(81166007)(2906002)(5660300002)(8936002)(82310400004)(44832011)(1076003)(26005)(2616005)(186003)(7416002)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 19:35:11.2566 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b703fca4-0194-4a77-9918-08d9ed959e6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4155
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
 Andreas Noever <andreas.noever@gmail.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently `pci_is_thunderbolt_attached` is used to indicate a device
is connected externally.

The PCI core now marks such devices as removable and downstream drivers
can use this instead.

Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 1ebb91db2274..6dbf5753b5be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -161,7 +161,7 @@ int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags)
 	    (amdgpu_is_atpx_hybrid() ||
 	     amdgpu_has_atpx_dgpu_power_cntl()) &&
 	    ((flags & AMD_IS_APU) == 0) &&
-	    !pci_is_thunderbolt_attached(to_pci_dev(dev->dev)))
+	    !dev_is_removable(&adev->pdev->dev))
 		flags |= AMD_IS_PX;
 
 	parent = pci_upstream_bridge(adev->pdev);
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
index ee7cab37dfd5..2c5d74d836f0 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
@@ -382,7 +382,7 @@ static void nbio_v2_3_enable_aspm(struct amdgpu_device *adev,
 
 		data |= NAVI10_PCIE__LC_L0S_INACTIVITY_DEFAULT << PCIE_LC_CNTL__LC_L0S_INACTIVITY__SHIFT;
 
-		if (pci_is_thunderbolt_attached(adev->pdev))
+		if (dev_is_removable(&adev->pdev->dev))
 			data |= NAVI10_PCIE__LC_L1_INACTIVITY_TBT_DEFAULT  << PCIE_LC_CNTL__LC_L1_INACTIVITY__SHIFT;
 		else
 			data |= NAVI10_PCIE__LC_L1_INACTIVITY_DEFAULT << PCIE_LC_CNTL__LC_L1_INACTIVITY__SHIFT;
-- 
2.34.1

