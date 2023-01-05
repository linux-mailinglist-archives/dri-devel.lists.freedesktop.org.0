Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A94465F1E6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC17D10E79D;
	Thu,  5 Jan 2023 17:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2070.outbound.protection.outlook.com [40.107.95.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BE410E78F;
 Thu,  5 Jan 2023 17:02:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwKptjb2za3fcPWTHbhD7gomzxfmtwqfLJ+J3mZROfeJdvil3LD1UH/8nVMorEveFY4v745YkfQ5RSnMyLbW7h9OOkh8U/FDPeoiaf4Ka0Vmvft/E5A6y4UMyz6+YZpbywWz692Bcamvf6u5IrP5HeAaTU5MkYjuSisvu+36v0DG+p0hFWdqJ8zRXhBq6uboFQDs3jNHlCtuTY1QmR0McBQDAAj68pocHGViDnw2voGy3CJF6xa/oCx/SmP7yszWAYQuqa70/3djr+Grm/AvKRQBf4Gul3S22xy/GQDuSFqhQWlVxMAIrxCSc0JpgzrlrjWC+LrnAN+HRqKrDPlkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1h7jZJcQoktQP2k55mbhtGouKTudgpcxF0cTuKq/CM0=;
 b=frdMxomHIppxQkC8kZozF4d6uQnivdSztT+kow1hNCcgTdWKWAuO4/VeS2YOSoU7uMg45YKd+PHYGzHCqoefkqA8K3e9BGbL4TWQ+DB8DQnORAaN/8gFOCrk8cqfTsPi3T5fMWdr/4uEli7ZmMTbhrOgJebeKgzZ40ZwaPs/FDuumz+oHJwUnL06es/Yb23Mtzl2lwZPiFO980lPnljyUbWtw3Pb5zeOdK5pg5A0bqm0aIflEszR57knqrJipr6SWNBJu5bceuGZ5sU7pc8e12rZ3XYPgemR4M+E4Gg7NDdNh6KwOAH2WWGXODGRko8sN+rSDJm0VyicU37Z2/1p7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1h7jZJcQoktQP2k55mbhtGouKTudgpcxF0cTuKq/CM0=;
 b=MhqFybFbD8j5F6kW9rJ4uY9yXgnxp2h8c3HoYroTN10zLD43scEVlGYe0HzbBDR5uRV+tKBemIdKKNTvklbDFF0asvjRNRwyy/IZixlQezsbhvfdDE3aPpnmcytlYU3othheAxy7c0uYmPQTe+LWNRMsaZqS93SSonIMOvXMrB0=
Received: from BN9PR03CA0989.namprd03.prod.outlook.com (2603:10b6:408:109::34)
 by BL0PR12MB4884.namprd12.prod.outlook.com (2603:10b6:208:1ca::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:37 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::fc) by BN9PR03CA0989.outlook.office365.com
 (2603:10b6:408:109::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:36 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:27 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 23/45] drm/amd: Use `amdgpu_ucode_*` helpers for PSP
Date: Thu, 5 Jan 2023 11:01:09 -0600
Message-ID: <20230105170138.717-24-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT032:EE_|BL0PR12MB4884:EE_
X-MS-Office365-Filtering-Correlation-Id: 9692f2e5-f920-4e06-87db-08daef3ea589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V3nOqAUB+/4P6cDVEGotn+PkAM3XlUJIDnbFnLZSEEAxvUQtGyiAJiGC+wURwN+WbIoJEH4cXvo/aaJyNjUz0j5SbaBxiwNR2N3PkFanae54xtYnwcHev2ETfQzX4rdbdt05GMEjmm38bMJ3g8ZccylIzxrD3BtNbPqcljLCtVFWzN1sotlwyj5DWadI/4Ornlnz7+yl3yFE1G12mVf6DrAc7CgsCRNPYPO5fqV4+6Ewx7zZZFX+jKXfob/ixmZqgf0ljn3YXDEvqZ5PR/riBsY4etvHaQmIVlPIfzm9v3fRKR/bPllt6CVnmltGSMpB7VA/3GfhWMmQh/rz3PrFkaIymO/UBlVl+7rcFqAhqiZSKVu4uik4kLb8qagY4l+LQjbUR7LeEGOANYpVhkCrIIbIr0fgYj0DhGFfWlPhabMLvmfzMRlvYFWCW4YLY0Y5Z+k1qlRBFrtELDtKMh3fcshBVnIxmKuviewA3cajedL105AuL99A5SGPtClFOP7IM4w3U/zgI4Gq8ArynBXobfelnDX37XF5DSKSlDp7PgtrJw3YC3Ca/3nJUxeYg6DoOcfQ5gwoc7m6daYGZpXRFhIr2ITCJiYJCL9EdczRlKG3GL3ZX0j1ijyDb1rGVyyo9TzA3QuYYULp0VE0EYqKXwWjx7WdRQYM49x3bNBopwH6GRsNi+MzvH9425ybr9R4DvmQXVJ7F198X+OENNKt/nqIOR6tS+asYbYgOWkKe3Js39gkOzutxptfU2C44cxKvD/VBGwiNEC2dqBT7mKSXA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(44832011)(41300700001)(8676002)(70206006)(4326008)(70586007)(54906003)(110136005)(8936002)(2906002)(316002)(7696005)(478600001)(186003)(26005)(5660300002)(6666004)(16526019)(86362001)(40480700001)(36860700001)(1076003)(83380400001)(2616005)(336012)(47076005)(426003)(82740400003)(356005)(36756003)(40460700003)(81166007)(82310400005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:36.9986 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9692f2e5-f920-4e06-87db-08daef3ea589
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4884
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 80 +++++++------------------
 1 file changed, 21 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 73d67a4d0f5b..aae76acc38e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -510,20 +510,11 @@ static int psp_sw_fini(void *handle)
 
 	psp_memory_training_fini(psp);
 
-	release_firmware(psp->sos_fw);
-	psp->sos_fw = NULL;
-
-	release_firmware(psp->asd_fw);
-	psp->asd_fw = NULL;
-
-	release_firmware(psp->ta_fw);
-	psp->ta_fw = NULL;
-
-	release_firmware(psp->cap_fw);
-	psp->cap_fw = NULL;
-
-	release_firmware(psp->toc_fw);
-	psp->toc_fw = NULL;
+	amdgpu_ucode_release(&psp->sos_fw);
+	amdgpu_ucode_release(&psp->asd_fw);
+	amdgpu_ucode_release(&psp->ta_fw);
+	amdgpu_ucode_release(&psp->cap_fw);
+	amdgpu_ucode_release(&psp->toc_fw);
 
 	if (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 0) ||
 	    adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 7))
