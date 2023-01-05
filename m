Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFC565E3D4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E0810E651;
	Thu,  5 Jan 2023 03:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C6110E647;
 Thu,  5 Jan 2023 03:44:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3smpv9eGsN1Yj2r5nuLgZqt1oOe1km8WgNbwhzejy52M3jCrQlhK43Tb33JFIWFeOjmmNPsoGolLM1H1EC3td7e7kcxSeUl6KRXGl6jLGpPnbWWNqHtKGWJWjcsnGsc6cbFvLYH6tsFOvlfnZXmMlmNGq3E4RxBXQL0pw/HW/i/d9p384/tu6m+/+09crFiWoTu39O4edvPpL5BYFWnbceTluQQALtQctWqvPG7nlPvRCT/O/0qF910QNLOQ9VmvLAde4yRM7xboBet9Tc3g0CiP9TFi/a7vj32MFVBpw3tjAsWTBVG4GC6VnYxWGweDH2MIdaKPUUsviz6iz9oVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSIyO4bKjjUY01U+PUjAEWsQAa/LqsRh/k5L6/SfDco=;
 b=iDILRIeHzuW116iPDrZ+a0rUDOYotAb3jAJBGZQoEdv/o9b110uFvFiENYUHup5JBXc64lIROqf0D0VyOnyyOQBA0om+wX99ssMd/u2XMhVppwIv1AcieCAP6qPKiZ4weS0O6uUvJDnu++fA3lof/n5sT5Da1R1NRnn/8Sf+XQx4EdGJVVeujjqoT2yG5BqoVa2Z+lCQvNcHd/j8V1o0aTRN+FqcP3A+txr0n+m/5eDaWIVuSubJ9yAo2C9g8Bt5Kbg4W66MBGfi+3tvl58Tc28RuGXnLthi12iU3DDN4WvgBgemBvWrMz6Q57r0coAxFFthtejM5v/FSXhmisncTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSIyO4bKjjUY01U+PUjAEWsQAa/LqsRh/k5L6/SfDco=;
 b=aUWRVWyA9kM8R6D0YItsMTvlBgRtvpXUt6wTBejU4CvEILQC90kFPDi/ewqjrNINzS7QbfgdmuyFyvFrksslNggAPMKc2qHbUkW6sgOWp4emVogr8ESALfZVMzzZ+/mOCr7/q+hG5W8V2jbUW08WeusjMrreib1w7JsFDhPKDTY=
Received: from BN0PR04CA0042.namprd04.prod.outlook.com (2603:10b6:408:e8::17)
 by PH0PR12MB8006.namprd12.prod.outlook.com (2603:10b6:510:28d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:12 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::9c) by BN0PR04CA0042.outlook.office365.com
 (2603:10b6:408:e8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 03:44:12 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:10 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 11/45] drm/amd: Load MES microcode during early_init
Date: Wed, 4 Jan 2023 21:42:45 -0600
Message-ID: <20230105034327.1439-12-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|PH0PR12MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c091472-07d1-47cd-370a-08daeecf1c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z5Eb+Fpj82kz8WA3xiOe795UNtN8VS/gMqjvcn1V9Qk/vYyYfG8jHsNVfKvjzexbN1/b1SF7JcN3RprH+VKS+3Ul+TnMtdWIQ1i2aCNONLkPicbhCOIWreCLy3QOY8xdzxxoqUMVXYo/k5Pt8yTQZZLkebHJykl+hH5FwcVNaOY8OaNezwxOcVrJL8GFr7k7+9qbxrwp7ZGT7Jf0gj1CINkCcljM32J5KrTo03H8m1EeGzPfV/aWIt4E4K5mdZuUDqzywN+PcaMgMAkG/WmBo/bep12nurM4mSpK77PWjf8rXOd8X0WDn/C/EUK3vEE0lzwZe65jgkvRPlVaUwx2Rkel37/Gf7W6BrO8qCWbb0XsFvk43tGgaWoyYDuVLaqwp0sTeW8YoGcnsF9mxWxvrn/j1DYXUfeANfciydaFqw2ChP1lJZVd8Amq6SXX9XNKR/B38eW45Pb+VQ8Cm/WkeKYmKXcwe9Mx/jjr5t5LDQIXvUmuSRezYFj5q41KPKmvxw+K0p17Rt5Uv1P9zp11FPQlPuP0HVmnkhUcn40K8H2VZlLi10GMSCn8TvqV9M9kbq2NKI48ycGlYVjpptBdf6smreq9GFPTSLffv3r17YcOwyxU3JFQEZdGYOaJBreC2dVSvCPEgWxWZQOEZ9rBsH0u/fd1/ODJbxZlIBKkqGZHwsb86sjASgOYvRXluCtlHofSDFMSGgUvBWs+PA676VrPNBKgJePizRHJPUX92fA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(356005)(40480700001)(186003)(36756003)(40460700003)(26005)(16526019)(86362001)(316002)(81166007)(478600001)(54906003)(110136005)(4326008)(6666004)(44832011)(2906002)(8676002)(70586007)(70206006)(8936002)(30864003)(36860700001)(5660300002)(41300700001)(426003)(82740400003)(82310400005)(7696005)(47076005)(83380400001)(2616005)(1076003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:12.5554 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c091472-07d1-47cd-370a-08daeecf1c41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8006
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

Add an early_init phase to MES for fetching and validating microcode
from the filesystem.

If MES microcode is required but not available during early init, the
firmware framebuffer will have already been released and the screen will
freeze.

Move the request for MES microcode into the early_init phase
so that if it's not available, early_init will fail.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 65 +++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h |  1 +
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c  | 97 +++++--------------------
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c  | 88 +++++-----------------
 4 files changed, 100 insertions(+), 151 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 0c546245793b..dd8f35234507 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -21,6 +21,8 @@
  *
  */
 
+#include <linux/firmware.h>
+
 #include "amdgpu_mes.h"
 #include "amdgpu.h"
 #include "soc15_common.h"
@@ -1423,3 +1425,66 @@ int amdgpu_mes_self_test(struct amdgpu_device *adev)
 	kfree(vm);
 	return 0;
 }
