Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF2C4B5EBC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 01:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1304D10E34E;
	Tue, 15 Feb 2022 00:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDE510E34F;
 Tue, 15 Feb 2022 00:04:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEyDvGVzALHNnMvdr4Up55or0/s/W3zqVaBuzHG+o4rTP7PxwL3XnRvhPgG/qOzf9S/mDPa+aq0Q+EgPTZNu8WqWv7HWojMWHcdvSzz6Bfed68/dGGkFAHIpvSTrw5VLy9eRhh+YmvE4vmy4vtwwMkbdYvFmWzACCCC8zMPzMmM+E4C3vfhcxDZXBirZ8bYsTnm4sSPSypKzJKsMiHwzDP5XgF3Mu3WCzXIBAqrKOG5rU1kap11QhcEGmrQW5yW7JxsPO0mLptK7/w+M8CT2boRb12VHx2+gqosq4jDaNmDCAjrOfbhhrBysgLlzoa4r4dUWuDZQKTdap1QJbttP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHM5UKATDv0xKSJDXCgTqORdpQMeR1biIgOSMO3LziE=;
 b=j5RU1bK/hgHC9ob4Ne7lcs0Vq4oNPAJY/QydN6KsxpWBky1z5Xz04AoHG0t6tPlobQsf+8VmZzga2HS6FgMU7mL6EtzMF1lOmIXVFY261Yk9pcLiEhlCBr/44/96DZrQxPig+lHHGlmztlfagGr3JBcvNbky5bXoB0cVtBU9C2Cn8aDDfvu8uT96TkcToJjXMMwBLcd6D+Ld/Ktm62PgnhYivF+UG+NWfcmACPYe4wyxi1TT3K9m/aqyuV6bXKl78G+g3H8M6vBDbYeRVyLqIc82hMUw9LFTWdN8UyeIGsnqPNzwjcwdOY8OLQuPoS9e0/bxVBoVs6t4tpz1CAB4mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHM5UKATDv0xKSJDXCgTqORdpQMeR1biIgOSMO3LziE=;
 b=ciyBlECE22lNm/rtiL8XoQSgCK0ufKLTsFdDAjE9FT4rEwVuarKWnVkGUAlJW9KNV9t8kUxjENx9EM6O9rcyoMiAx4J2tN8zORolF0UrPhi/tM/qnurn4yjFEgmFW1IVT4HdFuiT4QXuDW5Vio4hAGqnFPFit8iDglxG5Kow0UM=
