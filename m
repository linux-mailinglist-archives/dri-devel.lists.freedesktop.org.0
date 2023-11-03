Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0161E7E0918
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 20:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C05F10EA66;
	Fri,  3 Nov 2023 19:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2053.outbound.protection.outlook.com [40.107.102.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F9A10EA62;
 Fri,  3 Nov 2023 19:08:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiNYU4RDWKrPAtCS0Qt7fenw4bxcBZXVlVfiDgelIxicWCVFa99hi2vAuji27wS/ycM7bBpa8y64fNZeBY29DPzuQ1t50cH7HsH05S68t36BYJWqXVlDZlyhEfkgPrXusdrYPlmjM8WM2mA8NDsAhuSthW2SyZnmQtzhfy1bekincHcEDAogcpmRmi4rN2Dan9GRdD19IYos5DHJYN7gUlQpOjIGiyceDIfoygq/NZAPTap/5qDpTX/dLSZtQ4zJ1b7e5fnV9RAKPAx67YguZgBhPxQTSlLydYLjSPkJwh0u2Eke/jTfhtEC8p6g/NCS8wFsnt9+i0LiOL+OJMWjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QxfD7oh6ox+7Amyrc3ZFd0iJqVv9LA5Zs0XIevzsAg=;
 b=Zx5kC+jn6AWXq2Os8gwlp769MpmL6x8pWX5qCPClSFwNK5tr+c1/cgeYNWK7xBpHkZDJjd4kDU4zRUptVicwmfaOQZ92rf8WtPaW3trepNf7hWkPoJRSBnqu0P+NcUfgedoopLtzNOntB0OzG5c9BT5/toa1gvAzO1x4fsU5WzF4M81s6LBQRyYBmIXkLcfzGBKkChTINac7zrb8MH1fWZkp/O+STXIpaGpSfkhOUNsir874KSeLRxiN9PPLx1rQKE/29acFL0V+IiXPiHKPdh724lsOHjaynOs/tEw+/7AyzP8YX9BtUn1uhAJwackGiqV6sqKRBaS96Y6Xk17PPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QxfD7oh6ox+7Amyrc3ZFd0iJqVv9LA5Zs0XIevzsAg=;
 b=0iN1KVj/t3QuoRrKw2CCTFCV7FljD0nGB9Vv3SZ+3EqejzxC6rYgn6rpklOwY9b/x8nbUgpoHZzzAH7/aujfSvaTDilPrzsc2uiBU8dTKbSBZBs0XrcUUuNovEPwVFPU/yY+Ov+cejymhRJ+qQcss4n49TTBUu84sv365HsB7eU=
Received: from MW2PR16CA0020.namprd16.prod.outlook.com (2603:10b6:907::33) by
 SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 19:08:29 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:907:0:cafe::34) by MW2PR16CA0020.outlook.office365.com
 (2603:10b6:907::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21 via Frontend
 Transport; Fri, 3 Nov 2023 19:08:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 19:08:29 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 14:08:26 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Hans de
 Goede" <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v2 3/9] PCI: Drop pci_is_thunderbolt_attached()
Date: Fri, 3 Nov 2023 14:07:52 -0500
Message-ID: <20231103190758.82911-4-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|SJ2PR12MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 381c9bbe-a4b6-41b2-e91a-08dbdca043d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YTO4PkpAoAzUmyOE/f4DOQivcWPynYx50nzeb3k3ET1j1iutrDu712eKSofEn+nP06W7hq1LaFuu3m/Zi5vGm1+hsPr0EFeM0aH9Ef6V5bMvAqBhchZVIMsSMSVMx4IxdK3/+FZ4iCh0VtoIV2cS6wE8H99hPe2fWfKphi6Le/H49lPyWuKuhU7RS9R9FdL37m0+7g8jvE0jupfQuIQjscCJgGpmdofvUPhWT3rNANQQYg9SfwteTHJXXrgKn7TAOMF6wa9or6/0q4/rkJrihkpCHF/h29VQt+SXHzsLZuOd31ugjoe5fkU7Bj5QL7mG991WxNKpsq4usPRDWUaxhAOKcd9gI2Igf5EGBk9+/pJ+zn8PeTaGDcLu0Pe51GKB+7fB4y+RocSoZwEc/m3/IgRkCz5ug4jndU40RGsmElD8vRqaU21X2sshzj2rH4Kpd2/e5ldBfacKlHbDcNmGY90iuLvhzPUaKi88fxldjBreZBcqxuV+NX1B4rzRaGMOQCsxRkcJXdThtnqUrJq7ls5WnEROyWOFCdtFMgj8a5KwDQnba+0zPWqHOWT+zQTm++csrm3G+Q9305FK2HS8+3n5yRYWpNydvRResNFZrQTyKPoAC3kvWEfWsBUcZ+kOv/OkOsMXP26eSh70XSrplxV5LnJsP010CiYSlBhDO75BGXUzt9WJNDUMxyy6okjBeKV4cGr7ghrpo19g0QhVaY33HRkndyHiu5JllCpZ1TyrMKXKXxgSywlDN380uk7Bu1WEgoF3+0A8YmsC5PAjUg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(82310400011)(186009)(1800799009)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(36756003)(26005)(40460700003)(40480700001)(16526019)(2616005)(86362001)(82740400003)(81166007)(356005)(426003)(2906002)(83380400001)(7416002)(478600001)(1076003)(7696005)(6666004)(36860700001)(336012)(8936002)(5660300002)(4326008)(47076005)(8676002)(316002)(54906003)(110136005)(44832011)(70586007)(41300700001)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 19:08:29.2727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 381c9bbe-a4b6-41b2-e91a-08dbdca043d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062
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

All callers have switched to dev_is_removable() for detecting
hotpluggable PCIe devices.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 include/linux/pci.h | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index b56417276042..530b0a360514 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2616,28 +2616,6 @@ static inline bool pci_ari_enabled(struct pci_bus *bus)
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

