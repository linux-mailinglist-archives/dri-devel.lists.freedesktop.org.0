Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B81B7E091A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 20:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF4510EA63;
	Fri,  3 Nov 2023 19:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12DD10EA69;
 Fri,  3 Nov 2023 19:08:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oi4hq2/b6APpqzUn40GArlM7REEGevCeCmRz1sI4UPJ9oK3W1ZH8pat8NcwNw+kB/tIcJppZSqwEWRf3q2OC3jDFH0kSEFVvpYXMgH12Vr3xlt2/sVgO9b0H4h5HS82jh0NQEieBxQL8MWhkY386Fx0R4z+knf9hXfDDlovT/aroKUNlVJ/kD5N4ViGGI1qfgCCPFc7MTN2cFyASQCaPpuAoG3BXEVQU8Xea+g5H4vwhEHolg+zyuEQI/81slDoFtVg26NJ5rP5L4+INJ4YK3xPmQ4V0QDmS2AVrfJWYdB8ffkjrClfYBTRlNlW55yLssG7xjrAfDPpCD/YtpVss8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ps4geaA9O+7Z5oQTUTJFk+RelvfDLvJD1iyBwAM5sOo=;
 b=eIVFbnWyn3WY+StqYsUwSOKLRtgJuRDFGzEbg2Tq+FGSjmLWJlZMPZ5iBSY7XwGzP34uuGh9/FhF8Pagpf/wUZq0UzWptrr3pDOcLuO0LuOQabQgkwwAcuEHWDGPUjVbzrxz6v1lVf29ivTME5c1MsGFPwmaWqZRP+dTjH+To1SLczR9Z6B//MFAO/Om9aLkND2u0QovL/P8eD/25Fer/XklAhMGBRcERUTAZHdR8e2Ty69GyI49Prm832gumXPM93RdsBJpJEt1NZstUgeizGTKvqaX+9vbTADfzkF1VOdHj+3teTrfaOgmwi3jCfHHGeQuE3w/GsUtVYeuyBrilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ps4geaA9O+7Z5oQTUTJFk+RelvfDLvJD1iyBwAM5sOo=;
 b=0cI8K+bw0/vIsjLRZJTkbRpxmAfWlczEIdwlhSTnjlFKMZjRGsugbfktFHCRBnDsw4dlDarOTKQ4cIXSlZyjzqgJO1hnrjCgQTYfgD6Y0FLuyqxzejEdS1rOBcquEOHm9fDpRPEwZ3Nm7LXb74/D+lKgRWCXkAEu+Hk5FD1Xihc=
