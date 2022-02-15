Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB2D4B5EC2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 01:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B9010E36E;
	Tue, 15 Feb 2022 00:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F25B10E368;
 Tue, 15 Feb 2022 00:04:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdgdN7h2PgDth7zICPStagOzypgEU5198WUJa8n2PvC353IsVqN4vyUeH3mCHVwomSSnW3upzQQlT8aG88Gq67js+l0r0Pi56/LFVwVUWEcWsKUHhoD1NzL981CnjPgw3+wHjGZcwSH8ZkGxQxIqHt2qIFOzZSzluvn7LM95+goW5nxCm9f97azFo0nDpGBz3QYCShR+YBSMTjFA8+3V6vxJD6/VZW8tvjMSPR149vOjkiH9QmHfIVBC/7RJFLezIP3sYoOh7xa3wTqUIZqkuTqbewHjVlw9/PPT5gyfIerT9M4gH9zqJI8a2pGB/WV0Jdope/R4iXd/U1mjQ3p8lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CJsbT/uQNbCLg3zijkw2HtWNygmK8JRosfQfMJvjsA=;
 b=Im5nUSC8vLb/k4c49Tt1AGH5EXWfZOtNq5NRIiMeZBY00GFpDtniojrDLkRCRgZ8VDdICyPc64cZ4dLZWN5BizNGLwySpyioLgDmtVMjZOwklLci0ELkDG2GFLdqeK1dIm4wlshshUGjNuozHDiOs/EqAlTk4HY/t9hRO6JK7FR6U/z0lgV8EYJ1FXFHpTHhAqIfTXFAEoVijtYSZAYQtT+6xy/86VyiIki11G6r5vRVcZ3VNXXUg2MiToKiMDcod/0eGt59mDjvYUILGwPL0B4FdW+GSgCOZgiTiHxJD7LqjRHNATHLaf3lmhIuSOlz+0/NeXrSLIZIXtUMjWHhPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CJsbT/uQNbCLg3zijkw2HtWNygmK8JRosfQfMJvjsA=;
 b=CA+NBKqYgJK9y0zqatUIdnZe/qz9Z4QRyRAxdYqNI171HLqLWmmR156hddnnGlXR9nd0tvvlnAvnBkC027NOLMbgiYXQ+C27DxQYK965fHLB9PmZ5B6DzZqRN+ocMLoMw/01i9VB2MeBmCFe1GOloZlqSF783s3tpS/H0TU+jHY=
Received: from MWHPR12CA0038.namprd12.prod.outlook.com (2603:10b6:301:2::24)
 by BN8PR12MB3267.namprd12.prod.outlook.com (2603:10b6:408:9e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Tue, 15 Feb
 2022 00:04:24 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::16) by MWHPR12CA0038.outlook.office365.com
 (2603:10b6:301:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12 via Frontend
 Transport; Tue, 15 Feb 2022 00:04:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 00:04:23 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Feb
 2022 18:04:18 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 10/10] PCI: drop `pci_is_thunderbolt_attached`
Date: Mon, 14 Feb 2022 18:02:00 -0600
Message-ID: <20220215000200.242799-11-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 826b7417-dd46-4f74-c994-08d9f016b914
X-MS-TrafficTypeDiagnostic: BN8PR12MB3267:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB32676935BE62DD71FC4A72ECE2349@BN8PR12MB3267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4BU0upFeyyulbVyS1/GE2fwcgOcMTMu6li28j7s3SS5R6feUSq3F2u4pIFnuidmXuA3Kmohq5HzncZswcJ4D9oKh+VHPJSYDVfh0uE2fbzE5vRNtE2gBfDiL6keLyYaHJSwwd5H0d2gXJrCCPLxoU4F2MFePWyaMM0nIg7NFqMU/xL4Z/VodvTo3vhVb+7woLx+WNWb4C9dGp4qco98h+6/2OEjEEZpGJxL7SKf00VHo4IKZWmL16Lo5KMXCjcQlBfDlASBCSASmKF0c2ZJUtcuzCNHVf2PvpJUgunPyzfjCImp9KpEW5/mEH3+huejT8yhjmcq5DYX0Dgyf7GEOUFXmFTyrxqW+DwxXuaLotQoTAfkEmE+tF44UuxjhI8YDGJ7y6WfQkRRK9z3JdoM4ODbBRMeZpYjZRDwoImivOA9cAzR4zPsEG+Wwx4TOGUXKLN5pvnBKZVZ5g4js0KMA55yuBbfA3iUz2XLh0/FvbSsMaUBHiYkBSq00t1qSa2EwAMyayUIHSD06QrDz/ZJ96dqroiDEoR9vMaLX7dnxjL6ftFlMrD4DGEhYu+/umcCoFhJI7SScjnRuNaAw1JEIn4HjbdyqavgUY4UO3Zyvw0v/UPJtEtLTNMbI/4DJrTlrEfyobLaqraix81BTaMowZpMYsobdKm3nMD214WlEp5IHsoepoxjZUH/GBFbHviZ4oLVGoGDjC/tQF8kBfjOscozIVSMRfdSQ9GoKf0Pk7fs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(86362001)(2906002)(8676002)(6666004)(82310400004)(7416002)(5660300002)(8936002)(44832011)(83380400001)(47076005)(40460700003)(54906003)(110136005)(508600001)(36860700001)(356005)(2616005)(81166007)(4326008)(36756003)(316002)(70586007)(70206006)(26005)(1076003)(16526019)(426003)(336012)(186003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 00:04:23.3167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 826b7417-dd46-4f74-c994-08d9f016b914
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3267
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

Currently `pci_is_thunderbolt_attached` is used to indicate a device
is connected externally.

As all drivers now look at the removable attribute, drop this function.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 include/linux/pci.h | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index d9719eb14654..089e7e36a0d9 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2434,28 +2434,6 @@ static inline bool pci_ari_enabled(struct pci_bus *bus)
 	return bus->self && bus->self->ari_enabled;
 }
 
-/**
- * pci_is_thunderbolt_attached - whether device is on a Thunderbolt daisy chain
- * @pdev: PCI device to check
- *
- * Walk upwards from @pdev and check for each encountered bridge if it's part
- * of a Thunderbolt controller.  Reaching the host bridge means @pdev is not
- * Thunderbolt-attached.  (But rather soldered to the mainboard usually.)
- */
-static inline bool pci_is_thunderbolt_attached(struct pci_dev *pdev)
-{
-	struct pci_dev *parent = pdev;
-
-	if (dev_is_removable(&pdev->dev))
-		return true;
-
-	while ((parent = pci_upstream_bridge(parent)))
-		if (dev_is_removable(&parent->dev))
-			return true;
-
-	return false;
-}
-
 #if defined(CONFIG_PCIEPORTBUS) || defined(CONFIG_EEH)
 void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type);
 #endif
-- 
2.34.1

