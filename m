Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07D46581D3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9496110E3B8;
	Wed, 28 Dec 2022 16:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE7910E3CC;
 Wed, 28 Dec 2022 16:31:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhJy+XqAKejb5Vfn5y48fvkN8BG65wgYysY8papc5tBfZzqt3bA9xNU5z3xZdMCPBwtFg8hgQYevIrzaxY1WRmoqc/Onh7Uo1D8qJGI1oRSqaBwGjZa8irGzkQVbsNTQemP3i86z6SNqaXigODLsk7r9Ad9mY2MysJ9SvTbOG290UzuHt0B21J3+jwoYjdL8HUEUvFQu6B7qHXNIOjpcxhWPNzg70+2QOv1ZujzgJf52PhM0OYYqQgjyIDjsNzIJO1hkrKFuYSZrY6uAbgn65TF6CZblzKnby+TXBeTtOHQhysPc0rV7Kcb8eU7WdVIS2hhQV6Z5FBmW7YtQhYdGjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZR2EGiit3uNYTgAHY4aHEt00NwVCWEzM/b7GAfj7ODQ=;
 b=clRaizi3UrdxL1V3T+tAiiVOZGe3xdNkCToDMc67GtqfOuVbKFSzdJ43QM9pQuiU2/+vKnLLk89xxvrb9chQ8RjCch2J3KqCxlxaCop8SkPzDT4Ck3oKQ1AGOl3OSVG6YLFH5Uh45qQ98+hXUmHPZFw+gzGpOoX4agTHtmS8gYYfFN+PS0mDMJtcJsxAv2Y/FdpbvPSO7tqOKCxxCjysnyWVSDQgEYDmWGSNcQ7bCTjywLOLhnxVaGPG60QPLLE5WKff4bKw5rMSI38Km3sTi2EFTxFYA8AamKu6qoeubhh31sllFG9M5KiWyoUxyQnrY07rjd6rK4wL3ro6/trpcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZR2EGiit3uNYTgAHY4aHEt00NwVCWEzM/b7GAfj7ODQ=;
 b=1ouBzeEJNXeUBIktsK2gPFfZBQhih+CZO1RF32LomA9FS9EBXdWPyp1KDGfmbjMhVklhUcSqSSgdQMzOpmPT8q6jkxO/AHM4VnppvwNoBNwDtb0vUek4D5BIbikzwD5uvHmAL4qbUXZ6eyVq5rSkwAPXVSabZAFXSz4TYG+X74g=
Received: from MW2PR2101CA0036.namprd21.prod.outlook.com (2603:10b6:302:1::49)
 by IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 16:31:23 +0000
