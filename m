Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EC365DA68
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A258C10E58D;
	Wed,  4 Jan 2023 16:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F233710E58B;
 Wed,  4 Jan 2023 16:44:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRQrEf22bhe0qJlXgB007L5IpfI+rlG4ZpBZfzwcP11Dvs5G80f0mmA6BDWlMZOTJV4e22VePkic1oRys3v9AKbstQ/FNZy7LHJqgLLbCll166+4GpgkPvEdP7j3OW0oZ5x13SbIUAVXRie2QZ4Mu8C0e1bz6kuVEKJp+sLKu4K91o4+S72cOoNucbRqJbEuYaHeqA8ZUafYJam1PLhyZog2p7qFyZ+46E5Qra8g0PoJfn/w6NfzVt7h/fP1g9Saa+ZOIP4MMDbBY6BpcD7QQyepKPTvLh71OJpQTc22PfynDwHn5lvoZWMkoPWIeR5V4mWaK03Y9SrWDA183SIxhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+0rKKn9CEDRtNlIfOYexIP6ICDHD9e6fRkgwYHK7L0=;
 b=gVYG8Ix0qQpxCHLd5kUPfQS+aBJ90/KzX8meLBnLZF+Gd1YSeI2K3XyqaE7mLDRIoPi6JgZILzFmkMSUhSs8bxDCTQWC8rodZio+jNmvjhqgC+vZj9t9ZK1POrNgiSp5y1jdR1SMY2a7okNUgojXQxW1hcHYs4l1C9EwV3B7MlS0w4FWCYisDm5vRKw6EHYXR2vtWPp3pbZFOeC9TlrrL14WVaUYNxVO4JVAG0sYnmHyTdgyStTlnSIWh/nW6rTWo9mwJtEP4gwknoyMHdyeRy+o/BoJ6PwaaZ8eUZhuEeP0+jA5C+5PgbxkW7l/pR0kyhsy+C8OgzNWLHZBa8TtlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+0rKKn9CEDRtNlIfOYexIP6ICDHD9e6fRkgwYHK7L0=;
 b=vXoTxZR0QzTGVSzW6vcJhg2E689riv1kin8jxvx9D77kT1jigiwG4H/iVs+RjYGrscHjgUG3fduTEex22pZiE+s7/9CYDxmNBAPbj9GgfQB3ro7NI2KnVztQhzDC7BUUv/d3qoiuI5aTdT/UjxMutQbSQ7DOS3/SsMWpVDtJ56U=
