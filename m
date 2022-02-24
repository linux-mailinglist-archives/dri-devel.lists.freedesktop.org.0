Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACB94C3813
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 22:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C4F10E7A6;
	Thu, 24 Feb 2022 21:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F16D10E74E;
 Thu, 24 Feb 2022 21:51:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbBidN1/1OkQb4XaNf/LGJSIhIyxCa9+zGm5rblSp9zhQDqupUi1ti2NNhecNKiM51EnSEeJ1uXjQ2ESO4UvUiAUQQd+2MNrIIyxXyBG3SEb7W0Ub3L8l3XABzJBw5cOMgOANNFaDIHTbbOGM+8U5S/JAW7WXbY4VKf3vEo33TiDZab1vMuVrH3AWY7J9MNcb6GkbiwcLJpLxLhB3lbvwJ18ekrRgRgzKdpvLKoFCO2YW76eA0gE2Z7SzloDDluoqaQXYL2OCn2bB45LoU3wvAHo3IhXjG5fy246G+bmcFyX7Ng95U17sSY9YKmGX0ZU8HM8gkCObIdE1TlGFqM3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9WE35USorxap3FdmWnWUu6pfMAtj2Qyj+KBaDMdU8w=;
 b=SsuIXKU8Pf0CQKbFZqQwuzl4C3Me95LawM6YaKk6ikhbua4P1g5o6xahjU/QIkj70MR9pGY4AcJTOp53HMq69lgXMiz6OnweN0gx+mO9uECVWPYazBRRMN4Um13S+iApq5TY+saw4Ohfx7Q0cVd4FDMP2XrjmbpqCZ1kpmF5m6ZgwWVd+x2eBejZm/Sd7Y0msA8tIDYwOetWqhRnf6B4ibUlmVtN3PFzI/jW9pzwgNMvl4kousGBVzGGLhRedLQUou4UgUwRTiU34ZWXKz642MmArm6X9gdPYlVlJtBm7h9Nolj5m5bb8kjs7KkjnqzII2KgY0YaKFH8fKLGcOyELQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9WE35USorxap3FdmWnWUu6pfMAtj2Qyj+KBaDMdU8w=;
 b=m3VHthYPb5O3A5GeYP99tuYDVXN49lcAUFYueAxxvRkz+L0bVkmrL1AAMfriSOeaCAIfcxlnnwddHd1Hy2lH6UB1yPs9adgRZJOI0hf2cjmkxRg2rS38ozteivDrxoI7VD9ViMUzDy79zEAJVIDur0fw7YbyKdA/EwOXQKYCZQU=
