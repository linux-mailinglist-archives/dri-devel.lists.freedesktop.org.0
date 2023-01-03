Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C04F765C972
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC5210E4ED;
	Tue,  3 Jan 2023 22:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36A410E411;
 Tue,  3 Jan 2023 22:19:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPhrQiW8lSFukPp0oUUPIr/SnrvQJKnFuUNTHN9g+NSNo2I41QpqRGsWibL/5OvAeKO3HHpWEtQZuwirwWcVzIcYH70SundonKC0js7iiZvb6xxyOh84ZfdBiFwF84T70/p9LCeaMw0L0jb1PopqMWbhcC16VUSxh1vPumOZj2+U0hkboVpceK9AH6Iql+JFvIHGwZZmCO70FgAJ6JUgiw2CWzN9+RrznGLp6Gd3AKdsjGAvWawxOy9prJjoj7EUr8+HrGmWmLiSu1TpqYNuZpsoEnwOqNlcOEM/uFFds+dkhz6BZJbSU4TEEZu7RezcExuBRGBHvh/B96iftx+oHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIx147d7ohHODebsWmO1tXe7G22bL6vSyWvpn4sgxVk=;
 b=Xrk3ZuN59Fk3ObSuhkGgzvhhb8DBZ/VbuJXzt6YALxOEIhpXmPe/L3zLLDBjXC8hoaZ7qV+ys7kni47LYoQkTr+U8WxETrTnnjk3nx/mEajJI7SLrhDZNJfIZzs6XAoUyuaGa34CufHm/s8E/L/jDxGHBzTTzXstLuWV3/OrLMIgY4mB+Nm2uJcfIRFoa3c2JihSI5NBMcwoXDkAYlKXgyauBVaUmdFsIQJ8UrTM8b+umdmGWedvSpzBkNMUI4mwq/sKsvHjh5bIa8/qSRJ/TNHJFjldwimq7aFxrwaYDYsZimJcigt/nYjjSX8DW4C7Z9uKJajyJYPZYUqiVGV9zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIx147d7ohHODebsWmO1tXe7G22bL6vSyWvpn4sgxVk=;
 b=p823ge5kmooMN/FIGurLMulowvW20Jw/kf4Nh/9BQA9wdPmDBtyNRo3Ss/Xzd+bz8KXGMZJadeS2Y0tI5WPFza0BqNZmw7FUi00LHUT12Yd8lrwzEXHCYRl5QJB9uNGgMsuUudUOtf+zzk3MRD53tT3eDQKq05DNyO3gKPhzOVo=
