Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D165DA58
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AF310E588;
	Wed,  4 Jan 2023 16:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DB210E551;
 Wed,  4 Jan 2023 16:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nycI4RxBDiL8AtcBmetrlavhs4WcY8I8GC4QSxqpRk+LXzWm4Z3xC/jLGka3Wr92IXGpEg1nTMXtBiBRbhkXvt3SjYD5A5Bhr2QLX1d3mm2MeCLyQA/kJnkg425UN/RpTPWJ3hXWvwZoZd4RR4hGMEtTz1EUvL6stR2Z7m1IRZPLAX2yGu8GjV/flUYCc3WQBjiihpU/oWT4tTdc89G9cvGMtYMrKuuHSg03FveStlDRc0KHmYOT51B78cTpIMMx/xZjLCVZ44pyV/SH8QQN80sLAedqbVNF1yeaVQ0lLzWWIWdKCMNjBwLmY9ThVJSRS99KA6ldVHgXZFufPyCxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4LG8ljH5D+j7uaxA2q62hGzc+4PSKUxY3ApNpX7YoE=;
 b=WKLB+5MZf3jMdX29hEyYlgYm40mhCRKRguR21xL8SLzyboThNZDdXmVo/oYTcuihQEcDaoiLGqrmWX64K9jQ5tt2RSDMVdTwuVDN+xXfy6mClm+XFrXogsyLTRa9oWj8eBbnQ2kOCQIIjIo8uRSAQSj3H8KP/lvPJ74DnOfgMpnHBvXGOUa/sAoUkBPTANQekU/QYhwAlkitYDiiLKs1pX5F02xFm6OvIGrelLeI60jBvLMyg38yhRPWM0mOTyjJtf9j8cWcC1P2uSJQqt19Te0HMx64hdWFQRaGa42KU0Am9uDcx7VFVnJakLbtnL3WWbpT56FNc/wyX3YzAMgeqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4LG8ljH5D+j7uaxA2q62hGzc+4PSKUxY3ApNpX7YoE=;
 b=PhXjFmMSayAcqn3wn03jw/QnYBVFDx0w7n5p0NOdBccPEUa2E7srV20alpyhLaiI3E8PzBp/hNTsWQnTX6Le8ylw+u2bM0swOXu81EbOyX2aMgJqslQznwAZrt+5PviWRSa94Ni0/6nSoqAAQ/Wo/cpCfWAT4hgdMiO/jdSdZsQ=
Received: from BN9PR03CA0614.namprd03.prod.outlook.com (2603:10b6:408:106::19)
 by PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:43:09 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::44) by BN9PR03CA0614.outlook.office365.com
 (2603:10b6:408:106::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:43:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:43:08 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:43:05 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 22/45] drm/amd: Load PSP microcode during early_init
Date: Wed, 4 Jan 2023 10:40:11 -0600
Message-ID: <20230104164042.30271-23-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|PH7PR12MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 576b7b45-e943-4ab3-bebd-08daee72c2c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5BfiJ1j/lnLegbA2IPGPgkk/sZ/caf2DePvDERthOyAbOUzFVRLwV7zSyDYXkUKM8UBjo4GyY33bEmK4Vr30Y5lvuzo8d+dCyNNm+GfKPE9knYWAmkod8gd1lIgJleX7LbxjqHNcmeNnGvxqrQtpMug+yzfN23i0Yd72MyM5kYM/766jGgC1YbBkyDPV1IkVYq8WqsjP/qmvegz4Uy60NkzaKfEy4pDFEIZfLNSysfBBsiCrcZECU8HBWIHhtAvYik9bSAqEnvhAQrYgxohYhLw4+q/75LdC95GJq0F+QtK2KzoD5gMYs6Tw/zdws4/X65I6LdR+lE5jTkhiyMIvwIl1LFoJP1BE2m+ebBpkXo75i7Xz+nKpSia5+Cnc5p6N3QElknPbNwYUFPeSyr4wkyeMq2X8E3aZnUOs5dauOwvmhtM9VIZUGwcbelDnAdp4k7xQ0cNInz72sQTna6pZq5VfjjobQ/W/l7aPsL5yB02D4YUj/2h8FfzoAlVEdo3WwCnE0YhLcEgBmnqsOxQGQacacc4EiByyqGqy/rvBlObZo5EaDD/+L1DhmA3OHbgPgXzaAos23ODpYg9LBT7rqdZ6IDLzYUA6M/Df0y7MlWJRQSxNRwmNWJ+FS44fgMzIV606RT7sZWc8Wbhh2WOwMW3kryT7sVs9TmpvXoNHxjDWhlU9BXW9pDvazGyGoobu90nQPr1dvRYJoTv2WwjlaqBH+QYnZxwUWJLDjCzzV3o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(16526019)(54906003)(316002)(6666004)(186003)(110136005)(7696005)(26005)(70586007)(478600001)(8676002)(4326008)(1076003)(70206006)(336012)(2616005)(41300700001)(47076005)(426003)(8936002)(5660300002)(83380400001)(30864003)(44832011)(2906002)(36756003)(82740400003)(36860700001)(40460700003)(81166007)(40480700001)(86362001)(356005)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:43:08.7299 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 576b7b45-e943-4ab3-bebd-08daee72c2c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139
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

