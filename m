Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D3D6581F9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FEC10E3D1;
	Wed, 28 Dec 2022 16:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC7C10E3CA;
 Wed, 28 Dec 2022 16:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gH6hu46fNBVI4uVPse4yl9SZuiDArBoJzH/H+m8BysD7h+S47k7S1hYH+lOAujJrCEFtSqaMVHYX0YdM1cnvWn42u99hjU9tkAhud3/jmDngj0c62KSheU+1tphGfcz6GUtq09LhhOJ0pq37jEXoQHbEHzOYAkhfhEqXXNNEn5aKpPAjjl9348Au0U/6M2p0rKaSFcQx8uu7eJBJhv37lvjkAEiST5FL9VSY4YM2y4+E/6RSCttHtILK1ATbV6zyWWTmwcQo4gn8130ERoXqSaJAuYskdI+LB0bR2wmCUeiLGCKayuC4rrLW2anwZeUNY5tjkVt/UOHYJadFce5JCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHWcBPd4UkEC7tl5tACMUZaI9Ejm2CGeGCHidjmBtM0=;
 b=a3MeuROw/QutLnsU67eE4zqEgCe5y+GplYTTBV2+Uqux6qjjz1O+o3VKvL8L5l50RQKRNfZhjKH5ClpULajvM4ElIJO2l24EY/CjyZCLp6mRzPCg4c/y4D92Ap6jCoZQf6mfq5VoqhM2c3b/LWv6YLdRz/m2iaxgkhLRqIdOrg7/l+KDqTEayTCddSzD7JydAUTj7ZlLFgB1Dt+1sTLAuHkNDe0iyoUlwh/tff4xtOrjVTQfHDada6SHS5rBq22g0xeqJHVH54IbEBx5E3WhHSgE5gTaW+K5i4Gd37RAlC0aSnvU0Sxafnitd3s9+YrErj8+LdErLNraqMAhDMP4Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHWcBPd4UkEC7tl5tACMUZaI9Ejm2CGeGCHidjmBtM0=;
 b=rb3aMTwRhnxznk2brtIe4VfYOgQPBMq6qXZlj2NSWoXAJyqsn95j3fy6fgBv78i0p8a4WjBpNnI7KPCCeTvLw27g83rKA9WpiLkeqHYdcA5O4steHZBQ9LDMjbRnKqgBrh31yWlxzctdDNzGkUqjRKxs+6uTYTXAtmzWVytgE5M=