Received: from MWHPR12CA0030.namprd12.prod.outlook.com (2603:10b6:301:2::16)
 by MN2PR12MB4989.namprd12.prod.outlook.com (2603:10b6:208:38::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Tue, 15 Feb
 2022 00:04:17 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::6d) by MWHPR12CA0030.outlook.office365.com
 (2603:10b6:301:2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15 via Frontend
 Transport; Tue, 15 Feb 2022 00:04:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 00:04:16 +0000
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
Subject: [PATCH v4 04/10] PCI: Detect PCIe root ports for discrete USB4
 controllers
Date: Mon, 14 Feb 2022 18:01:54 -0600
Message-ID: <20220215000200.242799-5-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: f15d4654-f760-4442-f086-08d9f016b521
X-MS-TrafficTypeDiagnostic: MN2PR12MB4989:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB498921FDCF080AB016593C77E2349@MN2PR12MB4989.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yk2HLJ7xznm+eAcQE6Cs5/Z8F+1YQQjxQchAmlERNwEoQu7aQLG64waJiA2f2UGNQVaEcjHslz76B+qSz2fe/WiIrUGcQVui3XAL9e+BjH8+wSIKPENP7iGM/davhjSJjl3GM7cIw7CWStitnI6x+n+O4SF0VT0G1o3TEUKQ479rzu6jBxpQ2L1DO+CbtGpBJVJL7/WEzx1QqbjvG9hsgILPpCca1Xr7nou5kkvn+M31BN6bkC49646ppEOXfHd7FKLlFpFsLfIzW8HVmL7diNwZq2c4VoM00ooOcXMJl19EUVaewS/t6SV3bNscensel4kPjhubyYNhpEh9PEYO/1hNswOmwyEcVHN0F6+bsGiTaVM8wnORrv5P6yh5cx5g0sWYjjaDagcaymX1cfSWCB0np6VHJHNBXKx8JhR12mX+TCp1A4lScfbOJwJBohjQxfBvhDTMrTetkX/wMXLKmdyU6wKDMGaRsIM2VYF8IKl1wWyDYgs3BLwqF4VH54m65rovfTpa7mWsD0wAJ8zCB502pBXmPNDuVoJXuNHKdJg8+bo9k+6uJTJNTKOB+aeeYdUG+cbPdMDa6i5yD+TcQsm7OaQP9TCKaWekuHjoKNpaH+tfSZUlW9FgXoiGfDr81hbA2XmnE62xgLLeQa1dy1v4oIlTVAUCIL4bkVYKP7h1up6dQT5vzln2SYe5d5T9GbE4hjO/bTFHp5zTDjFU5tvWJRDtOPpc2u2lYdnSoY+NdJGpUJxJKEom9FZtQSJh7681AFPp0amUrvNusUClKy/IMDOmpdn6DXpAbqbVw7M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(40460700003)(86362001)(70206006)(70586007)(54906003)(8676002)(966005)(110136005)(316002)(4326008)(36756003)(5660300002)(8936002)(7416002)(356005)(81166007)(6666004)(2616005)(83380400001)(2906002)(36860700001)(44832011)(47076005)(82310400004)(508600001)(336012)(1076003)(26005)(16526019)(186003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 00:04:16.6920 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f15d4654-f760-4442-f086-08d9f016b521
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4989
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

Discrete USB4 controllers won't have ACPI nodes specifying which
root ports they are linked with when the software connection manager
creates tunnels.  These PCIe root ports should be marked as external
so that existing logic will mark tunneled devices as removable.

In order to set the external attribute, use the USB4 DVSEC extended
capabability set on these root ports to determine if they are located
on a discrete USB4 controller.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Link: https://usb.org/sites/default/files/USB4%20Specification%2020211116.zip
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/probe.c     | 50 +++++++++++++++++++++++++++++++++++++++++
 include/linux/pci_ids.h |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 17a969942d37..a07859c8675f 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -25,6 +25,8 @@
 #define CARDBUS_LATENCY_TIMER	176	/* secondary latency timer */
 #define CARDBUS_RESERVE_BUSNR	3
 
+#define PCI_DVSEC_ID_USB4	0x23
+
 static struct resource busn_resource = {
 	.name	= "PCI busn",
 	.start	= 0,
@@ -1600,6 +1602,52 @@ static void set_pcie_untrusted(struct pci_dev *dev)
 		dev->untrusted = true;
 }
 
+/*
+ * Use the fields from the USB4 Designated Vendor Specific Extended Capability
+ * (DVSEC) for Power Management 1.0 to identify PCIe root ports that are for
+ * XHCI and PCIe tunneling
+ */
+static void pci_set_usb4_external(struct pci_dev *dev)
+{
+	int dvsec_val = 0, pos;
+	u32 hdr;
+
+	/*
+	 * Table 3-1 "USB4 DVSEC Header fields" says vendors can use
+	 * either the Intel or USB IF vendor ID but should look for
+	 * the appropriate DVSEC ID.
+	 */
+	pos = pci_find_dvsec_capability(dev,
+					PCI_VENDOR_ID_INTEL,
+					PCI_DVSEC_ID_USB4);
+	if (pos) {
+		dvsec_val = 0x06;
+	} else {
+		pos = pci_find_dvsec_capability(dev,
+						PCI_VENDOR_ID_USB_IF,
+						PCI_DVSEC_ID_USB4);
+		if (pos)
+			dvsec_val = 0x01;
+	}
+	if (!dvsec_val)
+		return;
+
+	pci_read_config_dword(dev, pos + PCI_DVSEC_HEADER2, &hdr);
+	if ((hdr & GENMASK(15, 0)) != dvsec_val)
+		return;
+	/*
+	 * Look at the port type field for the expected bits for PCIe tunneling
+	 * and XHCI tunneling
+	 *
+	 * 0x0 - Native Host Interface
+	 * 0x1 - PCIe Tunneled Port
+	 * 0x2 - USB Tunneled Port
+	 * 0x3-0x7 - Reserved
+	 */
+	if (hdr & GENMASK(17, 16))
+		dev->external_facing = true;
+}
+
 static void pci_set_removable(struct pci_dev *dev)
 {
 	struct pci_dev *parent = pci_upstream_bridge(dev);
@@ -1870,6 +1918,8 @@ int pci_setup_device(struct pci_dev *dev)
 	/* Early fixups, before probing the BARs */
 	pci_fixup_device(pci_fixup_early, dev);
 
+	pci_set_usb4_external(dev);
+
 	pci_set_removable(dev);
 
 	pci_info(dev, "[%04x:%04x] type %02x class %#08x\n",
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 61b161d914f0..3faee1af9ace 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -2567,6 +2567,8 @@
 #define PCI_VENDOR_ID_TEKRAM		0x1de1
 #define PCI_DEVICE_ID_TEKRAM_DC290	0xdc29
 
+#define PCI_VENDOR_ID_USB_IF		0x1ec0
+
 #define PCI_VENDOR_ID_TEHUTI		0x1fc9
 #define PCI_DEVICE_ID_TEHUTI_3009	0x3009
 #define PCI_DEVICE_ID_TEHUTI_3010	0x3010
-- 
2.34.1

