Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A94D65F1CB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7AD10E785;
	Thu,  5 Jan 2023 17:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B45210E77D;
 Thu,  5 Jan 2023 17:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jrnqoxxs8LGLY9ppKABDzBPVN29zF2ikpAgbZESt6QABjRFyGJ7BOqCnSkrN3o+ilFgyBuQNa1OMQWAajPHaHJLYyI1uU2fu/joiiVh7i5UpSMOhTSHJWZxG5SygR94HNb5tk5xs3FEeuyDY8giB9jOeHx6/yayZIECRzftSPcNuHM5nqpw6mCjAXVauR8im5gasWKwa3XmX/h4gCDqbszo+YXA9IoLSkglg2p7ePr79pFgOyIe9hyOrp5KDI0009LCZ6GglErP0JgNXEIOrt/aLeacIHgSmSE5W8oPAeM9r66G/9MeXJEp5fDFUlC3pGj5Amyixj35VFI2pZ2EOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qb0NnHwlz6oKS3skKi4Y2x8wDIpeYdawgttT+cIUVv4=;
 b=QIDMPpWL88IYm3WZpGAod8AeOsmcTS9puQYVk8u1gUKGtZYyQUmLmuO6AmSGt3wZMpO0XC+vAiqzSsFv/jjGFxlGbeWKX4bZIvDcyin7xc60Lfj+0dTAoOw1qaF7bQrCJ44R/g9UcRMTyLqHc+GkSw26rzM8M3mbXYoDpSpb1AbS7vn5bITYF5qf6bHFuN5N8pKTsmHALHZwjvjt1mAGFC35TAR6he4E8xrWJ4y2yjgaL+270tDtFDsLmaZQqgyBwRzF5Y4EfIHzV0Dq98L3PwGUeq5s05J5tVSgGBCsxcb9mr912T4EH3iwhePpPSWIWyBXx1BHEvxiADEjgF50yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qb0NnHwlz6oKS3skKi4Y2x8wDIpeYdawgttT+cIUVv4=;
 b=tqGwk2ZsGTcqaCH+6KwqWEOYOIH40TcS+tahoue/hZZCuYl8un/ExVdfLY6kOWPQ+q2SU12b52jyFBPva6xXr8smO+Txs9j8MBDpj4qEIMLCGCLeDCgCvUHiVV80zP4nVBD0PZuu0rzNllnJcPCRSraPQhyqXhYjv1f6l//hrtE=
