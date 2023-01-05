Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 743CA65E3C9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4178710E64B;
	Thu,  5 Jan 2023 03:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27FF10E644;
 Thu,  5 Jan 2023 03:44:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVYcjNWAaBpTWh/57kM3pAmp1iWKRX0mC3j4E4N2aSH0fgs/LQLyXTj/F4fd+akQwIW80ikgxlXBLVql9d8nvYPnfx6uRk4pN2mLkkHoCsFJQDjjagrtPFpS5duUP1Jg6UAQchzcQ3+8UtOqE6A7d2H0OwDpe5z9+uwo6l/+QhTqysHO75chz3d7T23xzIn95t5yO7o8aRGfFjK2fE8lY040P0Ln/GaJQdAdoM5wKrIA3xllz7BpGgjgG6dtnRKEvQq88FiP/azQuBKxW1Jksh+hE5ieEESASz96tg8yfuYrOKIeNHSrIN2UJIHmPmeHFfo+T5QKd2lnM287gykDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5c5VN0cEhE6u2pbKtros1yQ52WSWseHU6hP1fFPZj0=;
 b=PCgejrUCJBnqWnLn8O32dB8somba8CsUqIRtePLGB/m9rS8A12s3Xp7a5O6ifUh+XKqhKcVe4vOSxtH3p1Ixc2AIOb4YBaGDxb4/ZMdfF1BJXmQuDPHsMMAk9AIJO3G1QGn9+xQqx9zsq32shKseMse7sjOtkKkSXGG4bpqe3uDYI3mDQNPq2W2EkWu/MBvndphz2YS6jAJ9ZbOCZBmg2ahlr6ein/e0Hv7qkw10uwmrmMFB7zU3Fjj1+L7S0Cw0bLT6mjLvK4fsv8GRaGhzCu0gLMFI+0c/IRhc5dGbc3QP42oSU4S8SQ6l55fSo11Ds4yWer2U4TwLbnmlKB9YhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5c5VN0cEhE6u2pbKtros1yQ52WSWseHU6hP1fFPZj0=;
 b=BrjSWpUjcnQJhKO/te56xoX+5N6rghT8hGLgawgOLosdzFyekDfOxzXZzKSt7YmiW2s7otOgmy7w8ln92vz54qHf33iB9O+23MQWZm3UX10wNo9c2ggHmSYowq1InoF9C4Jbsq1DJBMCDP/mTqc0B4N1Xm8bFhrd3Y+FS0Ik3uY=
Received: from BN0PR04CA0050.namprd04.prod.outlook.com (2603:10b6:408:e8::25)
 by SJ0PR12MB8113.namprd12.prod.outlook.com (2603:10b6:a03:4e0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:07 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::4c) by BN0PR04CA0050.outlook.office365.com
 (2603:10b6:408:e8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 03:44:06 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:02 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 07/45] drm/amd: Convert SDMA to use
 `amdgpu_ucode_ip_version_decode`
Date: Wed, 4 Jan 2023 21:42:41 -0600
Message-ID: <20230105034327.1439-8-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|SJ0PR12MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: ed55664e-a1b6-4b76-0ddd-08daeecf18db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ig/wr9EwO4hu2mUv7PxQBfOX93tVytdzas5gwU2IWe9Aa6ye1sMqSMomSrIq/LUqr5LNSNym5UOWujmRYNLpAb0+DdZRmqO2c20taVSyJARJANlt9250RzElOZeBWtO0Io9JRbjNFOHsOISOY5z++edtaHB+OlnbYM8fZpD6H8Nz5azIuFwf7fiDM+EB9MaQYaWZEjIzm4MDLq8TMN/bymDUKzRYSUfJR5wdh7XXW8PpJIg0SGq3Vc7Vfv/+T9MPmYJBMPs8fgeZ7q0++UciXk/2nZvZURRU/dTShujFeSZ2JZM32N12Pvk+DiCWgeOwdpznNEwLinkvma0aaHp9nVydhuyKt/Ni4bfy92q2BqOWORHT6dNvgnS+Gn1uD1+lxmrprCNxGnq2SMIxQvjv9fivf+4ulytCezDWKqV8yH8Qo5vwkZZ9Ti4xG+c//DNCl2iRJEDRyz1okvKFN8LOtjEm794gEZ+40mkb8TU4SH8kwBR4FUI4KG7YQKOgLom1/uEfrzudqwGtF7/R+nvO5Vkz0K1agiIWvH5v8mRWeAqZXjxd74zZwl+RLC/gNlOeFzi7WxYa7qwM+OF4+Ziu8/Bc0Zs1vzsJLe7jlXdaDuc/AYCuD7X6c791UZdYOZPLWzEMzSQaMImjD/0fX0WsJ9MuDhrjpFo5MbnBE8mqXn4dbk3EcBK017ylaZjFG4oFmQ0VgWzl+Mi2pLvKx6uzIOF8BwQqPOJg6Xo9O+6yZ9UN1mQAUt+gV1OgGwpuDYz
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(5660300002)(2906002)(44832011)(8676002)(41300700001)(4326008)(70586007)(8936002)(70206006)(316002)(54906003)(110136005)(478600001)(1076003)(2616005)(186003)(82310400005)(16526019)(336012)(83380400001)(40480700001)(26005)(7696005)(6666004)(47076005)(426003)(82740400003)(356005)(81166007)(40460700003)(86362001)(36756003)(36860700001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:06.8527 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed55664e-a1b6-4b76-0ddd-08daeecf18db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8113
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

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 12 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h |  4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 47 +-------------------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   | 30 +------------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   | 55 +-----------------------
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   | 25 +----------
 6 files changed, 17 insertions(+), 156 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index a6a491569022..95e9450f3348 100644
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
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
+	else
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s%d.bin", ucode_prefix, i);
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

