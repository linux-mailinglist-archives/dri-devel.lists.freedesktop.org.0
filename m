Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C327265E3DD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD8910E65C;
	Thu,  5 Jan 2023 03:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2087.outbound.protection.outlook.com [40.107.96.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F43C10E65B;
 Thu,  5 Jan 2023 03:44:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDL0g+SR6TcE22Qhzfr9DXWcAxs5k6PKIZbXM5sPt6ZlDg4qyLNg8FpbAKyBUf6mB8wZRsJotmL2RfjH1ulJCpVN9/25fcxdtrlTsy+XnOtZdx6uXVJMmIUKWBrUfq2rliZ6ywm4am8Om9D1lL83IM424Sn4XKuvNEThM4f9M3HuVEk8RvPnUZIMnuk9QL6V12oJsn/B1l5Co1Lnad4K7sXdyjjKSPb45Cp5MOU6jutNoNbj/0VEr1QIaAZPgIIRNCWWKjcda3Hdhh5v6zuJOxqe5IK9t/d6wB9a+hrd1qgqrvPgC3zsxfVKbKNFnKg7CQh2MYCVK3vtW80Y/HI8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEfekuuxIpn7VfYoAtq+fH0evgf/AoCqPy8Exo8XICA=;
 b=fG81vPKbBhFMUYqWTgNbTqkKI1xSBWX5WYonkHhSLNfaN0XwJsYrnV9kjXUl5rd1W8B4FlDRfYxELX7BKOqlDEGVkeioH0cv1ymEIwCdaVLPfqQgGVh1OC29kw5J4o4ba4KuDPSG23643H7KzC317l1nWpw5Jj5v9TOawQSXy0S2MM1YjVfPycdCryiSlhTscSQJN3z7gbnBwD/SvVj2SQCI2AbUTn2Es275UdZIEyEYHeJgr7NZ4COluGcCnrW/SrYL0sfB65nrN3OvJi1KrRZMJc5WxjuLI9ebIm+65JMyEM05Cp/6fqsKky+bakExRqDsTfJfBtWfJAYcVWgMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEfekuuxIpn7VfYoAtq+fH0evgf/AoCqPy8Exo8XICA=;
 b=YbwFJq1mAtJj0V5td5v93ImEiWDmhhfq1RvjCxRHFvxq1+RQ64l8EpD34BAXWdFmDhsORetcx8MmfPvgh9YrfuFWX9+CNz2mSbgOqkvpKnFlQCwR1djN/FjImjqyeE9mzJIOIRMmHsds+cH/6Er0WDU+0bjz6Ea4mXe08zr94r0=
Received: from BN9PR03CA0614.namprd03.prod.outlook.com (2603:10b6:408:106::19)
 by CH3PR12MB7692.namprd12.prod.outlook.com (2603:10b6:610:145::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:24 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::6c) by BN9PR03CA0614.outlook.office365.com
 (2603:10b6:408:106::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:44:24 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:21 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 17/45] drm/amd: Load GFX10 microcode during early_init
Date: Wed, 4 Jan 2023 21:42:51 -0600
Message-ID: <20230105034327.1439-18-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT065:EE_|CH3PR12MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: 4405a864-e7de-4ad6-c4f4-08daeecf2334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUKFtlcKLtt+Y2lyPuUuQQQYmWJmaPt7h/7pRTRbTytYDPUUf9is57/rzlew22lEIDjrv3/dFK3/uQ6P0RLVpwp953sIHJ6LELSwcvcAd8YlLgi+5ic7FYD1ccUR62ZBpBBQvgXBpqJVKviSK+x128DMfQc7TChjrL5boOa4ShRQZtIkNcOExxchbRf6ODQi7WwQtutKbKz1GDOj9Pe2Gxh25jYpjyy/3Qy5zTNn0o1Q0cA9Wa1VIzB90Qs3ouByYqTSLxl9tMdPMq7d0XgSwXoZV4kFHf1L/yxnxf/vSlqC5yVKAqipUGXZJx0q26tRq4lPFAwMu+w5ZZ7/3ove413h31AMDtagQn9B0h+r76iXijxSg0P4Uacr8ZurRff6vmkWSA0y/NeAx7WhyGmFWTDP90Sm+1dfN7+pULbIWQQLwnvMbghz+7rFcPBC03zx5/MZpfjNvvfnQB5OBJSOwLmPvovXCR65W82J45hqTBG9Vhqp0wcqDlmxZKlmaXh9eyAMTULn8lKapOoDMJoUZNWu7fF9FHv6N+nTnHN5QdtqTtUbc1eLx1n5+qnac3LDkHsvcFlhDsiC1JAmrEk9SFezWtxPJLUM4ZRFKoy6RMP26AEvFXo5u63rWLZ49UTkVOT9srAR9MP1YZRafxGiSkpES1+TrxqREck/Y1EMLG8G+YbxMDfT01w9ldP8jwWzCP2qjFpJ3zD6sMxZTM/Q0OKtfVXM4xwHGVpPitegCco=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(16526019)(6666004)(26005)(186003)(8936002)(7696005)(83380400001)(40480700001)(478600001)(44832011)(54906003)(40460700003)(316002)(1076003)(2616005)(47076005)(70206006)(8676002)(70586007)(426003)(81166007)(4326008)(336012)(41300700001)(36756003)(36860700001)(82740400003)(5660300002)(82310400005)(356005)(110136005)(2906002)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:24.2179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4405a864-e7de-4ad6-c4f4-08daeecf2334
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7692
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

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
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

