Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5869665F1CF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C7C10E786;
	Thu,  5 Jan 2023 17:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D942C10E780;
 Thu,  5 Jan 2023 17:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOFgPUzZIAbtXTvoPIMueUHwfvlgVj3lyH6aMiJcwLwpgsAgHZsEjSFtr3dLAulJtqDDybr26hJYR92m+RU9m194RjfhQTdTuLNgxX44l76ECSg9TPT8WguXN148sE0/yA/rBueUuZwGh0uX2mlXZE868d88/y0XJ84Iwqa0PbTSqxMnOF2cXmw4+6WYMDvJd06BHP4a6gTNqZsWlB+nxD3WmvZq3Lp01qqCupuAvV+wkChOQf7n4qjCLPuzM8XbtuLynuyTL2k4UxJrvX3iPxj4hz+TvhgeP4enQPQvwYM/Q0Z3UDqyJspMHRD37BCz5mEyvp69RRMe5i1TMdJrow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xr9Os6QQD0sVxOULbzqviMYcmZjsLLWgwpt0bj8o4O4=;
 b=B2d7EzMIO4jE2Rus/oBo6rqHT1D0uqmd3K/rOAkmNvJ2u5sB5Y88DLT+gJBW90KYJErdyzmLdEWEjgo6vVDE0fpXYsR77dXZBQ1aHvJtkQ10Gqcim80E/RqgNJMSPSViAg83wlGN7oqmZJUzyYdZVtvxhJxSrQyP9yWYT3jWYqNz46+YEAk8l5xA+T1VQO1uan/+XYqYNno7n62YQBLRgWrMFJz4/oYkJ+EY1ZLZQtZJIzA+6c4PiqpuU7IVztiqr7rtmeK8ll1J/3ZriZQtsLTNEK1FPh9GKj74PW+vvXuU7Pa7Tiui/o/i3N2iHpXBhVvSt2wlcFnU45pyj2ksIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xr9Os6QQD0sVxOULbzqviMYcmZjsLLWgwpt0bj8o4O4=;
 b=NNukwxYGBV8izMtvI9TMTYPFs0Xg43hf9jSGuRlEhpOfUkV5cbeB2lYBeD/U6ud6DIClZKJyyvw7XwIAo1KGyRFCigWjTHNUGNnc2i3659lmUFhuVCNYr4tZVb2zI7LgD+Jhzf8trtq9LgN3CNI7bR0/Nxhy+xw+UZjzUd386Kc=
Received: from BN9PR03CA0381.namprd03.prod.outlook.com (2603:10b6:408:f7::26)
 by SN7PR12MB7786.namprd12.prod.outlook.com (2603:10b6:806:349::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:20 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::9a) by BN9PR03CA0381.outlook.office365.com
 (2603:10b6:408:f7::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 17:02:20 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:18 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 17/45] drm/amd: Load GFX10 microcode during early_init
Date: Thu, 5 Jan 2023 11:01:03 -0600
Message-ID: <20230105170138.717-18-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|SN7PR12MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab08509-f46e-4caf-e60c-08daef3e9b7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: epndvYq6y9oABAsm/CMpb5Ab0JPozdO2tVj8Vw014lQyifdgFw5/UKONe/a7580y/lPDi0Kp8xk8uSF/r4I4qOpL4KXVWN0aiK2fyqfLJTKgl12FCeCCTvIyaSryzj/5LzYxbOmsSXQSfGGQ9hiX6J0STr/PQ3k6UHEGvsMKoPTUIkL5fEpgiUKii9I9nl3gYklzupLDWicyGzlPgrMzgspCflRS0w7h290hX7omZqLq85Q3xI1Jfk/ic4wsAIXYsPkt7kZ1Ih/Lw+MhA6vVGPgLViMm1VY/Ns49BxzcESzA/dZH6KsDV9KxmCbjNho1jkazrU69GsdneGr8Xy4NoZfYMiYR7e5IEc+xZTG/rgSHKD/pBFmUb39C0XouyngMN5QSn6JxvhQqTT11qNJeejx35gYMA3KauiDpKR9UtPJ/u6dBNeuZMDE5T8G5ID6YTTo4xl6OU6gl7tvKXrDu61vzwk0C6q8Vm0sI3j1uwLaxDnrAjAB/EHeoLob7D58AXjpF+ZLFvS/lH1lJXxjXVvssltxeVdM0eLrTTowoKdATatO5Fu1ae8ApB22Tc3Dk3HFP/uLlA9JDCoqkDR1sCl9F821cBOAPNChQIxUypf0kpAdPC1nI+zYc+wg6sbJLYAAHRUL05v/aYVT7Y5Z7LO4gS1991GWnR7gJCFyrEHobAh0gRCYozvSmpJPMVqWXrou5n+XWv3mfHZ0C2nRzbJGmZZx2W5DVZJYQNm2xVMQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(426003)(186003)(26005)(83380400001)(1076003)(16526019)(336012)(86362001)(2616005)(47076005)(40480700001)(40460700003)(82310400005)(356005)(36756003)(36860700001)(44832011)(81166007)(82740400003)(54906003)(478600001)(316002)(110136005)(2906002)(8936002)(41300700001)(8676002)(5660300002)(70206006)(70586007)(4326008)(6666004)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:20.1607 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab08509-f46e-4caf-e60c-08daef3e9b7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7786
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

Simplifies the code so that GFX10 will get the firmware
name from `amdgpu_ucode_ip_version_decode` and then use this filename
to load microcode as part of the early_init process.

