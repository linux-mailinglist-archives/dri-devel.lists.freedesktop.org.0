Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4265F1C8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBAC10E782;
	Thu,  5 Jan 2023 17:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2041.outbound.protection.outlook.com [40.107.101.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C3010E775;
 Thu,  5 Jan 2023 17:02:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oduTeLER6AWCCgeslmNp5iE99+4FqK4fficliG+KAKfDNvGi1N+a7rePaD3yZiOVb9FYT3eViyVIoHeWpBo3nPeuvxw74XSSq+5Pv9KQkGZKxQtVO+mc9R4As2v70BVBKVtejbGce6WtJl1AOtcKwdaEtuwGmbu5qdJ4V0CFrjzwU7dwEQ75RXJnB+5nIVzGedOGvUONs71ypAaP5sWEHIIOhu97VmFXeZ5lt/1nmzOa+JxBlkzlea4Npe8O1Ou1ZqJsmtjsgVug8/4hP6W5RwBdKBgNj27geCvoxD1NTTg85dMCeiNQ/DtwtVH+Tow54cVDfa2hWv/WhkihU6SZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgVzh8QGHal7m77YNWni86c6a9O9/MQJWN5+1u5oDf8=;
 b=V8bKO8F06SsSFtcDfVGr3vMhX1g48pR2AHN2nQ/3SYH0UuGF8RArLkWK4imrMRwWi+xaz5m7faXQs6GUBMMVb+E8YZitc5LmD/h8EN/mWtOAlrfNzQnAjEYmOldGDYoSoO9I4fZ2fg7Kr1hZ1zgflH1L6Xbb397bE3CZNumMLJrOpnZo2Ex4E3O6VedZoRamWyTuaU8+Vcic/IB8Yh4fzWF34qpXZkn7iwqouy6E2YAJm9gY1Zrx0Zekfuza9SulDf/aKtZrW5vXHUfu+QMKrCrUdWk31gPJ6sef8JmTbSxH+AykktiGGvw5l+SlFdaAifJXSqoTAZLNtseze49FIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgVzh8QGHal7m77YNWni86c6a9O9/MQJWN5+1u5oDf8=;
 b=P9d2a1N5lDtEkCJdOkqbZD0dFWjSc5oO6kkK9B99zepJz1uXEetzXEAv2BufqUdcSDfbJehMtE+Cyajld9JE24Dd5pHBsy2oeUGW4x83MpV7PKNB/0bV02J+kRH4IqeqUzBtITW4dDwM+g78MsmTo2XD2LACN1HccvBootgoJH8=
Received: from BN9PR03CA0389.namprd03.prod.outlook.com (2603:10b6:408:f7::34)
 by MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:14 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::2f) by BN9PR03CA0389.outlook.office365.com
 (2603:10b6:408:f7::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 17:02:12 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:10 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 11/45] drm/amd: Load MES microcode during early_init
Date: Thu, 5 Jan 2023 11:00:57 -0600
Message-ID: <20230105170138.717-12-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|MW3PR12MB4428:EE_
X-MS-Office365-Filtering-Correlation-Id: f37754bd-fdec-46ea-8416-08daef3e96b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mzx6j/ro2O70J2kYhN5XK1WPUdGzaComa9feN5pqWINymh6UL+dcKnUrXT/S+DHnIyMwTYXetw2JCF2NyB8+prCuKuVFpUj/aKhcERQT9gALf0RgXpU2v3rdjosxvdY8J5H4ENpIX/RTfhChmI2RC4HUMmxn+TuMKhQhCly6q2f0z7uh6RSJ8Wrhydts9VqODePJd4IPqokDhFRcqWVUzglRZVxh8Obkbe38oeikYGNnfMxksbc6sP9MAUKH4TGvieHViYOYpiCNWxjJbXGkOjc9Q72pO6kto3D3KDS0b2ob07pWbERKYhCwj/IWtnocroWX5PyxZDySR8BedPvs3DaFBeMOUo1d+3vDwHFMJLe1iiKEMs/VT+6XPZpPRLmxFG6PEQRW5kcp73L2AXKjBZbkN6KsyEfDRY3lw90mtjgt00v1S481HARIK5g59tKtrDsiz/jihaHmZpiLnrKrjeLQ/AVHEehcJVCnWgQ9KZc/dsemGFhidsSdMNXdnR/xCs9Mw6YOqkjBAcKxm9K/JkYXyerB0Xs5Y7PodKxCAK4AqZoqTpP3ZW0c8IZsTfClK2zOkbe1HjXcw3HH4Nh4E0kKmUcCKF91jsydMhSKNpC0owC9L4QaEhvuzeWz3dXMcfn1p3k7i1FFT1LAmgtUzY+KlAYH5ZfnjHWZa3A3KnLcLCsF8cnPFeVaJ7LsGFbvxqn0DOXQT/15d+dnT9yraAPyzjrdHCyYXl+Xj0Nk7ZI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(40460700003)(40480700001)(356005)(36756003)(426003)(8676002)(336012)(1076003)(41300700001)(5660300002)(47076005)(83380400001)(30864003)(478600001)(8936002)(44832011)(6666004)(26005)(186003)(70206006)(7696005)(4326008)(16526019)(110136005)(2616005)(70586007)(316002)(81166007)(86362001)(54906003)(82310400005)(2906002)(82740400003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:12.1301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f37754bd-fdec-46ea-8416-08daef3e96b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4428
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

Add an early_init phase to MES for fetching and validating microcode
from the filesystem.

If MES microcode is required but not available during early init, the
firmware framebuffer will have already been released and the screen will
freeze.

Move the request for MES microcode into the early_init phase
so that if it's not available, early_init will fail.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
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

