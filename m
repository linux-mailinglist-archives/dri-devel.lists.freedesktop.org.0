Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBFD65DA63
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6442A10E58A;
	Wed,  4 Jan 2023 16:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB87D10E57F;
 Wed,  4 Jan 2023 16:44:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b64rqRvf3voP0HMpjUyKhzFFRzUmHIdyA0oQa57wDJWLExx+dn2qXGORZo94SVRTE74Wj+FJTNFdU2PjLzZqpHzG1RYx0Mi8vtghT1F87UWT8W0mRrO/yyFavLR70IANVst0h1k1XdDiP8qpIztcxpyWr3u6WF5TUsoQWX3p4fEc5sSV9gyMYB8SbaK7JAQaqv5qQ0YDe5ih5WPKwAx1+iqepQvcOowhgtmEFplNzJD+gJUFkBkvB9htbyQIXOZYIjZwtI73nBHgooq3QXl3Zg2q/za5jQchKcWlGJEx7LWrEBobNuS9raLEqy+InHUt4RlE1lisfO+VrGjVpkoloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wd1zlKWvld1jLozUiuJPQ6HbgOIicSeri2N+lSU9c40=;
 b=nwAHld2QoEBmSviIdjWxb235GnFlmo2w6f8/F0m5ZiDwZPvY7Z2WsbBkJcUbGtc8QwEWNnKtm0TFZbWxpR7poVBMQC/hxbfdFCNzrP29g0jpCNwZFULH/YnZKbGvthySXL0FeMWPmrcn/xYexkisMfaUm1KPrlBRSh6eNq6/urovrDTcPvONfgGmHuBf/FVex2XWwFCateY1+eM/xXaFKMaCoKClZrLysD7NCvoX8eP7avQBMwYv3bgG4Vv9wgu4vESueql32byIz9hQ2Czc8tHOnlW4LEvQ6ZmxwSb1D/3D/lkL8FHHd/SW9HMm2IyR2ZapRRsvjVE5AV1qzGTiRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wd1zlKWvld1jLozUiuJPQ6HbgOIicSeri2N+lSU9c40=;
 b=etzb6/HeYdUaiJP+5hxQBYBQDYr06OQi9Tl0N1I3UTGlvynggJ01mZyycoMWJZfnL9H12QR62Ks05ZU0pA9ilLKIWQmyxDFuTnkOZBR2zLaO53rrXE9PO+kEvElAtemg0CJhEHpPBYTmSKt9z8SVOSA8Elgezk9osb2mnjgtcIk=
Received: from BN9PR03CA0617.namprd03.prod.outlook.com (2603:10b6:408:106::22)
 by SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:27 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::b6) by BN9PR03CA0617.outlook.office365.com
 (2603:10b6:408:106::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:27 +0000
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
 2023 10:43:46 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 29/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX6
Date: Wed, 4 Jan 2023 10:40:18 -0600
Message-ID: <20230104164042.30271-30-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|SA0PR12MB4382:EE_
X-MS-Office365-Filtering-Correlation-Id: eef20672-c579-4b09-06b2-08daee72f190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /vN5U/8IzjeohVbia2k7Uj8HmAwErKjAzxnP7ugfw7BoeFJiQeS2cVKucImtS78TxUnNpc6Vt/a03l952sYEHsQENWKYa/T8xvmjr2roZ3uWpJW81sWGtKBs9lr3FjGAodqOB+8oXNal0ktPZK93cwQSoomSOX7q0OdloULAGJSs1BK6c0fzP+twRnAk9liU+XmjslmkdXKLNKtkzS5K+2Fq0Oh0L+t2i3v2N9ejMkqLkhXzaiQREekiw070WYhBmgJIieHNnxldOMggziM4j/9wdThHmLnvVaM8a7VWFafKaka9mxJA064fT6/TRFc44gALOkuW3KFF48Izp3pqbymbJ1c1rW2ge90ZYkC3RDeJmdcdGSNceTLcHK/mOB1509FXF0WBcY4g3eYnsiW7wz2q/NlRYYW0Xy0gXfNHwzKkSj4KHqgDtdqcvfBVMBaafJ3tpP5Dt4wK2w4IhEhLEmJ2g+M1QhmCb72bChDVsP+mSrPdcsA5Ni1GVxFzXH8Hz1Yyq3WYqsuA7EQX6qcJgJ4OS/MmVUxUapMGeFTgLUdTONcOimkSyrAYgJ+wzyJZ6FBBdz/iH7w4On041+ltxmQBAyE+0K1TcEXkbVOgxiHR9eyJNyALbaHbwfhazFy7usk8Lf8gkDyV+04Hfsedj6vJVn2nQE/QYa++HfL3vGUNOW2HMDA8kBQe/3O+Aua5W4J5AdtiLjrQzyEQobQ/FzezNElBq9+afN+lvLvrq3uHexBRzLw5bbQg4dcYS3Zx2QW0E5l/xHRWJwn2YoB5ug==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(47076005)(426003)(16526019)(1076003)(186003)(2616005)(26005)(81166007)(82740400003)(336012)(356005)(86362001)(83380400001)(82310400005)(36756003)(36860700001)(44832011)(40480700001)(41300700001)(8936002)(4326008)(70206006)(8676002)(40460700003)(5660300002)(6666004)(70586007)(316002)(478600001)(54906003)(7696005)(2906002)(110136005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:27.2308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eef20672-c579-4b09-06b2-08daee72f190
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382
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
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c | 30 +++++++--------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
index 204b246f0e3f..c2f31d8ad23d 100644
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
+		amdgpu_ucode_release(adev->gfx.pfp_fw);
+		amdgpu_ucode_release(adev->gfx.me_fw);
+		amdgpu_ucode_release(adev->gfx.ce_fw);
+		amdgpu_ucode_release(adev->gfx.rlc_fw);
 	}
 	return err;
 }
-- 
2.34.1

