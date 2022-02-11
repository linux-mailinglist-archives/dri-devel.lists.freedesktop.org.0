Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 408974B2D93
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C49F10EAFD;
	Fri, 11 Feb 2022 19:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C23B10EAFD;
 Fri, 11 Feb 2022 19:35:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqgyUeuNJOuZR8R2o8skyayFRJLk9UYn6dyYFYleqFuqSAWrEkapnZpR2qxORlreAdFIYtSD0+lrn0/uCXkg7d9e/bje3vvM/3FeX5J6j5UIDxQTCSNCwjjVI/zyGAfpL8z8OTENdfOPKwXD3VlWKGKOd4XJl15Drajy07JvLXHTID1JBIwVG6o7OAnGV57MSFsHYwPbY07s6s7oMtHooHhFIz+E7MYNmn+RbckIWcWPMtPYufY+C9KrVdvSvi84SoMKgU4jCq1uZn6dvjDS0BxQ6JMy6vZjzrCkc+2gOwtL6XgB+wL/S0+oQXrOQhW7kP5zwGQ5A7rXzlSR+1L12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePYmeTfI1tYVdV1YQeEXeXNbHxPMCjFPOZ6uOCDxB6I=;
 b=XcAmQnh7kNxSHo5Mr1Tv+DZBwFbKif+ly8UMNmY6PWAZf2BOy7N4xy6ofjXRPv7UDB+PzT/hYLfjWui7rsUllLr1mXlDmOulkLafPTnTjytBbXZcVZ0rNvY33+FrQtmMObLR6sgjR8piqqhrX9IE2RjE7N8yRE/321c8PJiGwdewUlCh4c3rMQQp23J1h0q/Szyb+rJgtACzPspH5Sh+G+J001wxrS3HMXezpdreK1oQaSBoJINiYzOH43kP2j4MdkAfB4oniXxCfBxcm+NAYH3xFCJD+z3+FObd0GVGBUhX80A2uQjY7Ruy/tlPZdrWAN2kwl370A+okjdxEpAwcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePYmeTfI1tYVdV1YQeEXeXNbHxPMCjFPOZ6uOCDxB6I=;
 b=XxPcVvoIDbmOWzW/abRhedRrDzA3tdz972YllOh7w/lzi23X7dfHUzkwGbSFTEs3NfiY63s43KuUBDiODD95rxniHmYuQnKAsPn9FP3bISXbaTfEd7niPknk/rmdZ0wNffK0bs82hdeNq6HVtsO7xmrwAtjwreddZ+DaRcO55aI=
Received: from DS7PR03CA0220.namprd03.prod.outlook.com (2603:10b6:5:3ba::15)
 by CH0PR12MB5058.namprd12.prod.outlook.com (2603:10b6:610:e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 19:35:07 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::b1) by DS7PR03CA0220.outlook.office365.com
 (2603:10b6:5:3ba::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Fri, 11 Feb 2022 19:35:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 19:35:07 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Feb
 2022 13:35:06 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 02/12] PCI: Move `is_thunderbolt` check for lack of command
 completed to a quirk
