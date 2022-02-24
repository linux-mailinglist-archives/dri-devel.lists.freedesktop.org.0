Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A03E4C382C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 22:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6971410E7AC;
	Thu, 24 Feb 2022 21:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2069.outbound.protection.outlook.com [40.107.102.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9824B10E7BB;
 Thu, 24 Feb 2022 21:51:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMmUsO7bCZbxCo8CRRM/YRPSKxmYR8P0ncwME/xlQFL5N5d7rrBRXiUq+/ZuZhYB6paahEQCI5zTkp/JHe4rDOxYtVJbWPXD0uyM/xQNvuaXaN2Q9PoSHlq1uwfcDyZwe3zqs2oVg9eiUjcfSf+hsxBtLAObSrTXu4eDt27z9yrUmteCewxwVObh1X5u9F1X1le0Jq6u55osvhogMkKchxNWnHMdqpMnGm/rPF1XIATD+b5rUjhpKN38yrL/VWjL8ksfhaIRSyJ6j/rUuJL2UzP+PfXQhTPCLPsL3deFqsO/tiy60n8N7drI8JOEfTo7+wwIcwUXAwtCVQxWZHfcMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CJsbT/uQNbCLg3zijkw2HtWNygmK8JRosfQfMJvjsA=;
 b=ivuTNLplPDcVEa4Lyrn4ass0JyK9Zrffu4XvEYz1Z6UmGWObFx0d2y4N+BHkR8kVA0On2xil9wj8Tbpy7XrU9E1WAPYwR423KR0rfe1ByNr9rIN5NLE2Zso6jRSDzKRAmRcbyxuIG/BiLdngowRV+rKaM9a+dR1G4ctZ/pvzYosmiEmU9fHnfhiKjwcPypWJUVcm6vPQc5OoCjC0eiuYLzLdmBKBccbPSRyBU53ZKGIHxG5aXJA9zjSLU9N8banuOawOvcOAGk+bvoMUUsHswIZoyRJCEhz8FqxhR1wY/IiIRyJ1MbtnzX7JavzQGvxRRecLT0zhYNildLdd/5s4Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CJsbT/uQNbCLg3zijkw2HtWNygmK8JRosfQfMJvjsA=;
 b=G26Gn7mfJ/I+isnqdNGVol8SKVgfCeAcZxrw1D48WNcQTseSwT+KBPHXM/YrbnnJ+/mBhgltwLsed7IxZHbykSJ8YPKj4nNlVxS/VLf9FgIt/568o3E4DL7tKHpDd0KcYbUPaPd/tYpZgrxt5zINHY/uO4uAbNbWyj29S/wrLD8=
Received: from MWHPR14CA0011.namprd14.prod.outlook.com (2603:10b6:300:ae::21)
 by MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 21:51:34 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ae:cafe::27) by MWHPR14CA0011.outlook.office365.com
 (2603:10b6:300:ae::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23 via Frontend
 Transport; Thu, 24 Feb 2022 21:51:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Thu, 24 Feb 2022 21:51:33 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 24 Feb
 2022 15:51:30 -0600
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
Subject: [PATCH v5 7/7] PCI: drop `pci_is_thunderbolt_attached`
Date: Thu, 24 Feb 2022 15:51:16 -0600
Message-ID: <20220224215116.7138-8-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 079d7da1-d718-4938-264f-08d9f7dfd2f3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4549:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4549091D4B6B4646D494F34BE23D9@MN2PR12MB4549.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P6QpaDSpMZFAOnDoPtUWZd1oycF4NHietCBce/ShOkUqctgycagiOeSz+eGOK59UcR5WPHJnfT47AMTbXGD1LAKCu4Tv+24NQ1Pbl7fyfeMZKkW+APHPe4sRqMnlXfC//+XX1MBq3DMBO1/k2OU9oBULfWPdhTcNNkMVwhremDRjmtOsPWX58p3WFWlRNWVMDxpjGXh5jruME4I/mDbjmzWBY7QUUyotyBnlatCwT5e8t8z7SVMjwiQKZiV4H+pYjtppcAHY4oRCSHz8EWp7Fiq1psrHzWpI1aTED6GupKUcVSCk1GC0qFv2uiSl77mXN77E6vkmr3FH7UQTCUcW9/yVD2mbEHA1RThTvR9K6W/oGA0gi/sN0snnYBEFL7Ob6WHO18gr5yqPdG77XwKDjZocZiZFT73z4Mi7iTkTAn8gLm6VsRHLiYlczXtLQpgI/WOh26XhIQYFegAmcsMqHs5M0CHl7UZTDQgy1ePARh84+IcglsUb9gjYflBvwFt0kxUFKFqdPjXtx0Y1kxIoEnn5YVMNh3KerwK+qH8dhKR6SVK7ml2WybQZZ3Smw7H7ar2PM7+iiO5O0T6YfOu0NkLPJmW5f9WC4pq8CnIlf+OWbA3/5bVJjWwwyVJGs80ZcZwhVA6dshz8TtnaroEgTGjK2CXEWKVCzJ6GjxnqfDXh283GoUe9tKLVCheALiNG/AGLbyotj1m+S/hB2Ld/8wGN8Qqf4SptxkrWRbqD0O0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70206006)(70586007)(316002)(47076005)(356005)(4326008)(8676002)(36756003)(110136005)(83380400001)(81166007)(54906003)(36860700001)(336012)(186003)(82310400004)(508600001)(8936002)(7416002)(16526019)(2616005)(426003)(26005)(1076003)(5660300002)(6666004)(7696005)(44832011)(40460700003)(86362001)(2906002)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 21:51:33.6835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 079d7da1-d718-4938-264f-08d9f7dfd2f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4549
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

