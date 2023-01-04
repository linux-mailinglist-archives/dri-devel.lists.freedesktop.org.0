Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4675B65DA6E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2584910E592;
	Wed,  4 Jan 2023 16:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975CE10E58E;
 Wed,  4 Jan 2023 16:44:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HadzZ7ec+qFCH4mKqB+paZQjROmB3cozta+jAaC0yPiF14492VACMc/I6/du0x8AuzLvRn1hgBou4miKrFOhtVzjd7nsD/qtyJ3uj7hXFJBKxLcZx4hGgn0wwym3JkbKkxIBJn0hroDsBvQ2LAv8LjFeDg18QdESrEGOJMLww1x9bC2V9az6IXaErdG/vdcFsnvcQ8PJGhpkkO2eIGKldnW/4DtF4RSClq9aViTHb2e6gq3q06jzghWvZjG/LunEQ3Hin+EejhYE9HlFfxKiqinNfl5ckbi5CxLI593KWIkZSMhPpVP82u9Uo1ehE+KAEBbQdasPsAB1rmO9TafipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcARxDdOCypc9+MdqyOWGgEf4LnBxZ2wthl+qTDXDaY=;
 b=nfqkFgZC2ls+8D/IAJV9E5GZkwdTrT/gSzsTcSq42ka1uJUytm5m7Zv6QdwcccCzdoPXc8sHBAobmiM03d2Bt6O+S+dyP9k9MSUdUvp6eVPZC9fGcb5VZZaWoh1JFNeY4LjzwR50Jv88Lb4TrkEhbs7llJ19aXk8SSrXo4fM7LZxRI2binq8nPPrLbPGfHrAZsJ/qHoYffH6J0bd0ETYmU4gO1g1dOrGikh6+W4R5a5asZ+tMf0XJxXIV3NsbYXu4EqauAtoVN1dLvMiFB6RUVR3x6R/UpxapV0jdb7mwSQ/ZM8QLq2A7+sKb681ea7VB2v1ojRDlX3YoRUxdfOc2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcARxDdOCypc9+MdqyOWGgEf4LnBxZ2wthl+qTDXDaY=;
 b=nn1OxPTlhD/pYBbcRxjy6hdoCt5T+T15tpY4NZnLO0aC91GeCMxCAzsTRg5TPuVZWjA/sujFvbtLKFWBs0jB4xP6WC6ZO86oMX3g5YQJeWXGDKVC7APWJCJg/SLwPaEF0nqIlu01Nma5uI/xr4H7xx8dcFXDd+22aFSkDzSV1gI=
Received: from BN8PR15CA0001.namprd15.prod.outlook.com (2603:10b6:408:c0::14)
 by PH8PR12MB6842.namprd12.prod.outlook.com (2603:10b6:510:1c9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:27 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:408:c0:cafe::f8) by BN8PR15CA0001.outlook.office365.com
 (2603:10b6:408:c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:43:52 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:43:43 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 26/45] drm/amd: Use `amdgpu_ucode_*` helpers for SMU
Date: Wed, 4 Jan 2023 10:40:15 -0600
Message-ID: <20230104164042.30271-27-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|PH8PR12MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 256da0bd-7e23-4442-1110-08daee72f14e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bf13BTKS2FN3f/evcUIQJA+SQ/BTDScqFwxT27D0WHT1kWASAIOUYkhelfzCRlaNeGRehwqPpUw45qgqUrIhF0aJWbZMnbMt4KJaMrNMT6E0M9xhDXCKSVZUkrgAD3TWVxa1jwDRmakUVdo7IequPl2ihdwCeDpmhbY2Qj2yRz/xzz/lQ/Jyd7oO1zyMVSKEprFytbrbOE37MiLn2BSSTbB54dNEo6YuWwMmvYBDW3FGzjeI1hyHjRJmgh4llIUorp2IVF8HzRgl/OPSVpD7pqak9DqjNKOjqGj5fxTeyNsgyuADBPF3l3YcTB8Tt33aP40/SDRDF+VUaDdvZJRs+ygDFsKA98ZyL43i+uxim/d/RBwkGRAVbJ9Hl9vOSOH1LS8ubvN5CCPigM6NwW7DdSaS9qnm/Ost92fs3bqONcBr3Wc8r9vWXVQQ+pXae8a7mujvM1uZYoWxi8Qd9ny1Py3PtbQT8QGaW55AFzeZfTSFlVsC85dev3A4qEWUglS9D2jO3FdVrwDxCWtNXpAYo38hvK4JvkA84EcS42k0QOQRBVYtdXJxGD4+6fsVhPVGwJ67CNW7OgiWUN7ZQufFFvebk7E42X/uSKD87O+5CUBnAd1iuIuRiIwDYAXNVwTqd22aZ9knJL/2SrpokhogQgh+przDW7uIGyJMY/3/JrI3sfYuV84Dnegx+xVZVQWBuDHl6w2Qo3I4wLro7W/GLxRAeWu0LrJewJcEkbOPWbURgkz7OXXCt1dp+ZAjKEHsTuJWol/VVI9dvTflkF8m/g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(6666004)(83380400001)(36756003)(478600001)(110136005)(36860700001)(82310400005)(40460700003)(86362001)(82740400003)(81166007)(356005)(40480700001)(47076005)(426003)(26005)(1076003)(186003)(16526019)(2616005)(7696005)(336012)(44832011)(5660300002)(70586007)(8676002)(4326008)(70206006)(8936002)(41300700001)(2906002)(316002)(54906003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:43:52.9231 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 256da0bd-7e23-4442-1110-08daee72f14e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6842
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

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c | 16 ++++------------
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 16 ++++------------
 2 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index d4756bd30830..2e03dffbe59c 100644
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
+		amdgpu_ucode_release(adev->pm.fw);
 	return err;
 }
 
@@ -143,8 +136,7 @@ void smu_v11_0_fini_microcode(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
 
-	release_firmware(adev->pm.fw);
-	adev->pm.fw = NULL;
+	amdgpu_ucode_release(adev->pm.fw);
 	adev->pm.fw_version = 0;
 }
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 506a49a4b425..990cf54b4bca 100644
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
+		amdgpu_ucode_release(adev->pm.fw);
 	return err;
 }
 
@@ -137,8 +130,7 @@ void smu_v13_0_fini_microcode(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
 
-	release_firmware(adev->pm.fw);
-	adev->pm.fw = NULL;
+	amdgpu_ucode_release(adev->pm.fw);
 	adev->pm.fw_version = 0;
 }
 
-- 
2.34.1

