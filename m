Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA2165F1FD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8233410E7C0;
	Thu,  5 Jan 2023 17:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8401F10E78F;
 Thu,  5 Jan 2023 17:02:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNOMaKYBNWF9EEJkxlQuw6jAlNE2SacYqcLwxMUf/x+GT3mZ2rLKUTKdcViK8jbPgmHW47YGdS4qjK36aLsZuyHLU30vhXuhWXHcewVg0guopfSGvFh+A3Mea4DeJm+XUaGXgTZlIAPtpSbvp07jfp1/FeJBsbCrwKvlYsCMyzOZiRsb2RG/jEXjq96rdLrRQo6eKK04wdvG0BL8cPL4DFINf869WM2sq/w/TODJiSmKnR8AyVQe3Bi7AYDC826Hzzc/PGBiHgFTPtW9URLnMETzrYtXfeGj+4br/bPnn3R3ZkA1/Ggw+8ADt/VoUcQ4cOn/FmJA0Frc8XoQemDr2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVuSHKTayz7Me3m8+KFvZ1j8zsL1EFktXCXdIJrEqQE=;
 b=KHOTmlGPARhzrJiXNdvOvPhXtgRVSC4hMSquejpfUc1oe44BdsD3B2jZ86yM/+CApEpDGELT3nJN4gvwlHWyjQq/BfAYvMKU30HZxU8eKaXh1I3Nazdvxi4bxKDMEHebbctub/SjmvBAi/c4fmo5Ifw/aDyK1xxOsSw3K3Q3PzUyZwkaAMgtLGrBPydz/wguf2a1mnVJw5zBjTkvfJ9LsW7pl0uRsufMYCw5RnzLxFIJ/duI3rEVrubvlFuTol6IUoGgrD6fOkq718OI4a4ttFDgF7DkrPCQtmnQFQ9Yu4P43Bdn22TYdYCq8DWSfx/uuUGosSndQghZbinf93FB/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVuSHKTayz7Me3m8+KFvZ1j8zsL1EFktXCXdIJrEqQE=;
 b=FJ6FkkG6xqXVRXLdCyEuzfHrS+W2jjdfnsZW3+/4wcDPuDvxwp4pGAVA4PhCnNWzowuyUiGqOGYeUnSBFbAatuC1Pl9rEKKs8P0kzNgS7u50i3jXCzLK1lZKdFJMZv3u5GNo7RAiGyy8c6rBIiNhcbgji4nWVTHFYbJgH1Fjc6g=
Received: from BN9PR03CA0989.namprd03.prod.outlook.com (2603:10b6:408:109::34)
 by DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:37 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::fc) by BN9PR03CA0989.outlook.office365.com
 (2603:10b6:408:109::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:37 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:28 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 24/45] drm/amd/display: Load DMUB microcode during
 early_init
Date: Thu, 5 Jan 2023 11:01:10 -0600
Message-ID: <20230105170138.717-25-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT032:EE_|DM6PR12MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f86b6e-58a0-4744-e81a-08daef3ea5aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 56RBuaO8EIzW+17R6ePu5lAY2WYGQOH2tDsLAaBNlN5G00VJED+pJEm+ebd3XbiD3+f3kwDyB7hL61AWY6IPDNiToaw6kX6uFlChZMqDjWhhVC4eP/O0TNMQQpU9f4bryj+TwGEIGvNNYJfPIO8uFy4R3gxflHMnwJEg41cABDLzLwlDtJc0aaR8a7/Cqv5W7rfmaKkBlGzBPOruTHDDlapWFVynbNV/XLvJ3vRLjgy89tmzImPJspzbXQqVYjabslFotq1ShxJuKRyAm4oChY7s6yQsGjTIyBsV9wzyyV9pXm3VyMuoRx1U3xiC8I3qNMnQOhpz04H8vdon+i4tlRF9D1HXbxtJz/xtLpKfaCaEU1BHzJBFwdIw6CRe0G4fcfCetnpKY+fBlnDrCBC9Re6NcyHRb/bYjQihYs2bk+W3qPEzNKrAVETA9OCTIB6oOYeRHOSq0H+GLxmf1G85PGv/tKb3Yc2/pOLSxRQxLGTCEJmjPxtVneedsSYtqETz5ALJD9pFNaGUHSjc+uB2ykE6Y9fSCQiEh19Z6qLmOHmcUMnO+MYiqrZ/y7ImIBIM1GhjzCOrwz6JtpqAV3MP80FxVuRNII1kN4TYFCXyaY6QvrzzyGomSmK/ppSdvdv1t5OAjw4h+1gQYsjeJY6Cfb9G8r/oy4BEr3m8HTPHHCKPXuH/5XQMvnb3Kxg84WJWao+R/dJrM4McJO3OEiOhATxzreRxjDFFBlEWJj+S8D4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(426003)(47076005)(186003)(26005)(2616005)(336012)(16526019)(40480700001)(83380400001)(86362001)(40460700003)(82310400005)(36756003)(356005)(81166007)(1076003)(36860700001)(82740400003)(44832011)(2906002)(110136005)(54906003)(316002)(41300700001)(8676002)(8936002)(5660300002)(4326008)(70206006)(70586007)(6666004)(478600001)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:37.2173 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f86b6e-58a0-4744-e81a-08daef3ea5aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Carlos Soriano Sanchez <csoriano@redhat.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If DMUB is required for an ASIC, ensure that the microcode is available
and validates during early_init.

