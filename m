Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064CF65F1E0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9801E10E798;
	Thu,  5 Jan 2023 17:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975B710E791;
 Thu,  5 Jan 2023 17:02:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4TiKY4AqaFpmltZzQm+EH12OixTcOw+WLsy8M5tTvZ4QN77O/k3v1OQd216RPW8uuSz8lPAAE13MvaywrxttaBqdtv8WU1agFJzKBz8B7EkqEVtodovPPSNCWi8nmUADZPXmEbpFB5pGTgJe50p7VhZ0OldIjU3hr8BvoGU4hUhv3Cisbr8xELz8q2FPtVOinGtRnIE5u59nt2U6eIrdtTOHmCn6UEoHi3foUW/Lll7m8ZwJRyI/jTH+3pPvNeIOu3sf8V5edJzeK8WBRVVm2FNf8ZeTd89PAr1ye9v9nzKRPJ4PUGdalf+IjXMt3zUi7nZZoZXtJOBVQ6/trkVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kG0dt2rNrwKROy8lnFqMy2SqGg9oke/xnqhfDgEByw=;
 b=GFDDGVMNzifp4Up5yKyuo9FkhSyBnA7zgkTrzQQcWIRkwTwiJl3kCAwHjUq6htA3j2mMQV75iXhXrJZcz801xsPo1TQKNavGV5GLToj6EJ6h8BYO8cO7GOxY8Qz8nB18rUAGOQMgR0wwVx624ChN6bGXTj0AZ/ee7w5pEgp6EAWW5U4x003Q2dh+oouKlXUQA/xDWj3319wnEZmo80OSNUhYCuntStLMyFpbu5lwu9uTQ4F8H1Ht+fm8KFGJrID70irH6jpD+V03EIA199RexQ9kKH5P1wxLNmlA5Qj4JmxxUv7Zuz6AKNtwuVprnELq6j9oe+pjhxlxzyHIHXnekQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kG0dt2rNrwKROy8lnFqMy2SqGg9oke/xnqhfDgEByw=;
 b=VTWEzY690DEfFpY63OHxQbeTsfxYftTEy2ubr93VZyqJz6vZIiFyeFYO040yIQQlT7nJ24UxC6Dd+2eIcQMJMouH4QTn38ctXRst9Rujwx2kl5fywDvqrLaYzv876zIiZeGLKboDQRUfgt4WymKhZqtkIkta3+1pgNe3D/n49g0=
Received: from BN0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:408:e6::8)
 by SJ0PR12MB5469.namprd12.prod.outlook.com (2603:10b6:a03:37f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:42 +0000
Received: from BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::60) by BN0PR03CA0003.outlook.office365.com
 (2603:10b6:408:e6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT079.mail.protection.outlook.com (10.13.177.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:41 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:36 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 30/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX7
Date: Thu, 5 Jan 2023 11:01:16 -0600
Message-ID: <20230105170138.717-31-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT079:EE_|SJ0PR12MB5469:EE_
X-MS-Office365-Filtering-Correlation-Id: b0aaa90e-cfd6-48f6-8c25-08daef3ea865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M7dFoihlGTuLxG0xKzerT7Jz682rEJRnjSGo7zVtE/xAnEtPTUf5xNaG8xHOTFpSHo53b4numaUjRDRXrH1s03hta4Jkk+BZMBQTOEuWP9OEN075DA/LI71Iyw8BE5NS2KgLdc/K/hT8o+03XHGHb8U39VX54yxzPGwFi1Nxa/W1LqlVJ0N3BZsHRuIlb90Efxm0iZ6se58gZwor/l6ERGrVtFTqQJJWeqxJNBMf1uQP+YMg0cVnzEakOt0ht+qZn7ggrX0fvpFFpe6ELSxQMCgsxUuRweNVd72n5xoNpfpiN6wP8N1Fi76cB+2ORAkxxCXNcMw3xPeAVIaZK4Gn0fOj1W0I5ntv6L7t83zKX0NnOfpN/++feA2Q7Jq/6znr4GZ4gpTErLJX6nVdNYDGnhWsvsssFgCuWXAKUD92G0d5bmoI8+w+4WT9dhf728kg5AAIAEmVji1ptxCs3dK8tZukOcS5lnGd4gqAIzU+9w/s3gcYGDTGCw9v0WChROd2ffTIh8uIahPiwS7CnNIqDXY7K4vSPpkxmUs4qgq0qK7tQT6ZET425IRIb3bULlozwINPy7NQQugXXi46ebkdX19CKo3+8lFfvOQQAqhEQwAVqhsAiBLLRaC7fPfvX7Xsz0+aoCRCppoMITjHCmtoJT+wGVDE3olevoOG+LJ4FM92hVVgfhTk9huxvqxdYOO145JM5qcKnEMjC5MLX4WfFrAwq96H1e7gZF4ThEZZwuvzQkpMvMAiDflP5UUpmMqzPekTYVUGBVWarBMf/RQ/Jg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(46966006)(36840700001)(40470700004)(1076003)(70206006)(426003)(4326008)(81166007)(47076005)(70586007)(8676002)(2616005)(36756003)(41300700001)(336012)(40460700003)(316002)(54906003)(356005)(110136005)(2906002)(86362001)(36860700001)(82310400005)(5660300002)(82740400003)(83380400001)(40480700001)(8936002)(7696005)(478600001)(16526019)(186003)(26005)(6666004)(44832011)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:41.8115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0aaa90e-cfd6-48f6-8c25-08daef3ea865
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5469
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

The `amdgpu_ucode_request` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

The `amdgpu_ucode_release` helper is for symmetry on unloading.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
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

