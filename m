Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0183965F1E2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C925A10E79B;
	Thu,  5 Jan 2023 17:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EC810E78E;
 Thu,  5 Jan 2023 17:02:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEWynvmpZBQ2rISrm4unZKPRC9bnSLHQAmPachk5BjB1ayIgqfkS6nDML5rFvcNXcvE2ui3FuePsnzkR+GwsTwbmjEt13eqgK+p0g0KH0Gv6L1LG+3W00RqTRXeFaT6vKtg9E/dc1GQRNc57PGhUUdlatgW21jWWz+WT8R3hwskeMVplkHVunSmYF+W9KGkK2UfkFXHy2BdS7wa0u4lOVh82n8CPlsIRG96vp0IjEATb3fae4vsVst/RePtYo9n+/4Zt6oHagGfmQ0mA/xIBWCaiULmfZt9mOuCHyzHGyPJy34TNj0e9OOT8uKor+SZW1RoBGWsRLHRUuKnb+Qq74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sa/7RleEfVj2oGNQ3B27rmHmw8P5FL0NxtjT6DETd0M=;
 b=cRZctQBlq+BRw7BynuN8ETnmBtDDSyGaJ7vkUEK6gJAKrQVkuMZJmGqR9nsRZ1SNbdv8j8BKxWMEOMpwX1YsHzrKMmR3t1AltqNeyFvf5aXXRHjxQM/80YTzXjXReNfVeJ92oJxJUk2mTsVrzwiTrohEIqwbaW83BT1Dan79byQ+2PIHgeN4scIN0Pp2W3TOksfqyNGJntVK77tgqSGnsFcBI4zHLLF9BLmAQZJYowOvkhZASaLaloM2LRsDR3Kqk9P2zIzRu4urisb+DEzWA30LPN7DGvetDWe98smQZ3gqIvPrqK3QlwDwyySyP7/J6oJF83jxdF76duSqPdMe9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa/7RleEfVj2oGNQ3B27rmHmw8P5FL0NxtjT6DETd0M=;
 b=BTLAoGvlWYYxW1OGGBe1D0IMTfc6MHWjExtGFlgg8XJgqeSyeHYw0sps5jECbFb5nNt/b8mx3d6ppLXfhqYEtRoTx0dS+rhgAs45RL5BkqShOPNB3TEoJ5qE6cppXmgIk7WY8IrsTHgiGqmJVU7M0naor4KZs594MAnjsw1P1E4=
Received: from BN9PR03CA0987.namprd03.prod.outlook.com (2603:10b6:408:109::32)
 by DM4PR12MB5357.namprd12.prod.outlook.com (2603:10b6:5:39b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:36 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::27) by BN9PR03CA0987.outlook.office365.com
 (2603:10b6:408:109::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:36 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:26 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 22/45] drm/amd: Load PSP microcode during early_init
