Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD7065F1DC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D41C10E791;
	Thu,  5 Jan 2023 17:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C95610E791;
 Thu,  5 Jan 2023 17:02:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guSR4ikdK784LTNSf9tFX4YDJ6noxGP99eUQidk7ppQc3T5xvQcmFPGPIkA7O55ngFg7zLWkieXRyxtD3fkcXM+turj0Pk+XfsZd5wCvL6+T0ZrCU34BuJ6WLU48N4Pe2du+RRZVefgbPbFsF/sn6xJzEGx308z24zt65u0MArrQi3eiTFvBYn/uTsPF/sLjR/syqGdmxr3eHSQIGfjTl0uKR9EoqRxBA7zpakAmEmoOolMK4uazC3Q72GxgUMskU64mXP7pcSEHGhdsJ7pdTdroB4VvKHdL7RmARK+17JbisqTTPmXDTmS5NZZfJmRD3piO8C/kKLuo7TLpiie6IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJJDZIRJksGFX9iaua//hMeHMKC/cUrSsen3cp59IkU=;
 b=X0t9hGCM2ngmUuK6FKCT9aCDlFb0ENQ71cl2vrDiiVtYqZXnS3vasR2R1Sv7M9Jme+ikF8CwohPymRFXYi/grEE/JIWW+V1/1fDpwL0ZNRUOV50aeSHWyI/eskIcQiWgfS/7ApjVY0AcZ03cwK1QeNvi0WcgyaXE9LJZZfT/cUD+Wwdnr8t23S/3w08eeKKzluakRjYMqufJLNaduG0Qy6M/WpmAgKTtSm0fE9xQD52Z0UxGQWPkb795uaagd2vE8mRl6iAS5hoNVA+hV9DEY3XVl4zjS8+gn+weu1qzdzw+zyOMZBo2u1R6q0NgWJD/S/8kpKT3wExjqgWDFkiD1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJJDZIRJksGFX9iaua//hMeHMKC/cUrSsen3cp59IkU=;
 b=wdm+0xb7DZ+jrFz+TbfPL3vCWI5Ls6FG7eVUwi43+GqegY/u1nIQqgzQkgvtZ5MMhD5TJNAdYZURNlyiijHtN/GoIU2LbRfNXwwpWYzDl8sxrmb3ZbpB1MC5jJ9B7TPOYuHkqjXbu4v9hksbE2Gp/w8sHKq5uJ3s/toUwBBlPec=
Received: from BN9PR03CA0978.namprd03.prod.outlook.com (2603:10b6:408:109::23)
 by SA0PR12MB4383.namprd12.prod.outlook.com (2603:10b6:806:94::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:39 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::83) by BN9PR03CA0978.outlook.office365.com
 (2603:10b6:408:109::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:38 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:31 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 26/45] drm/amd: Use `amdgpu_ucode_*` helpers for SMU
