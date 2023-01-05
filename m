Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E24665E3F5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D40D10E673;
	Thu,  5 Jan 2023 03:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1100010E673;
 Thu,  5 Jan 2023 03:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URCkOb5imfZoSXKsIwjH5Gk5o+cXmLNHAKJlh/zQ9Ivcgjd7bhQqvJwoRXSBPjX+V7GR2vXVVMwShwD9vN6FTdgHdgMUlHfHWNaI2ma7bgKsQYp8hZY0kZa8N8irzRHzSJ9vCZNHh3R3+5IsHB+PMKuGoehFLpO2rImFIda0zr/aA0nMJc9A+IBDpmRe67ZI0wyo2tl+lkc1yh5luvO6AiSbqjhAPdovaltB6SdvUABLqIDrQAdu1HxUks2HNPA3ImF1/zyqhPzdbfdrHv/2YdHnGJMn4kOIOPEhWwF89/CU8uhWxvjddL7O0PpY0iiGT/Cf+Tqt5jyb5LIFtxwZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nFC/m3CdokRMD574SepUNVOvU+GRX4rXk3Zmeu40sI=;
 b=BkWry4On9+kUh538jbtjCNuZYbq49/AQaETM4VSHyCSLB6o3qWifVRCxQnKlHH6YajtFCRgLk9rd9ZaRt4MNG7RQxC4GfLgy/zvcSUwcF9J8nGN9KqtPSwZHA4+mDwRSICB7GXB0d7odHMfmxqPHWeiqMgxO5L1oBuJHwaQ2kY6qoEjba7K3QVeXX72JacHKQ73y3t37q7l7+eAbNlAoccIRvUNl+1b/q6jE47iJF6TT1wYCM+e53EvJieuuFx8CkO7ir+tycqJ/rT+ZA7znCAt1tyB8onMu0UaBBd2xxpcj2BDewz8K/U2IrOuTGkT92Q/510U5Ft9aFBq8RP45OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nFC/m3CdokRMD574SepUNVOvU+GRX4rXk3Zmeu40sI=;
 b=ANPbeC+IVlW6pWjvwieX+bGFOGRBzkm13dF5Qg5ofOpoQmWIXRe7xEFYP5xn/VEn/7YGwQgrYmTgjQkS/dobBCT6ELYfEnlsMeOyT11Al2kmqJneUHNaA5ttrk020YcQgR+og2h/77Fbuzmywn5djkekC19pbiBIIvvrKsraKyU=
