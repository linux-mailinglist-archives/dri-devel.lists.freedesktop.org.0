Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD5565C970
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FCC10E4EA;
	Tue,  3 Jan 2023 22:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC9F10E40C;
 Tue,  3 Jan 2023 22:19:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjL7Tbhdwc5csaOQBuDiUrPxULAJWMj+9HcIiauUdTONptpqJDQ42YVlAgJg+VmrCCY23W4BR38sPBUy37UyHEPNzpmxRXWByRycguCBDJZhXFGyE2paIKknpPGhTjKuq2pxC4dZEOY6fbdTF4ny6a6xX/f8tJbBX3TkJrPt8d8JMQ/6ck0UI38mLqSlvdCi97HIHV7mAUSwS0wyrs9AVS2CN9jrUec17CPugMsjnpqMQzqiDIHn5oyLVamlqvcHdLVaZMHQNX5LHRkVzIDqSLDWVaE5QXE3CdyXMEL6WAvHNFEonneFK9bb3xlOLd/0DcdwLRufafMulECMmTbtOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bS9BGl34vTdY68SkfkquEF1Blr2spVYUV1YH8Wr8wOE=;
 b=mkEkzp0/S5zfApsqrxdc5prEj/Ih1mRMBHIdkEsy1oq9QiNnisyqFNtbPoTmCF/cP+zYNj/HohXQjNgLfn7ZRk4aQhR7zPaFrJySwiN9twYH8ErKn30/OOX512aDY4MG0xgerWKJKlE7EHrB0lVnIYLTuHrNSdzVMjBRjxpapEObZrR0znajumYLRF3xhhpBW12AaF30tZib0Bh4CnUO/rMPgDTP7ZM329aRs/lpdCteW7gQA5FZmLyd6bl/F8VkN5JYPKVlqwwy6r+yq5fwFM6g05GKKAH0K9AN6jrwbdHR572qpMiRM143l2HVuMPGmHMEBAMZcGRFcCTfTsWOwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bS9BGl34vTdY68SkfkquEF1Blr2spVYUV1YH8Wr8wOE=;
 b=wjErzq9+fv2Vo3qR4pn0k4zZJhm3KpQao/SzsaMrT9sK+V4n4eF4tdMxbSMyXmQ+rirKy3sVdLefEZzvs0Az5+lJBhJyyuHorc5sE0d7Pt+NYHimDbb+JOAhjbfrvlXySmMhN2BnYypCdj7C4usJW5yxCv5byo6wykT9GLZTLMo=
Received: from DS7PR03CA0333.namprd03.prod.outlook.com (2603:10b6:8:55::15) by
 CH0PR12MB5385.namprd12.prod.outlook.com (2603:10b6:610:d4::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 22:19:49 +0000
Received: from DS1PEPF0000E650.namprd02.prod.outlook.com
 (2603:10b6:8:55:cafe::9e) by DS7PR03CA0333.outlook.office365.com
 (2603:10b6:8:55::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E650.mail.protection.outlook.com (10.167.18.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:49 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:48 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 19/27] drm/amd: Load GFX11 microcode during early_init
Date: Tue, 3 Jan 2023 16:18:38 -0600
Message-ID: <20230103221852.22813-20-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E650:EE_|CH0PR12MB5385:EE_
X-MS-Office365-Filtering-Correlation-Id: c337a217-6027-4a3b-14e8-08daedd8a11b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F6kii1rLjwuqkZBnRqjETw3P1+YgKA16XAl5rb5JGhVC37zozfEXZMirOh365Tylt2SetpLFFIq18kLvAfsk2RX9R3TFZgeYduRCdiGMMR3cykr8HJW5spKvWTu4plsJHUkFGkzONHk9aYcFf+Lt/Sub3gZLbGt3hZY8Z5peUF3ozY4PkbDuXRF4j9v2k3zEdBDiyL9ZYaeKz5N2AR/oH/AoSP4Kqu9Gi3nMl7V0fmX2mEbbZ1zurh1wsUfANgkvGFC2wnCVexRI7xDKrjuMP6nCfmtOYKAtNtd5rgqMUvhk2/6XTc9d+P5wK5/7TXZC0ahe1QjIc4V7Q2C4usVUwS3a8MUSALO3UoL52K2XmhZMrC26pyyEhzFVZGTsSHbXKBHvl69eI/lYhPmh1WibNa0hGkkjosthSuENtCgcugiEJdImY2wJ1KZ9lk0cGpjs1RtFmq9KuBWQaWr4woGPws7uMWeP+81wi/qNTQPL3UfX5VJmVQCFn8MsmemuBootbwt7alnCUXvGq0LLiUpNG3tI1ELxZbi4QiQLu+QqM7tIU1nqoZxO+9kIMtnJC8ChqO2n0nKgC4rGj1ZjLMMvzJ+7p2A2QAyEBefrUP3mYBNE5wAHCtf2xFUm3fAKkDNGaH8SVWxFKba+kPJXfyjGadMsKa/+8bdirVihiKWSgDJFa+JaRo/X0XYQomh7rsZKtnhFwMZ828EphhLCYEmsxkYaPWMVx6vKtnoq60E0QIfn1MV5qJd9gInBfCxGbCZk
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(36860700001)(426003)(47076005)(83380400001)(82740400003)(86362001)(2906002)(356005)(8936002)(44832011)(5660300002)(41300700001)(40480700001)(7696005)(336012)(82310400005)(478600001)(6666004)(1076003)(26005)(2616005)(186003)(8676002)(316002)(16526019)(4326008)(54906003)(110136005)(70206006)(81166007)(70586007)(40460700003)(36756003)(22166009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:49.7346 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c337a217-6027-4a3b-14e8-08daedd8a11b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E650.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5385
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

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * Move to early_init phase
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 78 ++++++++++----------------
 1 file changed, 30 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 0c77d165caf7..5c7bc286618a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -443,6 +443,30 @@ static void gfx_v11_0_free_microcode(struct amdgpu_device *adev)
 	kfree(adev->gfx.rlc.register_list_format);
 }
 
+static int gfx_v11_0_init_toc_microcode(struct amdgpu_device *adev, char *ucode_prefix)
+{
+	const struct psp_firmware_header_v1_0 *toc_hdr;
+	int err = 0;
+	char fw_name[40];
+
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", ucode_prefix);
+	err = amdgpu_ucode_load(adev, &adev->psp.toc_fw, fw_name);
+	if (err)
+		goto out;
+
+	toc_hdr = (const struct psp_firmware_header_v1_0 *)adev->psp.toc_fw->data;
+	adev->psp.toc.fw_version = le32_to_cpu(toc_hdr->header.ucode_version);
+	adev->psp.toc.feature_version = le32_to_cpu(toc_hdr->sos.fw_version);
+	adev->psp.toc.size_bytes = le32_to_cpu(toc_hdr->header.ucode_size_bytes);
+	adev->psp.toc.start_addr = (uint8_t *)toc_hdr +
+				le32_to_cpu(toc_hdr->header.ucode_array_offset_bytes);
+	return 0;
+out:
+	release_firmware(adev->psp.toc_fw);
+	adev->psp.toc_fw = NULL;
+	return err;
+}
+
 static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 {
 	char fw_name[40];
@@ -513,6 +537,9 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
 	}
 
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO)
+		err = gfx_v11_0_init_toc_microcode(adev, ucode_prefix);
+
 	/* only one MEC for gfx 11.0.0. */
 	adev->gfx.mec2_fw = NULL;
 
@@ -531,38 +558,6 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 	return err;
 }
 
