Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6029A6594EA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 06:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B570D10E43B;
	Fri, 30 Dec 2022 05:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE91E10E089;
 Fri, 30 Dec 2022 05:21:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEiFkjsnbjD6F0gBeCs7E4nMcwijrcVf5JN+2CJr+NObHC3gvf7fgqttTnJB1p17rMJLNg78G44nvliIfnGoCuX95Dzgyi4xiWuXxJwfn/ZZRdvnEmNj0H5iKLRycomW2Vbz2qEcS0gLUpiRGdC3utY34T9nhxDoXF/3FizBGZh9fr0N8TCNVRZK5SmbHpRuR9jG2rBDbBr5OCkPYzUPxEmrgObnJAcKDzACCG0TSQJaMbGfz4+M4iy5sEZcdc8NJDsDxybH6I5yTXMEyOVh/G8i+GQhs8URUYTcjqFckmgPDQ/fbPPTK5/0C9wn4GHcytAuuh++/vS1tgeqx9tL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2sNT051it6yZuDlp2nekYU8WU55a8CR4j6R3ecmets=;
 b=MqJgCPhoZhLIxjHbYwKgltDJG4nXsUPf9Kbur0IvZ+5pjnXQIZHxUQEIt8gzZEgFT6TjiEs0ky2vOXh6pS/BpUd6stHQWTW0wXmJX9q1q+i4n1fRb43aL2bswJqyj9RPrY0EvhMvsyfThzuLB0GF7HhB/nIPYWDL9YaV4YPPXx4TTRySL6nBaXqyqGdtMNOcnOi3+0M11RjxMGNtbJOmlpswYvrF9ArMU6y6aSwHeH3cZJs4gYbEI/sOBOlF/0GoGoYyUPTqc4DKQmSZPC6ErF8sOugfq8Kr3P3498vAq/uUdWSpNK+h2iHcQHk5WwrwJCqUNIMQ9eLLuTn9diV9ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2sNT051it6yZuDlp2nekYU8WU55a8CR4j6R3ecmets=;
 b=N9cCPT3rx9TnNsmN/JKeragMvlfsJfnv65VqYKR9oUE+kgSdLlyBv12WEVD9rNCyTZFWacbvr/bIqwSt4pf+0yR+93Wj5dRKEMDcmSljOYVE3dUKsl2+7cbrYMb7Wy6tYGHrSngk/GmTJGSl8wGQTGJ4LkG3dkBxeBXCiPGLJw8=
Received: from MW4PR03CA0356.namprd03.prod.outlook.com (2603:10b6:303:dc::31)
 by DM6PR12MB4203.namprd12.prod.outlook.com (2603:10b6:5:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 05:21:50 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::b1) by MW4PR03CA0356.outlook.office365.com
 (2603:10b6:303:dc::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17 via Frontend
 Transport; Fri, 30 Dec 2022 05:21:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Fri, 30 Dec 2022 05:21:50 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 29 Dec
 2022 23:21:48 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 10/11] drm/amd: Request GFX11 microcode during IP discovery
Date: Thu, 29 Dec 2022 23:21:14 -0600
Message-ID: <20221230052119.15096-11-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221230052119.15096-1-mario.limonciello@amd.com>
References: <20221230052119.15096-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT055:EE_|DM6PR12MB4203:EE_
X-MS-Office365-Filtering-Correlation-Id: 698b351c-df3b-439d-b452-08daea25c14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MQPP1KJpXWJSFPJd/FE83yIAZA1FiRbh3VKAKnX9T6sJH9oL7ZbG+ELoocZuUReps9DY7MTJ5RU8+BepYCJ0zfN5hoE+1QAWQ27NllN8iL9yCrqjgrWw6P4HldYMM2jMKKK7CijOuXRBkuurNeN2qVM1rrraHUc1FtNtSBTA65AKmC4DCZkdLXyrDgaTGw/Ykd14xmsplqqWi/Sd1KqtTlO3/Z6bfkFCVj7WoTHVDkvdrpZNjRB2+Ibt70+chfH+OpmeDjvdBP9eRFn6Ffl0yHg05uHvoNwQ5f/AnpKQcWqyHg5k+mfjz6TWghfOkSST2bEhK+2ylS/UsW/HeRuzAM7cJmBFwDcrj7W2xRnW5jzbtBoPvj3ivJ2Lq1o1a6zB9fpnAFhhRwjCeffzRJ6pa1ktSKlGhnxnISj4t0886eYCSxpnv+XOpknhND+TzfqJjVE2l1TObpgs+VCMTdXG3i7IN3EVm1P3+ki1iR8NZ3ZQEVSPYAZHYttDC2Rg3g14jFjdysdXDiVrwPiY3OMbAhzvzuUPhOI2KnZoWslEiPNBWx+kSS4l8SLIH/uwIx2Hrbqb0JNjTBSYtvE/GXM62oFNizuNS2uplTeZhVv5i+wbu3I6G0monAc9c4bnrZuKcpqp7zLjZ0h4pV6y+eTfkOpY8IP6LlIMLJn5SfQUIhIeG3xHKbgDxC6oo0oGCQmj37Y62PGAdnMC4GMXRyuYTLtlJB5X/6Y9yMfq0T/u0hg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(36756003)(5660300002)(356005)(8936002)(82740400003)(44832011)(41300700001)(81166007)(2906002)(47076005)(36860700001)(426003)(336012)(86362001)(83380400001)(316002)(54906003)(110136005)(7696005)(40460700003)(70586007)(40480700001)(70206006)(82310400005)(6666004)(19627235002)(8676002)(16526019)(4326008)(186003)(26005)(1076003)(2616005)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 05:21:50.2659 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 698b351c-df3b-439d-b452-08daea25c14c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If GFX11 microcode is required but not available during early init, the
firmware framebuffer will have already been released and the screen will
freeze.

