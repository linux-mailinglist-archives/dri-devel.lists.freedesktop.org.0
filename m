Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1766581F0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723B210E3CD;
	Wed, 28 Dec 2022 16:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF67D10E3B8;
 Wed, 28 Dec 2022 16:31:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jom5KIotJ1O6kQlbhZyYQoxHCuJVXetvkrtmUbl7bJbM4JJRPXd0r7iT0n1fwV2LCmGTdCh4YWQ0HEtlvH28QEs9XmH7vkZWgfWyIhwwWYK8OSmQ3IqytSXV0zkkLcHNWI0fFzEYpXIOymE85FzX23xh1YL7n2V/RNypxFmSavDjwRaNJ8CeueUm80IQRMcv1d0/pb78kx1faOyHXmE+ZXl6PmPEIXDB2iZHDlv+vG1kyuZfzfPqCDwRUzlgRLrm2Bk5S5x/4/6M5GlC7jO7ZQjr2li0yRFP6lK2JoHtAwaNGTh7GGKIlGBOvMSNV4fRQAT1ixhdLw1CCLDhj7zLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ebn+aI+4Yszd8aE4vVGjyfkUceSR7dXvQIKUPM4NHQk=;
 b=jTDUkwOzIjXOsVZu0JuVf47CGLWiHEJ5P5YFzLnmwuZ9PE4rFft45hWvkkoZMC+P1WChXDX08dAUm1IYmO9nM5day0pTnf5veLUX9Cdnfw1VwYD3NyfCt82qx5IXa5bCMQBp4d5pjAjwvkrFBpYZ6rE+xv+bJY8350O8z/6e/Nq2P3BHeRg/9BqdqKRHcGSKbW8/P3CvGJSVzXo/vouNC2nQQNxFiDwuFwVwlKICCfW60vo7oEBPc/SRXV5+/TmH8u+E/uyuwoxBTl2SUWkeUHyuR5odTk/M3kWXlgFBmX5bieTSWaaHAl3r7kEtlTkWvPlQE82dfzTFEAQflirfTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ebn+aI+4Yszd8aE4vVGjyfkUceSR7dXvQIKUPM4NHQk=;
 b=XkyaWXPyQxtPqdEgFR3WiTOHGD4VjY9n/JBkePqn7Rlbj/vDuGuxfpeexWpH1vxmSyDw3CjA/q6dhI2+VnpDPAGADNqwCEY5oJMgX1bFqmn5QG6dN6aKxS1cfoOTWJOb6tKx08ZH3jZWECYVz3DutDut/tlbbY92Ndq5OzEDI1Q=
