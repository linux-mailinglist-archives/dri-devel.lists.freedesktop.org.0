Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A3F65F1DD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543B610E799;
	Thu,  5 Jan 2023 17:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B350910E791;
 Thu,  5 Jan 2023 17:02:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaZta0rx7wEzkiolaO2AOliyv7tcCdQU40q9BfWmfJxx8ITB8xeHHngytL6dif7sWshr/xNYW1vLJGNR8Dlg4c1OQTKOpq5GEf+tuO6XrPpJCJ9vUqfUuipy4wPiuK5oZjNUnpX/FHufHWLwTAonBzUZqPbdjGDuwYV7iqf09nmSdP42jeRG80ziOHWuGEL7ixhNkvSkwA+nrmlSoeG9Hw2NyclJBOGij559ybiBRVUpo/00PwT2ysVwMVy6oVU+lHJKujq0fuJiM0fvFILG7cub2SBu4jUSCPVaNhR87QMHyTChK9+VB2ZcnHzsz4HVg3+vJWHmpmcvMWjyi2McNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQuzh87n1rUAgfMp+Ps95+Q7ef0MfJ8yBfibIpRcDnU=;
 b=Nv8iLesmvg+VgIS0daV7S/8In1re906wT+OCP+gQ7/pKgk+banPBraUMrUwzCCw5x2oZGnNI529VqyogS5ocj6SvT+BmpNAUd3xbecyMmUYPt9PCI8O1PrhxH9hAmHPQ5rfsROEGH54XOghiw0HtH9O9ie1MUDMjczPIphsrOfLGXOD6QAIqk3V4e79p2q0n4np9NewnLn8t5999qYaLHjRuXovyJhBOmTyrsn6yJrqAkLZuAXqPxt+gePaviRXAMeCB5R+1UVeIs5Zm/GVbt6C/1yjj+/oc0IZJb988oJIuciNUAb3JDLiTNQ04W/TyXu6gQ69d6oJPA+LOamySGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQuzh87n1rUAgfMp+Ps95+Q7ef0MfJ8yBfibIpRcDnU=;
 b=r7vzoLMHUCpQWuX+upg5WbIWTpRgOFMBharxC1h4SHP1eaiD0lO3n0as8ICxpqgyZ0gDK21oHiPnHKU/SeurufEazlmM5jY45213y+Pp+mWAM8VdYBDSIFKwXmJbHiU5nqSC6WUx63HNUfb+3zfn/E9PBGLmsCLzRHVED06pHEI=
