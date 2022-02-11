Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5E04B2DA2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:35:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8C410EB10;
	Fri, 11 Feb 2022 19:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80C010EB02;
 Fri, 11 Feb 2022 19:35:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZy8MyFSrkZHOFgRxq0cIWARgggmesxdgc7UR3jVZTYntAg1OmvfhJFIKd8Is06RX7lh5VDAP/Nu3XQPkZSeKW/CVDKkp8P7J/mbTUIugnVuhGvomFLI/JzAMwu8KIQxQt6Pt/QziaJIknlDaTRARbYDBqRPb3sQsnfjJ5sbOuLOrYKEAIWj+XoP3sqXtbW8/V4uY/W8oB73o1mVm3y2VOtuOXwPWeFIqCPSpvFTiQVE6zeBoKqIs1qpItFeJTcPDyDScoaEK/AtMyPuGiNSAunyZQIco+XFlX+D/d62lT9UQnNz88R7UbfmvGjCvdx6pblsXnfLUTJgpMedfHJUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+yYlcNVjrRyhSY8nGocSvKs3OLExLa17+KyA6OwVXE=;
 b=Au9/ivhg143laH0TyCcBqcTFtFc7oBOzWhEfN42btTVtSlkHzZ7Pyh6vdo8wD23potuVIRrJmrYrQtGHp6P+Pnze/0LX0wAjanex4QiTHjR2OcF/0i43TnK/M1ZegufURRbklaQ5pqXfWdlkhXewJop6825GJdybn6uyBBVtLf+qIsIFdfnlEOVWCghRU1ObFkJ43VI8hayEaxMyjbHRKkG/QGjDo6vBD6Jh/KhX/DgX+/7XdPUn3ejilziqJVw3nT41dNmo0wVjblp6anLMH5jwQf2BmjR5Y8REhdyq/1ddjZaa3q/ZVCwXxQMAO5K3atzZeAz7GtGd3TgYrPWIHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+yYlcNVjrRyhSY8nGocSvKs3OLExLa17+KyA6OwVXE=;
 b=nTSWaxHPNl7qxo6ThxyLTOHcZUtskH6/eUZ78AEeJ3drOkksbkcIpt79KBgm0HJ+ZmOMwRs0vtxm2XwW6cTeykq314UQW+3vVa1zVPXzT1MuxW4ijtmHgWL+ExC8w/QBxHPJhR/Xws2z4MEL8udS2Z5+AmQHvPYuHCam83wnZtw=
Received: from DS7PR07CA0008.namprd07.prod.outlook.com (2603:10b6:5:3af::21)
 by CY4PR1201MB2548.namprd12.prod.outlook.com (2603:10b6:903:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Fri, 11 Feb
 2022 19:35:11 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::ec) by DS7PR07CA0008.outlook.office365.com
 (2603:10b6:5:3af::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.13 via Frontend
 Transport; Fri, 11 Feb 2022 19:35:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 19:35:10 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Feb
 2022 13:35:09 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 07/12] PCI: Set ports for discrete USB4 controllers
 appropriately
