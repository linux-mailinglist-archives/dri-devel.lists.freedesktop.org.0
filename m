Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD3465DA57
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBD210E575;
	Wed,  4 Jan 2023 16:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D7610E547;
 Wed,  4 Jan 2023 16:43:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hV0GGQk2zpqsEoGCpaBzKPP16zKPNEtPBpBkFI5pz2iSONMneDwhYCaXZbe5dTNRdo/z6+POYDo0flv7Qb+TtFE5Pb+UP2qu0SY0Fws4qPzg3qkW+AxuSvdsFU7rY+7vqinOFfs+g6rjzACOfKLzEridSMIO/zsVyZNxs7MMPpjZmWqJMg1eMRjv8X+3lXqHN9uyjRK19996f+4Eu7yV9crKMlD/Lvo1VOHlgDt+zXHIADYfV5XOH6lIROpJ6Ei+On25Af4z5mThA7iG2wcyUskIdTL6XwmKlEQWA3p/NmQgpHERXYYpF1o2x5+GpBPP1XEuu78oX2i8o9g/LCasMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8viU84SzRIoLLy3WbYfSdP8GnCVJQ5n7dtBoGNb2mnY=;
 b=PJhsjXmeexBjHz7ABK2XOSSE9h1M0+irE+Zjh+N1YjioYiII7F+q0vS2dRe6d1N1ma8Ray8SX0Cy2TGdSQ5DDaLuu1almoyagAz82IyBEstY75SsgqFVM1HAYdodjNfk3t5/X+zv6EIaD6vTQ4YX72v+v3kuUhGEMCjSHELAJrFwA9e1FHoXFjY47vSPpJzMDlkdbMpRSrcKBusRgO6iNHPtwDFfk7l6drje1lS7rdw7B1d6CEl1nUWZ8C30wHU62lo7BkNY/2e+AEWbslpbfMYQETTe3j0hJQTomPAGq3l8wS1LrbJ5+vjhYPX8bhwmr2qWA4seTfebSu6v6J42lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8viU84SzRIoLLy3WbYfSdP8GnCVJQ5n7dtBoGNb2mnY=;
 b=FC0QmiF9dxQcjZD3kz9HI3iTtrZhjnaWEO+nuPMZk652e7g9VHqNzcUXrpY7+ShEzpXTUBQfPuYSyqxNcSlr7GpdkJYCBafjmu+u3LBLYRnCG/PfUJgFGAy3ce/llvYHpwZnRcAEYAA8F5yYv3nFGwx/S9zXwe6Gobt+4MBZvZY=
Received: from BN9PR03CA0626.namprd03.prod.outlook.com (2603:10b6:408:106::31)
 by PH7PR12MB5925.namprd12.prod.outlook.com (2603:10b6:510:1d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:43:08 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::a3) by BN9PR03CA0626.outlook.office365.com
 (2603:10b6:408:106::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Wed, 4 Jan 2023 16:43:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:43:07 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:43:02 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 20/45] drm/amd: Parse both v1 and v2 TA microcode headers
 using same function
Date: Wed, 4 Jan 2023 10:40:09 -0600
Message-ID: <20230104164042.30271-21-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|PH7PR12MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce91735-9fcf-43ea-4ecd-08daee72c234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +nFAxvhDe1+AWAntDtfz+kan0U8b+ZF2U6BzYHbqSTGN2KSvfm84sYvRz36yt1NYto9AxtWgboihReWbx9820X0jjDLJeKZuDklsbbzMbo8QQTVtzV72Kx9/QWqywQHtros5q3hBSmdz8mWx+yMTEkcoS0v/y9ytZhm8Op5Z1R1VhhJW9ARKzZYav5IIwfLkDw+zdPe4l3jyt7yVYYFuI+7vb/iWVmzVlePgWRREB3hBj+UoQJcJSfIGaTyFaeLywenNRwziZ5Y7/hfjHsstICaAOeGqvPIT7vkOJfo9GeRiFxB8sP+7qh+88EOhVV4b3rY4WnbqZiPT6mBWuxmfosW++AbKCyB/y7ZtsRtw80Lm0uCwdpgczbFMHAdZX1z0VAE+YKmWkFxE4GznGXrMNHdmhF59o93P6vjU+J7nkJirQYcLf+rjQpzagRA0rxwbcyJ3ha93GJW2sfaZDj5r+llBp8myS3BsMI86sgZrjmRurCRDPVriSqcAqBhTboZnQn+fUKpKZInG4R2Lc/13J98zhZ0Fly3QAvAq+B6phNPdbv6CQ26pEg/FNKQuayL+8UuslpPdWSS4Q4JoILAY5hmh/UC0AxYA9OGc3QeOxAQX2n0D/8ZTho7q0ic640fCPE8M+oh3t5Vs+VR+80Zb01HBnTuB23GU4RixXDb0xXYsliV/tfGwDQt/5yAxDmTB5DiSzcrlcjQDlvEG9tSgi7jMl2riL+rmVGwERuui1Hc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(16526019)(26005)(186003)(1076003)(2616005)(478600001)(110136005)(7696005)(36860700001)(70586007)(70206006)(8676002)(4326008)(8936002)(47076005)(41300700001)(426003)(336012)(30864003)(83380400001)(44832011)(5660300002)(2906002)(40480700001)(82740400003)(356005)(81166007)(86362001)(40460700003)(316002)(54906003)(36756003)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:43:07.7924 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce91735-9fcf-43ea-4ecd-08daee72c234
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5925
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

