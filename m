Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1685E4FEA06
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 23:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA51D10E025;
	Tue, 12 Apr 2022 21:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2071.outbound.protection.outlook.com [40.107.96.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B7C10E025;
 Tue, 12 Apr 2022 21:52:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTUh9ea4uplN9Dcy4GKesyumSG1Eu9H8lOqeb6/jzj5M4HSAJGFtJ/nFa4sXjwO28UIAhhr4RYfv4TyMxCYWXLE6hN2pb4Hrnvt9G+8TiFKNcW1/cETkzUwbjzJkqzEqacGoYWBzdoIfJgWs4zCPTanH7naF7Ep3NzXDvb43VZ81sxGbW4gCxuwRo+BlvNejbEGqzuMl/9HuuhscYcKlIjxkSrq0oU00SK+8AHyaPmM/wrg/8nOxaHDBmXbB7aaS1+1q9SSFDqGXLz+J89nLjFBhZ6EhIWBYtR7A60oRYZmHcyHF8Y8wSOlefkW+hHrFKmfVArEXg4+Qn96nB7mhXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feKgFyWTBY9vsJnZz6EY9lyCPDWYEyUBNvsY+5VSy/Q=;
 b=f5m6Xb1PDSI+1pcpfduS241ta+wjuknNikBa4wu2p1Y1ggJtot7LQOSEH2PG7PtGUzZRsHWW20699YUyVcha67bAgBNUnHDdS0BQbkovjk1aEK47x4Vr7tXjHamd+2niSwjVYkiN2mfHaK0eE4eUthH1PGczhplwjLSuRAfas1xej6lm1HaDOxmgBEsRo2RYZKleWwznh+v3Doj0TU+TNKdm04jMqcj4g+b417Nf4kUKPS7JY6X+cX2fMst+yW2DaSnzy0j/F3KQtBtUnYnx2y8LjsldMt4i3LpXfyqDuCeEBMTN4XvtsmHMmoFIu/JcvEpYQOlLLHwh+K4rU+bYQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feKgFyWTBY9vsJnZz6EY9lyCPDWYEyUBNvsY+5VSy/Q=;
 b=4wxfd+P5fuM8YVT19D05cqxaIBzDPr6VOrDx9W2c6G/gtDPS+HEbaPFNj3kpl+1ttWEOqFxSimM6AY2LCu9hIAdgG4PH22aFNMvZf3ehuAJpN19S4uNU9hBQCGhbonPGAizaE0F9qRpTF5eofwbhSwGZwCEkMx6qIJHNRt6SG8E=
Received: from DM6PR11CA0050.namprd11.prod.outlook.com (2603:10b6:5:14c::27)
 by DM5PR12MB1580.namprd12.prod.outlook.com (2603:10b6:4:10::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 21:52:12 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::1e) by DM6PR11CA0050.outlook.office365.com
 (2603:10b6:5:14c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Tue, 12 Apr 2022 21:52:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Tue, 12 Apr 2022 21:52:12 +0000
Received: from doryam3r2rack03-34.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 12 Apr 2022 16:52:11 -0500
From: Richard Gong <richard.gong@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <xinhui.pan@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based systems
Date: Tue, 12 Apr 2022 16:50:00 -0500
Message-ID: <20220412215000.897344-1-richard.gong@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b262629-cc60-46ec-3114-08da1cceb391
X-MS-TrafficTypeDiagnostic: DM5PR12MB1580:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1580C35E59E32FCA4898A20495ED9@DM5PR12MB1580.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CwGeFqowpQAizLK6QW5664aPukU/8X3vl6KTMKbcl2GUbPW2pf2usudCYP4Ygekq2iCJRgkVhrE0sApG3COA6lVpMSOCi8I5jYXHw0rn4qpo0grrXOkBpuOSVxr57D434tiyr2R2r+QzSQJ+WaZ0Hm40K+nzDCfbABjb9q9BH0U3AqESsoEHGnw9bKKzK9f4CZneLfQfUck4+tP9uPeZAUjhGhyKqdClVJEvWrF7RzadCBZVnwwSUMM7sq8/LZxuzWOXFmZ+v1RSChdje7m7bQOe1knKkQPV+PM9Kh4TSQy8c5dbEXeizSme4XrfIKEywXc/TvLVrk1zA14M8Y0lNCXneuKD8/nqsO2BFL9hn4gkfUxrVUwrq8d3WamhU/JRYVm1UrP7orqzheIUF+7a770tLnNdCo/zIkm8SGtHLuxD2CTQiC/AY3TV29lUU7YO9Oyn98LWUz8vr7BbplkGbQUjZ7yiBF66EFYP/M3OEd1xa+UuiPShhz/N6rZ9a/b7K9lVVcDpAeyzQhyESBbgtdyhFZ0IjkKk+GRfiDAXlMikLTytBPQCR7IigsJaNOfRyJuSMaFcalvBdZOo3CY4OOQgqNcceY6vomv8TC2APno7yy9vG0XQ8cspyXM5eeldMKMIFScFkXIEVju7WX8LizNeHNduBzZTBd7W5kWzM+TnM0C1WQZmKsyue9tgFsuAqel5KkcBFTA7Jy3y65AXJw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(8676002)(4326008)(5660300002)(70206006)(70586007)(2906002)(86362001)(40460700003)(36756003)(356005)(6666004)(1076003)(81166007)(16526019)(82310400005)(110136005)(44832011)(54906003)(2616005)(186003)(36860700001)(508600001)(47076005)(966005)(26005)(83380400001)(426003)(336012)(316002)(8936002)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 21:52:12.6886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b262629-cc60-46ec-3114-08da1cceb391
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1580
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
Cc: amd-gfx@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 richard.gong@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Active State Power Management (ASPM) feature is enabled since kernel 5.14.
There are some AMD GFX cards (such as WX3200 and RX640) that won't work
with ASPM-enabled Intel Alder Lake based systems. Using these GFX cards as
video/display output, Intel Alder Lake based systems will hang during
suspend/resume.

The issue was initially reported on one system (Dell Precision 3660 with
BIOS version 0.14.81), but was later confirmed to affect at least 4 Alder
Lake based systems.

Add extra check to disable ASPM on Intel Alder Lake based systems.

Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Richard Gong <richard.gong@amd.com>
---
v4: s/CONFIG_X86_64/CONFIG_X86
    enhanced check logic
v3: s/intel_core_asom_chk/aspm_support_quirk_check
    correct build error with W=1 option
v2: correct commit description
    move the check from chip family to problematic platform
---
 drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 039b90cdc3bc..b33e0a9bee65 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -81,6 +81,10 @@
 #include "mxgpu_vi.h"
 #include "amdgpu_dm.h"
 
+#if IS_ENABLED(CONFIG_X86)
+#include <asm/intel-family.h>
+#endif
+
 #define ixPCIE_LC_L1_PM_SUBSTATE	0x100100C6
 #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK	0x00000001L
 #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK	0x00000002L
@@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct amdgpu_device *adev)
 		WREG32_PCIE(ixPCIE_LC_CNTL, data);
 }
 
+static bool aspm_support_quirk_check(void)
+{
+	if (IS_ENABLED(CONFIG_X86)) {
+		struct cpuinfo_x86 *c = &cpu_data(0);
+
+		return !(c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
+	}
+
+	return true;
+}
+
 static void vi_program_aspm(struct amdgpu_device *adev)
 {
 	u32 data, data1, orig;
 	bool bL1SS = false;
 	bool bClkReqSupport = true;
 
-	if (!amdgpu_device_should_use_aspm(adev))
+	if (!amdgpu_device_should_use_aspm(adev) || !aspm_support_quirk_check())
 		return;
 
 	if (adev->flags & AMD_IS_APU ||
-- 
2.25.1

