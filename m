Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684B24B187E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 23:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BACA10E983;
	Thu, 10 Feb 2022 22:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AA010E976;
 Thu, 10 Feb 2022 22:43:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUbrBwpvI9X2owi1t6xrD6JO3afih/6e5Mst8LyqQaw+Sb0TCGUUxjdMfyslom8sOMeCTuK1cF2p55fA3vxroGS6ndcCtrB5AV6vekq1thRXP9XGzoidx9IOAWLQncdhZGNrAEz3J9rEWiSe6ZL957MUeTazO6IPqvXdHUteb6VIuzH4okanQGge2p4PfFJ/VYCWxAKIPtd0Obvgf0rtuY91DZYsAr6fgjOtWJP7PcAt9PecGPUybvKMJwNKqliqCUgxVGz025hdQyEwqzRl5aRCsswFu4Mp9QxNBB3XS0UzCeEFdxzIAyLISK5yYBwQ4FYp3RqntjI8DVkd/roKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePYmeTfI1tYVdV1YQeEXeXNbHxPMCjFPOZ6uOCDxB6I=;
 b=HVy2ckDU7Jzzv+zRGc7QC+y5gBVHjJ2/b6eMFu7dT0UNmtxMOMWq8RknXtztyOBdPP3jot/EgpKRajfSTh5hfuB/MadaKpx5vPRrvjOS6ck2FMLG4dbzxxGYKpCOdIutpnhNE8Lym0GrSdW124WcI90CRUfmpVkXG6HE8I0W6p3bo0+MLbAf4FaiGkX+G06Xan6ohGVYPJcwg7ShoIdP3COvcReKeBO6tQdNjT9EDwY5LA5f3JqkXDOFzhx0eaT2V9s3Uk9Y762/I0i+08b5lf5yKkIJeZPxRRRmqL9ZtfU1fbEcDoH+/9Fk0bBmBQ81IVOcl45nssOjZXte8iDsWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePYmeTfI1tYVdV1YQeEXeXNbHxPMCjFPOZ6uOCDxB6I=;
 b=I392jh4grvM5MgQWP4zP6Xr98schbboSlDIz1P3yP6NolwFyxwRxwPdPcTj1L8CaFXwYWJords8nzqLsw7UV7v4LQd1ZdyZtu7Lx5RAyld78Hu5V02it7guDn5P64FHMnXwu88XVW00uFy21bQX6Qu77aSoqPsicaFYY0HWpF8g=
Received: from BN6PR2001CA0025.namprd20.prod.outlook.com
 (2603:10b6:405:16::11) by CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 22:43:47 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::27) by BN6PR2001CA0025.outlook.office365.com
 (2603:10b6:405:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Thu, 10 Feb 2022 22:43:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 22:43:47 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 10 Feb
 2022 16:43:42 -0600
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
Subject: [PATCH v2 2/9] PCI: Move `is_thunderbolt` check for lack of command
 completed to a quirk
Date: Thu, 10 Feb 2022 16:43:22 -0600
Message-ID: <20220210224329.2793-3-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: fc5e1948-74b8-4b5a-3db5-08d9ece6ccff
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB49561A266EDCADCB8DDB9D45E22F9@CH2PR12MB4956.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iGdaJQhHtChN7G2cuIt/OFbBr/Ni82Veq5a6RA06urCR7lTO4D+QV5XLPzMmFE8pwObp9akbAfIwTkEqi1J3hTgOxmdbYynyqmfaQBjVHkgwdSX+T/iYcAiVoAOjt4vGtVqZptsgiVGiuo/gUaIfdxknNZ24WpRFMJcTurlZD62DIzVt8yGIfZVyV2ZnHhKV5jkNjzt4is6IvtPXOJtOe247GEdUSoDpPiuU/BeNxfxcWESdak9h6LCvbsvw+8yigtukxQm6ZbPNBkTXfzejGAaJ/Dt3Jk7VGoiwLksTcAQgW4C8LXVBAKnBK066OSZHDKidIqy/5YjpZ1w9+ZFXa5FxlqQgCCBkoEADgMwDs2HwItdO8AcYiYYVaxXii2x4UA1niG7CkjZd+TxxQgRIiujMJig2WF8EyGKoAsv4dvOvthcbCdvN6XvfIOYPqNxEh7peGPvUxMdLHipGkqrKj9hPpvVdWNSV+ViEAqBQDITN4kFOVk/xftbayGxSWB1i1vZKJcZY0nz39geGDhBJItHF7tNctH6ToOPR5rmoy4no6CKUxPnEO/TmEjLnbRz3x/ueRGOUarvKF3zPliRHRPN9usAbshjS4tKAM6ZRjilWuxcK5zjRM3yOaHTAg1PcIysn1DUuZUt76+0T4sD42RAArTQ6uX0buXv36sLI5vPJQx7nrAs01hJDHKEz9RiH5u+G+omTPUcBH67XiEniM63AQo3TEBocKNXHl2as6MM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(82310400004)(8676002)(7696005)(40460700003)(86362001)(36860700001)(70586007)(70206006)(47076005)(8936002)(36756003)(4326008)(426003)(186003)(16526019)(1076003)(5660300002)(26005)(336012)(44832011)(2906002)(7416002)(2616005)(83380400001)(508600001)(110136005)(316002)(54906003)(6666004)(81166007)(356005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 22:43:47.4767 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5e1948-74b8-4b5a-3db5-08d9ece6ccff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4956
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

