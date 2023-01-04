Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE8765DA5B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AA610E579;
	Wed,  4 Jan 2023 16:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2048.outbound.protection.outlook.com [40.107.96.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1F110E550;
 Wed,  4 Jan 2023 16:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HL+qI/Abw4WTDLPMwCXkrtadSyPROlCwHoWuxJrWiljSLR7/j31cQ8n/iCfkpBnXpbMb3u7w+H8xsvw6OkXoDGia+vPTblmpLvGBRaksTWhwdKAkI4tMOHzKvDjEtbAUuVfLfxQatCwRyoH+Ua7kyr2RqBnPd2DWfkkLT+mQPXVe2fD5xZ3jedPdeo1bLZ6t+c8/emBgI4YC1ZKUoToOXs9DT/Cr5I0jxJ3xOUVTHHTlf3dNihFgzGVRU7n8QVU22fsUbTAmEuisFq+AkAW8o6pn5InnV3t3FsEG8/H7BNtMfrsGLO//96MXJxBpwMoAdu37pXoHp0ZwUCb2uZaFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Db3pbPE4ZeneeyrhNVpYik7H8B7cgj6jDm6G29G7Qc=;
 b=JRHTFmdz2ddRFjQxwMv0NrweJ/Tf3lLGhE8exRFROhgIHkUe/2hssuNZXvLhhu1DzvH8LSmPJpFNnpK7RaCZNWmivZxRpvrwfKCBIwmsC0JRM++9bBBdt5tHubjOLvZExUnajA4WJfvakqbARbo2nSLKPgjt5B0DoNbnVHmvFHZmSVs14gZI+HKEb89kT15szD2RTKaedNRrZEjxoqppVOdeCDMNatdyKUs7X5nQS71t6CNoivcNnlvt5iUTiX/Szc+LncFcIGPtLZojGOwLWZpJ1R0SYiR7cE9+OlaEi2sfwU2VkCinjB7T3ICveqRwn4YcZ6WEi80YLeCag56Qaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Db3pbPE4ZeneeyrhNVpYik7H8B7cgj6jDm6G29G7Qc=;
 b=TBsNdwaHVIsRNqHVbGzTevajrTRf1LlNGjt5m+Kpgwjo5vspU1QbQzeiNSnPZnUTfOV2gvu+pw21x0juDtA/OnE8yCfrWoG7bwJwchlb2VZJOBgMmcyIrXzXcT6j5UG5HjO16tnKpt7cPg1yie1TNCwch0p93QB4EV2UNkbVT3M=
Received: from BN9PR03CA0604.namprd03.prod.outlook.com (2603:10b6:408:106::9)
 by SA3PR12MB7998.namprd12.prod.outlook.com (2603:10b6:806:320::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:43:06 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::76) by BN9PR03CA0604.outlook.office365.com
 (2603:10b6:408:106::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
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
 2023 10:42:56 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 16/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX10
Date: Wed, 4 Jan 2023 10:40:05 -0600
Message-ID: <20230104164042.30271-17-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|SA3PR12MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b6cd410-41d3-482a-f331-08daee72c196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: akCgCJLMbAZ/xum5dY994xfP+TBUcruhsJ2oYXLUDF/HEL0LWH/53D0UNN+knp3yckBh1OqQMp0N928kV0uNaGW8ui7G+B2VUBcl+jGnyi9B8ISfmlgCHEDnZKsUmYDYHFNhB+Ui7fCBngglVlmnXO1FUj+ZegSmXm8/RbO1UA9Zw7JcvgHedpD5ZFFEyCbs9BCFIh+30D/WbaqXSIiR2rpxVFN2Iuq+Hi6ey/BYkoNkzYzbSPrFcMWreNpvywscvGZEUEQXYVzR+7M1CKRlRQow9oebQMcgXu6Capn9kAdMnC2b8sqWhzC2SxFrsW0LqC5kdH08qml3KehnddD60Qz/3qHNOqi/bsWiEjWZEwQ7WFb/IJFj3Je1/q8+Ql3x/hhs4RNGDXekUNv5Qlb8PEDcjfXX31zWb+l8NN5neoSAtmJWi/4gR5Ty5Eu2mXLdOaaUQFGVEVe+MuhtZBlNKn6KGtuojeps/OZucbxW5OMbBy3l5g+UALMoiUhFSHdQXQPUj4oKGxqRc044IGilcZPI3xPU47kRIgwmXDMDrerL9JxlrP7QXGHQSIwqqZgdKSeZsuLLj2hRIENQI0jRZF5o+z+TpSg7KE0R3NDTaKL1YVOUGsag3vNShhDiiG3kmxpDJkyy261jgqUBCTZ75YUv1qUUsBsy3X/cB1l0ZX/optc/DLP9T2BC4+4YmyHd5fneNT9RQ46R1sgesPHUH1TI/vVmowHNY555EcFiTFm2cSgRw3nRSiMhfAkph3Pwtn3hbTHVMRbqnc2PsMejXQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(47076005)(426003)(336012)(26005)(16526019)(2616005)(1076003)(186003)(82310400005)(40480700001)(6666004)(83380400001)(7696005)(86362001)(36860700001)(36756003)(40460700003)(81166007)(82740400003)(356005)(8676002)(4326008)(41300700001)(2906002)(5660300002)(8936002)(44832011)(478600001)(110136005)(70206006)(316002)(54906003)(70586007)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:43:06.5736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6cd410-41d3-482a-f331-08daee72c196
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7998
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

The `amdgpu_ucode_request` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

The `amdgpu_ucode_release` helper is for symmetry on unload.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 71 ++++++++------------------
 1 file changed, 20 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 49d34c7bbf20..d36dd823a319 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -3891,18 +3891,12 @@ static int gfx_v10_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 
 static void gfx_v10_0_free_microcode(struct amdgpu_device *adev)
 {
-	release_firmware(adev->gfx.pfp_fw);
-	adev->gfx.pfp_fw = NULL;
-	release_firmware(adev->gfx.me_fw);
-	adev->gfx.me_fw = NULL;
-	release_firmware(adev->gfx.ce_fw);
-	adev->gfx.ce_fw = NULL;
-	release_firmware(adev->gfx.rlc_fw);
-	adev->gfx.rlc_fw = NULL;
-	release_firmware(adev->gfx.mec_fw);
-	adev->gfx.mec_fw = NULL;
-	release_firmware(adev->gfx.mec2_fw);
-	adev->gfx.mec2_fw = NULL;
+	amdgpu_ucode_release(adev->gfx.pfp_fw);
+	amdgpu_ucode_release(adev->gfx.me_fw);
+	amdgpu_ucode_release(adev->gfx.ce_fw);
+	amdgpu_ucode_release(adev->gfx.rlc_fw);
+	amdgpu_ucode_release(adev->gfx.mec_fw);
+	amdgpu_ucode_release(adev->gfx.mec2_fw);
 
 	kfree(adev->gfx.rlc.register_list_format);
 }
@@ -4030,41 +4024,31 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_PFP);
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.me_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_ME);
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.ce_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_CE);
 
 	if (!amdgpu_sriov_vf(adev)) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