Any failures will cause the driver to fail to probe before the firmware
framebuffer has been removed.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 84 ++++++--------------------
 1 file changed, 18 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 140bb18ff768..6983acc456b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -3968,9 +3968,9 @@ static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_device *adev)
 
 static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 {
-	const char *chip_name;
 	char fw_name[40];
-	char *wks = "";
+	char ucode_prefix[30];
+	const char *wks = "";
 	int err;
 	const struct rlc_firmware_header_v2_0 *rlc_hdr;
 	uint16_t version_major;
@@ -3978,71 +3978,31 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 
 	DRM_DEBUG("\n");
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
-	case IP_VERSION(10, 1, 10):
-		chip_name = "navi10";
-		break;
-	case IP_VERSION(10, 1, 1):
-		chip_name = "navi14";
-		if (!(adev->pdev->device == 0x7340 &&
-		      adev->pdev->revision != 0x00))
-			wks = "_wks";
-		break;
-	case IP_VERSION(10, 1, 2):
-		chip_name = "navi12";
-		break;
-	case IP_VERSION(10, 3, 0):
-		chip_name = "sienna_cichlid";
-		break;
-	case IP_VERSION(10, 3, 2):
-		chip_name = "navy_flounder";
-		break;
-	case IP_VERSION(10, 3, 1):
-		chip_name = "vangogh";
-		break;
-	case IP_VERSION(10, 3, 4):
-		chip_name = "dimgrey_cavefish";
-		break;
-	case IP_VERSION(10, 3, 5):
-		chip_name = "beige_goby";
-		break;
-	case IP_VERSION(10, 3, 3):
-		chip_name = "yellow_carp";
-		break;
-	case IP_VERSION(10, 3, 6):
-		chip_name = "gc_10_3_6";
-		break;
-	case IP_VERSION(10, 1, 3):
-	case IP_VERSION(10, 1, 4):
-		chip_name = "cyan_skillfish2";
-		break;
-	case IP_VERSION(10, 3, 7):
-		chip_name = "gc_10_3_7";
-		break;
-	default:
-		BUG();
-	}
+	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 1) &&
+	   (!(adev->pdev->device == 0x7340 && adev->pdev->revision != 0x00)))
+		wks = "_wks";
+	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp%s.bin", chip_name, wks);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp%s.bin", ucode_prefix, wks);
 	err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_PFP);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", chip_name, wks);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", ucode_prefix, wks);
 	err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_ME);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", chip_name, wks);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", ucode_prefix, wks);
 	err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_CE);
 
 	if (!amdgpu_sriov_vf(adev)) {
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
 		err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
 		/* don't check this.  There are apparently firmwares in the wild with
 		 * incorrect size in the header
@@ -4051,7 +4011,7 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 			goto out;
 		if (err)
 			dev_dbg(adev->dev,
-				"gfx10: amdgpu_ucode_validate() failed \"%s\"\n",
+				"gfx10: amdgpu_ucode_request() failed \"%s\"\n",
 				fw_name);
 		rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
 		version_major = le16_to_cpu(rlc_hdr->header.header_version_major);
@@ -4061,14 +4021,14 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 			goto out;
 	}
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", chip_name, wks);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", ucode_prefix, wks);
 	err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1);
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", chip_name, wks);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", ucode_prefix, wks);
 	err = amdgpu_ucode_request(adev, &adev->gfx.mec2_fw, fw_name);
 	if (!err) {
 		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
@@ -4077,6 +4037,8 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 		err = 0;
 		adev->gfx.mec2_fw = NULL;
 	}
+	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
+	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2_JT);
 
 	gfx_v10_0_check_fw_write_wait(adev);
 out:
@@ -4239,19 +4201,11 @@ static void gfx_v10_0_mec_fini(struct amdgpu_device *adev)
 	amdgpu_bo_free_kernel(&adev->gfx.mec.mec_fw_obj, NULL, NULL);
 }
 
-static int gfx_v10_0_me_init(struct amdgpu_device *adev)
+static void gfx_v10_0_me_init(struct amdgpu_device *adev)
 {
-	int r;
-
 	bitmap_zero(adev->gfx.me.queue_bitmap, AMDGPU_MAX_GFX_QUEUES);
 
 	amdgpu_gfx_graphics_queue_acquire(adev);
-
-	r = gfx_v10_0_init_microcode(adev);
-	if (r)
-		DRM_ERROR("Failed to load gfx firmware!\n");
-
-	return r;
 }
 
 static int gfx_v10_0_mec_init(struct amdgpu_device *adev)
@@ -4619,9 +4573,7 @@ static int gfx_v10_0_sw_init(void *handle)
 
 	adev->gfx.gfx_current_status = AMDGPU_GFX_NORMAL_MODE;
 
-	r = gfx_v10_0_me_init(adev);
-	if (r)
-		return r;
+	gfx_v10_0_me_init(adev);
 
 	if (adev->gfx.rlc.funcs) {
 		if (adev->gfx.rlc.funcs->init) {
@@ -7599,7 +7551,7 @@ static int gfx_v10_0_early_init(void *handle)
 	/* init rlcg reg access ctrl */
 	gfx_v10_0_init_rlcg_reg_access_ctrl(adev);
 
-	return 0;
+	return gfx_v10_0_init_microcode(adev);
 }
 
 static int gfx_v10_0_late_init(void *handle)
-- 
2.34.1