Received: from MW2PR2101CA0017.namprd21.prod.outlook.com (2603:10b6:302:1::30)
 by SJ2PR12MB8011.namprd12.prod.outlook.com (2603:10b6:a03:4c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 16:31:26 +0000
Received: from CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::19) by MW2PR2101CA0017.outlook.office365.com
 (2603:10b6:302:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.7 via Frontend
 Transport; Wed, 28 Dec 2022 16:31:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT076.mail.protection.outlook.com (10.13.174.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.16 via Frontend Transport; Wed, 28 Dec 2022 16:31:25 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 28 Dec
 2022 10:31:23 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Javier Martinez Canillas <javierm@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 08/11] drm/amd: Request GFX9 microcode during IP discovery
Date: Wed, 28 Dec 2022 10:30:55 -0600
Message-ID: <20221228163102.468-9-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT076:EE_|SJ2PR12MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: 5792695b-cfad-49cd-3fe9-08dae8f0f716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zFPpRiwzmIDuZBylZaW09w3TjASrRyezg3Vz+Cb6eFbWA5C7ArBlCnYBXW3AqtOTNHWnM5DQOv2RH+PsU/BcutovmeI+sp6SLaH0Ghx4QYeNxMG2BSr6Sb4quWDDH89StyuMyMSmak6sVZfueP9zpSUH/sM5KHDBxVkTvaC7o2nkAyumtI5KDhBy5EQ/r/qo99N/pe8fGlbLCoIIHtSdc9w/ShlhuD9NaBelMdoBQ3Q5vSN738UfESxk+6q3MXfQPMkZ3CIYLTMYQMNthBOuvBZqhLsZ+JF3+YuqupIUdmdbFtplzKvF9fav56r77s3jkUXjZfikzL38zR2FbO1Y5tzvr4djieR79F+drSP2AnH0OYhdAjn6E2dk/5BhwdWEx/RZR+Ihq/AAU2/Tv8ZiTH4fQIgfL8mH98K81P7D34ZnjmFFduzk2Wkxz0U2Nribxv7bC9rQd9xFZ3IFTM/nf6k4dkc07Mz3/uC1uR/FmgpFXz4mRbpiuXBgsj/ZqHkzjbW6SqcOLDI8PgRQ9v0Dp3IiSZ77OuC8YSXxm/VeuUH2Ti3QOO3wdWLvodcG3GY/SKqD3ElXgz2vpUQ5lkStBSrMvqAk85Fe2j6n2SOKaA0WS+uT96FiJkNUU3191aiAd3QBjbiROmvB/XNASRhYE0q4HPsUradNPhZ0CBL8POQ4ex2A3v/NXPjpgdzXFEdXSG4FphvSnmoHS4XJxCnXOm31ZcKQC76VwzhJmS7Utfw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(81166007)(82740400003)(356005)(83380400001)(36860700001)(4326008)(86362001)(8676002)(70586007)(70206006)(41300700001)(54906003)(110136005)(316002)(40480700001)(40460700003)(2906002)(5660300002)(8936002)(2616005)(1076003)(30864003)(44832011)(82310400005)(26005)(336012)(186003)(16526019)(47076005)(426003)(478600001)(6666004)(7696005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 16:31:25.9853 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5792695b-cfad-49cd-3fe9-08dae8f0f716
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8011
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

If GFX9 microcode is required but not available during early init, the
microcode framebuffer will have already been released and the screen will
freeze.

Move the request for GFX9 microcode into the IP discovery phase
so that if it's not available, IP discovery will fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 144 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         | 143 +----------------
 2 files changed, 152 insertions(+), 135 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 479266ed2b7f..0da16abd6b24 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -158,6 +158,68 @@ MODULE_FIRMWARE("amdgpu/gc_11_0_2_mes1.bin");
 MODULE_FIRMWARE("amdgpu/gc_11_0_3_mes.bin");
 MODULE_FIRMWARE("amdgpu/gc_11_0_3_mes1.bin");
 
+
+/* gfx9 */
+MODULE_FIRMWARE("amdgpu/vega10_ce.bin");
+MODULE_FIRMWARE("amdgpu/vega10_pfp.bin");
+MODULE_FIRMWARE("amdgpu/vega10_me.bin");
+MODULE_FIRMWARE("amdgpu/vega10_mec.bin");
+MODULE_FIRMWARE("amdgpu/vega10_mec2.bin");
+MODULE_FIRMWARE("amdgpu/vega10_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/vega12_ce.bin");
+MODULE_FIRMWARE("amdgpu/vega12_pfp.bin");
+MODULE_FIRMWARE("amdgpu/vega12_me.bin");
+MODULE_FIRMWARE("amdgpu/vega12_mec.bin");
+MODULE_FIRMWARE("amdgpu/vega12_mec2.bin");
+MODULE_FIRMWARE("amdgpu/vega12_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/vega20_ce.bin");
+MODULE_FIRMWARE("amdgpu/vega20_pfp.bin");
+MODULE_FIRMWARE("amdgpu/vega20_me.bin");
+MODULE_FIRMWARE("amdgpu/vega20_mec.bin");
+MODULE_FIRMWARE("amdgpu/vega20_mec2.bin");
+MODULE_FIRMWARE("amdgpu/vega20_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/raven_ce.bin");
+MODULE_FIRMWARE("amdgpu/raven_pfp.bin");
+MODULE_FIRMWARE("amdgpu/raven_me.bin");
+MODULE_FIRMWARE("amdgpu/raven_mec.bin");
+MODULE_FIRMWARE("amdgpu/raven_mec2.bin");
+MODULE_FIRMWARE("amdgpu/raven_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/picasso_ce.bin");
+MODULE_FIRMWARE("amdgpu/picasso_pfp.bin");
+MODULE_FIRMWARE("amdgpu/picasso_me.bin");
+MODULE_FIRMWARE("amdgpu/picasso_mec.bin");
+MODULE_FIRMWARE("amdgpu/picasso_mec2.bin");
+MODULE_FIRMWARE("amdgpu/picasso_rlc.bin");
+MODULE_FIRMWARE("amdgpu/picasso_rlc_am4.bin");
+
+MODULE_FIRMWARE("amdgpu/raven2_ce.bin");
+MODULE_FIRMWARE("amdgpu/raven2_pfp.bin");
+MODULE_FIRMWARE("amdgpu/raven2_me.bin");
+MODULE_FIRMWARE("amdgpu/raven2_mec.bin");
+MODULE_FIRMWARE("amdgpu/raven2_mec2.bin");
+MODULE_FIRMWARE("amdgpu/raven2_rlc.bin");
+MODULE_FIRMWARE("amdgpu/raven_kicker_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/arcturus_mec.bin");
+MODULE_FIRMWARE("amdgpu/arcturus_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/renoir_ce.bin");
+MODULE_FIRMWARE("amdgpu/renoir_pfp.bin");
+MODULE_FIRMWARE("amdgpu/renoir_me.bin");
+MODULE_FIRMWARE("amdgpu/renoir_mec.bin");
+MODULE_FIRMWARE("amdgpu/renoir_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/green_sardine_ce.bin");
+MODULE_FIRMWARE("amdgpu/green_sardine_pfp.bin");
+MODULE_FIRMWARE("amdgpu/green_sardine_me.bin");
+MODULE_FIRMWARE("amdgpu/green_sardine_mec.bin");
+MODULE_FIRMWARE("amdgpu/green_sardine_mec2.bin");
+MODULE_FIRMWARE("amdgpu/green_sardine_rlc.bin");
+
 static const char *hw_id_names[HW_ID_MAX] = {
 	[MP1_HWID]		= "MP1",
 	[MP2_HWID]		= "MP2",
@@ -1845,8 +1907,87 @@ static int amdgpu_discovery_set_display_ip_blocks(struct amdgpu_device *adev)
 	return 0;
 }
 
+static int amdgpu_discovery_load_gfx9(struct amdgpu_device *adev, char *ucode_prefix)
+{
+	uint32_t smu_version;
+	char fw_name[40];
+	int r;
+
+	/* No CPG in Arcturus */
+	if (adev->gfx.num_gfx_rings) {
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
+		r = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
+		if (r)
+			return r;
+
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
+		r = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
+		if (r)
+			return r;
+
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", ucode_prefix);
+		r = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
+		if (r)
+			return r;
+	}
+
+	if (amdgpu_sriov_vf(adev) && (adev->asic_type == CHIP_ALDEBARAN))
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sjt_mec.bin", ucode_prefix);
+	else
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
+	r = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+
+	/*
+	 * For Picasso && AM4 SOCKET board, we use picasso_rlc_am4.bin
+	 * instead of picasso_rlc.bin.
+	 * Judgment method:
+	 * PCO AM4: revision >= 0xC8 && revision <= 0xCF
+	 *          or revision >= 0xD8 && revision <= 0xDF
+	 * otherwise is PCO FP5
+	 */
+	if (!strcmp(ucode_prefix, "picasso") &&
+		(((adev->pdev->revision >= 0xC8) && (adev->pdev->revision <= 0xCF)) ||
+		((adev->pdev->revision >= 0xD8) && (adev->pdev->revision <= 0xDF))))
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc_am4.bin", ucode_prefix);
+	else if (!strcmp(ucode_prefix, "raven") && (amdgpu_pm_load_smu_firmware(adev, &smu_version) == 0) &&
+		(smu_version >= 0x41e2b))
+		/**
+		*SMC is loaded by SBIOS on APU and it's able to get the SMU version directly.
+		*/
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_kicker_rlc.bin", ucode_prefix);
+	else
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
+	r = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+
+	/* mec2 fw bin support */
+	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2) ||
+		adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1) ||
+		adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 3, 0)) {
+
+		if (amdgpu_sriov_vf(adev) && (adev->asic_type == CHIP_ALDEBARAN))
+			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sjt_mec2.bin", ucode_prefix);
+		else
+			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2.bin", ucode_prefix);
+
+		r = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
+		if (r)
+			return r;
+	}
+
+	return 0;
+}
+
 static int amdgpu_discovery_set_gc_ip_blocks(struct amdgpu_device *adev)
 {
+	char ucode_prefix[30];
+	int r;
+
+	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
+
 	switch (adev->ip_versions[GC_HWIP][0]) {
 	case IP_VERSION(9, 0, 1):
 	case IP_VERSION(9, 1, 0):
@@ -1856,6 +1997,9 @@ static int amdgpu_discovery_set_gc_ip_blocks(struct amdgpu_device *adev)
 	case IP_VERSION(9, 4, 0):
 	case IP_VERSION(9, 4, 1):
 	case IP_VERSION(9, 4, 2):
+		r = amdgpu_discovery_load_gfx9(adev, ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &gfx_v9_0_ip_block);
 		break;
 	case IP_VERSION(10, 1, 10):
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index f202b45c413c..3d6e6b7d461d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -65,72 +65,6 @@
 #define mmGCEA_PROBE_MAP                        0x070c
 #define mmGCEA_PROBE_MAP_BASE_IDX               0
 
-MODULE_FIRMWARE("amdgpu/vega10_ce.bin");
-MODULE_FIRMWARE("amdgpu/vega10_pfp.bin");
-MODULE_FIRMWARE("amdgpu/vega10_me.bin");
-MODULE_FIRMWARE("amdgpu/vega10_mec.bin");
-MODULE_FIRMWARE("amdgpu/vega10_mec2.bin");
-MODULE_FIRMWARE("amdgpu/vega10_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/vega12_ce.bin");
-MODULE_FIRMWARE("amdgpu/vega12_pfp.bin");
-MODULE_FIRMWARE("amdgpu/vega12_me.bin");
-MODULE_FIRMWARE("amdgpu/vega12_mec.bin");
-MODULE_FIRMWARE("amdgpu/vega12_mec2.bin");
-MODULE_FIRMWARE("amdgpu/vega12_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/vega20_ce.bin");
-MODULE_FIRMWARE("amdgpu/vega20_pfp.bin");
-MODULE_FIRMWARE("amdgpu/vega20_me.bin");
-MODULE_FIRMWARE("amdgpu/vega20_mec.bin");
-MODULE_FIRMWARE("amdgpu/vega20_mec2.bin");
-MODULE_FIRMWARE("amdgpu/vega20_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/raven_ce.bin");
-MODULE_FIRMWARE("amdgpu/raven_pfp.bin");
-MODULE_FIRMWARE("amdgpu/raven_me.bin");
-MODULE_FIRMWARE("amdgpu/raven_mec.bin");
-MODULE_FIRMWARE("amdgpu/raven_mec2.bin");
-MODULE_FIRMWARE("amdgpu/raven_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/picasso_ce.bin");
-MODULE_FIRMWARE("amdgpu/picasso_pfp.bin");
-MODULE_FIRMWARE("amdgpu/picasso_me.bin");
-MODULE_FIRMWARE("amdgpu/picasso_mec.bin");
-MODULE_FIRMWARE("amdgpu/picasso_mec2.bin");
-MODULE_FIRMWARE("amdgpu/picasso_rlc.bin");
-MODULE_FIRMWARE("amdgpu/picasso_rlc_am4.bin");
-
-MODULE_FIRMWARE("amdgpu/raven2_ce.bin");
-MODULE_FIRMWARE("amdgpu/raven2_pfp.bin");
-MODULE_FIRMWARE("amdgpu/raven2_me.bin");
-MODULE_FIRMWARE("amdgpu/raven2_mec.bin");
-MODULE_FIRMWARE("amdgpu/raven2_mec2.bin");
-MODULE_FIRMWARE("amdgpu/raven2_rlc.bin");
-MODULE_FIRMWARE("amdgpu/raven_kicker_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/arcturus_mec.bin");
-MODULE_FIRMWARE("amdgpu/arcturus_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/renoir_ce.bin");
-MODULE_FIRMWARE("amdgpu/renoir_pfp.bin");
-MODULE_FIRMWARE("amdgpu/renoir_me.bin");
-MODULE_FIRMWARE("amdgpu/renoir_mec.bin");
-MODULE_FIRMWARE("amdgpu/renoir_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/green_sardine_ce.bin");
-MODULE_FIRMWARE("amdgpu/green_sardine_pfp.bin");
-MODULE_FIRMWARE("amdgpu/green_sardine_me.bin");
-MODULE_FIRMWARE("amdgpu/green_sardine_mec.bin");
-MODULE_FIRMWARE("amdgpu/green_sardine_mec2.bin");
-MODULE_FIRMWARE("amdgpu/green_sardine_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/aldebaran_mec.bin");
-MODULE_FIRMWARE("amdgpu/aldebaran_mec2.bin");
-MODULE_FIRMWARE("amdgpu/aldebaran_rlc.bin");
-MODULE_FIRMWARE("amdgpu/aldebaran_sjt_mec.bin");
-MODULE_FIRMWARE("amdgpu/aldebaran_sjt_mec2.bin");
-
 #define mmTCP_CHAN_STEER_0_ARCT								0x0b03
 #define mmTCP_CHAN_STEER_0_ARCT_BASE_IDX							0
 #define mmTCP_CHAN_STEER_1_ARCT								0x0b04
@@ -1253,31 +1187,18 @@ static void gfx_v9_0_check_if_need_gfxoff(struct amdgpu_device *adev)
 static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
 					  const char *chip_name)
 {
-	char fw_name[30];
 	int err;
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
-	err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_PFP);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
-	err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.me_fw);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_ME);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
-	err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.ce_fw);
 	if (err)
 		goto out;