+
+int amdgpu_mes_init_microcode(struct amdgpu_device *adev, int pipe)
+{
+	const struct mes_firmware_header_v1_0 *mes_hdr;
+	struct amdgpu_firmware_info *info;
+	char ucode_prefix[30];
+	char fw_name[40];
+	int r;
+
+	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
+		ucode_prefix,
+		pipe == AMDGPU_MES_SCHED_PIPE ? "" : "1");
+	r = request_firmware(&adev->mes.fw[pipe], fw_name, adev->dev);
+	if (r)
+		goto out;
+
+	r = amdgpu_ucode_validate(adev->mes.fw[pipe]);
+	if (r)
+		goto out;
+
+	mes_hdr = (const struct mes_firmware_header_v1_0 *)
+		adev->mes.fw[pipe]->data;
+	adev->mes.uc_start_addr[pipe] =
+		le32_to_cpu(mes_hdr->mes_uc_start_addr_lo) |
+		((uint64_t)(le32_to_cpu(mes_hdr->mes_uc_start_addr_hi)) << 32);
+	adev->mes.data_start_addr[pipe] =
+		le32_to_cpu(mes_hdr->mes_data_start_addr_lo) |
+		((uint64_t)(le32_to_cpu(mes_hdr->mes_data_start_addr_hi)) << 32);
+
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
+		int ucode, ucode_data;
+
+		if (pipe == AMDGPU_MES_SCHED_PIPE) {
+			ucode = AMDGPU_UCODE_ID_CP_MES;
+			ucode_data = AMDGPU_UCODE_ID_CP_MES_DATA;
+		} else {
+			ucode = AMDGPU_UCODE_ID_CP_MES1;
+			ucode_data = AMDGPU_UCODE_ID_CP_MES1_DATA;
+		}
+
+		info = &adev->firmware.ucode[ucode];
+		info->ucode_id = ucode;
+		info->fw = adev->mes.fw[pipe];
+		adev->firmware.fw_size +=
+			ALIGN(le32_to_cpu(mes_hdr->mes_ucode_size_bytes),
+			      PAGE_SIZE);
+
+		info = &adev->firmware.ucode[ucode_data];
+		info->ucode_id = ucode_data;
+		info->fw = adev->mes.fw[pipe];
+		adev->firmware.fw_size +=
+			ALIGN(le32_to_cpu(mes_hdr->mes_ucode_data_size_bytes),
+			      PAGE_SIZE);
+	}
+
+	return 0;
+
+out:
+	release_firmware(adev->mes.fw[pipe]);
+	adev->mes.fw[pipe] = NULL;
+	return r;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
index 97c05d08a551..547ec35691fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
@@ -306,6 +306,7 @@ struct amdgpu_mes_funcs {
 
 int amdgpu_mes_ctx_get_offs(struct amdgpu_ring *ring, unsigned int id_offs);
 
+int amdgpu_mes_init_microcode(struct amdgpu_device *adev, int pipe);
 int amdgpu_mes_init(struct amdgpu_device *adev);
 void amdgpu_mes_fini(struct amdgpu_device *adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
index 614394118a53..9c5ff8b7c202 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
@@ -379,82 +379,6 @@ static const struct amdgpu_mes_funcs mes_v10_1_funcs = {
 	.resume_gang = mes_v10_1_resume_gang,
 };
 
-static int mes_v10_1_init_microcode(struct amdgpu_device *adev,
-				    enum admgpu_mes_pipe pipe)
-{
-	const char *chip_name;
-	char fw_name[30];
-	int err;
-	const struct mes_firmware_header_v1_0 *mes_hdr;
-	struct amdgpu_firmware_info *info;
-
-	switch (adev->ip_versions[GC_HWIP][0]) {
-	case IP_VERSION(10, 1, 10):
-		chip_name = "navi10";
-		break;
-	case IP_VERSION(10, 3, 0):
-		chip_name = "sienna_cichlid";
-		break;
-	default:
-		BUG();
-	}
-
-	if (pipe == AMDGPU_MES_SCHED_PIPE)
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes.bin",
-			 chip_name);
-	else
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes1.bin",
-			 chip_name);
-
-	err = request_firmware(&adev->mes.fw[pipe], fw_name, adev->dev);
-	if (err)
-		return err;
-
-	err = amdgpu_ucode_validate(adev->mes.fw[pipe]);
-	if (err) {
-		release_firmware(adev->mes.fw[pipe]);
-		adev->mes.fw[pipe] = NULL;
-		return err;
-	}
-
-	mes_hdr = (const struct mes_firmware_header_v1_0 *)
-		adev->mes.fw[pipe]->data;
-	adev->mes.uc_start_addr[pipe] =
-		le32_to_cpu(mes_hdr->mes_uc_start_addr_lo) |
-		((uint64_t)(le32_to_cpu(mes_hdr->mes_uc_start_addr_hi)) << 32);
-	adev->mes.data_start_addr[pipe] =
-		le32_to_cpu(mes_hdr->mes_data_start_addr_lo) |
-		((uint64_t)(le32_to_cpu(mes_hdr->mes_data_start_addr_hi)) << 32);
-
-	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
-		int ucode, ucode_data;
-
-		if (pipe == AMDGPU_MES_SCHED_PIPE) {
-			ucode = AMDGPU_UCODE_ID_CP_MES;
-			ucode_data = AMDGPU_UCODE_ID_CP_MES_DATA;
-		} else {
-			ucode = AMDGPU_UCODE_ID_CP_MES1;
-			ucode_data = AMDGPU_UCODE_ID_CP_MES1_DATA;
-		}
-
-		info = &adev->firmware.ucode[ucode];
-		info->ucode_id = ucode;
-		info->fw = adev->mes.fw[pipe];
-		adev->firmware.fw_size +=
-			ALIGN(le32_to_cpu(mes_hdr->mes_ucode_size_bytes),
-			      PAGE_SIZE);
-
-		info = &adev->firmware.ucode[ucode_data];
-		info->ucode_id = ucode_data;
-		info->fw = adev->mes.fw[pipe];
-		adev->firmware.fw_size +=
-			ALIGN(le32_to_cpu(mes_hdr->mes_ucode_data_size_bytes),
-			      PAGE_SIZE);
-	}
-
-	return 0;
-}
-
 static void mes_v10_1_free_microcode(struct amdgpu_device *adev,
 				     enum admgpu_mes_pipe pipe)
 {
@@ -1019,10 +943,6 @@ static int mes_v10_1_sw_init(void *handle)
 		if (!adev->enable_mes_kiq && pipe == AMDGPU_MES_KIQ_PIPE)
 			continue;
 
-		r = mes_v10_1_init_microcode(adev, pipe);
-		if (r)
-			return r;
-
 		r = mes_v10_1_allocate_eop_buf(adev, pipe);
 		if (r)
 			return r;
@@ -1229,6 +1149,22 @@ static int mes_v10_1_resume(void *handle)
 	return amdgpu_mes_resume(adev);
 }
 
