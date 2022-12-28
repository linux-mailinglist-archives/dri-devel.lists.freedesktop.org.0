Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C646581DA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B55C10E3D4;
	Wed, 28 Dec 2022 16:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2071.outbound.protection.outlook.com [40.107.95.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E89C10E3C9;
 Wed, 28 Dec 2022 16:31:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/scV+rHWv1aSPZOtC68899vLmtH6tGZib2cwdzqePy2WteRGe0BhilCP9H+xgOwMBMsshQv+bII/HdVSGIcW3hsFm4dsag7MqxVn3iD5jddoMZCdjUhNbie1XlfLu3B4Mh90C4nrfeNorJ2Z6s+2LQqN+GIApsiUrvQBLJI6dQyl5m82VTHtZ1D/eHr5bAUhLL6uWYwmNDaqVCFWkp73OGQRcuv/CK1PSLvRGXUJlkGdM9xyxvq2ALvB8sMQyMFyeCRNrr7uBMhG5/b/uwAKmfNrCxE/8TxYpfmqdp23q8TKIYLs++/sUpZQuHC/vEQAzWJYTI1Q/LuHODGvSVDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kLEI7KLO8ed0R+tYlFOf6nisWzKiZq86vJkRSpdLuw=;
 b=Oe4QoBhzd89BQz4Wrl1McOU01Yveer84p6AqnOo2fKErVZlgBpMYgbR+bTQIQCfuGSoyUBNQqHIgAgaDAk0KBKS19aX2k+MBXaf6C69dSrISdbX2n9f00T3ypg/GppP+hza6bQFHEAt/2Q4bQAUwMnlIzN75QtTrLceznDMDBkCyVSfC4S8NfPQfM7gheFML0eMQLAB6YBQKk1/DFvDbskdnt2XqEC5SYjGIjST3YSFx1+Trm06Uh40f042B8nLtsh+qBIzZ9FinmbRry5F2EMY2DozCjO/WRyDKbqno8ay4fbAWP2ViUY3ZrdWfv6jF6cJ2Hz97kdTvmxmEtaMItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kLEI7KLO8ed0R+tYlFOf6nisWzKiZq86vJkRSpdLuw=;
 b=Ey1g47lihuxGB6Yj3jQvRvHXtLIfaoe0cGnbEfIg08aD4pYGFBHIAvSyvBxz8oj6kQeJPrhKE6tYI4N29kHk0AzDXUzSMbNj041HJWGj3A3Ik/IhtOtAIw5qKkvwIpqAKCG6AThGRuZ0noT10wo7ANCTRUM00+CGWa0m2zq74LI=
Received: from MW2PR2101CA0002.namprd21.prod.outlook.com (2603:10b6:302:1::15)
 by CY5PR12MB6297.namprd12.prod.outlook.com (2603:10b6:930:22::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.14; Wed, 28 Dec
 2022 16:31:27 +0000
Received: from CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::9a) by MW2PR2101CA0002.outlook.office365.com
 (2603:10b6:302:1::15) with Microsoft SMTP Server (version=TLS1_2,
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
 15.20.5944.16 via Frontend Transport; Wed, 28 Dec 2022 16:31:26 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 28 Dec
 2022 10:31:24 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Javier Martinez Canillas <javierm@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 09/11] drm/amd: Request GFX10 microcode during IP discovery
Date: Wed, 28 Dec 2022 10:30:56 -0600
Message-ID: <20221228163102.468-10-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT076:EE_|CY5PR12MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: e5201637-55cb-40f0-260b-08dae8f0f77f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PGeG2gSaqmSBLQZJIrPMoBm7eD0sdXK3YTOK+NQp0GEZRZ3t7ux5t0dSmRq5RHB/4WdqY3At4H8WjTK68ELVaMkVAMVdWIjV91dA3mI95PZc2IWBPpKpmkBkRTWChg2FDl2jI8gWffDYoavHSeTHC3f/0mTa06aeviAx65oBia9PVaGPEgkYpmyw9icmcHBDNqaUbI+vh+e1sIm+WZJOZI5D6zD9+MqGJkuzQ85D2yx+MvmCkxKKCztzrgf6sLSf0mcQHA799SAf+I7Tq4ct6r2hPr3DIE5r/DuEpPvwKZRcMqHB3jkecF+XPnJ52Wr8DxDyCvFU/9gsT9xmRVGOhw6Ai6rKf9AZ1GWyte5Ow6F6+rPwMnBtfx34IJYKCfwPpYKxL+zW6zGdYCbMm9kR/PJQdcpftzWisHlH/eN9eeLP/fBXAIlKxbVRUBPKaGcgzkchjbI/M2iF3Ost81OiHlRftJjwK5/uxZ7Z56hY5V8kdIGWNvoVvQhKasV25olUWP9qySnaPjTEz8WWhBAub9KCYpSDdEbOVmWbdYMPfz4aKbzsE1pbLLY4lOasQeEj57bVxiWVwFOtA2El14aVfto3PCLsILuVpHC4MQ6qVrp0vM86e02RoWZDsq3IBDGOd8tXeDJehSWKhs7NNVMxqWDdKpFBZBZqIhcP2Hp3q7s99p4GIFKgQcaAHEc2xzaOoo+w4Wvp3vLWzw21R3mIsvI/NiXsDIC8lQAIEUQcPQw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(40470700004)(46966006)(36840700001)(8676002)(4326008)(8936002)(86362001)(41300700001)(40480700001)(70586007)(70206006)(5660300002)(36860700001)(44832011)(36756003)(6666004)(316002)(19627235002)(83380400001)(2906002)(54906003)(30864003)(110136005)(40460700003)(426003)(47076005)(81166007)(82310400005)(336012)(26005)(478600001)(2616005)(1076003)(7696005)(186003)(82740400003)(16526019)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 16:31:26.6728 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5201637-55cb-40f0-260b-08dae8f0f77f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6297
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

If GFX10 microcode is required but not available during early init, the
microcode framebuffer will have already been released and the screen will
freeze.

Move the request for GFX10 microcode into the IP discovery phase
so that if it's not available, IP discovery will fail.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 137 +++++++++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 180 +-----------------
 2 files changed, 144 insertions(+), 173 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 0da16abd6b24..d31559600cae 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -220,6 +220,102 @@ MODULE_FIRMWARE("amdgpu/green_sardine_mec.bin");
 MODULE_FIRMWARE("amdgpu/green_sardine_mec2.bin");
 MODULE_FIRMWARE("amdgpu/green_sardine_rlc.bin");
 
+/* gfx10 */
+MODULE_FIRMWARE("amdgpu/aldebaran_mec.bin");
+MODULE_FIRMWARE("amdgpu/aldebaran_mec2.bin");
+MODULE_FIRMWARE("amdgpu/aldebaran_rlc.bin");
+MODULE_FIRMWARE("amdgpu/aldebaran_sjt_mec.bin");
+MODULE_FIRMWARE("amdgpu/aldebaran_sjt_mec2.bin");
+
+MODULE_FIRMWARE("amdgpu/navi10_ce.bin");
+MODULE_FIRMWARE("amdgpu/navi10_pfp.bin");
+MODULE_FIRMWARE("amdgpu/navi10_me.bin");
+MODULE_FIRMWARE("amdgpu/navi10_mec.bin");
+MODULE_FIRMWARE("amdgpu/navi10_mec2.bin");
+MODULE_FIRMWARE("amdgpu/navi10_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/navi14_ce_wks.bin");
+MODULE_FIRMWARE("amdgpu/navi14_pfp_wks.bin");
+MODULE_FIRMWARE("amdgpu/navi14_me_wks.bin");
+MODULE_FIRMWARE("amdgpu/navi14_mec_wks.bin");
+MODULE_FIRMWARE("amdgpu/navi14_mec2_wks.bin");
+MODULE_FIRMWARE("amdgpu/navi14_ce.bin");
+MODULE_FIRMWARE("amdgpu/navi14_pfp.bin");
+MODULE_FIRMWARE("amdgpu/navi14_me.bin");
+MODULE_FIRMWARE("amdgpu/navi14_mec.bin");
+MODULE_FIRMWARE("amdgpu/navi14_mec2.bin");
+MODULE_FIRMWARE("amdgpu/navi14_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/navi12_ce.bin");
+MODULE_FIRMWARE("amdgpu/navi12_pfp.bin");
+MODULE_FIRMWARE("amdgpu/navi12_me.bin");
+MODULE_FIRMWARE("amdgpu/navi12_mec.bin");
+MODULE_FIRMWARE("amdgpu/navi12_mec2.bin");
+MODULE_FIRMWARE("amdgpu/navi12_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_ce.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_pfp.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_me.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_mec.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_mec2.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/navy_flounder_ce.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_pfp.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_me.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_mec.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_mec2.bin");
+MODULE_FIRMWARE("amdgpu/navy_flounder_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/vangogh_ce.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_pfp.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_me.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_mec.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_mec2.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_ce.bin");
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_pfp.bin");
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_me.bin");
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_mec.bin");
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_mec2.bin");
+MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/beige_goby_ce.bin");
+MODULE_FIRMWARE("amdgpu/beige_goby_pfp.bin");
+MODULE_FIRMWARE("amdgpu/beige_goby_me.bin");
+MODULE_FIRMWARE("amdgpu/beige_goby_mec.bin");
+MODULE_FIRMWARE("amdgpu/beige_goby_mec2.bin");
+MODULE_FIRMWARE("amdgpu/beige_goby_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/yellow_carp_ce.bin");
+MODULE_FIRMWARE("amdgpu/yellow_carp_pfp.bin");
+MODULE_FIRMWARE("amdgpu/yellow_carp_me.bin");
+MODULE_FIRMWARE("amdgpu/yellow_carp_mec.bin");
+MODULE_FIRMWARE("amdgpu/yellow_carp_mec2.bin");
+MODULE_FIRMWARE("amdgpu/yellow_carp_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/cyan_skillfish2_ce.bin");
+MODULE_FIRMWARE("amdgpu/cyan_skillfish2_pfp.bin");
+MODULE_FIRMWARE("amdgpu/cyan_skillfish2_me.bin");
+MODULE_FIRMWARE("amdgpu/cyan_skillfish2_mec.bin");
+MODULE_FIRMWARE("amdgpu/cyan_skillfish2_mec2.bin");
+MODULE_FIRMWARE("amdgpu/cyan_skillfish2_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/gc_10_3_6_ce.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_6_pfp.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_6_me.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_6_mec.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_6_mec2.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_6_rlc.bin");
+
+MODULE_FIRMWARE("amdgpu/gc_10_3_7_ce.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_7_pfp.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_7_me.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_7_mec.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_7_mec2.bin");
+MODULE_FIRMWARE("amdgpu/gc_10_3_7_rlc.bin");
+
 static const char *hw_id_names[HW_ID_MAX] = {
 	[MP1_HWID]		= "MP1",
 	[MP2_HWID]		= "MP2",
@@ -1981,6 +2077,44 @@ static int amdgpu_discovery_load_gfx9(struct amdgpu_device *adev, char *ucode_pr
 	return 0;
 }
 
+static int amdgpu_discovery_load_gfx10(struct amdgpu_device *adev, char *ucode_prefix)
+{
+	char fw_name[40];
+	char *wks = "";
+	int r;
+
+	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 1) &&
+		!(adev->pdev->device == 0x7340 &&
+			adev->pdev->revision != 0x00))
+		wks = "_wks";
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp%s.bin", ucode_prefix, wks);
+	r = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", ucode_prefix, wks);
+	r = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", ucode_prefix, wks);
+	r = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
+	r = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", ucode_prefix, wks);
+	r = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", ucode_prefix, wks);
+	r = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
+	if (r)
+		return r;
+
+	return 0;
+}
+
 static int amdgpu_discovery_set_gc_ip_blocks(struct amdgpu_device *adev)
 {
 	char ucode_prefix[30];
@@ -2015,6 +2149,9 @@ static int amdgpu_discovery_set_gc_ip_blocks(struct amdgpu_device *adev)
 	case IP_VERSION(10, 3, 6):
 	case IP_VERSION(10, 3, 3):
 	case IP_VERSION(10, 3, 7):
+		r = amdgpu_discovery_load_gfx10(adev, ucode_prefix);
+		if (r)
+			return r;
 		amdgpu_device_ip_block_add(adev, &gfx_v10_0_ip_block);
 		break;
 	case IP_VERSION(11, 0, 0):
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 49d34c7bbf20..319548b81454 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -182,95 +182,6 @@
 #define mmRLC_SPARE_INT_0_Sienna_Cichlid               0x4ca5
 #define mmRLC_SPARE_INT_0_Sienna_Cichlid_BASE_IDX      1
 
-MODULE_FIRMWARE("amdgpu/navi10_ce.bin");
-MODULE_FIRMWARE("amdgpu/navi10_pfp.bin");
-MODULE_FIRMWARE("amdgpu/navi10_me.bin");
-MODULE_FIRMWARE("amdgpu/navi10_mec.bin");
-MODULE_FIRMWARE("amdgpu/navi10_mec2.bin");
-MODULE_FIRMWARE("amdgpu/navi10_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/navi14_ce_wks.bin");
-MODULE_FIRMWARE("amdgpu/navi14_pfp_wks.bin");
-MODULE_FIRMWARE("amdgpu/navi14_me_wks.bin");
-MODULE_FIRMWARE("amdgpu/navi14_mec_wks.bin");
-MODULE_FIRMWARE("amdgpu/navi14_mec2_wks.bin");
-MODULE_FIRMWARE("amdgpu/navi14_ce.bin");
-MODULE_FIRMWARE("amdgpu/navi14_pfp.bin");
-MODULE_FIRMWARE("amdgpu/navi14_me.bin");
-MODULE_FIRMWARE("amdgpu/navi14_mec.bin");
-MODULE_FIRMWARE("amdgpu/navi14_mec2.bin");
-MODULE_FIRMWARE("amdgpu/navi14_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/navi12_ce.bin");
-MODULE_FIRMWARE("amdgpu/navi12_pfp.bin");
-MODULE_FIRMWARE("amdgpu/navi12_me.bin");
-MODULE_FIRMWARE("amdgpu/navi12_mec.bin");
-MODULE_FIRMWARE("amdgpu/navi12_mec2.bin");
-MODULE_FIRMWARE("amdgpu/navi12_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_ce.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_pfp.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_me.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_mec.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_mec2.bin");
-MODULE_FIRMWARE("amdgpu/sienna_cichlid_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/navy_flounder_ce.bin");
-MODULE_FIRMWARE("amdgpu/navy_flounder_pfp.bin");
-MODULE_FIRMWARE("amdgpu/navy_flounder_me.bin");
-MODULE_FIRMWARE("amdgpu/navy_flounder_mec.bin");
-MODULE_FIRMWARE("amdgpu/navy_flounder_mec2.bin");
-MODULE_FIRMWARE("amdgpu/navy_flounder_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/vangogh_ce.bin");
-MODULE_FIRMWARE("amdgpu/vangogh_pfp.bin");
-MODULE_FIRMWARE("amdgpu/vangogh_me.bin");
-MODULE_FIRMWARE("amdgpu/vangogh_mec.bin");
-MODULE_FIRMWARE("amdgpu/vangogh_mec2.bin");
-MODULE_FIRMWARE("amdgpu/vangogh_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_ce.bin");
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_pfp.bin");
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_me.bin");
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_mec.bin");
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_mec2.bin");
-MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/beige_goby_ce.bin");
-MODULE_FIRMWARE("amdgpu/beige_goby_pfp.bin");
-MODULE_FIRMWARE("amdgpu/beige_goby_me.bin");
-MODULE_FIRMWARE("amdgpu/beige_goby_mec.bin");
-MODULE_FIRMWARE("amdgpu/beige_goby_mec2.bin");
-MODULE_FIRMWARE("amdgpu/beige_goby_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/yellow_carp_ce.bin");
-MODULE_FIRMWARE("amdgpu/yellow_carp_pfp.bin");
-MODULE_FIRMWARE("amdgpu/yellow_carp_me.bin");
-MODULE_FIRMWARE("amdgpu/yellow_carp_mec.bin");
-MODULE_FIRMWARE("amdgpu/yellow_carp_mec2.bin");
-MODULE_FIRMWARE("amdgpu/yellow_carp_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/cyan_skillfish2_ce.bin");
-MODULE_FIRMWARE("amdgpu/cyan_skillfish2_pfp.bin");
-MODULE_FIRMWARE("amdgpu/cyan_skillfish2_me.bin");
-MODULE_FIRMWARE("amdgpu/cyan_skillfish2_mec.bin");
-MODULE_FIRMWARE("amdgpu/cyan_skillfish2_mec2.bin");
-MODULE_FIRMWARE("amdgpu/cyan_skillfish2_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/gc_10_3_6_ce.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_6_pfp.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_6_me.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_6_mec.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_6_mec2.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_6_rlc.bin");
-
-MODULE_FIRMWARE("amdgpu/gc_10_3_7_ce.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_7_pfp.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_7_me.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_7_mec.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_7_mec2.bin");
-MODULE_FIRMWARE("amdgpu/gc_10_3_7_rlc.bin");
-
 static const struct soc15_reg_golden golden_settings_gc_10_1[] =
 {
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmCB_HW_CONTROL_4, 0xffffffff, 0x00400014),
@@ -3974,9 +3885,6 @@ static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_device *adev)
 
 static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 {
-	const char *chip_name;
-	char fw_name[40];
-	char *wks = "";
 	int err;
 	const struct rlc_firmware_header_v2_0 *rlc_hdr;
 	uint16_t version_major;
@@ -3984,91 +3892,29 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 
 	DRM_DEBUG("\n");
 
-	switch (adev->ip_versions[GC_HWIP][0]) {
-	case IP_VERSION(10, 1, 10):
-		chip_name = "navi10";
-		break;
-	case IP_VERSION(10, 1, 1):
-		chip_name = "navi14";
-		if (!(adev->pdev->device == 0x7340 &&
-		      adev->pdev->revision != 0x00))
-			wks = "_wks";
-		break;
-	case IP_VERSION(10, 1, 2):
-		chip_name = "navi12";
-		break;
-	case IP_VERSION(10, 3, 0):
-		chip_name = "sienna_cichlid";
-		break;
-	case IP_VERSION(10, 3, 2):
-		chip_name = "navy_flounder";
-		break;
-	case IP_VERSION(10, 3, 1):
-		chip_name = "vangogh";
-		break;
-	case IP_VERSION(10, 3, 4):
-		chip_name = "dimgrey_cavefish";
-		break;
-	case IP_VERSION(10, 3, 5):
-		chip_name = "beige_goby";
-		break;
-	case IP_VERSION(10, 3, 3):
-		chip_name = "yellow_carp";
-		break;
-	case IP_VERSION(10, 3, 6):
-		chip_name = "gc_10_3_6";
-		break;
-	case IP_VERSION(10, 1, 3):
-	case IP_VERSION(10, 1, 4):
-		chip_name = "cyan_skillfish2";
-		break;
-	case IP_VERSION(10, 3, 7):
-		chip_name = "gc_10_3_7";
-		break;
-	default:
-		BUG();
-	}
-
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.pfp_fw);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_PFP);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.me_fw);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_ME);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.ce_fw);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_CE);
 
 	if (!amdgpu_sriov_vf(adev)) {
-		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", chip_name);
-		err = request_firmware(&adev->gfx.rlc_fw, fw_name, adev->dev);
-		if (err)
-			goto out;
 		/* don't check this.  There are apparently firmwares in the wild with
 		 * incorrect size in the header
 		 */
 		err = amdgpu_ucode_validate(adev->gfx.rlc_fw);
 		if (err)
 			dev_dbg(adev->dev,
-				"gfx10: amdgpu_ucode_validate() failed \"%s\"\n",
-				fw_name);
+				"gfx10: amdgpu_ucode_validate() failed\n");
 		rlc_hdr = (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->data;
 		version_major = le16_to_cpu(rlc_hdr->header.header_version_major);
 		version_minor = le16_to_cpu(rlc_hdr->header.header_version_minor);
@@ -4077,35 +3923,23 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 			goto out;
 	}
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
-	if (err)
-		goto out;
 	err = amdgpu_ucode_validate(adev->gfx.mec_fw);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1);
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1_JT);
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", chip_name, wks);
-	err = request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
-	if (!err) {
-		err = amdgpu_ucode_validate(adev->gfx.mec2_fw);
-		if (err)
-			goto out;
-		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
-		amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2_JT);
-	} else {
-		err = 0;
-		adev->gfx.mec2_fw = NULL;
-	}
+	err = amdgpu_ucode_validate(adev->gfx.mec2_fw);
+	if (err)
+		goto out;
+	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2);
+	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC2_JT);
 
 	gfx_v10_0_check_fw_write_wait(adev);
 out:
 	if (err) {
 		dev_err(adev->dev,
-			"gfx10: Failed to init firmware \"%s\"\n",
-			fw_name);
+			"gfx10: Failed to init firmware\n");
 		release_firmware(adev->gfx.pfp_fw);
 		adev->gfx.pfp_fw = NULL;
 		release_firmware(adev->gfx.me_fw);
-- 
2.34.1