Date: Fri, 11 Feb 2022 13:32:40 -0600
Message-ID: <20220211193250.1904843-3-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: c92e5b04-b49a-43dc-d8f4-08d9ed959c1e
X-MS-TrafficTypeDiagnostic: CH0PR12MB5058:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB50581BDBA4521069408974A7E2309@CH0PR12MB5058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mdzZ/RjbW62UNak3aBwfT8a7fMLD484/FVPQLhx5nyUBN3phhe75osDN5pTksUtnwlR8qrq/oxumryyxP2zeVFThDw/eDjnne5tQypgRFde+vVJ88FP9v1d4e4yHJxof/EHm5/Wk8Pv+r0/qGnUXgKf/g5R9wr2UuVahh9BRYOpL9HzXN6+8Z/elRyvag35IcSUU+kHwqXAYBXRCbb+c/zqGz6pMxS+fbcRRVGrig1H+gPkr/NqgNy84q19kj8JFfjNvfv1XpojwKkgPimqgjEu44jQ01UMY/c2yN/TkpFzhgl51STYa4fD59rDdscOZe7XORz35G4TZPS5voJF+2+SFt8nSkuINj8tqa8XOm54mFexkRvVGreWLHVm4CTHUHMP8/DwCrAXiYLTbMIWjhyZwoutvMpQ/bawqswzHF6guReLUXvbjNUlq88HHcgrbsfDwUo1vmkoqEEGjnAB7mqI5HwTEPNE6kI4q3QIoXoypbBN4CXN5u2RgIx+KIyoeEe6j3nyFacRo7m3RdLGsSrJJetgnINL3AUQdQCumJYb/pVNilzAduXbRD12pNkK6bcUHMJpCnr8vl3GcmlMe8ZheGwYVEhtIEzvgC9/5kO9B2xRETz3+DRO5OY2iV599kXJCWRWHxlKLKInBaAZ2NJFccIY8PAmg2LcPKx83tYo2s2U+OhVMRZAHCPuMweX2FyvxAX2MxWBSFioibg/8ERpkz3LsecZVNz5156w4R/k=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(54906003)(16526019)(110136005)(426003)(8936002)(336012)(186003)(70206006)(316002)(82310400004)(70586007)(86362001)(8676002)(4326008)(26005)(2616005)(81166007)(356005)(1076003)(508600001)(83380400001)(6666004)(2906002)(36756003)(36860700001)(40460700003)(47076005)(44832011)(5660300002)(7416002)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 19:35:07.3719 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c92e5b04-b49a-43dc-d8f4-08d9ed959c1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5058
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

The `is_thunderbolt` check is currently used to indicate the lack of
command completed support for a number of older Thunderbolt devices.

This however is heavy handed and should have been done via a quirk.  Move
the affected devices outlined in commit 493fb50e958c ("PCI: pciehp: Assume
NoCompl+ for Thunderbolt ports") into pci quirks.

Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/hotplug/pciehp_hpc.c |  6 +-----
 drivers/pci/quirks.c             | 17 +++++++++++++++++
 include/linux/pci.h              |  2 ++
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index 1c1ebf3dad43..e4c42b24aba8 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -996,11 +996,7 @@ struct controller *pcie_init(struct pcie_device *dev)
 	if (pdev->hotplug_user_indicators)
 		slot_cap &= ~(PCI_EXP_SLTCAP_AIP | PCI_EXP_SLTCAP_PIP);
 
-	/*
-	 * We assume no Thunderbolt controllers support Command Complete events,
-	 * but some controllers falsely claim they do.
-	 */
-	if (pdev->is_thunderbolt)
+	if (pdev->no_cmd_complete)
 		slot_cap |= PCI_EXP_SLTCAP_NCCS;
 
 	ctrl->slot_cap = slot_cap;
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index d2dd6a6cda60..6d3c88edde00 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3675,6 +3675,23 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
 			quirk_thunderbolt_hotplug_msi);
 
+static void quirk_thunderbolt_command_completed(struct pci_dev *pdev)
+{
+	pdev->no_cmd_complete = 1;
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_RIDGE,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_EAGLE_RIDGE,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_PEAK,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_2C,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
+			quirk_thunderbolt_command_completed);
+
 #ifdef CONFIG_ACPI
 /*
  * Apple: Shutdown Cactus Ridge Thunderbolt controller.
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 8253a5413d7c..1e5b769e42fc 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -443,6 +443,8 @@ struct pci_dev {
 	unsigned int	is_hotplug_bridge:1;
 	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
 	unsigned int	is_thunderbolt:1;	/* Thunderbolt controller */
+	unsigned int	no_cmd_complete:1;	/* Lies about command completed events */
+
 	/*
 	 * Devices marked being untrusted are the ones that can potentially
 	 * execute DMA attacks and similar. They are typically connected
-- 
2.34.1

