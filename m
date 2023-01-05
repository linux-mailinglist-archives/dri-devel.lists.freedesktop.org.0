Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5E065E3D9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D6F10E658;
	Thu,  5 Jan 2023 03:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD6D10E650;
 Thu,  5 Jan 2023 03:44:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLJ34Jg0l9Ps88WH8RXmeLJGtCgL5mBgE9EWtBPv4smXLxg4mvS1CXJbYuvTe0SWSOWGLTYiWmFxrvLLdxn7eQlws+fd0k3YNt08MJ4QtSNlDrjTQ3tMGSRuCW/Fv6bPRD2PXQHWIYfSWLrszywLJXQNzTSDh63EXehaZThFtCsTjN1nJIUlRv+g/aZu3gal98KBwHp77hdqT4msJcO7EGMZp6MGLIvtn+TZawBBneks+ky6jpjHuRohDRkMMr2rzblGa3bhSAPowdGojHiE40kWhtV01kLCwS3AN8SiWrFeUtkbX96Ck2asHz0OnX/IbyFvWgVSjOWzNKqZtxGRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afIqknkR54jXrha02RNtweS8znmcL7L/wRrCKVfEKcU=;
 b=U+NyDSFjW5TVRx/A+KSCkYUN0BC8th2f5UuBGBAtgR3DfpgtpEHVDga3VhzGPTiPyHdnpTZoTxRBjj8sgFcQ9lx8pDraGkU/Fja6wKb/m8wiTocdgLQn3wlHGbsXQg7Xs7wHwzMfGX9l/jOizKxYqT1BGQsapuPxPRgSSfqR1oghX6Hb+wl4srpsotDM1fmOr6xuf/K3BJaxZnDaaG98IpSZsOc8o0O1pNpwMKdSpA/cI0F1Mkoc+NrulennLZZOztebBMsQX/yqg2794mamZ0wjMxMkIFuECqCPUW/s8hnHaqajnUbAIYXUAzhmMyvwWDX4y1asOpKiqiQV4AcFZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afIqknkR54jXrha02RNtweS8znmcL7L/wRrCKVfEKcU=;
 b=tZF5XjU2qMcVKzuoBzHTMnoy+YsIxi42WVm3K6lkLVbL5Nz1YqaAG24iAAW/s/UGMAP/Cj56rhNquecqt+jic3UZOouFYyuaYvWEYgNjOwU4GQSg+iLtN+IILaHshK+hAVaOrJ8/PgY96x5+mIiNECIXRuO1iwMtM0+ZQ/io66A=
Received: from BN9PR03CA0611.namprd03.prod.outlook.com (2603:10b6:408:106::16)
 by MN0PR12MB6270.namprd12.prod.outlook.com (2603:10b6:208:3c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:20 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::8f) by BN9PR03CA0611.outlook.office365.com
 (2603:10b6:408:106::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:44:20 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:18 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 15/45] drm/amd: Load GFX9 microcode during early_init
Date: Wed, 4 Jan 2023 21:42:49 -0600
Message-ID: <20230105034327.1439-16-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105034327.1439-1-mario.limonciello@amd.com>
References: <20230105034327.1439-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT065:EE_|MN0PR12MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a47d2e2-7fe2-428e-23e0-08daeecf20c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UfEahBIEkYjIUsbqvDEzO1NtOaGycHcuNJfFAbQI0xXPZU7ToKd2j6s6HrqSLYtVt/Durdx4jwftOUJiOrh7x4c7p+U5B8Bj2rzdFXNVy98Z40skFVnSOEkSY+/zOLOHaQwggI0ghqd7cJ7Nn6rric8q3iK6GtMHFX7aj6ZWwzyVbg2W1f8iJzorN/GDdm6E4asxUexb+kpZr29mcp0NqkF9WTvPNRzeIG2wQkWBKl2EBna3Mwb4c+ZFG2joT1fiZBETTyHn8Xfe0BSfm4lLHMMA0vvLyzhBDVeD74Pj4YTEFIfMxf0XPBdrrAIKBTjEuFb6tqnaUw66HqfgaQYu44wF9arL/5O4Z3lN/Z4seZC9x4cPckAU26dOb7wrnieBC59NJzTaqi3mF7DcVG2Nqa52WQ9tvC2GEWVW9V0/9Nn19x9IpgMs6R1mRYLIQGTrmIpZ/CmS8afrK8MKkhE0z/B1V8Sj/Dtrc+N/PVqgjDVt2PWv8ZrG8FbwfPaYWYtF3ulj33e6GX5ChMAdYCwfGR+6ew/sbu5Lfz/HrBGjIrcNZUlcSmc73bFtvYzqCYBUss3PsXIBlrmHz6LiT32S93OWrwnraQ1/fc7sKnTmShU8e6CrtQk6HHOeRN+GjGuUlvpcL+GQUIZdAw1lhvm7CeE9Hy+3XutkzHHIcaw3XKIFhgcHtQ6sADAFqzeunIjcbqbYRzrq8LKbRVq/38fo0YP9q7AKsWn4i3CGMc+gt6I=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(40480700001)(8676002)(41300700001)(54906003)(4326008)(110136005)(356005)(70206006)(86362001)(70586007)(81166007)(36860700001)(82740400003)(6666004)(186003)(426003)(478600001)(7696005)(26005)(5660300002)(2906002)(40460700003)(83380400001)(316002)(44832011)(8936002)(47076005)(2616005)(82310400005)(16526019)(1076003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:20.1243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a47d2e2-7fe2-428e-23e0-08daeecf20c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6270
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lazar Lijo <Lijo.Lazar@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If GFX9 microcode is required but not available during early init, the
firmware framebuffer will have already been released and the screen will
freeze.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 58 +++++----------------------
 1 file changed, 9 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index ef2dbebbc90c..0dba690cf7dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1245,7 +1245,7 @@ static void gfx_v9_0_check_if_need_gfxoff(struct amdgpu_device *adev)
 }
 
 static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
