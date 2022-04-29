Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243F951506B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 18:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958F610E7CB;
	Fri, 29 Apr 2022 16:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2067.outbound.protection.outlook.com [40.107.96.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9A610E7CB;
 Fri, 29 Apr 2022 16:08:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNZrO6bqFCiucpL0E5c78U6op1Tzfg9e1bxAzptlbY6DzVroGg6Of+wNblmoKcUz65kZJq/3zYrEEpUpbVO29P1Ng8fbyAvyUdmBWxxoqLLmbRQqv+PaKcY4krmoT3SRkcvS88OCR2Sc2Az6qydTh/XVKUnF2zqFkY4a4LPpR5J2BL3eeoipTpX88UrSJNK+aaqkoVMRiku1bGae52pIQC6R6OkRuVQMbeFM8yWPYGRL4miL1Eyg/M8pvF4jcAc7w9py068uSnZ5E4XVvEVjHkAq8glqWcZGgDemCyv0RbOoECJRK+IACmaNpWVP89HqpeIYeAkw9upGPvUQvrSwxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4ygTPRmci2v/w1AtB0mhV/taxLH80A6nMjjug/S914=;
 b=jElCPRhEQT4DW93P9a+yXaOf03+iVb7f5C50geYu8Ocmf3AjoEMhvGKwEl3azdVWh6t0qGFDjBxv8Mbi374TQ/bAf5KFj7+jQFKZAGS0OqqttVDkMuWBi1xbD8e2TK42fikb27uKbLMnpCSaSbtIDzEjHdmKg3oFjS+yGAxkiq4dmKrWyMKmEWJ5pM3d0XEw40ZWNuUA0BP+3zfHh5ywYglvBUXdpLHu7yJfHvDjhN8gpVFitYyfAK9gIQGrUzWQ0XLPpu9xso+dXJe2AlXPt21jKevhG+Z33gfWAp4nHQFvIAlHAr2I7DdTbDO+/1DQ0X2DVSwaTdKDdADFVJGmgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4ygTPRmci2v/w1AtB0mhV/taxLH80A6nMjjug/S914=;
 b=LpYid9OtRs6RfalW6UOTGPYVkG2u3hlILSk2jNixgRCY6YBcktoSFVUbLdgc3J4cw/YfiqZbenkOT04PX0KOMrKe5DygWDtmavbx3whkYajjSoBKKtG/G17mEU92i6yPnGWCHdQFHUoM6ELcZ7RPnMjWmPuGEC1nN4XW3OPlcG8=
Received: from DM6PR02CA0163.namprd02.prod.outlook.com (2603:10b6:5:332::30)
 by MN2PR12MB3167.namprd12.prod.outlook.com (2603:10b6:208:a9::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 16:08:24 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::75) by DM6PR02CA0163.outlook.office365.com
 (2603:10b6:5:332::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Fri, 29 Apr 2022 16:08:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Fri, 29 Apr 2022 16:08:24 +0000
Received: from doryam3r2rack03-34.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 11:08:23 -0500
From: Richard Gong <richard.gong@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <xinhui.pan@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCHv5] drm/amdgpu: vi: disable ASPM on Intel Alder Lake based
 systems
Date: Fri, 29 Apr 2022 11:06:04 -0500
Message-ID: <20220429160604.2608782-1-richard.gong@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 637091c2-d76d-4f28-542d-08da29fa7d0d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3167:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB316778B8BE830E93774BFE5C95FC9@MN2PR12MB3167.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y6pvU9Vv9NB9FRwGcLbxKxCoGcYnGLJ8qPhEvVLoTzmtBUBPMTNhmG/9ZuYPWZTiSlLR0KOv8OscSzTZrGf5lASOYqR0ycEW83I8VbrUq1uSGGs5FalI9IaTRo2/HxvErjdHKuEshfUzNmo76o4oE3SHyxRq2stuOqNK71lRO+WopIu5CmhqbOzyLGDzJfAb8C9tKDIGYYCXr6Wf3yfx5NxTYifJ0osTReD4jnBLJptIJCt3gHCvS+qvxWaNwx9+eb6llWUUbLgGUtY4m2nItBNt62IA2pp/LmSeDylHeFuUyYRgA4EKkL7h07U9WSwAgSThm63BSYoLc1O3XUbjeL19mGKOrKo7iHyRhD4oTe0DGdPxU6rNXzTYNdHYkWeEIeW/HZY2aWn3MAgJLY/4b1yTt7nsXX49Ywx6cprhVP89SLLOUQX1UslgrmAK9yKBpMCqionr87S6F9AocvCvIu98bNHoSzOshBQoryIQOXbXKJn7uCBUXkRfv6roxYV4yD18t1NVF6UhOQiB+DmisBQD5kzlD58pYP80wjhHy6gdpYDo4adLUQjKuWLQJvVlu8Gqq4MAwLcc6qWcdqy0qbBu1ztD26Ta3PdgNJSzWcoc1ORP6hqXZ8wRDpmPdS9W92Nya9kjN3N+y531dvbkl44gXN6HtzuswfVGcLBZ+jY8Q8exp6VIO2Ql8i5h9AD5U3LWMxpognnt2OhuBYd4wg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(86362001)(47076005)(966005)(82310400005)(508600001)(40460700003)(2616005)(336012)(426003)(26005)(1076003)(356005)(81166007)(6666004)(36860700001)(70206006)(7696005)(44832011)(316002)(2906002)(16526019)(186003)(36756003)(5660300002)(8936002)(70586007)(110136005)(54906003)(83380400001)(4326008)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 16:08:24.1841 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 637091c2-d76d-4f28-542d-08da29fa7d0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3167
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
There are some AMD Volcanic Islands (VI) GFX cards, such as the WX3200 and
RX640, that do not work with ASPM-enabled Intel Alder Lake based systems.
Using these GFX cards as video/display output, Intel Alder Lake based
systems will freeze after suspend/resume.

The issue was originally reported on one system (Dell Precision 3660 with
BIOS version 0.14.81), but was later confirmed to affect at least 4
pre-production Alder Lake based systems.

Add an extra check to disable ASPM on Intel Alder Lake based systems with
the problematic AMD Volcanic Islands GFX cards.

Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Richard Gong <richard.gong@amd.com>
---
v5: added vi to commit header and updated commit message
    rolled back guard with the preprocessor as did in v2 to correct build
    error on non-x86 systems
v4: s/CONFIG_X86_64/CONFIG_X86
    enhanced check logic
v3: s/intel_core_aspm_chk/aspm_support_quirk_check
    correct build error with W=1 option
v2: correct commit description
    move the check from chip family to problematic platform
---
 drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 039b90cdc3bc..45f0188c4273 100644
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
+#if IS_ENABLED(CONFIG_X86)
+	struct cpuinfo_x86 *c = &cpu_data(0);
+
+	return !(c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
+#else
+	return true;
+#endif
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