Simplifies the code so that all PSP versions will get the firmware
name from `amdgpu_ucode_ip_version_decode` and then use this filename
to load microcode as part of the early_init process.

Any failures will cause the driver to fail to probe before the firmware
framebuffer has been removed.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c  | 120 +++++++++--------------
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c   |  16 +--
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c   |  55 ++---------
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c   |  13 +--
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c   |  27 ++---
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c |  14 +--
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c    |  16 +--
 7 files changed, 72 insertions(+), 189 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index a4a62753bfd6..beaca5846c73 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -122,6 +122,44 @@ static void psp_check_pmfw_centralized_cstate_management(struct psp_context *psp
 	}
 }
 
+static int psp_init_sriov_microcode(struct psp_context *psp)
+{
+	struct amdgpu_device *adev = psp->adev;
+	char ucode_prefix[30];
+	int ret = 0;
+
+	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
+
+	switch (adev->ip_versions[MP0_HWIP][0]) {
+	case IP_VERSION(9, 0, 0):
+		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
+		ret = psp_init_cap_microcode(psp, ucode_prefix);
+		break;
+	case IP_VERSION(11, 0, 9):
+		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
+		ret = psp_init_cap_microcode(psp, ucode_prefix);
+		break;
+	case IP_VERSION(11, 0, 7):
+		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
+		ret = psp_init_cap_microcode(psp, ucode_prefix);
+		break;
+	case IP_VERSION(13, 0, 2):
+		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
+		ret = psp_init_cap_microcode(psp, ucode_prefix);
+		ret &= psp_init_ta_microcode(psp, ucode_prefix);
+		break;
+	case IP_VERSION(13, 0, 0):
+		adev->virt.autoload_ucode_id = 0;
+		break;
+	case IP_VERSION(13, 0, 10):
+		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MES1_DATA;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return ret;
+}
+
 static int psp_early_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
@@ -192,7 +230,10 @@ static int psp_early_init(void *handle)
 
 	psp_check_pmfw_centralized_cstate_management(psp);
 
-	return 0;
+	if (amdgpu_sriov_vf(adev))
+		return psp_init_sriov_microcode(psp);
+	else
+		return psp_init_microcode(psp);
 }
 
 void psp_ta_free_shared_buf(struct ta_mem_context *mem_ctx)
@@ -350,42 +391,6 @@ static bool psp_get_runtime_db_entry(struct amdgpu_device *adev,
 	return ret;
 }
 
-static int psp_init_sriov_microcode(struct psp_context *psp)
-{
-	struct amdgpu_device *adev = psp->adev;
-	int ret = 0;
-
-	switch (adev->ip_versions[MP0_HWIP][0]) {
-	case IP_VERSION(9, 0, 0):
-		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
-		ret = psp_init_cap_microcode(psp, "vega10");
-		break;
-	case IP_VERSION(11, 0, 9):
-		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
-		ret = psp_init_cap_microcode(psp, "navi12");
-		break;
-	case IP_VERSION(11, 0, 7):
-		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
-		ret = psp_init_cap_microcode(psp, "sienna_cichlid");
-		break;
-	case IP_VERSION(13, 0, 2):
-		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
-		ret = psp_init_cap_microcode(psp, "aldebaran");
-		ret &= psp_init_ta_microcode(psp, "aldebaran");
-		break;
-	case IP_VERSION(13, 0, 0):
-		adev->virt.autoload_ucode_id = 0;
-		break;
-	case IP_VERSION(13, 0, 10):
-		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MES1_DATA;
-		break;
-	default:
-		ret = -EINVAL;
-		break;
-	}
-	return ret;
-}
-
 static int psp_sw_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