Received: from MN2PR14CA0002.namprd14.prod.outlook.com (2603:10b6:208:23e::7)
 by PH7PR12MB6657.namprd12.prod.outlook.com (2603:10b6:510:212::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.21; Wed, 4 Jan
 2023 16:44:27 +0000
Received: from BL02EPF00010208.namprd05.prod.outlook.com
 (2603:10b6:208:23e:cafe::48) by MN2PR14CA0002.outlook.office365.com
 (2603:10b6:208:23e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010208.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:27 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:43:47 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 30/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX7
Date: Wed, 4 Jan 2023 10:40:19 -0600
Message-ID: <20230104164042.30271-31-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010208:EE_|PH7PR12MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c47fdf4-eb7d-4be0-b9e5-08daee72f188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fI3a3TzhwWDAH7Em+JuFwlfPkq8Nf33P1oSVOvcVLKyNL8z4U0Grp+tovswAs+nhCRhJW4IMBXpUz2dyrFCKz59b8KCQJl7F39CxUBGi6lSdIyuHmtxIrbceGyi0YQuejhCOiZYhz56EyCg0XQC34zdmby4ryEBpSAHOoWo/eNlBOgNJAH7CHwZgGsubLLfNht9MBGDzxKl5sWIlbOSloe6Xrm+wtrykF65Ry2BXxaMhffn6fMzBuQ+x3rfUHEKKY9BtLh8Lit9fM/rh6WzxWv61axbv5T9oVM30u1pyGJ87VnUQVr4tIXMHvfV6fJPTzgKvXDy8kBQrIwstIurFxc7L3NrVjeECtEyzxIBhOKuPC7npzXaoPTFflutquSYxYp/WX2+m5xSMj0Yg//3XS22zotkZwtco0cDE98W7WxwPxvYJSKvrZytavMc+iQ5p/08a0d1KJIJLN9e0eUjdUAuV9FkelcCwFasrJeLNa8UTR/gW0Db0meHhkAd87Z/qAB1OTNF9NpCAbUyiucqMMh27/AAPrr+oz6/ITd48opsjjji+V9BzzTP24/cGYpZ3k7DXPyxKwMGow5dQfyXtiL39iQeykF/BkNSiviRhpMZ4+ODIaz7u5LE9/Z0PlN7GXF0ezu/VubaudAypG599NviAkZWxV7NvSs73K/GdOABLNxCr3mnuexwUJ/Npma8h5pn2yDddfr+N+yLbc/DDEqQqjD3SLDk1dOogUE9r3rfhLlpZX25eEaaDpeuYI7r6//sksecUEeepoksY7Yt8yA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(478600001)(186003)(26005)(36756003)(36860700001)(82310400005)(4326008)(1076003)(2616005)(44832011)(5660300002)(316002)(6666004)(70206006)(16526019)(2906002)(110136005)(83380400001)(40480700001)(41300700001)(81166007)(8936002)(54906003)(40460700003)(426003)(47076005)(7696005)(336012)(8676002)(70586007)(82740400003)(356005)(86362001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:27.1829 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c47fdf4-eb7d-4be0-b9e5-08daee72f188
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6657
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
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 68 +++++++--------------------
 1 file changed, 17 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 0f2976507e48..a16a44e5fb32 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -887,6 +887,16 @@ static void gfx_v7_0_get_csb_buffer(struct amdgpu_device *adev, volatile u32 *bu
 static void gfx_v7_0_init_pg(struct amdgpu_device *adev);
 static void gfx_v7_0_get_cu_info(struct amdgpu_device *adev);
 
+static void gfx_v7_0_free_microcode(struct amdgpu_device *adev)
+{
+	amdgpu_ucode_release(adev->gfx.pfp_fw);
+	amdgpu_ucode_release(adev->gfx.me_fw);
+	amdgpu_ucode_release(adev->gfx.ce_fw);
+	amdgpu_ucode_release(adev->gfx.mec_fw);
+	amdgpu_ucode_release(adev->gfx.mec2_fw);
+	amdgpu_ucode_release(adev->gfx.rlc_fw);
+}
+
 /*
  * Core functions
  */
@@ -927,88 +937,44 @@ static int gfx_v7_0_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
-	err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
 	if (err)
 		goto out;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
-	err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.me_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 	if (err)
 		goto out;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
-	err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.ce_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
 	if (err)
 		goto out;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", chip_name);
-	err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
 	if (err)
 		goto out;
 
 	if (adev->asic_type == CHIP_KAVERI) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2.bin", chip_name);
-		err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
-		if (err)
-			goto out;
-		err = amdgpu_ucode_validate(adev->gfx.mec2_fw);
+		err = amdgpu_ucode_request(adev, &adev->gfx.mec2_fw, fw_name);
 		if (err)
 			goto out;
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
-	err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
+	err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
 	if (err)
 		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
-
 out:
 	if (err) {
 		pr_err("gfx7: Failed to load firmware \"%s\"\n", fw_name);
-		release_firmware(adev->gfx.pfp_fw);
-		adev->gfx.pfp_fw = NULL;
-		release_firmware(adev->gfx.me_fw);
-		adev->gfx.me_fw = NULL;
-		release_firmware(adev->gfx.ce_fw);
-		adev->gfx.ce_fw = NULL;
-		release_firmware(adev->gfx.mec_fw);
-		adev->gfx.mec_fw = NULL;
-		release_firmware(adev->gfx.mec2_fw);
-		adev->gfx.mec2_fw = NULL;
-		release_firmware(adev->gfx.rlc_fw);
-		adev->gfx.rlc_fw = NULL;
+		gfx_v7_0_free_microcode(adev);
 	}
 	return err;
 }
 
-static void gfx_v7_0_free_microcode(struct amdgpu_device *adev)
-{
-	release_firmware(adev->gfx.pfp_fw);
-	adev->gfx.pfp_fw = NULL;
-	release_firmware(adev->gfx.me_fw);
-	adev->gfx.me_fw = NULL;
-	release_firmware(adev->gfx.ce_fw);
-	adev->gfx.ce_fw = NULL;
-	release_firmware(adev->gfx.mec_fw);
-	adev->gfx.mec_fw = NULL;
-	release_firmware(adev->gfx.mec2_fw);
-	adev->gfx.mec2_fw = NULL;
-	release_firmware(adev->gfx.rlc_fw);
-	adev->gfx.rlc_fw = NULL;
-}
-
 /**
  * gfx_v7_0_tiling_mode_table_init - init the hw tiling table
  *
-- 
2.34.1

