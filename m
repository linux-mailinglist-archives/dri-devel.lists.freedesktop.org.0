Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929D87E091D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 20:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D73810EA76;
	Fri,  3 Nov 2023 19:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0275F10EA6A;
 Fri,  3 Nov 2023 19:08:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aq54nyWe+d7tPUxF5Kb6oKwzo4XVxCWy5wzh6q810PNKerHK5npZPfuibiW0Bn4WZZ20fubbOmcE/ygFyC37Hin6nEARVqT7igRTIFt2ezTlLK0CtVH54o7FrIGPQKSD/vN/84nrF/3SXVGp0jvpx79Qr/2LE/LXlA5MUuhlvaB/COKBQHGNiM/5ouK+3cniLDfhkhWvNeCsPr7ihrO8jwUrADqMkWupW7wTYje1M3UsiQ8E/Nlq+Abw6KQEzNGXvE/JDoEEOY3a2UxK1BwARYAU32lgEnxj66J9vmQFfIJg0NmIRZFu5tLtRdf1wq15SNrVDtR2JNzp9a6JtoLmZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0q79qkpa2Hw638VremU61eTlpA4cEYqgUAmNLw+EF2o=;
 b=HWG7iPjpcQ7H1RCIKg5T/j8nw+mVxfoyQWS6f9jEELq1Xyi3s/ykM6iC7eATId2HupGidS6mhlAmiZmMY/cawtKz8BhIl+0QELnYMrPS9Zdp490UYuOCWJRj7GDZM/3bGDqvKnd3bGHM2q7S7Luw5M/y0Ha9D3rSxwm3JX9jbdFchRqQzCqCuNS+jTaLYzzw+jiljN/eE3L6CWfcet+xVysTub2otCEGvNiY3pJObxklDwjutqfhHXJSWhea01cPhv+olwcHTv21aF2qAKWt/0kGM/dO4Y0i/TjmJeVzSmF886+yPW8iTougyO3rqF36+gVtaBdZ/XBQy1TM2vr/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0q79qkpa2Hw638VremU61eTlpA4cEYqgUAmNLw+EF2o=;
 b=1veGCVQXTsAcOSmRnnP3OPLwGnSrWEdjMn+ImoBOji8dtfBFnvqnAIqJYoRGDaY1mXkUpl1qErXQik5Qk04HdY/7px9ivmtXnJRfn0q75xv/rqN3MTmY0hDGGrCPqE+x5oMy1g81cNO54cM9PprWlhhlaWZRhTdyBnRFbKWtwzU=
