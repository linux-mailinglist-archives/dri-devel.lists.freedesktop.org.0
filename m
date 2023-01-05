Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34CA65F1F5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3230110E7A4;
	Thu,  5 Jan 2023 17:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A73310E78D;
 Thu,  5 Jan 2023 17:02:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JD1kaV5bUQTn/3RkUL68tqips5ySs90uiA696SVApdG9xBuLp6O1wpD/5IE4P9A3Kx0ix6dTrevI/FNfZo+3aRd7IXXa/bXI7Zx/qFfM4+139Pc3CADxntdtx4lYQofPUsyo6tNAhaqdKkYGLmPPDOWmnbUGC6M7b21id9qoK2lh7Rae4BB/qxfZkkmFHw1bHear8Qk5PdnbNNeyknfKJ9H2h5Vv+gt+VtgtPhez9rtEelGswo7SX/EaWVzheyiPFP/ujuYbjnNkGykllWFVhsSt+uEew80tTdC6lYYOH/c3/1fdjUfzrJpU+dMukFzKTozjcwl77GEirftyoaCLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1WYN48a8V8FnVsv0TSN1CAWctJHE+KQKSm+1wpWKuw=;
 b=AFG5hJ9qPkCS+d/HHpaBtiMd5EsvsaVv74fMVJj3dFPL9skumTTYjTUYmaLfFCDYaRGYdHGXFJPP4MwqrsVuFEVphnd7v/qcDmUU4aPLPIiOc5Kn8owHk90f+wVkyyBwGEWqDylf7a1sbdymg1NDulw4xCwax3psgCfgPzZTKR+M5Dj9UG4GulPWL7dI8bfqBOUCDQOUpyudkKo3lUI3yZc/9zJusppjr2Brf36thmB9LNiJTM/f8IwqO+ZTMzNeV89wqcQ8JAOaKoJrFpwSnxXtMFRkyQ6kdDQsEiZMlYPL/zmNfXPYtbdBaUvfYLlpha5QLmafPrcbJcPWOxNwWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1WYN48a8V8FnVsv0TSN1CAWctJHE+KQKSm+1wpWKuw=;
 b=AhjNdJ03jjCmgFNFdv4aJZD33nCWexxvNcxr6+HAF/PXx37I0UX/XsW6CTsoxdQ5JDrMB07gEt0Jrpdwc/Np6rdKNGBFdkTyErfHJSFb/mWNX2CcgZ9X2MeVm3RYzhAcNyeHPFaCC0ofuSFeI+9l6X6SRtQUd8P4Tr3WxmxfU/w=