Received: from CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::13) by MW2PR2101CA0036.outlook.office365.com
 (2603:10b6:302:1::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.7 via Frontend
 Transport; Wed, 28 Dec 2022 16:31:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT076.mail.protection.outlook.com (10.13.174.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.16 via Frontend Transport; Wed, 28 Dec 2022 16:31:22 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 28 Dec
 2022 10:31:20 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Javier Martinez Canillas <javierm@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 06/11] drm/amd: Request VCN microcode during IP discovery
Date: Wed, 28 Dec 2022 10:30:53 -0600
Message-ID: <20221228163102.468-7-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT076:EE_|IA1PR12MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae692b8-f308-47ca-21e4-08dae8f0f52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NF1iLRpY2mCi6iyBsXUVveP0f3QXVYQAqv41X/n5jM+y6+jjuFERcDKa43iltVUwqOPeJmYNozllhbGX8peRmIJAbdeFWxNFS2kNkoWWYadO2TQoRb1LizuaJCPaalR+rNJWYU6sc5hapx3grzBvepmcQbFdyhncTo/s3uou4qYoAz6ArfHzIqRLPIogOC7fhJ7qqlV6CqZiH6Wz5eiHNPC/cwJ+Wqa2URG5Slk7WrpdNDlOXN+LBeohvPe73ullqjYBkbVhzsnpGig8heblUTUDmBfLTUVWJ7yW1lQfT9QeL/bsNtmNgvp/l9TQNVX2iWTI+TIgfj13l9rzg+luLSP9pLYdm4TlhJR9rXFVVj5hELZRpVScKzWGna1iAg+vsqMkoB9D0qljseQtmBMrZyuDmvag16kJSU/JNiIJxM0H1kHAA34jT0V+qIRRYCA7rEU0M71XBYXx0wjyf2ileC+gZYXBeX6crCgEHZwsl17K8oPL3PyxvPV3SBYWFF6t9ePpJ84+FwCGALHqr0aYp6UHVcGdiqv9fot7F56LZRZdrfKIBIaGq2MUo0I2M5T1xz+qHzfPTy+X2tenhj8tzGUyw+xcZyOl9QTSBe4WF0sm2AsbNocG34EmS1eNnX1REBsvN8ptU4gkKBxEyOgsbQ89VN0pMDSesY9jD0Zbnz3D1KdR38Gfwu4asH2XYIDyeWrcAgQ4GQ80LTFSZU+d4f/Pd+e1+PQjCk9O7R5zV50=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(40480700001)(356005)(36756003)(40460700003)(110136005)(316002)(86362001)(54906003)(81166007)(6666004)(2616005)(478600001)(8936002)(5660300002)(2906002)(44832011)(4326008)(70586007)(8676002)(70206006)(41300700001)(36860700001)(336012)(47076005)(82740400003)(1076003)(7696005)(186003)(26005)(426003)(16526019)(82310400005)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 16:31:22.7667 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae692b8-f308-47ca-21e4-08dae8f0f52b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6089
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

If VCN microcode is not available during early init, the microcode
framebuffer will have already been released and the screen will
freeze.

Move the request for VCN microcode into the IP discovery phase
so that if it's not available, IP discovery will fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 41 ++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       | 85 +------------------
 2 files changed, 41 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index f51ff86293b3..1c26a3a60394 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -124,6 +124,27 @@ MODULE_FIRMWARE("amdgpu/sdma_6_0_1.bin");
 MODULE_FIRMWARE("amdgpu/sdma_6_0_2.bin");
 MODULE_FIRMWARE("amdgpu/sdma_6_0_3.bin");
 
+MODULE_FIRMWARE("amdgpu/raven_vcn.bin");
+MODULE_FIRMWARE("amdgpu/picasso_vcn.bin");
+MODULE_FIRMWARE("amdgpu/raven2_vcn.bin");
+MODULE_FIRMWARE("amdgpu/arcturus_vcn.bin");
+MODULE_FIRMWARE("amdgpu/renoir_vcn.bin");
+MODULE_FIRMWARE("amdgpu/green_sardine_vcn.bin");
+MODULE_FIRMWARE("amdgpu/aldebaran_vcn.bin");
+MODULE_FIRMWARE("amdgpu/navi10_vcn.bin");
+MODULE_FIRMWARE("amdgpu/navi14_vcn.bin");
+MODULE_FIRMWARE("amdgpu/navi12_vcn.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_vcn.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_vcn.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_vcn.bin");
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_vcn.bin");
+MODULE_FIRMWARE("amdgpu/beige_goby_vcn.bin");
+MODULE_FIRMWARE("amdgpu/yellow_carp_vcn.bin");
+MODULE_FIRMWARE("amdgpu/vcn_3_1_2.bin");
+MODULE_FIRMWARE("amdgpu/vcn_4_0_0.bin");
+MODULE_FIRMWARE("amdgpu/vcn_4_0_2.bin");
+MODULE_FIRMWARE("amdgpu/vcn_4_0_4.bin");
+
 static const char *hw_id_names[HW_ID_MAX] = {
 	[MP1_HWID]		= "MP1",
 	[MP2_HWID]		= "MP2",
@@ -1922,8 +1943,23 @@ static int amdgpu_discovery_set_sdma_ip_blocks(struct amdgpu_device *adev)
 	return 0;
 }
 
+static int amdgpu_discovery_load_vcn_fw(struct amdgpu_device *adev,
+					char *fname)
+{
+	char fw_name[40];
+
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", fname);
+
+	return request_firmware(&adev->vcn.fw, fw_name, adev->dev);
+}
+
 static int amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device *adev)
 {
+	char ucode_prefix[30];
+	int r = 0;
+
+	amdgpu_ucode_ip_version_decode(adev, UVD_HWIP, ucode_prefix, sizeof(ucode_prefix));
+
 	if (adev->ip_versions[VCE_HWIP][0]) {
 		switch (adev->ip_versions[UVD_HWIP][0]) {
 		case IP_VERSION(7, 0, 0):
@@ -2001,7 +2037,10 @@ static int amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device *adev)
 			return -EINVAL;
 		}
 	}
