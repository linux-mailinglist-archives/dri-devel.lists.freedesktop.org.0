Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A02765E3D8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCC110E659;
	Thu,  5 Jan 2023 03:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D485E10E650;
 Thu,  5 Jan 2023 03:44:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFdjUKIKOQHUN2wBp57a1Q0Tl97V/F5G5JlpC539y71yq0yNgIdRCtBuQ46g8R6oCELTNmQ4Yztvx7HDdz/b2x4nxDqD+R0/Np+VzJiDrRbaPihDdKsoJtCkKBBdp4U3KjQVSa0Y51RJqUum0XPgP/CTCEVz68H2PTyW4QydvBYlKkGzFkPyW8JVAOkD/EHDtNwmtyr8tQb03z6xoVgQoU1KZd57bN7gVunEcUYkgnFoMA56bvvCpQCQjjv3WVWa1nrsOAdNNs24q/ccBiotTxQBZVEn6C0KLCRwP99KVB1lAXd3fB+lHZDkqQtHHU/Bs2SNoEzd0+D0zENhQX+dNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UuRI+NClU5nzwqBQIWaXLhUfBqHViV++o3EkxkDIrw=;
 b=alsA26dlC5qQiX8dM2yHPM2wctpR9+k6hXwBUy9V/A17dLZ1tpQEPVtYh0qhIUIURJsQ0pQNJbfzp7Ltk2vPRMEHx1x+ZFB6Lx/oRkNvQAS0S+Grm99AWFaMy6TtqOJV9xqImL9BBnd16UDwb4wYe2T+lpAGwhQht0z6L6a8TpuvSCktji61qviT4/ED/lc/h4C68j0DWHEOw3pzZphCN3GEWkzbO53bqNrl4UYihZ4c65Kzz626J12d9LSWvSNhsZkmflswGpipOH3JEg5MpmTw9jPB87+R7nD8h/3V2iIQqMJ78hbKB/iY3BQ1HSsmqDIDfYAUl4cgjjN9bsSteQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UuRI+NClU5nzwqBQIWaXLhUfBqHViV++o3EkxkDIrw=;
 b=bkEjCHMp3Grj7RHme2bTUoOmikb9pSAmAYBfU9Ms1enCdSnHpc4/xe9kHOGh97c6wDGAYD7oT4j4XFILKTNnuJKxmPQu3Ri5MhMNYpCtmVZ3pmqbVq/34wcmvyd79aL6pTwikUo2vSE8l5ln/XtKxZSBoto/TS8ijipGqyqDs1E=
