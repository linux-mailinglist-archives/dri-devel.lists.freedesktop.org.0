Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B16CC65DA59
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A217A10E567;
	Wed,  4 Jan 2023 16:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FB710E53E;
 Wed,  4 Jan 2023 16:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaajcZgY2Xmtr07Q5WbdPpwqFpWefXEos9ULnMw0iTNbfiOZhltibr1L/rFMiypgMdgkmIhqyHRsIFG1mWx1hFcMrvXcUX64gPMXhVUPGq4w70jWOsXIph6rOoRVtdwd6QK3qtLC/Hvlqlg0sWHR8T5XpfJzJVFYJqNPZPM+/LdQrLriF3itLssDannuqaRzq+9eKD+8iHsB/MnyDg9xNugJtrkDyzFm4RbLk687l8g1yiinb5CLVG9p1uZtITfzP6FkkGhOQeghg1RLUJIHXtEE99ylQbPInOYzwT9EBt0tvgCUmkqzRu40q6zrklBigRCokU/+AKXQS8nf0zWZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTTm8v6JricYqEcyTi+Bi6psl2A+KKp8lyx7d2ID5U8=;
 b=cabcTzg3pTXr7UNB2XjoV+FfNzpkFotQFh9BpiMhavIjpAFSyuiuBqDi7+jOotaGqV3T3zUql6EJ5QQOwOY+rDUqQAm/2ty412Y7Rguv71s+Tvtb7frlLrztDzNMYriNlMW/sazbvN0iv389j7ILEq2cpecjlFc0kNoDhTi7V1EhUF9TO7BMr7P9ut2AAjUDAoa6+nVaOw2Pd+gjXPpvWWEb2fup/ZC9ElcP4XVm6qZDIkwlJMM9CzUJhdopy4AZF2RxXmSAKG34dNQDRSEZiqvKrDwaOB6v3mY4ucz9OZkF4g1CZA4linORrTrPnhLprXA3OTSF8PVbMKLVB3L2zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTTm8v6JricYqEcyTi+Bi6psl2A+KKp8lyx7d2ID5U8=;
 b=vlqAQuhRHshaC7VBOa4EnNps1zpHzVyFnlnW8waSqABOhN5NHv7CSVBVxg44eHgq01lm8yWDzM7UkPatBLOer9s4cvloDIJpdFHqQNhFZDcWOdru+qMfaZOd2wX3P5eCqv4ZXk9307IbykG8sZiZMLw9rDs7XCyKG0gQ6Ozq4Qk=
