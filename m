Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC5465E3F9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F8710E670;
	Thu,  5 Jan 2023 03:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A325910E670;
 Thu,  5 Jan 2023 03:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn1ZTLMmWY+yIvEKvLLeAGxUl3NgFx5luE+y5L6lCBqCjWOPc3aXL/9hX0+/D9NAT1Jdzxc2giEwcSR68BKX80L90WS8WWWNmR3Ta9Y2Uwq324ar3MA0ovY98jGd89RJzPhuXDGW72x30EHTZP106/IDdU5FFVuF4HkrxVnUf/4Q/VFpKbKXgcoe3XuPMZPL10vc/wcsfiNbJ1rz0YfRkpqJnlKMYnvHcae2jp+gqtCdyj4Yt3FeXocI3R6AGQDngkRJYkeaQfaVBacBqKHR2ghcrDUnEZQQT5sCwSmIA1/d8FubZ0aiXsxx9S0rH8WKoFt6VjoGDU5YNhCiyXYliw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzgDQmuVNTUOuudFm07l6Rso7Ao5MMTl3uKDseuowlo=;
 b=Sa7/irYUHkiaha/ZdhMRJZ4RCe4p0jCqUznW/N8bM4tmEDz5wu1tSfGT/U4kLxuJ1fnK6dMdkDBpLd+dekNgymbH2So0X9XB0uVKnhZ6VOP9qoxZLeE2rE3ipIkDlMUJaMr052+QU54t7rcII6+BtUaaq0BaD+gYtoCe4t/mm1BEBHwNFnF6OtGaw7eV7xRbwi8sexYwdJ6Xy7ENRrSo2fwazIco8rplQXzfYJKyE3ma59D1DXOi8GcTe9dgWlY26hyuWMnvWtUrRuYpARXvQIQ5CqW8L5SsLK0ADehfpiLcduvxdh9vQTb7fXzsXeJ63P8tiwHt5j2ppzhTk8KoMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzgDQmuVNTUOuudFm07l6Rso7Ao5MMTl3uKDseuowlo=;
 b=fG4xLpYN4WL3Wji/2OHoJjxjxJSkcP68GAyfNFY9ZO4uofc8re+mIq6EnP5w7TihMribn8gaxxgpyKnImbajo6Cx9CbLGA+8WNaEL8hXQN5M86qTF806AjONnZzmnC+OobwKaq5Sq3urF8mio9h8r4w5C1m0ZD3GXEqLD59TG/0=
