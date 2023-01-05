Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530F965F1D8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F09E10E792;
	Thu,  5 Jan 2023 17:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF52210E790;
 Thu,  5 Jan 2023 17:02:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVZgp5pmq6Rq+AmUDamdQlgWMTfiQN81IvKluY3LCLzh3J4gPTTWZYuQMxuPRzBXh/1/DHq6VOkAbQ4BRMGeDEcSRwQkZqrG6hmo5eu3r1+ObBxf8FVom6CtaR2nUsqAFlm9/XqMwhdrT3lcwoMpAbfKJX0QTJnF/QX09R9pHTK/SKlHBebyUU3dnce0Yf41h/+FEHcyAw1Suy1KwoEcrw05YNaLViD3pcVIo6vtnYd8NcN+zsltGpUcOKtGIRKbBXbjgdmkjqLwbDoHmpRfmHPozG3gV3Xeg8hs/CbvI75UYchmL1H0/5QDvJil1Yof3whcksn6CAw0fNhSVKdjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynPL55bDIBx5Nk4ox3LhpLnU0VIYc1yv64LYC31DONk=;
 b=NrnfpCppbIU0ULvn0xZGpX0KLZORqT8BXkGlDZbSP5fiaVwl6ADcFFCB7QM+lgXJFab1wxs2Un4X7hlAg/+UzBekJ7fpdyju9mmBuCb/aDfEQ+23Tq6DsuFLvgD/JSozRkLgQJYS4OxQoOrAmi8kb6Qr9oWCz7TI5zBYNDjMmMLApEVtwkunSbt/fbp/ER2WFcRIIVP4ixadNsKyRkrdcqzhXNBRyyemQSpVWd+7eG5K4bMpL7d6Vdv5Jj3YBox8qR9Y9nxaiWhSNEa4X0nQ1fqRT5DrK9RCtMvRnl0YRAIaNItKeC5y9JQIUl24HsZQDFaxlad6iks7AzyhUS96zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynPL55bDIBx5Nk4ox3LhpLnU0VIYc1yv64LYC31DONk=;
 b=klka4UeP2fMVa8asa87OyItCTjteeohQIEowCjMcbVAkPqlRo41Ei3gEE8J2QVBY2b3fBl74/IhxYq5q0usptlHj+6lyDQHz2ELgXUob0y5fUIFzGI6yNXHNXddrxGDOUql+tWm1qxVXott8M1XJa9oPO4ot/cFEakKdnzPKwIM=
Received: from BN9PR03CA0381.namprd03.prod.outlook.com (2603:10b6:408:f7::26)
 by DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:31 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::95) by BN9PR03CA0381.outlook.office365.com
 (2603:10b6:408:f7::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 17:02:31 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:21 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 19/45] drm/amd: Load GFX11 microcode during early_init
Date: Thu, 5 Jan 2023 11:01:05 -0600
Message-ID: <20230105170138.717-20-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105170138.717-1-mario.limonciello@amd.com>
References: <20230105170138.717-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|DS7PR12MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e13cfe6-3f1a-4744-29fb-08daef3ea218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5gDcQWDxXkCzfsGeNUgISf1gzxApHMaHXRXbhK/WhGMISCo7rkcUevjRsNM0sRw1qAY1y+xH0XbMDc13aPCwq0ZU00EIDNdyU9qR2mTLO5UD4xzgWFBNSlo8g2wAwiSzjrub34RfWgqho2wr9xRRjLYLYI4Af9eU/+OFO/8DPBcyQ9ENPPNZw60sZor3kpl0yOTPtl0Bg0NHZHGOevdMYEYCshoHYcchnSjbnCUbjJLrcl13oinf15wTXLgels9i+HVfKheNh6CWvzx9WAfuPauIn165NzZG55Oyivp6M/85piXWfzLDI5A7tMeTuPGFueQfmn90oTbVdmsnaqtDBJWLzxrI86hOjHzUAtBgngnKTjXWfzd2iPqAdNTdmHZZ1363BLQrxaflKNkF2Jka+3gdNvsx5pP75obDueI8SAq9i/kjbucLHsg9fIKW7r7Ub0m7FvFwDHvSfjRLJ1XYPGBbvgL/dIrEH/TWPtzZMBDUmRpKqPCIc77baXRK1+h3iRmVMKLuOgixkruGleKMgeFS2dM1XBzbefmp2rmRT4P+gkIIQJWYKXVHCh7WyKW4jmvGuQockXCuUKGvZBADEtuQSJLxrqgkgF3bdEku/nzvSoS/GtJgDtkKrdDF4igA320a2zKAN0TkYHE4t/VT9g8Xz4vRSbR7uzz82f+Iu5Jn6JiPH/TbhT7mtJBnZFRT7qFI9k4UqOaS0SjWPEsG3FtbfezNWnWNvnhlen+QB48=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(46966006)(40470700004)(36840700001)(82740400003)(478600001)(40480700001)(40460700003)(36756003)(82310400005)(356005)(86362001)(81166007)(1076003)(336012)(316002)(54906003)(2906002)(2616005)(7696005)(44832011)(110136005)(8936002)(5660300002)(26005)(8676002)(4326008)(6666004)(41300700001)(70206006)(70586007)(36860700001)(47076005)(186003)(16526019)(426003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:31.2381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e13cfe6-3f1a-4744-29fb-08daef3ea218
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6309
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Lijo
 Lazar <lijo.lazar@amd.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Carlos Soriano Sanchez <csoriano@redhat.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If GFX11 microcode is required but not available during early init, the
firmware framebuffer will have already been released and the screen will
freeze.

Move the request for GFX11 microcode into the early_init phase
so that if it's not available, driver init will fail.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Rebase on earlier changes
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index d4f67624d05b..5cc329cf66c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -439,14 +439,12 @@ static void gfx_v11_0_free_microcode(struct amdgpu_device *adev)
 	kfree(adev->gfx.rlc.register_list_format);
 }
 