Received: from BN0PR04CA0039.namprd04.prod.outlook.com (2603:10b6:408:e8::14)
 by PH0PR12MB8051.namprd12.prod.outlook.com (2603:10b6:510:26d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:48 +0000
Received: from BN8NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::1c) by BN0PR04CA0039.outlook.office365.com
 (2603:10b6:408:e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT076.mail.protection.outlook.com (10.13.176.174) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:44:47 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:46 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 29/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX6
Date: Wed, 4 Jan 2023 21:43:03 -0600
Message-ID: <20230105034327.1439-30-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT076:EE_|PH0PR12MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: e9fc3ad1-d9f8-4b66-b6d5-08daeecf3158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +XzaIYoVlRqYMB+vCQpO4TNTw+x1nJXvUwbP9DXjk7BT0cHC2jXxez8HjbsmxD+R9cD9ara+U2eWDBYnlEerI7q5UWgklZPBwV2jP6ycTKVRyDWdL9EF0yDXT1ms1iGsq3JQgAHs44xfIvRaiC9jkMLP41p74Otwp6xowJhPdFRYyh/TQRO8KQSnGJrWpv9B0ZdWGOLjfX0SG+0biBLThy/DXeBE4reaRSC/3AFxQiZZRCixqVASdCmAcIJNwo+2Yoi6UjO2dkbTf+BU1xqnoL3wV4xBNuTNfiQh84WST9MQxfMhG6gU5sD8DbjI90CfyBQ5dUFFbqfC99aIP/u3T1aYNXU8HETy0YHF1DZsIN4Sx9gAevjZ+RdSbkXPP8d52z0iUFXp77XddXM8YgUSKVSzwsLYtSbjLbqi6Ba5ev8VZ14vlHZ2T8kp3dWxDfrlWlfZrv6xmagZxa96eFGglBVcOOGdwx29ypNrGtFYvzAgfV+1ahZHEaVrpJksYAPm9S/QsdUsKxfCJi5IoFoE70DsBXRLddMzO0GAr3SDrgsjCf00tMJK4xICjWX1k0S6ercZBzmR+EJNQSO3UKH/5n/UaxQUxDLMKpZc0+PIRz1bWMs6A9UPpIGNwpOSmpnrWm5GsFSQIDw0+rlP8kQUlB964GoLSrrUvinJtTZe/1cU9iZL/bchrg1H6l8jFr63rRwpKze9879ZXq8uxhlO+DcZuNUvsaHWWzL9LvSV3vFPKMSQMQfVfVtJguY+0OTDuLc6y70aJOa9OnNvmkRCwA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199015)(46966006)(40470700004)(36840700001)(41300700001)(186003)(26005)(83380400001)(44832011)(5660300002)(16526019)(47076005)(426003)(336012)(2906002)(36860700001)(40480700001)(6666004)(8936002)(82740400003)(2616005)(8676002)(70586007)(4326008)(40460700003)(70206006)(54906003)(82310400005)(1076003)(316002)(81166007)(478600001)(356005)(86362001)(7696005)(110136005)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:47.9416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9fc3ad1-d9f8-4b66-b6d5-08daeecf3158
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8051
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
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c | 30 +++++++--------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
index 204b246f0e3f..438eab348fc8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
@@ -338,10 +338,7 @@ static int gfx_v6_0_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
-	err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
 	if (err)
 		goto out;
 	cp_hdr = (const struct gfx_firmware_header_v1_0 *)adev->gfx.pfp_fw->data;
@@ -349,10 +346,7 @@ static int gfx_v6_0_init_microcode(struct amdgpu_device *adev)
 	adev->gfx.pfp_feature_version = le32_to_cpu(cp_hdr->ucode_feature_version);
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
-	err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.me_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 	if (err)
 		goto out;
 	cp_hdr = (const struct gfx_firmware_header_v1_0 *)adev->gfx.me_fw->data;
@@ -360,10 +354,7 @@ static int gfx_v6_0_init_microcode(struct amdgpu_device *adev)
 	adev->gfx.me_feature_version = le32_to_cpu(cp_hdr->ucode_feature_version);
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
-	err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.ce_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
 	if (err)
 		goto out;
 	cp_hdr = (const struct gfx_firmware_header_v1_0 *)adev->gfx.ce_fw->data;
@@ -371,10 +362,9 @@ static int gfx_v6_0_init_microcode(struct amdgpu_device *adev)
 	adev->gfx.ce_feature_version = le32_to_cpu(cp_hdr->ucode_feature_version);
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
-	err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
+	err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
 	if (err)
 		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
 	rlc_hdr = (const struct rlc_firmware_header_v1_0 *)adev->gfx.rlc_fw->data;
 	adev->gfx.rlc_fw_version = le32_to_cpu(rlc_hdr->header.ucode_version);
 	adev->gfx.rlc_feature_version = le32_to_cpu(rlc_hdr->ucode_feature_version);
@@ -382,14 +372,10 @@ static int gfx_v6_0_init_microcode(struct amdgpu_device *adev)
 out:
 	if (err) {
 		pr_err("gfx6: Failed to load firmware \"%s\"\n", fw_name);
-		release_firmware(adev->gfx.pfp_fw);
-		adev->gfx.pfp_fw = NULL;
-		release_firmware(adev->gfx.me_fw);
-		adev->gfx.me_fw = NULL;
-		release_firmware(adev->gfx.ce_fw);
-		adev->gfx.ce_fw = NULL;
-		release_firmware(adev->gfx.rlc_fw);
-		adev->gfx.rlc_fw = NULL;
+		amdgpu_ucode_release(&adev->gfx.pfp_fw);
+		amdgpu_ucode_release(&adev->gfx.me_fw);
+		amdgpu_ucode_release(&adev->gfx.ce_fw);
+		amdgpu_ucode_release(&adev->gfx.rlc_fw);
 	}
 	return err;
 }
-- 
2.34.1