Received: from CH2PR11CA0005.namprd11.prod.outlook.com (2603:10b6:610:54::15)
 by BL1PR12MB5803.namprd12.prod.outlook.com (2603:10b6:208:393::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 19:08:34 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:610:54:cafe::d0) by CH2PR11CA0005.outlook.office365.com
 (2603:10b6:610:54::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.22 via Frontend
 Transport; Fri, 3 Nov 2023 19:08:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 19:08:34 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 14:08:31 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Hans de
 Goede" <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v2 5/9] PCI: pciehp: Move check for is_thunderbolt into a quirk
Date: Fri, 3 Nov 2023 14:07:54 -0500
Message-ID: <20231103190758.82911-6-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103190758.82911-1-mario.limonciello@amd.com>
References: <20231103190758.82911-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|BL1PR12MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 33532877-d30b-42ad-d58a-08dbdca046c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pw3DtmSyGwCC2OWJ1y6BB1svXta+8g1Hq8h58Z6YWYtQyAYs0BCMAYzoQyOEvFgnaIoRR8lpDf47WO9HQH5ofziMXWz2h7BWwXf6Y7L1FgheihBdhmlRJHZv+wdD/zxijBDgl/QH0zEXiaiCit/TXv79z8lSTEz63mochdPcxLgFlZ/Ih3d6cgcOJrk1dR4JMjA/vYZOzHnw93fntA38V1A0WxNxh8eGjr8Cjwsw3Y+M/y+RZi97O6qrtXdDy9Uy1ahea8SPrhdvnyQDVo/jY1aoReO5SAB0KhIyzyvGo1AWaIz+TWOtw9lB2QQ1bV5KkWTHgQqNlr7ua9DIVhAoTRLb0Bbv+i+EkLk+rcwPvO6FhwDICXI2ifMtMn7xoDJfwx9N1p2Xhuj+LQGajPbvc3B5NDGGXnOxHhCeLRFn0UZYrxFcbZcJ8/f5boonjPwaaEPErfkUmJosuDD+KwcNn9hLVsqi356yEFWjNbFVufb2CMVqWjSKdNgYR5msfG2tTpt5vjr9a1Cg4v6DQPp5OYInb3p62aCoO+ObA70c6VK9cIV4/Km51R06E10VjhtxAK4SiDvBkgQnnZbIr3bSp1um0q8DeyEsxITNeQsoJIF7VN3V1MCr6G+9T8CuLuvONrxNcIrCInTsE/S397kXxMZuEf3WVQI6uUhjNwU87+B+JZo4oRqasAxV9GQakM8+Oz9U5HtZKBiFu0C9vMfNEW/hR6CXK/CXETF98ovGlK3kCh3Pl0RI48pQ0mgSyEXfFRVttuLjTSkvHHlnLz/fRg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(82310400011)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(83380400001)(86362001)(36756003)(40480700001)(4326008)(2616005)(478600001)(2906002)(47076005)(41300700001)(44832011)(82740400003)(8936002)(8676002)(6666004)(70206006)(426003)(1076003)(26005)(16526019)(316002)(54906003)(7696005)(70586007)(336012)(40460700003)(7416002)(110136005)(5660300002)(36860700001)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 19:08:34.1546 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33532877-d30b-42ad-d58a-08dbdca046c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5803
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
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:DRM DRIVER FOR
 NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Andreas
 Noever <andreas.noever@gmail.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>, "open list:DRM
 DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>, Mark Gross <markgross@kernel.org>,
 Xinhui Pan <Xinhui.Pan@amd.com>, open
 list <linux-kernel@vger.kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, "Maciej
 W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit 493fb50e958c ("PCI: pciehp: Assume NoCompl+ for Thunderbolt
ports") added a check into pciehp code to explicitly set NoCompl+
for all Intel Thunderbolt controllers, including those that don't
need it.

This overloaded the purpose of the `is_thunderbolt` member of
`struct pci_device` because that means that any controller that
identifies as thunderbolt would set NoCompl+ even if it doesn't
suffer this deficiency. As that commit helpfully specifies all the
controllers with the problem, move them into a PCI quirk.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/hotplug/pciehp_hpc.c |  6 +-----
 drivers/pci/quirks.c             | 20 ++++++++++++++++++++
 include/linux/pci.h              |  1 +
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index fd713abdfb9f..23a92d681d1c 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -991,11 +991,7 @@ struct controller *pcie_init(struct pcie_device *dev)
 	if (pdev->hotplug_user_indicators)
 		slot_cap &= ~(PCI_EXP_SLTCAP_AIP | PCI_EXP_SLTCAP_PIP);
 
-	/*
-	 * We assume no Thunderbolt controllers support Command Complete events,
-	 * but some controllers falsely claim they do.
-	 */
-	if (pdev->is_thunderbolt)
+	if (pdev->no_command_complete)
 		slot_cap |= PCI_EXP_SLTCAP_NCCS;
 
 	ctrl->slot_cap = slot_cap;
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index eeec1d6f9023..4bbf6e33ca11 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3807,6 +3807,26 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
 			quirk_thunderbolt_hotplug_msi);
 
+/*
+ * We assume no Thunderbolt controllers support Command Complete events,
+ * but some controllers falsely claim they do.
+ */
+static void quirk_thunderbolt_command_complete(struct pci_dev *pdev)
+{
+	pdev->no_command_complete = 1;
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_RIDGE,
+			quirk_thunderbolt_command_complete);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_EAGLE_RIDGE,
+			quirk_thunderbolt_command_complete);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_PEAK,
+			quirk_thunderbolt_command_complete);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C,
+			quirk_thunderbolt_command_complete);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_2C,
+			quirk_thunderbolt_command_complete);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
+			quirk_thunderbolt_command_complete);
 #ifdef CONFIG_ACPI
 /*
  * Apple: Shutdown Cactus Ridge Thunderbolt controller.
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 530b0a360514..439c2dac8a3e 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -441,6 +441,7 @@ struct pci_dev {
 	unsigned int	is_hotplug_bridge:1;
 	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
 	unsigned int	is_thunderbolt:1;	/* Thunderbolt controller */
+	unsigned int	no_command_complete:1;	/* No command completion */
 	/*
 	 * Devices marked being untrusted are the ones that can potentially
 	 * execute DMA attacks and similar. They are typically connected
-- 
2.34.1

