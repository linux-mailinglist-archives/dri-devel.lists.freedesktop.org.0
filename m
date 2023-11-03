Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780597E0924
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 20:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF26210EA64;
	Fri,  3 Nov 2023 19:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0BC10EA73;
 Fri,  3 Nov 2023 19:08:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPy/0keoTcYrxIUxXOKX9W+s7kd3sTefyw3q1VP4WNXFcWtyoKw6OzjdhMRWKh67cgOVJVOtMh3M4UxaAsCwS/oEov8g+D8LuPXVsV76oF+l1S/Lg6Fiqr0PmA0GAIhHTByZahhr9jV+zPJ7g5NUtjioIpLe8TQ1YQmq4U+sc+pBDB+CBHIPVWz9HJrx9vM0RG5FveyxdM3MuhUGO3GtFJvZjWOoEPZEbfVFEFlSiL8dpBNJ9h9m9vhFaCUs4sqFXPpNWya+EjinmelytgHjvXt/uJWt9Qh6Txy2mZJvSl/UNsanvaABBoGaxlGZ1khRV+7WuIJ/ki4QEE3Rfy92Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvK1EOLRL3fEva493L/Ddocddm/ytkNImCssFqfMRSA=;
 b=KycTN0muaer/qxpYxvrTzl9twhktwoYk2PrlEPQnfh18WyK0sd41sbKh9pE6LyuBnl/d+Coub81JC5eWzEj2yg6JdzDfa5AH0CFuIO/3JvIMIgmD0GqLyx6bJt9toxs/DYpm2h//gDFmG4mEA7UHfIfevIxbnlXWLmCPBGIUXRkFb4l/9vyIyS0BeAYK9KXhq0qrFh/fLhdxH8lZRyFAp7LdxZ6A0LMyhFX0U584/+g1Oeo69lI5bl8x+MZ1C12tVRdA7bMRdLeA/rMMSHscWAUol0u1gAnDgySOfUvSb8z4ei+m99SVACIGoDFl+UNwOuxlWgWyk2zuPX5ENuCFfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvK1EOLRL3fEva493L/Ddocddm/ytkNImCssFqfMRSA=;
 b=0Mi5GWbP+ZVanmSU/PEva62VMf4h7wXsZAECQx9yEDp47qucAAvJBP3mC02Fje57iuEd46hPYCzVGJ9XpebIAjUpOPgG7zZApHLzDHRFpNnbOXLPjAE0vt96plv99Hd7QsuIN60IxWNa7VtmWCqOIe9lp372pcgRaR+ieS3bLoE=
Received: from MW2PR2101CA0010.namprd21.prod.outlook.com (2603:10b6:302:1::23)
 by LV8PR12MB9231.namprd12.prod.outlook.com (2603:10b6:408:192::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 19:08:39 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:302:1:cafe::70) by MW2PR2101CA0010.outlook.office365.com
 (2603:10b6:302:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.10 via Frontend
 Transport; Fri, 3 Nov 2023 19:08:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 19:08:39 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 14:08:35 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Hans de
 Goede" <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v2 7/9] PCI: ACPI: Detect PCIe root ports that are used for
 tunneling
Date: Fri, 3 Nov 2023 14:07:56 -0500
Message-ID: <20231103190758.82911-8-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|LV8PR12MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b2457e-15b6-4a57-e1e3-08dbdca049d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RijnE6ToB9ggfAu8en5ipXcGmL3JY+sd1LC0IBROqrHg2EUjPqORlIT9UpmR7jZMfYR8FagjDYL+bsXkqcUZvpt8zr/wnPDMWKajMVlayZ2fm1QIDHU/99ii931BKNCeVc07YQlt3j6/eRfZMIESSMZksOE7BMCbjHLNWTMQPShcwT9NmIBqHYZrQTL9sOncay6Msb20xL+pHJEBM21UTZUy68+fJ9WOqNnJhcg54cVu5QhnO1zOKCPA9lJgnW/OVUjXdiLNiusdFRstUngm4CRtogDWXYn8ngluhDxUyUWPgw+UUbq5Ldc/gj+M7czn+U247xl1O4vQC2+FHLF1nW4Fz3OegaRUYw3OIDt1YSpUIRAZEAd4H1tqzlSiAdVxFyeZbUQkprEz08xKKhCU5Fv4j7/LKyYf1OjKQ6Z6plmk5YpWYNdHhECuRy15ADmLmFAR4VHS3zuySbVCPKJclOVSAz1m0Hj8nJxOzxlgzkn/0qK1cA8ZFGcOfrdx+v8QKltqCagiDU2Z7Dq7FHqf537GLcQZ01Bdl5vLylpH6gkxVjIZdeNCQxQ1FaX2uOvSMH8diA4No9HHZkQEvGlN7yv4p3g9G8pjMZvypzVVkUd95Q4e6v9PlHlWhCGV1A1E8n0YQae4PRlJ8zzm7MQ/fntp0uVu32z8N2OsvodA5l6LwHdbnFtI1vFVb4/mYWJtJ0Kr0qwGE88ZZ67xsDbVRRy0NsxuXIJ/VdefVARSM5VUGbVPCsFtcndbkcdRIq4tydVmJRYiGqGHuk2/WjB9V6hf5KPs8j8ma76EU4mRWltwn1b6PehhWriFPzSyLTIG
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230273577357003)(230173577357003)(230922051799003)(82310400011)(1800799009)(64100799003)(451199024)(186009)(40470700004)(46966006)(36840700001)(36860700001)(47076005)(66574015)(336012)(16526019)(426003)(2616005)(1076003)(6666004)(26005)(83380400001)(7696005)(316002)(478600001)(70206006)(110136005)(966005)(54906003)(81166007)(356005)(70586007)(82740400003)(8676002)(8936002)(44832011)(41300700001)(40460700003)(40480700001)(4326008)(86362001)(2906002)(7416002)(5660300002)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 19:08:39.3126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b2457e-15b6-4a57-e1e3-08dbdca049d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9231
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

USB4 routers support a feature called "PCIe tunneling". This
allows PCIe traffic to be transmitted over USB4 fabric.

PCIe root ports that are used in this fashion can be discovered
by device specific data that specifies the USB4 router they are
connected to. For the PCI core, the specific connection information
doesn't matter, but it's interesting to know that this root port is
used for tunneling traffic. This will allow other decisions to be
made based upon it.

Detect the `usb4-host-interface` _DSD and if it's found save it
into the `is_tunneling` bit in `struct pci_device`.

Link: https://www.usb.org/document-library/usb4r-specification-v20
      USB4 V2 with Errata and ECN through June 2023
      Section 2.2.10.3
Link: https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/usb4-acpi-requirements#port-mapping-_dsd-for-usb-3x-and-pcie
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/pci-acpi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 05b7357bd258..81dbfd335f34 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1414,12 +1414,28 @@ static void pci_acpi_set_external_facing(struct pci_dev *dev)
 		dev->external_facing = 1;
 }
 
+static void pci_acpi_set_tunneling(struct pci_dev *dev)
+{
+	if (!pci_is_pcie(dev))
+		return;
+
+	switch (pci_pcie_type(dev)) {
+	case PCI_EXP_TYPE_ROOT_PORT:
+	case PCI_EXP_TYPE_DOWNSTREAM:
+		dev->is_tunneled = device_property_present(&dev->dev, "usb4-host-interface");
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
+	pci_acpi_set_tunneling(pci_dev);
 	pci_acpi_add_edr_notifier(pci_dev);
 
 	pci_acpi_add_pm_notifier(adev, pci_dev);
-- 
2.34.1