Received: from MW4PR04CA0176.namprd04.prod.outlook.com (2603:10b6:303:85::31)
 by BN8PR12MB4594.namprd12.prod.outlook.com (2603:10b6:408:a2::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 21:51:26 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::f7) by MW4PR04CA0176.outlook.office365.com
 (2603:10b6:303:85::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24 via Frontend
 Transport; Thu, 24 Feb 2022 21:51:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Thu, 24 Feb 2022 21:51:26 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 24 Feb
 2022 15:51:24 -0600
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
Subject: [PATCH v5 2/7] PCI: Move check for old Apple Thunderbolt controllers
 into a quirk
Date: Thu, 24 Feb 2022 15:51:11 -0600
Message-ID: <20220224215116.7138-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224215116.7138-1-mario.limonciello@amd.com>
References: <20220224215116.7138-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52fb2aea-6dca-4379-bce7-08d9f7dfce9b
X-MS-TrafficTypeDiagnostic: BN8PR12MB4594:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB4594C920668624E664EF6667E23D9@BN8PR12MB4594.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dtRQPdH7DoOP5lJDF3HqmNJUMZIwvdbsEOPuxbmDx0r5hXRCc5jEOcCYK5oBjeZ/m1kfraSb3wITNBRRB3q3fHndQ+xhGaoXLMWtkQc4Pqr5QTulOFw+0ZOExO1XT2SZLdDvcs9pPKILRuh8ZUGOwrVPA0EE83HPtf0KdckotEcoqPi/9XrhIi4f5hd26nVJCVZT12M63M67ckzNy+7Qyt9DPJpJk8gCNjRmvJ93tMQq/i0ChurmXtNJfbFJj6TAz7xmOB3kjHlOtUX5KPF6tdFWgx5P3I2Yq9S+ABeHqMVAU7qMBWa4M11kKBK2tI0cLL2lBr6ShjZsOWq5818gtEaqltxRC6IOsMUjrlEjg1tf/UDIwKPWdQx+XwP4luQo65PdNZvIOXfhxgDgso1uhSMmDkg0GOKnLs3EOsRogtHfIpLcZrvcj196a4uUq3wispZD1h4I2g050hA9sPdlvoSLvj2uFZVy4eMKrwNXeuRmDQYRdRG7ym68gMfGMg93nqU/ryy747yoghTVd4ZaqKBoy4wwPVQS2znjRUXT98rzHNE1TatySGKoe6d2jM4kuAC+tGhHlaqkUXowtFJJ22pNG5eAeRmJQiHPxHPV+CGLLegG/DO6w6ED5P5mu6Dxx8/cmJgbQK40+RmT/k3h5S5Rdv7RT86KoGfztggfwewNDH8exI+xcH3IFGxoy2Xvx5JT+QpTFW8T5ykDwFdlfKUjyKPuHXxUq4CxpvReQwpo417AOCno+l2qc+ZZQbQr
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(47660400002)(40470700004)(36840700001)(46966006)(4326008)(110136005)(83380400001)(8676002)(316002)(336012)(40460700003)(426003)(36756003)(47076005)(19627235002)(54906003)(36860700001)(186003)(86362001)(26005)(7696005)(2906002)(81166007)(5660300002)(508600001)(8936002)(45080400002)(7416002)(70586007)(6666004)(1076003)(82310400004)(44832011)(356005)(2616005)(16526019)(70206006)(46800400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 21:51:26.3841 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52fb2aea-6dca-4379-bce7-08d9f7dfce9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB4594
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

`pci_bridge_d3_possible` currently checks explicitly for a Thunderbolt
controller to indicate that D3 is possible.

This is used solely for older Apple systems, due to a variety of factors:
* Apple used SW connection manager from the beginning, other manufacturers
  used a FW connection manager (ICM)
* Apple supported D3 initially, other manfuacturers didn't introduced this
  until the `HotplugSupportInD3` _DSD was introduced in ~2015.

Apple has stopped creating new machines with Intel Thunderbolt controllers,
and all other manufacturers now support D3 via `HotPlugSupportInD3` so
this should be a fixed list.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/pci.c    | 17 +++++++----
 drivers/pci/quirks.c | 67 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 9ecce435fb3f..01557c950c9f 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1064,7 +1064,18 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
 	if (pci_use_mid_pm())
 		return false;
 
-	return acpi_pci_bridge_d3(dev);
+	if (acpi_pci_bridge_d3(dev))
+		return true;
+
+	/*
+	 * This is for Apple machines via a quirk
+	 * Non-Apple machines will use the ACPI property with the same name
+	 * from `acpi_pci_bridge_d3` to indciate support.
+	 */
+	if (device_property_read_bool(&dev->dev, "HotPlugSupportInD3"))
+		return true;
+
+	return false;
 }
 
 /**
@@ -2954,10 +2965,6 @@ bool pci_bridge_d3_possible(struct pci_dev *bridge)
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
index ceeca7d8dd90..f74f50ea0695 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3756,6 +3756,73 @@ DECLARE_PCI_FIXUP_SUSPEND_LATE(PCI_VENDOR_ID_INTEL,
 			       quirk_apple_poweroff_thunderbolt);
 #endif
 
+/*
+ * The first machines supporting Intel Thunderbolt were released by Apple, and
+ * supported a software based connection manager including D3 support, as far
+ * back as 2010. These machines don't have ACPI companions to declare D3
+ * support.
+ *
+ * Other manufacturers introduced Thunderbolt shortly after but notably did not
+ * support:
+ * - Software based connection manager
+ * - Runtime power management
+ * Power management was handled via the BIOS when nothing was plugged in.
+ * Runtime D3 was later introduced in ~2015 and Microsoft declared when the
+ * `HotPlugSupportInD3` _DSD was present that they would support D3.
+ *
+ * This list is expected to be complete and not grow in the future as Apple
+ * has stopped producing new x86 models with Intel Thunderbolt controllers.
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

