Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5073C65DA25
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6386A10E55D;
	Wed,  4 Jan 2023 16:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B0C10E44B;
 Wed,  4 Jan 2023 16:41:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTCOmbkvyvPSpSuznPamsbMDcRoPn5zyUgn80cfXYIz5TkUAJdETVYU9ueO2ye1BELqrF6ICPkFyxOceb3sTlE3WonYoB6MANaM8mVYYJNXfFc61ysjWXPKn/NffhxogSGTt9Mn7nEuMbfRekcjucbxY+sU5jUFbYEfXcsEDtqXqVKLKXb5QstyirU27D39NVREG2iJOwO65jUHTP45/smpr5ZCK6wUONsirdY9CleYKoQ6Yjw+5u+ACmRRW+OTLnN5TWlRKJW5QjozKaF0keCWTF6BN9m3jjklpHihIFXl8HsNcajLMDOerZlA10WNqvqGWDR9IWOt0dhmHstIoHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyRt6+7NMTCf8iY9ELJOdfwDjHirMOauwxgAEJCyCzg=;
 b=ji0Qv2SdL4jaVU3Sj837sosuiXs8Q+h04FaJ80wtQUXaOb9cdsrDnAeo8yiO671cGjjTTHRS35ggvVplR63oPHD2Er9x0CjZv5XL0tyTXOYUiDrADR3bXNtEucfEWbIO+zsQXzU02tuYIbL8cksrbzBBFharbRLji6L/jQMddoprrovVweZpSEVoR4Fw8G44IikuKjYC30APAJzsU/s290S41LiGIYZO/bI/MgZDVcn+JN0gL7+ZFyo/m8j7VBHcA+AuIjbcUHe3WhdveC1i67lwcyhUr1XQT2Q3BY6/PDw4IHBB1YH0TsXy2seYwoj5OhicTb1gzBVbMGaZp8sgYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyRt6+7NMTCf8iY9ELJOdfwDjHirMOauwxgAEJCyCzg=;
 b=HUt8vz5Ivta8cU0CrV/KddI43CXg3nj89pWxgCJo2ucVPwTuN4D2kxhgXMLe1h1mfjnqsej6cM3OVTilJY1DVrFhHZ8A+2Fwe+WDZ7HrT9kV91Gn942Kcxj1xoNX98uvRI4+3BDP74XsjYvO65tOH8Ziurz6d7Abq6m1ap0HXA0=