Received: from BN0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:408:e6::20)
 by MN2PR12MB4301.namprd12.prod.outlook.com (2603:10b6:208:1d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.18; Thu, 5 Jan
 2023 17:02:42 +0000
Received: from BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::9b) by BN0PR03CA0015.outlook.office365.com
 (2603:10b6:408:e6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT079.mail.protection.outlook.com (10.13.177.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:42 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:37 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 31/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX8
Date: Thu, 5 Jan 2023 11:01:17 -0600
Message-ID: <20230105170138.717-32-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT079:EE_|MN2PR12MB4301:EE_
X-MS-Office365-Filtering-Correlation-Id: ae112f0b-42c4-4413-d5f7-08daef3ea8b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OnTTvO1mimVCTQV1ov7Bi4claBhf/Y08f6LnmnTTDgFf2v5imoX4/Tb4IzEXxDSo5YAx/F42ddtycb3WyGDA6HvzH8Suqixl2UU0YEp4fiC4/1yIicuy1nk2H+Yg8zFzj2DmOaldXtEYd2qwcOMKGrP2qUdslkL+/Og87IYPxAu8jAxM5z6LkPmQKfzlR5ucgLypW6jVkxNYHBMruOB7EeL/r1n++Pbtvjke8iRZG7nsXMHPhBhjeW9Ne6y9JbpaB2Al2sJ5RbFADMxzfVkupzCi1M6068tKY3Z9OQ2EghW2IqxcMJ/W0hy2P0ymdHwnrTsuBkD6BoitUE1umLZDe1/AdmporAzlcdbNdj6sal5gUUx5sfRJg2V1IXAdNnbG5OQxTCBeQFshEg4MW2jijLUIIbUTanRqfV5YRCweURWoHPYFbe27fkWCb/mIXmDpAN4LMUQ/ElDcryPKY9izoBVSM1yJGNCFIANJ7UyFaH9GMPTNVeXDng00leSVbyZFjjlFWH5gkQSqBzGUoQHm8+c4NQSHBs0sbcS6CzGh1psk4CE+9PoIIs6JVbmPBoDNTCsnPFD4hcz4mjz6ubWUJo5bir9MWx0N/Q5iO5m9odR+1VaQnk7CYdCLKnLq/Oa3FGFa6oUxiqTvrY5rDlGY0h7Kz0G7OE8xT0UJ8P59aEm3TDsIduJxLW9zDhZab6/zhzI3X44OoOQxmkYHFg5hXJ1E4TqKVKo9vxbfN4dsy0r4V8o99n74Zu6Of7v/O4k/PvincYoflRjlhGnr/ItxUg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(86362001)(83380400001)(40460700003)(47076005)(426003)(8936002)(41300700001)(2906002)(356005)(82740400003)(44832011)(16526019)(478600001)(4326008)(7696005)(336012)(8676002)(1076003)(26005)(40480700001)(316002)(82310400005)(6666004)(2616005)(186003)(110136005)(70206006)(81166007)(5660300002)(54906003)(70586007)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:42.3115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae112f0b-42c4-4413-d5f7-08daef3ea8b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4301
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

The `amdgpu_ucode_release` helper is for symmetry on unloading.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 94 ++++++++++-----------------
 1 file changed, 33 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index d47135606e3e..04577e5234ae 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -924,20 +924,14 @@ static int gfx_v8_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 
 static void gfx_v8_0_free_microcode(struct amdgpu_device *adev)
 {
-	release_firmware(adev->gfx.pfp_fw);
-	adev->gfx.pfp_fw = NULL;
-	release_firmware(adev->gfx.me_fw);
-	adev->gfx.me_fw = NULL;
-	release_firmware(adev->gfx.ce_fw);
-	adev->gfx.ce_fw = NULL;
-	release_firmware(adev->gfx.rlc_fw);
-	adev->gfx.rlc_fw = NULL;
-	release_firmware(adev->gfx.mec_fw);
-	adev->gfx.mec_fw = NULL;
+	amdgpu_ucode_release(&adev->gfx.pfp_fw);
+	amdgpu_ucode_release(&adev->gfx.me_fw);
+	amdgpu_ucode_release(&adev->gfx.ce_fw);
+	amdgpu_ucode_release(&adev->gfx.rlc_fw);
+	amdgpu_ucode_release(&adev->gfx.mec_fw);
 	if ((adev->asic_type != CHIP_STONEY) &&
 	    (adev->asic_type != CHIP_TOPAZ))
-		release_firmware(adev->gfx.mec2_fw);
-	adev->gfx.mec2_fw = NULL;
+		amdgpu_ucode_release(&adev->gfx.mec2_fw);
 
 	kfree(adev->gfx.rlc.register_list_format);
 }
@@ -989,18 +983,15 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 
 	if (adev->asic_type >= CHIP_POLARIS10 && adev->asic_type <= CHIP_POLARIS12) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp_2.bin", chip_name);
-		err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-		if (err == -ENOENT) {
+		err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
+		if (err == -ENODEV) {
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
-			err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
+			err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
 		}
 	} else {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
-		err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
+		err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
 	}
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
 	if (err)
 		goto out;
 	cp_hdr = (const struct gfx_firmware_header_v1_0 *)adev->gfx.pfp_fw->data;
@@ -1009,18 +1000,15 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 
 	if (adev->asic_type >= CHIP_POLARIS10 && adev->asic_type <= CHIP_POLARIS12) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me_2.bin", chip_name);
-		err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-		if (err == -ENOENT) {
+		err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
+		if (err == -ENODEV) {
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
-			err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
+		err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 		}
 	} else {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
-		err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
+		err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 	}
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.me_fw);
 	if (err)
 		goto out;
 	cp_hdr = (const struct gfx_firmware_header_v1_0 *)adev->gfx.me_fw->data;
@@ -1030,18 +1018,15 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 
 	if (adev->asic_type >= CHIP_POLARIS10 && adev->asic_type <= CHIP_POLARIS12) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce_2.bin", chip_name);
-		err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
-		if (err == -ENOENT) {
+		err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
+		if (err == -ENODEV) {
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
-			err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
+			err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
 		}
 	} else {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
-		err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
+		err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
 	}
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.ce_fw);
 	if (err)
 		goto out;
 	cp_hdr = (const struct gfx_firmware_header_v1_0 *)adev->gfx.ce_fw->data;
