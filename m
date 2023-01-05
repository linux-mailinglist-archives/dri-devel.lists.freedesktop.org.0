Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD44365F1D1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7921C10E784;
	Thu,  5 Jan 2023 17:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30D110E778;
 Thu,  5 Jan 2023 17:02:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyrHdVDSxUPriaBCqX1FXIXchJZL0toSmTFEJ5Sp8M7TOrEMFeNDqPtrrgv2xsUCtJMM9qS7hWuenYBW/KKP+nYlCVW4GthFO8k5QkjclEx02paG6J7IyPwomF7TVUN7VLgGXEk7gBNGzG1DHV5EOONagV/mU2T68kuX2AvSCATD16O6BdEYH446jxL29N5yQhtbMGPWL5fFIs8CXdGszdiyOtFbLIqaQL3Q6w36ccYBWamw7hSTf2qnvXX5a1eEVQvGb892pbevt8cGjJDG8DzgdqNhS4QB9eC4RfRw4ilELb9uZoUUSqjGoBNLGAaqd7zRvAYEhjLAvMmth4Qi5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xECfeOV7rPIK3HA3QETg4zWjWVz7viTvEkGTyXJaOZU=;
 b=nMwDXdGK1iXeIrwi39lYcqRjf4AE1tqX9iTKMw20dC88IuLthG9Cr3sHvQXlVEXl6UIDh0T6E26/GzzHnN9xtp77Z/vHH3RHp1du/g1dtL1RlrP+QhbUS3bl79ygoQuE9F/yQD2Rio56YH7k1kNf47To94vvc3gs3yRRgZi5E53euLNZ7JwMLle5HjyVjPyrbQPgqpWqc8nxjcANRvmg/m0Uy0YGdd2mbylGbXW3yyNcMlxLQKkKSIwg2FN6ioN1S1sFNJvCg5tWTy2CW+zdAfO1tUG1q5qgQdZAIEFtSZ6UVlDfE0RwxKXy/NAXLxzA9Rn/x5S+WiueMqjExA5IvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xECfeOV7rPIK3HA3QETg4zWjWVz7viTvEkGTyXJaOZU=;
 b=uwyCBXDC1ScHfaWbLNLBj7sv3LqzOdqPAyKuzdsnti9+gdkXBzxCSYcAkbyvOIkxTcEaTRfNfF8jwP1FAxYErfFABbMqG3Z7OMvWICjxBmY+OGI5vQ7LLw0GbQ4h4txJLwwUAL6SyY6YgiT57qifa9KmHD3nLcSO0Bz8NLOXIAI=
Received: from BN9PR03CA0390.namprd03.prod.outlook.com (2603:10b6:408:f7::35)
 by CY5PR12MB6107.namprd12.prod.outlook.com (2603:10b6:930:28::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:19 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::8) by BN9PR03CA0390.outlook.office365.com
 (2603:10b6:408:f7::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 17:02:18 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:17 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 16/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX10
Date: Thu, 5 Jan 2023 11:01:02 -0600
Message-ID: <20230105170138.717-17-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|CY5PR12MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c035280-34eb-4707-b8ae-08daef3e9aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0qq3pD2YjEtzp5BcGcqKtgIpx/b/PkjVpLiha9EgROBCeI4NygRR6qA3RngQzFGNgVAT3kvjKUHwclhO63mFgEksuEgc+vMThuZgleX9xBRZQDkdgeHlahBQ0vNpP1xvDlb5wZiKJ0MdD3mZK0nmhX6omMUXleGloaioh+0DfPsCfKNfB3pl2tv+oxTaT1gWJkhbd74e51yr/tASOV7f+lEXrFWedIVKrrB8CxeNrMG/oGWVkSgpvn4SplM8PDu6llwegEcQWIeuw7fd8eTDvAnzfv9IP1t6O4z2+uBkxjCjdxth9W39b3IqPa6DzWghFV9ux99VJ+nJkA6uooXDnDxuIlsYZQtkCzqEs3ixpeBDpN54B7/i2hV6zS76hRaNuJxH1UVHtd1Xunye0+qFKyvysp3tI1liafrboXefXiKjZ9NPHbY5gk+oiE4ielIQ+EFKtVPfKQKvKP6P4ksBt/1QuUuc21XryLC/W+aKUs5UDf2//VDg6epykEtmFTI2IzFUMVKNYNCyyFfQqV1BcFD1OVQSkWHZMgiQwfMoYwFmrokoYDhmRzD4SxRJHY9x/jGtPqZNBNCGa4LPeKRIPfVuxr9owBEIY/kl0FQpnsGoFXIwI5DajINcxwRKxXFGZym/7f8PbthQwGtMtHJ3vjp+0NF+TMvYY2/DVGEteFIYExxT03ImZHEEDDt1f6IRUwoqjK30gn9/WaGLJc6Xu0zHB226RUE2iNRdsx4t6vbYTQTqoI8ZJ2nz/dGVe92X/WK2ShOAFP+wvpLPJ1J9XQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(2906002)(82740400003)(40460700003)(86362001)(36756003)(47076005)(40480700001)(16526019)(110136005)(2616005)(316002)(82310400005)(81166007)(54906003)(356005)(6666004)(4326008)(1076003)(5660300002)(8676002)(336012)(83380400001)(478600001)(70586007)(70206006)(426003)(8936002)(41300700001)(186003)(26005)(7696005)(44832011)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:18.7702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c035280-34eb-4707-b8ae-08daef3e9aa9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6107
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

The `amdgpu_ucode_request` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

The `amdgpu_ucode_release` helper is for symmetry on unload.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 71 ++++++++------------------
 1 file changed, 20 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 49d34c7bbf20..140bb18ff768 100644
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
+	amdgpu_ucode_release(&adev->gfx.pfp_fw);
+	amdgpu_ucode_release(&adev->gfx.me_fw);
+	amdgpu_ucode_release(&adev->gfx.ce_fw);
+	amdgpu_ucode_release(&adev->gfx.rlc_fw);
+	amdgpu_ucode_release(&adev->gfx.mec_fw);
+	amdgpu_ucode_release(&adev->gfx.mec2_fw);
 
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
+		amdgpu_ucode_release(&adev->gfx.pfp_fw);
+		amdgpu_ucode_release(&adev->gfx.me_fw);
+		amdgpu_ucode_release(&adev->gfx.ce_fw);
+		amdgpu_ucode_release(&adev->gfx.rlc_fw);
+		amdgpu_ucode_release(&adev->gfx.mec_fw);
+		amdgpu_ucode_release(&adev->gfx.mec2_fw);
 	}
 
 	gfx_v10_0_check_gfxoff_flag(adev);
-- 
2.34.1

