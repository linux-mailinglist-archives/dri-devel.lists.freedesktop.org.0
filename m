Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5C165C984
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A2D10E4EC;
	Tue,  3 Jan 2023 22:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C635610E4F8;
 Tue,  3 Jan 2023 22:20:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBW/9OQuXiqVY8Ur8xeGtS8Bkoc8lSkQ27o6JYsebjrs3uXmBlFO9g1gKTe88AqG5gGLM1hXz+MA8rcO8TLe8Y7y/7IwUxFtPYcP7/JtnarFdgFsMFY+20938fQYCGB08cA7i4o95tz3M+Byl2jCAvZBJGSf4e07UL8oyxRVxYAYr4fuxc5ZfAjLWL/HRvrcHtiZNgKLYHz5I8s3ahXMRXN7+LBh2gyjsF3qGFsZxDhIkHHWkmGIe/9sfpcnPNvVnuWgaOUTj7967FCnqX4HjxsF03/i6TXEgeKrqF9wuZNXwY0peRBLj42kFcUbNWXd4YuT9Q/cIHT1LAU5u5yJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKm809+0PaVevVhICGxvYdEif2gQRF4m7a1dzZ2fI8k=;
 b=M2CoohDK4OfSKnhvnmNcYc26WDYgGDuKWodqmi5wwu0DSjzP7e4MYg3E55ZAVVF3IehLShADS6cIY+wE57olr3A+uYIHkZ+GwnNOHCCVD5r51Rf6E3onRLwojZoAJEwBWjIK28FXnkuE6swREPf2j1Yj66Z73UAvHJy+wM7zypmNz6w0KID4CggkmBJ+EAjjf8m2RiN0Coy61dEhO7j2KN8m1zXBML+QlshLN8p7xk09VU2shq4/NY6TfsSf8XSartMTuYja/Isfuo90Gym0yk+Q5YwQDJPaGrSjz76OCny97hJZlQq7oeud8OznYklo/EExt2aIHmnO8uz1N25Ezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKm809+0PaVevVhICGxvYdEif2gQRF4m7a1dzZ2fI8k=;
 b=l/Fiw6TGz+58fUPXlsHJk8vr0/AH92yRzOwJ7XtsLe2tYnr8tOb23JGfMPpPqcJ6YpkBmk5dm2XBgwzOVfEEvb6PAaoO9NhzGRw+FQG+JTbdNiMta1iuX61DPOzIM7mnqPGwp/bwx5f4AxTrDyZh4W4a0L7E48YiSUIVXVgX5CY=
Received: from DS7PR03CA0144.namprd03.prod.outlook.com (2603:10b6:5:3b4::29)
 by SJ0PR12MB5453.namprd12.prod.outlook.com (2603:10b6:a03:37f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 22:19:59 +0000
Received: from DS1PEPF0000E655.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::d) by DS7PR03CA0144.outlook.office365.com
 (2603:10b6:5:3b4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E655.mail.protection.outlook.com (10.167.18.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:58 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:55 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 24/27] drm/amd/display: Load DMUB microcode during
 early_init
Date: Tue, 3 Jan 2023 16:18:43 -0600
Message-ID: <20230103221852.22813-25-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E655:EE_|SJ0PR12MB5453:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e70b35-dd60-465f-1486-08daedd8a67a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UBJ+U5jWfQwZ9STwOYsteCqTzVFLsjX3dREKXjjuao2a0j7tHhBkTKpdjDFlqZSEg5zaP9oNqVzXs/HHlYxrBoVmx3qRU0nCbgIF6L2UBkUJyWE9rjkNfESUYqixwRHIClQgUmSyRf1VrrKkMQasqkGp5wA6cTzbuRqbrHQpNTkqYQbnD8LXSPotk/l9hClemUT+qCBJkrE7Ij4MbBjYRdgQRUC033e/n0EQvouVfvxctUtmNjD1JPLiAIHrm3p8Qbv8bQ8fZz5TPnceXdvYP7eRiqwhhpnmZPTWF3meXJ4h0jECxL8uN1jUzxsDiJYsyJBo6TpT4GhgzJF+mNm1JcB6C6JDcdEaYJ7XvMSJm/BrPpEgxCx4Vl7Q0TEyitcVOv/CC+tIAr5PMdBw/O6pIJLgxWNvt+ks37FM5H9sJCEre2jqFfRPDTNP/e5tGlKbG0lChym13WB7LuZqmQ210PWucRjmOUNDB8e3Q7FnrOSx5j6JKRETNZC3aYjtbTUGcfN9Y5XPlLNrWP4wfdmVcMHwBykRDFmzcwLDMt9V72HW7KeuEEZ/yefGha4uxHZsKUFBWsZcw81T3Cb8wirI9sZxj6OO4f6c9jZX+gC1ftyfQS2aH5SeiBnz3uu4W41haHgrIIKQHu7539ojHX/rKO26OO09BcH0Q8jFVH6HX4J+sVke66kYCT2j22++682yuwbcIlR/b0mEpCPBo1e06mP/jee2i4IRhb+ZZ+RPObE4aGqUI97dJcVYSTuXXcM4WKchTaEhBiXVIRXbWdfbMw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(46966006)(40470700004)(36840700001)(47076005)(36860700001)(2616005)(83380400001)(336012)(1076003)(426003)(40480700001)(86362001)(40460700003)(82310400005)(81166007)(356005)(82740400003)(36756003)(5660300002)(110136005)(54906003)(316002)(2906002)(41300700001)(44832011)(4326008)(70586007)(8936002)(8676002)(70206006)(26005)(186003)(478600001)(16526019)(6666004)(7696005)(22166009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:58.7146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e70b35-dd60-465f-1486-08daedd8a67a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E655.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5453
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
 Lazar Lijo <Lijo.Lazar@amd.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If DMUB is required for an ASIC, ensure that the microcode is available
and validates during early_init.

Any failures will cause the driver to fail to probe before the firmware
framebuffer has been removed.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * New patch
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 89 ++++++++++++-------
 1 file changed, 58 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4829b5431e4c..eeccc8af0320 100644
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
+	r = amdgpu_ucode_load(adev, &adev->dm.dmub_fw, fw_name_dmub);
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

