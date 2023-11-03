Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9998B7E0910
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 20:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4C510EA60;
	Fri,  3 Nov 2023 19:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD3B10EA5B;
 Fri,  3 Nov 2023 19:08:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPytjHc5y2O0i0RUduqGT+KE9HMYJ6f6XIOJBYQwO11KKuHtJvyXGTZsrfk8VVIlP0dHBIB5wQBy3SaYv7zqtvTjN1V04gm+sMMgRM2Th4fihfUFjXSGeNzblpb3I2Dj1cd08nkm69sIXLLUqW0WYwSWjlVunIa8N98jbMFM7ttGmU+JxBHCT+mCz4Nxhbc1geuq65zMtKgBActwJBu68L3zFPO+OfznS4QT0zYgjCqtgtYOj4YAjt+8XYYJGpJnmKCJWtBRGMz6/fnkZApnHQqFu/EfKleIBJ8F36tbxovdWuXrRFMNTzMLinK1vCp2pqO/Le3dRnBGlyHmE6nS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGC1dMO8YJXbUm0/318udfnStVZ0KBjFpG7tHiWBNEI=;
 b=b9J+WAcLPLT7p3engyfOELWMmZ9fdTHwlMUq16kRd9WUBtUTBWPnG8J3dii9066JEX5l4UHf5nubFIatvSfPk6amlwFugbQU/JwMBlENpdpzduvLW2xyz9VNKTsnOvWQGOimApYX3yDvYQSNJiis0rbSsK/IEjJ9ai/2MSjwfM7ysBN5BkYng+2UKWpGS7KpNAykfpUptETE5EHrk8DvDZrpjo96zhv1oHWmy2fd5gYnBTpnzBI7fvarIlSvJ+e5uYOcTR/UL0RZN94rNOeyW/2Fixqhwu8vucHZGVC3QR0+HMOxLeRxwapIPiFgEuxIsJxJD3u9GDRiCFqRXH6XPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGC1dMO8YJXbUm0/318udfnStVZ0KBjFpG7tHiWBNEI=;
 b=acLWzXg6nb46dClTTUMaUBBxc2uuppfMWhSaRReIAFa6Ab6v76v6Tm7houQgMWizZu23dGtWR1rQRKKdez1CFa5avmCXydjZ2h5r4wwG+K0NU/uMkMzrrMzNi20TH4gbiX0tJeAJJdYx1K/DTk4L7/PB35eFpSbn1E0+RHcK4G0=
Received: from SJ0PR03CA0230.namprd03.prod.outlook.com (2603:10b6:a03:39f::25)
 by CH3PR12MB9171.namprd12.prod.outlook.com (2603:10b6:610:1a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 19:08:27 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::6f) by SJ0PR03CA0230.outlook.office365.com
 (2603:10b6:a03:39f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21 via Frontend
 Transport; Fri, 3 Nov 2023 19:08:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 19:08:26 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 14:08:23 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Hans de
 Goede" <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v2 2/9] drm/radeon: Switch from pci_is_thunderbolt_attached()
 to dev_is_removable()
Date: Fri, 3 Nov 2023 14:07:51 -0500
Message-ID: <20231103190758.82911-3-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|CH3PR12MB9171:EE_
X-MS-Office365-Filtering-Correlation-Id: 6332e72d-190e-4ddc-6b30-08dbdca0426f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j3ckKCo8GNcz9ff7l5eLHlllj9KVcgQ96VEMzSym4/JDqEhvY9TN+1Fs0IGCpwlGldt1raHS5Kw5sqVmQ6R1qNEmTwc/5RlERS4K+aZLq+hoNXEOdG1YAb9/8Ar0aF1048qN/s7wWkFJnsFLiTYfBdhsaJZEXe/mRCJhfUKJIbOPyaaPTehchQuXdUcu0uFsKrpPzDUlteqapQstel1Md8BxyZEThbmCsUUcvmSzvFH4eOedAMnM7uVlLSQ+oj+zTe9+EfYL/x2UUXEr6tFAGgX902MQJDXe4wVSE9V1IzTpUp37nmqxTjoV7JtVgALSDEGDA7xOkQTS5Zn/gsuhy+ZnI0hggMhH/yLQegvDcIkZSrY3oy1MTqX5m5Ew5Tuaf3pfDaJnSoggOs42Kx7BtvM1yN96Bj2JaobpmJYjcsbnNdgqPsPnNSVfDSrrRao5eGi8vbuQUSK6zDAD0Xqk4ThLQTB8++fkWVjH3MbVTvT13H1IVXpRJE/wW9+2AMbyA4WTdCoKxAvAOL08VKc3uaiw/Y2TldZ4Ao+qxrIfzMjyHwdd551Y/nz4u4eb7QXXxdxLx361mourzZgIFnss2IUg0hGkY6XfuUuy2o6iMC+rbZNkq3iNNM7lXbX1+0acOyaXUXJWhn/HpSf4NbKvIz6ZYJrBSVHavXzRE3xT7M6/LWPkehq7wflXIFjO6UyMTlxyrIa7hxb5+gBygEWxCyqxWANoDAFBhOzWRWD+EHXz8b8IRxRzeavx9+H4rGLIFU/AOXeLfHoYLObi41mDSQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(64100799003)(186009)(451199024)(82310400011)(1800799009)(46966006)(36840700001)(40470700004)(70586007)(110136005)(70206006)(54906003)(316002)(44832011)(41300700001)(8936002)(4326008)(8676002)(5660300002)(40480700001)(7416002)(356005)(81166007)(47076005)(83380400001)(2906002)(478600001)(1076003)(7696005)(36756003)(336012)(2616005)(16526019)(26005)(426003)(86362001)(82740400003)(36860700001)(6666004)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 19:08:26.8970 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6332e72d-190e-4ddc-6b30-08dbdca0426f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9171
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

pci_is_thunderbolt_attached() only works for Intel TBT devices. Switch to
using dev_is_removable() to be able to detect USB4 devices as well.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/radeon/radeon_device.c | 4 ++--
 drivers/gpu/drm/radeon/radeon_kms.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index afbb3a80c0c6..ba0ca0694d18 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1429,7 +1429,7 @@ int radeon_device_init(struct radeon_device *rdev,
 
 	if (rdev->flags & RADEON_IS_PX)
 		runtime = true;
-	if (!pci_is_thunderbolt_attached(rdev->pdev))
+	if (!dev_is_removable(&rdev->pdev->dev))
 		vga_switcheroo_register_client(rdev->pdev,
 					       &radeon_switcheroo_ops, runtime);
 	if (runtime)
@@ -1519,7 +1519,7 @@ void radeon_device_fini(struct radeon_device *rdev)
 	radeon_bo_evict_vram(rdev);
 	radeon_audio_component_fini(rdev);
 	radeon_fini(rdev);
-	if (!pci_is_thunderbolt_attached(rdev->pdev))
+	if (!dev_is_removable(&rdev->pdev->dev))
 		vga_switcheroo_unregister_client(rdev->pdev);
 	if (rdev->flags & RADEON_IS_PX)
 		vga_switcheroo_fini_domain_pm_ops(rdev->dev);
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index a16590c6247f..ead912a58ab8 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -138,7 +138,7 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	if ((radeon_runtime_pm != 0) &&
 	    radeon_has_atpx() &&
 	    ((flags & RADEON_IS_IGP) == 0) &&
-	    !pci_is_thunderbolt_attached(pdev))
+	    !dev_is_removable(&pdev->dev))
 		flags |= RADEON_IS_PX;
 
 	/* radeon_device_init should report only fatal error
-- 
2.34.1