Date: Thu, 5 Jan 2023 11:01:08 -0600
Message-ID: <20230105170138.717-23-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT032:EE_|DM4PR12MB5357:EE_
X-MS-Office365-Filtering-Correlation-Id: 13377d1c-29b8-45bd-b2e1-08daef3ea552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NfP8ruzmO9Q0w2S7otK/riRonLSrJrsaPZTB4DMvda7QQNuuZN9TP7j+GfWnEQBcRgFz3Pyn1WDG+bWA8HLo30waZD98KNu5P2crOyjOoDwrPhN16EyanFEa/kTVHCOpA0oUDFs3t9VXPhUahcd8hlg1qM0hOofauhYb53jLA57UIpD0x07DWqklFtNeTk+bwxTMbz20xHP/sHrnB4cSgngXds4gThd3sND4c4XkruOPstSoW1VO3Jyfh+UNTPxjjWGLb1otQNnlW4ATKWUw5gjZQPikZT28C+ZP4cKJuZiorZZqAMpU+4E17i6zNrQLPIZn4ICr1MvoyfIgsIzpg32UAN9T1aJiVOLXZ3mSsn6CKE6Yqsto9wDkApYDSAjbYyg5hzkge+uHClFSxQCuZJ1EvYgoRuGtyGxr9CFp060tYiRnwzC+yZ5ApvvjZrPwJzUld3Dxl24VGVoSlLkwNlv7f1AowBxgrUqlt0mKbhK3zYjL60KlOh5iU9uh87vR8HkMP2T5TJ2oPmOGDrwD2L9ewxWY67JJwEe+YjVEtJpm67Ps+Ck1hKFn25vMlaJmmYzHQnatHhGTVHmhffBqNmZbwAGyNgMummmEMUH2bKLTg0Twvw84z/xafCn7qaZSV4dERDC76ti51CFthYc5GsQB5lNERczlLxpnlPwrWpNu6+kqyGbr5305wLvJdDZxq1b2nr9h94ZAh43onT6YFFUGsV2HUwx3TIQFr4lm8Wc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(110136005)(16526019)(478600001)(44832011)(82740400003)(40480700001)(40460700003)(36756003)(5660300002)(2616005)(1076003)(30864003)(8936002)(70586007)(70206006)(47076005)(4326008)(41300700001)(426003)(356005)(8676002)(6666004)(81166007)(316002)(26005)(82310400005)(7696005)(336012)(86362001)(54906003)(83380400001)(2906002)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:36.6549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13377d1c-29b8-45bd-b2e1-08daef3ea552
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5357
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

Simplifies the code so that all PSP versions will get the firmware
name from `amdgpu_ucode_ip_version_decode` and then use this filename
to load microcode as part of the early_init process.

Any failures will cause the driver to fail to probe before the firmware
framebuffer has been removed.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v6->v7:
 * rebase on earlier patches
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c  | 120 +++++++++--------------
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c   |  12 ---
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c   |  51 ++--------
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c   |  13 +--
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c   |  27 ++---
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c |  14 +--
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c    |  16 +--
 7 files changed, 69 insertions(+), 184 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 8b2f1783f93b..73d67a4d0f5b 100644
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
@@ -3392,8 +3370,7 @@ int psp_init_ta_microcode(struct psp_context *psp, const char *chip_name)
 	return err;
 }
 
-int psp_init_cap_microcode(struct psp_context *psp,
-			  const char *chip_name)
+int psp_init_cap_microcode(struct psp_context *psp, const char *chip_name)
 {
 	struct amdgpu_device *adev = psp->adev;
 	char fw_name[PSP_FW_NAME_LEN];
@@ -3401,11 +3378,6 @@ int psp_init_cap_microcode(struct psp_context *psp,
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
index f14fcfb9c425..e1b7fca09666 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
@@ -47,22 +47,10 @@ MODULE_FIRMWARE("amdgpu/raven_ta.bin");
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
 
 	err = psp_init_asd_microcode(psp, ucode_prefix);
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index 41e29b777666..8f84fe40abbb 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -88,55 +88,20 @@ MODULE_FIRMWARE("amdgpu/beige_goby_ta.bin");
 static int psp_v11_0_init_microcode(struct psp_context *psp)
 {
 	struct amdgpu_device *adev = psp->adev;
-	const char *chip_name;
 	char ucode_prefix[30];
 	int err = 0;
 
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
@@ -145,10 +110,10 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
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
@@ -158,16 +123,16 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 	case IP_VERSION(11, 0, 11):
 	case IP_VERSION(11, 0, 12):
 	case IP_VERSION(11, 0, 13):
-		err = psp_init_sos_microcode(psp, chip_name);
+		err = psp_init_sos_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
-		err = psp_init_ta_microcode(psp, chip_name);
+		err = psp_init_ta_microcode(psp, ucode_prefix);
 		break;
 	case IP_VERSION(11, 5, 0):
-		err = psp_init_asd_microcode(psp, chip_name);
+		err = psp_init_asd_microcode(psp, ucode_prefix);
 		if (err)
 			return err;
-		err = psp_init_toc_microcode(psp, chip_name);
+		err = psp_init_toc_microcode(psp, ucode_prefix);
 		break;
 	default:
 		BUG();
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
index 67118e699219..8979e4b697cd 100644
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
 	err = psp_init_ta_microcode(psp, ucode_prefix);
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