Received: from BN9PR03CA0854.namprd03.prod.outlook.com (2603:10b6:408:13d::19)
 by CY5PR12MB6275.namprd12.prod.outlook.com (2603:10b6:930:20::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:50 +0000
Received: from BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::47) by BN9PR03CA0854.outlook.office365.com
 (2603:10b6:408:13d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT104.mail.protection.outlook.com (10.13.177.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 03:44:49 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:48 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 30/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX7
Date: Wed, 4 Jan 2023 21:43:04 -0600
Message-ID: <20230105034327.1439-31-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT104:EE_|CY5PR12MB6275:EE_
X-MS-Office365-Filtering-Correlation-Id: 48769525-4677-4171-f622-08daeecf3273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 57o9hyNXaFRsGPfRWjrgY3rxb4Gm2izotX/Imk424oJqGVtYnNQz1raGna+nw1JWdFOaJ/Zh68vn9hvNPjWDfOXaij7AtcMde9kc+Bzo1VeLutxeM8qmqDlqxAHLTiO1hXaIZwLVDRGrhL50ZxUnSTEtKAYlnBqNL3F3mBgleqq/D1BEfwv4VnZ3nzDeTgk4UM/g4w+w8bno161AKn5bKiy8NOGw1QNjl6k6hMHMi75u1xOBJXwZd/KjggnRWfuhlZQGByCjdynGFP5/MNhR78ztc0dHsDCXpcUykcvCiUqyzpMuwTC/K8hdTPc4L2YO3Fi2cn7ug3lnwyAUSJbvXrqhCm1+sHaS507odRdl3VohzDL0Ou+9SyNO9kksKq4wBR09vWXZGhV+xk1io6AlUHSQjRvhROG/UZ/ZF3fjzOxu6R9G/7NqNZ1JhvITQNib9eofMgwknylSIoTUtK35wKFsGeF3CHhdljnGQ3JWQGqlSukbVz8NbPasCJNtBY9iEhEidCA3BoDxn807Bbgf2VpeZO9tArpPINGU5lF5BusRmU61MxuPjlpmzXwHeUDDCJpU+Zc3SEEkIqwlyCeXma70byBFACXC4LMsZKp/I0Y9v+llpzv2R/fdk3ud7GC/5m66msXVGfq3HIzk3d5Fl2177nJ2PMrT6FbZ90pKD+I7XWzzk+vh346Xul5NaU+7o2Mx8YrhYXCYfR47PZE7jNcdey/wOnxVAjdFl7Fz3u56wLk3ZHrWgPLOfiqjqxIM5AOI5XGGgpYY2Drxxd0YHw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(54906003)(186003)(26005)(1076003)(110136005)(6666004)(70206006)(478600001)(2616005)(16526019)(4326008)(83380400001)(336012)(44832011)(8676002)(8936002)(426003)(5660300002)(47076005)(41300700001)(2906002)(316002)(70586007)(36860700001)(82740400003)(40480700001)(356005)(81166007)(40460700003)(86362001)(7696005)(36756003)(82310400005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:49.8135 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48769525-4677-4171-f622-08daeecf3273
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6275
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

The `amdgpu_ucode_request` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

The `amdgpu_ucode_release` helper is for symmetry on unloading.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 68 +++++++--------------------
 1 file changed, 17 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 0f2976507e48..646999ad4f04 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -887,6 +887,16 @@ static void gfx_v7_0_get_csb_buffer(struct amdgpu_device *adev, volatile u32 *bu
 static void gfx_v7_0_init_pg(struct amdgpu_device *adev);
 static void gfx_v7_0_get_cu_info(struct amdgpu_device *adev);
 
+static void gfx_v7_0_free_microcode(struct amdgpu_device *adev)
+{
+	amdgpu_ucode_release(&adev->gfx.pfp_fw);
+	amdgpu_ucode_release(&adev->gfx.me_fw);
+	amdgpu_ucode_release(&adev->gfx.ce_fw);
+	amdgpu_ucode_release(&adev->gfx.mec_fw);
+	amdgpu_ucode_release(&adev->gfx.mec2_fw);
+	amdgpu_ucode_release(&adev->gfx.rlc_fw);
+}
+
 /*
  * Core functions
  */
@@ -927,88 +937,44 @@ static int gfx_v7_0_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
-	err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
 	if (err)
 		goto out;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
-	err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.me_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 	if (err)
 		goto out;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
-	err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.ce_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
 	if (err)
 		goto out;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", chip_name);
-	err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
 	if (err)
 		goto out;
 
 	if (adev->asic_type == CHIP_KAVERI) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2.bin", chip_name);
-		err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
-		if (err)
-			goto out;
-		err = amdgpu_ucode_validate(adev->gfx.mec2_fw);
+		err = amdgpu_ucode_request(adev, &adev->gfx.mec2_fw, fw_name);
 		if (err)
 			goto out;
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
-	err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
+	err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
 	if (err)
 		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
-
 out:
 	if (err) {
 		pr_err("gfx7: Failed to load firmware \"%s\"\n", fw_name);
-		release_firmware(adev->gfx.pfp_fw);
-		adev->gfx.pfp_fw = NULL;
-		release_firmware(adev->gfx.me_fw);
-		adev->gfx.me_fw = NULL;
-		release_firmware(adev->gfx.ce_fw);
-		adev->gfx.ce_fw = NULL;
-		release_firmware(adev->gfx.mec_fw);
-		adev->gfx.mec_fw = NULL;
-		release_firmware(adev->gfx.mec2_fw);
-		adev->gfx.mec2_fw = NULL;
-		release_firmware(adev->gfx.rlc_fw);
-		adev->gfx.rlc_fw = NULL;
+		gfx_v7_0_free_microcode(adev);
 	}
 	return err;
 }
 
-static void gfx_v7_0_free_microcode(struct amdgpu_device *adev)
-{
-	release_firmware(adev->gfx.pfp_fw);
-	adev->gfx.pfp_fw = NULL;
-	release_firmware(adev->gfx.me_fw);
-	adev->gfx.me_fw = NULL;
-	release_firmware(adev->gfx.ce_fw);
-	adev->gfx.ce_fw = NULL;
-	release_firmware(adev->gfx.mec_fw);
-	adev->gfx.mec_fw = NULL;
-	release_firmware(adev->gfx.mec2_fw);
-	adev->gfx.mec2_fw = NULL;
-	release_firmware(adev->gfx.rlc_fw);
-	adev->gfx.rlc_fw = NULL;
-}
-
 /**
  * gfx_v7_0_tiling_mode_table_init - init the hw tiling table
  *
-- 
2.34.1

