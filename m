Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A006F4B2D9F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEF410EB13;
	Fri, 11 Feb 2022 19:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A93910EB02;
 Fri, 11 Feb 2022 19:35:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJHAp1QTmU0914EHx1wivwcgeL+5tdtaBJmvm4TvOJ9MqdPry1Cbo5tdRbNq/RxSVNYPj5+meRCQ30G3sH3wYdfyNhbzEqD7rFgozxp+KFWEcZQd36k5hY8H2rchuMEIfw/laCuRjxMO3mOzojpxT8exTdod+jMjDgQACaMApEzyvfdtTdYqGXVtDbKkQTFRkKDDRNtv8a2I47a8FWL3VZP+Z+VMa1hPayf7fuUDfY+Vq7z9t/uoG3Ps0KvAsfHGB0xngpWxnGGjOfQa86EHY8/9wnvhotTYcJn/7GjkAOM/wEpnaeHjgXP/9rIAraR0ETb39V9d45eOYdCDLPBXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIkldd+mSTMirDIwTkL7+B9408OpGjYa1NXGn5+sAX8=;
 b=FlH1+Q7PtjEPze/EM1cfc8n1SgReT0cKU77cOCD9B372L5P/3ep/pGZUjnByeq6JK/hYFwYN1wSCSYI7RVSEOcX0jIWxYky7bfZLm1B/XDZJXXOcFoK6Jmx5fR1/c0vYhnMLumzJyrGjQgq6wbyVCAOONXnFaHcBCOYObYOhW+uzGQayQ0cDwSThEHaj6sbjo6CUvL3R8jLUTJKV2tmWdkRPDs1srLV0oRJb0Ds7gCHCcrNkeK+IU52FOBMLKoo0G87LBisf0ZytpRgnj9GOkupTXWelO2hAZlowVscpHmMenlwMNCubNq4POc3d0JATJbvQXKZBDVB3VVeZ8xoN7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIkldd+mSTMirDIwTkL7+B9408OpGjYa1NXGn5+sAX8=;
 b=achVuAZezkGvig3Mi6+2rYdbkQhhkl59dUKW3tY6Uxr6CNoolebvJ8vkJtCTeZbjzDFsnL0fptJJcfsnPR8Pm+degvcqbxV0k50qoUklJLVHNGdFmIU1SYEU2n+FwcCvmLnNKIKtK/oxyDQvT0v2NwWWwCgZkc4+nqEi4pb9PUQ=
Received: from DS7PR07CA0008.namprd07.prod.outlook.com (2603:10b6:5:3af::21)
 by CH2PR12MB3734.namprd12.prod.outlook.com (2603:10b6:610:2a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 19:35:09 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::7b) by DS7PR07CA0008.outlook.office365.com
 (2603:10b6:5:3af::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.13 via Frontend
 Transport; Fri, 11 Feb 2022 19:35:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 19:35:09 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Feb
 2022 13:35:08 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 05/12] PCI: Detect root port of internal USB4 devices by
 `usb4-host-interface`
