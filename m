Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B184FE443
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 16:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1544710E9B2;
	Tue, 12 Apr 2022 14:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAAB10E59E;
 Tue, 12 Apr 2022 14:59:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBlnekEcW8mh3j8shoCJhosQkrH8izFPVpmMIKtBBY3RL8a/DSVOpN8SDxJmP9GyOI8tDDVEB+ZATdnD8iChUZh/mgTLR+3g0Qcz+/W9eMO/F/+dNRdtZ4j8dUq4KWWh6dZLjqS5cuuRUvRqL7dehlBn5j8q2X0V9yDlvzBZtf/edEMW5Fm6t9kAT8xTkgvX9HrVFA7iDy2WwioisgEOTO1gqcQbk7nNGu7c50mO1M2c6h9xlGD4bjZ2Apu5gGOe/qxrRN2/0I7Kc+uwuWP4vY5rzu+tUwvQiramkSCOd0wb4/F/Kj+CXyMYf20Q5RDrZ0jMcAmN9GNLgpS0+mzqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpCtgxfrI0pU+sx5/bPjf6iSGeK1D/DCo6LbvntKJfA=;
 b=RS9boC5/jeu7e9gWVH96hcWfbImUhLIN4qEULUr8poT37FVA0mAc/T0uBT0wa9UX7FNaf7fyMvCpFNK+l1h5i8AtwKe5kcaTaK3GNhMlEIHYJTxQsYabVyCBi0Id5njl1W2R7TljFVb2a8gCkoCiwsGOJ7WLYG/rtFZf/hNiVosNu6i38XqjtPqXjC7JW8kINP1x2KszX5UYKuA+cY2KkO6lk2q/eua/liN8Gk5anPjiw92PQ1GzaAMfWyrIfhFTdDdFh+97LtilHj3IrSWyXC7aLnaN2/I/fGfT95CbL14fUvZhgPXkXK4n3zfMXhp1uegfkdrEhH3YL85UIEmQtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpCtgxfrI0pU+sx5/bPjf6iSGeK1D/DCo6LbvntKJfA=;
 b=wqXiHu5bD+//y7ZqcJYM1sNwxdmKWM+Fk+Bjai4nPg0vQx4GZ9GLNFUYznc6k+aeyZ8kprpzifLGSHu9o9UZUDCAARvR/jok5jAtJV+9klpRbkUD+QeqCHNlJJQEFbe6aGEmg0lD0P8TflcDMQ79y4kfBaFcgEdSzNj5N+qs5bU=
Received: from DS7PR06CA0037.namprd06.prod.outlook.com (2603:10b6:8:54::12) by
 DM5PR1201MB0058.namprd12.prod.outlook.com (2603:10b6:4:50::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.18; Tue, 12 Apr 2022 14:59:31 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::fa) by DS7PR06CA0037.outlook.office365.com
 (2603:10b6:8:54::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18 via Frontend
 Transport; Tue, 12 Apr 2022 14:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Tue, 12 Apr 2022 14:59:31 +0000
Received: from doryam3r2rack03-34.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 12 Apr 2022 09:59:29 -0500
From: Richard Gong <richard.gong@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <xinhui.pan@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCHv3] drm/amdgpu: disable ASPM on Intel Alder Lake based systems
Date: Tue, 12 Apr 2022 09:53:50 -0500
Message-ID: <20220412145350.2843514-1-richard.gong@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 604aa64f-ed80-4a07-e1a4-08da1c950c84
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0058:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB005816F57130BBA7E8DF87D695ED9@DM5PR1201MB0058.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BHGYcmC8V7Jh9w6LlDL3Tg2I2YEYmLm4THv0JwHftnORKdkr2FvTzZHzsCNf22pswzeWF5zCxCHo7jP7k3oS/er7m5gtpMvEcXHrRSAsayQQY67emifvhEtkLG87juap0t6H2uUUZ9nK4wUfFpJXDuHOcpO5TOeluNvqS4Dh7zT7iSl7ppdgDXaTR5uUoj0M/O/WAESNkCIYUWMnZoN6C8pDr0jntWv+VDV2mlqcJ98+tkzMCHF28eKJAdLOrlN7tHi8KYGs+lVOxWUOw697c/VW+IRN98KBJcT4hJudTIHyXtEcntp3OFZ/XxgOkAQfbEFGjZ+NQWSngF508gGe8zJGUnO6MO36Cy5g4v2VDwFUnBQU0FxyLvc+7aDeNhPKtwz5ACwldfGDLl4xp2AsUnB0wEHVJqGJKvCWpp1bd53A0bQJeuCgNmNRB9p32TPS9R659dd5Xewfa5uWLEN3/W+RJv44cBkhPUuyaND9/xO9NKFIa+ZthNX6+oYLRuPm1CW7m6LYsitmT5zzqULIF8z4GwS2sQAUfPduRYiwkRBzTCqoMihUKrqNiwDirvtsr/bFWBatGOWnH2rLOOfJgI8xCKBKONcGXIOfSOVeENRXKo85frdsnYnSmB/u851Wk3Lrh34oai+ULflf8TMLj9AchvRg3XuLLdL13Ol0YGV1wzdJruY7RDFQQnYn+XfMhZWZ3WdwnBplnSuxCv/P8A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(508600001)(2906002)(26005)(7696005)(6666004)(54906003)(36756003)(8676002)(4326008)(82310400005)(70206006)(70586007)(8936002)(966005)(5660300002)(110136005)(316002)(44832011)(356005)(81166007)(83380400001)(40460700003)(36860700001)(86362001)(1076003)(2616005)(426003)(16526019)(336012)(186003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 14:59:31.0680 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 604aa64f-ed80-4a07-e1a4-08da1c950c84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0058
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
v3: s/intel_core_asom_chk/aspm_support_quirk_check
    correct build error with W=1 option
v2: correct commit description
    move the check from chip family to problematic platform
---
 drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 039b90cdc3bc..b0b6353b48b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -81,6 +81,10 @@
 #include "mxgpu_vi.h"
 #include "amdgpu_dm.h"
 
+#if IS_ENABLED(CONFIG_X86_64)
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
+	if (IS_ENABLED(CONFIG_X86_64)) {
+		struct cpuinfo_x86 *c = &cpu_data(0);
+
+		return (c->x86 == 6 && c->x86_model != INTEL_FAM6_ALDERLAKE);
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

