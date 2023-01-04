Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6E365DA72
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C949810E598;
	Wed,  4 Jan 2023 16:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6E910E58B;
 Wed,  4 Jan 2023 16:44:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZwjHL781C5m7KGej63ux8yhooWesuP/P0ZWRCk/mPHaglg7oDoYsalEYIoLaBwn/L1ClBAR9p+/y4ypn5Kbyd1B8aTseXRwNM7s/8vYe1525pmnj5xXF5I3nD5kAkL9hai7kSzBevPpe86JjyAN+8cHrR7gsgbMcSQ6fvXRSVdvqu+wA1NkCIfw7Nt06uL40rwPfRELNT49UoPqmdLZrXKpfD5qOr1FaL0jLyFWVXz1MWKrwKUB6mO8MCOqQlwCUjk0KBgcf3EoQwgOr2aqSuPeH/PxYm6y98jRCdv3pKO/liEmCZNmgS/cJjd/hmaXeZ2wHqRvjRLAP1NFdHyS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gY3Nh3V1HcysaBhUlG+JOEGX7gYTLaL+2fJ/AJTHqdg=;
 b=JGxgh7LbdPdlGQALGBfJhYBab8BCmFBnnyPLlC0uAxxQY1xMSi/4GOyVkSutA5X7kXlKmWFDTYCL/kOnXRVbvKnm9LcfF3isys1xUq4AoA8yztgjTfeCyI2tfofKT0Pn4b9tXQgDKSYgh1NThwu8COHkyY97cSHflksCxSxVQmqMR4K8j1Uxn8KQHKpVBIj8acrjRjZATdQs6m1Z4ZHzFYMeaAtmhK7UTdiVoJCBdqyftFkSjRMnOD4nH5437i7WUuDAhgdJKHSviUTRq+p0HsVB9r3ZaDilBjhnsUlSSbtEAQVD7G8Dve5lqcwjdIkl4AoQafrjcaX8tIGUEd4Y5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gY3Nh3V1HcysaBhUlG+JOEGX7gYTLaL+2fJ/AJTHqdg=;
 b=EP8s/3D+lIsOv1rpKysSmEsdTlU6e7YK86XZjwGuEDcUnzHgK8qWrc2ZfmvaUngu/Nhr1ynRTOkeOc/agHCgmsRJsmzFjrWJbn+fpL/Rk9g1cIelSeceCJBv4KyU/xNtffrArD5lw7XLhJkLvjfaaSRcB8RaFCPC3JRRTFIXpqk=
Received: from BN9PR03CA0629.namprd03.prod.outlook.com (2603:10b6:408:106::34)
 by DM6PR12MB4420.namprd12.prod.outlook.com (2603:10b6:5:2a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:28 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::6a) by BN9PR03CA0629.outlook.office365.com
 (2603:10b6:408:106::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:27 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:44:26 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 33/45] drm/amd: Use `amdgpu_ucode_*` helpers for GMC7
Date: Wed, 4 Jan 2023 10:40:22 -0600
Message-ID: <20230104164042.30271-34-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|DM6PR12MB4420:EE_
X-MS-Office365-Filtering-Correlation-Id: c707485b-2c56-4f23-da8d-08daee72f204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: liaqwrFALkjUsX+swErJuB15zekRABuouYU4Mfe0wzBpn5cMFqCktC/dNMtAQxGS44Y0bHdXt3foJg+qwI4NaLR2rzTv3W/TehTz8VKpuRPBnPqlzkNbaWlveDRWV7R/mfjpq4Rev3rqIGrBfclmJO+wj/280zolBp5k0hQpWLw1X7BJdNUVcWM7nQ0mrgsVUZeivUHAdhG+Nwvu91+X/zJtgTjNPjHahgZMFKLLHFz48vA6LMuwF23xbjqbYGD6jJcls4PNgz7OUVZCA0PmxYrdP8VZWPACJpgaqx+FgfIj/dDW2asm6labkuWcNi7oreIrAlUzI0y1MJjSnGyCpbc+izzJIKvXduz6W8TMiHZddAdfc/pKzbHV2zeQ+AL3aGAUW5XWriEYZiU3aRf3eVyH1aOJgCScfVhfCq2wJ8rj+flNAxcLiAI2OwSCpW/t+YZosuaueFk6a24KJu6Oq+tApchG63nVPZrQ4mZ+W7zkxhp8X/oyHOBn810Usk5qv2WTbUJPWUpKoeVdJ3dPay4JAVrRb1VKvMbIflV2SYnx+r/OGHc4mRunaNZimXrqZV6B3aQsXg9Lyjdw3/XuftFxjPXNSCBSlQyzItkMLtkrpySF9E8V/qwkJI2zJwWcFhIRuCQNkJSrj/+F5gGfEiExc8DxgelWVVG1TyQHjkK9KhTFpC2ULsNHwRE/M2dhrqmbn51AjjJ4DmOZtHEK1afrzgTsUkA5+vwavAmAt/X3eRpbw6LtnYUhcUR8+K1MlQ9y605PxZk/jzVzHGl7gw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(2906002)(41300700001)(44832011)(8936002)(6666004)(4326008)(8676002)(316002)(70206006)(70586007)(110136005)(54906003)(478600001)(2616005)(7696005)(26005)(16526019)(40480700001)(186003)(83380400001)(82310400005)(47076005)(426003)(336012)(356005)(82740400003)(81166007)(1076003)(86362001)(36860700001)(40460700003)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:27.9808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c707485b-2c56-4f23-da8d-08daee72f204
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4420
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

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 979da6f510e8..934410701a15 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -156,16 +156,10 @@ static int gmc_v7_0_init_microcode(struct amdgpu_device *adev)
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mc.bin", chip_name);
 
-	err = request_firmware(&adev->gmc.fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gmc.fw);
-
-out:
+	err = amdgpu_ucode_request(adev, &adev->gmc.fw, fw_name);
 	if (err) {
 		pr_err("cik_mc: Failed to load firmware \"%s\"\n", fw_name);
-		release_firmware(adev->gmc.fw);
-		adev->gmc.fw = NULL;
+		amdgpu_ucode_release(adev->gmc.fw);
 	}
 	return err;
 }
@@ -1081,8 +1075,7 @@ static int gmc_v7_0_sw_fini(void *handle)
 	kfree(adev->gmc.vm_fault_info);
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_fini(adev);
-	release_firmware(adev->gmc.fw);
-	adev->gmc.fw = NULL;
+	amdgpu_ucode_release(adev->gmc.fw);
 
 	return 0;
 }
-- 
2.34.1

