Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD9A4B5EBA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 01:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448C710E363;
	Tue, 15 Feb 2022 00:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2C610E346;
 Tue, 15 Feb 2022 00:04:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEg1KBtZDVVqnv8RV4Z5K8bjWDQguV32i+NYqLQT9LODEKGRcs4U5c/a6T396cX3LzrkWXZEtUODARYoo2NklNMDs/2xh5Nmxdc6NoneOa/Shkuonla82tAjyi/EfAwKQDIIyUe8ZO4hZbqIwnv99+wBvG/qydrnGmKgT+pAXJnsdlc0TYp0KdEa624OKFzO5HJVa1Vf6WwUa6ZuEBt0duOhIJY55cPfk7tRiOrYW9+8h3yFlpqzR27a9Suw88aAXyjj9jVQUnXbA6nD/NAkV3gkxgiBpYYpI51SNAHEc7DtoSmnL21ovRAVukhiptYxOSgnxDaxnnaCCqCpVcO1AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeE83JfgHgB/32cif9l8AB48aQIpSH6VPWc3bbjjKno=;
 b=XqKGedUkYbRHj+ztiZLWQWPNuuHebIPJ6bup5q71Ohv8tl8o32P/FF8CxMO490np5sWnynljMW5vta0gxDPMtnyIV9snIBifNmEGYNh/8KdVZWyV1OZRKaZRyhizQMonRzAFs8KdnYgDTJYYhiX+mIBxhK/J5ItGP3xp8K6lEW67WzbQybl5I32Zi7xXwJQqjgrDhUQjJv9+iv+w28iLl5As5af7BT9FcowBG1laYy3aD6Won0JU8kek68Clc/VEMOQ2DVOQ403eoRf4okekyG7gvEiIP16kK/Zg1mXawktVKGmIvF3JsqBtG3SVoSYA+40RdnxUcvruMsfsEQ9KlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeE83JfgHgB/32cif9l8AB48aQIpSH6VPWc3bbjjKno=;
 b=GmdU8u4CURVfN4F6m17gXjsQfvlARVNJN3oXOmNYBuXrL2B1BqPbzwBWvWCpZ4wcEGAVzji1PXxboI6vuZdx8XjiDtTbePmNecmhPO8SgR0mh+dCNHCmlB4w+i8jU7ZeZYU7bN+zE17gTfAFQYsXHhwN/TdoiQ6FhWPqB6ANPXs=
Received: from MWHPR12CA0046.namprd12.prod.outlook.com (2603:10b6:301:2::32)
 by MN2PR12MB3550.namprd12.prod.outlook.com (2603:10b6:208:108::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 00:04:18 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::e5) by MWHPR12CA0046.outlook.office365.com
 (2603:10b6:301:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Tue, 15 Feb 2022 00:04:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 00:04:17 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Feb
 2022 18:04:14 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 05/10] PCI: Move check for old Apple Thunderbolt
 controllers into a quirk
Date: Mon, 14 Feb 2022 18:01:55 -0600
Message-ID: <20220215000200.242799-6-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3a47bacc-5837-4e01-210e-08d9f016b5d7
X-MS-TrafficTypeDiagnostic: MN2PR12MB3550:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3550FFCED62B817B209ACB5BE2349@MN2PR12MB3550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KkoUKbjZcZo2hR2it9dTu9ymTpCTPkAfDAwsgqX8IWM16hZnu54YSK1fN52dyxpSZ8PGW9PshqR2sfkTf5kRqMtogxXjL99awStn71QJCzrYeaveGp3wuOAhHM4142/Pb2xU2Swx+S1ktzyBNFhpnF4f/aXtIT20swSdGWYQ9kjBD9vA87LNgCfCHcxjLodoRmvylFXY4DgYdP//0CCnxvgEhJYY59BZJGhC6WxbOfY8K8egER/ojfthdz6cUGLN7BWqX9c3aBvv2JtqH/Y/B16kcE3r3XekK676EqogMPYOehHaWf0Q1duIcBgHnCGupcJT/ZiQi6YbHVlnoGdySF72hNJLm4rztC/S6AnqxaJWXQpsBFs6koUgP7dsRBd8k1aC9kh9dow7fnNW9ls/FgOfNjFvDb4TdQAa0uDabHbd8DpXXr6vo+rcGgbN6AxFtKsYfeNdghu/uMJIrdopx7DDh3PPH9g8obKpYfJqwJvtoM31z/tMOhmLtMADrSFg8vY8p7PEahprTs/pCf11c7Do/gdkCXWVYgA6jvi3M00i6XW/3j0WD1CCbUzWFIIRTsg2BOalqTxjV4J0z+Z/4OO3Cgk/tekUQZSiE+ES/9r7aYmyoD294/7Yuzkd2yquRLhg7S6IHsRd53j42OJ0nCj1cF1n5Tgnlg6U1Te/pRuW4ooCCq7du/J1eqFRtbdBns3Quod7g8EUX6vrToVH3tUdmYjmuP241khdG33tXyZpORGAad7V99GTKPO11h7q
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(47660400002)(36840700001)(46966006)(40470700004)(54906003)(110136005)(70586007)(19627235002)(316002)(508600001)(36860700001)(8676002)(47076005)(4326008)(26005)(1076003)(186003)(6666004)(2616005)(336012)(426003)(16526019)(83380400001)(36756003)(45080400002)(70206006)(86362001)(81166007)(5660300002)(7416002)(44832011)(8936002)(2906002)(82310400004)(40460700003)(356005)(46800400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 00:04:17.8794 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a47bacc-5837-4e01-210e-08d9f016b5d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3550
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
index 6d3c88edde00..97793cfcd8ff 100644
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

