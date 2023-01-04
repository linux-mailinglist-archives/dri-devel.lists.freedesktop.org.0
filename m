Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CBF65DA46
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E81110E553;
	Wed,  4 Jan 2023 16:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2A810E547;
 Wed,  4 Jan 2023 16:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIN8zlEL/tzE8481bbz+GKdkPBHqZXEIOQCxGBMeWzxqGQdL/q86+oN/UwdglnwbadqmbZ4ZqKPOvjxU19l2Cdu+3qVC3CRNSSHzvq/gQ54o9c5LlYEIRSqXuBW2KsBqVIjhocddRz5n1ksur/20TYZBDnn+evcG4G2OsxisO1oPre8FWi12UJ8ssfhv1OkWK+G8IpNHMsP3Bf9LrBV+2GVUwGU48CptXctUH7Cmslq4DKqdA3G4Y2FGPABATN0t+bovPM1BnS5W6LpNh9hyL458eBG4MnmdKoK5WkKGf+Dy8r1xmmf1DBS1Z+Im3vkUehKPQOJrCOT+npYcFptPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/M0YVsQ3BZxtOgwckN7CY7NeFI4c/jRuufH1fIIyYtc=;
 b=kRkW6Fa/7ZDZeOGP48duRjOZYPrV7+xrF9MpF7qfD8PYNqPUuuECxOF/QOUQ4vQUdvPTB1KhNhZD7yF5ilaBHURTEQWz20N2H3aaP9+evlQBJZA24ZPIDl2Pb8ar1HCxU+HlFbYZgrnbJTTV8g/1Ra5/rfpecuvim9N6URouQ50Y0imM7Gka6kfXZAeKM/k+9Z9gPzjWco+9WZWE/MjPwggcM///topjFDKsFbMqds37bfU70yGFEV9kW560n6m9iPyFQPWT+9IWvxoKOIy131v3/5yAf8N5gcw/T26fLehifdqtqUNcsF42rnFCNonuFozxC3aVz2LRmgiDyu6MAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M0YVsQ3BZxtOgwckN7CY7NeFI4c/jRuufH1fIIyYtc=;
 b=XStjuDvWy02KfpeYp6pdhDpoKp5hdHSeDV3b2Nz0Uuu/59rocJijguhi3xrsHgeqmRQipQzfjDLxsGsFgTbMQVT2NDX15TM7N4+Mir01BzqGFfSUSJKEevslf1ty3OEHc1b/dnabuvfXaAvyFJ0M9eWL5QkVEMy2YxkzkGLf5n8=
