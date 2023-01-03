Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C8365C982
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA1A10E4E9;
	Tue,  3 Jan 2023 22:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C43510E516;
 Tue,  3 Jan 2023 22:19:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQDXNWDAflGpMd3I+wkNZFeqHKboJ6svuEyOkjYH2C2d+MgR3nThBS6ENEpOUKA2a/NHXpHIIQMCvBcpQRQ9CRQDTvJDqhte6ncglC35uNVMo/VWVhmNnh1AhlY34XLDJBcwxHQdj2lTuBuujMkQ3sLdOQ+XKb1+BHr/ugyeJBqBtmn6h26faS4Pj3ueqELG+CpDd5D/7tdIJVW47MflopKp8heXBuoyIbwxab8XLhaz6BEGkNWm7rhdLcCCESm5KZJ2uOTbaCdBarh6uZVrdrLJDrOef+SZVWn8R3Vwfk0pS2eSaDpo+AOazQmwSJX0W8MK+QHTgEROGlT1vmJ28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXh3VDGYaLQeQgWTLd4QjqvHzaHoWsTUmMVzn4nI92s=;
 b=alFC7tgv8ARV0YBPibL7OCrr7x/Zn/HXrqyidxiOdcVL3CwM1QirS7jel/pfVQjvNJaPjlkeyQpmoTsTzOGCh7p4jQh1jrmElGDFlgDZD3eXc8bYf84VHa2RHccZ1lg2iSxmB0QLp7dimYReiDl4sAnimngxtEER4lEBJM43KXhZh2bB5pe+cMyd+v2SSDmCxPGkZjHQ7Ah/3KiKzAKCrvyPtRqo1+j4jkGG0Gxx+H3OId4w+EI7lZnwjKVLeaO+DD3OO8cVMCKj9BWAd0VexlZt6NsPSk1Ir19UU9jwbtk6iEzkgkza6IfguqNBiN2vjeMP5NONqKL2ALmc4VxiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXh3VDGYaLQeQgWTLd4QjqvHzaHoWsTUmMVzn4nI92s=;
 b=JM2UsyBfEtY5XW5ORm3vlyHwq4BMq4ZofwbnuZiTstpIZ1Y070/INzVNaNvgEKAbBtbJ9akgeJoTtMbZ2luVPvt4JPEk7LjpfyzGdB933lJEIe6PTiTESU6uK9gI66b+af4NSUEUo5Y+8MWV3mPajHynV2u5evxaMgM/GN+3/sg=
Received: from DS7PR03CA0145.namprd03.prod.outlook.com (2603:10b6:5:3b4::30)
 by SA1PR12MB6945.namprd12.prod.outlook.com (2603:10b6:806:24c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 22:19:56 +0000
Received: from DS1PEPF0000E655.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::1f) by DS7PR03CA0145.outlook.office365.com
 (2603:10b6:5:3b4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E655.mail.protection.outlook.com (10.167.18.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:56 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:53 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 22/27] drm/amd: Load PSP microcode during early_init
Date: Tue, 3 Jan 2023 16:18:41 -0600
Message-ID: <20230103221852.22813-23-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E655:EE_|SA1PR12MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: aa160586-66d5-49bd-b022-08daedd8a50f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UP7P6ufxzxKWw72U7pQ2XBkuZnbkgvw4miTTJOuxS4mMUGBFBMTtnd67Xwj13cuikQz3rcB/j/EKuFvQcesqjSuzT9hfRJqBZqzi8mQxvsh9xSjwl4GqSc38Z44PLW1/ZKSUYT+kRR+BUL3aZJ//CI0/8M/AUwikE2AmxAu+kubQBqQuyn/IEl9ENW52qKos4VHfMGCX6gLewQIeFOJQmjfvhPF/eRkACNkpL85dPBzdC0u9bPJ2D52bw16VpDpUUEjFhzCnq6Bttq6RTJN1jFGYGI1sRCwzGpBfqKaSsqKuYzkJVqumG/4QaPQwokS7DRd4P1uapjTzdZJzX+iyIfaNVaShSrfONhIPX17pVJpbC8s+0w55V8Qfwp6CcjVWw7TucD5/wa7JMCZZrvc/82aPgzTKGpcxZDCZLslhoK+VjgYJiRKABO8p3PtU9YqBPqJqpM3Y8yPge0LsCU5ttwqWrnDZQ+UmniPQU2RJgnZW1fq5RCxfM/TzBRm3C/wFjoUqWc1dPJ1cYPMOqYGRqmKg0O8A8zf1tMX8AEGDPJtN1iyfCyqRWb7Z7E71cKGcvQCL7MZfJ6ZevA1hpF2dvjI/M7/cbaT9VxWPThNVxARsabLEPhj6381tmuqZEDsC4/s1xBOMKyPlgHn9egPP+V+jHX2caeWGwIZynNw5u5qmnR2uXHhmiW6VMauk+WB16EpPHDMWvBpTJzaV5Sb/LAZWTYNEJ8tzHF2oZQ9KtYRI0CicxNWG3CZodC/2Nj/O3fe5MQN7DA9uf4nPOP66lg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(40470700004)(46966006)(16526019)(6666004)(26005)(186003)(1076003)(2616005)(7696005)(478600001)(110136005)(36860700001)(70586007)(70206006)(8676002)(4326008)(41300700001)(8936002)(47076005)(426003)(336012)(30864003)(83380400001)(5660300002)(2906002)(44832011)(40480700001)(82740400003)(356005)(81166007)(86362001)(316002)(54906003)(40460700003)(36756003)(82310400005)(22166009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:56.3553 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa160586-66d5-49bd-b022-08daedd8a50f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E655.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6945
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
v3->v4:
 * new patch
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c  | 128 +++++++++--------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h  |   3 +
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c   |  16 +--
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c   |  55 ++--------
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c   |  13 +--
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c   |  27 ++---
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c |  14 +--
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c    |  16 +--
 8 files changed, 79 insertions(+), 193 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index d51fe3431e2b..3b0644600a1f 100644
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
@@ -2908,20 +2904,14 @@ int psp_ring_cmd_submit(struct psp_context *psp,
 	return 0;
 }
 
-int psp_init_asd_microcode(struct psp_context *psp,
-			   const char *chip_name)
+int psp_init_asd_microcode(struct psp_context *psp, char *ucode_prefix)
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
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_asd.bin", chip_name);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_asd.bin", ucode_prefix);
 	err = request_firmware(&adev->psp.asd_fw, fw_name, adev->dev);
 	if (err)
 		goto out;
