Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2597EB76C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 21:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E66610E4C5;
	Tue, 14 Nov 2023 20:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC52510E4BB;
 Tue, 14 Nov 2023 20:08:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFiNJDaxhihZZ0J3OVKDNCn+v7229ymYz+B5tRaFAgo8DPepELX0r3s72ruYmflPK+Q/L5Vaou08jlr3mwc1rYpIIqrEFt8PqW5+j1E+Mnm+r2lldTIHbVwPRw3tInIbi4UWPK3Emn/7iZJ00+WgGw3TU1EnUkEun0udUiFG2bxphOTLeIJL1xDSs47UJkZYfcCkwKdOsx3nO0WKrl31JatkcN1iz0yr0BGwTIkLPMiwVtDdkHK+DIBBS2XXtkIHoYyLBhnO19VRnupgPVO1B9moUor0gcTk8+tDV7vsLCRo/QzJV6jETRw+fUFgbEPEto2dNgMv7k6RD+86rDCWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f50tXfm82fTpPzfjPb9J2spMNyZ25b8PuZgayxsLEHM=;
 b=lPnc6bE6iEtDi/+uoOHKGAHeDhn4MEIKq5cUVXXuWTrvB3Lem22upl82a2EbAO+WluyFYAE/szkbLvQ3cBvhwsXOgDmp/CNJcyYfcQLVByUrhWhrj4S26FMReu6sRJDyGSZkNN6h0lpOJxDpm7ajQjGAAhVxnJsQWV2gb01/yO4p9Q7VTln1ec//Df2WZxhaKixtPqw/9fvtitYbzTwrNqo01MgXjVm+bItBYxpo+/N7/gVodbH1eeteX2rOl+Yr81wxnK7VNjMGNQkO9kCqxGR5KbkzNWsq2d2yIiMNkTqI9CNUJKYXLYzZ6zmPYLEzbzJ55w10nyG9aHPRdLEAnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f50tXfm82fTpPzfjPb9J2spMNyZ25b8PuZgayxsLEHM=;
 b=SjKciasSRoEjdJIbwKSNTE66Pn3wn1RZypXFIuIQZlrqrt27e6FLCDTPSbOS4TnmYbshoK6EIYeruv/EYwwi1/GEZP/oNv7M/HyAdpDs05ND8VWRzWnBq/z0nC4xUhT6OCb+S5vufxicobhZ+Vr4JFKiocf1cMVMRufVlc/r3zQ=
Received: from BL1PR13CA0297.namprd13.prod.outlook.com (2603:10b6:208:2bc::32)
 by CH3PR12MB7500.namprd12.prod.outlook.com (2603:10b6:610:148::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 20:08:33 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:2bc:cafe::9c) by BL1PR13CA0297.outlook.office365.com
 (2603:10b6:208:2bc::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15 via Frontend
 Transport; Tue, 14 Nov 2023 20:08:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Tue, 14 Nov 2023 20:08:32 +0000
Received: from test-TBI1100B.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 14 Nov
 2023 14:08:31 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Mika
 Westerberg" <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v3 3/7] PCI: Drop pci_is_thunderbolt_attached()
Date: Tue, 14 Nov 2023 14:07:51 -0600
Message-ID: <20231114200755.14911-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231114200755.14911-1-mario.limonciello@amd.com>
References: <20231114200755.14911-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|CH3PR12MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a77f9e-31d9-48a8-0aa5-08dbe54d7a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tu7+F0Yvlw0N9L4DixpqpXKchLCVSPgMRwghjqRk4ClKDjUPTtnHk00MCFqPhK4ANSgh/OrIdvb91sSc8BKJCgI/AjgZp3MRy7qCRTDL75F0/ttTH79OTINnUHvCf1gy/zKeEemb5/fyGbQo0+nrbtmDvZe9jXQuYnytq3WtPbwsh1ZT7GniggdSlwvWmG6Am1SR81ll+yWIvD9IHEHDuUqIcuS2IDVc7tD2vf41ew6VcaF5g8WTlugxvdgq77AhUqcv0ssBSi95r2tqEBdiMzzjFbGNY5LOva0ehQdPJoGblT/wyuIXWr5JEwzDSqiCAU4Nua4yaCvKAjFIxex13463RnQ4SeIyOjHHTsFJMT7S67oB7Z2y061p682lcH5E/xxlnw1+hTYJC0anw/4uBeXX3sZ8RJ9KRHpVXNIj9pTM+8+39uMdjdSsfNh8xyiOyf5V2QX9B+osDAlvfZacWtpPKeEEYNkkrZ5ntqfZp+BJjDRvb/cVzdS3ocaGaP8hexm76lGsKvss/robWNwg9Tz5ZIjADqtVxGB4JNftKbL0teuIuBf3p9NPOiuWf1bwWOl5AxsnW2NDb35I9y9XK7lLyGqaVIScan73MhvzFBfaZreYLfW/B+lJJKicAlenx4a52nr2AalQzRo49F7z6dbExTqg4YzEg09DlOvEwvNdnHcpEVrjDJKHFqIkgzcEj8V28RmMGhbNpWe0WQHCkWTUS7ggYIEv5A6ANNQQkNmby2ET+OnO8NxI+8ZgQBQ5/Ddoj1qI5LMXGO/CY7L3NQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(82310400011)(64100799003)(1800799009)(451199024)(186009)(46966006)(40470700004)(36840700001)(8676002)(8936002)(40480700001)(41300700001)(40460700003)(5660300002)(7416002)(2906002)(83380400001)(426003)(44832011)(316002)(4326008)(36860700001)(54906003)(36756003)(70206006)(86362001)(47076005)(7696005)(6666004)(336012)(70586007)(81166007)(1076003)(356005)(110136005)(2616005)(82740400003)(16526019)(26005)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 20:08:32.8172 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a77f9e-31d9-48a8-0aa5-08dbe54d7a44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7500
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

All callers have switched to dev_is_removable() for detecting
hotpluggable PCIe devices.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2->v3:
 * No changes
---
 include/linux/pci.h | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 60ca768bc867..1fbca2bd92e8 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2645,28 +2645,6 @@ static inline bool pci_ari_enabled(struct pci_bus *bus)
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
-	if (pdev->is_thunderbolt)
-		return true;
-
-	while ((parent = pci_upstream_bridge(parent)))
-		if (parent->is_thunderbolt)
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