Received: from MW4P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::10)
 by SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 19:08:37 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::e3) by MW4P221CA0005.outlook.office365.com
 (2603:10b6:303:8b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.22 via Frontend
 Transport; Fri, 3 Nov 2023 19:08:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 19:08:37 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 14:08:33 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Hans de
 Goede" <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v2 6/9] PCI: Rename is_thunderbolt to is_tunneled
Date: Fri, 3 Nov 2023 14:07:55 -0500
Message-ID: <20231103190758.82911-7-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: b58b71b4-6d30-4e0d-3e1d-08dbdca04887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cbuYa5jPwunCiAxbVyFNjQPTE2GuxmyDelEl2+GNDFWRUOOmWkEYl9fexF5SgRPzlvy1yig6v4xHLdmL1lVTJyhSSD1FI/el+lQX0xoDc+tjStvhw39EZ1WHbVne65le7MmQuAkIiE4bDq8y7+SwNgJS5lVn/1yWSAiN8SHkhiaOnFcmQtmA5Ug6Uvc71aekjRM/qn/Ey2KfIIGg0LetNgcSoZ25hq7mYitJ+8Qb9cB/LfG4kWxhwnYshVi4GyLOmpQPIKmx2cqGd2CB8P+m0SznEdEAdnk25eTiIz5lL8vdxmYpZLzUcH9rn+i9uz58vKxdX8VeDPGPgc8mh7NEYOdNJPukmQhaL4SsOOijdCpg/skYMVreCDKcO57ZZFgblMwEluajAwZyQZeTeqRP9Lf0VGPvtRizcTLmF9rclZ7DfbAglMjSjQpg7WZEfv4efC9mTLhKiZz4PKSlEJld93b3JtKmpPwstIc6iCvwE2uwvxnpPt7ka00AqpHXzHF4HdX4fdederEE7vfuJ+hfNg2KgwcAHPF4NVn1DvxvjBSrLNMwIvUG8o+//L1ZaP1FFNaew+E7SF19jStGr9NxgwS1Lgt48MghcxXIEReWTu650thAm/+0gAiO17Yo/Zhj5bqtrw79Ptx7Xu8rOVuLLtBJKQ6e580nQPZNes4++LA4agkSnOj5f7paoeN4k5qRSFVMe80t81PXc2zWcmlDl9fksOK+TKF8Z/eHYj2dHHzO1Fgcsto12WkMdkNd9ygUlBX5yqHbIZR2bm0QYJdA0Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(82310400011)(1800799009)(64100799003)(186009)(451199024)(40470700004)(46966006)(36840700001)(40460700003)(26005)(16526019)(336012)(2616005)(1076003)(426003)(6666004)(47076005)(83380400001)(478600001)(7416002)(5660300002)(7696005)(36860700001)(2906002)(41300700001)(110136005)(70586007)(8676002)(8936002)(4326008)(54906003)(316002)(44832011)(70206006)(356005)(81166007)(82740400003)(86362001)(36756003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 19:08:37.1039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b58b71b4-6d30-4e0d-3e1d-08dbdca04887
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885
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

The `is_thunderbolt` bit has been used to indicate that a PCIe device
contained the Intel VSEC which is used by various parts of the kernel
to change behavior. To later allow usage with USB4 controllers as well,
rename this to `is_tunneled`.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/pci.c                 | 2 +-
 drivers/pci/probe.c               | 2 +-
 drivers/platform/x86/apple-gmux.c | 2 +-
 include/linux/pci.h               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 59c01d68c6d5..d9aa5a39f585 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3032,7 +3032,7 @@ bool pci_bridge_d3_possible(struct pci_dev *bridge)
 			return true;
 
 		/* Even the oldest 2010 Thunderbolt controller supports D3. */
-		if (bridge->is_thunderbolt)
+		if (bridge->is_tunneled)
 			return true;
 
 		/* Platform might know better if the bridge supports D3 */
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 795534589b98..518413d15402 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1597,7 +1597,7 @@ static void set_pcie_thunderbolt(struct pci_dev *dev)
 	/* Is the device part of a Thunderbolt controller? */
 	vsec = pci_find_vsec_capability(dev, PCI_VENDOR_ID_INTEL, PCI_VSEC_ID_INTEL_TBT);
 	if (vsec)
-		dev->is_thunderbolt = 1;
+		dev->is_tunneled = 1;
 }
 
 static void set_pcie_untrusted(struct pci_dev *dev)
diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 1417e230edbd..20315aa4463a 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -774,7 +774,7 @@ static int gmux_resume(struct device *dev)
 
 static int is_thunderbolt(struct device *dev, void *data)
 {
-	return to_pci_dev(dev)->is_thunderbolt;
+	return to_pci_dev(dev)->is_tunneled;
 }
 
 static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 439c2dac8a3e..b1724f25fb02 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -440,7 +440,7 @@ struct pci_dev {
 	unsigned int	is_virtfn:1;
 	unsigned int	is_hotplug_bridge:1;
 	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
-	unsigned int	is_thunderbolt:1;	/* Thunderbolt controller */
+	unsigned int	is_tunneled:1;		/* Tunneled TBT or USB4 link */
 	unsigned int	no_command_complete:1;	/* No command completion */
 	/*
 	 * Devices marked being untrusted are the ones that can potentially
-- 
2.34.1