@@ -2912,11 +2903,7 @@ int psp_init_asd_microcode(struct psp_context *psp, const char *chip_name)
 	int err = 0;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_asd.bin", chip_name);
-	err = request_firmware(&adev->psp.asd_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
-	err = amdgpu_ucode_validate(adev->psp.asd_fw);
+	err = amdgpu_ucode_request(adev, &adev->psp.asd_fw, fw_name);
 	if (err)
 		goto out;
 
@@ -2928,9 +2915,7 @@ int psp_init_asd_microcode(struct psp_context *psp, const char *chip_name)
 				le32_to_cpu(asd_hdr->header.ucode_array_offset_bytes);
 	return 0;
 out:
-	dev_err(adev->dev, "fail to initialize asd microcode\n");
-	release_firmware(adev->psp.asd_fw);
-	adev->psp.asd_fw = NULL;
+	amdgpu_ucode_release(&adev->psp.asd_fw);
 	return err;
 }
 
@@ -2942,11 +2927,7 @@ int psp_init_toc_microcode(struct psp_context *psp, const char *chip_name)
 	int err = 0;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", chip_name);
-	err = request_firmware(&adev->psp.toc_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
-	err = amdgpu_ucode_validate(adev->psp.toc_fw);
+	err = amdgpu_ucode_request(adev, &adev->psp.toc_fw, fw_name);
 	if (err)
 		goto out;
 
@@ -2958,9 +2939,7 @@ int psp_init_toc_microcode(struct psp_context *psp, const char *chip_name)
 				le32_to_cpu(toc_hdr->header.ucode_array_offset_bytes);
 	return 0;
 out:
-	dev_err(adev->dev, "fail to request/validate toc microcode\n");
-	release_firmware(adev->psp.toc_fw);
-	adev->psp.toc_fw = NULL;
+	amdgpu_ucode_release(&adev->psp.toc_fw);
 	return err;
 }
 
