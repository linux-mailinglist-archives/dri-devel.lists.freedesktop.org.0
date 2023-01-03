Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F50E65C976
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDD010E4E8;
	Tue,  3 Jan 2023 22:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC35310E4E7;
 Tue,  3 Jan 2023 22:19:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmWw6YlwniB+uGrtOXhy6vJ3DjaEmVoqwlXz4zab8eqlSacDEagQ96fhaVbIIvryrQDdCcoF7wpAIZsdZniUMN7smpt0+V1Ab6AZ9ClxWDqRK0D0Lvgrl6cUu97lYfk75QIM9mlUT5auzhVj3aOzI1dg5Jwh8PPWGYS3X9uU80G17r1lTwXPOr2pZm/p6JmNZjp648vNjJiBEIyC+Qbyb8cn1dMTVG4rs3NROmtU26A1u5TN5Kwv/IE7DOigzUgOXGG0tiUrA7Elm3oo/JOOGoBLza85U4dtdI+8XOFvx2qOAOb1ndatAuqQW1CESxaHVOdigxPd6s+n9BuL4HmUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQtdTrMItagHfjCSWNeuWFYzCeL7L9kfqlhfEkaLEQ8=;
 b=ZoeGZxsPWf5wCGyqnq74SGJfPGlTj/UXBL1l2f8OD4DcSVbrJA4YTMeFhThLK7r2VpfMOj5LIBhAnz2CQIsiZ862M4q0ojcaH5+NhVh9qsFDeWbFxevU84YAZrnnfnMfiWW8f1/9T6pgWY1Q4Rans9yqFLUskBFmpL4Yt2kGPZ7DuvIb0nyCJgiODch7CvxNT0rUNMnMhK1YzXyB632paFxfqGur3Vi1s0tQd1F/IXbKwZ94s+d5Q7gNQ5qC/GIOIby8JM7ZjfSL9isrfZpqcI79vxksCpoRl5Dow8QxgcZzVYI1EPfo5BhdZ9Pp3tnPumYcQkrj34oNh9mz6XXulQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQtdTrMItagHfjCSWNeuWFYzCeL7L9kfqlhfEkaLEQ8=;
 b=K9qJnyWasmyLHU5o2ybXMJiG0MoH8CYeIONOHgn+xtBTbuW8KCxTTJlOof5HODJB/OA0bW/zXULLPj5c4Yux49Jbmvuz3h0uLmvoydkAhYqLW31DOM4FrIBakWZZSqu6LoBFgRHppqPFJJUDn/nrpM2m69KsN/V1YPf5Q4N92fI=
Received: from DS7PR03CA0132.namprd03.prod.outlook.com (2603:10b6:5:3b4::17)
 by CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 22:19:51 +0000
Received: from DS1PEPF0000E655.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::e7) by DS7PR03CA0132.outlook.office365.com
 (2603:10b6:5:3b4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E655.mail.protection.outlook.com (10.167.18.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:51 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:50 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 20/27] drm/amd: Parse both v1 and v2 TA microcode headers
 using same function
Date: Tue, 3 Jan 2023 16:18:39 -0600
Message-ID: <20230103221852.22813-21-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230103221852.22813-1-mario.limonciello@amd.com>
References: <20230103221852.22813-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E655:EE_|CY8PR12MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ed5bc0-7ad1-4015-e8a0-08daedd8a21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Axo/Xur55rmPTt8D5clOea1LIoohDuz5iU1qCnz3azVH6t4ZrRokn83m1FDuemb96JIwHvA3+BrSrlX2EFmBkqe+/iYpTdBrs9TqnXXUCkcgZdWIsujE90eHJYpjiLT9govpSmjzncZ7bbkKnVVkVJlCp7H4+ockzLIpMO+6l8yd0CsGyACyH4MB3xcC6jNVLhG1YT38jhZU1LKd8Gx2QLTsKx4GApO1lQrx+EE96eDJwBfKHBsrHti1kBzAR5taTWMw4TINL2fl8NYxDzTDnsdVgY4NQKnoLltZyAZRPNyFu2kTdXKyArhnk9T4Tmtaom3/a0TM8xNjEf8C6Qx6ZSn6wrLX6iqDU5bM/PVGrIZshdVZ/7GR6J64sTWAM1RCUV+y+BNl9KYp3nWYywBpC1m0lStcmq4atRvyxkrGEN+LSLWbadfSZDa0BXmB3vN0FUpl5BgRhA7tGQKYsX9myoyE8ZhdrlmOiHPbeDv0AvMwd+DO6xRuHEIAT3AEgzNg5VEi+IluXB7+JE2DWXq+ae0prM3Hh9x28FXUK8RbFocpPXMW8Xd2GxuUAFhVrT5Y+lsxKMe/LGydJq/ityp8aJhB1pbvdtvdgF/QU+toTWXBTJFvtK6sZ5BLdcPz74HoI7Ipi6eoE5uDDPGPrfX69U8VkzZdtKeBWuf9XtLeh8H+MQSMb07DtiEsQMmiNHwWkTy0CSSxUzjlck1G8luzK2k2n2Lag0twTTuJtRvhH7fFlss+qSN7EyBv7FUfoinX4GiigINvH2y7N8sz8HdifA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(16526019)(26005)(83380400001)(2616005)(82740400003)(47076005)(1076003)(426003)(40480700001)(86362001)(186003)(336012)(40460700003)(82310400005)(356005)(36756003)(81166007)(30864003)(36860700001)(478600001)(2906002)(110136005)(54906003)(5660300002)(316002)(44832011)(4326008)(8676002)(41300700001)(8936002)(70586007)(70206006)(6666004)(7696005)(22166009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:51.4022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ed5bc0-7ad1-4015-e8a0-08daedd8a21b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E655.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610
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
v3->v4:
 * New patch
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 120 ++++++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h |   9 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c  |  60 +-----------
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c  |  74 ++-------------
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c  |  62 +-----------
 5 files changed, 107 insertions(+), 218 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 7a2fc920739b..ac4d675abcb5 100644
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
+int psp_init_ta_microcode(struct psp_context *psp, char *ucode_prefix)
+{
+	const struct common_firmware_header *hdr;
+	struct amdgpu_device *adev = psp->adev;
+	char fw_name[PSP_FW_NAME_LEN];
+	int err;
+
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", ucode_prefix);
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
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
index cf4f60c66122..45dc370f96bd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
@@ -502,14 +502,7 @@ int psp_ring_cmd_submit(struct psp_context *psp,
 			uint64_t cmd_buf_mc_addr,
 			uint64_t fence_mc_addr,
 			int index);
-int psp_init_asd_microcode(struct psp_context *psp,
-			   const char *chip_name);
-int psp_init_toc_microcode(struct psp_context *psp,
-			   const char *chip_name);
-int psp_init_sos_microcode(struct psp_context *psp,
-			   const char *chip_name);
-int psp_init_ta_microcode(struct psp_context *psp,
-			  const char *chip_name);
+int psp_init_ta_microcode(struct psp_context *psp, char *ucode_prefix);
 int psp_init_cap_microcode(struct psp_context *psp,
 			  const char *chip_name);
 int psp_get_fw_attestation_records_addr(struct psp_context *psp,
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

