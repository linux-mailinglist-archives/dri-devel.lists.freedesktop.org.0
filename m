Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA85765DA5C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5A210E56D;
	Wed,  4 Jan 2023 16:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8C610E547;
 Wed,  4 Jan 2023 16:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVlrI+dX9jOYVxMAN9fV5yXFm4cDfDMcPQLZ/XByO1sOT1hD43e/eA9VS7fvyqeMfpanA9evcRWTkK9kc9soXHDHmRfBnd7JwFxKwzTv8Z8HR/zu6b9XwxNkAmNWaWrMDhaXZ8ytB7OhHRm41qFBNcNYzg2Hsr9f+4Tqu9gCfQMY4QphfhV1rShP++c8aKcbrywBf7wmzK1JAuGiVjMVjN0sup6po+9KqD+XldrrVuBg1kJg4oLOGUAGMgSISzRNJPSp3ehkP0pcVKioVSGqCeuhKrQMFkn/QFp53y+qEdiAD3aaP9jNel3ORZatdXrKyhUi4u9IDizzXT8lJEI3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdFj2J0vZKmh3A/vZax61hV9ZXdK0jadgP+W7c8sDWQ=;
 b=UDmwiAQ9jA6inoQbC+7Il7QkQGl0ME6izJO/3OqcKGe4/3I0/loVbqAOqdeeqxh7/+kU7wrWengfHd0dF0G1GWTXvQEVf5HhbtQjB+KR6XW5/5W6pR9whT+Yso8RLqat2zgtyhLZdJvd7qFhpZJ4pUghPFRFBIvNxDmEJ3PmuZ4Cz2NS7WbkpQq2d2jcOQAOiLizJv4BVnWxuQT7S4rJvsP0JMvlutrFoDcu3A/02P/j/HWjfQAvIXTkxAZEQvRhZ582rYcbNZxa7XxepD8SWQ7+tFN4G7dOE1VJIyWv5Jybf9JEHfsrYUG2dItb9VrcQIuUQQs3xtOcT4Dgw2ZkVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdFj2J0vZKmh3A/vZax61hV9ZXdK0jadgP+W7c8sDWQ=;
 b=XVG4D7TS68Hrdci9XcCGw6D0CISwPwkYqHkmXM685YXeU3lnv4p00vwmXdoQv0YS4X+dp81+9dsbr0l9d/OznzUKc6UcbFG2pUCgtRtQ3BqBijBZC9uAPKaM6DMS/OSSGIhd6vUzyJiptigAet8MsX0WwaLNgXlmRWU/LTTC0qc=
Received: from MN2PR16CA0050.namprd16.prod.outlook.com (2603:10b6:208:234::19)
 by MW4PR12MB6777.namprd12.prod.outlook.com (2603:10b6:303:1e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:43:09 +0000
Received: from BL02EPF00010206.namprd05.prod.outlook.com
 (2603:10b6:208:234:cafe::d2) by MN2PR16CA0050.outlook.office365.com
 (2603:10b6:208:234::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010206.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:43:09 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:43:07 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 24/45] drm/amd/display: Load DMUB microcode during
 early_init
Date: Wed, 4 Jan 2023 10:40:13 -0600
Message-ID: <20230104164042.30271-25-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010206:EE_|MW4PR12MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 8582c4d7-4e03-4992-b595-08daee72c315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 64tBMjnODcEy/G+doQ6W5GYjog3ddZHeeB7bc7q/rzl9Nltlbb8fMbQn3r6oWx7v6cxDkR0Hrz83WRI694WV3h9Z4d+kNo5NhHh1T38xZmPV9Ak5hFsyN0FFhA9OXWvwvQUtfrhUUd0yQ07WXf+/bZXj0YOXTTv7XL92k3S53lBHgicSngZk1YJSyEBSwo5o3wwdTQNu4QOEcFYKbAeK2meXBclw5xiPVgF8ABXqifM7Mb19cIRxX9010JuWYTXC+KtEEKbYbnJtTY9cLPGTysWflUBm8sWSFQ4gGt0UOrz79iWh5OWoqtoZBbXaYlpPvHyIcDrze+0gegREc2Pc7LvcjOAMNACJbn0+SnSZMwo7VQ3O753DIHjNx7krFlPUSNs7pPH5CP9UTisYGTnH6F3H9Or1fcaXB/YYi6FX4S1DCiccqEaf4B8YdNvHsUOPhR3KPjfFyGWl349Ty9F+Ds5p3uz7kIe/QQ8Iondha5FYdy+H5Zd39PsHIHfy2q5SNPAh9xXJ8T31Gb0r+13RKsm0xI6SlcheHiPJMNxlvLtnpdJ2xbZ/Y+G+2o6zsAM+9YTtbipOmONVwASqs1OPXfYef/9IwwmPSc2MQltEdA9KgvF3kUBrj5lP2mk7dv+xV13EtiDCV9GeDFX43hnaK4cEgyJLPuvk/vaimDYlozhuhkfMO7v0ifFKQqqBZHv0vDFwJqQ1ttyaIwEGy2AvpJbh5AUc/Neh8xpvq6U79AU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(46966006)(36840700001)(40470700004)(47076005)(83380400001)(426003)(2616005)(186003)(82310400005)(16526019)(26005)(336012)(7696005)(40480700001)(6666004)(40460700003)(86362001)(36860700001)(36756003)(81166007)(356005)(1076003)(82740400003)(41300700001)(4326008)(8676002)(2906002)(5660300002)(44832011)(8936002)(316002)(478600001)(110136005)(70206006)(54906003)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:43:09.2540 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8582c4d7-4e03-4992-b595-08daee72c315
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6777
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