-	return 0;
+	if (*ucode_prefix)
+		r = amdgpu_discovery_load_vcn_fw(adev, ucode_prefix);
+	return r;
+}
 }
 
 static int amdgpu_discovery_set_mes_ip_blocks(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index a23e26b272b4..370c9644a3b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -35,55 +35,11 @@
 #include "amdgpu_vcn.h"
 #include "soc15d.h"
 
-/* Firmware Names */
-#define FIRMWARE_RAVEN		"amdgpu/raven_vcn.bin"
-#define FIRMWARE_PICASSO	"amdgpu/picasso_vcn.bin"
-#define FIRMWARE_RAVEN2		"amdgpu/raven2_vcn.bin"
-#define FIRMWARE_ARCTURUS	"amdgpu/arcturus_vcn.bin"
-#define FIRMWARE_RENOIR		"amdgpu/renoir_vcn.bin"
-#define FIRMWARE_GREEN_SARDINE	"amdgpu/green_sardine_vcn.bin"
-#define FIRMWARE_NAVI10		"amdgpu/navi10_vcn.bin"
-#define FIRMWARE_NAVI14		"amdgpu/navi14_vcn.bin"
-#define FIRMWARE_NAVI12		"amdgpu/navi12_vcn.bin"
-#define FIRMWARE_SIENNA_CICHLID	"amdgpu/sienna_cichlid_vcn.bin"
-#define FIRMWARE_NAVY_FLOUNDER	"amdgpu/navy_flounder_vcn.bin"
-#define FIRMWARE_VANGOGH	"amdgpu/vangogh_vcn.bin"
-#define FIRMWARE_DIMGREY_CAVEFISH	"amdgpu/dimgrey_cavefish_vcn.bin"
-#define FIRMWARE_ALDEBARAN	"amdgpu/aldebaran_vcn.bin"
-#define FIRMWARE_BEIGE_GOBY	"amdgpu/beige_goby_vcn.bin"
-#define FIRMWARE_YELLOW_CARP	"amdgpu/yellow_carp_vcn.bin"
-#define FIRMWARE_VCN_3_1_2	"amdgpu/vcn_3_1_2.bin"
-#define FIRMWARE_VCN4_0_0	"amdgpu/vcn_4_0_0.bin"
-#define FIRMWARE_VCN4_0_2	"amdgpu/vcn_4_0_2.bin"
-#define FIRMWARE_VCN4_0_4      "amdgpu/vcn_4_0_4.bin"
-
-MODULE_FIRMWARE(FIRMWARE_RAVEN);
-MODULE_FIRMWARE(FIRMWARE_PICASSO);
-MODULE_FIRMWARE(FIRMWARE_RAVEN2);
-MODULE_FIRMWARE(FIRMWARE_ARCTURUS);
-MODULE_FIRMWARE(FIRMWARE_RENOIR);
-MODULE_FIRMWARE(FIRMWARE_GREEN_SARDINE);
-MODULE_FIRMWARE(FIRMWARE_ALDEBARAN);
-MODULE_FIRMWARE(FIRMWARE_NAVI10);
-MODULE_FIRMWARE(FIRMWARE_NAVI14);
-MODULE_FIRMWARE(FIRMWARE_NAVI12);
-MODULE_FIRMWARE(FIRMWARE_SIENNA_CICHLID);
-MODULE_FIRMWARE(FIRMWARE_NAVY_FLOUNDER);
-MODULE_FIRMWARE(FIRMWARE_VANGOGH);
-MODULE_FIRMWARE(FIRMWARE_DIMGREY_CAVEFISH);
-MODULE_FIRMWARE(FIRMWARE_BEIGE_GOBY);
-MODULE_FIRMWARE(FIRMWARE_YELLOW_CARP);
-MODULE_FIRMWARE(FIRMWARE_VCN_3_1_2);
-MODULE_FIRMWARE(FIRMWARE_VCN4_0_0);
-MODULE_FIRMWARE(FIRMWARE_VCN4_0_2);
-MODULE_FIRMWARE(FIRMWARE_VCN4_0_4);
-
 static void amdgpu_vcn_idle_work_handler(struct work_struct *work);
 
 int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 {
 	unsigned long bo_size;
-	const char *fw_name;
 	const struct common_firmware_header *hdr;
 	unsigned char fw_check;
 	unsigned int fw_shared_size, log_offset;
@@ -99,46 +55,27 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 	switch (adev->ip_versions[UVD_HWIP][0]) {
 	case IP_VERSION(1, 0, 0):
 	case IP_VERSION(1, 0, 1):
-		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
-			fw_name = FIRMWARE_RAVEN2;
-		else if (adev->apu_flags & AMD_APU_IS_PICASSO)
-			fw_name = FIRMWARE_PICASSO;
-		else
-			fw_name = FIRMWARE_RAVEN;
-		break;
 	case IP_VERSION(2, 5, 0):
-		fw_name = FIRMWARE_ARCTURUS;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(2, 2, 0):
-		if (adev->apu_flags & AMD_APU_IS_RENOIR)
-			fw_name = FIRMWARE_RENOIR;
-		else
-			fw_name = FIRMWARE_GREEN_SARDINE;
-
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(2, 6, 0):
-		fw_name = FIRMWARE_ALDEBARAN;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(2, 0, 0):
-		fw_name = FIRMWARE_NAVI10;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(2, 0, 2):
-		if (adev->asic_type == CHIP_NAVI12)
-			fw_name = FIRMWARE_NAVI12;
-		else
-			fw_name = FIRMWARE_NAVI14;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
@@ -146,58 +83,46 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 	case IP_VERSION(3, 0, 0):
 	case IP_VERSION(3, 0, 64):
 	case IP_VERSION(3, 0, 192):
-		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
-			fw_name = FIRMWARE_SIENNA_CICHLID;
-		else
-			fw_name = FIRMWARE_NAVY_FLOUNDER;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(3, 0, 2):
-		fw_name = FIRMWARE_VANGOGH;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(3, 0, 16):
-		fw_name = FIRMWARE_DIMGREY_CAVEFISH;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(3, 0, 33):
-		fw_name = FIRMWARE_BEIGE_GOBY;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(3, 1, 1):
-		fw_name = FIRMWARE_YELLOW_CARP;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(3, 1, 2):
-		fw_name = FIRMWARE_VCN_3_1_2;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(4, 0, 0):
-		fw_name = FIRMWARE_VCN4_0_0;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(4, 0, 2):
-		fw_name = FIRMWARE_VCN4_0_2;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
 		break;
 	case IP_VERSION(4, 0, 4):
-		fw_name = FIRMWARE_VCN4_0_4;
 		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
 			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
 			adev->vcn.indirect_sram = true;
@@ -206,17 +131,9 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
-	r = request_firmware(&adev->vcn.fw, fw_name, adev->dev);
-	if (r) {
-		dev_err(adev->dev, "amdgpu_vcn: Can't load firmware \"%s\"\n",
-			fw_name);
-		return r;
-	}
-
 	r = amdgpu_ucode_validate(adev->vcn.fw);
 	if (r) {
-		dev_err(adev->dev, "amdgpu_vcn: Can't validate firmware \"%s\"\n",
-			fw_name);
+		dev_err(adev->dev, "amdgpu_vcn: Can't validate firmware\n");
 		release_firmware(adev->vcn.fw);
 		adev->vcn.fw = NULL;
 		return r;
-- 
2.34.1