Any failures will cause the driver to fail to probe before the firmware
framebuffer has been removed.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 89 ++++++++++++-------
 1 file changed, 58 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4829b5431e4c..c8c5d37c8b3a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1945,7 +1945,6 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
 	struct dmub_srv_fb_info *fb_info;
 	struct dmub_srv *dmub_srv;
 	const struct dmcub_firmware_header_v1_0 *hdr;
-	const char *fw_name_dmub;
 	enum dmub_asic dmub_asic;
 	enum dmub_status status;
 	int r;
@@ -1953,73 +1952,46 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
 	switch (adev->ip_versions[DCE_HWIP][0]) {
 	case IP_VERSION(2, 1, 0):
 		dmub_asic = DMUB_ASIC_DCN21;
-		fw_name_dmub = FIRMWARE_RENOIR_DMUB;
-		if (ASICREV_IS_GREEN_SARDINE(adev->external_rev_id))
-			fw_name_dmub = FIRMWARE_GREEN_SARDINE_DMUB;
 		break;
 	case IP_VERSION(3, 0, 0):
-		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0)) {
+		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
 			dmub_asic = DMUB_ASIC_DCN30;
-			fw_name_dmub = FIRMWARE_SIENNA_CICHLID_DMUB;
-		} else {
+		else
 			dmub_asic = DMUB_ASIC_DCN30;
-			fw_name_dmub = FIRMWARE_NAVY_FLOUNDER_DMUB;
-		}
 		break;
 	case IP_VERSION(3, 0, 1):
 		dmub_asic = DMUB_ASIC_DCN301;
-		fw_name_dmub = FIRMWARE_VANGOGH_DMUB;
 		break;
 	case IP_VERSION(3, 0, 2):
 		dmub_asic = DMUB_ASIC_DCN302;
-		fw_name_dmub = FIRMWARE_DIMGREY_CAVEFISH_DMUB;
 		break;
 	case IP_VERSION(3, 0, 3):
 		dmub_asic = DMUB_ASIC_DCN303;
-		fw_name_dmub = FIRMWARE_BEIGE_GOBY_DMUB;
 		break;
 	case IP_VERSION(3, 1, 2):
 	case IP_VERSION(3, 1, 3):
 		dmub_asic = (adev->external_rev_id == YELLOW_CARP_B0) ? DMUB_ASIC_DCN31B : DMUB_ASIC_DCN31;
-		fw_name_dmub = FIRMWARE_YELLOW_CARP_DMUB;
 		break;
 	case IP_VERSION(3, 1, 4):
 		dmub_asic = DMUB_ASIC_DCN314;
-		fw_name_dmub = FIRMWARE_DCN_314_DMUB;
 		break;
 	case IP_VERSION(3, 1, 5):
 		dmub_asic = DMUB_ASIC_DCN315;
-		fw_name_dmub = FIRMWARE_DCN_315_DMUB;
 		break;
 	case IP_VERSION(3, 1, 6):
 		dmub_asic = DMUB_ASIC_DCN316;