Received: from MW2PR2101CA0009.namprd21.prod.outlook.com (2603:10b6:302:1::22)
 by DM6PR12MB4532.namprd12.prod.outlook.com (2603:10b6:5:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 16:31:21 +0000
Received: from CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::5e) by MW2PR2101CA0009.outlook.office365.com
 (2603:10b6:302:1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.7 via Frontend
 Transport; Wed, 28 Dec 2022 16:31:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT076.mail.protection.outlook.com (10.13.174.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.16 via Frontend Transport; Wed, 28 Dec 2022 16:31:20 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 28 Dec
 2022 10:31:19 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Javier Martinez Canillas <javierm@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 05/11] drm/amd: Request SDMA microcode during IP discovery
Date: Wed, 28 Dec 2022 10:30:52 -0600
Message-ID: <20221228163102.468-6-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT076:EE_|DM6PR12MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: 8502b2ea-c389-41c2-6dc4-08dae8f0f40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sgHpfhsAHHNGpyLrgJ32TWecur1/M86rE0gOw0c9qLNSuF3oDvMyogRkXTanIn30kKrenqeqq3ijuI91l8KYcQGnuiivxOYsHC0ANVAeIxY2NkcrzLMK+E1nfSxdU5fMDONl1uJUIAYzMrTgfPNs3sSulsfagkODkrflvWNyykcM8uBa+gTCwY9wODraL7NFCIJHlu71K2FCFxE+Zwu3hB6ebwph1RtgADYkyyW4Y545khpxyuhWutVRKtssPO7vUaUULUKYT2vsKQZgqujbc7JIYzlPoHrNp2eND5M5C6wEPgvlKldZufy9hKVggeKDA02toRxQ4Y4JYh8gzPEXxnq5LAwbdNW1Vzkd8h04Y0pzoOi0IgoM2AhUIjmFu0W3mB5ndaYGQHZl5jbX3Lmo34KPN/dblRMXZQeJQpHeaiMhaelxEkngb31Ss0gjqKfHNvngdci4zZWEJdH9ByDTdJ+GEJAwBG6vuY2FQTNO6MZ98onTQ0qMvl13jwmQxAVrzXwsyIOoCCLQbn1y2MGHrMxT9MCzHtcUruai4C9AQ4zThUiov0Xc01NOv0moyISYF/ZtR6rWykl+vuOa4rLnYCkZE+Eyei+iSiRemhVfcyZ0jJidg7ijS7as4TdRzf8M3gOkwSVEsIx4RNkZQlpTgFj3z2BkhahJT4lC53TxxZqo/sPfe3qriri6jkQ/ZeqWDp1Zav+96Dlo4BtiSFfoZuU7rp0oUr/Uscr6qCvHsxU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(82310400005)(36756003)(2906002)(44832011)(40480700001)(30864003)(8936002)(5660300002)(41300700001)(4326008)(8676002)(70206006)(70586007)(86362001)(82740400003)(54906003)(81166007)(7696005)(336012)(316002)(110136005)(356005)(36860700001)(478600001)(83380400001)(426003)(6666004)(40460700003)(186003)(47076005)(2616005)(1076003)(26005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 16:31:20.9074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8502b2ea-c389-41c2-6dc4-08dae8f0f40f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4532
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

If SDMA microcode is not available during early init, the microcode
framebuffer will have already been released and the screen will
freeze.

Move the request from SDMA microcode into the IP discovery phase
so that if it's not available, IP discovery will fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 57 ++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c      |  9 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h      |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        | 61 +----------------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        | 42 +-----------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        | 65 +------------------
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        | 30 +--------
 7 files changed, 66 insertions(+), 200 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index b719852daa07..f51ff86293b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -90,6 +90,40 @@ MODULE_FIRMWARE(FIRMWARE_IP_DISCOVERY);
 #define mmMM_INDEX_HI		0x6
 #define mmMM_DATA		0x1
 
+MODULE_FIRMWARE("amdgpu/navi10_sdma.bin");
+MODULE_FIRMWARE("amdgpu/navi10_sdma1.bin");
+MODULE_FIRMWARE("amdgpu/navi14_sdma.bin");
+MODULE_FIRMWARE("amdgpu/navi14_sdma1.bin");
+MODULE_FIRMWARE("amdgpu/navi12_sdma.bin");
+MODULE_FIRMWARE("amdgpu/navi12_sdma1.bin");
+MODULE_FIRMWARE("amdgpu/cyan_skillfish2_sdma.bin");
+MODULE_FIRMWARE("amdgpu/cyan_skillfish2_sdma1.bin");
+MODULE_FIRMWARE("amdgpu/vega10_sdma.bin");
+MODULE_FIRMWARE("amdgpu/vega10_sdma1.bin");
+MODULE_FIRMWARE("amdgpu/vega12_sdma.bin");
+MODULE_FIRMWARE("amdgpu/vega12_sdma1.bin");
+MODULE_FIRMWARE("amdgpu/vega20_sdma.bin");
+MODULE_FIRMWARE("amdgpu/vega20_sdma1.bin");
+MODULE_FIRMWARE("amdgpu/raven_sdma.bin");
+MODULE_FIRMWARE("amdgpu/picasso_sdma.bin");
+MODULE_FIRMWARE("amdgpu/raven2_sdma.bin");
+MODULE_FIRMWARE("amdgpu/arcturus_sdma.bin");
+MODULE_FIRMWARE("amdgpu/renoir_sdma.bin");
+MODULE_FIRMWARE("amdgpu/green_sardine_sdma.bin");
+MODULE_FIRMWARE("amdgpu/aldebaran_sdma.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_sdma.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_sdma.bin");
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_sdma.bin");
+MODULE_FIRMWARE("amdgpu/beige_goby_sdma.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_sdma.bin");
+MODULE_FIRMWARE("amdgpu/yellow_carp_sdma.bin");
+MODULE_FIRMWARE("amdgpu/sdma_5_2_6.bin");
+MODULE_FIRMWARE("amdgpu/sdma_5_2_7.bin");
+MODULE_FIRMWARE("amdgpu/sdma_6_0_0.bin");
+MODULE_FIRMWARE("amdgpu/sdma_6_0_1.bin");
+MODULE_FIRMWARE("amdgpu/sdma_6_0_2.bin");
+MODULE_FIRMWARE("amdgpu/sdma_6_0_3.bin");
+
 static const char *hw_id_names[HW_ID_MAX] = {
 	[MP1_HWID]		= "MP1",
 	[MP2_HWID]		= "MP2",
@@ -1821,8 +1855,26 @@ static int amdgpu_discovery_set_gc_ip_blocks(struct amdgpu_device *adev)
 	return 0;
 }
 
+static int amdgpu_discovery_load_sdma_fw(struct amdgpu_device *adev, u32 instance,
+					 const char *chip_name)
+{
+	char fw_name[40];
+
+	if (instance == 0)
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", chip_name);
+	else
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma1.bin", chip_name);
+
+	return request_firmware(&adev->sdma.instance[instance].fw, fw_name, adev->dev);
+}
+
 static int amdgpu_discovery_set_sdma_ip_blocks(struct amdgpu_device *adev)
 {
+	char ucode_prefix[30];
+	int i, r;
+
+	amdgpu_ucode_ip_version_decode(adev, SDMA0_HWIP, ucode_prefix, sizeof(ucode_prefix));
+
 	switch (adev->ip_versions[SDMA0_HWIP][0]) {
 	case IP_VERSION(4, 0, 0):
 	case IP_VERSION(4, 0, 1):
@@ -1862,6 +1914,11 @@ static int amdgpu_discovery_set_sdma_ip_blocks(struct amdgpu_device *adev)
 			adev->ip_versions[SDMA0_HWIP][0]);
 		return -EINVAL;
 	}
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		r = amdgpu_discovery_load_sdma_fw(adev, i, ucode_prefix);
+		if (r)
+			return r;
+	}
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index ea5278f094c0..9e46d8034c03 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -205,8 +205,7 @@ void amdgpu_sdma_destroy_inst_ctx(struct amdgpu_device *adev,
 }
 
 int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
-			       char *fw_name, u32 instance,
-			       bool duplicate)
+			       u32 instance, bool duplicate)
 {
 	struct amdgpu_firmware_info *info = NULL;
 	const struct common_firmware_header *header = NULL;
@@ -214,10 +213,6 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
 	const struct sdma_firmware_header_v2_0 *sdma_hdr;
 	uint16_t version_major;
 
-	err = request_firmware(&adev->sdma.instance[instance].fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
 	header = (const struct common_firmware_header *)
 		adev->sdma.instance[instance].fw->data;
 	version_major = le16_to_cpu(header->header_version_major);
@@ -280,7 +275,7 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
 
 out:
 	if (err) {
-		DRM_ERROR("SDMA: Failed to init firmware \"%s\"\n", fw_name);
+		DRM_ERROR("SDMA: Failed to init sdma firmware\n");
 		amdgpu_sdma_destroy_inst_ctx(adev, duplicate);
 	}
 	return err;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
index 7d99205c2e01..fa06681b97c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
@@ -125,7 +125,7 @@ int amdgpu_sdma_process_ecc_irq(struct amdgpu_device *adev,
 				      struct amdgpu_irq_src *source,
 				      struct amdgpu_iv_entry *entry);
 int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
-        char *fw_name, u32 instance, bool duplicate);
+        u32 instance, bool duplicate);
 void amdgpu_sdma_destroy_inst_ctx(struct amdgpu_device *adev,
         bool duplicate);
 void amdgpu_sdma_unset_buffer_funcs_helper(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 4d780e4430e7..bbaee1cfc92d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -58,20 +58,6 @@
 #include "amdgpu_ras.h"
 #include "sdma_v4_4.h"
 
-MODULE_FIRMWARE("amdgpu/vega10_sdma.bin");
-MODULE_FIRMWARE("amdgpu/vega10_sdma1.bin");
-MODULE_FIRMWARE("amdgpu/vega12_sdma.bin");
-MODULE_FIRMWARE("amdgpu/vega12_sdma1.bin");
-MODULE_FIRMWARE("amdgpu/vega20_sdma.bin");
-MODULE_FIRMWARE("amdgpu/vega20_sdma1.bin");
-MODULE_FIRMWARE("amdgpu/raven_sdma.bin");
-MODULE_FIRMWARE("amdgpu/picasso_sdma.bin");
-MODULE_FIRMWARE("amdgpu/raven2_sdma.bin");
-MODULE_FIRMWARE("amdgpu/arcturus_sdma.bin");
-MODULE_FIRMWARE("amdgpu/renoir_sdma.bin");
-MODULE_FIRMWARE("amdgpu/green_sardine_sdma.bin");
-MODULE_FIRMWARE("amdgpu/aldebaran_sdma.bin");
-
 #define SDMA0_POWER_CNTL__ON_OFF_CONDITION_HOLD_TIME_MASK  0x000000F8L
 #define SDMA0_POWER_CNTL__ON_OFF_STATUS_DURATION_TIME_MASK 0xFC000000L
 
@@ -575,60 +561,17 @@ static void sdma_v4_0_setup_ulv(struct amdgpu_device *adev)
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
index d4d9f196db83..4154b511ae94 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -42,18 +42,6 @@
 #include "sdma_common.h"
 #include "sdma_v5_0.h"
 
-MODULE_FIRMWARE("amdgpu/navi10_sdma.bin");
-MODULE_FIRMWARE("amdgpu/navi10_sdma1.bin");
-
-MODULE_FIRMWARE("amdgpu/navi14_sdma.bin");
-MODULE_FIRMWARE("amdgpu/navi14_sdma1.bin");
-
-MODULE_FIRMWARE("amdgpu/navi12_sdma.bin");
-MODULE_FIRMWARE("amdgpu/navi12_sdma1.bin");
-
-MODULE_FIRMWARE("amdgpu/cyan_skillfish2_sdma.bin");
-MODULE_FIRMWARE("amdgpu/cyan_skillfish2_sdma1.bin");
-
 #define SDMA1_REG_OFFSET 0x600
 #define SDMA0_HYP_DEC_REG_START 0x5880
 #define SDMA0_HYP_DEC_REG_END 0x5893
@@ -237,39 +225,13 @@ static void sdma_v5_0_init_golden_registers(struct amdgpu_device *adev)
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
index 65e7a710298d..4757c119cdfe 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -44,16 +44,6 @@
 #include "sdma_common.h"
 #include "sdma_v5_2.h"
 
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_sdma.bin");
-MODULE_FIRMWARE("amdgpu/navy_flounder_sdma.bin");
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_sdma.bin");
-MODULE_FIRMWARE("amdgpu/beige_goby_sdma.bin");
-
-MODULE_FIRMWARE("amdgpu/vangogh_sdma.bin");
-MODULE_FIRMWARE("amdgpu/yellow_carp_sdma.bin");
-MODULE_FIRMWARE("amdgpu/sdma_5_2_6.bin");
-MODULE_FIRMWARE("amdgpu/sdma_5_2_7.bin");
-
 #define SDMA1_REG_OFFSET 0x600
 #define SDMA3_REG_OFFSET 0x400
 #define SDMA0_HYP_DEC_REG_START 0x5880
@@ -89,59 +79,6 @@ static u32 sdma_v5_2_get_reg_offset(struct amdgpu_device *adev, u32 instance, u3
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
@@ -1288,7 +1225,7 @@ static int sdma_v5_2_sw_init(void *handle)
 			return r;
 	}
 
-	r = sdma_v5_2_init_microcode(adev);
+	r = amdgpu_sdma_init_microcode(adev, 0, true);
 	if (r) {
 		DRM_ERROR("Failed to load sdma firmware!\n");
 		return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 049c26a45d85..9c65e2f98d44 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -44,11 +44,6 @@
 #include "sdma_v6_0.h"
 #include "v11_structs.h"
 
-MODULE_FIRMWARE("amdgpu/sdma_6_0_0.bin");
-MODULE_FIRMWARE("amdgpu/sdma_6_0_1.bin");
-MODULE_FIRMWARE("amdgpu/sdma_6_0_2.bin");
-MODULE_FIRMWARE("amdgpu/sdma_6_0_3.bin");
-
 #define SDMA1_REG_OFFSET 0x600
 #define SDMA0_HYP_DEC_REG_START 0x5880
 #define SDMA0_HYP_DEC_REG_END 0x589a
@@ -78,29 +73,6 @@ static u32 sdma_v6_0_get_reg_offset(struct amdgpu_device *adev, u32 instance, u3
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
@@ -1260,7 +1232,7 @@ static int sdma_v6_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	r = sdma_v6_0_init_microcode(adev);
+	r = amdgpu_sdma_init_microcode(adev, 0, true);
 	if (r) {
 		DRM_ERROR("Failed to load sdma firmware!\n");
 		return r;
-- 
2.34.1

