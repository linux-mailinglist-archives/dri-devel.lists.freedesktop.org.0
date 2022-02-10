Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B734B1877
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 23:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E96610E978;
	Thu, 10 Feb 2022 22:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC82E10E976;
 Thu, 10 Feb 2022 22:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNf3FgrjPRwCvoQMi/fbH38buFrOTribL6pChYYmXydFEblGFIW6POU/U7UhU6qjW5K3f8gTKxCAFGAawZUwE2SGA0c+MqIRQFWNxaUz6l6wFjDX5iOwoc0gPKWPnBMGIt1YC2U8ppmepm85V+83chmGKRTy+MFOHSvPHBi3O2FYNUkc8Ur9TaidkIa5HL6xnqH+YwIKcx7POcRY/JUBZjrs4TAh2MojUdSq4wuxszcY26NetgnoWVens9xS3YqUAlvqY19FJQsNS0A4e534gF4hUId2rMaQVo3YTd/oQlugzbRSnCkKULokQuibA37a27F12NjgjdcNSi1YvDdnYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilvoqIeDqjDHXRzKEBSZM9Hopg/4mGCxGCmTazngJnQ=;
 b=LqtONBno4BNr+RqbRN7s7dGPyOqajmeBCrKQPgHOAI0ycRymVa5+T3WMeNPNPVdpp4M9EsMrHnhxtPL59R2N69Jd2CxWkPtMbXDNr8F2NPzqQV6Kgmcgaaxom0IlRgVSWyRQ7dCyTs91U6DkCPWPicVuBHomWt7UCTmk4cI+2rfao2D8AJ7tpAeb+XS4QXktGoJdLIvk+DvdzHYf0Pp42Y7QTOSP98JIB7hFi++zcGEM5ddA+h3BsvKb0XJbLOHn+S8nIBV2btC9zcbMpjiSrE7avgugJ20VU+0hPyDd5aUwV6XsoGy9S1CzXsW8FON+nYvqyEOCCHfwFaFHUKggUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilvoqIeDqjDHXRzKEBSZM9Hopg/4mGCxGCmTazngJnQ=;
 b=XKcXJCkbP9iB66MaN4Wgf5W1T/G3mZSDl6/8KsPIKu7Lir1cpIYYQgepcBV2axKX5n7eAmZ9/+rrVxxMPbJpmfj0jaw2Ebz1aaIboE6kP9aBp8CNTEbDDXRNu2k64GxnW3L0OKm5QbwzwyfIQQxY5ih4q78zN7gio9VGqfs3lYo=
Received: from BN6PR2001CA0027.namprd20.prod.outlook.com
 (2603:10b6:405:16::13) by DM5PR12MB1754.namprd12.prod.outlook.com
 (2603:10b6:3:10f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 22:43:48 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::49) by BN6PR2001CA0027.outlook.office365.com
 (2603:10b6:405:16::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Thu, 10 Feb 2022 22:43:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 22:43:48 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 10 Feb
 2022 16:43:43 -0600
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
Subject: [PATCH v2 3/9] PCI: drop `is_thunderbolt` attribute
Date: Thu, 10 Feb 2022 16:43:23 -0600
Message-ID: <20220210224329.2793-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210224329.2793-1-mario.limonciello@amd.com>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d249dc4-6750-4474-d5b1-08d9ece6cd59
X-MS-TrafficTypeDiagnostic: DM5PR12MB1754:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1754010F7CA3B237FF9D6485E22F9@DM5PR12MB1754.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OsGS5wQZdTIo29vg9EhpPjGDYWEbzwF5qPTuUS0xlfq2GcxY0ytS10v8K7vKECggAtQ29gMyriEs0/2wk520JttPS1P/QqCH/IHLsplbRMIKtrXybTssADUxqYZD1nlqHJb3bADCYAdDS5o3mLbY+SVkZSNNbmSgE/tvwG8CpLlB0FJpCRw1nskvk5qfJyIIUpmi+X+GD5sDoHFAZ0lE0zLfDR6heANqwHDD0CShPHxVWvaijHlLX7/lUHjpi2TyQvvibuscxgyEZKUu3riIcy8ze2hpxkE4kiK3nU/+FIhI81en7jGf6JYaOpxcWwJNc/EcdU322mXuiYGn/9xxTGSteWBxcrPkKocvhxN+hKbH7W3YKnXdLWHWj10rxUp4FE1tx4GG6tH9S+1S8S93zmYdnDLwKc5sZeKMDldXf786SzUpqTRszZE3M5OcjvSkODeg7GBc8HJTHUCOcA5rlA0fDVZFAO3jnaWOHt/1oAglkWzJDLHC44b4ORdAByKwppyCa/FoYPwC9SIzpFzGe5f/3MB0j5g8mHp8mB9y6NRw4uPCZh1NF+uBC7PbvZ45v06+Andyl29qGNAD/6Nmqpc3ZpaKh8s93DiluC3Eub8dpaPG7bvw1K4BelfucXf1OHkdwW58yJS2AlBiG1ddEYlsM0FoM/9G54Pm3wAvQF9abdymnvLxY5IeI1iKe9xQ2RRUWZPbvR+2Hl1lw95yrWIg66X1JTjTqyKN9W343fA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(110136005)(83380400001)(316002)(1076003)(54906003)(36860700001)(86362001)(2616005)(336012)(26005)(186003)(426003)(16526019)(47076005)(508600001)(7696005)(6666004)(82310400004)(5660300002)(4326008)(8936002)(40460700003)(81166007)(356005)(7416002)(44832011)(36756003)(70586007)(8676002)(70206006)(2906002)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 22:43:48.0704 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d249dc4-6750-4474-d5b1-08d9ece6cd59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1754
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

The `is_thunderbolt` attribute is currently a dumping ground for a
variety of things.

Instead use the driver core removable attribute to indicate the
detail a device is attached to a thunderbolt or USB4 chain.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/pci.c                 |  2 +-
 drivers/pci/probe.c               | 20 +++++++-------------
 drivers/platform/x86/apple-gmux.c |  2 +-
 include/linux/pci.h               |  5 ++---
 4 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 9ecce435fb3f..1264984d5e6d 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2955,7 +2955,7 @@ bool pci_bridge_d3_possible(struct pci_dev *bridge)
 			return true;
 
 		/* Even the oldest 2010 Thunderbolt controller supports D3. */
-		if (bridge->is_thunderbolt)
+		if (dev_is_removable(&bridge->dev))
 			return true;
 
 		/* Platform might know better if the bridge supports D3 */
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