@@ -2944,20 +2934,14 @@ int psp_init_asd_microcode(struct psp_context *psp,
 	return err;
 }
 
-int psp_init_toc_microcode(struct psp_context *psp,
-			   const char *chip_name)
+int psp_init_toc_microcode(struct psp_context *psp, char *ucode_prefix)
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
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", chip_name);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", ucode_prefix);
 	err = request_firmware(&adev->psp.toc_fw, fw_name, adev->dev);
 	if (err)
 		goto out;
@@ -3107,8 +3091,7 @@ static int psp_init_sos_base_fw(struct amdgpu_device *adev)
 	return 0;
 }
 
-int psp_init_sos_microcode(struct psp_context *psp,
-			   const char *chip_name)
+int psp_init_sos_microcode(struct psp_context *psp, char *ucode_prefix)
 {
 	struct amdgpu_device *adev = psp->adev;
 	char fw_name[PSP_FW_NAME_LEN];
@@ -3121,12 +3104,7 @@ int psp_init_sos_microcode(struct psp_context *psp,
 	uint8_t *ucode_array_start_addr;
 	int fw_index = 0;
 
-	if (!chip_name) {
-		dev_err(adev->dev, "invalid chip name for sos microcode\n");
-		return -EINVAL;
-	}
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sos.bin", chip_name);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sos.bin", ucode_prefix);
 	err = request_firmware(&adev->psp.sos_fw, fw_name, adev->dev);
 	if (err)
 		goto out;
@@ -3391,8 +3369,7 @@ int psp_init_ta_microcode(struct psp_context *psp, char *ucode_prefix)
 	return err;
 }
 
-int psp_init_cap_microcode(struct psp_context *psp,
-			  const char *chip_name)
+int psp_init_cap_microcode(struct psp_context *psp, char *ucode_prefix)
 {
 	struct amdgpu_device *adev = psp->adev;
 	char fw_name[PSP_FW_NAME_LEN];
@@ -3400,17 +3377,12 @@ int psp_init_cap_microcode(struct psp_context *psp,
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
 	}
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_cap.bin", chip_name);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_cap.bin", ucode_prefix);
 	err = request_firmware(&adev->psp.cap_fw, fw_name, adev->dev);
 	if (err) {
 		dev_warn(adev->dev, "cap microcode does not exist, skip\n");
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
index 45dc370f96bd..47b88233bf94 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
@@ -502,6 +502,9 @@ int psp_ring_cmd_submit(struct psp_context *psp,
 			uint64_t cmd_buf_mc_addr,
 			uint64_t fence_mc_addr,
 			int index);
+int psp_init_asd_microcode(struct psp_context *psp, char *ucode_prefix);
+int psp_init_toc_microcode(struct psp_context *psp, char *ucode_prefix);
+int psp_init_sos_microcode(struct psp_context *psp, char *ucode_prefix);
 int psp_init_ta_microcode(struct psp_context *psp, char *ucode_prefix);
 int psp_init_cap_microcode(struct psp_context *psp,
 			  const char *chip_name);
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

