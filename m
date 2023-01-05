Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A896A65E403
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08F710E687;
	Thu,  5 Jan 2023 03:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A7710E674;
 Thu,  5 Jan 2023 03:44:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByHZIRi4vnTnbG0yUBD3kwAti18qZQn9EumNPAdz5ReXnhFfYFJElDgFuTQV/pBCdpuyXtZqm4fA82Oodf70G6Q5YUN0X2HADOabYmK1flgGWqx/8PvnyJtEAFWcOHkYaySPaMf7b1y1jhokQk0FVZuuktnwY2l97goFfiFxyXgbyromoj44u6VVzBZaMxSf9ogukxjTgYRxxA2j37xc8F+GkuIxXPt6KB4r3y+IgwgV5n43t9oHoqyoULSU5N15vetSBtBCRH1mbtlxjMCVGV855PgQuULWJMejSEWbov4NiOyIOBe00qhPG1UMsJfVP4iO7YhW0duLAIzdmYYTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wm2H3gExGsTdrmy8S08Cb0DAScutGkO1T5brQlLz84=;
 b=hBFfl2BXSKEa+DTC9cD4JEZJIEDoAv9tP0gUow2vNLYmk7KtEpzNwKZm1iknBEBsVLbh3UFebPf493datG41GgB2zcOdt39IR1IZ143X+jdq+2zA2B/ZcABBX70PrnarI6eQN/LkARkfgcGxo3UtA/+hp2YpSwiNG38G7CnIUzPpZ9sWfSpoduKxJRTI0raZ3oLFdGbl5kYpui22CuMb+M7Syih0dmMWvYCODHReBx2bRtcmIuh5r8pzQxaASFSY0BSMBV6GOzC3bTyMbt2t+MhjpJWnWzN7RNj6eLXYMEvjp+zd4zAqboPvpQA4EM9yajrmzWUyOJRFMz8HP6elfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wm2H3gExGsTdrmy8S08Cb0DAScutGkO1T5brQlLz84=;
 b=ZMTgZfX34wOHLbeVCB7Ei4JBNoLFXDnVS6DtPcWPQbLZqgUH6f70DsXt43KrpnDwTdSO2HCSuwj9ePMZ2M4b69XJBA6pzbPhQvzMZMwEyhDPER45xYWNczP0aR1jVjbXEwFq5jzXGffdRQe0XKLLxckCSvsTwQOJpbEaWKygG54=
Received: from BN9PR03CA0078.namprd03.prod.outlook.com (2603:10b6:408:fc::23)
 by PH7PR12MB6612.namprd12.prod.outlook.com (2603:10b6:510:210::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:52 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::76) by BN9PR03CA0078.outlook.office365.com
 (2603:10b6:408:fc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 03:44:51 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:49 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 31/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX8
Date: Wed, 4 Jan 2023 21:43:05 -0600
Message-ID: <20230105034327.1439-32-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|PH7PR12MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 03543d44-cd72-4147-c16d-08daeecf33a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W2S6LXRRJ2L3bmVLap8Rnwd3H7vBbP6F/iJrPUBj/d3KKUxw9ZxxV475y8kuRCOP59k0aPLg99dl6V76by77tmImmaQgUlN5xFZ5tCbuGFVC2tNoJAsG7+D1zK0SUP7SPeTVjzrjJ5jZjojcEFmsMf2DzkF8ZYE8ZvDU20PTsgLEHMkKbQCHKl+Ntnzt4lZgtbFmnR3GRpjwwkXl+CGL9vgvZlyTaZ/tQBaKUm0qi+84RkLB98QiynHcGbDXJaby3zkjPJPSsLwliKDM2fWp/5xvsGMcgJ0oK5tAut3Aw206d6sUAfBWbel+R9GRxfwenQ+uC3/B2ZeFg26O9bocV8p7ETac9rhtBi9j/OpewXu2yZ/F8EPMGRKeOl/D4N5PTXURmWDSerX1B5IxH6YALBcYxgiLkg4z5AMQihyAm7eI+Dp2gXBKz6dhq5y3iSeQPd0k3UcNtFLO+K+EEcpqYOgYktiDxSfMtG8/IjPaKNgfAj790MEBqptG5xHTAy/LdXAyx7u8z/frLb1P6wL6pBe5CTKdGGp7jEi3HombHTcXLikvIjHo49f9v3j0C+JCa0IcHkLyy64luGpiPbF8gdiu8Is20dTpSOFINP8jY1z+RTZCb0HJ0YM2/DXc1Y825qp4B1iaDtMO6cihsPinpqV1TEAl8niJOy+/imjufLBOY38om1phEzabpEVVxeTj2rHObmgGFCv2r7xpWCDtNB2Wt9hjYhGzrQ7/x87tU5hAwVOFGDXT9ep9bxLHW0eXw4Z+MtzczaKDQ+d+iO8k5g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(2616005)(1076003)(47076005)(336012)(36860700001)(426003)(40480700001)(86362001)(40460700003)(82310400005)(81166007)(356005)(82740400003)(36756003)(110136005)(54906003)(316002)(2906002)(41300700001)(44832011)(8936002)(70586007)(4326008)(8676002)(70206006)(26005)(186003)(478600001)(5660300002)(6666004)(16526019)(7696005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:51.8241 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03543d44-cd72-4147-c16d-08daeecf33a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6612
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

