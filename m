Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5897EB77A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 21:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817F910E4D1;
	Tue, 14 Nov 2023 20:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10ACA10E4C6;
 Tue, 14 Nov 2023 20:08:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOmeHG25DQCRssDSGJg51q2kPpNQIWzUrOCQE+sajcgcuVYGv1WUbqjJI2CiDThGEB4WW9YzX71Y9cRFebExamiJ5p8/KYeaYLC6xyHjjZx1MrJbgqSLDvLSe5E2N/rvaCG+PyyK7f4/f3eDbXD3fF5oK/lboXc52aPCgR6KsPRzp8r7z+FwMXrbfOQ5PsjpEocQXeXr6ihHyFSwng8PJeN7/mtJsTeoDBW2O4QRN+43CidgleDqhc/0iassb1f6OC5dM5qJ6dZYeIIf6UF4/6DltiG9V5QfL7f8yVKVj7X7NzjrT0u9J0QMyWRuvwOoObGsyTEJmZWJaqQwuUGSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7SZF6f2ZWGFnYAXCTO9CVe3dsHy8Lp9Fi/fPR/IUHw=;
 b=m26G1PIw21Q6ql+fuqng0g8hMIm9TqSQAh9AyooXK14I8v5uFUhwSOnNt0WoqcSOl+oi/X8UEH6QloNNjqn7rPxNMUlsN2+kqFJGh7Io7DRB5qFL7Pfa00byTVEvvNwLg5DZ3s67lbi2+5DOY5+4me5+dtCioaum+ZLDT7lhg0NWxCgeD4UtEl3YFSEsgZiQc7dbAk/pXD1TzCHgGQWT2u4KhZhoS9iZiN7VOIbduLv4Z7+lb1BP1KVJ6vQJ0N5oOH+4/kkuP+aaHxe7XeoCZgCAVWny0LtIyGlk/X3kNa/KmS6gJdtZlU1/QlNvremFo1L1fLp/lSE+1JBpy5tIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7SZF6f2ZWGFnYAXCTO9CVe3dsHy8Lp9Fi/fPR/IUHw=;
 b=w7OKQXG/4JUEV4YHTYqzaKIsmLOoDof1tCgup4FUxh64K2n8IvpeXePuC2At+3/wJiE0PDok5iVuAe7l9jwqrnaQMuO2IqXULectPYssP6LgwJ2rryAZ2iSlSWcSQnnmJp7qjtcaXBCR8eYhfSNb8K/pT9HJZ6zjAOv8sFJTA3s=