Several IP versions duplicate code and can't use the common helpers.
Move this code into a single function so that the helpers can be used.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 120 ++++++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c  |   2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c  |  60 +-----------
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c  |  74 ++-------------
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c  |  62 +-----------
 5 files changed, 107 insertions(+), 211 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 7a2fc920739b..d971e3785eaf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -3272,41 +3272,75 @@ static int parse_ta_bin_descriptor(struct psp_context *psp,
 	return 0;
 }
 
-int psp_init_ta_microcode(struct psp_context *psp,
-			  const char *chip_name)
+static int parse_ta_v1_microcode(struct psp_context *psp)
 {
+	const struct ta_firmware_header_v1_0 *ta_hdr;
 	struct amdgpu_device *adev = psp->adev;
-	char fw_name[PSP_FW_NAME_LEN];
-	const struct ta_firmware_header_v2_0 *ta_hdr;
-	int err = 0;
-	int ta_index = 0;
 
-	if (!chip_name) {
-		dev_err(adev->dev, "invalid chip name for ta microcode\n");
+	ta_hdr = (const struct ta_firmware_header_v1_0 *)
+			 adev->psp.ta_fw->data;
+
+	if (le16_to_cpu(ta_hdr->header.header_version_major) != 1)
 		return -EINVAL;
+
+	adev->psp.xgmi_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->xgmi.fw_version);
+	adev->psp.xgmi_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->xgmi.size_bytes);
+	adev->psp.xgmi_context.context.bin_desc.start_addr =
+		(uint8_t *)ta_hdr +
+		le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
+	adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
+	adev->psp.ras_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->ras.fw_version);
+	adev->psp.ras_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->ras.size_bytes);
+	adev->psp.ras_context.context.bin_desc.start_addr =
+		(uint8_t *)adev->psp.xgmi_context.context.bin_desc.start_addr +
+		le32_to_cpu(ta_hdr->ras.offset_bytes);
+	adev->psp.hdcp_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->hdcp.fw_version);
+	adev->psp.hdcp_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->hdcp.size_bytes);
+	adev->psp.hdcp_context.context.bin_desc.start_addr =
+		(uint8_t *)ta_hdr +
+		le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
+	adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
+	adev->psp.dtm_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->dtm.fw_version);
+	adev->psp.dtm_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->dtm.size_bytes);
+	adev->psp.dtm_context.context.bin_desc.start_addr =
+		(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
+		le32_to_cpu(ta_hdr->dtm.offset_bytes);
+	if (adev->apu_flags & AMD_APU_IS_RENOIR) {
+		adev->psp.securedisplay_context.context.bin_desc.fw_version =
+			le32_to_cpu(ta_hdr->securedisplay.fw_version);
+		adev->psp.securedisplay_context.context.bin_desc.size_bytes =
+			le32_to_cpu(ta_hdr->securedisplay.size_bytes);
+		adev->psp.securedisplay_context.context.bin_desc.start_addr =
+			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
+			le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
 	}
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
-	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
+	return 0;
+}
 
