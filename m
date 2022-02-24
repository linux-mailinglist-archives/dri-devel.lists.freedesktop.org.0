Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5635E4C3824
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 22:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DF510E7C9;
	Thu, 24 Feb 2022 21:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2040.outbound.protection.outlook.com [40.107.212.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C94110E72A;
 Thu, 24 Feb 2022 21:51:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdYNLjUJYSElKhPQe8fpdkzefSGGRZaH6leijyzbbbjg46HOnQ3JQUPY5g1h1sytCCyaONcQMV2Sg5qHs/ori9UKG5Ul93C9Eiyi+Cmr9+rvjrURJxcHBn4eRUiWNKH+yD+mSDnwpUnmt/yngG/ePpWObjJDfkTsthSgbTCEssGB7JIeG6AcstcmWj7E1wrq9XmwCcuN/n1qKJODM/bbb1d1O4dh0eWxm3J8sjI6BRYIiR9EpggBs3v1DP/QRzfEyIc/ijVn5hpjE/HhDdCsUyC+6QcoZdPqmu4795vgZ+WZGPqETdT0roNa7vE0sgo4FoMT67jtaDBeZFfKXTQtqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXeq44UGDh+yXSFy0C6z1HO6VXSxKU7/IiLBFCD5ZxU=;
 b=fpVzZoeLMdSt26JnvG86PJ9bVtah7P5v6dKjZ8iwy69I/xwRfc/jqttmm5Hay3n0pSkHO0B5U+O/M4vN0UYl0M66PT3V8GJAQMj9fp4mE7EH4s/tASctyBGyMoz2rDf6VoPaP9yzSWC8tZqO+oN+dfY6Bljshxk80MyXoUgTuguSbRPWt2aXFdWHJH7dfqrNjZBd/cklcRmxwtq8I/CW6HfCAVwx3SNly85FP9ss2vT8gZZbmnbJAYtAviVgl8gTqFbVcN3CyKY52bMd0C2Cl9QLQPsQzqska31orF3Cttz7I2u6YGfQhjbNHDJwUm6JdFeqEWdYCRxCQqnvcvLJFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXeq44UGDh+yXSFy0C6z1HO6VXSxKU7/IiLBFCD5ZxU=;
 b=Ju/+GlnUDg2fjwb5nWJLsSM5Gf31r1DqXUxY92vSCChFQxSHoFORuQ0QwrUU2oJI5A+97PKtTo2JHBqfv1ZMEUKEQQo1hjneswFQ1Ilfe5GlDjsy79f7scK5p7CphQg3ID7wMlbvp1qo1JlheSrr+CpLOFHm0A2z2SE+h85c7b4=
Received: from MW4PR04CA0165.namprd04.prod.outlook.com (2603:10b6:303:85::20)
 by BYAPR12MB2853.namprd12.prod.outlook.com (2603:10b6:a03:13a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Thu, 24 Feb
 2022 21:51:25 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::12) by MW4PR04CA0165.outlook.office365.com
 (2603:10b6:303:85::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24 via Frontend
 Transport; Thu, 24 Feb 2022 21:51:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Thu, 24 Feb 2022 21:51:25 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 24 Feb
 2022 15:51:23 -0600
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
Subject: [PATCH v5 1/7] PCI: Move `is_thunderbolt` check for lack of command
 completed to a quirk
Date: Thu, 24 Feb 2022 15:51:10 -0600
Message-ID: <20220224215116.7138-2-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4278af5e-e2ce-42d7-51ce-08d9f7dfcdeb
X-MS-TrafficTypeDiagnostic: BYAPR12MB2853:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2853EC7A4AD21764BADF75AFE23D9@BYAPR12MB2853.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bjIOUCxyLWPt1Rza7PKg/CUJfCpSvWakLXTLTB0oXUUzwp158BTV/A/WR4hioLM26vXK9+XwPLy/sswjh8hwURqni9qvGs/dwJFP1mX+iDzQS1Zf0Bx3mHojyUhm1xOX3VXqbqzU3fDb0PB9B1/JlW5/9UW3ZyxXftZbky7UoXKTOKwpml53eYnBcD2SfcCA8lR+DykOWHRc+lbGw8/uArBSBULXfIKr+GmxAnPCOPsuO8mDsdGw77KAwjrjZhCvMwXLGffb1MYNJ3VJdhsbyeBWfN9KKoy0OOx0iSu90rl01N0DuQHy7o/gEhTIOQEynkwelvcPQQOnYstw4qwp0PbxDGGRaLnkrlUP16+lW1XUnpfgayNECILDVvm0ygGf7OoU5IH6Ti8BcWIE17Jcoq6wTRjfOx/Oxs+ZZGMOEfVxiDf15fk7iBUQEFBA/kRYQ5MKki+YXu+hNeanC1wg5z+CzOYAGQcy347bKQ3yc3zK2NDfZE7r1FizUswjSPcWDfIlkb8lYxX6oNKe3bW7gWWBM+xJnhb//DRVZpwGlp37NS4xcbHFkg2WJ+eGtVkk2SUlqsuJk1EWyn7arY+hTdaAGTBikwELJchOfDvdkUuX7ERPMAd34dGhicf+gRMUmCx/2L9AGBGEzE5Ektcnq7JEBxYESEt/t9vOxcyAzgR2rjX8knW5/I64DKHK1el6seN+8WW0TlRYQrUoHTeKBp4dBJO4fagSFFvps2KSUBA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(7696005)(83380400001)(70586007)(36756003)(36860700001)(70206006)(336012)(426003)(2906002)(356005)(47076005)(8676002)(81166007)(4326008)(1076003)(5660300002)(44832011)(40460700003)(54906003)(7416002)(16526019)(508600001)(2616005)(186003)(26005)(8936002)(316002)(6666004)(82310400004)(110136005)(86362001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 21:51:25.2279 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4278af5e-e2ce-42d7-51ce-08d9f7dfcdeb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2853
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

The `is_thunderbolt` check is currently used to indicate the lack of
command completed support for a number of older Thunderbolt devices.

This however is heavy handed and should have been done via a quirk.  Move
the affected devices outlined in commit 493fb50e958c ("PCI: pciehp: Assume
NoCompl+ for Thunderbolt ports") into pci quirks.

Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/hotplug/pciehp_hpc.c |  6 +-----
 drivers/pci/quirks.c             | 17 +++++++++++++++++
 include/linux/pci.h              |  2 ++
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index 1c1ebf3dad43..e4c42b24aba8 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -996,11 +996,7 @@ struct controller *pcie_init(struct pcie_device *dev)
 	if (pdev->hotplug_user_indicators)
 		slot_cap &= ~(PCI_EXP_SLTCAP_AIP | PCI_EXP_SLTCAP_PIP);
 
-	/*
-	 * We assume no Thunderbolt controllers support Command Complete events,
-	 * but some controllers falsely claim they do.
-	 */
-	if (pdev->is_thunderbolt)
+	if (pdev->no_cmd_complete)
 		slot_cap |= PCI_EXP_SLTCAP_NCCS;
 
 	ctrl->slot_cap = slot_cap;
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 65f7f6b0576c..ceeca7d8dd90 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3675,6 +3675,23 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
 			quirk_thunderbolt_hotplug_msi);
 
+static void quirk_thunderbolt_command_completed(struct pci_dev *pdev)
+{
+	pdev->no_cmd_complete = 1;
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_RIDGE,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_EAGLE_RIDGE,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_PEAK,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_2C,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
+			quirk_thunderbolt_command_completed);
+
 #ifdef CONFIG_ACPI
 /*
  * Apple: Shutdown Cactus Ridge Thunderbolt controller.
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 8253a5413d7c..1e5b769e42fc 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -443,6 +443,8 @@ struct pci_dev {
 	unsigned int	is_hotplug_bridge:1;
 	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
 	unsigned int	is_thunderbolt:1;	/* Thunderbolt controller */
+	unsigned int	no_cmd_complete:1;	/* Lies about command completed events */
+
 	/*
 	 * Devices marked being untrusted are the ones that can potentially
 	 * execute DMA attacks and similar. They are typically connected
-- 
2.34.1

