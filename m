Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B37C4B2DA9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52E010EB22;
	Fri, 11 Feb 2022 19:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E0310EB17;
 Fri, 11 Feb 2022 19:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrdGlFlTd59C8EeF4xZuPj8io65+qvWprhfcs2BcN9AyecTtQQDlXaoAqTa7NjnkcpOPBuhdIviq5XjTUqKzc/fLPyTt7tDHV4Ak0eMCssC6arkjZU1hyRgKYGBe3o6NzzPFhQjfqXW+2UOZKVzLSJ0tbdk3g1/L0Dwmn/ThtsM9LzZqBWeA0bnECmXXRppP5oUS//tlBF5ew/JSG9O3GKF38vd3CBPs+dQ0StVhZORhCnrTiN0KBDY6oBZViEBHjyYouecc/4OrhvMPqa7jnfUqPz46JlfOjtHtXX2AWm5ugZdX5q+96fep75Xy5fwj/DGUeYNiTlqZX+nUZBKSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CJsbT/uQNbCLg3zijkw2HtWNygmK8JRosfQfMJvjsA=;
 b=H/8HNQpHDoLF6bacvGSi1N8AxbbfaA9o0r2Sx+eYlr/Fd/yAjH1cW/GucVz1JNCWssmA17ZvA2+6Ks6hd5dfyQhoI3xeYCVN6rJZxjEe3n+UOY/Qi2kfWFnbpkIaRT+JGeaAuoWk+T0keFCoIyIietbYsk0QsJ6occa2+60UTZfZWSuKnzhcenJ2/r7EnzBPohJSXoLs9zlY//v2zJrxZd2kVEMh5SsKTJzfgclSTAt673WyBBll4OqZvQ8XN/Agk0zbOLAuCo0LW32tU5KlCDIzoF5i/re6xyEVBYmbxr6+Vf69sLn0Zn4U5izzwne+hH+/+eYF/Ts/Ij1bfo/cww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CJsbT/uQNbCLg3zijkw2HtWNygmK8JRosfQfMJvjsA=;
 b=PrK0qRrAMbou2WlvABH73rvLcr7OcwkcF7z/xS4jE+5f1jVXdpFwQxq4gGylAcA9jXd0sicOGrStOEcKMMNo1likRhq32uZ4AnkYrkGG0YnDiAC1o5rH7LFBvPijY6i2JR/IPCOrf1VIz7/le5RdhcnyVjBdWt0t76NTmmEtOi0=
Received: from DM6PR08CA0040.namprd08.prod.outlook.com (2603:10b6:5:1e0::14)
 by DM6PR12MB4577.namprd12.prod.outlook.com (2603:10b6:5:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 19:35:14 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::4c) by DM6PR08CA0040.outlook.office365.com
 (2603:10b6:5:1e0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12 via Frontend
 Transport; Fri, 11 Feb 2022 19:35:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 19:35:14 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Feb
 2022 13:35:12 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 12/12] PCI: drop `pci_is_thunderbolt_attached`
Date: Fri, 11 Feb 2022 13:32:50 -0600
Message-ID: <20220211193250.1904843-13-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2cf0a8b6-2408-485d-e1f2-08d9ed95a03d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4577:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4577E6259CBA7849EAEB2BFBE2309@DM6PR12MB4577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3O+zenQpDQG4JKvuq9k2YnSKgyS2LJ57D5Gm2oIyyfIIt+vO/poQZGm4YJwjtWwmLr+m8CvcWdDI/B93SDZR7tDpyHeC29qmY6bhq+Sz3K24ZVfRJDq/9O6KoARDSflcB4cTC0oQno7dEUqmxyVm/BiSaeLSIrATz7Qw8AbTp1BptMWCRWVYUADQeTrGiJl0aKpC3CX6OmP6AkrPRdiZvvdP5mE1HjRnCAARBeNFpwLeb5j6l0FlKPnSL2dJTcLoU9J4e5ZxL0iQVIr7M31e4NfAW5wR5Kr6uv4s74Bqeoin54EQVo16mcjt/Rwi1I+gIdWpA0h1Bzik3aLwsmQGgATDfoeameJZm2xwq9ZeIxqQZJX6nS9DLl3KjPNPDshVy+fdp5WRHzYAg/xHQ6bgqhfhR/AcE7DGt3jcp9ZUeWrgXXrMAgjvsyPOYHsldU2yze82F6rpsVtjOVHIdxl0q9msck9blBhtlwwsQyTmn6trkDwIIDzLwiTcZ5/ijVMdJww3LvHVbllIH/3QmMt8t1ajHN+L2wzU6X1jWJeomcWZ9QwEZqM6kqvqzpCOZlabSS8SL8qcvvkQbg7fMbZFs8SVxY3yv7OD4JCn/KC6o0ELR226EwiZuKAsu610thBALM3flrbK4PKEEAU02p8Yl7jptXOGnq17B9dmTOrPT08lzxR10KpI/+7E3SDzzqRFbMPC/wfJ/Do/yRDxJFKKxBm7p+9XUcwL8inE0E4pSmU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(4326008)(36756003)(86362001)(26005)(8676002)(8936002)(336012)(356005)(36860700001)(426003)(70206006)(83380400001)(82310400004)(186003)(70586007)(81166007)(508600001)(16526019)(54906003)(40460700003)(316002)(2906002)(2616005)(47076005)(110136005)(6666004)(5660300002)(7416002)(44832011)(1076003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 19:35:14.2862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf0a8b6-2408-485d-e1f2-08d9ed95a03d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4577
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