+static int mes_v10_0_early_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int pipe, r;
+
+	for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
+		if (!adev->enable_mes_kiq && pipe == AMDGPU_MES_KIQ_PIPE)
+			continue;
+		r = amdgpu_mes_init_microcode(adev, pipe);
+		if (r)
+			return r;
+	}
+
+	return 0;
+}
+
 static int mes_v10_0_late_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
@@ -1241,6 +1177,7 @@ static int mes_v10_0_late_init(void *handle)
 
 static const struct amd_ip_funcs mes_v10_1_ip_funcs = {
 	.name = "mes_v10_1",
+	.early_init = mes_v10_0_early_init,
 	.late_init = mes_v10_0_late_init,
 	.sw_init = mes_v10_1_sw_init,
 	.sw_fini = mes_v10_1_sw_fini,
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 970b066b37bb..3af77a32baac 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -459,73 +459,6 @@ static const struct amdgpu_mes_funcs mes_v11_0_funcs = {
 	.misc_op = mes_v11_0_misc_op,
 };
 
-static int mes_v11_0_init_microcode(struct amdgpu_device *adev,
-				    enum admgpu_mes_pipe pipe)
-{
-	char fw_name[30];
-	char ucode_prefix[30];
-	int err;
-	const struct mes_firmware_header_v1_0 *mes_hdr;
-	struct amdgpu_firmware_info *info;
-
-	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
-
-	if (pipe == AMDGPU_MES_SCHED_PIPE)
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes.bin",
-			 ucode_prefix);
-	else
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes1.bin",
-			 ucode_prefix);
-
-	err = request_firmware(&adev->mes.fw[pipe], fw_name, adev->dev);
-	if (err)
-		return err;
-
-	err = amdgpu_ucode_validate(adev->mes.fw[pipe]);
-	if (err) {
-		release_firmware(adev->mes.fw[pipe]);
-		adev->mes.fw[pipe] = NULL;
-		return err;
-	}
-
-	mes_hdr = (const struct mes_firmware_header_v1_0 *)
-		adev->mes.fw[pipe]->data;
-	adev->mes.uc_start_addr[pipe] =
-		le32_to_cpu(mes_hdr->mes_uc_start_addr_lo) |
-		((uint64_t)(le32_to_cpu(mes_hdr->mes_uc_start_addr_hi)) << 32);
-	adev->mes.data_start_addr[pipe] =
-		le32_to_cpu(mes_hdr->mes_data_start_addr_lo) |
-		((uint64_t)(le32_to_cpu(mes_hdr->mes_data_start_addr_hi)) << 32);
-
-	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
-		int ucode, ucode_data;
-
-		if (pipe == AMDGPU_MES_SCHED_PIPE) {
-			ucode = AMDGPU_UCODE_ID_CP_MES;
-			ucode_data = AMDGPU_UCODE_ID_CP_MES_DATA;
-		} else {
-			ucode = AMDGPU_UCODE_ID_CP_MES1;
-			ucode_data = AMDGPU_UCODE_ID_CP_MES1_DATA;
-		}
-
-		info = &adev->firmware.ucode[ucode];
-		info->ucode_id = ucode;
-		info->fw = adev->mes.fw[pipe];
-		adev->firmware.fw_size +=
-			ALIGN(le32_to_cpu(mes_hdr->mes_ucode_size_bytes),
-			      PAGE_SIZE);
-
-		info = &adev->firmware.ucode[ucode_data];
-		info->ucode_id = ucode_data;
-		info->fw = adev->mes.fw[pipe];
-		adev->firmware.fw_size +=
-			ALIGN(le32_to_cpu(mes_hdr->mes_ucode_data_size_bytes),
-			      PAGE_SIZE);
-	}
-
-	return 0;
-}
-
 static void mes_v11_0_free_microcode(struct amdgpu_device *adev,
 				     enum admgpu_mes_pipe pipe)
 {
@@ -1100,10 +1033,6 @@ static int mes_v11_0_sw_init(void *handle)
 		if (!adev->enable_mes_kiq && pipe == AMDGPU_MES_KIQ_PIPE)
 			continue;
 
-		r = mes_v11_0_init_microcode(adev, pipe);
-		if (r)
-			return r;
-
 		r = mes_v11_0_allocate_eop_buf(adev, pipe);
 		if (r)
 			return r;
@@ -1338,6 +1267,22 @@ static int mes_v11_0_resume(void *handle)
 	return amdgpu_mes_resume(adev);
 }
 
+static int mes_v11_0_early_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int pipe, r;
+
+	for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
+		if (!adev->enable_mes_kiq && pipe == AMDGPU_MES_KIQ_PIPE)
+			continue;
+		r = amdgpu_mes_init_microcode(adev, pipe);
+		if (r)
+			return r;
+	}
+
+	return 0;
+}
+
 static int mes_v11_0_late_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
@@ -1352,6 +1297,7 @@ static int mes_v11_0_late_init(void *handle)
 
 static const struct amd_ip_funcs mes_v11_0_ip_funcs = {
 	.name = "mes_v11_0",
+	.early_init = mes_v11_0_early_init,
 	.late_init = mes_v11_0_late_init,
 	.sw_init = mes_v11_0_sw_init,
 	.sw_fini = mes_v11_0_sw_fini,
-- 
2.34.1