Date: Fri, 11 Feb 2022 13:32:45 -0600
Message-ID: <20220211193250.1904843-8-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 434e9cb5-fad7-4bc9-c74c-08d9ed959e19
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2548:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB25487007F73CE19F320B5AB3E2309@CY4PR1201MB2548.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F5O6+QgxGR36QvHLaPGl32x5V8Y/U1B3WT1YxOi7BZAcMYe4vaeY/vvm3PHY295srBCocPGFAm1whwu/Hb7Q3ED17b8G+OlG++0YRY6HmtsedICbsn/116k3zGpJn7LUE2EZnAJDgFO4hmLpZgQ2fpjLvU0Yl0y6Fo1pbD2A9WOtCNWkkdzi1mrZlUQHV9JNVFUzovdcbuMOri3J2KrNOTF5/V3qBB61VxuOnLsoY6b7Y5efFQhM1WDLJAU5S2F9qZS23hT9hX1C/e89Bw09Js4L1rHjXr3A8bEa8ohBu5GnQc3hI2JPwyFaFzmVkvIkSP9rV7uBX+MpCQ6XZdBf+7diFkNcLgushx746Ikh4DDkys/4SZEyJuAqMgRZvHaikKaWI1/pqfYiAxAVNYbD8u7cJxXTsIKMH5Z67J6UMQkcDKdH687eptkhs6reRVm9CDjc/96FsFzOo2a5Xkrd3juJbDCAPSF/o/fJYW3orpqYuqQz2ZwI9XDKV8c5/F23vzZT/e19wkvGF3rCz10apnPsS0AfAP8qVaHvuOeZU0fbrtrmmgQgg8dbjTD1HSj1DWSazCCCcS3trBXZHbbXN7hROsIImmM8oAIJ7EXuNnyg0xMnUI+qcVs6Wu5YyK3GomnRIekuezHTx06IWpfxE/91ZH7TJUz1TU6v/RvdHpR5COWiKAKiupVOw5ureuUTViI263y/2ydmc5v6KHPxT+GHrpfrf2dvWrihoJen7TDIXd3bOyG8UzVopyEIRu+SNsXdgH3O7PlWd8gN0KorYl5LIejA9AjS82+97Vnna8E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(16526019)(336012)(186003)(26005)(1076003)(44832011)(316002)(356005)(2906002)(7416002)(47076005)(81166007)(966005)(2616005)(36860700001)(426003)(86362001)(36756003)(8936002)(70586007)(5660300002)(83380400001)(82310400004)(54906003)(110136005)(4326008)(8676002)(6666004)(508600001)(40460700003)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 19:35:10.6941 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 434e9cb5-fad7-4bc9-c74c-08d9ed959e19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2548
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
PCIe or XHCI port they are linked with.

In order to set the removable attribute appropriately, use the
USB4 DVSEC extended capabability set on these root ports to determine
if they are located on a discrete USB4 controller.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Link: https://usb.org/sites/default/files/USB4%20Specification%2020211116.zip
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/probe.c     | 33 +++++++++++++++++++++++++++++++++
 include/linux/pci_ids.h |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 67ca33188cba..1ed3e24db11e 100644
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
@@ -1590,6 +1592,36 @@ static void set_pcie_untrusted(struct pci_dev *dev)
 		dev->untrusted = true;
 }
 
+static bool pci_is_discrete_usb4(struct pci_dev *dev)
+{
+	int dvsec_val = 0, pos;
+	u32 hdr;
+
+	/* USB4 spec says vendors can use either */
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
+		return false;
+
+	pci_read_config_dword(dev, pos + PCI_DVSEC_HEADER2, &hdr);
+	if ((hdr & GENMASK(15, 0)) != dvsec_val)
+		return false;
+	/* this port is used for either NHI/PCIe tunnel/USB tunnel */
+	if (hdr & GENMASK(18, 16))
+		return true;
+	return false;
+}
+
 static void pci_set_removable(struct pci_dev *dev)
 {
 	struct pci_dev *parent = pci_upstream_bridge(dev);
@@ -1612,6 +1644,7 @@ static void pci_set_removable(struct pci_dev *dev)
 	if (vsec ||
 	    dev->class == PCI_CLASS_SERIAL_USB_USB4 ||
 	    pci_acpi_is_usb4(dev) ||
+	    pci_is_discrete_usb4(dev) ||
 	    (parent &&
 	    (parent->external_facing || dev_is_removable(&parent->dev))))
 		dev_set_removable(&dev->dev, DEVICE_REMOVABLE);
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 61b161d914f0..271326e058b9 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -3097,4 +3097,6 @@
 
 #define PCI_VENDOR_ID_NCUBE		0x10ff
 
+#define PCI_VENDOR_ID_USB_IF		0x1EC0
+
 #endif /* _LINUX_PCI_IDS_H */
-- 
2.34.1