-					  const char *chip_name)
+					  char *chip_name)
 {
 	char fw_name[30];
 	int err;
@@ -1278,7 +1278,7 @@ static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
 }
 
 static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
-					  const char *chip_name)
+				       char *chip_name)
 {
 	char fw_name[30];
 	int err;
@@ -1333,7 +1333,7 @@ static bool gfx_v9_0_load_mec2_fw_bin_support(struct amdgpu_device *adev)
 }
 
 static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
-					  const char *chip_name)
+					      char *chip_name)
 {
 	char fw_name[30];
 	int err;
@@ -1379,58 +1379,24 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 
 static int gfx_v9_0_init_microcode(struct amdgpu_device *adev)
 {
-	const char *chip_name;
+	char ucode_prefix[30];
 	int r;
 
 	DRM_DEBUG("\n");
-
-	switch (adev->ip_versions[GC_HWIP][0]) {
-	case IP_VERSION(9, 0, 1):
-		chip_name = "vega10";
-		break;
-	case IP_VERSION(9, 2, 1):
-		chip_name = "vega12";
-		break;
-	case IP_VERSION(9, 4, 0):
-		chip_name = "vega20";
-		break;
-	case IP_VERSION(9, 2, 2):
-	case IP_VERSION(9, 1, 0):
-		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
-			chip_name = "raven2";
-		else if (adev->apu_flags & AMD_APU_IS_PICASSO)
-			chip_name = "picasso";
-		else
-			chip_name = "raven";
-		break;
-	case IP_VERSION(9, 4, 1):
-		chip_name = "arcturus";
-		break;
-	case IP_VERSION(9, 3, 0):
-		if (adev->apu_flags & AMD_APU_IS_RENOIR)
-			chip_name = "renoir";
-		else
-			chip_name = "green_sardine";
-		break;
-	case IP_VERSION(9, 4, 2):
-		chip_name = "aldebaran";
-		break;
-	default:
-		BUG();
-	}
+	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 	/* No CPG in Arcturus */
 	if (adev->gfx.num_gfx_rings) {
-		r = gfx_v9_0_init_cp_gfx_microcode(adev, chip_name);
+		r = gfx_v9_0_init_cp_gfx_microcode(adev, ucode_prefix);
 		if (r)
 			return r;
 	}
 
-	r = gfx_v9_0_init_rlc_microcode(adev, chip_name);
+	r = gfx_v9_0_init_rlc_microcode(adev, ucode_prefix);
 	if (r)
 		return r;
 
-	r = gfx_v9_0_init_cp_compute_microcode(adev, chip_name);
+	r = gfx_v9_0_init_cp_compute_microcode(adev, ucode_prefix);
 	if (r)
 		return r;
 
@@ -2118,12 +2084,6 @@ static int gfx_v9_0_sw_init(void *handle)
 
 	adev->gfx.gfx_current_status = AMDGPU_GFX_NORMAL_MODE;
 
-	r = gfx_v9_0_init_microcode(adev);
-	if (r) {
-		DRM_ERROR("Failed to load gfx firmware!\n");
-		return r;
-	}
-
 	if (adev->gfx.rlc.funcs) {
 		if (adev->gfx.rlc.funcs->init) {
 			r = adev->gfx.rlc.funcs->init(adev);
@@ -4565,7 +4525,7 @@ static int gfx_v9_0_early_init(void *handle)
 	/* init rlcg reg access ctrl */
 	gfx_v9_0_init_rlcg_reg_access_ctrl(adev);
 
-	return 0;
+	return gfx_v9_0_init_microcode(adev);
 }
 
 static int gfx_v9_0_ecc_late_init(void *handle)
-- 
2.34.1

