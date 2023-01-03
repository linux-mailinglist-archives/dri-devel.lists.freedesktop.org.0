Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A885965C985
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC3410E4F7;
	Tue,  3 Jan 2023 22:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A060A10E51D;
 Tue,  3 Jan 2023 22:20:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmhlLcTRDiCckB7bctzGSC9gCyIF7QfJRn0zfLQUe8/DCHumnzlMz/kMVPkvhEBPSHtjbwEWhIi1nJd8aZ/vSY63LexY8ialGkjzoVoILxt5Ua+sm3jHBYuau1PdAQEC8yR+238me0bP3zOYcnra1PNE73smP8YT4VMkJ5sTNc0CrlZd3tiONppb6ZHNuEOhs8F+hn3bbq4zpzkZOxZAh4JflQ5AltrWc25JfTHS1q+LETv46ilbNgI1mHSUuKRHqZkKgxu1EcDV4IGXz1qYQSgnJumD8XFsouCA1Bw7Y7hvxezWP/SMBq/dLixdGq6pu2HZtQe/d4vtpQv6kcxWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4+KhdqZ/Akew/M2C/sT8R8Y9lB+yJHRXWRua6AdvLM=;
 b=EkouZru4IsIrqB8sJCYwg9lPp5GS8SCnETMOEEp7f3QT0tEldBoEed4QfTM0E8HCeZ0cn3Vllr3hL0Lug4iJd9OHQjbcOzewyVCxjA6p+Ot6P0dB8rJANrCKb7NQ6B9BEnp4OpJ7nRRnFfzGsdDkaUl7XhFlfQ0Hocfm/BqZEpLUQFQpyO5JFM5lhzkrXzBC2GLDoLL1u8X4O4Y0K6up0tlxExrc2ZS6TsG93YF28zw+LsEnG7SEzHTHjle2uUzoing88EnlwIlDck98hZn4oQu3B/kSscvEhD1kxZSHRzJqal5oePcEQNhlY3etnRLC6xk0Cf3r40gg8MPULADAQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4+KhdqZ/Akew/M2C/sT8R8Y9lB+yJHRXWRua6AdvLM=;
 b=kzT6hhY4F1ZOxFo13UqlKKhraYS/ZOtlVu25v5Mbkuyo0edKn17WGjgdadX1e8de1JUyszOQITs5WQTIP9297/T91qQ2u6x3yWKmMAF7f5YSuhsGd8P1b4UO/lAcvTUxFJnFpvUUF0Dx0/B+NODxxN3HJGP/voJNeglORrjEigc=