@@ -3105,11 +3084,7 @@ int psp_init_sos_microcode(struct psp_context *psp, const char *chip_name)
 	int fw_index = 0;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sos.bin", chip_name);
-	err = request_firmware(&adev->psp.sos_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
-	err = amdgpu_ucode_validate(adev->psp.sos_fw);
+	err = amdgpu_ucode_request(adev, &adev->psp.sos_fw, fw_name);
 	if (err)
 		goto out;
 
@@ -3181,10 +3156,7 @@ int psp_init_sos_microcode(struct psp_context *psp, const char *chip_name)
 
 	return 0;
 out:
-	dev_err(adev->dev,
-		"failed to init sos firmware\n");
-	release_firmware(adev->psp.sos_fw);
-	adev->psp.sos_fw = NULL;
+	amdgpu_ucode_release(&adev->psp.sos_fw);
 
 	return err;
 }
@@ -3341,10 +3313,7 @@ int psp_init_ta_microcode(struct psp_context *psp, const char *chip_name)
 	int err;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
-	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-	if (err)
-		return err;
-	err = amdgpu_ucode_validate(adev->psp.ta_fw);
+	err = amdgpu_ucode_request(adev, &adev->psp.ta_fw, fw_name);
 	if (err)
 		return err;
 
@@ -3361,11 +3330,8 @@ int psp_init_ta_microcode(struct psp_context *psp, const char *chip_name)
 		err = -EINVAL;
 	}
 
-	if (err) {
-		dev_err(adev->dev, "fail to initialize ta microcode\n");
-		release_firmware(adev->psp.ta_fw);
-		adev->psp.ta_fw = NULL;
-	}
+	if (err)
+		amdgpu_ucode_release(&adev->psp.ta_fw);
 
 	return err;
 }
@@ -3384,17 +3350,14 @@ int psp_init_cap_microcode(struct psp_context *psp, const char *chip_name)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_cap.bin", chip_name);
-	err = request_firmware(&adev->psp.cap_fw, fw_name, adev->dev);
-	if (err) {
-		dev_warn(adev->dev, "cap microcode does not exist, skip\n");
-		err = 0;
-		goto out;
-	}
-
-	err = amdgpu_ucode_validate(adev->psp.cap_fw);
+	err = amdgpu_ucode_request(adev, &adev->psp.cap_fw, fw_name);
 	if (err) {
+		if (err == -ENODEV) {
+			dev_warn(adev->dev, "cap microcode does not exist, skip\n");
+			err = 0;
+			goto out;
+		}
 		dev_err(adev->dev, "fail to initialize cap microcode\n");
-		goto out;
 	}
 
 	info = &adev->firmware.ucode[AMDGPU_UCODE_ID_CAP];
@@ -3411,8 +3374,7 @@ int psp_init_cap_microcode(struct psp_context *psp, const char *chip_name)
 	return 0;
 
 out:
-	release_firmware(adev->psp.cap_fw);
-	adev->psp.cap_fw = NULL;
+	amdgpu_ucode_release(&adev->psp.cap_fw);
 	return err;
 }
 
-- 
2.34.1