Received: from DS7PR05CA0101.namprd05.prod.outlook.com (2603:10b6:8:56::21) by
 CY8PR12MB7413.namprd12.prod.outlook.com (2603:10b6:930:5f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 22:19:47 +0000
Received: from DS1PEPF0000E652.namprd02.prod.outlook.com
 (2603:10b6:8:56:cafe::ee) by DS7PR05CA0101.outlook.office365.com
 (2603:10b6:8:56::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.13 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E652.mail.protection.outlook.com (10.167.18.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:47 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:46 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 17/27] drm/amd: Load GFX10 microcode during early_init
Date: Tue, 3 Jan 2023 16:18:36 -0600
Message-ID: <20230103221852.22813-18-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E652:EE_|CY8PR12MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: d5bf681e-9145-4de6-6c8a-08daedd89fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GtyVaA7WE4/kCAoNZnqouN50TAW3xwcxZBIdMK49GFQT3dp7WaS+VSa+Z7eDZ32JkN+4CAeUE59fDfJddh5NOHqUdsjzG3Xt/W1/s6yE/+t2krP9UOD1o3hqfHVnvsCmnhI35bI4/NB5O8AN1O+0NZggnV0ntjpIIRew0H2/jz4Prgef/HCnmPfJr98MeaaxS0yiuSFTnhjN3JwKkquUfVrVkPyaElqITqXvoWk9eiHFFVyP2Y9BlelNU9RO0yGuylBoqKx/wxRu+zIBKoQE7RmwB9le+/1b7NadVnhKuGM39WI2HjhQitqk6ewi+Ach43Zg4Gh2t8rL1WiYtLZigzFLNS4IvJCmplRJ1qn+TNoCKyDeJKRblmnUt5HfrRbMUXxI9KJaxhDWx+OQewqwtkYrQGLbOKzq+RS9Ct6bI47w7mDoh/ui17TnQNBMzRx6gpEzP0KWzuU5yvOzZDg2ityram6exi7gjdo3If3qZl59phTYYHwvnxd39dfz+srXtxnla9fT0V2XWPtc0lT8TXTMNXtdGqPuJl9iFxihvGhc7kOo5yy7fdXOgr9PxS7MjQE176LOmNnfjkdqzO958pKjk28VyTf82LJX66V9MLJDOkoHZBwZh1aD5BG7Od4XADvsm6WJlb/Zw6JWd3krbX/+I6yUT4NfaLolEeQ9V5vDdmEXJkQIPa3En3pRD7zk9gn/aC6Mt3B0AIicsPDUCsSOXXD3k+E+E05iXdV47eX0YYLHBnM2PvcoXvH7OBciHrgo9KWkpjXq/xbW8ubdhQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(47076005)(426003)(1076003)(16526019)(336012)(26005)(82310400005)(7696005)(6666004)(40480700001)(40460700003)(86362001)(36860700001)(36756003)(81166007)(82740400003)(356005)(2616005)(186003)(478600001)(41300700001)(8676002)(4326008)(2906002)(5660300002)(8936002)(44832011)(316002)(70586007)(70206006)(110136005)(54906003)(22166009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:47.5389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bf681e-9145-4de6-6c8a-08daedd89fce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E652.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7413
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

Simplifies the code so that GFX10 will get the firmware
name from `amdgpu_ucode_ip_version_decode` and then use this filename
to load microcode as part of the early_init process.

Any failures will cause the driver to fail to probe before the firmware
framebuffer has been removed.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * Move out of discovery into early_init
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 82 ++++++--------------------
 1 file changed, 17 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 5f6b59e23313..75781722c7e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -3974,9 +3974,9 @@ static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_device *adev)
 
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
@@ -3984,71 +3984,31 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 
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
 	err = amdgpu_ucode_load(adev, &adev->gfx.pfp_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_PFP);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", chip_name, wks);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", ucode_prefix, wks);
 	err = amdgpu_ucode_load(adev, &adev->gfx.me_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_ME);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", chip_name, wks);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", ucode_prefix, wks);
 	err = amdgpu_ucode_load(adev, &adev->gfx.ce_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_CE);
 
 	if (!amdgpu_sriov_vf(adev)) {
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
 		err = amdgpu_ucode_load(adev, &adev->gfx.rlc_fw, fw_name);
 		/* don't check this.  There are apparently firmwares in the wild with
 		 * incorrect size in the header
@@ -4067,14 +4027,14 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 			goto out;
 	}
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", chip_name, wks);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", ucode_prefix, wks);
 	err = amdgpu_ucode_load(adev, &adev->gfx.mec_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1);
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", chip_name, wks);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", ucode_prefix, wks);
 	err = amdgpu_ucode_load(adev, &adev->gfx.mec2_fw, fw_name);
 	if (!err) {
 		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
@@ -4083,6 +4043,8 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 		err = 0;
 		adev->gfx.mec2_fw = NULL;
 	}
+	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
+	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2_JT);
 
 	gfx_v10_0_check_fw_write_wait(adev);
 out:
@@ -4251,19 +4213,11 @@ static void gfx_v10_0_mec_fini(struct amdgpu_device *adev)
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
@@ -4631,9 +4585,7 @@ static int gfx_v10_0_sw_init(void *handle)
 
 	adev->gfx.gfx_current_status = AMDGPU_GFX_NORMAL_MODE;
 
-	r = gfx_v10_0_me_init(adev);
-	if (r)
-		return r;
+	gfx_v10_0_me_init(adev);
 
 	if (adev->gfx.rlc.funcs) {
 		if (adev->gfx.rlc.funcs->init) {
@@ -7611,7 +7563,7 @@ static int gfx_v10_0_early_init(void *handle)
 	/* init rlcg reg access ctrl */
 	gfx_v10_0_init_rlcg_reg_access_ctrl(adev);
 
-	return 0;
+	return gfx_v10_0_init_microcode(adev);
 }
 
 static int gfx_v10_0_late_init(void *handle)
-- 
2.34.1

