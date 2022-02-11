Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1DC4B2D9C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B523310EB14;
	Fri, 11 Feb 2022 19:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2055.outbound.protection.outlook.com [40.107.100.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183D310EB04;
 Fri, 11 Feb 2022 19:35:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TW5r8QoeSaCPltn23XnhDIIWNRx/L9To5JdOgcYLC7nsV28DbYMERfd613ZbFmTfB1QD3JteuyzgZSkI7klC+dVAk+56A7PKcV+CgbHxQ6hAjRU8/g9VGYUrEQSJOyI/l6IjrmSZYPYb6SBzOjJqF8eWhlW8E8OCDOOkMgnF3l8693lF3e0x1RvbltBDMRplYLboV+K4rA4Gi7jRsXvMkdRC9tqwACH1W4ULEh7x9riJhn4Iw6MVEebemwKmLlk7iWLt/+xUsY5W3F1SF2TzTBBu43QTqUsIR4ost8fpH/r8xO4iZQ8RuVtzYNhNbv6jy8jyiPa+s974cVyqI5NaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGyUiNfNmLcYoL5Uja9mwPpAddDiKgLKFIYAV9pVhbQ=;
 b=NqCRAU/1jRNf/ZqWyxshQ4chkCqa5NhuGbu/UZ37Kb/gdv3aF28UikN15s+4n0SY24ADJfyDSZwHaeBHL8BqP+G4qEBUguXaM8FIyKSaxLUEx0soVL6LaH5Q3ervCCCUYKvBiKX2oN3/yK8mbJbUpTDgeQmKk/xKEBGnXc+P+nfPC6XrsCxlmvqyVgL8uT3hAfbQ/6hqCKkqggXWREW3HJgpFaWUKMBI5zGVCmzO/jPHzH8mut9q65DoFBFI7xpqts+6WIXukx9axZFTXudL3ATGSR80GIr9xUeijgwpR6eNLHwtkTlsTr4jVn6sJmQ1JAy/ROB3X7TFcabmuBsD6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGyUiNfNmLcYoL5Uja9mwPpAddDiKgLKFIYAV9pVhbQ=;
 b=A2jXLulWTFcnzg0gvkgIWuUpAPUn9WliJsEVXJZpMS8m9555ZyOUTRmoPmeqmC23Ad031HVQ2Jh/to/cgX7i09y4rPFReYM33YhPdpHv8JwrHl24Bwd6tw6ZIuIpH5NcnTbkGufLZaEmtUdUpD962GbWUJPClLNUrRhSP0LC8Ik=
Received: from DS7PR07CA0008.namprd07.prod.outlook.com (2603:10b6:5:3af::21)
 by DM6PR12MB3290.namprd12.prod.outlook.com (2603:10b6:5:189::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 19:35:08 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::91) by DS7PR07CA0008.outlook.office365.com
 (2603:10b6:5:3af::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.13 via Frontend
 Transport; Fri, 11 Feb 2022 19:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 19:35:08 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Feb
 2022 13:35:07 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 03/12] PCI: Move check for old Apple Thunderbolt
 controllers into a quirk
Date: Fri, 11 Feb 2022 13:32:41 -0600
Message-ID: <20220211193250.1904843-4-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: cbd1c42b-6738-41c1-d280-08d9ed959c92
X-MS-TrafficTypeDiagnostic: DM6PR12MB3290:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3290F3404570564D5BF4ADCAE2309@DM6PR12MB3290.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GtlV3h22rJ89fBat8QtlMIQVq7SDAirecTqFKMOykUyoV3pDlnKT6Uu02VSom4Djsfnxpe2lYs6EAHqAoPRt6XfP8VuzhRvv5NY2iXaAkBcJLqkHdAegUXg7WZ7w+44l73+kWI1EsiDVB9FEEI6wRHfQLYnqJOFpbyntj9IukKe8ZQnH+LnMu/VbKgl1dSuOrLDvPdUBqfMsLm3PbCfVFCNGwIDDSfib6XKHWQjbPX3B4iGkKW91tjx6TPuUmkK1k/K0MGQrxr8EnCj3zF5sZ7RHu5MmQNfQvI8UmTMPExXBvJUUdDMkER4s6AIFu7jj95Xrk9ahZGVfO/jXC3ieI7H4Ezq85T+xTqRKhOBX6Diy1QW6wXRxXg+aGpI7kC1WhEGUDbKNVR0Oe8BZUvwGXkE6iWBbbNWlG2u8nax2RrIKLxsRKTixF3CSlQu7g6WH7LxR5OzFOFxlvbDIOI3Gz0vds2Fmm0aLaJmzks9GdNFldLPOnOnLY53CZe2dXSJsG/47YiiUJDJpqGD2I9RLLw9xtMxDm6EavqnG1jz6dsUyoQN3UdqeOzBq9FPpH/eHKkl2F3vXsZX+HifWQyUNvKbn9BjzUhhqYVvsjwaAWspYnvtyEKjINVaIzUMQbS29kUrVHrYgbvHt8RPPVILSceEJjBlszOcKpspGNHbcQDmGEUqvGSxBRjNfhXh4qnu3kgXC5plhExxvpO2b41BIRL7eo4SusYGZiZA1wEbMI9IaQ663G9bZGzSFv7/1M498
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(47660400002)(40470700004)(36840700001)(46966006)(36860700001)(508600001)(82310400004)(6666004)(47076005)(83380400001)(2906002)(316002)(8936002)(4326008)(19627235002)(8676002)(70206006)(70586007)(5660300002)(54906003)(40460700003)(36756003)(86362001)(16526019)(7416002)(356005)(336012)(26005)(186003)(1076003)(426003)(2616005)(81166007)(110136005)(44832011)(46800400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 19:35:08.1320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd1c42b-6738-41c1-d280-08d9ed959c92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3290
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

`pci_bridge_d3_possible` currently checks explicitly for a Thunderbolt
controller to indicate that D3 is possible.  As this is used solely
for older Apple systems, move it into a quirk that enumerates across
all Intel TBT controllers.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/pci.c    | 12 +++++-----
 drivers/pci/quirks.c | 53 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 9ecce435fb3f..5002e214c9a6 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1064,7 +1064,13 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
 	if (pci_use_mid_pm())
 		return false;
 
-	return acpi_pci_bridge_d3(dev);
+	if (acpi_pci_bridge_d3(dev))
+		return true;
+
+	if (device_property_read_bool(&dev->dev, "HotPlugSupportInD3"))
+		return true;
+
+	return false;
 }
 
 /**
@@ -2954,10 +2960,6 @@ bool pci_bridge_d3_possible(struct pci_dev *bridge)
 		if (pci_bridge_d3_force)
 			return true;
 
-		/* Even the oldest 2010 Thunderbolt controller supports D3. */
-		if (bridge->is_thunderbolt)
-			return true;
-
 		/* Platform might know better if the bridge supports D3 */
 		if (platform_pci_bridge_d3(bridge))
 			return true;
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 6d3c88edde00..aaf098ca7d54 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3756,6 +3756,59 @@ DECLARE_PCI_FIXUP_SUSPEND_LATE(PCI_VENDOR_ID_INTEL,
 			       quirk_apple_poweroff_thunderbolt);
 #endif
 
+/* Apple machines as old as 2010 can do D3 with Thunderbolt controllers, but don't specify
+ * it in the ACPI tables
+ */
+static void quirk_apple_d3_thunderbolt(struct pci_dev *dev)
+{
+	struct property_entry properties[] = {
+		PROPERTY_ENTRY_BOOL("HotPlugSupportInD3"),
+		{},
+	};
+
+	if (!x86_apple_machine)
+		return;
+
+	if (device_create_managed_software_node(&dev->dev, properties, NULL))
+		pci_warn(dev, "could not add HotPlugSupportInD3 property");
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_RIDGE,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_EAGLE_RIDGE,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_PEAK,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_2C,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_2C_NHI,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_2C_BRIDGE,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_4C_NHI,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_4C_BRIDGE,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_BRIDGE,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_BRIDGE,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_NHI,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_BRIDGE,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_NHI,
+			quirk_apple_d3_thunderbolt);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_BRIDGE,
+			quirk_apple_d3_thunderbolt);
+
 /*
  * Following are device-specific reset methods which can be used to
  * reset a single function if other methods (e.g. FLR, PM D0->D3) are
-- 
2.34.1

