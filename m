Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7096581C9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DE710E3C8;
	Wed, 28 Dec 2022 16:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D56D10E3C7;
 Wed, 28 Dec 2022 16:31:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JthtUGAs2u0433bLNhssNErpJwNOD/4FYJToac/jw6kRQWVBlfLOQa9mVdFx6YL4SWv54wCQtzuPD+gl/KO8E7V2tW2aCFk5j1NT1qIt88I1/t4cdpcZFpvLAQnNLeTXO3W8VIo0lx6W2qGt1VGECke25iGITmt6DOfPnV6CR5TYo6rwBr8uFI0StTcC7yRmsAUcM28suWmZT8vbzBis2UtvDlMc5zNA/i6x4/51CN/fgEr/aoUsW1oGR1aWK+oeMdmeekTCZ6m5Ju5gakFtnOJ7zPsphc8orNFJUCcixIR+mgjAQYsSLdS8pXbL2tQBlSFOqA6P3cTFriaoYbwovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTSitoN68I/fPcqQEFrTLzACNz9WBXEsnqtFEuKK+HQ=;
 b=Jp/GyUmOvEtygOu9bckHgxtJTXvhLAD7Nk4YioGEckPkCOKHD9pz4Mi8Z7d6YjGQI1Iz3mMTK36WjRIJXA88GTZ6/HOFI4yDk+LYAxr5EjT1z7uHfH1A+tTw648RLzLQ1xbF1bAladTVQif4FZ8qFqSi0PLxPzim2XOIhI4l4AjVMJ/Cc5dZQTWOJmfYl5JjfaHr7Mp0OjHKQBSMJ009t540p5p7auTfZWSJK+h2hXtE7VLmqWF3edl7wuTKZF5yrQmNAGXJzoExi908uTJRDGWbIFr6ADpA+hiW1WGmv5QuCfApqDJzAAPMVbUxUWEOA3SfGw+q2MBQ2eEJIIrQLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTSitoN68I/fPcqQEFrTLzACNz9WBXEsnqtFEuKK+HQ=;
 b=Y3hlHRublp5BrU+Nqlpmrc0QmzwFzxg68vS5XJGRPePVftsNdVqg5zuYa3/8plKcA7Cao5tIW7zyrxnAR7r0zVs9MAl13pUwx0jUN6xwQPoY1Pnr+wtv3Xmcx8oUrr0ZXQqOTnHRv14v/XF3D5MTaOo7yWyuzrc5e1Y1trIYw1M=
Received: from MW2PR2101CA0011.namprd21.prod.outlook.com (2603:10b6:302:1::24)
 by SA3PR12MB8023.namprd12.prod.outlook.com (2603:10b6:806:320::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 16:31:24 +0000
Received: from CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::34) by MW2PR2101CA0011.outlook.office365.com
 (2603:10b6:302:1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.7 via Frontend
 Transport; Wed, 28 Dec 2022 16:31:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT076.mail.protection.outlook.com (10.13.174.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.16 via Frontend Transport; Wed, 28 Dec 2022 16:31:24 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 28 Dec
 2022 10:31:21 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Javier Martinez Canillas <javierm@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 07/11] drm/amd: Request MES microcode during IP discovery
Date: Wed, 28 Dec 2022 10:30:54 -0600
Message-ID: <20221228163102.468-8-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT076:EE_|SA3PR12MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ecc42e-6921-4f52-a02d-08dae8f0f5ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +cS+EC2EsuXFQ6e7fQ5293EYPIBj+ISFlPA4f4g4XJswJQo7ZE0M42Xl5pOPiHOAY0aoB2zgRGIbiGhJPnyHo4nLzqcPrrzVh/10e2XDHNl5V9LugSbbpZKfoLXkgU2HfRGMuOT3APoSmBLS68HYOvRqeVc4lfSXNvESvx1hKXY/nItvnheHXP9NrnYAz1xalL66l9KtB9B8SgaKHhaWiTTztQUjqKr6npCoI4gmtrc+I3y7IsHKCRbyFDjhgNWtVJFRmfRmSNrehNPzCx+2Uh9LLHBtHBz/oEGojXtcZJCH902XMwf4dcEW9yf9ySOvog4NHHBiri2Hq1MLOrRO4qYtO6WStmyjLlq2EECMd+bH8heI0XALy5A3cVwM6P/JQgsL5yYD77FxFqLFqsz8RSLbppvBzAVx+k8k8WXmx+WDqG7Mhv6ABk4t4oJZur9/w2SqK74+Iy7Ogbb/wYc8r9qF4C3J0hrLY9xCxBkvSzKeJ2oh3r3CA7+naVu7B99uXQOK58p2PQR5bNxqkrgE3oToCdO6kkVwidf5c31p1thMDUmF3pixtb2sBhBZbHIvlYaA5ot7WQZGt8831uiw2uATxIlRiPUL8AWEsEcH+yGurUZ4XcVg7BBSNt8zl9DyEGYCInn3DvmVtn+dghKe975Rx3m7Dtm27aXfvyWgp8yS92ihVi8s+plGBKtnRAVSgKgDJbeo0po2I5BKf2c1b5zXcQeQwsuWG8QqGN7shqM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(40470700004)(36840700001)(46966006)(186003)(1076003)(336012)(16526019)(26005)(2616005)(83380400001)(478600001)(6666004)(36756003)(47076005)(40460700003)(82310400005)(426003)(7696005)(86362001)(36860700001)(356005)(8936002)(41300700001)(40480700001)(110136005)(316002)(2906002)(54906003)(82740400003)(70206006)(70586007)(5660300002)(4326008)(81166007)(8676002)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 16:31:24.0479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ecc42e-6921-4f52-a02d-08dae8f0f5ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8023
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

If MES microcode is required but not available during early init, the
microcode framebuffer will have already been released and the screen will
freeze.

Move the request for MES microcode into the IP discovery phase
so that if it's not available, IP discovery will fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 39 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        | 28 -------------
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        | 25 +-----------
 3 files changed, 40 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 1c26a3a60394..479266ed2b7f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -145,6 +145,19 @@ MODULE_FIRMWARE("amdgpu/vcn_4_0_0.bin");
 MODULE_FIRMWARE("amdgpu/vcn_4_0_2.bin");
 MODULE_FIRMWARE("amdgpu/vcn_4_0_4.bin");
 
+MODULE_FIRMWARE("amdgpu/navi10_mes.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_mes.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_mes1.bin");
+
+MODULE_FIRMWARE("amdgpu/gc_11_0_0_mes.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_0_mes1.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_1_mes.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_1_mes1.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_2_mes.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_2_mes1.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_3_mes.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_3_mes1.bin");
+
 static const char *hw_id_names[HW_ID_MAX] = {
 	[MP1_HWID]		= "MP1",
 	[MP2_HWID]		= "MP2",
@@ -2041,10 +2054,29 @@ static int amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device *adev)
 		r = amdgpu_discovery_load_vcn_fw(adev, ucode_prefix);
 	return r;
 }