Date: Fri, 11 Feb 2022 13:32:43 -0600
Message-ID: <20220211193250.1904843-6-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: e5cd718b-5a36-46f2-6404-08d9ed959d2b
X-MS-TrafficTypeDiagnostic: CH2PR12MB3734:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3734C0225710D1D8691FE578E2309@CH2PR12MB3734.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Agiafcea96UVy7gUXN6a8r6jgp4icQQyx6kmdM6mXKf+dyRpVfjZuQ4dZioc0ZkIucoWsRuCs4XSMGyaVBEQ0D3q2Vlt+Vt5gtpOnhFak883MM7YQgG5qVR3z8TAb5RV66UDGTvHJGvSf1rTDaZuNNXoak/NfnBQBh9Xbk40odhS1DUTNG8d2xXI97Q2ohMp77G2ETEkyPsNUJanCv/WHEecEzI7oxxMnajsfzmmmQwQB1L9TqjVUV7sGFVlzyVKAirnure5AOugk1Nf4YjEKJW1YJiq1VubmPxDlp7mIQML5jdxYQtDcmnMMHKKZFF5AxmQ7pjuWyW6cjkF9PdpPFb7CjahF6zu1jpUcGeZDzMt+Au2S2onK89Yrhh3yREvtgfsZtarXCcxOipyhUXBSUS1uuP331COAmPN84SwDRLqK1dTBoNxaurTsu7RJRScJ5m2Rlt3h40JKJYHFPEK2nh66DQ0NVkNTD8IJLQj6p0mTeNk99mqagC1jSaLWFADhSVl+enFewfxJERGp2AgibBUrTnDX3ZUK6KG9dZ3hSRNHiPZ3jZH8Lw4Amdj8BVkzqZt3ysnAvDu8aF2qm3rs5KI1BS/91e6n1yfNtjk+tGWysNYhQu2MgTF5RXg9HrmSR3MoPWQmn/ZGDFzhBsnhWqJpW1msJhCTRfPrzz8WuDr2QSgXZZSC3nbQLgv2spvHubudXz0vgeHfgyZU13Y0qAYdUgGdd18tNYSDMeHrMnsQ4l6cQ9Lpg+wBisv7Yx9tyUD8PnWCZ7xV3AnsSpISTQs++NOr9yKCTP9Ql9Z9q5oAiEVcz0ZGurnUoL4/D2p
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(26005)(186003)(4326008)(336012)(426003)(70586007)(47076005)(8936002)(16526019)(82310400004)(86362001)(2616005)(7416002)(81166007)(2906002)(8676002)(1076003)(70206006)(36860700001)(356005)(5660300002)(110136005)(36756003)(44832011)(40460700003)(6666004)(966005)(508600001)(316002)(54906003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 19:35:09.1318 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5cd718b-5a36-46f2-6404-08d9ed959d2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3734
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

The root port used for PCIe tunneling should be marked as removable to
ensure that the entire chain is marked removable.

This can be done by looking for the device property specified in
the ACPI tables `usb4-host-interface`.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Link: https://docs.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#mapping-native-protocols-pcie-displayport-tunneled-through-usb4-to-usb4-host-routers
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/pci-acpi.c | 10 ++++++++++
 drivers/pci/pci.h      |  5 +++++
 drivers/pci/probe.c    |  1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index a42dbf448860..6368e5633b1b 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1391,6 +1391,16 @@ void pci_acpi_cleanup(struct device *dev, struct acpi_device *adev)
 	}
 }
 
+bool pci_acpi_is_usb4(struct pci_dev *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(&dev->dev);
+
+	if (!adev)
+		return false;
+	return fwnode_property_present(acpi_fwnode_handle(adev),
+				       "usb4-host-interface");
+}
+
 static struct fwnode_handle *(*pci_msi_get_fwnode_cb)(struct device *dev);
 
 /**
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 3d60cabde1a1..359607c0542d 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -695,6 +695,7 @@ void acpi_pci_refresh_power_state(struct pci_dev *dev);
 int acpi_pci_wakeup(struct pci_dev *dev, bool enable);
 bool acpi_pci_need_resume(struct pci_dev *dev);
 pci_power_t acpi_pci_choose_state(struct pci_dev *pdev);
+bool pci_acpi_is_usb4(struct pci_dev *dev);
 #else
 static inline int pci_dev_acpi_reset(struct pci_dev *dev, bool probe)
 {
@@ -734,6 +735,10 @@ static inline pci_power_t acpi_pci_choose_state(struct pci_dev *pdev)
 {
 	return PCI_POWER_ERROR;
 }
+static inline bool pci_acpi_is_usb4(struct pci_dev *dev)
+{
+	return false;
+}
 #endif
 
 #ifdef CONFIG_PCIEASPM
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index e41656cdd8f0..2693211d31cf 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1610,6 +1610,7 @@ static void pci_set_removable(struct pci_dev *dev)
 	 * exposed as "removable" to userspace.
 	 */
 	if (vsec ||
+	    pci_acpi_is_usb4(dev) ||
 	    (parent &&
 	    (parent->external_facing || dev_is_removable(&parent->dev))))
 		dev_set_removable(&dev->dev, DEVICE_REMOVABLE);
-- 
2.34.1

