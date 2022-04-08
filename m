Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C374F9D78
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 21:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180F410E424;
	Fri,  8 Apr 2022 19:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D3A10E33F;
 Fri,  8 Apr 2022 19:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJZQ8qvkExmyyo0H8WyLVMexYi1VfgVsebPbufFRr73PLVMTtuImqnMVeGG/rO5QsjakN6au7vIibHaCklfIE04nwaLbLbtMtLI8VzjEoFpdN4Lsl1lLfvVLvcDkQkwS7W7R1pD8t8iRfc+5zkZ9qzrrIHvWeBc0bZ1hxwtvi0XOfF5ewqciH1fYAocHWznfD40bY9qOKOSK1/18dqjxMELLXQgd9WqgwkhQEv43IMJJdcJLa7IXMA0XQ8dA2c4EdGhaUqZ6W0+1JdkCGV6d/Y+Pn+314Vv7U0c+pJfdcXhkaJ7wDYiAQVQJ9fLSvhfiP2M+wkhdVRKr9rc4kZPHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yc28WTVKa0nPvsiwTTTPmv/PGDpongF9qQZVZ1DNIGY=;
 b=Ve7h15MDStKVzCXcabkhVjLQvkdRjzxLI//UqR9yUIzdmHxYLX/cu9y3S7tbBkO2s41X71d/sCq0HL41bX/1fwpUpOGqDXLpJWyHeMwfKQIZB8G4GeB70k2jagxtAkKYxfDhEDvbhnBUorxhU+FmIumVXyiXujAYk7lFEtfm9MfpYt8MIqpHYnQc0tQfPhZXI9XAtaCNlYfQXn1l1xusoR4cbNI54JpKgnu8AwR0jjsWVRsp+dprUtUDmq4beetPlg4LNEyoHUK957dYSncGLNllldCUzprEzSTV/L9LQiuUmiwof37jN6Vj81Okv1VeeloGjIu6nGQ/99z5vGUo0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc28WTVKa0nPvsiwTTTPmv/PGDpongF9qQZVZ1DNIGY=;
 b=oTzQJSAQ6BSNycCur1yWnEc95g07Pbe0xS2QIGe24jG4/4M53O4uktFK1MPysayxL6bcpK53Zpz5F3lklq3JhIi+CkRTtp0l+YZiw0JQNKEEFsUVmneLVWLD+G1rU1f54/UW0Mkc8qj+40emRW2UjeAxVzIjh7fywi5/tx2zqqA=
Received: from BN6PR17CA0029.namprd17.prod.outlook.com (2603:10b6:405:75::18)
 by LV2PR12MB5798.namprd12.prod.outlook.com (2603:10b6:408:17a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Fri, 8 Apr
 2022 19:05:51 +0000
Received: from BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::97) by BN6PR17CA0029.outlook.office365.com
 (2603:10b6:405:75::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.23 via Frontend
 Transport; Fri, 8 Apr 2022 19:05:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT062.mail.protection.outlook.com (10.13.177.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Fri, 8 Apr 2022 19:05:51 +0000
Received: from doryam3r2rack03-34.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Apr 2022 14:05:50 -0500
From: Richard Gong <richard.gong@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <xinhui.pan@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based systems
Date: Fri, 8 Apr 2022 14:05:02 -0500
Message-ID: <20220408190502.4103670-1-richard.gong@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ee0132f-f0f9-4b2e-57c0-08da1992cc8b
X-MS-TrafficTypeDiagnostic: LV2PR12MB5798:EE_
X-Microsoft-Antispam-PRVS: <LV2PR12MB5798D37965E23EC2FE88358595E99@LV2PR12MB5798.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fJzlQ13W5KG1EOabGsmfalD0d8bVsueNSDWqQNemfdvltM7Mku8If8GqQCvdxdSNWhDm3VQWyxwwEq936NZvdTyxxdiLyMyfkdURJN5aKVJCF9/tW1PDxlRB/Rocja6FP/NJVi2rPHqlQrFsToFNUiWcpMMIo9NvcKXyvYOpfrUpqLa8JIbS1HhcwLnraDdNFAial4Ce1qzVuivVIiqB09YG0Ugv+GDkx271SFpMzFozwvYH9gpCAZyLpEKZq/WZDhcHLqXWNICelCpByIXNXuIG5i+zdaT8eMLXRoiq6Tr3a8LNGqAMKYupFPidwWn8oDyDwKU4zKvC2GAPSDMqteSrY/vN7MywtOT73M3JGBIZDPMtlG1c9UC7mLr0L5zrULtkQaND2OK+cLC8DcugUEmh2SP9uZgxwdECSCegJIcYlkwwMXAWW90dIFJcHWfYSofgefK2MHM8CK+p8omkqplfolKWTHj1H58KSvERvIOufgd9QgvtWWVOgGSkzDkNPE3NaR6J8cYyiP3TfPsLUkE+s2GLTCWuXLzVxAEB2iqGioiVpSdG40HZ+nmnO+Sn3P/DdpIEVfOF/P8Sazrf/KpF45UifhgODfZMDRF/qjbxT3z6QvQTRZIINpJ3WYCMLDgr8nmGNx4nY8rZwM/Wb6AkFn9E+nVD4cxtQP7Rq9/V3UceMiU3yUojc/dBnbMYJXaN37DgOtdeCbgRkUJzjw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(356005)(8676002)(4326008)(81166007)(966005)(54906003)(8936002)(86362001)(426003)(26005)(508600001)(6666004)(83380400001)(2906002)(70586007)(336012)(110136005)(70206006)(82310400005)(1076003)(44832011)(2616005)(316002)(7696005)(16526019)(186003)(5660300002)(40460700003)(36860700001)(36756003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 19:05:51.3168 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee0132f-f0f9-4b2e-57c0-08da1992cc8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5798
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
Cc: mario.limonciello@amd.com, richard.gong@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Active State Power Management (ASPM) feature is enabled since kernel 5.14.
There are some AMD GFX cards (such as WX3200 and RX640) that cannot be
used with Intel AlderLake based systems to enable ASPM. Using these GFX
cards as video/display output, Intel Alder Lake based systems will hang
during suspend/resume.

Add extra check to disable ASPM on Intel AlderLake based systems.

Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
Signed-off-by: Richard Gong <richard.gong@amd.com>
---
v2: correct commit description
    move the check from chip family to problematic platform
---
 drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 039b90cdc3bc..8b4eaf54b23e 100644
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
 
+static bool intel_core_apsm_chk(void)
+{
+#if IS_ENABLED(CONFIG_X86_64)
+	struct cpuinfo_x86 *c = &cpu_data(0);
+
+	return (c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
+#else
+	return false;
+#endif
+}
+
 static void vi_program_aspm(struct amdgpu_device *adev)
 {
 	u32 data, data1, orig;
 	bool bL1SS = false;
 	bool bClkReqSupport = true;
 
-	if (!amdgpu_device_should_use_aspm(adev))
+	if (!amdgpu_device_should_use_aspm(adev) || intel_core_apsm_chk())
 		return;
 
 	if (adev->flags & AMD_IS_APU ||
-- 
2.25.1