@@ -1286,8 +1207,7 @@ static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
 out:
 	if (err) {
 		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
+			"gfx9: Failed to init firmware\n");
 		release_firmware(adev->gfx.pfp_fw);
 		adev->gfx.pfp_fw = NULL;
 		release_firmware(adev->gfx.me_fw);
@@ -1301,36 +1221,11 @@ static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
 static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
 					  const char *chip_name)
 {
-	char fw_name[30];
 	int err;
 	const struct rlc_firmware_header_v2_0 *rlc_hdr;
 	uint16_t version_major;
 	uint16_t version_minor;
-	uint32_t smu_version;
 
-	/*
-	 * For Picasso && AM4 SOCKET board, we use picasso_rlc_am4.bin
-	 * instead of picasso_rlc.bin.
-	 * Judgment method:
-	 * PCO AM4: revision >= 0xC8 && revision <= 0xCF
-	 *          or revision >= 0xD8 && revision <= 0xDF
-	 * otherwise is PCO FP5
-	 */
-	if (!strcmp(chip_name, "picasso") &&
-		(((adev->pdev->revision >= 0xC8) && (adev->pdev->revision <= 0xCF)) ||
-		((adev->pdev->revision >= 0xD8) && (adev->pdev->revision <= 0xDF))))
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc_am4.bin", chip_name);
-	else if (!strcmp(chip_name, "raven") && (amdgpu_pm_load_smu_firmware(adev, &smu_version) == 0) &&
-		(smu_version >= 0x41e2b))
-		/**
-		*SMC is loaded by SBIOS on APU and it's able to get the SMU version directly.
-		*/
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_kicker_rlc.bin", chip_name);
-	else
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
-	err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
 	if (err)
 		goto out;
@@ -1342,8 +1237,7 @@ static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
 out:
 	if (err) {
 		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
+			"gfx9: Failed to init firmware\n");
 		release_firmware(adev->gfx.rlc_fw);
 		adev->gfx.rlc_fw = NULL;
 	}