-	err = amdgpu_ucode_validate(adev->psp.ta_fw);
-	if (err)
-		goto out;
+static int parse_ta_v2_microcode(struct psp_context *psp)
+{
+	const struct ta_firmware_header_v2_0 *ta_hdr;
+	struct amdgpu_device *adev = psp->adev;
+	int err = 0;
+	int ta_index = 0;
 
 	ta_hdr = (const struct ta_firmware_header_v2_0 *)adev->psp.ta_fw->data;
 
-	if (le16_to_cpu(ta_hdr->header.header_version_major) != 2) {
-		dev_err(adev->dev, "unsupported TA header version\n");
-		err = -EINVAL;
-		goto out;
-	}
+	if (le16_to_cpu(ta_hdr->header.header_version_major) != 2)
+		return -EINVAL;
 
 	if (le32_to_cpu(ta_hdr->ta_fw_bin_count) >= UCODE_MAX_PSP_PACKAGING) {
 		dev_err(adev->dev, "packed TA count exceeds maximum limit\n");
-		err = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	for (ta_index = 0; ta_index < le32_to_cpu(ta_hdr->ta_fw_bin_count); ta_index++) {
@@ -3314,14 +3348,46 @@ int psp_init_ta_microcode(struct psp_context *psp,
 					      &ta_hdr->ta_fw_bin[ta_index],
 					      ta_hdr);
 		if (err)
-			goto out;
+			return err;
 	}
 
 	return 0;
-out:
-	dev_err(adev->dev, "fail to initialize ta microcode\n");
-	release_firmware(adev->psp.ta_fw);
-	adev->psp.ta_fw = NULL;
+}
+
+int psp_init_ta_microcode(struct psp_context *psp, const char *chip_name)
+{
+	const struct common_firmware_header *hdr;
+	struct amdgpu_device *adev = psp->adev;
+	char fw_name[PSP_FW_NAME_LEN];
+	int err;
+
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
+	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
+	if (err)
+		return err;
+	err = amdgpu_ucode_validate(adev->psp.ta_fw);
+	if (err)
+		return err;
+
+	hdr = (const struct common_firmware_header *)adev->psp.ta_fw->data;
+	switch (le16_to_cpu(hdr->header_version_major)) {
+	case 1:
+		err = parse_ta_v1_microcode(psp);
+		break;
+	case 2:
+		err = parse_ta_v2_microcode(psp);
+		break;
+	default:
+		dev_err(adev->dev, "unsupported TA header version\n");
+		err = -EINVAL;
+	}
+
+	if (err) {
+		dev_err(adev->dev, "fail to initialize ta microcode\n");
+		release_firmware(adev->psp.ta_fw);
+		adev->psp.ta_fw = NULL;
+	}
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 28efea3b9070..0031a199121f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -446,7 +446,7 @@ static int gfx_v11_0_init_toc_microcode(struct amdgpu_device *adev, char *ucode_
 	char fw_name[40];
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", ucode_prefix);
-	err = amdgpu_ucode_load(adev, &adev->psp.toc_fw, fw_name);
+	err = amdgpu_ucode_request(adev, &adev->psp.toc_fw, fw_name);
 	if (err)
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
index 9de46fa8f46c..7fb48c1dec71 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
@@ -48,9 +48,8 @@ static int psp_v10_0_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
 	const char *chip_name;
-	char fw_name[30];
+	char ucode_prefix[30];
 	int err = 0;
-	const struct ta_firmware_header_v1_0 *ta_hdr;
 	DRM_DEBUG("\n");
 
 	switch (adev->asic_type) {
@@ -64,66 +63,13 @@ static int psp_v10_0_init_microcode(struct psp_context *psp)
 		break;
 	default: BUG();
 	}
+	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 	err = psp_init_asd_microcode(psp, chip_name);
 	if (err)
 		goto out;
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
-	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-	if (err) {
-		release_firmware(adev->psp.ta_fw);
-		adev->psp.ta_fw = NULL;
-		dev_info(adev->dev,
-			 "psp v10.0: Failed to load firmware \"%s\"\n",
-			 fw_name);
-	} else {
-		err = amdgpu_ucode_validate(adev->psp.ta_fw);
-		if (err)
-			goto out2;
-
-		ta_hdr = (const struct ta_firmware_header_v1_0 *)
-				 adev->psp.ta_fw->data;
-		adev->psp.hdcp_context.context.bin_desc.fw_version =
-			le32_to_cpu(ta_hdr->hdcp.fw_version);
-		adev->psp.hdcp_context.context.bin_desc.size_bytes =
-			le32_to_cpu(ta_hdr->hdcp.size_bytes);
-		adev->psp.hdcp_context.context.bin_desc.start_addr =
-			(uint8_t *)ta_hdr +
-			le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
-
-		adev->psp.dtm_context.context.bin_desc.fw_version =
-			le32_to_cpu(ta_hdr->dtm.fw_version);
-		adev->psp.dtm_context.context.bin_desc.size_bytes =
-			le32_to_cpu(ta_hdr->dtm.size_bytes);
-		adev->psp.dtm_context.context.bin_desc.start_addr =
-			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
-			le32_to_cpu(ta_hdr->dtm.offset_bytes);
-
-		adev->psp.securedisplay_context.context.bin_desc.fw_version =
-			le32_to_cpu(ta_hdr->securedisplay.fw_version);
-		adev->psp.securedisplay_context.context.bin_desc.size_bytes =
-			le32_to_cpu(ta_hdr->securedisplay.size_bytes);
-		adev->psp.securedisplay_context.context.bin_desc.start_addr =
-			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
-			le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
-
-		adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
-	}
-
-	return 0;
-
-out2:
-	release_firmware(adev->psp.ta_fw);
-	adev->psp.ta_fw = NULL;
-out:
-	if (err) {
-		dev_err(adev->dev,
-			"psp v10.0: Failed to load firmware \"%s\"\n",
-			fw_name);
-	}
-
-	return err;
+	return psp_init_ta_microcode(psp, ucode_prefix);
 }
 
 static int psp_v10_0_ring_create(struct psp_context *psp,
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index bd3e3e23a939..5f140b7c30d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -129,6 +129,7 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 	default:
 		BUG();
 	}
+	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 
 	switch (adev->ip_versions[MP0_HWIP][0]) {
@@ -140,35 +141,9 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 		err = psp_init_asd_microcode(psp, chip_name);
 		if (err)
 			return err;
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
-		err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-		if (err) {
-			release_firmware(adev->psp.ta_fw);
-			adev->psp.ta_fw = NULL;
-			dev_info(adev->dev,
-				 "psp v11.0: Failed to load firmware \"%s\"\n", fw_name);
-		} else {
-			err = amdgpu_ucode_validate(adev->psp.ta_fw);
-			if (err)
-				goto out2;
-
-			ta_hdr = (const struct ta_firmware_header_v1_0 *)adev->psp.ta_fw->data;
-			adev->psp.xgmi_context.context.bin_desc.fw_version =
-				le32_to_cpu(ta_hdr->xgmi.fw_version);
-			adev->psp.xgmi_context.context.bin_desc.size_bytes =
-				le32_to_cpu(ta_hdr->xgmi.size_bytes);
-			adev->psp.xgmi_context.context.bin_desc.start_addr =
-				(uint8_t *)ta_hdr +
-				le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
-			adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
-			adev->psp.ras_context.context.bin_desc.fw_version =
-				le32_to_cpu(ta_hdr->ras.fw_version);
-			adev->psp.ras_context.context.bin_desc.size_bytes =
-				le32_to_cpu(ta_hdr->ras.size_bytes);
-			adev->psp.ras_context.context.bin_desc.start_addr =
-				(uint8_t *)adev->psp.xgmi_context.context.bin_desc.start_addr +
-				le32_to_cpu(ta_hdr->ras.offset_bytes);
-		}
+		err = psp_init_ta_microcode(psp, ucode_prefix);
+		if (err)
+			return err;
 		break;
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 5):
@@ -179,39 +154,9 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 		err = psp_init_asd_microcode(psp, chip_name);
 		if (err)
 			return err;
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
-		err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-		if (err) {
-			release_firmware(adev->psp.ta_fw);
-			adev->psp.ta_fw = NULL;
-			dev_info(adev->dev,
-				 "psp v11.0: Failed to load firmware \"%s\"\n", fw_name);
-		} else {
-			err = amdgpu_ucode_validate(adev->psp.ta_fw);
-			if (err)
-				goto out2;
-
-			ta_hdr = (const struct ta_firmware_header_v1_0 *)adev->psp.ta_fw->data;
-			adev->psp.hdcp_context.context.bin_desc.fw_version =
-				le32_to_cpu(ta_hdr->hdcp.fw_version);
-			adev->psp.hdcp_context.context.bin_desc.size_bytes =
-				le32_to_cpu(ta_hdr->hdcp.size_bytes);
-			adev->psp.hdcp_context.context.bin_desc.start_addr =
-				(uint8_t *)ta_hdr +
-				le32_to_cpu(
-					ta_hdr->header.ucode_array_offset_bytes);
-
-			adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
-
-			adev->psp.dtm_context.context.bin_desc.fw_version =
-				le32_to_cpu(ta_hdr->dtm.fw_version);
-			adev->psp.dtm_context.context.bin_desc.size_bytes =
-				le32_to_cpu(ta_hdr->dtm.size_bytes);
-			adev->psp.dtm_context.context.bin_desc.start_addr =
-				(uint8_t *)adev->psp.hdcp_context.context
-					.bin_desc.start_addr +
-				le32_to_cpu(ta_hdr->dtm.offset_bytes);
-		}
+		err = psp_init_ta_microcode(psp, ucode_prefix);
+		if (err)
+			return err;
 		break;
 	case IP_VERSION(11, 0, 7):
 	case IP_VERSION(11, 0, 11):
@@ -237,11 +182,6 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 	}
 
 	return 0;
-
-out2:
-	release_firmware(adev->psp.ta_fw);
-	adev->psp.ta_fw = NULL;
-	return err;
 }
 
 static int psp_v11_0_wait_for_bootloader(struct psp_context *psp)
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
index 8ed2281b6557..634fa2822d8a 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
@@ -49,9 +49,8 @@ static int psp_v12_0_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
 	const char *chip_name;
