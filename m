Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8612E4B5EC4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 01:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A705410E36C;
	Tue, 15 Feb 2022 00:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D6710E366;
 Tue, 15 Feb 2022 00:04:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQnpfNxVBvelqkyVnu5vU4XpnySVucBDMGVII+FwNDZQTxHgCxMdTxsZwgmsHmC6gVXaijNxukiZkCOWcJzJiGHy5vONuVJGpUCYi0qOgVm24/jxe/USsOxiGyG7qMEjSJjqNJIW6EsvvWf9t32qAIM0RHxlM4yqqL4ONx5kAL/FzjQzj/uFqwx3C8iAi5QlHKjoMJEvO8ZGy+tvw3E4/KLqlSoZsRNI5Dg9E/J4fU6NoZCv2ZRBekbVR0JQMzKvifNGHouoAXjcQ0DoASm1oqNOqajV7ITJmRyOcpy7i9Q3M30tb+h6DsxMLD6SxOPdrkAs0TxFIyjL5IbwfOJEzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efh9YeuFWpMrxh5YIDlHa6hvJsEsw/+/2ZVDNnREI14=;
 b=OsH04J5VlpExUMEux1qMVCwYbjWsy/ToVIxgXydLonl2TY0yp//QzqENyn3rpeE7bOVMhGqeaAOlZrb9f27SudGQ37hlDP7cNFCP/oZ7wY6f+KED4wDzepFoUUsd0DQVi8gp7OyNicyS2RjmenyNwMVgpZx2qACIey9Ye7Q03Tka6INnyNk+itApT1483Qx9g05dZtrGL9ZV6zc9Wv3YOSjhCXIFgfgRbK/D5lDNz4AX43XcrljeweawHTctqK2705fwBKGZONTiYwCVud28L/SRN5IhDrhtNuZ0AIgY8ZEsJGRJNwEBlIxuvKoW17mlNJ8lbF/7ISS7STeiXb1ZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efh9YeuFWpMrxh5YIDlHa6hvJsEsw/+/2ZVDNnREI14=;
 b=nSY/yFtuav58gaWOomq8+s1Xbkf+Eo9fSf3rW9JSlm0ecpdWqz20UrpMiRwp/rQ5K2ZwfjdM8ibzMe6OSaO1L/x0w7HpOrH5l7eSnHCjJNy5/RqCNzbftjEfLPehV2BheelInYf5oo7siCTPTFRCCfz9czNPdvzUgksLB9ZnjHg=
Received: from MWHPR12CA0044.namprd12.prod.outlook.com (2603:10b6:301:2::30)
 by MW2PR12MB2538.namprd12.prod.outlook.com (2603:10b6:907:5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Tue, 15 Feb
 2022 00:04:19 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::72) by MWHPR12CA0044.outlook.office365.com
 (2603:10b6:301:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14 via Frontend
 Transport; Tue, 15 Feb 2022 00:04:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 00:04:19 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Feb
 2022 18:04:15 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 06/10] PCI: Drop the `is_thunderbolt` attribute from PCI
 core
Date: Mon, 14 Feb 2022 18:01:56 -0600
Message-ID: <20220215000200.242799-7-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: a25325dc-29c6-45be-ed84-08d9f016b6a8
X-MS-TrafficTypeDiagnostic: MW2PR12MB2538:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2538B2707C0CA3C514A91FBFE2349@MW2PR12MB2538.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S47AP//RgwiWtohUy5gU9dz+OXPYO/dtRr9V6VV+6IisI99K1uuzklvWGufMlg4qG8jQW+OvDuFMEHOzax2fKGNTbPbHlBS4b7kd1G50PEGDItwkCZ/YEA45PVil4D8CoQeOLpvD1G6vYsnnmb+LrZPEQ6m2IXzAcRjl5aVfrj91n7cbh9aMTTBQycFNEwxaS+5GIJpxjxEFKDNBOJVbHX80GL4ltmbAHNrTm42m6BOXJqKYpaTDI7vjJBuQH2txGR3E3gwOfY9Cka1w5v+2Xwykc57rKVSzGiGr45KqBcSJHoQRxghghYnZ3aF3YWzGa7B6nlRAdxLCaXQFVW1EXmx5ywvPKy4q29/XQFP2IyJi5xFYL5Q9lEYXiyS/z1+1oOgfo0YKpKbYsQG4DkPBcpLuhLVvwdp2g3eHOXC6496zc7jH0nnrvvKltr9o/XOaui6yd/UT8ZZFSD5VCHT0Mx0wxL6ESIWCuDuaCZNXIAhfW27ohfyMgVr6H6cVZIYJ3xKC1QHxnDwzf/9LvQVuFFN2FfvQUYd3aP45KOImxiGuXiq6ieHNKE0GmtHKa/Mp/X3rxrf8abS3QfxBn5wTuB5/L4ccZWw4mbYzd33Q4gzOTQ9/ZRk5OzMln7micP3+3DxXllbjJuC0seP9mAxIfx8gFxlYwJANTlzvfV/+KmwhoWjH9hYP7R0NOcCPQSCmsMJ8lnwTSdTy8Jg2cNAUr6p5dDNvd+bC766X4WGx8jI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(8676002)(47076005)(70586007)(6666004)(70206006)(36860700001)(2616005)(83380400001)(508600001)(1076003)(26005)(186003)(110136005)(54906003)(4326008)(82310400004)(316002)(2906002)(16526019)(336012)(426003)(44832011)(7416002)(86362001)(36756003)(81166007)(356005)(8936002)(5660300002)(40460700003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 00:04:19.2544 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a25325dc-29c6-45be-ed84-08d9f016b6a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2538
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

The `is_thunderbolt` attribute originally had a well defined list of
quirks that it existed for, but it has been overloaded with more
meaning.

Instead use the driver core removable attribute to indicate the
detail a device is attached to a thunderbolt or USB4 chain.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/probe.c               | 2 +-
 drivers/platform/x86/apple-gmux.c | 2 +-
 include/linux/pci.h               | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index a07859c8675f..fe49175770a1 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1586,7 +1586,7 @@ static void set_pcie_thunderbolt(struct pci_dev *dev)
 	/* Is the device part of a Thunderbolt controller? */
 	vsec = pci_find_vsec_capability(dev, PCI_VENDOR_ID_INTEL, PCI_VSEC_ID_INTEL_TBT);
 	if (vsec)
-		dev->is_thunderbolt = 1;
+		dev->external_facing = true;
 }
 
 static void set_pcie_untrusted(struct pci_dev *dev)
diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 57553f9b4d1d..4444da0c39b0 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -596,7 +596,7 @@ static int gmux_resume(struct device *dev)
 
 static int is_thunderbolt(struct device *dev, void *data)
 {
-	return to_pci_dev(dev)->is_thunderbolt;
+	return to_pci_dev(dev)->external_facing;
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

