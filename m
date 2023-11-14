Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109CD7EB77C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 21:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D120410E4D3;
	Tue, 14 Nov 2023 20:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EA410E4C8;
 Tue, 14 Nov 2023 20:08:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mF4IgB6ZuIMbAXsnY7hrpsnNsW4LZnwKYBLsMdu5Eg4KpIjiwX6hz4VXifsaDRc1MOiAkgfQap+oOOk8xLM5k/YkIFsf0NhxUiuLffy8k0hEp/Yu7RpPEbrDvf5bwG10U1HA62AfODMRGJEaBrwv+spYR03LpG0Phu1mWkIHa1fRPcpmUYmavorlRsW7YG8qG4/ffJNkiLkU1rk+Wi7CV2K5R6JDHV+49ouIheK6+4y+zr9nd4ZkK/M9NNCMMYskU35Yv7kj2uRaXFB8NBdGsH3Xcz4wBDx7oGFrTqWVKU0etQpXJUrK0Ifaaymoh43uOZcOEbPQd7aZYAuDg6yQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+xImqdwU+W1pN5M0Vie2siIMCunykDwJc2G2yDJ0dU=;
 b=h8D1dthZDByaJI0EpT7NpaenVRkOpteolvNBThe7a/oaFnBPgK+ZMmqCGgTCnQ4jsrCVC+qNVgj+/s7P49SyEdryBbKGr8kJeoc5xjqRbnoRWGmO4y6I/HU00aS+ul5xEpis0bXVNn0PNg+JT1631+ZIUJvkV7yuIn0B6ED9mm7zp/l2Jdd1wNkskhWZO+x+bn+Q55HwK57ZaUwM07JCK2W3MkdcCMkQ0IgZQof2eGq4CpWeJWvkE1HBjiFtmr4TJYUStbWCutJtp6mbhjj1hBaJDA6FC86sVLnMcK8xeHFlbiu7Xi3r7JIKoCK9BJVrhOsHSz94+i8NtcpId9yeAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+xImqdwU+W1pN5M0Vie2siIMCunykDwJc2G2yDJ0dU=;
 b=TnUtq0LYhaAspqgboPmomDpMuoajurK5Hiw49nfT5pCLo54JBdO8NqCI4euvyvMNdhVQHldBtsnRd5En8S7AgLwUNS5lMiG2uzWskT+y3o5/sq6BHOjBEvlA6mcS8LphIPHfD15EBsyDoi/HGdVQuwHKxCHDQlK54kDkIHjaVMQ=
Received: from BLAPR03CA0177.namprd03.prod.outlook.com (2603:10b6:208:32f::30)
 by IA0PR12MB9012.namprd12.prod.outlook.com (2603:10b6:208:485::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 20:08:37 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:32f:cafe::20) by BLAPR03CA0177.outlook.office365.com
 (2603:10b6:208:32f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Tue, 14 Nov 2023 20:08:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Tue, 14 Nov 2023 20:08:37 +0000
Received: from test-TBI1100B.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 14 Nov
 2023 14:08:33 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Mika
 Westerberg" <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v3 5/7] PCI: ACPI: Detect PCIe root ports that are used for
 tunneling
Date: Tue, 14 Nov 2023 14:07:53 -0600
Message-ID: <20231114200755.14911-6-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231114200755.14911-1-mario.limonciello@amd.com>
References: <20231114200755.14911-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|IA0PR12MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: 90184afe-07cb-4776-14b3-08dbe54d7cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tQakzFsShXtGB936py7cuNEKdVbYdXnpXQsksGMo6iMevlEbuanxdV9Nq4vzHcpqBo1mb+nK6Sf1MKkBbkS82Sfrt5R3xScC1b4YNBv+mdLZezvYj0Ugelf09+F7MVKfl3ck3cycKqVG2wIuU9/ZxLJhmrIWrYflaQo4FYbapgqLk18zBmNAJSL0dsgyhxtcDPWbT/mnQF2spSX6a5P5X+Y9cTg0iq6RXr3UBMKs8x1TwIOSQpax26XI3fK1VyH3QD5W5aUDKIVrQxK2PQLfgzzeIM1EUoLZh3Ao+HCl8lxGHVqHElsXDEzJVKtWUjfk4HBGYk7dsXm5eMpcWRnBsIMk1tyZaZdEJos7tdu2qxzLa9raxBUMlHF/rr0FIHfVYDlGoNGaeuOuoOODeXD22teT7mY1Qxfhb/ong9XseZAiF5UoSoX86WHcEQaPaAhJds39uBxIZHuPRT3n69Hi+BXpePu2XgD43SjxZhBflJLDdtin96fkN4p4H8uqEgWHV9gIoPy/fui/Bz9cSnClqHZ8kYS+RBXhaISMYSnTL9N9rsjWEEM01Rj+PWtn8rnyenHgsBBOfp2g3ecLpZiyU6iWjZUwzoZ1MoHAKAzOi5Pjh0Sd1VtYl9EYRu4/nVF0yE6Xx8x5jE+ZsrvQS5FK3R9CnhuqXqGlhTicOvPYyrFk1bviTyCAMko5HhNvI3KijX9kFU9h3VXnqxz8CN3F+5FeVjIUNjIcLK1kpiJYOJMowC94A2XVe1VV7NGfvpDFxM5nyPOZPnGlA1+rM16cfg8oSFZRVc/NKuEGWmAt+UqpBoQTqzR25UDgEFWVBcWk
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230173577357003)(230273577357003)(230922051799003)(451199024)(64100799003)(82310400011)(1800799009)(186009)(40470700004)(46966006)(36840700001)(2616005)(40460700003)(336012)(426003)(66574015)(1076003)(16526019)(26005)(966005)(478600001)(86362001)(36756003)(44832011)(4326008)(8676002)(8936002)(82740400003)(41300700001)(7416002)(5660300002)(2906002)(70586007)(54906003)(70206006)(316002)(110136005)(7696005)(6666004)(47076005)(36860700001)(40480700001)(356005)(81166007)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 20:08:37.2452 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90184afe-07cb-4776-14b3-08dbe54d7cea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9012
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
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 "open list:RADEON and AMDGPU DRM
 DRIVERS" <amd-gfx@lists.freedesktop.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, open
 list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVER FOR
 NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 Mario Limonciello <mario.limonciello@amd.com>, "open list:DRM
 DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Maciej
 W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

