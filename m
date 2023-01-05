Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB8D65E3F4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FB610E676;
	Thu,  5 Jan 2023 03:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73F310E66D;
 Thu,  5 Jan 2023 03:44:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBmty4AaE7ONfEK+fgos4MU/Rplc8BmI84ACiFOhtdvy9qY84TiBRaE7R4UwxPgXYBCi+MDyeZASAJyo0xp4OHoYdpVz9bQR4HgL7ks//RdoeddUx7VrILD/YmD14Pe8jJ94IFwBvMlGMnGLljFGkQo74KIfoPoHW+RY3D8PIwyvRPW4L3Ei8sFT+hRP7UrBdGNE4kXaYQFCnQ4sy2CPh0p+AEbmTb9hEAK6KnSqsCZ5tfGR//I4h6lwhunAIKKD0pYDowIrH013q0iL0OCtr1Q7KWZRfJ0HxUiOxBudl86rFcr8Oi8dLWaJmRcPsw8F5JoKCSFM698mXF/Rkry1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yn1iOQsTBw8VECIO2gA0bXyxSc5nDUlNrUfTmSlDRno=;
 b=eLvmp8Rrh+n7vvuly0xnSlwibme0kSUIxS3YnP+4SlCYgVqjqo6BXSRq9S38y/H1G76d/cKa0vJ1wmIHKfoMSh6xiLP0lfdKUJnJCdhzsSSEKM5EJ82eXBGi8xn3JpNM1vWZo7tL4s4kSuVvDCx+y1bDDj8veLMpbsQARTWoOEWAYEnvrFjo2ec8pimwMe1HRYO+g1oihHcQxtqrD7bmAMbyJw/3KDanHpVHrmUi4M8R35OJAQyXrN5RIfAlZO3L0B11TwYCIw7V8CipKSYIWVz2Agp/zD2kjH/kg3ynUsPbnAbwUUuBqRA2Ie/x2FM6eznHoJsBJ6+6X1ER5J+o+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yn1iOQsTBw8VECIO2gA0bXyxSc5nDUlNrUfTmSlDRno=;
 b=umZFqEtTjmlagDwoJk+deQnw6e7i9MAWv2bjaKnDsafra9wNvFWhFgh+IWxLjgR6Pa3iddK01uXBByOlLh81LlitEoqSbhsZrjOWarLwneU8Uz9TeKL+5ha6dh/CTMaXG3Hr3ShBdnZ07Q3P6S3QVsz+Vr8OHk5ZAx1ITROALAU=
Received: from BN0PR03CA0038.namprd03.prod.outlook.com (2603:10b6:408:e7::13)
 by CO6PR12MB5396.namprd12.prod.outlook.com (2603:10b6:303:139::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:40 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::b1) by BN0PR03CA0038.outlook.office365.com
 (2603:10b6:408:e7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.6 via Frontend Transport; Thu, 5 Jan 2023 03:44:39 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:36 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 24/45] drm/amd/display: Load DMUB microcode during
 early_init
Date: Wed, 4 Jan 2023 21:42:58 -0600
Message-ID: <20230105034327.1439-25-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT046:EE_|CO6PR12MB5396:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c857138-778a-426b-0226-08daeecf2c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N/D/CmSDRQI94f6g0FXsCaeWca8JTA6yyVw186s4SrMq0bAJFXdlBpIpECCOVNy8sdGtDCWOZcOlVO7Q8BEqhh4IJ9CEpBqQA+xnnD2Pi+W34a/OR4cZ9j6g2vnDKPbXabg0ALRWOHemaGbQz3j8u8qi39HWP3n2Xg3zqcqiRi86gFc5Ze7lOc5I5UmyZS8s3VAqyhY1cnZBftWlz73/HbdzX/5UpHzd2+vZzspL1Jv3Mn6sOfdZP+krYgoDcMLCwY3po1cVlXUUd+dWCWmFiER87nqy5e/2cm7lotb9AheH74mlmOVY1KUJzD7FXeUOFXAf/HWko+67Q5l9SCSyzNZFnfi7bUHCCzfilWFtaLnxv7hcyjds4US1O+iabNjwxM1P2e28B/63VrAiP8Aj858XggCNE5M0lOGMQoYwjKRn6q2bzL+xRjBOmfeT+dHKZMazFTvO3MEMuV40u3kPGisZ39LKmwST7QB6DxaOvou6mIfRStV7W2+j2pL2bpKeERBDpmALXy9u3LjYi8pHEv/vZxC7Phk+jeUlk9JaVU2bLoD0R/eIpSSbUo+vvs9Hh4G0eF/pAvmaPyENZM51XWAHNCB3qN45DiC3aJlHT4Q0KbYgxsTbcctN8nOAbFFUBZLBNjWTaozGzm6qiiqDvgmwLAAqVvT0sFjOh4gA2oALI64PgGvGJKIKomuw800kqFC/0JmLmlcxH/+JCn1HUgKZnRkYR9RCkMN3rUHZqAQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(426003)(47076005)(336012)(7696005)(16526019)(26005)(186003)(6666004)(40480700001)(36756003)(82310400005)(86362001)(40460700003)(36860700001)(82740400003)(81166007)(1076003)(356005)(2616005)(8676002)(8936002)(4326008)(41300700001)(5660300002)(44832011)(2906002)(478600001)(316002)(70586007)(110136005)(54906003)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:39.9612 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c857138-778a-426b-0226-08daeecf2c97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5396
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

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
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