Received: from BN9PR03CA0618.namprd03.prod.outlook.com (2603:10b6:408:106::23)
 by PH8PR12MB6748.namprd12.prod.outlook.com (2603:10b6:510:1c4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:18 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::f4) by BN9PR03CA0618.outlook.office365.com
 (2603:10b6:408:106::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:44:18 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:16 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 14/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX9
Date: Wed, 4 Jan 2023 21:42:48 -0600
Message-ID: <20230105034327.1439-15-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT065:EE_|PH8PR12MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 80868753-3882-4205-4a03-08daeecf1f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zpQ1iSNnAUv2kZd6cJiOYLB3utHh/MV948pr6sVp5mbB8uFauLhmMoMrHafjSeP8CcRyS5Sf+T7ixGett0jPPgYcItldOqKHJhGUX0BfgQs0tOeaKg8d5a3E8QZsJovH8MTu2JrURd3mY5rDHjYHtcHtYchfTm9LIHuA3nyx/HQlAvWB73CwNFpAD6MRj+0pWDmAHjQuE2A8slbLM2wAZoMRKZMcuGcQaoc4hA6+bBqjAHTvZjHxHDGLHqolwG/P+2NWKrxk6ue4vnbiiZsSmxbU6A7U1Y2ZkcwNgzxxoV8ZLhUtQgRRvFqsLJwZPOrm6ehzzdb6REWsnyGUTdQPh7uNBLsjgTVOMEBzQ9IX9bvW2c7IL1dvAfYKR9SAej9yTROmAVtkANhhxVgnKS7rOxzZpBIGfG7Cty/2UXiuD6CYNPSPZ1j4JOnGu+Wr1DNANB2kST+sLJ2HvQwlm+1P+iHDEnxYjPjtG1l+ijgT6BlftIhG9L6WhhcscjRAwdrN2DDkOH/lfEfud5X2ZAisC7LUfBrHQEzlZNBw4aaMdxzWDVR+6vLMyQ4u7q16OvEzBFjYKJy6PZOFbr0DEqAqDuh84ZfWYh4O18uPIPdw8ub0kUibqJsDSlpzvbNVNHYmyo/ziD/r/onScaoTi2vPc3HHkFkFF+1J9eOQ3z0chSX8PMNnxCPqL9KyD1vDHySefKRZANILGQUOh1S8So31/+s2/lId7+x8KgNvZqTo+m/kymcpfZMdbnaUDxV/AWFD+imWHgAmRK3XlOsRSGrQvg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(1076003)(2616005)(336012)(36860700001)(83380400001)(426003)(47076005)(40480700001)(86362001)(40460700003)(82310400005)(81166007)(36756003)(82740400003)(356005)(44832011)(2906002)(110136005)(54906003)(41300700001)(5660300002)(4326008)(70586007)(8676002)(8936002)(316002)(26005)(186003)(478600001)(16526019)(70206006)(6666004)(7696005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:18.0151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80868753-3882-4205-4a03-08daeecf1f82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6748
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

The `amdgpu_ucode_release` helper will provide symmetry on unload.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 82 +++++++--------------------
 1 file changed, 21 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index f202b45c413c..ef2dbebbc90c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1078,18 +1078,12 @@ static int gfx_v9_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 
 static void gfx_v9_0_free_microcode(struct amdgpu_device *adev)
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
-	release_firmware(adev->gfx.mec2_fw);
-	adev->gfx.mec2_fw = NULL;
+	amdgpu_ucode_release(&adev->gfx.pfp_fw);
+	amdgpu_ucode_release(&adev->gfx.me_fw);
+	amdgpu_ucode_release(&adev->gfx.ce_fw);
+	amdgpu_ucode_release(&adev->gfx.rlc_fw);
+	amdgpu_ucode_release(&adev->gfx.mec_fw);
+	amdgpu_ucode_release(&adev->gfx.mec2_fw);
 
 	kfree(adev->gfx.rlc.register_list_format);
 }
@@ -1257,43 +1251,28 @@ static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
 	int err;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
-	err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_PFP);
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
-	err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.me_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_ME);
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
-	err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.ce_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_CE);
 
 out:
 	if (err) {
-		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
-		release_firmware(adev->gfx.pfp_fw);
-		adev->gfx.pfp_fw = NULL;
-		release_firmware(adev->gfx.me_fw);
-		adev->gfx.me_fw = NULL;
-		release_firmware(adev->gfx.ce_fw);
-		adev->gfx.ce_fw = NULL;
+		amdgpu_ucode_release(&adev->gfx.pfp_fw);
+		amdgpu_ucode_release(&adev->gfx.me_fw);
+		amdgpu_ucode_release(&adev->gfx.ce_fw);
 	}
 	return err;
 }
@@ -1328,10 +1307,7 @@ static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_kicker_rlc.bin", chip_name);
 	else
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
-	err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
 	if (err)
 		goto out;
 	rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
@@ -1340,13 +1316,9 @@ static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
 	version_minor = le16_to_cpu(rlc_hdr->header.header_version_minor);
 	err = amdgpu_gfx_rlc_init_microcode(adev, version_major, version_minor);
 out:
-	if (err) {
-		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
-		release_firmware(adev->gfx.rlc_fw);
-		adev->gfx.rlc_fw = NULL;
-	}
+	if (err)
+		amdgpu_ucode_release(&adev->gfx.rlc_fw);
+
 	return err;
 }
 
@@ -1371,12 +1343,9 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 	else
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", chip_name);
 
-	err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
+	err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
 	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
-	if (err)
-		goto out;
+		return err;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1);
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
 
@@ -1386,11 +1355,8 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 		else
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2.bin", chip_name);
 
-		err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
+		err = amdgpu_ucode_request(adev, &adev->gfx.mec2_fw, fw_name);
 		if (!err) {
-			err = amdgpu_ucode_validate(adev->gfx.mec2_fw);
-			if (err)
-				goto out;
 			amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
 			amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2_JT);
 		} else {
@@ -1402,17 +1368,11 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 		adev->gfx.mec2_feature_version = adev->gfx.mec_feature_version;
 	}
 
-out:
 	gfx_v9_0_check_if_need_gfxoff(adev);
 	gfx_v9_0_check_fw_write_wait(adev);
 	if (err) {
-		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
-		release_firmware(adev->gfx.mec_fw);
-		adev->gfx.mec_fw = NULL;
-		release_firmware(adev->gfx.mec2_fw);
-		adev->gfx.mec2_fw = NULL;
+		amdgpu_ucode_release(&adev->gfx.mec_fw);
+		amdgpu_ucode_release(&adev->gfx.mec2_fw);
 	}
 	return err;
 }
-- 
2.34.1

