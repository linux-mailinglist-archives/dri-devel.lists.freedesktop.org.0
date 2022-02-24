Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DC34C382B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 22:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AF910E72A;
	Thu, 24 Feb 2022 21:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7142510E7AC;
 Thu, 24 Feb 2022 21:51:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OK4pNmLU8xlq3XpRRHVa83FoKbPLITsTve3kbBdjSBUQnW0Gq4x+/4wR6+3WxqL97dniMvleHikcc4w56eaGUYdKhEKZLvuc0pnFeXj61ae8vJ3kw2Zi6f3r0/vst7hb0hroNZWQDy1VBEUB9DQOSkaPaEy8gpQWV/SFAomdJavTpSi/l2wgZa6RhrqTE5PjQsyZADOLB953D7wPGZCopXKQE2UXResCJHIqiT8XoKqLGHP+ycEY1sHUN73V3Qw5R2fEl9euxWXDNQSiy8mO9Lz1t42gtURY1b+/d/beBoF7W9LzS0zyGHiqAO9TxI+TZv6+IjYKyzFpnN6BJZh9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neyootgBRunSQAJPnXb1dPCfoyhMOxPxpCnyWraQL7E=;
 b=ao3t+18q3Seaqi85VO2OCTQ82gyVgcHpKOWB5eBRnmvs/5/a0dZdczxNcm2x8a3WATBa8XklaGjleRoOnhl3/E6DBUIdC+fI8ZvTU71c7fkuvxbTv82mig+udE6mFSUvtNaZTzXayZzRTUt7pEFdnHl4jdunoBDXkWmJpVC0aOciJBFbDWfvv4NVpgg/nuLYL/oq5lHgoDG6P4Dodxc1PVDXa/X9f2PKxqVCd4DLrXl6zedtcHFP6M37ltMbKcCu71TPhirYObzjMc7EfdrD4psyPsSLZcvD7FIxpsPbGQNbZS3VOsShB7wsqWVL9Cqr9W2Tl21++7eaw3YQM1jioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neyootgBRunSQAJPnXb1dPCfoyhMOxPxpCnyWraQL7E=;
 b=u9WGQ1dZ6H8jO4/tvnMx5hmiuIbxbyZ4AblqGr/MZomAFWZToMw0KJ3/DHV/71SydavqY9QteVUOeHMjBbU7CSn6Jpt3wC0W3dMMyVwxjSP4CTmA0jV2k8NsY7FWbrgey+c0Ka8gbzmFSNuXneRJf65dpqo/7hULCJW8zOXoePI=
Received: from MWHPR14CA0010.namprd14.prod.outlook.com (2603:10b6:300:ae::20)
 by BYAPR12MB2806.namprd12.prod.outlook.com (2603:10b6:a03:70::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 21:51:33 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ae:cafe::16) by MWHPR14CA0010.outlook.office365.com
 (2603:10b6:300:ae::20) with Microsoft SMTP Server (version=TLS1_2,
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
 15.20.5017.22 via Frontend Transport; Thu, 24 Feb 2022 21:51:32 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 24 Feb
 2022 15:51:28 -0600
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
Subject: [PATCH v5 6/7] drm/radeon: drop the use of
 `pci_is_thunderbolt_attached`
Date: Thu, 24 Feb 2022 15:51:15 -0600
Message-ID: <20220224215116.7138-7-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: baeaf2d3-bb47-4151-548e-08d9f7dfd27e
X-MS-TrafficTypeDiagnostic: BYAPR12MB2806:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2806C72D064B0832911D27F3E23D9@BYAPR12MB2806.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ytElrkUYemFdosgRe9RAyd9IPlzZ3dHPoqWQZyuy2cr2qvcZNl4NvpYZzYFPAHn6wF5QZTbNcLei443UA1WLHyZSaYuXwrJ60ukIZRnm0qU52l2eliK1MhT/PqdhqgXC1R1nE9ZBLWb0UfGbNRgkacwlhGO8A4huZRp//IXrEz+/w3xp3/zHEfILBl9L++Xkq+18irNZslsFGHS/EkagpwelLpVtZw8XycTtDB25kAQy56BwSoKfyee/T38BHO90Ge7Vus2hc+0IqSnm5gpn9M89vcgBVgXflI6GNcW4bolNDJmyZa2nCR3Nm7EAJSemHyS6BAEZxvutLu8Dr3cGAoXm6lPyqs0T/5VAcaYYx/xrXnmrW7vucFa5Rgf971j27zGA5HCjV+sZayk5SUXGzaf7c8o2VAQjQDEo32rf37jjotiFX8VEKu3zIdJbb3FuSd0rpXsOoHaWlRUBu275k2fEkcn4zWiGhlADNi2g6vfn//5AfCNu5N4kdRyPUE5RaD7jyW7VLpqhK3eHIhC1FFNY135DblPSNeV/oHp0ldG0dxfTLEtqBViIxi6LsPbKQiraESGODYNrmYqQi18l8VjHnztzVupy9iP3/Br/kNZC7FWPOV9nf/HLkxieU8VzvhwlKv9RnGBYoqSh01eIrZvfYrFeO3bKfcEMWGPWGQmMI6oHmeoUqf8RFmJJMdx4Ivd1J9Qrdy0y/PWR5vO2idmD4fZ5+lWt5plXwiu60X8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(47076005)(316002)(426003)(1076003)(16526019)(186003)(336012)(82310400004)(36860700001)(508600001)(110136005)(2616005)(86362001)(70206006)(83380400001)(36756003)(44832011)(7416002)(4326008)(26005)(7696005)(8676002)(8936002)(5660300002)(2906002)(356005)(70586007)(54906003)(40460700003)(6666004)(81166007)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 21:51:32.9023 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baeaf2d3-bb47-4151-548e-08d9f7dfd27e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2806
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

