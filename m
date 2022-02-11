Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4C74B2DA3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B0110EB11;
	Fri, 11 Feb 2022 19:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2060.outbound.protection.outlook.com [40.107.95.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEA010EAFE;
 Fri, 11 Feb 2022 19:35:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9iKGUx3rvrnz6oNlc/u3UXx/GDjdTtxVSZ8eaxFzgAm9t3ShyWOcwksBsi8enMxL3bgj3VqnjfGUInAwfTh+CCFxMwaVhnys6ZRTfcvzZPmkURwA5KubnmPKgV5xudAhVotmdxmhpX6U5KQAvEC6dIDnb2RH+ALhCpK0/upBfl3wL901mL+D0N8+Q6dLQm7YNmsL+0MkgL2x+DWJF5LQOQBzQkjoM1EXynpmZh3kKWlb93NlpcS2QgLxjOiO35k6HfMB1tnmSmME5IV45lfH9MhkUAPyf+Z6TcWyv0DDxasae4RtHGJtgo8oo3eMVg0ZyadOXFXQ/+24GfKo1IoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GInF+4jDPMzFbvC2bfL1BskZl6bC44vdJYSXzUx0z0=;
 b=SntlumdgxgCSHksDUJJQ/BVPFv4CXnc9gj0kV1MDXeT9xLxMlb0RQK8ufmlJo4PXZZR8ho3ql2h91Sl9Yd50aYXuSgBFOcGZwXh9/c37ur76djgakm2JLZQVIgluofKP+ohMH9SgjPckMnd4jiNpDpHn9Oa/C5xtHujJwp75eVtDVx0X2Yt4chK2l6iSDW7mBMrtsxNdxl3GGPDm9x5XqMMFbsBiSa+RgKMkebr7aasegeM2ErajyVYJhd8jNbKytaNMHd8yYMNsJSUixWTfP7G05MYG15M7Z+CVRh5jcTBTKc5rwnLtPXg+gKALafMZemZQayd+gew2mOS3TQK6Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GInF+4jDPMzFbvC2bfL1BskZl6bC44vdJYSXzUx0z0=;
 b=eXpWv9eGQg9p0n6AOlVl2dVrxLeMuNJgjVDi/JaqFO0X6wz6zwAlitUl2o7MgbsDjL8q9vvOFVem0B9aM3+2HJWOigGr7QiiaeoOXV9iARz4MWBrvtnVMEGy6mvzw0Vwvzg4D3EgMvCXlLBnZeSgVSnD0uvLxhUtXxxMc4WeWcA=
Received: from DS7PR07CA0022.namprd07.prod.outlook.com (2603:10b6:5:3af::24)
 by DM4PR12MB5745.namprd12.prod.outlook.com (2603:10b6:8:5c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.18; Fri, 11 Feb 2022 19:35:08 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::da) by DS7PR07CA0022.outlook.office365.com
 (2603:10b6:5:3af::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
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
Subject: [PATCH v3 04/12] PCI: Drop the `is_thunderbolt` attribute from PCI
 core
Date: Fri, 11 Feb 2022 13:32:42 -0600
Message-ID: <20220211193250.1904843-5-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4b8b486b-4acb-47db-b8f2-08d9ed959cdc
X-MS-TrafficTypeDiagnostic: DM4PR12MB5745:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB57450A8A48A95772CBD077A2E2309@DM4PR12MB5745.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0bJNmPIYuNM79xTB0p+neeUTrYXkI+rPUgAfPV8z4egujRWJX28CosLYVdpyxnp5hEMr4S4U+rseaKZBLs0XAn8wiX2xDMWQhW0I8gXUCvOpbdJ9S7jLs1SyCfIz9LRVk3x+EIfh1FrPzs1d8ZohDUxw4so++dh1Np+kYdm05HV9878zIDNeUKTVSy61/P9fuAnxZ8eu/3tVFokn0qizro4BAZ6S/u6wSOBZ2Rgj5qMnOj92YrfCVGCruw8GbPzDLJ8AkJuLlkydrwQRYXIUPb2fhLYDWLYJ/CR9OB9eZ4fh7NRUl056sfBZPCLMuDIQnPWPwA30pliEGvu8HftzIr3uxzE2qrV15Fe/4zf41qGAbZqb6l6JZdyz8ZGMKHy+zQZwVXlBOLVn8erG3a2euhAU0F4kz9tGjXi/0SyR2n5KQxI0Saf5glUeldIgAJKdBNABPIJOAiUSTPdi+2zB128YsnO1RUDlptK8Pbwc0b+bwTpNxmfGPOF2nHfYETsfUdxJpoQF3MwSdpUTqm3BEM63dPe0wq2UXdE9ztI/CTmSstJf6CzbipWBMWx7/HQautvY7V43Z5mGzqDasBZLSMQIHM5MLZUQnWVFKWuQC1yIOphKlnU0FMSlQQ68EUwVU0UxZXIPpjWU0v55cRA8I8tEqYuSmFB+SRbxiBcu6MYch67D0smLHmOvs9zCbpoPgVoJIc6vp2mDcRnM5MTtFmhawXEQVL7KoJ0I6FVNzBM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(82310400004)(5660300002)(54906003)(508600001)(356005)(86362001)(316002)(6666004)(36860700001)(8936002)(81166007)(47076005)(426003)(186003)(40460700003)(83380400001)(70586007)(70206006)(2616005)(7416002)(16526019)(1076003)(26005)(8676002)(44832011)(2906002)(110136005)(36756003)(336012)(4326008)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 19:35:08.6319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8b486b-4acb-47db-b8f2-08d9ed959cdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5745
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

The `is_thunderbolt` attribute is currently a dumping ground for a
variety of things.

Instead use the driver core removable attribute to indicate the
detail a device is attached to a thunderbolt or USB4 chain.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/probe.c               | 20 +++++++-------------
 drivers/platform/x86/apple-gmux.c |  2 +-
 include/linux/pci.h               |  5 ++---
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 17a969942d37..e41656cdd8f0 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1577,16 +1577,6 @@ void set_pcie_hotplug_bridge(struct pci_dev *pdev)
 		pdev->is_hotplug_bridge = 1;
 }
 
-static void set_pcie_thunderbolt(struct pci_dev *dev)
-{
-	u16 vsec;
-
-	/* Is the device part of a Thunderbolt controller? */
-	vsec = pci_find_vsec_capability(dev, PCI_VENDOR_ID_INTEL, PCI_VSEC_ID_INTEL_TBT);
-	if (vsec)
-		dev->is_thunderbolt = 1;
-}
-
 static void set_pcie_untrusted(struct pci_dev *dev)
 {
 	struct pci_dev *parent;
@@ -1603,6 +1593,10 @@ static void set_pcie_untrusted(struct pci_dev *dev)
 static void pci_set_removable(struct pci_dev *dev)
 {
 	struct pci_dev *parent = pci_upstream_bridge(dev);
+	u16 vsec;
+
+	/* Is the device a Thunderbolt controller? */
+	vsec = pci_find_vsec_capability(dev, PCI_VENDOR_ID_INTEL, PCI_VSEC_ID_INTEL_TBT);
 
 	/*
 	 * We (only) consider everything downstream from an external_facing
@@ -1615,8 +1609,9 @@ static void pci_set_removable(struct pci_dev *dev)
 	 * accessible to user / may not be removed by end user, and thus not
 	 * exposed as "removable" to userspace.
 	 */
-	if (parent &&
-	    (parent->external_facing || dev_is_removable(&parent->dev)))
+	if (vsec ||
+	    (parent &&
+	    (parent->external_facing || dev_is_removable(&parent->dev))))
 		dev_set_removable(&dev->dev, DEVICE_REMOVABLE);
 }
 
@@ -1860,7 +1855,6 @@ int pci_setup_device(struct pci_dev *dev)
 	dev->cfg_size = pci_cfg_space_size(dev);
 
 	/* Need to have dev->cfg_size ready */
-	set_pcie_thunderbolt(dev);
 
 	set_pcie_untrusted(dev);
 
diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 57553f9b4d1d..04232fbc7d56 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -596,7 +596,7 @@ static int gmux_resume(struct device *dev)
 
 static int is_thunderbolt(struct device *dev, void *data)
 {
-	return to_pci_dev(dev)->is_thunderbolt;
+	return pci_is_thunderbolt_attached(to_pci_dev(dev));
 }
 
 static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1e5b769e42fc..d9719eb14654 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -442,7 +442,6 @@ struct pci_dev {
 	unsigned int	is_virtfn:1;
 	unsigned int	is_hotplug_bridge:1;
 	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
-	unsigned int	is_thunderbolt:1;	/* Thunderbolt controller */
 	unsigned int	no_cmd_complete:1;	/* Lies about command completed events */
 
 	/*
@@ -2447,11 +2446,11 @@ static inline bool pci_is_thunderbolt_attached(struct pci_dev *pdev)
 {
 	struct pci_dev *parent = pdev;
 
-	if (pdev->is_thunderbolt)
+	if (dev_is_removable(&pdev->dev))
 		return true;
 
 	while ((parent = pci_upstream_bridge(parent)))
-		if (parent->is_thunderbolt)
+		if (dev_is_removable(&parent->dev))
 			return true;
 
 	return false;
-- 
2.34.1

