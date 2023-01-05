Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F7065E3DF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1A810E65D;
	Thu,  5 Jan 2023 03:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4163310E65A;
 Thu,  5 Jan 2023 03:44:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOTe7AtPnTwwy16u2zJp+N8VZ+B8rnpjnNrJSCqIBMRtEyeCd5LhB/jRppWH34JI8bUlNXj3CbjT8IrziwL9qrDeWB1asTuJgprbCv1grZXXDk7oLfVw1NFBaHLO3lPJmj9nTmZjr7n1wJN8uGsu33a8bAEF2jYMtq4ZLPXYpZGkra0Yf+Fl4ftUSMQUWdWg2tozbJQx+iSs7K5fFbFFyvYhFU7nNFteD6euupWoHl+mHil+QhAnAxial2Iu/7L1LTIcfMEoZ8P7ePNklsMzJ01kHWVmMQBXTRADttoEp4pHSm6uQpj5Vb/RF3z5NVgBv7/UoPV1mYgh/d7ocbT2sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qn5Vl/HN5fvWjRAJFHOTyEGWYRbFFZBCaMLwEKDpJfo=;
 b=AZnGo9pYeWAsiai9rW81WHE+vJfUR/aYo/LFbkulRlMUEwcCR8mN6vGK4ja84rxWFF49oDzf6vjKFCpCZJeGAUnJSN1zja5m1rVLQ6eRmM3vaaIjmG6q0GYQt9tmQeORQA05jklZa+CkV5tHI6xXb0E4nCbvwFDqGqNHOWEh0fQE3Hwk5G85k6jHwR/7TWSIeXTMvDZfcbvJrlzV+oE38/HORt2oV90/H7qfOSb1eIKwJ1/SK+kwg87ktiYtZSmd2I8eSfdWRbLAAaK+yMLygb1GTyJgZjT0nEsOKegz1XjN4s4RLItgR3f9i9nbZ7/tFzWXMEH/J7zO8poOPhhH4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn5Vl/HN5fvWjRAJFHOTyEGWYRbFFZBCaMLwEKDpJfo=;
 b=PQRQgoyJKMmrQvp+u5HDF7EEl0p5JbotkmALJAq5N2j/9/L9VduhHIfjagcK1RJWAi2avq2BHP6Tgn9T5JYhqwHUmwdKyTFKFKFs6bsYnN3fb3oGeDyPk5vT8tXvdwattcAw+hDJNu/Tdy1J5qrtcXhZr1ZlKUrDC6m96Dbn0w8=
Received: from BN9PR03CA0606.namprd03.prod.outlook.com (2603:10b6:408:106::11)
 by DM6PR12MB4449.namprd12.prod.outlook.com (2603:10b6:5:2a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:28 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::2d) by BN9PR03CA0606.outlook.office365.com
 (2603:10b6:408:106::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:44:27 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:25 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 19/45] drm/amd: Load GFX11 microcode during early_init
Date: Wed, 4 Jan 2023 21:42:53 -0600
Message-ID: <20230105034327.1439-20-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT065:EE_|DM6PR12MB4449:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d469a5-59ca-462d-662f-08daeecf2554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 75tWbpKEqK9hhGZmeQFLOhrNgjVzEXTLrD0CTbmFQnIGsJ5qeV86lHl7pDveyJr3fV/nxjDX1C3CYe3bdmZ8pgGDLDvAXqLWCru9E/DFEU7/bx5DRSEE8n1LS49dZPFtGIoREFb2iI/I7iDGPsYaGaFFYDJwMRdhKXEPc6Nc8D7IUoP39wNjVfpdexy2rdhjev4HZTmobaYZSW2aLxCw8O5XDAnNw8sV7tan9uf1QIYEtJKDuzn4bVGLpcuUHIRIIRb0+tYkXpjoEdtns/GCY0mexKsc2H7ZSR8Is8FjTrQH8CnIOkwM82HIKpKO+Hm/eK7MYp2JxaAw+NHIgfS0t0kyNf9cbFDyizjfT/QQbtoHQQQ19Kr8ZLWQ3ZqXodi242PwWqpgoi62284SkFGQLy15HUE90J8qKmlxdw5qmis9oxYWgtmbIaJ/Gg7yPPoq0y8I/UmtZIAhtITdDcdP23IBNs1ZZN5YoHIzg81/971QdKMBZ6GjVTqteSLiMzIN0Ex8mc5sfeplZN05J4olHBm6FYPfy7TSaWYMFlowCX/gtP3dKuY30kk3V3JAVuPLcwmQr76sq0rPPhuvWK9pwicXyDaNGDQGuw5uSka8oLLZ2Iq/lIy344cvN5GoAXJnY0EvRraVrg69j1IFtq+T3CqmXr/uDbn5ky2/qn2t7jMmGbUhtKpWe9D4vjhUQXnN4c3Ars1kKu2EZ5vQwcbANGPy6A8StqVpTmzUB9OmcGg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199015)(46966006)(40470700004)(36840700001)(47076005)(83380400001)(426003)(2616005)(26005)(186003)(82310400005)(16526019)(40480700001)(336012)(6666004)(7696005)(40460700003)(86362001)(36860700001)(36756003)(81166007)(356005)(82740400003)(1076003)(41300700001)(4326008)(8676002)(2906002)(5660300002)(8936002)(44832011)(316002)(478600001)(70206006)(110136005)(54906003)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:27.7806 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d469a5-59ca-462d-662f-08daeecf2554
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4449
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

