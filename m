Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D484B2DAA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A5B10EB06;
	Fri, 11 Feb 2022 19:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C7B10EB1A;
 Fri, 11 Feb 2022 19:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3Nm+pLvLM7JUoVINRHw1flHUqWGokCESOKSexwyPsMYRMcC3agWNj58OWMCymuOLrNv5Dvyuk8RgVshdo5/JXp6S04fItMQ+ZYnC6UIMuW2PE5MobvwpdXwXAmPxzCLHrynkvlBFQVAAjDD5A6Td0cYdbEUggUn7YRJzK25iL+uQYIoUS80eKcqsxZeUyH+AdKFeisRz2zSp9ugkV5pBpG2VU9wvxvS/8wFkUR0qEihzsqz7sLAc+uRY0UlPA3vknd818IQDLaTxjukgm0j4N0PlaA2H+2qV1grqhF9Pem+zZzd1wmxQeLBimPJo+EmqaF9AL/bzGQIjIZVob+UEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oUyybnOX7Vt79s+4l5CYxIr3J/OX8sZXo1FzadUCHY=;
 b=SPqZpkLfIvU22luMGXk2z63CtK4wKO7Q6yyg2l1sG9DC3B36UYX08wyNOrlidx67QmbRT/6bZsYgW58ITZNjYCt9F3pPGV3OPQP08P6VECRHuoc/74FweI9L7ha7hsTRCX1AsoAdXhCbI+BAE9i6HM+Q80Ce8TTLEeOtpoMohCAvH7U96cgWNJmdHsNPOk1pm3z/xoMjQ4Fp/HxnoJU+TVFpZy/d2fWfHJ700S7cral3IvNZbRV8Hj2rcBDWk6KIr+VpzpiRd8FcPqGgEy7/ibED/dReZHURw2u3735lFExImj3ss0MjbNWYXrxuY4IPXdieerIL06efV1ceK66giw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oUyybnOX7Vt79s+4l5CYxIr3J/OX8sZXo1FzadUCHY=;
 b=lWLvs9/jHetJrdb6YsK4Pp/Y6kJhYIQ7Zv/yuP4utCLPKU/80aUZ6i3uzLu8hv5qdZQJjUd5ELtE22eI2wugfGXcYXwXotrtaYz0uoYlhDFTOgGAUt7TV8duP9fjOaqWSXgCD456por2Bswgxbgofl/C7BFYKnfOoYotmiSw6MM=
Received: from DM6PR08CA0054.namprd08.prod.outlook.com (2603:10b6:5:1e0::28)
 by BYAPR12MB3430.namprd12.prod.outlook.com (2603:10b6:a03:ad::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Fri, 11 Feb
 2022 19:35:12 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::b7) by DM6PR08CA0054.outlook.office365.com
 (2603:10b6:5:1e0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Fri, 11 Feb 2022 19:35:12 +0000
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
Subject: [PATCH v3 09/12] drm/nouveau: drop the use of
 `pci_is_thunderbolt_attached`
Date: Fri, 11 Feb 2022 13:32:47 -0600
Message-ID: <20220211193250.1904843-10-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6e2c9e7d-25f3-47b7-a7da-08d9ed959ef9
X-MS-TrafficTypeDiagnostic: BYAPR12MB3430:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB343051F4CD66835E773AD826E2309@BYAPR12MB3430.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oks8c4dnDTzc29kdlxj/DU4krUsj/MEuXBnocG25yvjdVnaUWiJeIwL89JcdQJhM/WXG8baiZ7UfgIhwGi+R2ph8mz5XYd9XhVhTOEchI9n5uKPA3Bv/c7xHRjddcz16jjua81iyDFHc8AbPB11Fx5l8gAIhv7N1+wNWuLc6PS12zBA9OPV74dcaPKp+ZQUYCDGGeOf+zdmuJluVdR3YAnxT6F78qhxCWvZbXGYFE2Za03zP7+qFMAJsTKzFoKNHBD6tI7nK5TzRGEWGhgmn3EUsT0kSkCTcPaPX8pbJoltYEkzCx6mswJ/eakaQMXqCaTNC6XuwfnIf9RJMODmOAKZ3hxdlyCBRq8VLs28n+2olowNJY2u/rTlH3O15XkapoKKRLJNBhQt6cZH5apzGqEUYj2hA1iFReKpt1NXktI+R9Qghrg8knDGPJ+6rW8+IxW0PQMQtNKIvke3NAvIasf7C1ceFmuRmXEVnlkwKODPKC3JQy6l+HoEn9q4M5XbifOV7Z0GxRVR+lF6/f2AcI1CuW6GhF4TSSHEYzfHrr96jLWjcdWTRXg1WLRDwTbjNk/WmmbJAqe1NXoxSyRUUzZ98XOHL4iVnsuHR/mqisUvEw2tli19CtwicSl3LN8uyWkRXfzJacka6Vqyq63Ihn2yOOxdmYC66W8ejNNGy8l1bVSV+FUIWc3J+fWgzUnm/cQ7O+AL9dE6rfFV1tffgOB3HCTTlehrqLItfi+chIo8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8676002)(70206006)(70586007)(86362001)(356005)(4326008)(8936002)(316002)(508600001)(110136005)(54906003)(81166007)(82310400004)(6666004)(16526019)(47076005)(7416002)(36756003)(186003)(44832011)(26005)(40460700003)(2906002)(5660300002)(426003)(1076003)(336012)(2616005)(36860700001)(83380400001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 19:35:12.1769 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2c9e7d-25f3-47b7-a7da-08d9ed959ef9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3430
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
 drivers/gpu/drm/nouveau/nouveau_vga.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index 60cd8c0463df..2c8008cb38e0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -97,7 +97,7 @@ nouveau_vga_init(struct nouveau_drm *drm)
 	vga_client_register(pdev, nouveau_vga_set_decode);
 
 	/* don't register Thunderbolt eGPU with vga_switcheroo */
-	if (pci_is_thunderbolt_attached(pdev))
+	if (dev_is_removable(&pdev->dev))
 		return;
 
 	vga_switcheroo_register_client(pdev, &nouveau_switcheroo_ops, runtime);
@@ -120,7 +120,7 @@ nouveau_vga_fini(struct nouveau_drm *drm)
 
 	vga_client_unregister(pdev);
 
-	if (pci_is_thunderbolt_attached(pdev))
+	if (dev_is_removable(&pdev->dev))
 		return;
 
 	vga_switcheroo_unregister_client(pdev);
-- 
2.34.1

