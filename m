Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3523365E3EA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4081210E668;
	Thu,  5 Jan 2023 03:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6819E10E660;
 Thu,  5 Jan 2023 03:44:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7kygjX/W5JvSezkmCGB27urm9fDTojaQSQd6upzyHo1tyWP0bV6HeDR3odoV2NbBFt+4xYJuD3h1u3kHgEMdUTb4Q44Ompja3XjP9+kf53St50hue7oOyZ39UTeICMKMow+Ug8XVBrOamxbuVmK/obCDcRJtE6wQ8A7Xz/QZib8IUBFfA8TnlqmgtiZ4wiq4IZVztvEBgoEIlMA8r0YVGzyQBuJtywqSyxQOcsEbrXGprhir3SJNe5kG8Xi1lPCnj6mIPDhcQ3MD6dhPqYPM0RSTFVgMbtxWr+f+0h2G3ycZOVbW1i0FuwTQuMchDHvHNkvtaZiYsewOn7rLM7mQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WINs59DY6tJkKOZrJMJYP/YMQqXTf1xJrprCJ6q3pFg=;
 b=b894ziBW5AkglW9pZOpwGf/KKuc9RLEvZJ4n+zdppDHnd72dDp4RU54O1AqFVXMGEFrxWTHCqUjWn+nb0Vhi3AW3iA/59p0S6t6R5rn9NHJBx3ZrlUE+3VqOf2F5P8hPUlZufXtzQhqk+bFTDigVqQ/VdQ/KNaqxxsPTPxo+rcTBlM1oyqBbRQnKsrGS7MMJyCG2hFRy6Xace6QCfLCZWLVvDnooCeGsrT3Jx7jliiCIPL3Bb4LD26jAlV8/aj8J+W6NAjI1kYy26GkCFYnbyiAy3zgVQDNc6vXxArONxin0IGJLFnshGr6Lc3616z86i45ZyYU55Juv6v7hydkKTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WINs59DY6tJkKOZrJMJYP/YMQqXTf1xJrprCJ6q3pFg=;
 b=N5GjZpfdYN95791drlqnl6Ie0Q6t/RL6Zv1KKbDhdzI5OpFCJtWZj5ZK8/07BZo912ol7RtqeTDRBtmUxjQjPLp8DSZwTrhfgvONqFYUENAx1HbaLV9F0xRFQRhNGZsQaFRJ4IXelYkk99twg4/1+76ua1pCIj3LgoYiB25iEZM=
Received: from BN9PR03CA0856.namprd03.prod.outlook.com (2603:10b6:408:13d::21)
 by DM6PR12MB4910.namprd12.prod.outlook.com (2603:10b6:5:1bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:36 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::4) by BN9PR03CA0856.outlook.office365.com
 (2603:10b6:408:13d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 03:44:35 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:34 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 23/45] drm/amd: Use `amdgpu_ucode_*` helpers for PSP
Date: Wed, 4 Jan 2023 21:42:57 -0600
Message-ID: <20230105034327.1439-24-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT030:EE_|DM6PR12MB4910:EE_
X-MS-Office365-Filtering-Correlation-Id: 448cd07c-e859-4fad-dd97-08daeecf2a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rjoKe8c/WbnM1DdRNZIInHQhzWeE9J4wB797tujkRPmYl2O/ozZ1WK8Kmm9Nno8b9KqIsfZuRZ3yQ22tE0jyMNiihlF/jG6AR4wK4xNQLDyDoyDyzk88Qi6QOC2i/glkkqqa7IwTc9yg7uRoMSRUkw36kvoH4V/HjzuqETxJ1O8HNFPoa1GSHQY/ac/Hvej81716y3dX6DiFmGPFRQd4BY5/FBAC4zvFrpzokvzhOcvBfxTaBjk29m14iVjIFk7/nS5qIKsNeBpaJo1wKXpx/eyVzA6SP1BMf4Jz8HbkEB3MsHyZipgKewfq/PMGFQbJO6XAUyAnMRo1STECbBCmGNFtubxMf1DnqZCXJJmBgw4ojjaBfTH694NwY+Ax6ByPodJd12n3HOXDaFea7tJPG/l56uf6aVL/PvPGkgKlSTRBKX2JQfVupKr9i321SpXAudKe1MJVGj+gUASxnM8p+epeZvgagcID69RrISYPkGHOxskWICpIpDR/BLnRUAv4ZIX/Mhle5xTRGwidm6A8W4SjHkZmP0WudovLAbCJJ/wq7tCK/vBLotjAacCWIpQMh3hZb63pcNO6vHIu2AEMpCuUF9OKVtpkKHdGTaNWKuiNqjOvF1IHOpT49smmhW5w0opEQDFVPhQFAJzl7aVRImRsYfuuRCNulh+v1CpO2aRA57FZGMC9JZsti0BoMb0ha10fop5cMXbjDsCklt/zquAdMXcG1WlYQccCzvkHT6EEyaPqxCu52IqLeUpywiLk19j9y7IMDMm2xLwE3ekfAA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(70206006)(44832011)(8936002)(5660300002)(70586007)(316002)(41300700001)(2906002)(54906003)(8676002)(4326008)(478600001)(36756003)(82310400005)(110136005)(6666004)(36860700001)(26005)(83380400001)(2616005)(1076003)(16526019)(47076005)(426003)(186003)(7696005)(82740400003)(86362001)(336012)(40480700001)(356005)(40460700003)(81166007)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:35.9757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 448cd07c-e859-4fad-dd97-08daeecf2a36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4910
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 80 +++++++------------------
 1 file changed, 21 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index beaca5846c73..aaef30bba97f 100644
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
+		amdgpu_ucode_release(&adev->psp.ta_fw);
 
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
+	amdgpu_ucode_release(&adev->psp.cap_fw);
 	return err;
 }
 
-- 
2.34.1