USB4 routers support a feature called "PCIe tunneling". This
allows PCIe traffic to be transmitted over USB4 fabric.

PCIe root ports that are used in this fashion can be discovered
by device specific data that specifies the USB4 router they are
connected to. For the PCI core, the specific connection information
doesn't matter, but it's interesting to know that this root port is
used for tunneling traffic. This will allow other decisions to be
made based upon it.

Detect the `usb4-host-interface` _DSD and if it's found save it
into a new `is_virtual_link` bit in `struct pci_device`.

Link: https://www.usb.org/document-library/usb4r-specification-v20
      USB4 V2 with Errata and ECN through June 2023
      Section 2.2.10.3
Link: https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/usb4-acpi-requirements#port-mapping-_dsd-for-usb-3x-and-pcie
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2->v3:
 * Use is_virtual_link to be future proof to other types of virtual
   links.
 * Update commit message
---
 drivers/pci/pci-acpi.c | 16 ++++++++++++++++
 include/linux/pci.h    |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 004575091596..4a94d2fd8fb9 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1415,12 +1415,28 @@ static void pci_acpi_set_external_facing(struct pci_dev *dev)
 		dev->external_facing = 1;
 }
 
+static void pci_acpi_set_virtual_link(struct pci_dev *dev)
+{
+	if (!pci_is_pcie(dev))
+		return;
+
+	switch (pci_pcie_type(dev)) {
+	case PCI_EXP_TYPE_ROOT_PORT:
+	case PCI_EXP_TYPE_DOWNSTREAM:
+		dev->is_virtual_link = device_property_present(&dev->dev, "usb4-host-interface");
+		break;
+	default:
+		return;
+	}
+}
+
 void pci_acpi_setup(struct device *dev, struct acpi_device *adev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 
 	pci_acpi_optimize_delay(pci_dev, adev->handle);
 	pci_acpi_set_external_facing(pci_dev);
+	pci_acpi_set_virtual_link(pci_dev);
 	pci_acpi_add_edr_notifier(pci_dev);
 
 	pci_acpi_add_pm_notifier(adev, pci_dev);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 20a6e4fc3060..83fbd0d7040e 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -441,6 +441,7 @@ struct pci_dev {
 	unsigned int	is_hotplug_bridge:1;
 	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
 	unsigned int	is_thunderbolt:1;	/* Thunderbolt controller */
+	unsigned int	is_virtual_link:1;	/* Tunneled (virtual) PCIe link */
 	unsigned int	no_command_complete:1;	/* No command completion */
 	/*
 	 * Devices marked being untrusted are the ones that can potentially
-- 
2.34.1