Date: Thu, 5 Jan 2023 11:01:12 -0600
Message-ID: <20230105170138.717-27-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT032:EE_|SA0PR12MB4383:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c59a86f-441d-445f-b0b8-08daef3ea69b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OLu7CpLNVLciwOBRI7JW+iaO0r6lB7Jj9y2VOQe9p6YP43Y0OWkfiUNqYzFgNR1b+JHDxSQbKrGh5IjaODGLzv4YaS6dpNEyWJga3T4GSYv4gmVGRSeDUtKkXEpWXKYdJLaExSjc7zxZSXYs4ypJukfkk8fNZHMkceEsZdUL1r+1vtjRdjdowt8r3m1H317HNLLajSBos+01T6oNz/a1tDcqt/eGfAAGzeJci2z3jRkstCJ05+G1rxVGVWNGUJz7j39zhMtShVBYbpSG+ZPGIPIIGIEu8zMnPvmUmB239l/G+pR9Wo0xOBEv9x5Scl6OXlYBXrIhb72QPX+ZzW6nHarNNjRI0yQ1ub3rZdonlkl+MbE4Bd7AY/iKedrQ7a9cb43Qr1clovlFwjimkEINIJy57+00PpexAyjHGPuvxFdfDiFfWYOeUak/XJ9gnhjkjwUOr+z6hwOd1vVuKqytPfF81k0Tr+Sw1cl+NzCu3YVq5w4HSLlXP/2shkX04gDpoP2Ob+KnUQPhNk+7DQSrxlUPfUnCbO6FCEYhj/JTeHAufYPMte7WyHuaJKj4hwTXBxchD/H7MijGNXQ2sjvgfBsmXcbi+dyRFzRB/g8Xz9irQNftHHBJUtuVicJG6vlN2f1jor+Ib1uRbKGxX0lSXbHXPz6gSIPizLq3dINQSwPJhrHd4gKyGTDl00RILVWgB8nzZkrtuljeI+DzpmYPIXJRaMoOs2hqUB7ZkZsu9K4w4IZMHVzWJp8jIXqYI50tdoZRjV8Y6I2gRlCYoMDp4A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(40460700003)(8676002)(5660300002)(70206006)(316002)(478600001)(70586007)(6666004)(4326008)(41300700001)(8936002)(2906002)(7696005)(110136005)(54906003)(356005)(336012)(81166007)(82740400003)(1076003)(426003)(47076005)(16526019)(26005)(186003)(2616005)(36860700001)(36756003)(40480700001)(44832011)(86362001)(83380400001)(82310400005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:38.8109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c59a86f-441d-445f-b0b8-08daef3ea69b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4383
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
 Carlos Soriano Sanchez <csoriano@redhat.com>, Evan Quan <evan.quan@amd.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
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
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c | 16 ++++------------
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 16 ++++------------
 2 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index d4756bd30830..6492d69e2e60 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -109,10 +109,7 @@ int smu_v11_0_init_microcode(struct smu_context *smu)
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
 
-	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->pm.fw);
+	err = amdgpu_ucode_request(adev, &adev->pm.fw, fw_name);
 	if (err)
 		goto out;
 
@@ -130,12 +127,8 @@ int smu_v11_0_init_microcode(struct smu_context *smu)
 	}
 
 out:
-	if (err) {
-		DRM_ERROR("smu_v11_0: Failed to load firmware \"%s\"\n",
-			  fw_name);
-		release_firmware(adev->pm.fw);
-		adev->pm.fw = NULL;
-	}
+	if (err)
+		amdgpu_ucode_release(&adev->pm.fw);
 	return err;
 }
 
@@ -143,8 +136,7 @@ void smu_v11_0_fini_microcode(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
 
-	release_firmware(adev->pm.fw);
-	adev->pm.fw = NULL;
+	amdgpu_ucode_release(&adev->pm.fw);
 	adev->pm.fw_version = 0;
 }
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 506a49a4b425..59d00fefc558 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -103,10 +103,7 @@ int smu_v13_0_init_microcode(struct smu_context *smu)
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
 
-	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->pm.fw);
+	err = amdgpu_ucode_request(adev, &adev->pm.fw, fw_name);
 	if (err)
 		goto out;
 
@@ -124,12 +121,8 @@ int smu_v13_0_init_microcode(struct smu_context *smu)
 	}
 
 out:
-	if (err) {
-		DRM_ERROR("smu_v13_0: Failed to load firmware \"%s\"\n",
-			  fw_name);
-		release_firmware(adev->pm.fw);
-		adev->pm.fw = NULL;
-	}
+	if (err)
+		amdgpu_ucode_release(&adev->pm.fw);
 	return err;
 }
 
@@ -137,8 +130,7 @@ void smu_v13_0_fini_microcode(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
 
-	release_firmware(adev->pm.fw);
-	adev->pm.fw = NULL;
+	amdgpu_ucode_release(&adev->pm.fw);
 	adev->pm.fw_version = 0;
 }
 
-- 
2.34.1

