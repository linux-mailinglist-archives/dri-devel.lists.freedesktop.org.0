Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F30E65F1BF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D6010E777;
	Thu,  5 Jan 2023 17:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6C510E76B;
 Thu,  5 Jan 2023 17:02:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DM+GYeHk77NbG6ojUy2uqIriritw1K0BhTy8X57pDWsJAVOHeKqvzObhAdgnL4GHe3EpN1ZERzO6dqONOyKTDo6IBfjD+ucxKuS4cybEBhrymVUqABZu+oO5OcnZTdoENjUVedzvLUnLh27whOx7QvROw7OebKQi1Nk8RdmzrZK2mRoVjX57SxWBZ4k1/crlaP5j7XRPhnxWo1v1WrLODL69C5Y1nxSW+RosfTom6uoWYw/F8jRsAy1ENv4HKQt6SlJZThvNMMrE9cgXyxIQyRyiFn6cDaUg9nb0Rjz484wO52G76SdRcpVK7q4lfu7Vj6LzTUtuWD8XgOLYZz2c0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4zbsiQy/fC3u1t72Iv6DdqnTSi7tpWLz9GSdn7lK4w=;
 b=TtmpXY8BbWnyAAiaBghSDHrvKHu3NB6R4/2lxZpUkbsEMwJsFXyi41Dzh/E8tvh6xXp8ECX2wuU48T1lyBqVqr98yXP/aVr38o3Qtcr4Rxfs04BBu0a2s5LO2XUFtuPwredGSuc7iiPHev6mIKbq+cwDQTm8j5WldffslIMrhxgze39QM/wZEErXLXnkrayRbcA80SCIgHxzJb6o9NfPC7c5Mnx0+ukKTaPkDG+6UkHJzYGGe0o2PX5ubPDi41eLj5qfZI4VHf1M8/mqBAUrNDvMLMtYyxZYEtdAubtYWSrytUzMndS3c5+95pr/niTEHho2Rz4WbWtNuX8Inx8gPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4zbsiQy/fC3u1t72Iv6DdqnTSi7tpWLz9GSdn7lK4w=;
 b=3EJwWuQEFU4r1tLiBSn0VbvflHGBV8ZPLIQIcl0TZ/tH2h45r/jwOOyhpxlEjgWz8j+9Dx0VouTKKLMMATdd4i1+N8h5CofsgprTHh1Vm+SbnotnRc6hVgziNS2i2ZrLINoj0CXfDhdIG7Au45/Kk2yqCR7sFZXwoI/pWlTwfk4=