-static int gfx_v11_0_init_toc_microcode(struct amdgpu_device *adev)
+static int gfx_v11_0_init_toc_microcode(struct amdgpu_device *adev, const char *ucode_prefix)
 {
 	const struct psp_firmware_header_v1_0 *toc_hdr;
 	int err = 0;
 	char fw_name[40];
-	char ucode_prefix[30];
 
-	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", ucode_prefix);
 	err = amdgpu_ucode_request(adev, &adev->psp.toc_fw, fw_name);
 	if (err)
@@ -534,6 +532,9 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
 	}
 
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO)
+		err = gfx_v11_0_init_toc_microcode(adev, ucode_prefix);
+
 	/* only one MEC for gfx 11.0.0. */
 	adev->gfx.mec2_fw = NULL;
 
@@ -684,19 +685,11 @@ static void gfx_v11_0_mec_fini(struct amdgpu_device *adev)
 	amdgpu_bo_free_kernel(&adev->gfx.mec.mec_fw_data_obj, NULL, NULL);
 }
 
-static int gfx_v11_0_me_init(struct amdgpu_device *adev)
+static void gfx_v11_0_me_init(struct amdgpu_device *adev)
 {
-	int r;
-
 	bitmap_zero(adev->gfx.me.queue_bitmap, AMDGPU_MAX_GFX_QUEUES);
 
 	amdgpu_gfx_graphics_queue_acquire(adev);
-
-	r = gfx_v11_0_init_microcode(adev);
-	if (r)
-		DRM_ERROR("Failed to load gfx firmware!\n");
-
-	return r;
 }
 
 static int gfx_v11_0_mec_init(struct amdgpu_device *adev)
@@ -1309,9 +1302,7 @@ static int gfx_v11_0_sw_init(void *handle)
 		}
 	}
 
-	r = gfx_v11_0_me_init(adev);
-	if (r)
-		return r;
+	gfx_v11_0_me_init(adev);
 
 	r = gfx_v11_0_rlc_init(adev);
 	if (r) {
@@ -1379,9 +1370,6 @@ static int gfx_v11_0_sw_init(void *handle)
 
 	/* allocate visible FB for rlc auto-loading fw */
 	if (adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO) {
-		r = gfx_v11_0_init_toc_microcode(adev);
-		if (r)
-			dev_err(adev->dev, "Failed to load toc firmware!\n");
 		r = gfx_v11_0_rlc_autoload_buffer_init(adev);
 		if (r)
 			return r;
@@ -4650,7 +4638,7 @@ static int gfx_v11_0_early_init(void *handle)
 
 	gfx_v11_0_init_rlcg_reg_access_ctrl(adev);
 
-	return 0;
+	return gfx_v11_0_init_microcode(adev);
 }
 
 static int gfx_v11_0_ras_late_init(void *handle)
-- 
2.34.1

