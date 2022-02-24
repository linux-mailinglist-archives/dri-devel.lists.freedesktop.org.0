Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 497F04C381D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 22:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B421B10E745;
	Thu, 24 Feb 2022 21:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6634A10E7A6;
 Thu, 24 Feb 2022 21:51:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbdDDt9agbHD22uyJPM7iU9YXaCevuWJE0iRJ9XfzZd+WOJfcC13UKsq4S7AFUqyirQQyF53ZJLorHm+F/jNnQKcl+Xc+/5NUQn0YCXYb433Fi4zZAwCCeFcT5Oqie1N3fHWfkTy+Gb9ykF7lj0BmYR/2iVw6wcXEEGHhL9m+WSqjhVVWoGzxuQQ4SKswSMVEvA7T15HWWNwVftqnWaWQ0JAUuxi3++E61Q7STtjTeO/yTJFahlHPyn/TnkIQqNiBlsRqairbfNpQ5kOKPJd91rTXPilghJ0iOG6Hd4TMQC3jdsCMG9W/m9PiWZLjZ0mVNqOpugysdalnofzYFqLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ue1NSYQUIHWl7bv8ClwslJxFKCM05VXIAWbywmqWr+0=;
 b=Y8ThABSPnr9Pem8EMS4yIQp3qb4KuRCYi48MEcgVDhG29n0O9vH9uiGM+rZFgidlePa3I/lBqkslRkhHyZryCMeEZwISza59vlUhOkLSQ1+Wycre4NgVAwNTkQESV1VH3BhfWDSHQcyKvd06R+m1EQMPKh3zxuaf1HwXn1qoJSBMVWw7F36iOeQa/laUHUCxmcYv21M//69MjPnrAeUJ+kMOBYynAoIz0MLRqTKOX1X20Cv/pIZXyxnHCwWIUjfUYaF/RrZ6Qy7/5CY7XCRVHIrghnPiR0YQoiCSowrU3BtGzdsW9hk6B/wKWGKaVhHVtQEoVBOPdTvY5FOzY4cxYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ue1NSYQUIHWl7bv8ClwslJxFKCM05VXIAWbywmqWr+0=;
 b=0K3tCqPGUjQ6m7b+IMaGktd0jaBDUkQyqLs2lisoWCqpkI3x3B3VGwH0zhN9LkDKWvZvOEIGKV420QUMgTTult98yySEBFH7GwbDx3mpwCToFSF8fynF9lmppuXqkE03E3/oNj2du7xAZKCXkpdGa7sALpdNYIIBd3zdShqtfDM=
Received: from MW4PR04CA0167.namprd04.prod.outlook.com (2603:10b6:303:85::22)
 by MWHPR1201MB2526.namprd12.prod.outlook.com (2603:10b6:300:ec::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 21:51:27 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::5d) by MW4PR04CA0167.outlook.office365.com
 (2603:10b6:303:85::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23 via Frontend
 Transport; Thu, 24 Feb 2022 21:51:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Thu, 24 Feb 2022 21:51:27 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 24 Feb
 2022 15:51:25 -0600
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
Subject: [PATCH v5 3/7] PCI: Drop the `is_thunderbolt` attribute from PCI core
Date: Thu, 24 Feb 2022 15:51:12 -0600
Message-ID: <20220224215116.7138-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224215116.7138-1-mario.limonciello@amd.com>
References: <20220224215116.7138-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94f8e944-d3eb-4206-04ef-08d9f7dfcf07
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2526:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2526FF8B14D00D2FE2D0FFA6E23D9@MWHPR1201MB2526.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QZnTnUtaHW4TQo9QlU79Aw2j9fOJP49DYtSt1F4KZNkn4ObAdLlIhPFEzLqfE6sTY18r+IxJMvsB4zsBdTAyf/KltuD0RSvbX/Pm+eZ5Ghgg5DSHfbZRsFGihfPOPceny4PTqOvmrJbS85NZhSY5ojhjHERRfdo5meaEtiMfueOPdp2CRDVpM3JvJn541SApbHS4ROeCf4MeHyP84bQgnEP1fvsai9oWXG/CR0/6Llv65BXrvwC2JHVm0G91VyJTp77M6EgkgteanpXpcS6hHj2w/o1O9jJSJ+y5WR1bFxn+T3W5sZa1sFfo/QAlKpr7RQ4QGBMONECzFM9vUaqL7TTO7689iUDeo9cJQde8L5fpRA0zZB06GAG8enw1+SshMDWsrKmx8w2BbP2glXI8Qgo01CKvLNsly6cbY8UiwwhOLs9cYhhETCKQvFH9Hsl0xDW9jWOfZEl+nx1A48id3zJ6EX9DMVzFfnYDNpT06oKG+Gjit+K/bA9Vn17ACdJf1uagIJ2eci3r2ntwusZ2leGu9xS/FgAdLoNmbI9Fcu26LVCqcXB935JepOZGQZWuQiwOvzkBcJSjico8uJC3fSBWxhtDpQuXyJAKqLJU2zRLq8Tvhrqahea6Pogzfu234QVA1gTp23zwUu81i3tpYAPzkBQ0ANt//+cCHu2WQ0/HRdCLgCzRYxzToryNYID+3rvRypAsHQeitjNEMCRC5izf84CyNf6SI9wkZ4Kl5QA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(16526019)(186003)(26005)(426003)(82310400004)(336012)(83380400001)(8936002)(508600001)(1076003)(6666004)(47076005)(7416002)(2906002)(356005)(7696005)(8676002)(110136005)(40460700003)(70206006)(70586007)(36860700001)(36756003)(4326008)(2616005)(81166007)(5660300002)(316002)(54906003)(86362001)(44832011)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 21:51:27.1028 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f8e944-d3eb-4206-04ef-08d9f7dfcf07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2526
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
index 17a969942d37..1b752d425c47 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1584,7 +1584,7 @@ static void set_pcie_thunderbolt(struct pci_dev *dev)
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

