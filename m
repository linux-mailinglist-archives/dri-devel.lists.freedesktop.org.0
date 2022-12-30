Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBF06594F4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 06:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFB810E43A;
	Fri, 30 Dec 2022 05:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B30010E0B6;
 Fri, 30 Dec 2022 05:21:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+01gDPh4CvZF7Ro3DFnOajpnvdjCTAG3CO2vEEf/2XHm6Hpz0AuwswCDQj2chYru5ZEVSuCr3fkYipAi2svzyCQB7CDdeGfWdV15zh5W5reAdcUv0mAsP3EJwsHM1eRBrE5miMQu36VnphiUr/5/hVkYLO6XUjjMnj76sxS/iO+XC0vEUSX7VM2OsMjYUJMmbL9UcWOsv4GALc834+CPqHCJccLRdCyRDW0O7p+xkTR3idNgiBaFnlUkTQPLhyCA7h9L7t+iHUuupS14FmfI53/TfQFuuZUj26vskrQlHgWYIZn/HJZ3bdDnfuN7P/LZUd7yqh6eloAK/HVNa/a8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtjuZpm+eSoyOAJ29TngyVm4QnNnx7+s/sT8DWz4F6c=;
 b=i/iNocHN63WeW/P66J8ygPRe1padoOlSaIXDMvLx4PxA6lxgCNfMv71XO39upzwDViOCNwZH+KakMUFNBKMbNwVqz3Y4k5Lqd6YSmrOY4C9jTH+ByeCQcwVQ2UH7IKP991blC75IQuWaerHtWw+9wmk36axSVIqFT00DutBPE5jZ6fDvNF+rysjTUglqrsOGQdgQEw7wvbFgjjXeJTc9wsjuLULg579wsdm1rRNtcBsoLZoW6PI8qt5h/wgC2QMQnrid8nY/hv+MLtRrXPY6PFV4zgj7JAmC6M/kvdb5YFaZSwIJWZ4eru0oryZaHUzbYKlbrpaaRD41qVsY70wK8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtjuZpm+eSoyOAJ29TngyVm4QnNnx7+s/sT8DWz4F6c=;
 b=iB5dOtDQMYH5Np9f4m42+zytmYCu/68SltDQhVAjyuEv0qrIAScAn6FPaZbBGZmmlmBCUnL7e0ffqfMHMv/SUBKtLPP9oyg/sl//iu6Owc/DbQEgz2UIvQ3KV6Ai/Mgw1DLMOWWTvDNKPFeQvmuR694u48TaZD2kV3cOrqlwXZ4=
Received: from MW4PR03CA0347.namprd03.prod.outlook.com (2603:10b6:303:dc::22)
 by SJ0PR12MB5675.namprd12.prod.outlook.com (2603:10b6:a03:42d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 05:21:48 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::88) by MW4PR03CA0347.outlook.office365.com
 (2603:10b6:303:dc::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.18 via Frontend
 Transport; Fri, 30 Dec 2022 05:21:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Fri, 30 Dec 2022 05:21:48 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 29 Dec
 2022 23:21:45 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 08/11] drm/amd: Request GFX9 microcode during IP discovery
Date: Thu, 29 Dec 2022 23:21:12 -0600
Message-ID: <20221230052119.15096-9-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT055:EE_|SJ0PR12MB5675:EE_
X-MS-Office365-Filtering-Correlation-Id: c2233bcc-73db-4300-8cf2-08daea25c01b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nIiMIfcpW5aQIXxpteTV7Bm6TPnfJw1kJj4SpM6mUUIYY6oVOLFVMpajIHEw8HgQwndwG5IBOfemkqgpkFjNrL/GxiJ3w6rL3vs4WZ6AJ1SHT0GUyQG8fXalZivwmfQTFqq/KG2Q02t52BJtefpXOmGrrwWUXw1bOnyPBQmMx3QETm9xktCbd5jrbzGvK5dHued5xIod1dW1NYhcwynIkMm0yuM2v8ySRO2l3p8DdxcF+eSqvYoAX/3yqJSTfOiyZ4mTJUrN31T+9js/KnoUINHIWVPm5dZheHdLAbsBpP4SDgMGWk0Hcbft4I6HDPBCbzgvo0+3xbqd5ZY6rbCYG3kcWvFBCgWyXxMpuojHvDoinSBkIJudKemPvHq6qq+J39/yuHmdDcGU+42Qi1oEZMM+4/VK9AalxcB6yTudKlPVQDqsI+3JDH9BugxrjvahT//Sol339URs7Kt6FxoiC8G9UCXzAQArrD+Nt5Vw/DRMn+Y19xm7luAwovRdfs+fYaEJvzk1MuVmvbiDrKIS81ay4gUY3k5E74H3YD6FJFoo6ZTu2MH4ikHXt7NHIKZhjl1IZWHpW5V9DkTt6X+/Fz1QhMMPJw1z+e07jklr4yZCRXXz6o0hAn1u8kjWrha3ketlz5087zAKw8WT4RlEkIC66sIOl32a37dol12oj8a2w5azzRog3CxW1wIjGvJGQQLzjBsgxP66un/LgOXBR0dtw3nR78NY5rjPGlcLyTA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(336012)(426003)(2616005)(1076003)(36756003)(356005)(26005)(16526019)(478600001)(82310400005)(6666004)(7696005)(47076005)(40480700001)(86362001)(36860700001)(40460700003)(81166007)(5660300002)(186003)(30864003)(82740400003)(8936002)(44832011)(2906002)(110136005)(316002)(54906003)(4326008)(70206006)(8676002)(41300700001)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 05:21:48.2504 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2233bcc-73db-4300-8cf2-08daea25c01b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5675
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

