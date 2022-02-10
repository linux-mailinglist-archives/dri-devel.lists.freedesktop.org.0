Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE534B18AE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 23:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB7810E98E;
	Thu, 10 Feb 2022 22:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D0910E984;
 Thu, 10 Feb 2022 22:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6HkABLvg8LCoKU+O7kZcPVfK9AH7DuXkyROwMhmEKqRzQpMQWCSSuSbQP4y4JCt0HRxpDNK/m6WUMucPEUgyvsyIoou4Dsu08BXhVYZISbvfX9EWAdB718QuGnszpVKKUM3BSypi4acqLlloS+3vHlRI7LDlXSXz9bfneWLC4ZZAuoUYCY4iYRCiaGUZDul0myuhhVs4IIM3gny//sDooRAprJM35RHTvJOLrLQ0/eeXWh78tG1A+a6uL5KD0258pn+BDcnBBljXnBiGxBclTW3TWOtls8JzwUcyb9rYkQpkso4PEKMauseWmU/4GsnZmhsVSE4I/GLrC7DrXaZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neyootgBRunSQAJPnXb1dPCfoyhMOxPxpCnyWraQL7E=;
 b=hfbzCPG2jAkbfTq3AHYYmXBwM6foZQXuRKg2RkmOdlryNDiq2VEnb5CzlsEg1eqrN4NeFHrJorRPueFhPvUa9+C2UrgTX706NYU6TjeRFSj+xHHD4yfVd6nvMlWkNqGI0BnNknhTjXdCfopUHRSKYxVGYBkIh7fuB6x/HZPmEJ3/8EgBf9/bSQHWxH/sF062F5aWrlIJgpunbkKlDnf4Iu6Pnb3vn1n127j37zeC9zX8BNnLF50e7Q6Ay3WtlGjwkwReSJgcTXTStWyzSu+0HhqO38su5y9gx/p7flbVbsLBa2f4/xhXWYR4H4PZad2ruGugIq5WvsPgSiziVmb8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neyootgBRunSQAJPnXb1dPCfoyhMOxPxpCnyWraQL7E=;
 b=klko5pHTtNu1x23niXVcGhH714oTM3vvbtAcSY1TqDFgdVrIxvknPNT68biA6oGE9EZyQKbmwnaWbUYKky7hsvh851gjrusXhQacxbnYNBjXiZlW/faBLfibcDgDRZvjtI3L+1yXvPjDbNj8Nx7Z2R/XsxUy0igZQOcexjDtQIc=
Received: from BN6PR2001CA0048.namprd20.prod.outlook.com
 (2603:10b6:405:16::34) by BN8PR12MB3138.namprd12.prod.outlook.com
 (2603:10b6:408:64::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Thu, 10 Feb
 2022 22:43:51 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::a3) by BN6PR2001CA0048.outlook.office365.com
 (2603:10b6:405:16::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Thu, 10 Feb 2022 22:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 22:43:51 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 10 Feb
 2022 16:43:47 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Andreas Noever
 <andreas.noever@gmail.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, "open list:X86 PLATFORM
 DRIVERS" <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v2 7/9] drm/radeon: drop the use of
 `pci_is_thunderbolt_attached`
Date: Thu, 10 Feb 2022 16:43:27 -0600
Message-ID: <20220210224329.2793-8-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210224329.2793-1-mario.limonciello@amd.com>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 467eba18-0094-4d40-0726-08d9ece6cf39
X-MS-TrafficTypeDiagnostic: BN8PR12MB3138:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB31389E82D08D425E1F9148D2E22F9@BN8PR12MB3138.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P339y8VAFhteLQ+lLzvWYC3t9TNCV49gwaV9iRj65dgWYZOA1sf6KOrfz+dNLbu7kddLQT+vcv1g4hh+svRPTjgmQ65qF6Cq+pxUkxKQ6j0mg1YXVIkoXETxbvzTdBFAVtTUHWOEopBfE+ChqH9D5JD0/zjkcHmOviNorCSVFzVlY/3rAQyx+iU7VmVX6vGcaNt/QzkgqJNxeLgXdYvGkh5J1NleU2gj1510AqMFPvoP7hvb8BzKorBlRgGD6L63xbX+CrixpQ3Lq4gtizyj5V4qCUm4ddkdR0SMLvCYKrUKTSoKbwrCKpUFTzWuPT1DP66U2Khn0ULnJJvTKiNLnvTUPcxSsR3LGhHjeTN37bToTH+TpKnuH/Yc+FNNWx6AV93KyeqjLmwDGKScHu9g7nCZDS4j7fCG+8YR+eDcCAV6JPAeKOARP7L2ycDzKHfR1HVva+hEzsHYP0BtWOPj7R6+JCSeNdhy1R5GtpZw/3SpXBS4kB0ykYlFTQvhi4608NORNEflvYQP0gi9L5y1ovZqLFPIY/hMsADHkrsRNgrV737KwauSaTDMEx3Trs2aOet/jYLQTGlAUOhiqjyyX0xjUZLL5LLmGOb7MyrkXCP4gdKITVLuPZl4bfSB1NCGC1PgYuRT3lAqfDD9/lKIFCwjBLGwQguP3NtyUgNOx1ub02UpNOZ3R7unaUHxQo0p2i0kslphvOpbQ+CPapjqltK1dpMDSyA/0YVXwqWb0uU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(81166007)(2616005)(110136005)(44832011)(508600001)(336012)(2906002)(36756003)(356005)(426003)(40460700003)(316002)(8936002)(86362001)(1076003)(7416002)(186003)(5660300002)(70206006)(70586007)(16526019)(26005)(4326008)(54906003)(6666004)(8676002)(47076005)(36860700001)(7696005)(82310400004)(83380400001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 22:43:51.2108 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 467eba18-0094-4d40-0726-08d9ece6cf39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3138
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Alexander.Deucher@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
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