If GFX11 microcode is required but not available during early init, the
firmware framebuffer will have already been released and the screen will
freeze.

Move the request for GFX11 microcode into the early_init phase
so that if it's not available, driver init will fail.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Rebase on earlier changes
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index d4f67624d05b..5cc329cf66c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -439,14 +439,12 @@ static void gfx_v11_0_free_microcode(struct amdgpu_device *adev)
 	kfree(adev->gfx.rlc.register_list_format);
 }
 
-static int gfx_v11_0_init_toc_microcode(struct amdgpu_device *adev)
+static int gfx_v11_0_init_toc_microcode(struct amdgpu_device *adev, const char *ucode_prefix)
 {
 	const struct psp_firmware_header_v1_0 *toc_hdr;
 	int err = 0;
 	char fw_name[40];
-	char ucode_prefix[30];
 
-	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", ucode_prefix);
 	err = amdgpu_ucode_request(adev, &adev->psp.toc_fw, fw_name);
 	if (err)
@@ -534,6 +532,9 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
 	}
 
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO)
+		err = gfx_v11_0_init_toc_microcode(adev, ucode_prefix);
+
 	/* only one MEC for gfx 11.0.0. */
 	adev->gfx.mec2_fw = NULL;
 
@@ -684,19 +685,11 @@ static void gfx_v11_0_mec_fini(struct amdgpu_device *adev)
 	amdgpu_bo_free_kernel(&adev->gfx.mec.mec_fw_data_obj, NULL, NULL);
 }
 
-static int gfx_v11_0_me_init(struct amdgpu_device *adev)
+static void gfx_v11_0_me_init(struct amdgpu_device *adev)
 {
-	int r;
-
 	bitmap_zero(adev->gfx.me.queue_bitmap, AMDGPU_MAX_GFX_QUEUES);
 
 	amdgpu_gfx_graphics_queue_acquire(adev);
-
-	r = gfx_v11_0_init_microcode(adev);
-	if (r)
-		DRM_ERROR("Failed to load gfx firmware!\n");
-
-	return r;
 }
 
 static int gfx_v11_0_mec_init(struct amdgpu_device *adev)
@@ -1309,9 +1302,7 @@ static int gfx_v11_0_sw_init(void *handle)
 		}
 	}
 
-	r = gfx_v11_0_me_init(adev);
-	if (r)
-		return r;
+	gfx_v11_0_me_init(adev);
 
 	r = gfx_v11_0_rlc_init(adev);
 	if (r) {
@@ -1379,9 +1370,6 @@ static int gfx_v11_0_sw_init(void *handle)
 
 	/* allocate visible FB for rlc auto-loading fw */
 	if (adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO) {
-		r = gfx_v11_0_init_toc_microcode(adev);
-		if (r)
-			dev_err(adev->dev, "Failed to load toc firmware!\n");
 		r = gfx_v11_0_rlc_autoload_buffer_init(adev);
 		if (r)
 			return r;
@@ -4650,7 +4638,7 @@ static int gfx_v11_0_early_init(void *handle)
 
 	gfx_v11_0_init_rlcg_reg_access_ctrl(adev);
 
-	return 0;
+	return gfx_v11_0_init_microcode(adev);
 }
 
 static int gfx_v11_0_ras_late_init(void *handle)
-- 
2.34.1

