Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601D84B18A3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 23:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D76010E984;
	Thu, 10 Feb 2022 22:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6006510E97D;
 Thu, 10 Feb 2022 22:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cua3yXuKjxvLiWknOMuIdCb8INnx3Wxc/zyKY/Imvdtdfz3iHiQasdtwx+Xiui6fJiuxoTLYacjGl1cJ3VvSsod6F+pAvUJrozS50ULdsq/4pt/c2QQBUrxpcm6L3TlROQXX8th88NpRc7kmNcR8qPoctMMsF+FyZ1TfjT4XIZUdQWirTFecygO7KWtibfC3vt5Q9A5oyfMCxKDW6xOY7W6/2w2gBPtiWFIhCr8A7Ab5RPP+WBFRLgudRn0Mj9mowe8O/vFJixJ88Ua29o/K9VRSOVoyS2JABT1O11BeimHTSdP5lsv5CdSRLrMkWEpx02Y3s9Vo2+qGnoI4gNFG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CJsbT/uQNbCLg3zijkw2HtWNygmK8JRosfQfMJvjsA=;
 b=LsqXOXTJq+/8VTthP81iWoyHlHKxQmoJxVsLG7UPscLBFAu4zx1EZ5f0B9Cgk4MTYMTaNesKsSpCByv4FixjsdT/RTt+vl3ZGZ7xjB2VKz0QHN80p5IZdTgyoAA9YdqJDtyF5G1edY7B5nWOra+EIR/46O1injC+2WHc46rp59wfyMznxxDgm0woc0xjno5oPx5WeMrYrRsXrGonVzsbEArsc9T1aIW1vEgCLfGlakcPZsPTKre4RcsrCmptzSiNtUotcuoR2R7WjoHQFOZwB8E9QThlVBwx1cO/P+3G6fr9dhTGdwMFFJ4oY5X8TWFNPb1qMkOXkpeMDbzxn9djqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CJsbT/uQNbCLg3zijkw2HtWNygmK8JRosfQfMJvjsA=;
 b=4bZr9vO2WdfxefSBKSGGJ0QEbSb5Nzy2w+qJAOXtySdt0ColPST6YT3GOaX1y6Rt78sK0ul/QbGhihH6y3SVz3nmWIdEVxgKmZsJ/PFYaMf7AglIA6+sgEZAxrg92zlRmYqFB5PxQCfXkWGfZX+s9y6RLKmaPSUQg9CH/OunvEw=
Received: from BN6PR2001CA0045.namprd20.prod.outlook.com
 (2603:10b6:405:16::31) by BN7PR12MB2675.namprd12.prod.outlook.com
 (2603:10b6:408:2f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Thu, 10 Feb
 2022 22:43:52 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::5c) by BN6PR2001CA0045.outlook.office365.com
 (2603:10b6:405:16::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Thu, 10 Feb 2022 22:43:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 22:43:52 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 10 Feb
 2022 16:43:49 -0600
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
Subject: [PATCH v2 9/9] PCI: drop `pci_is_thunderbolt_attached`
Date: Thu, 10 Feb 2022 16:43:29 -0600
Message-ID: <20220210224329.2793-10-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 43be3d63-05e4-4e16-9aee-08d9ece6cfdd
X-MS-TrafficTypeDiagnostic: BN7PR12MB2675:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB2675DB229B617657EF46902BE22F9@BN7PR12MB2675.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cLsYPd3OUvcoClojACS88+9RFO/jh2lB/qXRqPvZA3tVoXceLiCAPGOJMeStCrfUxMai4SNg3kHZnV/tGf6r8B/C+ZnfOqrHqVflcprk+UOgDWU2TPqtPn2AEJQQVMSA45lFpCZJePDuUrUGRH9XJSitxXFWyak9QCT8NG3UF+Q7LTnT/Uk/vhJKkra8S+zWPjZ2ocM2jeciZq3WV7c23PTWAuzSIZQunG3chZPQsC6NelxzfiekCIYY2XZal36dzSu7/H1HdeKfeAmuWkKsDVz9V/IlTlLVxPmSIFL1mSTrZrkDoAAcbx8XTR3oiqdglXSCrYY+BV3jNRw8Xr1koXVPYNb+mwXtOGlHk5WUM3bNGF+Tfp8G9TuMc0cjqsrt/Pukx9c+HHqS1QuX8NRXvj4RtpW9pn908nWGKpst6KFDCGsK1g7u/3gjbo56LvJapdqfmVOWOXtGBZoChYdjjjnUqhgfNCWytknprMsiOeK3XN4Sq5vLMh4U+g5WhZOmwD/KaBp8vcBX5WwZmXofRFlw4Mlnis6Hr4ROWn89kT40q6fk47g4y5SkreOwo372eAm1Mr+tYymnineqgJfNKi8heC0CHSCFk8Gb3hk7lvRwDoaS/XVoLPQY4ztROdPiyLrMa/s9njO9He7OGFIc5b9uMrax7fnd2qincoIWkz66pXefte7kc2RZNG8i+pUI1bRNTDSibY6z1Vd6bIZpNxL53c5/hccNQu428hlsrMI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(356005)(26005)(110136005)(16526019)(336012)(426003)(54906003)(316002)(82310400004)(8936002)(70586007)(86362001)(70206006)(4326008)(8676002)(186003)(7696005)(2616005)(81166007)(2906002)(6666004)(1076003)(508600001)(83380400001)(47076005)(36860700001)(36756003)(40460700003)(44832011)(5660300002)(7416002)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 22:43:52.3050 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43be3d63-05e4-4e16-9aee-08d9ece6cfdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2675
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

As all drivers now look at the removable attribute, drop this function.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 include/linux/pci.h | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index d9719eb14654..089e7e36a0d9 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2434,28 +2434,6 @@ static inline bool pci_ari_enabled(struct pci_bus *bus)
 	return bus->self && bus->self->ari_enabled;
 }
 
-/**
- * pci_is_thunderbolt_attached - whether device is on a Thunderbolt daisy chain
- * @pdev: PCI device to check
- *
- * Walk upwards from @pdev and check for each encountered bridge if it's part
- * of a Thunderbolt controller.  Reaching the host bridge means @pdev is not
- * Thunderbolt-attached.  (But rather soldered to the mainboard usually.)
- */
-static inline bool pci_is_thunderbolt_attached(struct pci_dev *pdev)
-{
-	struct pci_dev *parent = pdev;
-
-	if (dev_is_removable(&pdev->dev))
-		return true;
-
-	while ((parent = pci_upstream_bridge(parent)))
-		if (dev_is_removable(&parent->dev))
-			return true;
-
-	return false;
-}
-
 #if defined(CONFIG_PCIEPORTBUS) || defined(CONFIG_EEH)
 void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type);
 #endif
-- 
2.34.1