Received: from BN9PR03CA0625.namprd03.prod.outlook.com (2603:10b6:408:106::30)
 by MW4PR12MB6780.namprd12.prod.outlook.com (2603:10b6:303:20e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:43:07 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::2d) by BN9PR03CA0625.outlook.office365.com
 (2603:10b6:408:106::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:43:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:43:07 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:42:59 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 18/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX11
Date: Wed, 4 Jan 2023 10:40:07 -0600
Message-ID: <20230104164042.30271-19-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|MW4PR12MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c200f4d-f517-4b95-a0ea-08daee72c1e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WKUr5eAvrV3ykADiZ9MOhq9DsPhnN1z/+syAV0sKwZh+vgs6QP3Yd5/Ms7utbEjS2QdZoLBjj28J95xaimcm3MGZk6MaGmSuZBHtzUwGE2YoJWDobPmrHxyYEYh68LRi3dJqzM9fiGjatOelAZOeSL6xAfi7H5OKiyreco/O7wUzIXWS0tEJz6RpoN9fRRsmeilNhB4h5WT/PXO0fsKXiJ1Gg0ZLnBrnGefAyZ8Euemu4Uf/9oXM1KdQuHdcKirKMkePOQjNDz6LBaqVLShrHYhnyb+7bFfxlnACDfR2CT7kk5uDkBa5lOBd6HuPCYomBiQANGxATDMp/DKMcRKiOq0zelmZiKqf0cOO9Xn5Z0iHYDc+tWICBzYb4DvhcNZwW230E/OOMO2lNxfzxwSD0wh3IFxEWh02fzSU/tIpA43TKfP/6rl3LpERQHGnVSvn37b9GFEb4ekPTXYeeDGaJaGeJGp4x277KjtXBWJaG5n6/iMflQHdNEpj6TtMGmQ90kagckZRFkFFzs+LA1+t/8xQvKg+reXycnzfws2e6So8YCMCK0E8wnSQK6anxc5qr+nqX8afCNMtmdhWtDGnWZImAjsRqEiHo0QzFrFDAJyCkTzVjfhfaQChFAQiR3OGtckPGvr9z/2eAqwUHPHA+LLL3byCBpQ0XCPBTIjAbHlKbjr9oM37ygEuaif17aRLYOsy2uBkKazKS9BuTUKQg9w9Up8oZ5Ot7rbeEV1bUrcyFAeaKmG74UgiyyPvslOXkYHXu8hHbGAGBoUdDdJqJw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(2616005)(1076003)(336012)(36860700001)(426003)(47076005)(40480700001)(86362001)(40460700003)(81166007)(82310400005)(356005)(82740400003)(36756003)(110136005)(54906003)(316002)(2906002)(41300700001)(44832011)(70586007)(8936002)(4326008)(70206006)(8676002)(26005)(186003)(478600001)(6666004)(16526019)(5660300002)(7696005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:43:07.2455 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c200f4d-f517-4b95-a0ea-08daee72c1e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6780
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

The `amdgpu_ucode_release` helper will provide symmetery on unload.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 102 +++++++++----------------
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c |   7 +-
 2 files changed, 37 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index a56c6e106d00..ce018331b093 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -431,18 +431,37 @@ static int gfx_v11_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 
 static void gfx_v11_0_free_microcode(struct amdgpu_device *adev)
 {
-	release_firmware(adev->gfx.pfp_fw);
-	adev->gfx.pfp_fw = NULL;
-	release_firmware(adev->gfx.me_fw);
-	adev->gfx.me_fw = NULL;
-	release_firmware(adev->gfx.rlc_fw);
-	adev->gfx.rlc_fw = NULL;
-	release_firmware(adev->gfx.mec_fw);
-	adev->gfx.mec_fw = NULL;
+	amdgpu_ucode_release(adev->gfx.pfp_fw);
+	amdgpu_ucode_release(adev->gfx.me_fw);
+	amdgpu_ucode_release(adev->gfx.rlc_fw);
+	amdgpu_ucode_release(adev->gfx.mec_fw);
 
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
+	amdgpu_ucode_release(adev->psp.toc_fw);
+	return err;
+}
+
 static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 {
 	char fw_name[40];
@@ -457,10 +476,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
-	err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.pfp_fw, fw_name);
 	if (err)
 		goto out;
 	/* check pfp fw hdr version to decide if enable rs64 for gfx11.*/
@@ -477,10 +493,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
-	err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.me_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.me_fw, fw_name);
 	if (err)
 		goto out;
 	if (adev->gfx.rs64_enable) {
@@ -493,10 +506,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 
 	if (!amdgpu_sriov_vf(adev)) {
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
-		err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
-		if (err)
-			goto out;
-		err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
+		err = amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_name);
 		if (err)
 			goto out;
 		rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
@@ -508,10 +518,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
-	err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw, fw_name);
 	if (err)
 		goto out;
 	if (adev->gfx.rs64_enable) {
@@ -530,54 +537,15 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 
 out:
 	if (err) {
-		dev_err(adev->dev,
-			"gfx11: Failed to init firmware \"%s\"\n",
-			fw_name);
-		release_firmware(adev->gfx.pfp_fw);
-		adev->gfx.pfp_fw = NULL;
-		release_firmware(adev->gfx.me_fw);
-		adev->gfx.me_fw = NULL;
-		release_firmware(adev->gfx.rlc_fw);
-		adev->gfx.rlc_fw = NULL;
-		release_firmware(adev->gfx.mec_fw);
-		adev->gfx.mec_fw = NULL;
+		amdgpu_ucode_release(adev->gfx.pfp_fw);
+		amdgpu_ucode_release(adev->gfx.me_fw);
+		amdgpu_ucode_release(adev->gfx.rlc_fw);
+		amdgpu_ucode_release(adev->gfx.mec_fw);
 	}
 
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
diff --git a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
index 95548c512f4f..79ebf692cec6 100644
--- a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
@@ -49,10 +49,7 @@ static int imu_v11_0_init_microcode(struct amdgpu_device *adev)
 	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_imu.bin", ucode_prefix);
-	err = request_firmware(&adev->gfx.imu_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gfx.imu_fw);
+	err = amdgpu_ucode_request(adev, &adev->gfx.imu_fw, fw_name);
 	if (err)
 		goto out;
 	imu_hdr = (const struct imu_firmware_header_v1_0 *)adev->gfx.imu_fw->data;
@@ -77,7 +74,7 @@ static int imu_v11_0_init_microcode(struct amdgpu_device *adev)
 		dev_err(adev->dev,
 			"gfx11: Failed to load firmware \"%s\"\n",
 			fw_name);
-		release_firmware(adev->gfx.imu_fw);
+		amdgpu_ucode_release(adev->gfx.imu_fw);
 	}
 
 	return err;
-- 
2.34.1

