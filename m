Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B94DD65E3E9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68CC10E66E;
	Thu,  5 Jan 2023 03:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4ED10E655;
 Thu,  5 Jan 2023 03:44:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oU/432kFmSfsxpBHca5Gp5U3ul8GUnLeD5eYQgfym/V3wBN2aqs7SWDnQipbqkQdeI5IikQE3VPo6phJ19ENRNNPH3pnAGWXJUFNEK2gcY241U1GJPj6PJUtNWDlfSeek/dwR2YNCYecjPjQPyZYc7fN9NW5F3Bx10ZoxR2lU23XqTe6JJbSyxEADM+jcPGu6con0GmZoY7ys+9Cr3v6cc/ssppVzxPUWyUSK3pMos8v2+N4/QTt+L0V0Y+Owgx3VQhbyCb3LiHYe08Pi8jjB2PlVogaJnZBLbjCvDc3ablMdr3CUyVePev3o1lH+JSvpLrX+DlOIpvXzmxj1ppYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kj2TJUbCVMDUsIKcMzMvPzhzasqJY/pSLYuFfHSL0Q=;
 b=lTjsY5i/jts3FpXLtLnB2v7MCN3gfPx/8/1TI8Qj7gKn9U4MqDNX+yN5af7NQhGjWxRBxVz7UiQlWMfo6pdKLQlstT9pZLzORoKKQJrqIp0I1Ly34CX89aPccLdWO3Z8XubxVbHCS8wpfVJJ8CcGFeWZ91EKIB/yzjEeMXIFpgMVyOSS/UwVkGjW2W0sfbDTJT0O9jO6E+K0EMLAxrUFs5X7y+wfksX1WgekNmdsE2zIaP6akHUKKCkY2O4i0yupNgJckoWBOIST/a6jzSYxR/POHMBdnNzuQkmWWt613kpTkBd8jmWD3yQx+7842i8J5z1RCtMJmlEkdPRtEmqcug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kj2TJUbCVMDUsIKcMzMvPzhzasqJY/pSLYuFfHSL0Q=;
 b=5P0wEW/hjwZXKAN/YNyYDduCArK6lPVupw52t/KcQkZHJfNf2S/zQcNTS6XKFDwC/dBcpLhMFGmGl0iB00pLNGoRqA7fOvH67L6rnARTkSxNlTNP8WqY2Q7vZl3iK2B2ljDU2iCuXFa5ihH+Rt+yJ2whnvPvNteysj8ZA2W972c=
Received: from BN9PR03CA0316.namprd03.prod.outlook.com (2603:10b6:408:112::21)
 by BN9PR12MB5163.namprd12.prod.outlook.com (2603:10b6:408:11c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:30 +0000
Received: from BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::8e) by BN9PR03CA0316.outlook.office365.com
 (2603:10b6:408:112::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT091.mail.protection.outlook.com (10.13.176.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:44:30 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:28 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 20/45] drm/amd: Parse both v1 and v2 TA microcode headers
 using same function
Date: Wed, 4 Jan 2023 21:42:54 -0600
Message-ID: <20230105034327.1439-21-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT091:EE_|BN9PR12MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: 423a7a56-5be1-4e59-cf6a-08daeecf26da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JEgQONuPTolf1DlR4oesoJWSmZYe1pUF6C7xAVL22fmdvl8nn1Ewvn744gTLwFPp/ZlepTpP1yEaa4U1VVhn8OGvaUbdIuno4l/gLek2Os+Zj0xSa1HsvLv5/K4910mx8RvbEcIKR7Cp/kK23cCAAlSwAeAYMEUofXxtZvFKCSZZhJMSqS3OrxKyjASitaxwpqgGP7zbA1DvW3jFCj/N9Xbsfaaa2R699ZlN1kCeJ+rPbOTkNhO0EGPTU6vqbL7scqAdLVIqnU3s5EG311zfzQxC8m85SrmDZC9F9QRm8XgeKkg7625cl3Y2Nhs9X1h2E17LN3K2boCRxW9RBry6KI9FTgid9sk7dnjcJhlHVMbyAcFEQP9yDJRAmQAtTruv9n9Cb5YpYsa9UBnH/dtwuRz2NFYO4OnYGA/D+qpTf0AieTVEw4Vx4nMV38snRJX4tnmmzkgu618NE4qyU6dtZA+HJpfmaB/HaxeeZm0dkG8z2ACTn+0lUCUhfNquXwuKMlg2/ATRaFyJiclsT+yVq5jIaAHJE0fj/vppci35n1HdNTTYr5Wxza1qK02C+kcf3agv6n1Fbx+DixuiPo/r+H1Dfmm21mbRZYc0bJO53NpEaDkNcju4paW/EgXJOBsF9O0R237yJbTGZcuGKWe/Q11a/qNogVXhx+yCQ1GyQk8z7tGtqTP4Yfc+yk30oI+zgh2gYWKr3b/sIKO+ZA8II35hjB2o+GfdLjmtJ8YU9ko=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(8676002)(4326008)(5660300002)(70586007)(6666004)(70206006)(40460700003)(316002)(41300700001)(8936002)(54906003)(2906002)(110136005)(478600001)(7696005)(81166007)(356005)(82740400003)(16526019)(26005)(47076005)(2616005)(426003)(186003)(336012)(1076003)(36860700001)(36756003)(40480700001)(86362001)(44832011)(30864003)(82310400005)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:30.3392 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 423a7a56-5be1-4e59-cf6a-08daeecf26da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5163
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

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Rebase on earlier patches
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 120 ++++++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c  |  64 +------------
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c  |  77 ++-------------
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c  |  62 +-----------
 4 files changed, 109 insertions(+), 214 deletions(-)

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
 
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
index 9de46fa8f46c..f14fcfb9c425 100644
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
 
-	err = psp_init_asd_microcode(psp, chip_name);
+	err = psp_init_asd_microcode(psp, ucode_prefix);
 	if (err)
-		goto out;
-
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
+		return err;
 
-	return err;
+	return psp_init_ta_microcode(psp, ucode_prefix);
 }
 
 static int psp_v10_0_ring_create(struct psp_context *psp,
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index bd3e3e23a939..21d20ca2377a 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -89,9 +89,8 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
 	const char *chip_name;
-	char fw_name[PSP_FW_NAME_LEN];
+	char ucode_prefix[30];
 	int err = 0;
-	const struct ta_firmware_header_v1_0 *ta_hdr;
 
 	DRM_DEBUG("\n");
 
@@ -129,6 +128,7 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 	default:
 		BUG();
 	}
+	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 
 	switch (adev->ip_versions[MP0_HWIP][0]) {
@@ -140,35 +140,9 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
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
@@ -179,39 +153,9 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
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
@@ -237,11 +181,6 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
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