@@ -1363,17 +1257,8 @@ static bool gfx_v9_0_load_mec2_fw_bin_support(struct amdgpu_device *adev)
 static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 					  const char *chip_name)
 {
-	char fw_name[30];
 	int err;
 
-	if (amdgpu_sriov_vf(adev) && (adev->asic_type == CHIP_ALDEBARAN))
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sjt_mec.bin", chip_name);
-	else
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", chip_name);
-
-	err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
 	if (err)
 		goto out;
@@ -1381,22 +1266,11 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
 
 	if (gfx_v9_0_load_mec2_fw_bin_support(adev)) {
-		if (amdgpu_sriov_vf(adev) && (adev->asic_type == CHIP_ALDEBARAN))
-			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sjt_mec2.bin", chip_name);
-		else
-			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2.bin", chip_name);
-
-		err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
-		if (!err) {
-			err = amdgpu_ucode_validate(adev->gfx.mec2_fw);
-			if (err)
-				goto out;
-			amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
-			amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2_JT);
-		} else {
-			err = 0;
-			adev->gfx.mec2_fw = NULL;
-		}
+		err = amdgpu_ucode_validate(adev->gfx.mec2_fw);
+		if (err)
+			goto out;
+		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
+		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2_JT);
 	} else {
 		adev->gfx.mec2_fw_version = adev->gfx.mec_fw_version;
 		adev->gfx.mec2_feature_version = adev->gfx.mec_feature_version;
@@ -1407,8 +1281,7 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 	gfx_v9_0_check_fw_write_wait(adev);
 	if (err) {
 		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
+			"gfx9: Failed to init firmware\n");
 		release_firmware(adev->gfx.mec_fw);
 		adev->gfx.mec_fw = NULL;
 		release_firmware(adev->gfx.mec2_fw);
-- 
2.34.1