-	char fw_name[30];
+	char ucode_prefix[30];
 	int err = 0;
-	const struct ta_firmware_header_v1_0 *ta_hdr;
 	DRM_DEBUG("\n");
 
 	switch (adev->asic_type) {
@@ -64,67 +63,12 @@ static int psp_v12_0_init_microcode(struct psp_context *psp)
 	default:
 		BUG();
 	}
+	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 	err = psp_init_asd_microcode(psp, chip_name);
 	if (err)
 		return err;
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
-	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-	if (err) {
-		release_firmware(adev->psp.ta_fw);
-		adev->psp.ta_fw = NULL;
-		dev_info(adev->dev,
-			 "psp v12.0: Failed to load firmware \"%s\"\n",
-			 fw_name);
-	} else {
-		err = amdgpu_ucode_validate(adev->psp.ta_fw);
-		if (err)
-			goto out;
-
-		ta_hdr = (const struct ta_firmware_header_v1_0 *)
-				 adev->psp.ta_fw->data;
-		adev->psp.hdcp_context.context.bin_desc.fw_version =
-			le32_to_cpu(ta_hdr->hdcp.fw_version);
-		adev->psp.hdcp_context.context.bin_desc.size_bytes =
-			le32_to_cpu(ta_hdr->hdcp.size_bytes);
-		adev->psp.hdcp_context.context.bin_desc.start_addr =
-			(uint8_t *)ta_hdr +
-			le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
-
-		adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
-
-		adev->psp.dtm_context.context.bin_desc.fw_version =
-			le32_to_cpu(ta_hdr->dtm.fw_version);
-		adev->psp.dtm_context.context.bin_desc.size_bytes =
-			le32_to_cpu(ta_hdr->dtm.size_bytes);
-		adev->psp.dtm_context.context.bin_desc.start_addr =
-			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
-			le32_to_cpu(ta_hdr->dtm.offset_bytes);
-
-		if (adev->apu_flags & AMD_APU_IS_RENOIR) {
-			adev->psp.securedisplay_context.context.bin_desc.fw_version =
-				le32_to_cpu(ta_hdr->securedisplay.fw_version);
-			adev->psp.securedisplay_context.context.bin_desc.size_bytes =
-				le32_to_cpu(ta_hdr->securedisplay.size_bytes);
-			adev->psp.securedisplay_context.context.bin_desc.start_addr =
-				(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
-				le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
-		}
-	}
-
-	return 0;
-
-out:
-	release_firmware(adev->psp.ta_fw);
-	adev->psp.ta_fw = NULL;
-	if (err) {
-		dev_err(adev->dev,
-			"psp v12.0: Failed to load firmware \"%s\"\n",
-			fw_name);
-	}
-
-	return err;
+	return psp_init_ta_microcode(psp, ucode_prefix);
 }
 
 static int psp_v12_0_bootloader_load_sysdrv(struct psp_context *psp)
-- 
2.34.1