Received: from BN8PR03CA0031.namprd03.prod.outlook.com (2603:10b6:408:94::44)
 by PH0PR12MB5498.namprd12.prod.outlook.com (2603:10b6:510:d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:06 +0000
Received: from BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::3e) by BN8PR03CA0031.outlook.office365.com
 (2603:10b6:408:94::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT104.mail.protection.outlook.com (10.13.177.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:05 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:04 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 07/45] drm/amd: Convert SDMA to use
 `amdgpu_ucode_ip_version_decode`
Date: Thu, 5 Jan 2023 11:00:53 -0600
Message-ID: <20230105170138.717-8-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT104:EE_|PH0PR12MB5498:EE_
X-MS-Office365-Filtering-Correlation-Id: 311779a6-0f6b-403c-e3d4-08daef3e9308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jp/X8/wtrc5NSKIl/ajTaAKh0kT+2GHFbY74OWU3Di2PQjnWMbwTXbtleaQohjSowKXR2j03f1IxRa9MGRXzPUbOyrodA9LlH24lVnSxYPTgPUMjnxbmSzWGnnLycdqQH9gNHKJWQC8MgTKXepnRrvtDI8JXvWQ628s3atWvAfy4Jt3uP6tTwB5xNe/oLOjY/MfQZB8v9srEBuumZnsHaA+9k1Eg8gI9+flzr8CgNaAHgi5AeHnZOxGKeL923MJNO7h68GwwKo1svOcdUSH4iXtzUhwWx/kawOu6V7O8+D8KYOYH8opS9LFq5r9xu559nLnBd6zWHvuPrakC9+0bzEEPFNw43Q8Xx5+KgN/hhGomort2YHFaNAuXm5Dfa/LhrvTePoREMtH0t6PCalSvEfkmdzmuJJWIOeJ4ZlwxgmDVzfJTphmn356e0j6KH0Nfk75ayv+zV0/H3joC6QfBTj7tB6IomHHc7iYqD0nmLEVmEhmYy+5fsfvKR38SoCc1aTwcumiOhGCZb8G4INK+WWK+FPjweipnP51icPLfzL3utsS55bGDGs+lUxDhLyYMbmKTOsbmryx5zNkcB+F+0dFxvNNokO4gA23x7bdbn5UdvJmMBR13qEpF9oqFZUzvlO7uKKsI/jYcTtYAkuJmLgkHyp+MvW5aX0qfEV4ZcCd6phGAn6F8z1OwYZZejaN989PWe69ELt7yg/xDBNr3X/J/Dkztc3WGXeEwCkAIVR6KgoKdQBT1xR6b97h/YrfB
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(36840700001)(40470700004)(46966006)(44832011)(70586007)(5660300002)(54906003)(8676002)(316002)(2906002)(41300700001)(70206006)(4326008)(8936002)(478600001)(36756003)(36860700001)(6666004)(82310400005)(7696005)(110136005)(426003)(81166007)(2616005)(186003)(47076005)(16526019)(1076003)(83380400001)(86362001)(336012)(40480700001)(356005)(82740400003)(26005)(40460700003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:05.9721 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 311779a6-0f6b-403c-e3d4-08daef3e9308
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5498
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

Simplifies the code so that all SDMA versions will get the firmware
name from `amdgpu_ucode_ip_version_decode`.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 12 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h |  4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 47 +-------------------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   | 30 +------------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   | 55 +-----------------------
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   | 25 +----------
 6 files changed, 17 insertions(+), 156 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index a6a491569022..95e9450f3348 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -200,15 +200,21 @@ void amdgpu_sdma_destroy_inst_ctx(struct amdgpu_device *adev,
 }
 
 int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
-			       char *fw_name, u32 instance,
-			       bool duplicate)
+			       u32 instance, bool duplicate)
 {
 	struct amdgpu_firmware_info *info = NULL;
 	const struct common_firmware_header *header = NULL;
 	int err = 0, i;
 	const struct sdma_firmware_header_v2_0 *sdma_hdr;
 	uint16_t version_major;
-
+	char ucode_prefix[30];
+	char fw_name[40];
+
+	amdgpu_ucode_ip_version_decode(adev, SDMA0_HWIP, ucode_prefix, sizeof(ucode_prefix));
+	if (instance == 0)
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
+	else
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s%d.bin", ucode_prefix, i);
 	err = amdgpu_ucode_request(adev, &adev->sdma.instance[instance].fw, fw_name);
 	if (err)
 		goto out;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
index 7d99205c2e01..2d16e6d36728 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
@@ -124,8 +124,8 @@ int amdgpu_sdma_process_ras_data_cb(struct amdgpu_device *adev,
 int amdgpu_sdma_process_ecc_irq(struct amdgpu_device *adev,
 				      struct amdgpu_irq_src *source,
 				      struct amdgpu_iv_entry *entry);
-int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
-        char *fw_name, u32 instance, bool duplicate);
+int amdgpu_sdma_init_microcode(struct amdgpu_device *adev, u32 instance,
+			       bool duplicate);
 void amdgpu_sdma_destroy_inst_ctx(struct amdgpu_device *adev,
         bool duplicate);
 void amdgpu_sdma_unset_buffer_funcs_helper(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 4d780e4430e7..017ae298558e 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -575,60 +575,17 @@ static void sdma_v4_0_setup_ulv(struct amdgpu_device *adev)
 // vega10 real chip need to use PSP to load firmware
 static int sdma_v4_0_init_microcode(struct amdgpu_device *adev)
 {
-	const char *chip_name;
-	char fw_name[30];
 	int ret, i;
 
-	DRM_DEBUG("\n");
-
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
-	case IP_VERSION(4, 0, 0):
-		chip_name = "vega10";
-		break;
-	case IP_VERSION(4, 0, 1):
-		chip_name = "vega12";
-		break;
-	case IP_VERSION(4, 2, 0):
-		chip_name = "vega20";
-		break;
-	case IP_VERSION(4, 1, 0):
-	case IP_VERSION(4, 1, 1):
-		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
-			chip_name = "raven2";
-		else if (adev->apu_flags & AMD_APU_IS_PICASSO)
-			chip_name = "picasso";
-		else
-			chip_name = "raven";
-		break;
-	case IP_VERSION(4, 2, 2):
-		chip_name = "arcturus";
-		break;
-	case IP_VERSION(4, 1, 2):
-		if (adev->apu_flags & AMD_APU_IS_RENOIR)
-			chip_name = "renoir";
-		else
-			chip_name = "green_sardine";
-		break;
-	case IP_VERSION(4, 4, 0):
-		chip_name = "aldebaran";
-		break;
-	default:
-		BUG();
-	}
-
 	for (i = 0; i < adev->sdma.num_instances; i++) {
-		if (i == 0)
-			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma.bin", chip_name);
-		else
-			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma%d.bin", chip_name, i);
 		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 2) ||
                     adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 4, 0)) {
 			/* Acturus & Aldebaran will leverage the same FW memory
 			   for every SDMA instance */
-			ret = amdgpu_sdma_init_microcode(adev, fw_name, 0, true);
+			ret = amdgpu_sdma_init_microcode(adev, 0, true);
 			break;
 		} else {
-			ret = amdgpu_sdma_init_microcode(adev, fw_name, i, false);
+			ret = amdgpu_sdma_init_microcode(adev, i, false);
 			if (ret)
 				return ret;
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index d4d9f196db83..1941b3b7c5d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -237,39 +237,13 @@ static void sdma_v5_0_init_golden_registers(struct amdgpu_device *adev)
 // emulation only, won't work on real chip
 // navi10 real chip need to use PSP to load firmware
 static int sdma_v5_0_init_microcode(struct amdgpu_device *adev)
-{
-	const char *chip_name;
-	char fw_name[40];
-	int ret, i;
+{	int ret, i;
 
 	if (amdgpu_sriov_vf(adev) && (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(5, 0, 5)))
 		return 0;
 
-	DRM_DEBUG("\n");
-
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
-	case IP_VERSION(5, 0, 0):
-		chip_name = "navi10";
-		break;
-	case IP_VERSION(5, 0, 2):
-		chip_name = "navi14";
-		break;
-	case IP_VERSION(5, 0, 5):
-		chip_name = "navi12";
-		break;
-	case IP_VERSION(5, 0, 1):
-		chip_name = "cyan_skillfish2";
-		break;
-	default:
-		BUG();
-	}
-
 	for (i = 0; i < adev->sdma.num_instances; i++) {
-		if (i == 0)
-			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma.bin", chip_name);
-		else
-			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma1.bin", chip_name);
-		ret = amdgpu_sdma_init_microcode(adev, fw_name, i, false);
+		ret = amdgpu_sdma_init_microcode(adev, i, false);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 65e7a710298d..8e445eb9dd49 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -89,59 +89,6 @@ static u32 sdma_v5_2_get_reg_offset(struct amdgpu_device *adev, u32 instance, u3
 	return base + internal_offset;
 }
 
-/**
- * sdma_v5_2_init_microcode - load ucode images from disk
- *
- * @adev: amdgpu_device pointer
- *
- * Use the firmware interface to load the ucode images into
- * the driver (not loaded into hw).
- * Returns 0 on success, error on failure.
- */
-
-// emulation only, won't work on real chip
-// navi10 real chip need to use PSP to load firmware
-static int sdma_v5_2_init_microcode(struct amdgpu_device *adev)
-{
-	const char *chip_name;
-	char fw_name[40];
-
-	DRM_DEBUG("\n");
-
-	switch (adev->ip_versions[SDMA0_HWIP][0]) {
-	case IP_VERSION(5, 2, 0):
-		chip_name = "sienna_cichlid_sdma";
-		break;
-	case IP_VERSION(5, 2, 2):
-		chip_name = "navy_flounder_sdma";
-		break;
-	case IP_VERSION(5, 2, 1):
-		chip_name = "vangogh_sdma";
-		break;
-	case IP_VERSION(5, 2, 4):
-		chip_name = "dimgrey_cavefish_sdma";
-		break;
-	case IP_VERSION(5, 2, 5):
-		chip_name = "beige_goby_sdma";
-		break;
-	case IP_VERSION(5, 2, 3):
-		chip_name = "yellow_carp_sdma";
-		break;
-	case IP_VERSION(5, 2, 6):
-		chip_name = "sdma_5_2_6";
-		break;
-	case IP_VERSION(5, 2, 7):
-		chip_name = "sdma_5_2_7";
-		break;
-	default:
-		BUG();
-	}
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", chip_name);
-
-	return amdgpu_sdma_init_microcode(adev, fw_name, 0, true);
-}
-
 static unsigned sdma_v5_2_ring_init_cond_exec(struct amdgpu_ring *ring)
 {
 	unsigned ret;
@@ -1288,7 +1235,7 @@ static int sdma_v5_2_sw_init(void *handle)
 			return r;
 	}
 
-	r = sdma_v5_2_init_microcode(adev);
+	r = amdgpu_sdma_init_microcode(adev, 0, true);
 	if (r) {
 		DRM_ERROR("Failed to load sdma firmware!\n");
 		return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 049c26a45d85..bf1fa5e8d2f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -78,29 +78,6 @@ static u32 sdma_v6_0_get_reg_offset(struct amdgpu_device *adev, u32 instance, u3
 	return base + internal_offset;
 }
 
-/**
- * sdma_v6_0_init_microcode - load ucode images from disk
- *
- * @adev: amdgpu_device pointer
- *
- * Use the firmware interface to load the ucode images into
- * the driver (not loaded into hw).
- * Returns 0 on success, error on failure.
- */
-static int sdma_v6_0_init_microcode(struct amdgpu_device *adev)
-{
-	char fw_name[30];
-	char ucode_prefix[30];
-
-	DRM_DEBUG("\n");
-
-	amdgpu_ucode_ip_version_decode(adev, SDMA0_HWIP, ucode_prefix, sizeof(ucode_prefix));
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
-
-	return amdgpu_sdma_init_microcode(adev, fw_name, 0, true);
-}
-
 static unsigned sdma_v6_0_ring_init_cond_exec(struct amdgpu_ring *ring)
 {
 	unsigned ret;
@@ -1260,7 +1237,7 @@ static int sdma_v6_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	r = sdma_v6_0_init_microcode(adev);
+	r = amdgpu_sdma_init_microcode(adev, 0, true);
 	if (r) {
 		DRM_ERROR("Failed to load sdma firmware!\n");
 		return r;
-- 
2.34.1