@@ -1060,10 +1045,9 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 		adev->virt.chained_ib_support = false;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
-	err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
+	err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
 	if (err)
 		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
 	rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
 	adev->gfx.rlc_fw_version = le32_to_cpu(rlc_hdr->header.ucode_version);
 	adev->gfx.rlc_feature_version = le32_to_cpu(rlc_hdr->ucode_feature_version);
@@ -1110,18 +1094,15 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 
 	if (adev->asic_type >= CHIP_POLARIS10 && adev->asic_type <= CHIP_POLARIS12) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec_2.bin", chip_name);
-		err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
-		if (err == -ENOENT) {
+		err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
+		if (err == -ENODEV) {
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", chip_name);
-			err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
+			err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
 		}
 	} else {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", chip_name);
-		err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
+		err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
 	}
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
 	if (err)
 		goto out;
 	cp_hdr = (const struct gfx_firmware_header_v1_0 *)adev->gfx.mec_fw->data;
@@ -1132,19 +1113,16 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 	    (adev->asic_type != CHIP_TOPAZ)) {
 		if (adev->asic_type >= CHIP_POLARIS10 && adev->asic_type <= CHIP_POLARIS12) {
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2_2.bin", chip_name);
-			err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
-			if (err == -ENOENT) {
+			err = amdgpu_ucode_request(adev, &adev->gfx.mec2_fw, fw_name);
+			if (err == -ENODEV) {
 				snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2.bin", chip_name);
-				err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
+				err = amdgpu_ucode_request(adev, &adev->gfx.mec2_fw, fw_name);
 			}
 		} else {
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2.bin", chip_name);
-			err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
+			err = amdgpu_ucode_request(adev, &adev->gfx.mec2_fw, fw_name);
 		}
 		if (!err) {
-			err = amdgpu_ucode_validate(adev->gfx.mec2_fw);
-			if (err)
-				goto out;
 			cp_hdr = (const struct gfx_firmware_header_v1_0 *)
 				adev->gfx.mec2_fw->data;
 			adev->gfx.mec2_fw_version =
@@ -1219,18 +1197,12 @@ static int gfx_v8_0_init_microcode(struct amdgpu_device *adev)
 		dev_err(adev->dev,
 			"gfx8: Failed to load firmware \"%s\"\n",
 			fw_name);
-		release_firmware(adev->gfx.pfp_fw);
-		adev->gfx.pfp_fw = NULL;
-		release_firmware(adev->gfx.me_fw);
-		adev->gfx.me_fw = NULL;
-		release_firmware(adev->gfx.ce_fw);
-		adev->gfx.ce_fw = NULL;
-		release_firmware(adev->gfx.rlc_fw);
-		adev->gfx.rlc_fw = NULL;
-		release_firmware(adev->gfx.mec_fw);
-		adev->gfx.mec_fw = NULL;
-		release_firmware(adev->gfx.mec2_fw);
-		adev->gfx.mec2_fw = NULL;
+		amdgpu_ucode_release(&adev->gfx.pfp_fw);
+		amdgpu_ucode_release(&adev->gfx.me_fw);
+		amdgpu_ucode_release(&adev->gfx.ce_fw);
+		amdgpu_ucode_release(&adev->gfx.rlc_fw);
+		amdgpu_ucode_release(&adev->gfx.mec_fw);
+		amdgpu_ucode_release(&adev->gfx.mec2_fw);
 	}
 	return err;
 }
-- 
2.34.1

