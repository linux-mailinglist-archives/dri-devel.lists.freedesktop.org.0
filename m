Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8822D65C969
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A5710E4DF;
	Tue,  3 Jan 2023 22:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FAF10E3F2;
 Tue,  3 Jan 2023 22:19:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBPs7jBek3yGkCawtXp/bkM9yS1zUmcFR+EXfEcG23hSD1UR45V+jd+bwqQ9m4V/G+BuSCgHHjHDzrn4oji+HJyoEn7URjt/V8+jFSbetX3IEx5ZIBnc4FbQWRWhYM1HKltp/x8TwpVnWyud90hplwoLh1Zuh+93JCMGlof7dX4Y64OC0do+dbY8sTiP+UyJjq60rJxXgKslvZrG0wfGL1hCL3/dXOF3V6G4YaR84Lsg9iwzPYKBIo5QQ5EEv6xiAzEUORrU9pz9gMeGkjRFKZLJ52Z9ctfVV+62TCNc0N4YmeJ3u2TbjjUx2m+Xiu4dhNNXbEbtWi+ubjzCpC4cVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdPrwj2PcjAc6pxn9nsEfI6JjZjOsAIo2fqSHxb5vBQ=;
 b=fEJC/HgmuDb/QaWGUvjvUCIY4zV78JJXWCGr7y5OhwPIgDF/H/FQjXqjAo5+In+rAypOCJXgQtIgLPRBwqRKX6QVXUrMUNKGv1NKW7ijr2zxdyBA+DCCnVqSEIQXLcu4jHhxhMBb0Tnmx9gRCb50GbBZQx4CzupjFwp5G6MCdSdTbmYTyWo9xO5zYxLXvXBgu53AGC1RtUSXgKg8JbLsqEgii+r200F4VYuwOW+E+zj1edz4qBxEG/xtjOuuHU46tBj7vchYrM8h74vY9a65vVWKYw/hFQgzJa0zf3FWctm9HPMPO3e6hV6vU/mLyBw/DAY4fuHWx1MXP79cuIJo+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdPrwj2PcjAc6pxn9nsEfI6JjZjOsAIo2fqSHxb5vBQ=;
 b=PmPyjnjT9zpFN77x2/0e+qQiqDgsmH1owMiwWXijISd5aPIi9l+fcNV7h33kbNZ6rHeZJNtt9Y29IDSlRUSBLysFZ/BfGm13SBEPsxc9bMmGLXu8AG3JsUBpkqceR5cSxwu+15780jOVTOJD4yDEy4m0+E25RY7k/KjvRhN2NnQ=
