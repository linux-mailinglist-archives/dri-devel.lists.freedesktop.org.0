Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2430765DA43
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4291810E554;
	Wed,  4 Jan 2023 16:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2088.outbound.protection.outlook.com [40.107.212.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F021410E550;
 Wed,  4 Jan 2023 16:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqavuAJmyGsgJAb5Oyb7uun9CUx9y5r7Psb+hJkvJ1nHKIuFZOr+CqnTJ3iZaeq0scPltKzF1CBs0Hi1mDF9uFHzR4Lzs+JOR2/5KGd5ytcF9rvVX+2tzC3AwcO4l/lCon3IuTEspvA1BdFY9DbVp2ZRSORhswyIvhmcgWkR9PJOZtLy1r61sADDwxlwrlCmwqfCpmq+Z6mi47FVmFCf9ldLsdWmiU4Ixv9TRe15Snbjn2FnDs7ZGtP6puNhmmrLrno3kSupkQpGbbaIYdbbl/BOL8OytJTA1t02pF05aolUUzy6IS5jpzHWzbUalmDjMs54qo4Zcm7/2DStxPHpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TD8MMOvWypqmaW205Y7oBJdV8zNA4RizmWVOnY1S6c=;
 b=fL0Ayryaer0SDNOTBnQV7VvohA+5l2Qr0rJR1uEzZ4UTgpU7U471734jDh7V05goUs95dsea2q9GLMuMYeTHxUqJNR+8rYMR/13wt97SDU1dBjZYdXSVcuOu0fHAlKIfXgaaSYkE1Mu3sohwCeO+xWJzNyEF6su6NowpzRcVGTvZL2fpmI4dwQprqs0Ih9YPT34vRTNc/BTZasIi4zvjizHI3ElI64tykgV95a1qOPO180rvJD6nbxacSKpdGzDh0DJ7fxyQ2DUUfarMIZgEqJ1CFRlbGcRFHCj7V79hhFom65h/9SORHwhSVtZUzzGdgHvoj2PAhSIuZLVBhl8JyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TD8MMOvWypqmaW205Y7oBJdV8zNA4RizmWVOnY1S6c=;
 b=ShUrsxiBCx3glKz9+0Zwi85hgFwCEhOYCn3f1ynSNkyWjn0r59nEff4UneN8qqW/qxXNqAbgykJ+lYaGFmTEfIa/bh2064NASzH0LlKPYgdTdkKh7zo+2bLxivsBe6aPg5on4CKWJBCzgz1vYUd4LvpVc6dwqSoqQfwgSs8Pp/Q=
Received: from BN9PR03CA0626.namprd03.prod.outlook.com (2603:10b6:408:106::31)
 by PH0PR12MB5630.namprd12.prod.outlook.com (2603:10b6:510:146::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:43:07 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::13) by BN9PR03CA0626.outlook.office365.com
 (2603:10b6:408:106::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Wed, 4 Jan 2023 16:43:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:43:06 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:42:57 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 17/45] drm/amd: Load GFX10 microcode during early_init
Date: Wed, 4 Jan 2023 10:40:06 -0600
Message-ID: <20230104164042.30271-18-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104164042.30271-1-mario.limonciello@amd.com>
References: <20230104164042.30271-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|PH0PR12MB5630:EE_
X-MS-Office365-Filtering-Correlation-Id: 9946da09-c3b6-48e7-2d0e-08daee72c1b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 20jcFH2Qs5P3TuhjSa6Zuk6yYIQeTF8zH4N/sKSVv8CCb7pkC7VyEZ15Vo2CX9x7+cN7PWJ/3oVDRNt2p2FDqmojPorF4mXDMaBPxISaKPZxkiat/rUvN+hB74V2a8QQ/HTVoC8Z9DLC97QeBtBItQZzvAoy3KoSXcE1JywH0NmSCF7m0H7ZNueBFWjGYHeuLVBBuGO8GymXvcfiM9+XM8L09qffs1oW9moVVvm2+Bl+JCrlcLDkwkf5yLG9yzvkRwePieNXBhiBOhAk2ciXI7LWEZnULfRi6Its45x5GdfEQLizWs21qiv4kCCr14ft5vRhZsTbggy40InUqTcPeH3uyOV4HU675hmfxFZ83XNFHpY3BB74ERRoAoVFro6SynlMXOXNIqsOtoMxer4Piy5UI4f1g4+l6Vb4MZ38kVGXdfc9u23uTi7Kt3BEFjEYJ6XDGIieSMbPmUGR/4rNiPJGTphRqCfhwjGC547GQFaJLPldNLLYfcqOD8igVD4rHaTs1yp/q7ONPTmpBaGRJaRnYdoEMlFUUSyLvCA1F16ftmpczkgA1ffII0qv05jhmNDZLYwWAD1gq/1L5SoUUeDHUTOGDW1u7jE8HFxRQpEomKwkqsHGFoXW2qZSAE2DlpiJUACOhWkEWVfdx2bran2HGEn6GiTc0oJQ3fro3TABe6bKQpzj1qovLvLr/fxc/R43rlXVSbiMj/vkGG0KQil/pcYKVKGjX7Xf0+IPgvA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(356005)(316002)(44832011)(7696005)(1076003)(2616005)(54906003)(186003)(16526019)(26005)(40480700001)(478600001)(426003)(6666004)(47076005)(36756003)(40460700003)(2906002)(110136005)(83380400001)(336012)(82740400003)(82310400005)(41300700001)(81166007)(86362001)(5660300002)(36860700001)(70206006)(70586007)(8676002)(4326008)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:43:06.9174 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9946da09-c3b6-48e7-2d0e-08daee72c1b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5630
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

Simplifies the code so that GFX10 will get the firmware
name from `amdgpu_ucode_ip_version_decode` and then use this filename
to load microcode as part of the early_init process.

Any failures will cause the driver to fail to probe before the firmware
framebuffer has been removed.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 84 ++++++--------------------
 1 file changed, 18 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index d36dd823a319..585b301856d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -3968,9 +3968,9 @@ static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_device *adev)
 
 static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 {
-	const char *chip_name;
 	char fw_name[40];
-	char *wks = "";
+	char ucode_prefix[30];
+	const char *wks = "";
 	int err;
 	const struct rlc_firmware_header_v2_0 *rlc_hdr;
 	uint16_t version_major;
@@ -3978,71 +3978,31 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 
 	DRM_DEBUG("\n");
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
-	case IP_VERSION(10, 1, 10):
-		chip_name = "navi10";
-		break;
-	case IP_VERSION(10, 1, 1):
-		chip_name = "navi14";
-		if (!(adev->pdev->device == 0x7340 &&
-		      adev->pdev->revision != 0x00))
-			wks = "_wks";
-		break;
-	case IP_VERSION(10, 1, 2):
-		chip_name = "navi12";
-		break;
-	case IP_VERSION(10, 3, 0):
-		chip_name = "sienna_cichlid";
-		break;
-	case IP_VERSION(10, 3, 2):
-		chip_name = "navy_flounder";
-		break;
-	case IP_VERSION(10, 3, 1):
-		chip_name = "vangogh";
-		break;
-	case IP_VERSION(10, 3, 4):
-		chip_name = "dimgrey_cavefish";
-		break;
-	case IP_VERSION(10, 3, 5):
-		chip_name = "beige_goby";
-		break;
-	case IP_VERSION(10, 3, 3):
-		chip_name = "yellow_carp";
-		break;
-	case IP_VERSION(10, 3, 6):
-		chip_name = "gc_10_3_6";
-		break;
-	case IP_VERSION(10, 1, 3):
-	case IP_VERSION(10, 1, 4):
-		chip_name = "cyan_skillfish2";
-		break;
-	case IP_VERSION(10, 3, 7):
-		chip_name = "gc_10_3_7";
-		break;
-	default:
-		BUG();
-	}
+	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 1) &&
+	   (!(adev->pdev->device == 0x7340 && adev->pdev->revision != 0x00)))
+		wks = "_wks";
+	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp%s.bin", chip_name, wks);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp%s.bin", ucode_prefix, wks);
 	err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_PFP);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", chip_name, wks);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", ucode_prefix, wks);
 	err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_ME);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", chip_name, wks);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", ucode_prefix, wks);
 	err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_CE);
 
 	if (!amdgpu_sriov_vf(adev)) {
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
 		err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
 		/* don't check this.  There are apparently firmwares in the wild with
 		 * incorrect size in the header
@@ -4051,7 +4011,7 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 			goto out;
 		if (err)
 			dev_dbg(adev->dev,
-				"gfx10: amdgpu_ucode_validate() failed \"%s\"\n",
+				"gfx10: amdgpu_ucode_request() failed \"%s\"\n",
 				fw_name);
 		rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
 		version_major = le16_to_cpu(rlc_hdr->header.header_version_major);
@@ -4061,14 +4021,14 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 			goto out;
 	}
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", chip_name, wks);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", ucode_prefix, wks);
 	err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1);
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", chip_name, wks);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", ucode_prefix, wks);
 	err = amdgpu_ucode_request(adev, &adev->gfx.mec2_fw, fw_name);
 	if (!err) {
 		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
@@ -4077,6 +4037,8 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 		err = 0;
 		adev->gfx.mec2_fw = NULL;
 	}
+	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
+	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2_JT);
 
 	gfx_v10_0_check_fw_write_wait(adev);
 out:
@@ -4239,19 +4201,11 @@ static void gfx_v10_0_mec_fini(struct amdgpu_device *adev)
 	amdgpu_bo_free_kernel(&adev->gfx.mec.mec_fw_obj, NULL, NULL);
 }
 
-static int gfx_v10_0_me_init(struct amdgpu_device *adev)
+static void gfx_v10_0_me_init(struct amdgpu_device *adev)
 {
-	int r;
-
 	bitmap_zero(adev->gfx.me.queue_bitmap, AMDGPU_MAX_GFX_QUEUES);
 
 	amdgpu_gfx_graphics_queue_acquire(adev);
-
-	r = gfx_v10_0_init_microcode(adev);
-	if (r)
-		DRM_ERROR("Failed to load gfx firmware!\n");
-
-	return r;
 }
 
 static int gfx_v10_0_mec_init(struct amdgpu_device *adev)
@@ -4619,9 +4573,7 @@ static int gfx_v10_0_sw_init(void *handle)
 
 	adev->gfx.gfx_current_status = AMDGPU_GFX_NORMAL_MODE;
 
-	r = gfx_v10_0_me_init(adev);
-	if (r)
-		return r;
+	gfx_v10_0_me_init(adev);
 
 	if (adev->gfx.rlc.funcs) {
 		if (adev->gfx.rlc.funcs->init) {
@@ -7599,7 +7551,7 @@ static int gfx_v10_0_early_init(void *handle)
 	/* init rlcg reg access ctrl */
 	gfx_v10_0_init_rlcg_reg_access_ctrl(adev);
 
-	return 0;
+	return gfx_v10_0_init_microcode(adev);
 }
 
 static int gfx_v10_0_late_init(void *handle)
-- 
2.34.1