Received: from DS7PR03CA0144.namprd03.prod.outlook.com (2603:10b6:5:3b4::29)
 by BL3PR12MB6475.namprd12.prod.outlook.com (2603:10b6:208:3bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 22:19:58 +0000
Received: from DS1PEPF0000E655.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::d) by DS7PR03CA0144.outlook.office365.com
 (2603:10b6:5:3b4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E655.mail.protection.outlook.com (10.167.18.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:58 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:54 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 23/27] drm/amd: Use `amdgpu_ucode_load` helper for PSP
Date: Tue, 3 Jan 2023 16:18:42 -0600
Message-ID: <20230103221852.22813-24-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230103221852.22813-1-mario.limonciello@amd.com>
References: <20230103221852.22813-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E655:EE_|BL3PR12MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d94162-2469-4ef1-dc2d-08daedd8a640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mRz/naK8CNonH2UzLJ8VMYNk5IAO3c6erHhTCYPkXN0JAjs8Yb4Fih35bth75kQGbv2xrTbaPP6w3Dqn1rec+NNPjlv64KQ8/nZm16Eg5XTBN29ylKnNLP45gbUD49t8NatpQAyicjpB+AnvOKW6lpTYI6v7RNf2b+70XWgkjmmAcoG6vyjTNbBUoOGUH9Gp9KH2t+hgq5BXXu+DMmJN/HjEzkUYJbRIv3lL8ZEkylKnOP8uaE/5fbEckJWhH9hP3dxZdqjm6dnH3DdzhNOadE17eveZx77kMAy9RYF1kDRgAYmH96D04N/b/p5Crd4uQ0UKK9g0u/2YZobGXhPwrWN+nsRJcQ7D13Jl74jb8od4e1hb47nrA9S4UHREg+7XPTARZ4GrfIerAi727kPjHIKIi3pTD+lncvLFVSf6RaLGUqmvLl8HyPjQ1vbQ3FtcdneKy/zPjrQu6Xrk3vH/JhWWBAkkUE1LcOQQAviABMjbybxfxszYmr5WvcEgVD+Xjj2DN3lC0kBuzK8LX6TVXv7z3QQtjAZMAyQ/Do7Euye6mFZyruqwu4/WTxYno3N6AIP5LmyFDlNQB7nBj5AXWFMXJCyS+HmRO1b4scszjGG5zKOc612zHGn/JO1pm6c5ht7dGG7nhB++LAi280fbSW/Pda1X2D76wOHWgVHRl+K7w6CjSs76XZMcyZQYkSvdZtr4K/IpPHqEoey9Me0mIyOQV0wwM4udQK6TII0m4q18L89sjF5MimH18sQ2BSIgm3JfQAtuur0kQrVEjFn0KO/5czsmDqJ7rNzS8PrIhOY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(16526019)(26005)(83380400001)(2616005)(82740400003)(47076005)(1076003)(426003)(40480700001)(86362001)(186003)(336012)(40460700003)(82310400005)(356005)(36756003)(81166007)(36860700001)(478600001)(2906002)(110136005)(54906003)(5660300002)(316002)(44832011)(4326008)(8676002)(41300700001)(8936002)(70586007)(70206006)(6666004)(7696005)(22166009)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:58.3553 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d94162-2469-4ef1-dc2d-08daedd8a640
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E655.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6475
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

The `amdgpu_ucode_load` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * New patch
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 42 ++++++-------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h |  3 +-
 2 files changed, 11 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 3b0644600a1f..f45362dd8228 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2912,11 +2912,7 @@ int psp_init_asd_microcode(struct psp_context *psp, char *ucode_prefix)
 	int err = 0;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_asd.bin", ucode_prefix);
-	err = request_firmware(&adev->psp.asd_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
-	err = amdgpu_ucode_validate(adev->psp.asd_fw);
+	err = amdgpu_ucode_load(adev, &adev->psp.asd_fw, fw_name);
 	if (err)
 		goto out;
 
@@ -2928,7 +2924,6 @@ int psp_init_asd_microcode(struct psp_context *psp, char *ucode_prefix)
 				le32_to_cpu(asd_hdr->header.ucode_array_offset_bytes);
 	return 0;
 out:
-	dev_err(adev->dev, "fail to initialize asd microcode\n");
 	release_firmware(adev->psp.asd_fw);
 	adev->psp.asd_fw = NULL;
 	return err;
@@ -2942,11 +2937,7 @@ int psp_init_toc_microcode(struct psp_context *psp, char *ucode_prefix)
 	int err = 0;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", ucode_prefix);
-	err = request_firmware(&adev->psp.toc_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
-	err = amdgpu_ucode_validate(adev->psp.toc_fw);
+	err = amdgpu_ucode_load(adev, &adev->psp.toc_fw, fw_name);
 	if (err)
 		goto out;
 
@@ -2958,7 +2949,6 @@ int psp_init_toc_microcode(struct psp_context *psp, char *ucode_prefix)
 				le32_to_cpu(toc_hdr->header.ucode_array_offset_bytes);
 	return 0;
 out:
-	dev_err(adev->dev, "fail to request/validate toc microcode\n");
 	release_firmware(adev->psp.toc_fw);
 	adev->psp.toc_fw = NULL;
 	return err;
@@ -3105,11 +3095,7 @@ int psp_init_sos_microcode(struct psp_context *psp, char *ucode_prefix)
 	int fw_index = 0;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sos.bin", ucode_prefix);
-	err = request_firmware(&adev->psp.sos_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
-	err = amdgpu_ucode_validate(adev->psp.sos_fw);
+	err = amdgpu_ucode_load(adev, &adev->psp.sos_fw, fw_name);
 	if (err)
 		goto out;
 
@@ -3181,8 +3167,6 @@ int psp_init_sos_microcode(struct psp_context *psp, char *ucode_prefix)
 
 	return 0;
 out:
-	dev_err(adev->dev,
-		"failed to init sos firmware\n");
 	release_firmware(adev->psp.sos_fw);
 	adev->psp.sos_fw = NULL;
 
@@ -3340,10 +3324,7 @@ int psp_init_ta_microcode(struct psp_context *psp, char *ucode_prefix)
 	int err;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", ucode_prefix);
-	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
-	if (err)
-		return err;
-	err = amdgpu_ucode_validate(adev->psp.ta_fw);
+	err = amdgpu_ucode_load(adev, &adev->psp.ta_fw, fw_name);
 	if (err)
 		return err;
 
@@ -3383,17 +3364,14 @@ int psp_init_cap_microcode(struct psp_context *psp, char *ucode_prefix)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_cap.bin", ucode_prefix);
-	err = request_firmware(&adev->psp.cap_fw, fw_name, adev->dev);
-	if (err) {
-		dev_warn(adev->dev, "cap microcode does not exist, skip\n");
-		err = 0;
-		goto out;
-	}
-
-	err = amdgpu_ucode_validate(adev->psp.cap_fw);
+	err = amdgpu_ucode_load(adev, &adev->psp.cap_fw, fw_name);
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
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
index 47b88233bf94..415d32306b9a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
@@ -506,8 +506,7 @@ int psp_init_asd_microcode(struct psp_context *psp, char *ucode_prefix);
 int psp_init_toc_microcode(struct psp_context *psp, char *ucode_prefix);
 int psp_init_sos_microcode(struct psp_context *psp, char *ucode_prefix);
 int psp_init_ta_microcode(struct psp_context *psp, char *ucode_prefix);
-int psp_init_cap_microcode(struct psp_context *psp,
-			  const char *chip_name);
+int psp_init_cap_microcode(struct psp_context *psp, char *ucode_prefix);
 int psp_get_fw_attestation_records_addr(struct psp_context *psp,
 					uint64_t *output_ptr);
 
-- 
2.34.1