@@ -401,15 +406,6 @@ static int psp_sw_init(void *handle)
 		ret = -ENOMEM;
 	}
 
-	if (amdgpu_sriov_vf(adev))
-		ret = psp_init_sriov_microcode(psp);
-	else
-		ret = psp_init_microcode(psp);
-	if (ret) {
-		DRM_ERROR("Failed to load psp firmware!\n");
-		return ret;
-	}
-
 	adev->psp.xgmi_context.supports_extended_data =
 		!adev->gmc.xgmi.connected_to_cpu &&
 			adev->ip_versions[MP0_HWIP][0] == IP_VERSION(13, 0, 2);
@@ -2908,19 +2904,13 @@ int psp_ring_cmd_submit(struct psp_context *psp,
 	return 0;
 }
 
-int psp_init_asd_microcode(struct psp_context *psp,
-			   const char *chip_name)
+int psp_init_asd_microcode(struct psp_context *psp, const char *chip_name)
 {
 	struct amdgpu_device *adev = psp->adev;
 	char fw_name[PSP_FW_NAME_LEN];
 	const struct psp_firmware_header_v1_0 *asd_hdr;
 	int err = 0;
 
-	if (!chip_name) {
-		dev_err(adev->dev, "invalid chip name for asd microcode\n");
-		return -EINVAL;
-	}
-
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_asd.bin", chip_name);
 	err = request_firmware(&adev->psp.asd_fw, fw_name, adev->dev);
 	if (err)
@@ -2944,19 +2934,13 @@ int psp_init_asd_microcode(struct psp_context *psp,
 	return err;
 }
 
-int psp_init_toc_microcode(struct psp_context *psp,
-			   const char *chip_name)
+int psp_init_toc_microcode(struct psp_context *psp, const char *chip_name)
 {
 	struct amdgpu_device *adev = psp->adev;
 	char fw_name[PSP_FW_NAME_LEN];
 	const struct psp_firmware_header_v1_0 *toc_hdr;
 	int err = 0;
 
-	if (!chip_name) {
-		dev_err(adev->dev, "invalid chip name for toc microcode\n");
-		return -EINVAL;
-	}
-
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", chip_name);
 	err = request_firmware(&adev->psp.toc_fw, fw_name, adev->dev);
 	if (err)
@@ -3107,8 +3091,7 @@ static int psp_init_sos_base_fw(struct amdgpu_device *adev)
 	return 0;
 }
 
-int psp_init_sos_microcode(struct psp_context *psp,
-			   const char *chip_name)
+int psp_init_sos_microcode(struct psp_context *psp, const char *chip_name)
 {
 	struct amdgpu_device *adev = psp->adev;
 	char fw_name[PSP_FW_NAME_LEN];
@@ -3121,11 +3104,6 @@ int psp_init_sos_microcode(struct psp_context *psp,
 	uint8_t *ucode_array_start_addr;
 	int fw_index = 0;
 
-	if (!chip_name) {
-		dev_err(adev->dev, "invalid chip name for sos microcode\n");
-		return -EINVAL;
-	}
-
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sos.bin", chip_name);
 	err = request_firmware(&adev->psp.sos_fw, fw_name, adev->dev);
 	if (err)
@@ -3391,8 +3369,7 @@ int psp_init_ta_microcode(struct psp_context *psp, const char *chip_name)
 	return err;
 }
 
-int psp_init_cap_microcode(struct psp_context *psp,
-			  const char *chip_name)
+int psp_init_cap_microcode(struct psp_context *psp, const char *chip_name)
 {
 	struct amdgpu_device *adev = psp->adev;
 	char fw_name[PSP_FW_NAME_LEN];
@@ -3400,11 +3377,6 @@ int psp_init_cap_microcode(struct psp_context *psp,
 	struct amdgpu_firmware_info *info = NULL;
 	int err = 0;
 
-	if (!chip_name) {
-		dev_err(adev->dev, "invalid chip name for cap microcode\n");
-		return -EINVAL;
-	}
-
 	if (!amdgpu_sriov_vf(adev)) {
 		dev_err(adev->dev, "cap microcode should only be loaded under SRIOV\n");
 		return -EINVAL;
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
index 7fb48c1dec71..e1b7fca09666 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
@@ -47,27 +47,15 @@ MODULE_FIRMWARE("amdgpu/raven_ta.bin");
 static int psp_v10_0_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
 	char ucode_prefix[30];
 	int err = 0;
 	DRM_DEBUG("\n");
 
-	switch (adev->asic_type) {
-	case CHIP_RAVEN:
-		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
-			chip_name = "raven2";
-		else if (adev->apu_flags & AMD_APU_IS_PICASSO)
-			chip_name = "picasso";
-		else
-			chip_name = "raven";
-		break;
-	default: BUG();
-	}
 	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	err = psp_init_asd_microcode(psp, chip_name);
+	err = psp_init_asd_microcode(psp, ucode_prefix);
 	if (err)
-		goto out;
+		return err;
 
 	return psp_init_ta_microcode(psp, ucode_prefix);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index 5f140b7c30d2..5fb572d3e42a 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -88,57 +88,20 @@ MODULE_FIRMWARE("amdgpu/beige_goby_ta.bin");
 static int psp_v11_0_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
-	char fw_name[PSP_FW_NAME_LEN];
+	char ucode_prefix[30];
 	int err = 0;
-	const struct ta_firmware_header_v1_0 *ta_hdr;
 
 	DRM_DEBUG("\n");
 
-	switch (adev->ip_versions[MP0_HWIP][0]) {
-	case IP_VERSION(11, 0, 2):
-		chip_name = "vega20";
-		break;
-	case IP_VERSION(11, 0, 0):
-		chip_name = "navi10";
-		break;
-	case IP_VERSION(11, 0, 5):
-		chip_name = "navi14";
-		break;
-	case IP_VERSION(11, 0, 9):
-		chip_name = "navi12";
-		break;
-	case IP_VERSION(11, 0, 4):
-		chip_name = "arcturus";
-		break;
-	case IP_VERSION(11, 0, 7):
-		chip_name = "sienna_cichlid";
-		break;
-	case IP_VERSION(11, 0, 11):
-		chip_name = "navy_flounder";
-		break;
-	case IP_VERSION(11, 5, 0):
-		chip_name = "vangogh";
-		break;
-	case IP_VERSION(11, 0, 12):
-		chip_name = "dimgrey_cavefish";
-		break;
-	case IP_VERSION(11, 0, 13):
-		chip_name = "beige_goby";
-		break;
-	default:
-		BUG();
-	}
 	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-
 	switch (adev->ip_versions[MP0_HWIP][0]) {
 	case IP_VERSION(11, 0, 2):
 	case IP_VERSION(11, 0, 4):
-		err = psp_init_sos_microcode(psp, chip_name);
+		err = psp_init_sos_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
-		err = psp_init_asd_microcode(psp, chip_name);
+		err = psp_init_asd_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
 		err = psp_init_ta_microcode(psp, ucode_prefix);
@@ -148,10 +111,10 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 	case IP_VERSION(11, 0, 0):
 	case IP_VERSION(11, 0, 5):
 	case IP_VERSION(11, 0, 9):
-		err = psp_init_sos_microcode(psp, chip_name);
+		err = psp_init_sos_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
-		err = psp_init_asd_microcode(psp, chip_name);
+		err = psp_init_asd_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
 		err = psp_init_ta_microcode(psp, ucode_prefix);
@@ -162,18 +125,18 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 	case IP_VERSION(11, 0, 11):
 	case IP_VERSION(11, 0, 12):
 	case IP_VERSION(11, 0, 13):
-		err = psp_init_sos_microcode(psp, chip_name);
+		err = psp_init_sos_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
-		err = psp_init_ta_microcode(psp, chip_name);
+		err = psp_init_ta_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
 		break;
 	case IP_VERSION(11, 5, 0):
-		err = psp_init_asd_microcode(psp, chip_name);
+		err = psp_init_asd_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
-		err = psp_init_toc_microcode(psp, chip_name);
+		err = psp_init_toc_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
index 634fa2822d8a..45810e4a7e45 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
@@ -48,24 +48,13 @@ MODULE_FIRMWARE("amdgpu/green_sardine_ta.bin");
 static int psp_v12_0_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
 	char ucode_prefix[30];
 	int err = 0;
 	DRM_DEBUG("\n");
 
-	switch (adev->asic_type) {
-	case CHIP_RENOIR:
-		if (adev->apu_flags & AMD_APU_IS_RENOIR)
-			chip_name = "renoir";
-		else
-			chip_name = "green_sardine";
-		break;
-	default:
-		BUG();
-	}
 	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	err = psp_init_asd_microcode(psp, chip_name);
+	err = psp_init_asd_microcode(psp, ucode_prefix);
 	if (err)
 		return err;
 	return psp_init_ta_microcode(psp, ucode_prefix);
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
index e6a26a7e5e5e..d62fcc77af95 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
@@ -70,32 +70,19 @@ MODULE_FIRMWARE("amdgpu/psp_13_0_11_ta.bin");
 static int psp_v13_0_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
 	char ucode_prefix[30];
 	int err = 0;
 
-	switch (adev->ip_versions[MP0_HWIP][0]) {
-	case IP_VERSION(13, 0, 2):
-		chip_name = "aldebaran";
-		break;
-	case IP_VERSION(13, 0, 1):
-	case IP_VERSION(13, 0, 3):
-		chip_name = "yellow_carp";
-		break;
-	default:
-		amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
-		chip_name = ucode_prefix;
-		break;
-	}
+	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 	switch (adev->ip_versions[MP0_HWIP][0]) {
 	case IP_VERSION(13, 0, 2):
-		err = psp_init_sos_microcode(psp, chip_name);
+		err = psp_init_sos_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
 		/* It's not necessary to load ras ta on Guest side */
 		if (!amdgpu_sriov_vf(adev)) {
-			err = psp_init_ta_microcode(&adev->psp, chip_name);
+			err = psp_init_ta_microcode(psp, ucode_prefix);
 			if (err)
 				return err;
 		}
@@ -105,21 +92,21 @@ static int psp_v13_0_init_microcode(struct psp_context *psp)
 	case IP_VERSION(13, 0, 5):
 	case IP_VERSION(13, 0, 8):
 	case IP_VERSION(13, 0, 11):
-		err = psp_init_toc_microcode(psp, chip_name);
+		err = psp_init_toc_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
-		err = psp_init_ta_microcode(psp, chip_name);
+		err = psp_init_ta_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
 		break;
 	case IP_VERSION(13, 0, 0):
 	case IP_VERSION(13, 0, 7):
 	case IP_VERSION(13, 0, 10):
-		err = psp_init_sos_microcode(psp, chip_name);
+		err = psp_init_sos_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
 		/* It's not necessary to load ras ta on Guest side */
-		err = psp_init_ta_microcode(psp, chip_name);
+		err = psp_init_ta_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
index 9d4e24e518e8..d5ba58eba3e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
@@ -35,25 +35,17 @@ MODULE_FIRMWARE("amdgpu/psp_13_0_4_ta.bin");
 static int psp_v13_0_4_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
 	char ucode_prefix[30];
 	int err = 0;
 
-	switch (adev->ip_versions[MP0_HWIP][0]) {
-	case IP_VERSION(13, 0, 4):
-		amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
-		chip_name = ucode_prefix;
-		break;
-	default:
-		BUG();
-	}
+	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 	switch (adev->ip_versions[MP0_HWIP][0]) {
 	case IP_VERSION(13, 0, 4):
-		err = psp_init_toc_microcode(psp, chip_name);
+		err = psp_init_toc_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
-		err = psp_init_ta_microcode(psp, chip_name);
+		err = psp_init_ta_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
index 157147c6c94e..f6b75e3e47ff 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
@@ -57,26 +57,18 @@ static int psp_v3_1_ring_stop(struct psp_context *psp,
 static int psp_v3_1_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
+	char ucode_prefix[30];
 	int err = 0;
 
 	DRM_DEBUG("\n");
 
-	switch (adev->asic_type) {
-	case CHIP_VEGA10:
-		chip_name = "vega10";
-		break;
-	case CHIP_VEGA12:
-		chip_name = "vega12";
-		break;
-	default: BUG();
-	}
+	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	err = psp_init_sos_microcode(psp, chip_name);
+	err = psp_init_sos_microcode(psp, ucode_prefix);
 	if (err)
 		return err;
 
-	err = psp_init_asd_microcode(psp, chip_name);
+	err = psp_init_asd_microcode(psp, ucode_prefix);
 	if (err)
 		return err;
 
-- 
2.34.1

