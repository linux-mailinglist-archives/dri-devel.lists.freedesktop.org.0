Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62866594E5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 06:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0562D10E057;
	Fri, 30 Dec 2022 05:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E2510E0A3;
 Fri, 30 Dec 2022 05:21:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bliu5uHmUwPEWuKPayPXhizJCZ7hZCkYMeuuXsvIQ7NLolAd7V0dvErvshCNZxVJZvTlLVUVL3ZL4MzDHhqCA7Q3e65qLa+ch0ZCcoahFMeZEAjVWwttjJCFm57U/ZxTlNRhjb1DO7OBv0IIsYVBoptJUaW6SqsB/u22O7vBWzx6k+T8hhBCO6U4KtQM4h4idvL4GNg99ZF1jkXjU4yetuA1Zj8h0Z6ccDhMUV55mFv/Om+pc2qXYnm7ZH6itm+xzqA9pqi4Q7A+B2sWim4+tOloxIcHbHKvdROfGDJdVKXmpU1wpIEVYsnlbervpSBq21Cup+DpmPvOuVghgOAPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaRbNW14irpdV8ochGNqUlpR22kwnoTJ/fvNJWPVZB0=;
 b=XloiiQ/dBmi8GT8tF42t5ZJbocSqKPKob5EUe4cubv+Lt5wPsRPXGKNhcCNXYeEKKSCpga33Z4Knn67MzNTiLZ9oetfS/Il2is7GTlMt5uTz7UlxqPsf9TfTp5Nd2SqPepjYTOsRWcbuKyP62ZkkUhLoGgXVi4WD0j+E8crgMbd8T6TjZdwZzy1zfw10QEuL5YFikAni9PEm0xvvRPNvxn2pnSjtrbMZEOz1wxqpjNvEHYXck6s1CFPNFRZCpkuSfOZssBPOKXqT5JROwXa6Wkk58PYP24xCkNsxa3kJzvwv0w8k/1YPiUTC+a/b1vfx9EceHZsZk4USVseGwBQxvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaRbNW14irpdV8ochGNqUlpR22kwnoTJ/fvNJWPVZB0=;
 b=TPcByWjbUwSefOWnifTHB1ok76yKDXmzKhrjeMuqJjHeLn1g22KgM7QZSA5RIN+blLKsIwR1j0hCvBK8mhvBY9xpIbGNIaRcANwgbhyd/DWCg0KMle1owJtxMgqxrA1WbrUMmIACpIyj8pJPwCZROJZD0xafI0eeCpOxT5g5B/I=
Received: from MW4PR03CA0345.namprd03.prod.outlook.com (2603:10b6:303:dc::20)
 by BL1PR12MB5253.namprd12.prod.outlook.com (2603:10b6:208:30b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 05:21:46 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::8a) by MW4PR03CA0345.outlook.office365.com
 (2603:10b6:303:dc::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.18 via Frontend
 Transport; Fri, 30 Dec 2022 05:21:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Fri, 30 Dec 2022 05:21:45 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 29 Dec
 2022 23:21:44 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 07/11] drm/amd: Request MES microcode during IP discovery
Date: Thu, 29 Dec 2022 23:21:11 -0600
Message-ID: <20221230052119.15096-8-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT055:EE_|BL1PR12MB5253:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e4eb00-936e-4b6d-2e30-08daea25beb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SBI524RAhzE218OZ/fBDsyONZmUNadtNCDP1s8PweaQqPa1wQdNpyqO8XABogv5z34CNCKtEq0xgIuKzy0nHZvood1uOl6NO5gPx1xwHtWQmaiTmmRfFdPNe1cA4AquO2gx4S+4prG+/v6NURQ69jK5yRtYiXWfLH9o6O79XMRR3cX4fDdVxxN3bEoVonab0fE/erkPAaAHVPeOTMVSrfm294mf/wFkdJlYk6rHoy5p9S39F064pYib2vrZMxTu8/yJ1kON2sCtAi0J+9bvVD27PHF+OX4+lXxbEQ4AeENA4gPTVGJLx9TENxoux0HIniAnfyuMPcrLOz4KU0e1LCWsLZH/rvqJZgA3A1seAvXhXsujNVVnFSbz0nN6rcJtj7INV+8ardv4iUMjPDhGQEWiIIL5CLGN2Vkn7QEC3+u0hLIyWqHCIklvzt2wv1rR3R1pbumQ/GzwngEnPrx13++UhUF6dqNc7TKvcVf7z9M86r1QeFJmV7emPQ0Lr6OXttHAkpOSOKXMEnIDEnh8xN1hMs50s7aaHwsdX2WPgIjW8Qn8UspM1z9HLu30VcdTM7ElYeBL3VavBSAXaght5yipPvvlS6F03++mASrWuAnAOZ8wAg6zmVbqjhtQFGYRuavn6SewKjVRnlO+LZs/ZQvvFlegZqvWDMiwvjnjFtWeqGurNwvpA10r5stsr1lHp2ibf8+gS4RWgML3iqFbsJghsNGb3q4K1QepvpM4FcUY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(36840700001)(40470700004)(46966006)(70586007)(5660300002)(4326008)(70206006)(8676002)(16526019)(41300700001)(44832011)(8936002)(26005)(426003)(186003)(2616005)(36756003)(356005)(2906002)(110136005)(54906003)(40460700003)(478600001)(316002)(86362001)(6666004)(40480700001)(336012)(1076003)(7696005)(47076005)(81166007)(82740400003)(82310400005)(83380400001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 05:21:45.8756 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e4eb00-936e-4b6d-2e30-08daea25beb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5253
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

If MES microcode is required but not available during early init, the
firmware framebuffer will have already been released and the screen will
freeze.

Move the request for MES microcode into the IP discovery phase
so that if it's not available, IP discovery will fail.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2->v3:
 * Add a missing newline
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 40 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        | 28 -------------
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        | 25 +-----------
 3 files changed, 41 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 07c05782a0e3..edaeec35c39f 100644
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
@@ -2041,10 +2054,30 @@ static int amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device *adev)
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
+
+	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
+
 	switch (adev->ip_versions[GC_HWIP][0]) {
 	case IP_VERSION(10, 1, 10):
 	case IP_VERSION(10, 1, 1):
@@ -2077,6 +2110,13 @@ static int amdgpu_discovery_set_mes_ip_blocks(struct amdgpu_device *adev)
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