Received: from BN9PR03CA0373.namprd03.prod.outlook.com (2603:10b6:408:f7::18)
 by SN7PR12MB6814.namprd12.prod.outlook.com (2603:10b6:806:266::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:16 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::3d) by BN9PR03CA0373.outlook.office365.com
 (2603:10b6:408:f7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 17:02:16 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:14 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 14/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX9
Date: Thu, 5 Jan 2023 11:01:00 -0600
Message-ID: <20230105170138.717-15-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|SN7PR12MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 84179e13-2301-48d0-5bfb-08daef3e9920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Pg4bsinvn8INrAovPHcYxeN1L9XMqnx0XOP9n9yXJoKkaOKzc5s/C79o2rmveECzVf0y6S9GIO0408O9i2fdeft3SL8cc3goyf8alzUgmUqn9/FMxblrK4E/7AGqMNRDxMm4LHkufb+IVqGbg9T/HJIGRPB3WQFM0fjbQos/I37icO+IuwmpCePMwWzdgxYYmKfgLqr2qqVxDuAwzjXR7ZN6X6ZpCMfeSpaepl0GPd7mzE3ZICTsBXKrbOK25+GLinWfO3n0ihF1VrsK+TZlwtAy2fc9JjDN6jVLNtCZ6pUAIGiQ6ObCCMO8yaPxrgovgZoBfClRtfoqoOeUuaS2ej27XfCXNGtGCVzq0R0I0xTUWmq9DpvJaEtuGWJMHFWGB1qKhl9z1RTWMpTSprf5NuZQS6xtMDGM2PxTnvSMLYD1uX8aMKZqQkP7MpSDR1LUzRDM6Y4awYn4W2BpaIlR3K+GlmiLYUHEbRkxpnhZo292kxuTuACwXkYqBlCEtcUiZG+Eqn1MfvAdYtwJBVhFjLEgib+4F/JKdaqPOya6l3S//G7S1vFUDbl66LOvaMOlucN3/Q9EqjhnS7CpkkngMKXJOer9M+BzrhGVQc29PaqEVdesOJP/3EoO5z3cIX5zI7mDXVQ/+DXvNasj4LDTVnNWdBjw9j86LfYEQFNoB1EaYn+qmdeaV24OphvifudFYZkTBUpx202JqMhKCXEo/Rr+rRnppxGgtfUJxd3bLy1axSM3zKFxHiHbYZE9mbYL7+YNbsCk7sKKR7krglt6Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(2906002)(5660300002)(44832011)(8936002)(41300700001)(478600001)(316002)(4326008)(8676002)(70206006)(110136005)(70586007)(54906003)(26005)(16526019)(6666004)(40480700001)(336012)(82310400005)(426003)(83380400001)(47076005)(1076003)(7696005)(2616005)(82740400003)(81166007)(356005)(186003)(86362001)(40460700003)(36860700001)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:16.2079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84179e13-2301-48d0-5bfb-08daef3e9920
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6814
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

The `amdgpu_ucode_release` helper will provide symmetry on unload.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 82 +++++++--------------------
 1 file changed, 21 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index f202b45c413c..ef2dbebbc90c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1078,18 +1078,12 @@ static int gfx_v9_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 
 static void gfx_v9_0_free_microcode(struct amdgpu_device *adev)
 {
-	release_firmware(adev->gfx.pfp_fw);
-	adev->gfx.pfp_fw = NULL;
-	release_firmware(adev->gfx.me_fw);
-	adev->gfx.me_fw = NULL;
-	release_firmware(adev->gfx.ce_fw);
-	adev->gfx.ce_fw = NULL;
-	release_firmware(adev->gfx.rlc_fw);
-	adev->gfx.rlc_fw = NULL;
-	release_firmware(adev->gfx.mec_fw);
-	adev->gfx.mec_fw = NULL;
-	release_firmware(adev->gfx.mec2_fw);
-	adev->gfx.mec2_fw = NULL;
+	amdgpu_ucode_release(&adev->gfx.pfp_fw);
+	amdgpu_ucode_release(&adev->gfx.me_fw);
+	amdgpu_ucode_release(&adev->gfx.ce_fw);
+	amdgpu_ucode_release(&adev->gfx.rlc_fw);
+	amdgpu_ucode_release(&adev->gfx.mec_fw);
+	amdgpu_ucode_release(&adev->gfx.mec2_fw);
 
 	kfree(adev->gfx.rlc.register_list_format);
 }
@@ -1257,43 +1251,28 @@ static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
 	int err;
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
-	err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_PFP);
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
-	err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.me_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_ME);
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
-	err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.ce_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.ce_fw, fw_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_CE);
 
 out:
 	if (err) {
-		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
-		release_firmware(adev->gfx.pfp_fw);
-		adev->gfx.pfp_fw = NULL;
-		release_firmware(adev->gfx.me_fw);
-		adev->gfx.me_fw = NULL;
-		release_firmware(adev->gfx.ce_fw);
-		adev->gfx.ce_fw = NULL;
+		amdgpu_ucode_release(&adev->gfx.pfp_fw);
+		amdgpu_ucode_release(&adev->gfx.me_fw);
+		amdgpu_ucode_release(&adev->gfx.ce_fw);
 	}
 	return err;
 }
@@ -1328,10 +1307,7 @@ static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_kicker_rlc.bin", chip_name);
 	else
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
-	err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
 	if (err)
 		goto out;
 	rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
@@ -1340,13 +1316,9 @@ static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
 	version_minor = le16_to_cpu(rlc_hdr->header.header_version_minor);
 	err = amdgpu_gfx_rlc_init_microcode(adev, version_major, version_minor);
 out:
-	if (err) {
-		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
-		release_firmware(adev->gfx.rlc_fw);
-		adev->gfx.rlc_fw = NULL;
-	}
+	if (err)
+		amdgpu_ucode_release(&adev->gfx.rlc_fw);
+
 	return err;
 }
 
@@ -1371,12 +1343,9 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 	else
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", chip_name);
 
-	err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
+	err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
 	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
-	if (err)
-		goto out;
+		return err;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1);
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
 
@@ -1386,11 +1355,8 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 		else
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2.bin", chip_name);
 
-		err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
+		err = amdgpu_ucode_request(adev, &adev->gfx.mec2_fw, fw_name);
 		if (!err) {
-			err = amdgpu_ucode_validate(adev->gfx.mec2_fw);
-			if (err)
-				goto out;
 			amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
 			amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2_JT);
 		} else {
@@ -1402,17 +1368,11 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 		adev->gfx.mec2_feature_version = adev->gfx.mec_feature_version;
 	}
 
-out:
 	gfx_v9_0_check_if_need_gfxoff(adev);
 	gfx_v9_0_check_fw_write_wait(adev);
 	if (err) {
-		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
-		release_firmware(adev->gfx.mec_fw);
-		adev->gfx.mec_fw = NULL;
-		release_firmware(adev->gfx.mec2_fw);
-		adev->gfx.mec2_fw = NULL;
+		amdgpu_ucode_release(&adev->gfx.mec_fw);
+		amdgpu_ucode_release(&adev->gfx.mec2_fw);
 	}
 	return err;
 }
-- 
2.34.1