If GFX9 microcode is required but not available during early init, the
firmware framebuffer will have already been released and the screen will
freeze.

Move the request for GFX9 microcode into the IP discovery phase
so that if it's not available, IP discovery will fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2->v3:
 * Fix issues found on real hardware where num_gfx_rings not set during
   discovery
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 147 +++++++++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         | 194 ++----------------
 2 files changed, 161 insertions(+), 180 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index edaeec35c39f..0ff1b3872441 100644
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
@@ -1845,8 +1907,90 @@ static int amdgpu_discovery_set_display_ip_blocks(struct amdgpu_device *adev)
 	return 0;
 }
 
+static int amdgpu_discovery_load_gfx9(struct amdgpu_device *adev, char *ucode_prefix)
+{
+	uint32_t smu_version;
+	char fw_name[40];
+	int r;
+
+	switch (adev->ip_versions[GC_HWIP][0]) {
+	/* No CPG in Arcturus */
+	case IP_VERSION(9, 4, 1):
+	case IP_VERSION(9, 4, 2):
+		break;
+	default:
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
+	else if (!strcmp(ucode_prefix, "raven") &&
+		(amdgpu_pm_load_smu_firmware(adev, &smu_version) == 0) &&
+		(smu_version >= 0x41e2b))
+		/* SMC is loaded by SBIOS on APU & can get the SMU version directly. */
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
@@ -1856,6 +2000,9 @@ static int amdgpu_discovery_set_gc_ip_blocks(struct amdgpu_device *adev)
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
index f202b45c413c..9288a3bcb3c1 100644
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
@@ -1250,34 +1184,20 @@ static void gfx_v9_0_check_if_need_gfxoff(struct amdgpu_device *adev)
 	}
 }
 
-static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
-					  const char *chip_name)
+static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev)
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
@@ -1286,8 +1206,7 @@ static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
 out:
 	if (err) {
 		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
+			"gfx9: Failed to init firmware\n");
 		release_firmware(adev->gfx.pfp_fw);
 		adev->gfx.pfp_fw = NULL;
 		release_firmware(adev->gfx.me_fw);
@@ -1298,39 +1217,13 @@ static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
 	return err;
 }
 
-static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
-					  const char *chip_name)
+static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev)
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
@@ -1342,8 +1235,7 @@ static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
 out:
 	if (err) {
 		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
+			"gfx9: Failed to init firmware\n");
 		release_firmware(adev->gfx.rlc_fw);
 		adev->gfx.rlc_fw = NULL;
 	}
@@ -1360,20 +1252,10 @@ static bool gfx_v9_0_load_mec2_fw_bin_support(struct amdgpu_device *adev)
 	return true;
 }
 
-static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
-					  const char *chip_name)
+static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev)
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
@@ -1381,22 +1263,11 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
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
@@ -1407,8 +1278,7 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 	gfx_v9_0_check_fw_write_wait(adev);
 	if (err) {
 		dev_err(adev->dev,
-			"gfx9: Failed to init firmware \"%s\"\n",
-			fw_name);
+			"gfx9: Failed to init firmware\n");
 		release_firmware(adev->gfx.mec_fw);
 		adev->gfx.mec_fw = NULL;
 		release_firmware(adev->gfx.mec2_fw);
@@ -1419,58 +1289,22 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 
 static int gfx_v9_0_init_microcode(struct amdgpu_device *adev)
 {
-	const char *chip_name;
 	int r;
 
 	DRM_DEBUG("\n");
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
-	case IP_VERSION(9, 0, 1):
-		chip_name = "vega10";
-		break;
-	case IP_VERSION(9, 2, 1):
-		chip_name = "vega12";
-		break;
-	case IP_VERSION(9, 4, 0):
-		chip_name = "vega20";
-		break;
-	case IP_VERSION(9, 2, 2):
-	case IP_VERSION(9, 1, 0):
-		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
-			chip_name = "raven2";
-		else if (adev->apu_flags & AMD_APU_IS_PICASSO)
-			chip_name = "picasso";
-		else
-			chip_name = "raven";
-		break;
-	case IP_VERSION(9, 4, 1):
-		chip_name = "arcturus";
-		break;
-	case IP_VERSION(9, 3, 0):
-		if (adev->apu_flags & AMD_APU_IS_RENOIR)
-			chip_name = "renoir";
-		else
-			chip_name = "green_sardine";
-		break;
-	case IP_VERSION(9, 4, 2):
-		chip_name = "aldebaran";
-		break;
-	default:
-		BUG();
-	}
-
 	/* No CPG in Arcturus */
 	if (adev->gfx.num_gfx_rings) {
-		r = gfx_v9_0_init_cp_gfx_microcode(adev, chip_name);
+		r = gfx_v9_0_init_cp_gfx_microcode(adev);
 		if (r)
 			return r;
 	}
 
-	r = gfx_v9_0_init_rlc_microcode(adev, chip_name);
+	r = gfx_v9_0_init_rlc_microcode(adev);
 	if (r)
 		return r;
 
-	r = gfx_v9_0_init_cp_compute_microcode(adev, chip_name);
+	r = gfx_v9_0_init_cp_compute_microcode(adev);
 	if (r)
 		return r;
 
-- 
2.34.1

