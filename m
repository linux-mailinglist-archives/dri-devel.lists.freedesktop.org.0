Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F75465E3FB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197DA10E679;
	Thu,  5 Jan 2023 03:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7494010E66F;
 Thu,  5 Jan 2023 03:44:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdFsXQbi3GOV6khMnHRY9vA1nzpymyRliH2y96ocjhTAWjo2Fslty4TLCbPsKaHCH2kRXa/cfKSccGOw6jZ4jA2W2vLhjL6dcq4GiZxZaUroztOdmNTvI2HMn2prQ7hhAWT13Udd/sLPuFxUlvFOG2nUW9B7nmlz98s2NPKFSF1EKiLpIiGlFc7KI8a6+/52PbS/6WX0TdIGU1S3zDks+DIpWB+bQXwr3z31RjhdHgg8Bz4zjOgY1LrAkn4LNwugCZl6tqJvcUahG82om05KE6qVuMV3/b68V2Lp7S03+PSw+WqtMQgLMJ1aW08f3e2M4nw6EI9Nu71C37nyRfw0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1N0zpVjlinVnvNufHv9ZzPOOeupjLnOwRgt9maMqXQ=;
 b=TVyXiliR9ZFfgcg7zkClu/NaKI1+gBYOyfOsuHEHpECIc5N/OTkKOJTp4T/+d3PhsU/5Vuk/3i9Bs9JTKnF8G/tE0rsMRvacgMDvcWdR0Z9u5Dy11guSp2izDM9TbkcFqQtosiYYiUNdm7+staXFX5qRE0Cw/ixE80jv5owKB2HJxrA7xCAvk0MiPyCsjTKHpuj1ARnDaoAgVLaaJvzwsGAFycosPyvaLzLLBtDMvcYYpZS5tBVJnIo4oS4ultRDUGRT//d9zcMQ/00TA8kIuOK+OHvHNXsQqWLmLaBkPeMc8+VeEaYOUNh/riVNLuFN2QhTtT3mMKwJGCHc0E84fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1N0zpVjlinVnvNufHv9ZzPOOeupjLnOwRgt9maMqXQ=;
 b=ItIbq17beiW4v0N8xKPGb6ng8VZ3dLhv80tamjH0bgOzNOgbZPlXoFTyMRu2nAg6Ub90OzyXJdlQSzNRrzbn5BuaOkAKWbOllxpS8KFd6RgdwIjIj7tMvMrwZyM7vjgR0xqvDBLE+AXJVk0Do38fr2BApaOkkuXqjIEWM4DidOs=
Received: from BN9PR03CA0078.namprd03.prod.outlook.com (2603:10b6:408:fc::23)
 by CH2PR12MB4889.namprd12.prod.outlook.com (2603:10b6:610:68::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:42 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::3e) by BN9PR03CA0078.outlook.office365.com
 (2603:10b6:408:fc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 03:44:42 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:40 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 26/45] drm/amd: Use `amdgpu_ucode_*` helpers for SMU
Date: Wed, 4 Jan 2023 21:43:00 -0600
Message-ID: <20230105034327.1439-27-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT064:EE_|CH2PR12MB4889:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cab490f-8f8d-451a-7614-08daeecf2e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rspzc5BjXt6R8lejqlwaCSRNCSqph4TADseos1wrxScCS1JI3jXPYrtuUrId8NTlj8RcA1Qg7+BDzUSW3nV2o/eX27Pd0xJPEIyYG9JuRxgHFF4RWkw8I8qh8xOrWzZFQBTpVXTK8m7TLpCZgWvK3IHh++093tg3OeTbjEeu+ffugPTVWcJ1HKXQ2HzYpOg9iz/myXq1q8jBRzDBUmjbE3Z6pO1ueW91pX0/6ZCrJLujRlsekbBLFoXQ+EeEOPmlsYWB7SpqOLm07PoTOisvKVnNspg7H0auLzqCfSXf8rY2B5fBEwUtynmUoFC9U5+13PBjbyRRfpzA45x+IzPn5Rsdzpgv4iqHuVSCDhSXHgus6+ZFt0DIjQDvSZKOVYjsDV48hejRW5HI4ZO2Ib7KyrWy86IHc3WUp0vh4p0ONVB+mH7VYWwNcW9+5jA5Do3bG6Oz0PT2J8WS3PCsQJe3GyKdtHZBXy2PDB6NGm0rbKbOxR3pSAwNb+uWtFSZMdM0rRd5MMqFQU/eVzaLqOp0RKzW2GC1yY1ycelbCb1S6Gc+TbYKtldQmJPBNTQfzcBPJuSPm1VyLHyxNs8vhnz6+1VI9lgkqmLb2o8ZRJgewfLkKaxEkC+J1rNTdQTTRAik9LfAyBsBBzzm1p8PAS0LyHyzuH4D6GM54rsBz3b4NBSb1wurcY1oru+/VNyo/8OLr4AudVwdrGS/D+IOty9svJyvphr2Rya+sGj21xdfPDWtapzBp1+XpEdjNSJ6PmtuLSiZnGYSiUBPpzKq3yj/MA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(2906002)(41300700001)(44832011)(8936002)(6666004)(8676002)(4326008)(316002)(70586007)(70206006)(110136005)(54906003)(478600001)(1076003)(2616005)(7696005)(26005)(16526019)(40480700001)(186003)(83380400001)(47076005)(426003)(82310400005)(336012)(82740400003)(81166007)(356005)(86362001)(36756003)(40460700003)(36860700001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:42.3825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cab490f-8f8d-451a-7614-08daeecf2e08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4889
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
 Evan Quan <evan.quan@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
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

