Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B0A65E3E2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB0910E661;
	Thu,  5 Jan 2023 03:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2084.outbound.protection.outlook.com [40.107.101.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FA510E64D;
 Thu,  5 Jan 2023 03:44:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7fjLKBhz8iGHbjxKnVfOz9ctfmLuRweMpXmzVfxXT4b0rOV6H5Ptfp6ZdzC6TlBZBANHkKmaUFcxcn1xVhpuAc6wO1SNWvWz19IWr4iR+D3vghht1qtTWo+WBXN88pRssoBwdEaxbfcGgar6fIq0BtG1wcPZmi0T85GPk8+8sWxJ8FILtbscMPdD2kRJBfm9mflXkHdlKDVeq+ESPmzU0v3h67q3LgcP/FcF62n7sxUFTHXde7hq+Ik4+cDL0mCLUska2wkk91khYNNClvhia2A/8KHqaHDY++YkX8DNQIs2kWdHmycSlOWkW6YVCf/O5nHckeZ6cVMq/3PJmMHzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kgq5hTHWmFqew+Yw20fpmM6cHVchFNeVqdSmENIoTOM=;
 b=WJqcLph59GEf8P+WSSVryG5+AAiLlWiqwSxcBBDQrygRuUafPE1gIv9CY1IpSgUjTH/l8mqlMotbYU80N60ajgyP7UiJE1eZNNhtAas8CqJM9D5ZkFPDrxGacbDWBcGxpFn6xkOK9gDlisFJbBk3wvUaV0K0yeqXwreMaf+p5KxedK2ppLZd8tdvVr2JdfpK+dviCmq3N6whioifo7MZmHx6C5c86bkcD6D3tkmQCtJu9crirTZTVHZjnhuq3qgH/3kmSQrRykN3TFzntRq9ENCMUQYEc4BWeT0kmyYiv657uByL21ydz4jPL08dctNG8qNCTcly3vKFIVh20J9fpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kgq5hTHWmFqew+Yw20fpmM6cHVchFNeVqdSmENIoTOM=;
 b=onQ17WrhsnnXxxhZ9hDinld4kxsCLEoAjxyoEmDGBrKkW2MtoSxHWjvr6Tn9UkAWSGaQ/+9XvYb/srtpYtvqPi/K1uQaUuxL4J06zCqeM/ecAk5sQkZtbISKr3sHJmQR/qs4dPeZIKVex22pZTI6sSkgbUUsUqeWIqXJUiu+dgM=
Received: from BN9PR03CA0606.namprd03.prod.outlook.com (2603:10b6:408:106::11)
 by PH7PR12MB6979.namprd12.prod.outlook.com (2603:10b6:510:1b9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:26 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::a0) by BN9PR03CA0606.outlook.office365.com
 (2603:10b6:408:106::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:44:25 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:23 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 18/45] drm/amd: Use `amdgpu_ucode_*` helpers for GFX11
Date: Wed, 4 Jan 2023 21:42:52 -0600
Message-ID: <20230105034327.1439-19-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT065:EE_|PH7PR12MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbb6a22-4d63-46a8-030f-08daeecf2409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BhqtRLTQ7mHJqTPeBw0FsFQqu4gr0RbDGZ0K8jA7BeqGBrxbAx/h4EMT7saYKKOfFOXI6dibwXf5JNbvfVWottStSIocKSEv3TCuuQk1xd9OeXwzHbvrEOO8cHqHvnjOqkyN77eRIycsU4Vv6iizoMaRgFyCQgRY8rYkXaZFE1byyh2elFtmHFe9pAPENkMahIs07QN2rFxJX1I46UrX/I5PLmXPsbAHFVKLDNyDeV0mfbUt5jMgo3SvN+Uwdy+fT+aMxaABFCLEHxn2/0CWRjVdQI3LzBBVIRqKId6jwMH8j1Xl1gpsgHDTovOFoIaR2z4B7jcQUqj2LUvTJHoLm1IEWfbRNAA/CyDjOuJwwpHM08Nhp54DsZw4CpR9IIOLWbd8tbpF8IvNBSv55a6h/pRatXvqSYrKGrgcnhXN9OORkzQaXn2fr7o7qRMvdYxOEQ7rGgZN2mP+1iHQ5ToYZ83cOk8np6Qm5KnAMKH8QaC4M9XA9jdbXueyIziFnUNhm0J7pwmYXdK8RuzMH8re/1cHp3fYqNMUQwC81YrJC8Nd8rH0fiFV2LY6mYhr675uhI9H2UmKpZF11Rzs6u+iozjzuaL8PXS3fsXIzuzM7OaG9xnXgQXrXmsBw879Lnc9xrlz+MWqyUpzel2fZZPnmjWMZPsteGXulR5+xFsUj45il+PC1OMWNZAvrCBHC617Ypo2veEHYam99ZrunTUfiXN7y1ppfgiz5+KO1UDNHeHdScPbvAfcecQ62Agax2xHXO3KbvR8gEdNL7umW7J/WA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(6666004)(26005)(16526019)(2906002)(478600001)(7696005)(186003)(70206006)(70586007)(4326008)(2616005)(8676002)(336012)(41300700001)(110136005)(426003)(40460700003)(316002)(47076005)(40480700001)(44832011)(83380400001)(82740400003)(5660300002)(36756003)(8936002)(54906003)(1076003)(86362001)(36860700001)(81166007)(82310400005)(356005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:25.6089 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbb6a22-4d63-46a8-030f-08daeecf2409
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6979
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

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 104 +++++++++----------------
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c |   7 +-
 2 files changed, 39 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index a56c6e106d00..d4f67624d05b 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -431,18 +431,39 @@ static int gfx_v11_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 
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
+	amdgpu_ucode_release(&adev->gfx.pfp_fw);
+	amdgpu_ucode_release(&adev->gfx.me_fw);
+	amdgpu_ucode_release(&adev->gfx.rlc_fw);
+	amdgpu_ucode_release(&adev->gfx.mec_fw);
 
 	kfree(adev->gfx.rlc.register_list_format);
 }
 
+static int gfx_v11_0_init_toc_microcode(struct amdgpu_device *adev)
+{
+	const struct psp_firmware_header_v1_0 *toc_hdr;
+	int err = 0;
+	char fw_name[40];
+	char ucode_prefix[30];
+
+	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", ucode_prefix);
+	err = amdgpu_ucode_request(adev, &adev->psp.toc_fw, fw_name);
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
+	amdgpu_ucode_release(&adev->psp.toc_fw);
+	return err;
+}
+
 static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 {
 	char fw_name[40];
@@ -457,10 +478,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
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
@@ -477,10 +495,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
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
@@ -493,10 +508,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 
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
@@ -508,10 +520,7 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
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
@@ -530,54 +539,15 @@ static int gfx_v11_0_init_microcode(struct amdgpu_device *adev)
 
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
+		amdgpu_ucode_release(&adev->gfx.pfp_fw);
+		amdgpu_ucode_release(&adev->gfx.me_fw);
+		amdgpu_ucode_release(&adev->gfx.rlc_fw);
+		amdgpu_ucode_release(&adev->gfx.mec_fw);
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
index 95548c512f4f..ed0d368149aa 100644
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
+		amdgpu_ucode_release(&adev->gfx.imu_fw);
 	}
 
 	return err;
-- 
2.34.1

