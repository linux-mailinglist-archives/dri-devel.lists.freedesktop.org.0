Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671076581DB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D93710E3D0;
	Wed, 28 Dec 2022 16:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAC810E3CA;
 Wed, 28 Dec 2022 16:31:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y259f5jRr3/CrA4yZnhkFy7cIeL9n+AQeA+5w42ho9bdxhu/XaVnQgh6dN5rmmEd31ooNVbrYyw3IpwYfqXBBMjuSK0808Qe4hUcCDBUPlRfrffsX9ggc+wEq7UZH5sPDQggRMnCF90udRpGxf2S6J5za6Qa2T9pybE845geKmg0VBirCq548zbCwat2BKCx6PcLHZqCcs0KtqUTK1lwL9EBnQF7rlaVPOmgwM2TRAXFQ7E1kNgQMoqoo0g0zCe0BjPea71cMI7HwAiQo+Yz6GdMe/INoWcQsT0/EZKB4sIXfkEIGBklmEC5rCO0AAQ6GQnidSglveyf05DC6doM9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TF+ASITKncH/me5v202s6f0zg78tCr3JlOfzi+1ddIg=;
 b=UmG0W77bU94ih4lE0CnpBm9JgT4LGScTKLCF+ClbIt4bprAsOL19Ua/2YCQZ5oh3hf8syIo7PTm82mCJypXKtkUNCLlIFpQlW7ptedkF02sLsuBCZX3kmQCRgFBQLphBXs1U7ZELHhjS+nuCMm6Q+xWnXktAk/vZM899U5IHmSPgGqWNwNPcjGKDNaks6e6kXUCv2eljgm3KCJMBuRZv9OL7DwUMp/54iQ2qXI7fXsqzcEjQRdNWzGcEUbYs8rIB+zuq+XOjfu3oYutWjrTBg9OvTrrZkiKiCNthiurrMqmP4OGv5XNqUGjUQL0W1cbRiBxZTxm96Og4kA6B2RJrrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TF+ASITKncH/me5v202s6f0zg78tCr3JlOfzi+1ddIg=;
 b=sopw77ArT//Uq82QdYB+g0WmeytF0YCO9Wr4/ZhkZFUGC7srxloGtpWHCaS3+ugcxbYedjfi0Xr7tyvgubd5E8EoNHp6Tq9xs9u/CTrgX4Hru0a1BKL2MLiualcnVDRNiJ03ZjObQ2qqoAjyLxx4MdeGh/dXO42BlvfY7lKHE18=
Received: from MW2PR2101CA0021.namprd21.prod.outlook.com (2603:10b6:302:1::34)
 by DM4PR12MB5088.namprd12.prod.outlook.com (2603:10b6:5:38b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.17; Wed, 28 Dec
 2022 16:31:27 +0000
Received: from CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::5) by MW2PR2101CA0021.outlook.office365.com
 (2603:10b6:302:1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.7 via Frontend
 Transport; Wed, 28 Dec 2022 16:31:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT076.mail.protection.outlook.com (10.13.174.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.16 via Frontend Transport; Wed, 28 Dec 2022 16:31:27 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 28 Dec
 2022 10:31:25 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Javier Martinez Canillas <javierm@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 10/11] drm/amd: Request GFX11 microcode during IP discovery
Date: Wed, 28 Dec 2022 10:30:57 -0600
Message-ID: <20221228163102.468-11-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228163102.468-1-mario.limonciello@amd.com>
References: <20221228163102.468-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT076:EE_|DM4PR12MB5088:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7340c1-6cca-4cca-5bda-08dae8f0f7d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rQaMJnCW/zx+I+vDlgrxFUsfeoeHUwr7Zi0vRgcmVQvOlFlOzGsjeTaRf/zIty2F+u+8lGgd+t5kMDdxPPKWlS667Leg/8Ppfd0u14jfPrbI8dhj+4loIRI3A0Q2ZEpV2nufMOpBuY4bD2KY+fZE2O6O7u1cCh2Vpu7+FQwatiVCjkaNFKiFstdHdhimJk24rjJcaaPqZ8Ly/yL4nOKu+aZ3uxEqGi0vMeou/AvEFMDiiEg4+y+lvLFrs/lTz5Zzu8WLWrh38nFRjAgmC158FQgpZ4EedLIddy8kHYr/i3ka8qsqwmto3JGIKFCDUTeXXY4YLgCfpGMitLs9dKDzcUaOI9sLBdTO91JqaAhGsWTjA2FA3hPiV7xo9Mz75zc36GlwBK5yxS8eqxLxuM94ZyigQU2zu9siq1BD/c09/syueb9316Kq1St3j+xzAimACPeBHrQ9NpQjA1EZZlPfB2SbfFMY2BRV2XcItwtCLHMJ0OcbH+Tlo721Fr2hXuu/YICTc48xMnBLd5q/auWXEXelpOfik6tdIir7kKvSEYPUTb/+ayQyHBXw3DRAy1IGvXJLScpaT3h9zPUo2m7E2kzulKe48x3NZ46VmShOzMsDH47IleSMZStSI8Sd5RD1g2ElYetN9yJI71yYmytmWt+OEo7Ii3z3mAVBcyQme0QIYFIdn9myH1l2nChibEvwDGXE7L1kj5/H41AURn/xZ6ZWdbeUZdoPjAgdqp84ShQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(356005)(82740400003)(83380400001)(70586007)(81166007)(4326008)(8676002)(86362001)(316002)(70206006)(54906003)(36860700001)(41300700001)(40460700003)(19627235002)(40480700001)(2906002)(8936002)(5660300002)(1076003)(44832011)(2616005)(82310400005)(26005)(16526019)(186003)(336012)(426003)(478600001)(47076005)(6666004)(7696005)(110136005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 16:31:27.2509 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7340c1-6cca-4cca-5bda-08dae8f0f7d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5088
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If GFX11 microcode is required but not available during early init, the
microcode framebuffer will have already been released and the screen will
freeze.

Move the request for GFX11 microcode into the IP discovery phase
so that if it's not available, IP discovery will fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 52 +++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        | 64 +------------------
 2 files changed, 53 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index d31559600cae..c8c538a768fe 100644
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
@@ -2111,6 +2134,32 @@ static int amdgpu_discovery_load_gfx10(struct amdgpu_device *adev, char *ucode_p
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
@@ -2159,6 +2208,9 @@ static int amdgpu_discovery_set_gc_ip_blocks(struct amdgpu_device *adev)
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