+
+static int amdgpu_discovery_load_mes_fw(struct amdgpu_device *adev,
+					enum admgpu_mes_pipe pipe,
+					const char *ucode_prefix)
+{
+	char fw_name[40];
+
+	if (pipe == AMDGPU_MES_SCHED_PIPE)
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes.bin",
+			 ucode_prefix);
+	else
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes1.bin",
+			 ucode_prefix);
+
+	return request_firmware(&adev->mes.fw[pipe], fw_name, adev->dev);
 }
 
 static int amdgpu_discovery_set_mes_ip_blocks(struct amdgpu_device *adev)
 {
+	char ucode_prefix[30];
+	int pipe, r;
+	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
+
 	switch (adev->ip_versions[GC_HWIP][0]) {
 	case IP_VERSION(10, 1, 10):
 	case IP_VERSION(10, 1, 1):
@@ -2077,6 +2109,13 @@ static int amdgpu_discovery_set_mes_ip_blocks(struct amdgpu_device *adev)
 	default:
 		break;
 	}
+	if (adev->enable_mes) {
+		for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
+			r = amdgpu_discovery_load_mes_fw(adev, pipe, ucode_prefix);
+			if (r)
+				return r;
+		}
+	}
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
index 614394118a53..9faa9867b3c9 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
@@ -37,10 +37,6 @@
 #define mmRLC_CP_SCHEDULERS_Sienna_Cichlid		0x4ca1
 #define mmRLC_CP_SCHEDULERS_Sienna_Cichlid_BASE_IDX	1
 
-MODULE_FIRMWARE("amdgpu/navi10_mes.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_mes.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_mes1.bin");
-
 static int mes_v10_1_hw_fini(void *handle);
 static int mes_v10_1_kiq_hw_init(struct amdgpu_device *adev);
 
@@ -382,34 +378,10 @@ static const struct amdgpu_mes_funcs mes_v10_1_funcs = {
 static int mes_v10_1_init_microcode(struct amdgpu_device *adev,
 				    enum admgpu_mes_pipe pipe)
 {
-	const char *chip_name;
-	char fw_name[30];
 	int err;
 	const struct mes_firmware_header_v1_0 *mes_hdr;
 	struct amdgpu_firmware_info *info;
 
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
 	err = amdgpu_ucode_validate(adev->mes.fw[pipe]);
 	if (err) {
 		release_firmware(adev->mes.fw[pipe]);
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 970b066b37bb..27176a1259ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -32,15 +32,6 @@
 #include "v11_structs.h"
 #include "mes_v11_api_def.h"
 
-MODULE_FIRMWARE("amdgpu/gc_11_0_0_mes.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_0_mes1.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_1_mes.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_1_mes1.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_2_mes.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_2_mes1.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_3_mes.bin");
-MODULE_FIRMWARE("amdgpu/gc_11_0_3_mes1.bin");
-
 static int mes_v11_0_hw_fini(void *handle);
 static int mes_v11_0_kiq_hw_init(struct amdgpu_device *adev);
 static int mes_v11_0_kiq_hw_fini(struct amdgpu_device *adev);
@@ -462,25 +453,11 @@ static const struct amdgpu_mes_funcs mes_v11_0_funcs = {
 static int mes_v11_0_init_microcode(struct amdgpu_device *adev,
 				    enum admgpu_mes_pipe pipe)
 {
-	char fw_name[30];
-	char ucode_prefix[30];
+
 	int err;
 	const struct mes_firmware_header_v1_0 *mes_hdr;
 	struct amdgpu_firmware_info *info;
 
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
 	err = amdgpu_ucode_validate(adev->mes.fw[pipe]);
 	if (err) {
 		release_firmware(adev->mes.fw[pipe]);
-- 
2.34.1

