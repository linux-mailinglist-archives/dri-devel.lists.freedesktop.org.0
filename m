Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCC84B2DA8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E17410EB21;
	Fri, 11 Feb 2022 19:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E3F10EB07;
 Fri, 11 Feb 2022 19:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnSCG2T3OHVct8KbuHPzVzCtjROjY4XSzjs94Y1D6pFxxwgsvrJjbb/Z3FPdl6C9AoegJO26xml+2KE6w+2uMlA/o2Cg2Sqz+JDQx5yZDEAf6ZgHigpsfyjt6Z9YzHdb0ye9G8F3L4Tlk2xwSJ5HG3y7aCqK0eN22N/o0Cb5CAAG7GEDPr9wt5JsnkbO3lhlxM63AxMt25HVSdCL4h4a5aJW9N2kmEzKa7rNuekZ93ouK7r3lddkF2xCGO2zN/cRwLaarVprvcmFDDoDn+2wJ6M+oV0E5+ANf3RudpwoNjHShdLdjZtCLQYBkdVlC8OeBNq7OK5ic5i1LY04IDhrsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neyootgBRunSQAJPnXb1dPCfoyhMOxPxpCnyWraQL7E=;
 b=hT2EaqHv2hUqBa0+cfUScQ/pwOFqpJ0LBVSUtu1oRIjY7BqHai57psMdxE0gvTb0IMSl7cPXPdXb9ppJCmMKhddY4egbKmqD8JCNLJjv9RSFEJOw8zcR83afjSlz0IOHy/wvEE0tKa64SlPXfCeFXwrHUYHbKbe/6ZmnX3MIZO4PtyGUShr+4ru2KgdJZZQmk5CSned5VNbCV2xn8nz94SpCbsrCDrrD3Wo5o9Bz/s2RWR8W+kgFH49ZIFT3vqbwOCXRk33V+9rirB6V1ramPq877F1JBHajbHRcmzw1hKfOvbjYSz/CnkgwAWBWuHlJiYrsMOpg0Ebs+guPKRqufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neyootgBRunSQAJPnXb1dPCfoyhMOxPxpCnyWraQL7E=;
 b=ZOYR2zRmfdr6d2S1Td0UvbH67Vig/Tmj0WJORF3zyI3v8Tf1hFTzhoGPwqrZjY9iNPDuymACGJ0sjQuLfonL8cplPvC6wmRxXedbLTxAfH8XC2T0XXykNPU86A24Va10wiaHS1mmqEm8GDF730XQ3Vb+LcSfFpFJUVU95faOLjI=
Received: from DM6PR08CA0042.namprd08.prod.outlook.com (2603:10b6:5:1e0::16)
 by PH7PR12MB5999.namprd12.prod.outlook.com (2603:10b6:510:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Fri, 11 Feb
 2022 19:35:13 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::9b) by DM6PR08CA0042.outlook.office365.com
 (2603:10b6:5:1e0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.13 via Frontend
 Transport; Fri, 11 Feb 2022 19:35:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 19:35:12 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Feb
 2022 13:35:11 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 10/12] drm/radeon: drop the use of
 `pci_is_thunderbolt_attached`
Date: Fri, 11 Feb 2022 13:32:48 -0600
Message-ID: <20220211193250.1904843-11-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2ff62401-94b5-4128-9ff2-08d9ed959f75
X-MS-TrafficTypeDiagnostic: PH7PR12MB5999:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB599909918673977068D0F71FE2309@PH7PR12MB5999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c2nXe3SBRvAlKvPWpIsRM5CIKNd5JtqPxcLSuW7b/iPx58l5R8260YJc4JXkyVlUq2PGZjomcVIHSA5Y8rLpLaHV35U7VdF/P+xv8oocTSYgjsdwlazqi0SxV2UjVwbG1MM2RWkA/4m4ITAk7SgTdfu0DnqAp9v1dpbU9Ws7BGt7smTqUgrODnZJh/Kq36bPrLjiwcc7GgXvgjekVyc0Wz8DCeh/S3z8MreDcvk991e5QxY1adZyz22jUMbjOpuwbOD6Kbo5gkTGxW2bn9BQl7+B/ZYt+ZtbvLu42nkH4BKY0pIori0OHSiY/fu9BTbIEehjT9wmEWEKrd83dfsZM0MCelG0QVcIpOrKqNfQGZo0CMm3rmzxWgddVvs3gw9qHCVt+0skxraDb+Ri58BvUWtcknS5jMCNx/rOTwdLhBlQRha6qf6J8Ap7VeB+F1auv6XdPu9ACuKdSKRXvQcUnqOV5TuE6Xnqa2U3KFUbIQgvlUE1CdEkjlhTsSgIkjlJ8rlnUpSanRzYB+gKNrYGo3UaH6Sif1D0YVGxWjhgGFpf7QbUIiCPt6rLaoYm1HgpZENyDhJtIcTXcl0FmmCTlMWkjAuOS37LYVHN8W/zEHOYl6C2+UR2Zx57FWFZb4lLpChmqPngds7XtRKDlARCyBH468MOPjUOFFA4SDq2tipareTcSnfoc05h4rTxxae5+gCt7Ah4MFnxiE+H7L1R0Z69OxOYcQQTXEfuphw4/oE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(110136005)(36756003)(508600001)(54906003)(316002)(6666004)(40460700003)(4326008)(47076005)(1076003)(2616005)(7416002)(70206006)(8936002)(82310400004)(16526019)(26005)(186003)(356005)(2906002)(5660300002)(36860700001)(8676002)(336012)(70586007)(83380400001)(426003)(86362001)(44832011)(81166007)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 19:35:12.9738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff62401-94b5-4128-9ff2-08d9ed959f75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5999
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

The PCI core now marks such devices as removable and downstream drivers
can use this instead.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/radeon/radeon_device.c | 4 ++--
 drivers/gpu/drm/radeon/radeon_kms.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 4f0fbf667431..5117fce23b3f 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1439,7 +1439,7 @@ int radeon_device_init(struct radeon_device *rdev,
 
 	if (rdev->flags & RADEON_IS_PX)
 		runtime = true;
-	if (!pci_is_thunderbolt_attached(rdev->pdev))
+	if (!dev_is_removable(&rdev->pdev->dev))
 		vga_switcheroo_register_client(rdev->pdev,
 					       &radeon_switcheroo_ops, runtime);
 	if (runtime)
@@ -1527,7 +1527,7 @@ void radeon_device_fini(struct radeon_device *rdev)
 	/* evict vram memory */
 	radeon_bo_evict_vram(rdev);
 	radeon_fini(rdev);
-	if (!pci_is_thunderbolt_attached(rdev->pdev))
+	if (!dev_is_removable(&rdev->pdev->dev))
 		vga_switcheroo_unregister_client(rdev->pdev);
 	if (rdev->flags & RADEON_IS_PX)
 		vga_switcheroo_fini_domain_pm_ops(rdev->dev);
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 11ad210919c8..e01ee7a5cf5d 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -139,7 +139,7 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	if ((radeon_runtime_pm != 0) &&
 	    radeon_has_atpx() &&
 	    ((flags & RADEON_IS_IGP) == 0) &&
-	    !pci_is_thunderbolt_attached(pdev))
+	    !dev_is_removable(&pdev->dev))
 		flags |= RADEON_IS_PX;
 
 	/* radeon_device_init should report only fatal error
-- 
2.34.1

