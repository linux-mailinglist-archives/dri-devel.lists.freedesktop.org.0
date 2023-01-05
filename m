Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26CE65F1E3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC2910E79E;
	Thu,  5 Jan 2023 17:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2043.outbound.protection.outlook.com [40.107.95.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474E710E78F;
 Thu,  5 Jan 2023 17:02:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=og6mnijsUf6pkHFA33ksfTSTphRwlx5/FL7c23yruHllA4FM8gdShFN2CMNONs1AOq4S0dSAjxpvvDQI9wRrDm68e9IFm9oD9GDOmKfvumAPkSWyLZJ7bHZKt+HU0ybgVOK6XkIdulI41Hybze7kJGO6gRb4w3PeKMyFOiSnWpymzYbrNrJLSc+4hHLk9gwmrU5/bvSUsDv41Q4vCc//LAPu4E34OCR7WH/oBm6VFBWEmO4kcw3K9KXIsmmP0/7G3YW2K3KvmlidtiLChVYhQNoiCaBM6vhmdeiGpnjMT0UokpB7WEIjUZBq9vvzZrFzuL0ED6zPNTTitxL04//bIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQqh8mUHpk5Ga21kP5C53mZvkDqNDYuD0UBWgX2JvE8=;
 b=ZLrT7QMomww7B55JMKQO0I3u717xpO9bEmav+VTuIdXhdGz6Pxwamn1z+6V5K+7Snuma4V2Xx8yy4J1Voo3KRZNOSkP+nU+PliOHIDYRvs0pzZIdgTmddTqWFivMkYxmj1EWUvSXKITNseV5V4h2ZJGx2+saRWiL82gFJzVLkazhpj/I87HUYf7kcEXOQcE/xxK4Uped+qZVdqe9L6+hgvTZgeGFgJC4Vcu1IUCSsQeT9LIqU+PkeAyniylm6qmsdS3j7pLVzlVdFjcdEqUYZ6TUwi9UbmwHn9dvWMHcQ+G/QfLoSshV2wSe/A9rnHFKMdWkPCjbiMjdSTdfMS+xnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQqh8mUHpk5Ga21kP5C53mZvkDqNDYuD0UBWgX2JvE8=;
 b=yCbZ65+eAbOTtGqQ7PZDVJBjXUg5NxVYeF1MpM9ktikiBeyu88WRfOpX/1JGN2IXMc0O9o/YNBqmC6I3+/s+3jyUZHnSBA5JdnL5rTAILvVbmT1qRxyfJfAAiDvbzY0kl0ZHp5nqKHB7Jxtp2wbGnUa+M7PTMF27ygnJ9FxfBYM=
Received: from BN0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:408:e6::15)
 by BY1PR12MB8448.namprd12.prod.outlook.com (2603:10b6:a03:534::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:34 +0000
Received: from BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::88) by BN0PR03CA0010.outlook.office365.com
 (2603:10b6:408:e6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT079.mail.protection.outlook.com (10.13.177.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:34 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:22 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 20/45] drm/amd: Parse both v1 and v2 TA microcode headers
 using same function
Date: Thu, 5 Jan 2023 11:01:06 -0600
Message-ID: <20230105170138.717-21-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT079:EE_|BY1PR12MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba4060e-7ecd-4514-9951-08daef3ea40e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K9g7GGRSZPDuOhGG83j1RloIdChzXVSfPe3MF50D67/ym6CT31kpoWfeQ4eiU/2npGOZjed9OsUnWgqxjEz2IKWMUfAcBMcbj8+ZWpKooqzWzWjm4m4SMcq/hYnKew+Ya00OWPyOZL6YZifl0Q2lyF0RzN6BX/VA28rF0qEeBmJ0ZrENInAWX0hU2uxPH9mm0dZOQHij57SCg+mMSD2F26gXKXaOTGGI+3o+myBPULNVtnlmMAJRnKOJpzV2rFPkx3TfP/UcKBMfyCBPYMPAASUfpa1bRDSiC0wiwwzp19NsSfIll+zVQ/20Ej3WxtPXEcBuvEF/X/kOpBNbScld3PY/NFJKpPfmbcJiPoWIToGLNvjQI7p6h0FvNXqJM/28Liod9DVkNSg0JJyXT0hTDjUJ8eZXQrFJV5Z7L9WpG65wsYD6QQpp4wF1BLuRLMp3ELf3xLMpzL6cgyQQdh0m4TLVdy8bf2xWTFxEdhLJV5LnanzK2KpsXsfB0YI7lP59HHHeUh8vYn65Jmy0kBbEDAW0Vf1ik/9+zjUgzidVgSjFDHu4P7zpKtWCjmz46W67gRXrbs1xLaubv5ASPNq7fRGbELS2E7APqIZzJC+s5/MHw6f0w+28quD1+Mc1zZky3TCjgLqkuvkxsNnwNKJFrsIqDvDWEgGKiSaHU5N690v6foLnu8vq1L2PrmPdbOtPF0TMdTzVbp8/+1M/yRoynNVgSVR6lhEnSzd8wzlKVYI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(40460700003)(8676002)(5660300002)(70206006)(316002)(478600001)(70586007)(6666004)(4326008)(41300700001)(8936002)(2906002)(7696005)(110136005)(54906003)(30864003)(356005)(336012)(81166007)(82740400003)(1076003)(426003)(47076005)(16526019)(26005)(186003)(2616005)(36860700001)(36756003)(40480700001)(44832011)(86362001)(83380400001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:34.4996 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba4060e-7ecd-4514-9951-08daef3ea40e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8448
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Lazar Lijo <Lijo.Lazar@amd.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Carlos Soriano Sanchez <csoriano@redhat.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several IP versions duplicate code and can't use the common helpers.
Move this code into a single function so that the helpers can be used.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v6->v7:
 * Drop tags
 * Only set adev->psp.securedisplay_context.context on PSPv12 Renoir and
   PSP v10 which matches previous behavior.  If it should match for Cezanne
   and PSPv11 too we can undo this part of the check.
v5->v6:
 * Rebase on earlier patches
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 123 ++++++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c  |  64 +-----------
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c  |  80 ++-------------
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c  |  66 ++-----------
 4 files changed, 115 insertions(+), 218 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 7a2fc920739b..bdc2bf87a286 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -3272,41 +3272,76 @@ static int parse_ta_bin_descriptor(struct psp_context *psp,
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
+	ta_hdr = (const struct ta_firmware_header_v1_0 *) adev->psp.ta_fw->data;
+
+	if (le16_to_cpu(ta_hdr->header.header_version_major) != 1)
 		return -EINVAL;
-	}
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
-	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
+	adev->psp.xgmi_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->xgmi.fw_version);
+	adev->psp.xgmi_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->xgmi.size_bytes);
+	adev->psp.xgmi_context.context.bin_desc.start_addr =
+		(uint8_t *)ta_hdr +
+		le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
+
+	adev->psp.ras_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->ras.fw_version);
+	adev->psp.ras_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->ras.size_bytes);
+	adev->psp.ras_context.context.bin_desc.start_addr =
+		(uint8_t *)adev->psp.xgmi_context.context.bin_desc.start_addr +
+		le32_to_cpu(ta_hdr->ras.offset_bytes);
+
+	adev->psp.hdcp_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->hdcp.fw_version);
+	adev->psp.hdcp_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->hdcp.size_bytes);
+	adev->psp.hdcp_context.context.bin_desc.start_addr =
+		(uint8_t *)ta_hdr +
+		le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
+
+	adev->psp.dtm_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->dtm.fw_version);
+	adev->psp.dtm_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->dtm.size_bytes);
+	adev->psp.dtm_context.context.bin_desc.start_addr =
+		(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
+		le32_to_cpu(ta_hdr->dtm.offset_bytes);
+
+	adev->psp.securedisplay_context.context.bin_desc.fw_version =
+		le32_to_cpu(ta_hdr->securedisplay.fw_version);
+	adev->psp.securedisplay_context.context.bin_desc.size_bytes =
+		le32_to_cpu(ta_hdr->securedisplay.size_bytes);
+	adev->psp.securedisplay_context.context.bin_desc.start_addr =
+		(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
+		le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
+
+	adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
 
-	err = amdgpu_ucode_validate(adev->psp.ta_fw);
-	if (err)
-		goto out;
+	return 0;
+}
+
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
@@ -3314,14 +3349,46 @@ int psp_init_ta_microcode(struct psp_context *psp,
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
index bd3e3e23a939..41e29b777666 100644
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
 
@@ -129,7 +128,7 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 	default:
 		BUG();
 	}
-
+	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 	switch (adev->ip_versions[MP0_HWIP][0]) {
 	case IP_VERSION(11, 0, 2):
@@ -140,35 +139,8 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
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
+		adev->psp.securedisplay_context.context.bin_desc.size_bytes = 0;
 		break;
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 5):
@@ -179,39 +151,8 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
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
+		adev->psp.securedisplay_context.context.bin_desc.size_bytes = 0;
 		break;
 	case IP_VERSION(11, 0, 7):
 	case IP_VERSION(11, 0, 11):
@@ -221,26 +162,17 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 		if (err)
 			return err;
 		err = psp_init_ta_microcode(psp, chip_name);
-		if (err)
-			return err;
 		break;
 	case IP_VERSION(11, 5, 0):
 		err = psp_init_asd_microcode(psp, chip_name);
 		if (err)
 			return err;
 		err = psp_init_toc_microcode(psp, chip_name);
-		if (err)
-			return err;
 		break;
 	default:
 		BUG();
 	}
 
-	return 0;
-
-out2:
-	release_firmware(adev->psp.ta_fw);
-	adev->psp.ta_fw = NULL;
 	return err;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
index 8ed2281b6557..67118e699219 100644
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
@@ -64,67 +63,20 @@ static int psp_v12_0_init_microcode(struct psp_context *psp)
 	default:
 		BUG();
 	}
+	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 	err = psp_init_asd_microcode(psp, chip_name);
+	if (err)
+		return err;
+	err = psp_init_ta_microcode(psp, ucode_prefix);
 	if (err)
 		return err;
 
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
+	/* only supported on renoir */
+	if (!(adev->apu_flags & AMD_APU_IS_RENOIR))
+		adev->psp.securedisplay_context.context.bin_desc.size_bytes = 0;
 
-	return err;
+	return psp_init_ta_microcode(psp, ucode_prefix);
 }
 
 static int psp_v12_0_bootloader_load_sysdrv(struct psp_context *psp)
-- 
2.34.1

