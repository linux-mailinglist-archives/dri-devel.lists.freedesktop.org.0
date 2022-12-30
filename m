Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 989FE6594EE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 06:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7E010E437;
	Fri, 30 Dec 2022 05:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF27E10E06C;
 Fri, 30 Dec 2022 05:21:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKZFMHVoESXoiU60YCBhG2h+h5MO9IFr2a4FsFboyVkQWM88mjWP4lVBMDH8dXblu2iQ3F1QHRkI+AFX5m8CiIS2zATQ5QJOjXMR2nJo6JlzA36AW4bIeXy26uwPT4PzcQbeAlsTlLX6pl3TyH+uOarXWZ1HMv33hSyYzRE/GpmrSN2s3AA24fWgXettUTcN+VEL8jar8Khkh3URcI1ZmTkX8TuNYcavm+5mivtdIQWLRUbsyOt/56qyawbc+X1fLx3gYiC15PZXz7TOTMclU5ftLQ5YH9/+5rEXk25gk6o1oC2cnpIV9pvZW8B+ebtmTHVKq3VV2F69Tne4/UKkpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFXZeRcBUwOoeo4gO3i8XALCyB4sp9PYq7aU1vYV8oA=;
 b=XEcSwknzvGJkW6oy/jkeRNhIzFCyRQsznzD7uVIS0ee1onvg1cQOrR/xJpzlga5B10zyGWGgCK5Jy0P3OA871pcSajA+s144q6FrNwD8ps4r4gZn7Quex6TR80hD11qmGjaMr5dDN9GsWPuy5GYZi2im9zIj3oMSX6Jzd63p6O/54G4kZHoJcQc/BFsKdH6BA14tbCHMrUQbrY9CMeQ7dWOhC0oNa6faawkjQ1K2hKFc/PM2TcsoabSVXz4wqFlmlG+FGxGr1T4BZzrALFSuDOYj0Jego2++SoO3+5Bq+TR0zlwFQrsWpPsrL7PSG13ba7bQ6GEztKH6vuuxPO4ISw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFXZeRcBUwOoeo4gO3i8XALCyB4sp9PYq7aU1vYV8oA=;
 b=pCsXllFdi0U3YnTW7dAzyUOquc2d+evFN3nWjJpdH4fcSGGDCrNVPenUFi6Qnl551ejOYRhw7UW/C75UxqPcWm+cpJdgENj0F7ECoHVf71czM5/IqLo947E6oSTyKVk8du2uqdKB9coJBKL4AOoaiKoBqq6DBMz0dfUqkrjbDQc=
Received: from MW4PR04CA0297.namprd04.prod.outlook.com (2603:10b6:303:89::32)
 by SN7PR12MB6691.namprd12.prod.outlook.com (2603:10b6:806:271::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 05:21:44 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::90) by MW4PR04CA0297.outlook.office365.com
 (2603:10b6:303:89::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.18 via Frontend
 Transport; Fri, 30 Dec 2022 05:21:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.6 via Frontend Transport; Fri, 30 Dec 2022 05:21:44 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 29 Dec
 2022 23:21:43 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 06/11] drm/amd: Request VCN microcode during IP discovery
Date: Thu, 29 Dec 2022 23:21:10 -0600
Message-ID: <20221230052119.15096-7-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT043:EE_|SN7PR12MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: dfaa0f81-4b34-45c4-c9b1-08daea25bdb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6EgP22On75keHqe/zSywae7ldWI5nf9hBB4IqeeHYZtkQy7JN05zC4DCVx6DsCRs75iQBqGC6qwo86O2xGvUIT0KVefILTc2E5A9EVaMXq/1sNvFU4re3JcA+0oJMKesqrgMowGl3Ok3mKkhRejaQOd/cI5hyhohd9tRzo1uJgIdo61q+763yiPqpMX28z2BHtLyNo1u2tJfE9KzT55Q8rFeGHtoJvPjIPGqnQ4u4t9rJ0DTtej2KLo91h41h+mvR0rdq2BYQSJvpy/u7orYXj/nD2/G6YB/SygzHXYWCUXC8LLelbdr9lkjzR0GEMK7hI4A/2EvG1O7Kj3SO/rXp5mWTIe4aK8yN/zUP+guyhuqKYS/meusI+NmDP6k4uLHyU63EQL3Uo7vHsdJBoOVSkLy+TuvyeMqqwneIdBiG+yDOSshr/ht4msMbCMOWX+4j+6ixRitjGrbD80OZirP2lqCavuQdyvIjgMlZedxsYPSKIOn46vaggcVGhw0w4/S+fapjCo7S8YCCwjQgCSq7jwLsX5OmB6wC3jYQTuFKuQyA3vBh4oFPgYJjSpGvc4ruZGN7oemXDxunoV4oortQ+T0nBaj5gKniqdF74kirpDPVmVQ8bGe7LcwQMj9jX28v+BZg5NoWtJEEajL0Yg6wegYKE468x9Pcu3Qt1848nw+fDbnRr3hiYGzwCb5SMCz5NNjTX1gsWsbHmsBOrSb1MZUOmZynpNjY0tqz6Osxxw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(356005)(40480700001)(36756003)(40460700003)(86362001)(7696005)(54906003)(6666004)(110136005)(316002)(478600001)(5660300002)(8936002)(2906002)(70586007)(8676002)(70206006)(4326008)(36860700001)(41300700001)(44832011)(47076005)(82740400003)(81166007)(82310400005)(2616005)(1076003)(26005)(336012)(16526019)(426003)(186003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 05:21:44.2109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfaa0f81-4b34-45c4-c9b1-08daea25bdb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6691
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

If VCN microcode is not available during early init, the firmware
framebuffer will have already been released and the screen will
freeze.

Move the request for VCN microcode into the IP discovery phase
so that if it's not available, IP discovery will fail.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 41 ++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       | 85 +------------------
 2 files changed, 41 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 24d54ab0963a..07c05782a0e3 100644
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