Received: from DS7PR03CA0330.namprd03.prod.outlook.com (2603:10b6:8:2b::22) by
 CH2PR12MB4263.namprd12.prod.outlook.com (2603:10b6:610:a6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Wed, 4 Jan 2023 16:41:56 +0000
Received: from DS1PEPF0000E644.namprd02.prod.outlook.com
 (2603:10b6:8:2b:cafe::d5) by DS7PR03CA0330.outlook.office365.com
 (2603:10b6:8:2b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:41:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E644.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:41:56 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:41:53 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 07/45] drm/amd: Convert SDMA to use
 `amdgpu_ucode_ip_version_decode`
Date: Wed, 4 Jan 2023 10:39:56 -0600
Message-ID: <20230104164042.30271-8-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E644:EE_|CH2PR12MB4263:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e2d546-d60f-4112-e10c-08daee729786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MnADDMNb+82WWa/g27FbWfHxcxWRi9+4UN8yIAdXcRN0vKOIfMU8NMPmVnvaKG1mLGoAhXhfzUQVKmQKj+k6NR6Me6lano7p+O1sxORTsJIy1jRWUB2y0rmYhWediv0tZLkRYpT2cDQO2w30/r+6jtkZ4dSZ1dHb4VYQ0uFsk7SNyz835aZ1B/moFjGSYor23FpZT+nMteXoGBroZUZhLL2AIP3OO90V2Q8hfuLBa5zm9FSfO6q7n3DpiOuGkqeQoE0lOUa3edVnErXEq+RhPbfLiLzLD0AT5OKnasARnaa0Cwdkf/7Yamzco7OfNwljjTagJESQ6zrDICdAGWFFmeZ9s8w1FJ/sgMh7OYPIWqz8hc6g9BPIm7hriVUagBFL4sYRlIVObdvemmqrUrCEkvk9XGH3FvOJgqvZZri803P12UZ7/h3TW5a3wDTLANfhaTylU6IhcJelndST3W3hgYzb0rMKQFGdtOqW0ogp8xcxLPwBSBBGsMv3nHo/HIrcsoVRf/PwbutuYSQZ13hoM7uV5LchX7giT5wYVOf7e/Q+TLAWhbOR9TWIcPlWoA/vcRIk8BXRrh+u9Gq3bCzLdNoy/Y8Fj5g6dADORTL9EKPp1SIcBBW1IverG7YcUEmRHpt6yXha++QMRBYEfa6N/nIEdwzsoZLWeOqh1b8vljKNIxAZAUjWsrawGFcXazNyOF7B2ODjj2fgzWa+jaZDLCartKjNCxFDFS1nqmXCsALDqV+7941DGlK4NH2sV02m
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(86362001)(81166007)(356005)(82740400003)(426003)(36860700001)(83380400001)(47076005)(336012)(2616005)(16526019)(1076003)(26005)(186003)(478600001)(7696005)(110136005)(316002)(70586007)(54906003)(70206006)(41300700001)(5660300002)(4326008)(2906002)(44832011)(8676002)(8936002)(82310400005)(40480700001)(40460700003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:41:56.1446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e2d546-d60f-4112-e10c-08daee729786
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E644.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4263
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

Simplifies the code so that all SDMA versions will get the firmware
name from `amdgpu_ucode_ip_version_decode`.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v4->v5:
 * Use instance number to build names like before
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 12 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h |  4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 47 +-------------------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   | 30 +------------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   | 55 +-----------------------
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   | 25 +----------
 6 files changed, 17 insertions(+), 156 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 1668360bc699..f8e4a52ab67a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -200,15 +200,21 @@ void amdgpu_sdma_destroy_inst_ctx(struct amdgpu_device *adev,
 }
 
 int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
-			       char *fw_name, u32 instance,
-			       bool duplicate)
+			       u32 instance, bool duplicate)
 {
 	struct amdgpu_firmware_info *info = NULL;
 	const struct common_firmware_header *header = NULL;
 	int err = 0, i;
 	const struct sdma_firmware_header_v2_0 *sdma_hdr;
 	uint16_t version_major;
-
+	char ucode_prefix[30];
+	char fw_name[40];
+
+	amdgpu_ucode_ip_version_decode(adev, SDMA0_HWIP, ucode_prefix, sizeof(ucode_prefix));
+	if (instance == 0)
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma.bin", ucode_prefix);
+	else
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma%d.bin", ucode_prefix, i);
 	err = amdgpu_ucode_request(adev, &adev->sdma.instance[instance].fw, fw_name);
 	if (err)
 		goto out;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
index 7d99205c2e01..2d16e6d36728 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
@@ -124,8 +124,8 @@ int amdgpu_sdma_process_ras_data_cb(struct amdgpu_device *adev,
 int amdgpu_sdma_process_ecc_irq(struct amdgpu_device *adev,
 				      struct amdgpu_irq_src *source,
 				      struct amdgpu_iv_entry *entry);
-int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
-        char *fw_name, u32 instance, bool duplicate);
+int amdgpu_sdma_init_microcode(struct amdgpu_device *adev, u32 instance,
+			       bool duplicate);
 void amdgpu_sdma_destroy_inst_ctx(struct amdgpu_device *adev,
         bool duplicate);
 void amdgpu_sdma_unset_buffer_funcs_helper(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 4d780e4430e7..017ae298558e 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -575,60 +575,17 @@ static void sdma_v4_0_setup_ulv(struct amdgpu_device *adev)
 // vega10 real chip need to use PSP to load firmware
 static int sdma_v4_0_init_microcode(struct amdgpu_device *adev)
 {
-	const char *chip_name;
-	char fw_name[30];
 	int ret, i;
 
-	DRM_DEBUG("\n");
-
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
-	case IP_VERSION(4, 0, 0):
-		chip_name = "vega10";
-		break;
-	case IP_VERSION(4, 0, 1):
-		chip_name = "vega12";
-		break;
-	case IP_VERSION(4, 2, 0):
-		chip_name = "vega20";
-		break;
-	case IP_VERSION(4, 1, 0):
-	case IP_VERSION(4, 1, 1):
-		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
-			chip_name = "raven2";
-		else if (adev->apu_flags & AMD_APU_IS_PICASSO)
-			chip_name = "picasso";
-		else
-			chip_name = "raven";
-		break;
-	case IP_VERSION(4, 2, 2):
-		chip_name = "arcturus";
-		break;
-	case IP_VERSION(4, 1, 2):
-		if (adev->apu_flags & AMD_APU_IS_RENOIR)
-			chip_name = "renoir";
-		else
-			chip_name = "green_sardine";
-		break;
-	case IP_VERSION(4, 4, 0):
-		chip_name = "aldebaran";
-		break;
-	default:
-		BUG();
-	}
-
 	for (i = 0; i < adev->sdma.num_instances; i++) {
-		if (i == 0)
-			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma.bin", chip_name);
-		else
-			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma%d.bin", chip_name, i);
 		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 2) ||
                     adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 4, 0)) {
 			/* Acturus & Aldebaran will leverage the same FW memory
 			   for every SDMA instance */
-			ret = amdgpu_sdma_init_microcode(adev, fw_name, 0, true);
+			ret = amdgpu_sdma_init_microcode(adev, 0, true);
 			break;
 		} else {
-			ret = amdgpu_sdma_init_microcode(adev, fw_name, i, false);
+			ret = amdgpu_sdma_init_microcode(adev, i, false);
 			if (ret)
 				return ret;
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index d4d9f196db83..1941b3b7c5d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -237,39 +237,13 @@ static void sdma_v5_0_init_golden_registers(struct amdgpu_device *adev)
 // emulation only, won't work on real chip
 // navi10 real chip need to use PSP to load firmware
 static int sdma_v5_0_init_microcode(struct amdgpu_device *adev)
-{
-	const char *chip_name;
-	char fw_name[40];
-	int ret, i;
+{	int ret, i;
 
 	if (amdgpu_sriov_vf(adev) && (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(5, 0, 5)))
 		return 0;
 
-	DRM_DEBUG("\n");
-
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
-	case IP_VERSION(5, 0, 0):
-		chip_name = "navi10";
-		break;
-	case IP_VERSION(5, 0, 2):
-		chip_name = "navi14";
-		break;
-	case IP_VERSION(5, 0, 5):
-		chip_name = "navi12";
-		break;
-	case IP_VERSION(5, 0, 1):
-		chip_name = "cyan_skillfish2";
-		break;
-	default:
-		BUG();
-	}
-
 	for (i = 0; i < adev->sdma.num_instances; i++) {
-		if (i == 0)
-			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma.bin", chip_name);
-		else
-			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma1.bin", chip_name);
-		ret = amdgpu_sdma_init_microcode(adev, fw_name, i, false);
+		ret = amdgpu_sdma_init_microcode(adev, i, false);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 65e7a710298d..8e445eb9dd49 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -89,59 +89,6 @@ static u32 sdma_v5_2_get_reg_offset(struct amdgpu_device *adev, u32 instance, u3
 	return base + internal_offset;
 }
 
-/**
- * sdma_v5_2_init_microcode - load ucode images from disk
- *
- * @adev: amdgpu_device pointer
- *
- * Use the firmware interface to load the ucode images into
- * the driver (not loaded into hw).
- * Returns 0 on success, error on failure.
- */
-
-// emulation only, won't work on real chip
-// navi10 real chip need to use PSP to load firmware
-static int sdma_v5_2_init_microcode(struct amdgpu_device *adev)
-{
-	const char *chip_name;
-	char fw_name[40];
-
-	DRM_DEBUG("\n");
-
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
-	case IP_VERSION(5, 2, 0):
-		chip_name = "sienna_cichlid_sdma";
-		break;
-	case IP_VERSION(5, 2, 2):
-		chip_name = "navy_flounder_sdma";
-		break;
-	case IP_VERSION(5, 2, 1):
-		chip_name = "vangogh_sdma";
-		break;
-	case IP_VERSION(5, 2, 4):
-		chip_name = "dimgrey_cavefish_sdma";
-		break;
-	case IP_VERSION(5, 2, 5):
-		chip_name = "beige_goby_sdma";
-		break;
-	case IP_VERSION(5, 2, 3):
-		chip_name = "yellow_carp_sdma";
-		break;
-	case IP_VERSION(5, 2, 6):
-		chip_name = "sdma_5_2_6";
-		break;
-	case IP_VERSION(5, 2, 7):
-		chip_name = "sdma_5_2_7";
-		break;
-	default:
-		BUG();
-	}
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", chip_name);
-
-	return amdgpu_sdma_init_microcode(adev, fw_name, 0, true);
-}
-
 static unsigned sdma_v5_2_ring_init_cond_exec(struct amdgpu_ring *ring)
 {
 	unsigned ret;
@@ -1288,7 +1235,7 @@ static int sdma_v5_2_sw_init(void *handle)
 			return r;
 	}
 
-	r = sdma_v5_2_init_microcode(adev);
+	r = amdgpu_sdma_init_microcode(adev, 0, true);
 	if (r) {
 		DRM_ERROR("Failed to load sdma firmware!\n");
 		return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 049c26a45d85..bf1fa5e8d2f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -78,29 +78,6 @@ static u32 sdma_v6_0_get_reg_offset(struct amdgpu_device *adev, u32 instance, u3
 	return base + internal_offset;
 }
 
-/**
- * sdma_v6_0_init_microcode - load ucode images from disk
- *
- * @adev: amdgpu_device pointer
- *
- * Use the firmware interface to load the ucode images into
- * the driver (not loaded into hw).
- * Returns 0 on success, error on failure.
- */
-static int sdma_v6_0_init_microcode(struct amdgpu_device *adev)
-{
-	char fw_name[30];
-	char ucode_prefix[30];
-
-	DRM_DEBUG("\n");
-
-	amdgpu_ucode_ip_version_decode(adev, SDMA0_HWIP, ucode_prefix, sizeof(ucode_prefix));
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
-
-	return amdgpu_sdma_init_microcode(adev, fw_name, 0, true);
-}
-
 static unsigned sdma_v6_0_ring_init_cond_exec(struct amdgpu_ring *ring)
 {
 	unsigned ret;
@@ -1260,7 +1237,7 @@ static int sdma_v6_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	r = sdma_v6_0_init_microcode(adev);
+	r = amdgpu_sdma_init_microcode(adev, 0, true);
 	if (r) {
 		DRM_ERROR("Failed to load sdma firmware!\n");
 		return r;
-- 
2.34.1