-		err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
-		if (err)
-			goto out;
+		err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
 		/* don't check this.  There are apparently firmwares in the wild with
 		 * incorrect size in the header
 		 */
-		err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
+		if (err == -ENODEV)
+			goto out;
 		if (err)
 			dev_dbg(adev->dev,
 				"gfx10: amdgpu_ucode_validate() failed \"%s\"\n",
@@ -4078,21 +4062,15 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1);
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
+	err = amdgpu_ucode_request(adev, &adev->gfx.mec2_fw, fw_name);
 	if (!err) {
-		err = amdgpu_ucode_validate(adev->gfx.mec2_fw);
-		if (err)
-			goto out;
 		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
 		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2_JT);
 	} else {
@@ -4103,21 +4081,12 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 	gfx_v10_0_check_fw_write_wait(adev);
 out:
 	if (err) {
-		dev_err(adev->dev,
-			"gfx10: Failed to init firmware \"%s\"\n",
-			fw_name);
-		release_firmware(adev->gfx.pfp_fw);
-		adev->gfx.pfp_fw = NULL;
-		release_firmware(adev->gfx.me_fw);
-		adev->gfx.me_fw = NULL;
-		release_firmware(adev->gfx.ce_fw);
-		adev->gfx.ce_fw = NULL;
-		release_firmware(adev->gfx.rlc_fw);
-		adev->gfx.rlc_fw = NULL;
-		release_firmware(adev->gfx.mec_fw);
-		adev->gfx.mec_fw = NULL;
-		release_firmware(adev->gfx.mec2_fw);
-		adev->gfx.mec2_fw = NULL;
+		amdgpu_ucode_release(adev->gfx.pfp_fw);
+		amdgpu_ucode_release(adev->gfx.me_fw);
+		amdgpu_ucode_release(adev->gfx.ce_fw);
+		amdgpu_ucode_release(adev->gfx.rlc_fw);
+		amdgpu_ucode_release(adev->gfx.mec_fw);
+		amdgpu_ucode_release(adev->gfx.mec2_fw);
 	}
 
 	gfx_v10_0_check_gfxoff_flag(adev);
-- 
2.34.1