-		fw_name_dmub = FIRMWARE_DCN316_DMUB;
 		break;
 	case IP_VERSION(3, 2, 0):
 		dmub_asic = DMUB_ASIC_DCN32;
-		fw_name_dmub = FIRMWARE_DCN_V3_2_0_DMCUB;
 		break;
 	case IP_VERSION(3, 2, 1):
 		dmub_asic = DMUB_ASIC_DCN321;
-		fw_name_dmub = FIRMWARE_DCN_V3_2_1_DMCUB;
 		break;
 	default:
 		/* ASIC doesn't support DMUB. */
 		return 0;
 	}
 
-	r = request_firmware_direct(&adev->dm.dmub_fw, fw_name_dmub, adev->dev);
-	if (r) {
-		DRM_ERROR("DMUB firmware loading failed: %d\n", r);
-		return 0;
-	}
-
-	r = amdgpu_ucode_validate(adev->dm.dmub_fw);
-	if (r) {
-		DRM_ERROR("Couldn't validate DMUB firmware: %d\n", r);
-		return 0;
-	}
-
 	hdr = (const struct dmcub_firmware_header_v1_0 *)adev->dm.dmub_fw->data;
 	adev->dm.dmcub_fw_version = le32_to_cpu(hdr->header.ucode_version);
 
@@ -4513,6 +4485,61 @@ DEVICE_ATTR_WO(s3_debug);
 
 #endif
 
+static int dm_init_microcode(struct amdgpu_device *adev)
+{
+	char *fw_name_dmub;
+	int r;
+
+	switch (adev->ip_versions[DCE_HWIP][0]) {
+	case IP_VERSION(2, 1, 0):
+		fw_name_dmub = FIRMWARE_RENOIR_DMUB;
+		if (ASICREV_IS_GREEN_SARDINE(adev->external_rev_id))
+			fw_name_dmub = FIRMWARE_GREEN_SARDINE_DMUB;
+		break;
+	case IP_VERSION(3, 0, 0):
+		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
+			fw_name_dmub = FIRMWARE_SIENNA_CICHLID_DMUB;
+		else
+			fw_name_dmub = FIRMWARE_NAVY_FLOUNDER_DMUB;
+		break;
+	case IP_VERSION(3, 0, 1):
+		fw_name_dmub = FIRMWARE_VANGOGH_DMUB;
+		break;
+	case IP_VERSION(3, 0, 2):
+		fw_name_dmub = FIRMWARE_DIMGREY_CAVEFISH_DMUB;
+		break;
+	case IP_VERSION(3, 0, 3):
+		fw_name_dmub = FIRMWARE_BEIGE_GOBY_DMUB;
+		break;
+	case IP_VERSION(3, 1, 2):
+	case IP_VERSION(3, 1, 3):
+		fw_name_dmub = FIRMWARE_YELLOW_CARP_DMUB;
+		break;
+	case IP_VERSION(3, 1, 4):
+		fw_name_dmub = FIRMWARE_DCN_314_DMUB;
+		break;
+	case IP_VERSION(3, 1, 5):
+		fw_name_dmub = FIRMWARE_DCN_315_DMUB;
+		break;
+	case IP_VERSION(3, 1, 6):
+		fw_name_dmub = FIRMWARE_DCN316_DMUB;
+		break;
+	case IP_VERSION(3, 2, 0):
+		fw_name_dmub = FIRMWARE_DCN_V3_2_0_DMCUB;
+		break;
+	case IP_VERSION(3, 2, 1):
+		fw_name_dmub = FIRMWARE_DCN_V3_2_1_DMCUB;
+		break;
+	default:
+		/* ASIC doesn't support DMUB. */
+		return 0;
+	}
+	r = amdgpu_ucode_request(adev, &adev->dm.dmub_fw, fw_name_dmub);
+	if (r)
+		DRM_ERROR("DMUB firmware loading failed: %d\n", r);
+	return r;
+}
+
 static int dm_early_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
@@ -4645,7 +4672,7 @@ static int dm_early_init(void *handle)
 #endif
 	adev->dc_enabled = true;
 
-	return 0;
+	return dm_init_microcode(adev);
 }
 
 static bool modereset_required(struct drm_crtc_state *crtc_state)
-- 
2.34.1