Move the request for GFX11 microcode into the IP discovery phase
so that if it's not available, IP discovery will fail.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 52 +++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        | 64 +------------------
 2 files changed, 53 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 439b10fdff1b..ce1aa7683738 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -316,6 +316,29 @@ MODULE_FIRMWARE("amdgpu/gc_10_3_7_mec.bin");
 MODULE_FIRMWARE("amdgpu/gc_10_3_7_mec2.bin");
 MODULE_FIRMWARE("amdgpu/gc_10_3_7_rlc.bin");
 
+/* gfx11 */
+MODULE_FIRMWARE("amdgpu/gc_11_0_0_pfp.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_0_me.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_0_mec.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_0_rlc.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_0_toc.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_1_pfp.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_1_me.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_1_mec.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_1_rlc.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_2_pfp.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_2_me.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_2_mec.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_2_rlc.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_3_pfp.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_3_me.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_3_mec.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_3_rlc.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_4_pfp.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_4_me.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_4_mec.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_4_rlc.bin");
+
 static const char *hw_id_names[HW_ID_MAX] = {
 	[MP1_HWID]		= "MP1",
 	[MP2_HWID]		= "MP2",
@@ -2114,6 +2137,32 @@ static int amdgpu_discovery_load_gfx10(struct amdgpu_device *adev, char *ucode_p
 	r = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
 	if (r)
 		return r;
+	return 0;
+}
+
+static int amdgpu_discovery_load_gfx11(struct amdgpu_device *adev, char *ucode_prefix)
+{
+	char fw_name[40];
+	int r;
+
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
+	r = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
+	r = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
+	r = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO) {
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", ucode_prefix);
+		r = request_firmware(&adev->psp.toc_fw, fw_name, adev->dev);
+		if (r)
+			return r;
+	}
 
 	return 0;
 }
@@ -2162,6 +2211,9 @@ static int amdgpu_discovery_set_gc_ip_blocks(struct amdgpu_device *adev)
 	case IP_VERSION(11, 0, 2):
 	case IP_VERSION(11, 0, 3):
 	case IP_VERSION(11, 0, 4):
+		r = amdgpu_discovery_load_gfx11(adev, ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &gfx_v11_0_ip_block);
 		break;
 	default:
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index a56c6e106d00..576fa591c6da 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -60,27 +60,6 @@
 #define regRLC_RLCS_BOOTLOAD_STATUS_gc_11_0_1	0x4e7e
 #define regRLC_RLCS_BOOTLOAD_STATUS_gc_11_0_1_BASE_IDX	1
 
-MODULE_FIRMWARE("amdgpu/gc_11_0_0_pfp.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_0_me.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_0_mec.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_0_rlc.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_0_toc.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_1_pfp.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_1_me.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_1_mec.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_1_rlc.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_2_pfp.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_2_me.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_2_mec.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_2_rlc.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_3_pfp.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_3_me.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_3_mec.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_3_rlc.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_4_pfp.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_4_me.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_4_mec.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_4_rlc.bin");
 
 static const struct soc15_reg_golden golden_settings_gc_11_0_1[] =
 {
@@ -445,8 +424,6 @@ static void gfx_v11_0_free_microcode(struct amdgpu_device *adev)
 
 static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 {
-	char fw_name[40];
-	char ucode_prefix[30];
 	int err;
 	const struct rlc_firmware_header_v2_0 *rlc_hdr;
 	uint16_t version_major;
@@ -454,12 +431,6 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 
 	DRM_DEBUG("\n");
 
-	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
-	err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
 	if (err)
 		goto out;
@@ -476,10 +447,6 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_PFP);
 	}
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
-	err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.me_fw);
 	if (err)
 		goto out;
@@ -492,10 +459,6 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 	}
 
 	if (!amdgpu_sriov_vf(adev)) {
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
-		err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
-		if (err)
-			goto out;
 		err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
 		if (err)
 			goto out;
@@ -507,10 +470,6 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 			goto out;
 	}
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
-	err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
 	if (err)
 		goto out;
@@ -530,9 +489,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 
 out:
 	if (err) {
-		dev_err(adev->dev,
-			"gfx11: Failed to init firmware \"%s\"\n",
-			fw_name);
+		dev_err(adev->dev, "gfx11: Failed to init firmware\n");
 		release_firmware(adev->gfx.pfp_fw);
 		adev->gfx.pfp_fw = NULL;
 		release_firmware(adev->gfx.me_fw);
@@ -549,20 +506,6 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 static int gfx_v11_0_init_toc_microcode(struct amdgpu_device *adev)
 {
 	const struct psp_firmware_header_v1_0 *toc_hdr;
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
 
 	toc_hdr = (const struct psp_firmware_header_v1_0 *)adev->psp.toc_fw->data;
 	adev->psp.toc.fw_version = le32_to_cpu(toc_hdr->header.ucode_version);
@@ -571,11 +514,6 @@ static int gfx_v11_0_init_toc_microcode(struct amdgpu_device *adev)
 	adev->psp.toc.start_addr = (uint8_t *)toc_hdr +
 				le32_to_cpu(toc_hdr->header.ucode_array_offset_bytes);
 	return 0;
-out:
-	dev_err(adev->dev, "Failed to load TOC microcode\n");
-	release_firmware(adev->psp.toc_fw);
-	adev->psp.toc_fw = NULL;
-	return err;
 }
 
 static u32 gfx_v11_0_get_csb_size(struct amdgpu_device *adev)
-- 
2.34.1