Received: from BLAPR03CA0151.namprd03.prod.outlook.com (2603:10b6:208:32f::15)
 by DS7PR12MB5720.namprd12.prod.outlook.com (2603:10b6:8:73::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 20:08:37 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:32f:cafe::c2) by BLAPR03CA0151.outlook.office365.com
 (2603:10b6:208:32f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Tue, 14 Nov 2023 20:08:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Tue, 14 Nov 2023 20:08:37 +0000
Received: from test-TBI1100B.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 14 Nov
 2023 14:08:34 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Mika
 Westerberg" <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v3 6/7] PCI: Split up some logic in pcie_bandwidth_available()
 to separate function
Date: Tue, 14 Nov 2023 14:07:54 -0600
Message-ID: <20231114200755.14911-7-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231114200755.14911-1-mario.limonciello@amd.com>
References: <20231114200755.14911-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|DS7PR12MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: 17897260-4f72-446a-fd65-08dbe54d7d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HdIL6B+xxFbeG2i6btoJu2mwGxAav6nSk9t9VHeCYelwn0IODKr9Ff59Js4BaBOY88tL8nkrtJlBgOvsG6LdApVU4jlXCkcCLQOUdoWkDOG1LnvMGWX2/XtgYMtotvMieAiEKVrO6bofQ4tpAVVIw0vtFnC80DG4P/+4+rF8/jV3iKNla3yxtOEOikzTpa4ukx2kiMG1qRSbKlUTqTCD4xBrUtEQ4yaB1FnYcxYtfcnBcpnktgtyC584O4oB/KrqAQdRUGMefZf4jD3otLOOYNEIjLWN5oOyhPLaJXo6GAeWsX8pivVZwZCtzJwH30+dbRbyoik38Frspu9GJnDR01VIC73WJHYxlnyvYbARgd2bp/nET/Xg/oIY3jJqnYM8/Y+00GPa+KgRDenMyyOTR5CDWehLlhlHskDWIRD6hQDXh6Jaeb47Xj59X5+wmfCaO0801/xurYkP3I6uOWgWiurQnH/kFD5S8av2Y/RHmu/J48vWTB0mcpFryD+dArhZUFYCTSHyfMelVjvPdiEe6RBSAMXucZDPd+YSd00aqBO2NpOR8aDop5IYlfdG8yG0bRLC0bRmLbvTGHUBQsWB2hQHrkBpzVyGf7OdEicrphEWNgUZzyINTGhISwaVn/OuK4AP5fWZByyOEHX78J+Ett1CRKPyxn/T1EkGQuABLvQHUaGSYJswS7rN45NrhXIm8Pt5zq+QcO8BGs2fcxxU2RR25gmzmN74OBQSBohEeDRhMUnvGOgipfa6qPR32hzDoBFfItfZJOPityWVicSNJg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(82310400011)(64100799003)(186009)(451199024)(36840700001)(40470700004)(46966006)(40480700001)(426003)(40460700003)(316002)(70586007)(110136005)(70206006)(54906003)(81166007)(26005)(356005)(82740400003)(86362001)(36756003)(83380400001)(336012)(1076003)(6666004)(16526019)(2616005)(36860700001)(478600001)(2906002)(7696005)(47076005)(5660300002)(44832011)(41300700001)(4326008)(8676002)(7416002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 20:08:37.7140 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17897260-4f72-446a-fd65-08dbe54d7d33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5720
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
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 "open list:RADEON and AMDGPU DRM
 DRIVERS" <amd-gfx@lists.freedesktop.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, open
 list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVER FOR
 NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 Mario Limonciello <mario.limonciello@amd.com>, "open list:DRM
 DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Maciej
 W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The logic to calculate bandwidth limits may be used at multiple call sites
so split it up into its own static function instead.

No intended functional changes.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2->v3:
 * Split from previous patch version
---
 drivers/pci/pci.c | 60 +++++++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 55bc3576a985..0ff7883cc774 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6224,6 +6224,38 @@ int pcie_set_mps(struct pci_dev *dev, int mps)
 }
 EXPORT_SYMBOL(pcie_set_mps);
 
+static u32 pcie_calc_bw_limits(struct pci_dev *dev, u32 bw,
+			       struct pci_dev **limiting_dev,
+			       enum pci_bus_speed *speed,
+			       enum pcie_link_width *width)
+{
+	enum pcie_link_width next_width;
+	enum pci_bus_speed next_speed;
+	u32 next_bw;
+	u16 lnksta;
+
+	pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
+
+	next_speed = pcie_link_speed[FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta)];
+	next_width = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
+
+	next_bw = next_width * PCIE_SPEED2MBS_ENC(next_speed);
+
+	/* Check if current device limits the total bandwidth */
+	if (!bw || next_bw <= bw) {
+		bw = next_bw;
+
+		if (limiting_dev)
+			*limiting_dev = dev;
+		if (speed)
+			*speed = next_speed;
+		if (width)
+			*width = next_width;
+	}
+
+	return bw;
+}
+
 /**
  * pcie_bandwidth_available - determine minimum link settings of a PCIe
  *			      device and its bandwidth limitation
@@ -6242,39 +6274,15 @@ u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev **limiting_dev,
 			     enum pci_bus_speed *speed,
 			     enum pcie_link_width *width)
 {
-	u16 lnksta;
-	enum pci_bus_speed next_speed;
-	enum pcie_link_width next_width;
-	u32 bw, next_bw;
+	u32 bw = 0;
 
 	if (speed)
 		*speed = PCI_SPEED_UNKNOWN;
 	if (width)
 		*width = PCIE_LNK_WIDTH_UNKNOWN;
 
-	bw = 0;
-
 	while (dev) {
-		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
-
-		next_speed = pcie_link_speed[FIELD_GET(PCI_EXP_LNKSTA_CLS,
-						       lnksta)];
-		next_width = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
-
-		next_bw = next_width * PCIE_SPEED2MBS_ENC(next_speed);
-
-		/* Check if current device limits the total bandwidth */
-		if (!bw || next_bw <= bw) {
-			bw = next_bw;
-
-			if (limiting_dev)
-				*limiting_dev = dev;
-			if (speed)
-				*speed = next_speed;
-			if (width)
-				*width = next_width;
-		}
-
+		bw = pcie_calc_bw_limits(dev, bw, limiting_dev, speed, width);
 		dev = pci_upstream_bridge(dev);
 	}
 
-- 
2.34.1