Received: from MN2PR16CA0050.namprd16.prod.outlook.com (2603:10b6:208:234::19)
 by SA1PR12MB7223.namprd12.prod.outlook.com (2603:10b6:806:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:43:08 +0000
Received: from BL02EPF00010206.namprd05.prod.outlook.com
 (2603:10b6:208:234:cafe::82) by MN2PR16CA0050.outlook.office365.com
 (2603:10b6:208:234::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:43:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010206.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:43:08 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:43:06 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 23/45] drm/amd: Use `amdgpu_ucode_*` helpers for PSP
Date: Wed, 4 Jan 2023 10:40:12 -0600
Message-ID: <20230104164042.30271-24-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010206:EE_|SA1PR12MB7223:EE_
X-MS-Office365-Filtering-Correlation-Id: 15dd52f5-7faa-4fb1-6a1d-08daee72c2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I6LSXlBOSpDJkDI9/t4aiXTzo0qMAb9516Tb13uG1u1an1JjmyznG2EtEjAVO60xE7X0zc992Qn9Nt38GiUWC1T91cJlrYophX56oSesRqVdTRLVcI4jZVDb1EQfnIOvV+xTo3YyFD2ku0BU8Ck+omrVbAK3CuS+oBYoV1n6xUsyJN33P33adMjkuAEzS491ilElMreigDskbfWWMxAY/cO91t1weE2jKIUu5gwb8ZRSMgQIUAplofdUYmWJmcWGTkxq2DBzukR4TbVjFDv79A3srKwpBRpUg+bmQ0+YUG2XGvV0wo1R8lt0bgtLcJjwOxwVsWflhGvQ4E+KZKu01Qvr+nYt7XWgKr1TYnteF8DEE/LyQzq8dfH06Oal3PNsgYjP08EsUBEhcBLFoa0yJ+G2xMi/gyJNgXSV1R4IIAwOkpJx8FNJzbPV9zZJh2Bffu2jzzMKT41jN1c0fyJ7P10aoZ2LIHHTaYu1KjrxGpfawCAW7CZsSoSKxW9WYhOuHftWdsi0VTb2dzACGooOEZTdhqR70z15rXm9bZjHFkJLY/g6LPGvYYQv3upv64qATitBbS2z6Vhjqrwl8JKnhOHORhXffdmSP6mEaNwkfA1Fb0spUZJf1laVqnzdwOcKtHotb0V2cNVAIE8k7DlMJvZ37y/tWKJDFubU26dYHRxcS23dp3idEWKRFA0tGW3mCCPUVUwogs3H/JMdYQRQJSpRwKT97nGeFOEwEAeu/bfiMvR8TcPohTjx4FI6CjyHBZiFExtgARDcCiV9/8ExXQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(16526019)(54906003)(316002)(6666004)(7696005)(26005)(110136005)(186003)(1076003)(478600001)(2616005)(70206006)(8676002)(336012)(70586007)(4326008)(82740400003)(426003)(41300700001)(2906002)(47076005)(83380400001)(8936002)(5660300002)(44832011)(86362001)(36756003)(36860700001)(40460700003)(356005)(40480700001)(81166007)(82310400005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:43:08.7540 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15dd52f5-7faa-4fb1-6a1d-08daee72c2c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7223
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 80 +++++++------------------
 1 file changed, 21 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index beaca5846c73..8a3a38ea7b46 100644
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
+	amdgpu_ucode_release(psp->sos_fw);
+	amdgpu_ucode_release(psp->asd_fw);
+	amdgpu_ucode_release(psp->ta_fw);
+	amdgpu_ucode_release(psp->cap_fw);
+	amdgpu_ucode_release(psp->toc_fw);
 
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
+	amdgpu_ucode_release(adev->psp.asd_fw);
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
+	amdgpu_ucode_release(adev->psp.toc_fw);
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
+	amdgpu_ucode_release(adev->psp.sos_fw);
 
 	return err;
 }
@@ -3340,10 +3312,7 @@ int psp_init_ta_microcode(struct psp_context *psp, const char *chip_name)
 	int err;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
-	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-	if (err)
-		return err;
-	err = amdgpu_ucode_validate(adev->psp.ta_fw);
+	err = amdgpu_ucode_request(adev, &adev->psp.ta_fw, fw_name);
 	if (err)
 		return err;
 
@@ -3360,11 +3329,8 @@ int psp_init_ta_microcode(struct psp_context *psp, const char *chip_name)
 		err = -EINVAL;
 	}
 
-	if (err) {
-		dev_err(adev->dev, "fail to initialize ta microcode\n");
-		release_firmware(adev->psp.ta_fw);
-		adev->psp.ta_fw = NULL;
-	}
+	if (err)
+		amdgpu_ucode_release(adev->psp.ta_fw);
 
 	return err;
 }
@@ -3383,17 +3349,14 @@ int psp_init_cap_microcode(struct psp_context *psp, const char *chip_name)
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
@@ -3410,8 +3373,7 @@ int psp_init_cap_microcode(struct psp_context *psp, const char *chip_name)
 	return 0;
 
 out:
-	release_firmware(adev->psp.cap_fw);
-	adev->psp.cap_fw = NULL;
+	amdgpu_ucode_release(adev->psp.cap_fw);
 	return err;
 }
 
-- 
2.34.1

