Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC606594E2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 06:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EDC10E0B0;
	Fri, 30 Dec 2022 05:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D24D10E059;
 Fri, 30 Dec 2022 05:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nN0Gpw0KvG7iN3DokHsmfzh6WHSBIImac/XdS2VNiZrSz8rNmGQhT98qE8S+5vWh6n+y0gSBwxkxKG7aY+sZmJScBUrNJvm1co7r0TyshqSeLcA0Sk/zzMxj06aKK2jYyPHPjiLIOpLQg2oq279A7S9m7zkf/P4gd0VqDx29eFkWCg4ke9Uf6cQrVRPRn9mhl0xgqdVXrCG64/FcDYyeQRMejxK+w7qkopYSB8iUJPxwkg4D81SnN52x5NUhyyF7SF52taaK9xQXdXObGwuky1I5zT6bJgsUFV966SNGG4qTXrv3AR6k/MsEhaypuPOuvKiAJR1//dFu4UgQZl8lvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdXJyOsWuiZ/m2SwFc/DlH2uI3PLQkTXEWh7qCehFgw=;
 b=ebLcy1rIn8p9I+AcF685Bmfto3rocsme0Yd6ay/Mz8kbgr13aH5BDXcWOFbGfFpEYyaVhb8N1KCJgj5FJUFWUUJCJqPJK3MOEdr3W3EpOrF7wUsEbIZewD2vHOFiGspFSDlBUEwz5Nv78kXGqpLKEc01nJra9U2kwwmhBQAd1UsmXDaFSA8XIZbOT+T1+YNnFeVcuK57TGDsIpF+rVE2X0pMQt9ZMMWBkJiFijAGJzgeaOzgtgeOxQDw4TEnJ5eAUprK1Cr3YcPE/f4cdIT9Vk+EagAKrojWivhX5j0RWR+eZsEyxwx2Qr0u3Ynn6pclAhw0TkQdvSmNic1adEt2bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdXJyOsWuiZ/m2SwFc/DlH2uI3PLQkTXEWh7qCehFgw=;
 b=gpFKx/dM1zc3GBnMsXnLDlH+DcehOqSfNXq5Cdhjd/5nOMa5LwfDojwLOI+wWuvqgwO2G7ln7QiKbfPuvsbL23hfqnYZH4EiWiXHJwouM2acgxSj4u0LikjGQF+kRCJgSxFes7K0cPLJP3YaX6VAUxLUUttqeye3CbyzB4IWSkE=
Received: from MW4PR04CA0278.namprd04.prod.outlook.com (2603:10b6:303:89::13)
 by IA0PR12MB8303.namprd12.prod.outlook.com (2603:10b6:208:3de::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 05:21:43 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::35) by MW4PR04CA0278.outlook.office365.com
 (2603:10b6:303:89::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.18 via Frontend
 Transport; Fri, 30 Dec 2022 05:21:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.6 via Frontend Transport; Fri, 30 Dec 2022 05:21:42 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 29 Dec
 2022 23:21:41 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 05/11] drm/amd: Request SDMA microcode during IP discovery
Date: Thu, 29 Dec 2022 23:21:09 -0600
Message-ID: <20221230052119.15096-6-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT043:EE_|IA0PR12MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: 1150b773-e1f9-41a8-739b-08daea25bcf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fb5JbrIaoPfFThCWi6Qm9oHxH8VwdlBw8wym+Jsee6tVcmtYWIPjTVbvWw9EvuFV0DEO3msTAy85jB3ueA+z3sbLKEBKQrmEg9RCVb0b7BM1XOViaSHqompISMTwADZtQRnvxhGKfTzfu81V9ZtvG8bV7GlO/M8XbSC6O/1/sWwC11Gh6evPifokZBNDY8bhSYb+Tiu+sLr7T4K6lrOLqxsWKIG3EVYYuoG7dt0cAkwOVBCllgJg1XWstdMgIwu3CY0sToW+8WKOumjiVpbRbWi5shY+SuPUotUss30tEafJ2eHVE0QeWyuhi9iLlkw002XM95sGuoOwce3VCQQyjeSovJdP97Ut5jTJ91sU9l6Hv9MLs6Cc+IWAlMx5+n8DRRikPFgfshI9sFVYrRGKarkq0RWiUdRkI2xIzsnx/h7mV6vxN+Knv4uUBT9Ys+wwnw3FYYCFND3MkZB/1NfbEFxzD7ptfDtuXEpFPU+Y4MbpjWN6/r181bYMdAV+FcDmaJro0JxTtKvT+/pDd8/bnrMIOUNHSqH61+5oQSHK7l4L8M7V3tL6FKgaGFY2ctIQT0B++2LRChgyQBlkRuIusREluzFRR1Oc6iez+ToNsrvXbO0TXxWvbKAEapTE+vnmoZmeegnovyyLKPA0R6zuy5DKNR0geJ9QJlKlpZmoNndeTZd55guvdd48JLD66AN93UxqZMrbfVcjTfTFK87bzPi7UgfQLpOyoJ/8abma1zY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(40480700001)(356005)(16526019)(40460700003)(110136005)(86362001)(36756003)(6666004)(54906003)(316002)(478600001)(5660300002)(30864003)(44832011)(8936002)(2906002)(70586007)(4326008)(70206006)(8676002)(36860700001)(41300700001)(83380400001)(47076005)(82740400003)(81166007)(1076003)(336012)(82310400005)(7696005)(2616005)(26005)(186003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 05:21:42.9610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1150b773-e1f9-41a8-739b-08daea25bcf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8303
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

If SDMA microcode is not available during early init, the firmware
framebuffer will have already been released and the screen will
freeze.

Move the request from SDMA microcode into the IP discovery phase
so that if it's not available, IP discovery will fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2->v3:
 * Fix dGPU naming scheme
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
index b719852daa07..24d54ab0963a 100644
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
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s1.bin", chip_name);
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
index 7d99205c2e01..07b375e89e83 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
@@ -125,7 +125,7 @@ int amdgpu_sdma_process_ecc_irq(struct amdgpu_device *adev,
 				      struct amdgpu_irq_src *source,
 				      struct amdgpu_iv_entry *entry);
 int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
-        char *fw_name, u32 instance, bool duplicate);
+	u32 instance, bool duplicate);
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