-static int gfx_v11_0_init_toc_microcode(struct amdgpu_device *adev)
-{
-	const struct psp_firmware_header_v1_0 *toc_hdr;
-	int err = 0;
-	char fw_name[40];
-	char ucode_prefix[30];
-
-	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", ucode_prefix);
-	err = request_firmware(&adev->psp.toc_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
-	err = amdgpu_ucode_validate(adev->psp.toc_fw);
-	if (err)
-		goto out;
-
-	toc_hdr = (const struct psp_firmware_header_v1_0 *)adev->psp.toc_fw->data;
-	adev->psp.toc.fw_version = le32_to_cpu(toc_hdr->header.ucode_version);
-	adev->psp.toc.feature_version = le32_to_cpu(toc_hdr->sos.fw_version);
-	adev->psp.toc.size_bytes = le32_to_cpu(toc_hdr->header.ucode_size_bytes);
-	adev->psp.toc.start_addr = (uint8_t *)toc_hdr +
-				le32_to_cpu(toc_hdr->header.ucode_array_offset_bytes);
-	return 0;
-out:
-	dev_err(adev->dev, "Failed to load TOC microcode\n");
-	release_firmware(adev->psp.toc_fw);
-	adev->psp.toc_fw = NULL;
-	return err;
-}
-
 static u32 gfx_v11_0_get_csb_size(struct amdgpu_device *adev)
 {
 	u32 count = 0;
@@ -699,19 +694,11 @@ static void gfx_v11_0_mec_fini(struct amdgpu_device *adev)
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
@@ -1324,9 +1311,7 @@ static int gfx_v11_0_sw_init(void *handle)
 		}
 	}
 
-	r = gfx_v11_0_me_init(adev);
-	if (r)
-		return r;
+	gfx_v11_0_me_init(adev);
 
 	r = gfx_v11_0_rlc_init(adev);
 	if (r) {
@@ -1394,9 +1379,6 @@ static int gfx_v11_0_sw_init(void *handle)
 
 	/* allocate visible FB for rlc auto-loading fw */
 	if (adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO) {
-		r = gfx_v11_0_init_toc_microcode(adev);
-		if (r)
-			dev_err(adev->dev, "Failed to load toc firmware!\n");
 		r = gfx_v11_0_rlc_autoload_buffer_init(adev);
 		if (r)
 			return r;
@@ -4665,7 +4647,7 @@ static int gfx_v11_0_early_init(void *handle)
 
 	gfx_v11_0_init_rlcg_reg_access_ctrl(adev);
 
-	return 0;
+	return gfx_v11_0_init_microcode(adev);
 }
 
 static int gfx_v11_0_ras_late_init(void *handle)
-- 
2.34.1