Received: from BN9PR03CA0362.namprd03.prod.outlook.com (2603:10b6:408:f7::7)
 by CY8PR12MB7515.namprd12.prod.outlook.com (2603:10b6:930:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:30 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::bc) by BN9PR03CA0362.outlook.office365.com
 (2603:10b6:408:f7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 17:02:30 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:20 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 18/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX11
Date: Thu, 5 Jan 2023 11:01:04 -0600
Message-ID: <20230105170138.717-19-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|CY8PR12MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: e1fba8bb-05af-4cdc-4269-08daef3ea1ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nktarX3iF9v81XruivrIHFjlptoYDYWfIvCO5TvVjXekGjs71EUoYYLT1FTUFuYeIeNaU9Y+PpCLITzLeQ/bOsHreIm+Y1V2L6qX5scTGEwXeMf66Owu4d5zTb/Hk3msH656Td6zB8gemgmxOwOorGBb6vjx4KFs8yIZEAgjtlbP9BdD9a/wQ0kqNPNXLoe8qnSBXPeTHD8M9jE905Evl0zyt0CGdDgUAeAUi3PvUfJ56K5kTPoFgOQFzFntVzug6yIrwJjj/d+1DHQ0s2LGnXxIKUMoO+enYqMGS897A0fAz1Ejg3mvZDlvsg/iiUSsYPubtPRVuyzPq/g7mGT16OAJyPaWFHuD9j2th9eCGuXGWM4OANsT3hPWW0WonMmgWqhFoTo9SY/C0VEqb3qDAAvpNDymcTFvVLhaGFuSFAVsqujB7XuLP5v3I3jK8csXkOiT1i4loqdSVkgdovjOOfaj76+iWT9mGUXJEaIZLPDyGmLGM3NJVFagXrXMfTAc4158B2a+p/35FnUv542DJJdBnmvbyr51Ecq+evO8wS7FwQ6BsIiuLMLG9Oa8AR3AteYYhh3Dx6wAz7wE4HGXq4vprzILK6Ql+imNSu1Xqo57TMOEK8z6W5gBSBwGcS9llbm08Oqwo/Njw+LppuuUgM2RXDxI56v0NP/0cGNotz8KHCy3Xvpo3eT1N0RpVu+FSQcSruJO5XMplAumUCyYywLF5seFtsddxBulhcoMC4r4F2Ii+8QIhSN27jYNc1BR2TK6Di7JQbt7STxJsBSuJQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(46966006)(36840700001)(40470700004)(1076003)(70206006)(426003)(4326008)(81166007)(47076005)(70586007)(8676002)(2616005)(36756003)(41300700001)(336012)(40460700003)(316002)(54906003)(356005)(110136005)(2906002)(86362001)(36860700001)(82310400005)(5660300002)(82740400003)(83380400001)(40480700001)(8936002)(7696005)(478600001)(16526019)(186003)(26005)(6666004)(44832011)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:30.7537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fba8bb-05af-4cdc-4269-08daef3ea1ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7515
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

The `amdgpu_ucode_release` helper will provide symmetery on unload.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 104 +++++++++----------------
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c |   7 +-
 2 files changed, 39 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index a56c6e106d00..d4f67624d05b 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -431,18 +431,39 @@ static int gfx_v11_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 
 static void gfx_v11_0_free_microcode(struct amdgpu_device *adev)
 {
-	release_firmware(adev->gfx.pfp_fw);
-	adev->gfx.pfp_fw = NULL;
-	release_firmware(adev->gfx.me_fw);
-	adev->gfx.me_fw = NULL;
-	release_firmware(adev->gfx.rlc_fw);
-	adev->gfx.rlc_fw = NULL;
-	release_firmware(adev->gfx.mec_fw);
-	adev->gfx.mec_fw = NULL;
+	amdgpu_ucode_release(&adev->gfx.pfp_fw);
+	amdgpu_ucode_release(&adev->gfx.me_fw);
+	amdgpu_ucode_release(&adev->gfx.rlc_fw);
+	amdgpu_ucode_release(&adev->gfx.mec_fw);
 
 	kfree(adev->gfx.rlc.register_list_format);
 }
 
+static int gfx_v11_0_init_toc_microcode(struct amdgpu_device *adev)
+{
+	const struct psp_firmware_header_v1_0 *toc_hdr;
+	int err = 0;
+	char fw_name[40];
+	char ucode_prefix[30];
+
+	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", ucode_prefix);
+	err = amdgpu_ucode_request(adev, &adev->psp.toc_fw, fw_name);
+	if (err)
+		goto out;
+
+	toc_hdr = (const struct psp_firmware_header_v1_0 *)adev->psp.toc_fw->data;
+	adev->psp.toc.fw_version = le32_to_cpu(toc_hdr->header.ucode_version);
+	adev->psp.toc.feature_version = le32_to_cpu(toc_hdr->sos.fw_version);
+	adev->psp.toc.size_bytes = le32_to_cpu(toc_hdr->header.ucode_size_bytes);
+	adev->psp.toc.start_addr = (uint8_t *)toc_hdr +
+				le32_to_cpu(toc_hdr->header.ucode_array_offset_bytes);
+	return 0;
+out:
+	amdgpu_ucode_release(&adev->psp.toc_fw);
+	return err;
+}
+
 static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 {
 	char fw_name[40];
@@ -457,10 +478,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
-	err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
 	if (err)
 		goto out;
 	/* check pfp fw hdr version to decide if enable rs64 for gfx11.*/
@@ -477,10 +495,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
-	err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.me_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 	if (err)
 		goto out;
 	if (adev->gfx.rs64_enable) {
@@ -493,10 +508,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 
 	if (!amdgpu_sriov_vf(adev)) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
-		err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
-		if (err)
-			goto out;
-		err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
+		err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
 		if (err)
 			goto out;
 		rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
@@ -508,10 +520,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
-	err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
 	if (err)
 		goto out;
 	if (adev->gfx.rs64_enable) {
@@ -530,54 +539,15 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 
 out:
 	if (err) {
-		dev_err(adev->dev,
-			"gfx11: Failed to init firmware \"%s\"\n",
-			fw_name);
-		release_firmware(adev->gfx.pfp_fw);
-		adev->gfx.pfp_fw = NULL;
-		release_firmware(adev->gfx.me_fw);
-		adev->gfx.me_fw = NULL;
-		release_firmware(adev->gfx.rlc_fw);
-		adev->gfx.rlc_fw = NULL;
-		release_firmware(adev->gfx.mec_fw);
-		adev->gfx.mec_fw = NULL;
+		amdgpu_ucode_release(&adev->gfx.pfp_fw);
+		amdgpu_ucode_release(&adev->gfx.me_fw);
+		amdgpu_ucode_release(&adev->gfx.rlc_fw);
+		amdgpu_ucode_release(&adev->gfx.mec_fw);
 	}
 
 	return err;
 }
 
-static int gfx_v11_0_init_toc_microcode(struct amdgpu_device *adev)
-{
-	const struct psp_firmware_header_v1_0 *toc_hdr;
-	int err = 0;
-	char fw_name[40];
-	char ucode_prefix[30];
-
-	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", ucode_prefix);
-	err = request_firmware(&adev->psp.toc_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
-	err = amdgpu_ucode_validate(adev->psp.toc_fw);
-	if (err)
-		goto out;
-
-	toc_hdr = (const struct psp_firmware_header_v1_0 *)adev->psp.toc_fw->data;
-	adev->psp.toc.fw_version = le32_to_cpu(toc_hdr->header.ucode_version);
-	adev->psp.toc.feature_version = le32_to_cpu(toc_hdr->sos.fw_version);
-	adev->psp.toc.size_bytes = le32_to_cpu(toc_hdr->header.ucode_size_bytes);
-	adev->psp.toc.start_addr = (uint8_t *)toc_hdr +
-				le32_to_cpu(toc_hdr->header.ucode_array_offset_bytes);
-	return 0;
-out:
-	dev_err(adev->dev, "Failed to load TOC microcode\n");
-	release_firmware(adev->psp.toc_fw);
-	adev->psp.toc_fw = NULL;
-	return err;
-}
-
 static u32 gfx_v11_0_get_csb_size(struct amdgpu_device *adev)
 {
 	u32 count = 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
index 95548c512f4f..ed0d368149aa 100644
--- a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
@@ -49,10 +49,7 @@ static int imu_v11_0_init_microcode(struct amdgpu_device *adev)
 	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_imu.bin", ucode_prefix);
-	err = request_firmware(&adev->gfx.imu_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.imu_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.imu_fw, fw_name);
 	if (err)
 		goto out;
 	imu_hdr = (const struct imu_firmware_header_v1_0 *)adev->gfx.imu_fw->data;
@@ -77,7 +74,7 @@ static int imu_v11_0_init_microcode(struct amdgpu_device *adev)
 		dev_err(adev->dev,
 			"gfx11: Failed to load firmware \"%s\"\n",
 			fw_name);
-		release_firmware(adev->gfx.imu_fw);
+		amdgpu_ucode_release(&adev->gfx.imu_fw);
 	}
 
 	return err;
-- 
2.34.1