Received: from DM6PR10CA0015.namprd10.prod.outlook.com (2603:10b6:5:60::28) by
 DM4PR12MB5985.namprd12.prod.outlook.com (2603:10b6:8:68::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 22:19:44 +0000
Received: from DS1PEPF0000E654.namprd02.prod.outlook.com
 (2603:10b6:5:60:cafe::d0) by DM6PR10CA0015.outlook.office365.com
 (2603:10b6:5:60::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E654.mail.protection.outlook.com (10.167.18.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:43 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:42 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 14/27] drm/amd: Use `amdgpu_ucode_load` helper for GFX9
Date: Tue, 3 Jan 2023 16:18:33 -0600
Message-ID: <20230103221852.22813-15-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E654:EE_|DM4PR12MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 51db6c9a-4a66-402b-e585-08daedd89dad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W6a5mjzGHx68N4U2mxIOU4INzTOpwCbiMhgtLjpUgmBaZqSunb6N/3B13aNuwoJpn7/vGpDvFSJJJwbDT9Jpstl7IU2aPyHh9RDG+OXWTSmB8kYsndANoDC/ABzhGGam8MbBFWgKJ9CkUjcROD8f5R/p5IklJnZ50B0SoZfUQWLdfHG9oEg0I3Ko40Wp7Ctce64LW5Fg/7svSl6xbQR1UJC4GlvJBEEaWcqUJID4LVoONbh+IoT5BsFJWhdUA68S1oQPbx9r4PCi0ayqsDzDRgzsR6jFK+/S2etGMX8096M11q/YIdaDyzHQGxzCAg1126uNuSqmr/qujAVEL2LHVhGTXuVMST8WMq89cRV4nS+xZg6wMBdcQkJhI4TztSdfVXiKz1PTl9Y1z0oGmqnQdTcgXN1D1PqZaHBwTAL3J6Ekql4uWoV6/SFBrVxb85qJ8Dg0C+31q9WptJ/PCn5/99LhEDX7mk+dm05ZEw1ucnodBV2Avc/LoxkVC/Q9U4Wa+8TGIAwwhVDbiZbc6LuMQXXPHUvL04jV+L9uwpEZKK4znRqJwCBB+S5pDmbhQfAs1+0eLJVboMgxOng3P1k8rqghSW34ecz/OesVkRIjbEut6atsosig/sLz3vLS+2+u/rYrSmU0qaBbjdtXE7+No3WyhRTVG5uUfgj9XqmfzdytQMfKKZaHoX+xJZxm9fdeI+/2MzEfQKcFqaT5Pi/x+WMzRXLgSp8QGjxW5s+j1I41F25QKFYbCACziORQz+qHYCEvoO0AhOifgG1bbixwvEt0pDoUuu3Cm7XtXwPJwKnwjjsGF8CDS9vVdKH27/EL7P/uhELdUVqquAgzdoJRTw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(47076005)(1076003)(83380400001)(426003)(186003)(6666004)(26005)(16526019)(82310400005)(2616005)(336012)(7696005)(40480700001)(40460700003)(86362001)(36860700001)(36756003)(82740400003)(81166007)(356005)(4326008)(8676002)(41300700001)(44832011)(2906002)(5660300002)(8936002)(478600001)(70206006)(316002)(70586007)(110136005)(54906003)(22166009)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:43.9547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51db6c9a-4a66-402b-e585-08daedd89dad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E654.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5985
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
 * new patch
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 43 +++++----------------------
 1 file changed, 8 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index f202b45c413c..27040821d764 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1257,37 +1257,25 @@ static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
 	int err;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
-	err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
+	err = amdgpu_ucode_load(adev, &adev->gfx.pfp_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_PFP);
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
-	err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.me_fw);
+	err = amdgpu_ucode_load(adev, &adev->gfx.me_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_ME);
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
-	err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.ce_fw);
+	err = amdgpu_ucode_load(adev, &adev->gfx.ce_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_CE);
 
 out:
 	if (err) {
-		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
 		release_firmware(adev->gfx.pfp_fw);
 		adev->gfx.pfp_fw = NULL;
 		release_firmware(adev->gfx.me_fw);
@@ -1328,10 +1316,7 @@ static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_kicker_rlc.bin", chip_name);
 	else
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
-	err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
+	err = amdgpu_ucode_load(adev, &adev->gfx.rlc_fw, fw_name);
 	if (err)
 		goto out;
 	rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
@@ -1341,12 +1326,10 @@ static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
 	err = amdgpu_gfx_rlc_init_microcode(adev, version_major, version_minor);
 out:
 	if (err) {
-		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
 		release_firmware(adev->gfx.rlc_fw);
 		adev->gfx.rlc_fw = NULL;
 	}
+
 	return err;
 }
 
@@ -1371,12 +1354,9 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 	else
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", chip_name);
 
-	err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
+	err = amdgpu_ucode_load(adev, &adev->gfx.mec_fw, fw_name);
 	if (err)
-		goto out;
+		return err;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1);
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
 
@@ -1386,11 +1366,8 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 		else
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2.bin", chip_name);
 
-		err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
+		err = amdgpu_ucode_load(adev, &adev->gfx.mec2_fw, fw_name);
 		if (!err) {
-			err = amdgpu_ucode_validate(adev->gfx.mec2_fw);
-			if (err)
-				goto out;
 			amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
 			amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2_JT);
 		} else {
@@ -1402,13 +1379,9 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 		adev->gfx.mec2_feature_version = adev->gfx.mec_feature_version;
 	}
 
-out:
 	gfx_v9_0_check_if_need_gfxoff(adev);
 	gfx_v9_0_check_fw_write_wait(adev);
 	if (err) {
-		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
 		release_firmware(adev->gfx.mec_fw);
 		adev->gfx.mec_fw = NULL;
 		release_firmware(adev->gfx.mec2_fw);
-- 
2.34.1

