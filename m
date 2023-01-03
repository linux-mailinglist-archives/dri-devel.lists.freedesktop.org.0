Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44A265C960
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFD810E40D;
	Tue,  3 Jan 2023 22:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A96010E28D;
 Tue,  3 Jan 2023 22:19:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBkmlls2g+YptU7Jlac4OW1/Mt9SCgftSgUGax0BG8fblOYcvMirYW8g8FCFyLT26i0ip+LWLSSdp1cf3B74A1SMLyNvsJJu+4mzup6w/Nqc0ptZWcgyW7d7rnmORwSIRoYlFz+zPPbBgWaFu/Tt2xb4zo/qbvyeeZ9u27W4juvYn5eOsgf0Lp1bag/e+nt1KSAQxuMS+dR415TUEDhoa/233Gax9QCACbW/LBo/jmHZCENE6FrapvF9Ou4r3Pq5OQzsSxrxVbHr4q5wrbgFGMYMIJ7G5s325vXIqP1MHwC7br0D7Wc59DARnEcXI2S/7MU2RfU0HPKqaM+5Kp7IdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXdxrkzDm/U7sf0oYuG779TY7C3q8TAeIL6Z3qzTWto=;
 b=Hx6GO+NJb/rbY8HI2rOr9WF7Cj4oSqftJcuPPLm2110oodwgCxEtV9EEIbPZ5h/ZmYuD+xWPstdQpeciNJKy7vNQqitpHpks1kuw6Dm+x/6v8OwuIQ9QGiEoUaFc82GUU+phYGgkJFs9cwNOmzLbi1Ha6DKbrr4ilvDfS0bl4gklljG+sBX+0gRRPbOxvWKgQYEs+ujvg3KdRYmp4QViM/ELd3vf9FlZa1fv5UqjuKVPPfdprhzFei+EMW2hgM5tr5n1762THs5ULKQO04/DxJtiC3JcocFys2Z0Cb3AgKWmSNWlos2bTK/8ySBAraVH8K9kgIprTXR/kdcNtu4nkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXdxrkzDm/U7sf0oYuG779TY7C3q8TAeIL6Z3qzTWto=;
 b=DL0mby+TaCHYctlW39SgXXIsxDbl3eHPA/i/TcyusMZVvubZcnxGgDnkYYT2f0rjqeur4M5lyjUoa4NoLEIpm5XN/ZSHAWkQxALX/xN84ck87qK4EL5B+fmP+lXjzIiHWTvB9kwYMKWmb2Y/QyxwnWD7qxlBlniR0PXZwPs6KYw=
Received: from DS7PR05CA0097.namprd05.prod.outlook.com (2603:10b6:8:56::26) by
 SA0PR12MB4525.namprd12.prod.outlook.com (2603:10b6:806:92::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 22:19:39 +0000
Received: from DS1PEPF0000E652.namprd02.prod.outlook.com
 (2603:10b6:8:56:cafe::fe) by DS7PR05CA0097.outlook.office365.com
 (2603:10b6:8:56::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E652.mail.protection.outlook.com (10.167.18.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:39 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:38 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 10/27] drm/amd: Load VCN microcode during early_init
Date: Tue, 3 Jan 2023 16:18:29 -0600
Message-ID: <20230103221852.22813-11-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230103221852.22813-1-mario.limonciello@amd.com>
References: <20230103221852.22813-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E652:EE_|SA0PR12MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 48fc5fb1-300e-430e-0add-08daedd89ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C4I/CkmcTtN0QHUPMWGFDHs6hbZtIkry2KwNvNAQB5rKI5RqdWremoxmpu7KKH53+tTulL/QCfTMtV4E28MeBEIjSmaAZEQokUD/X052Fs6MOOl18k/6vFyMKAP15AK7rZOOf4Hb530whelYxDhPWhKrgQRFOee9d8E2OtImJLDjA85e1JV3ShhZr0GfbB4yC+sTz3u5lCXncX1+E5mH9sRvxJWTga5FIdIReIHPWPPp1sbIffrvhuSXJL/EVvItVFrmx+zacvwt33NTCU/dUYr9U2y7oYXsbhjmCFxcj5GgsR1YyFRMBa3S5gbZnP2R+6bZEJTC+IAnId/IsD0FATagqtNmMdYpu7JrNkz6EvBGz1/TOyIl1HcFzjb0o96McU9Q1NLUDdMnKZ0VLjnifDYVsQTf8XFm75lll8R1SohIogudKPlUoms7tek4uC7z8I8q68H9YqH9mVTcggG24ZfTWLQrLlVKhYnxHoL7CrMsd7QlH3tqznKFxv1QqCTFP6cBM1uQCHTTkNhi3/dRy3xS7UQ1U8KfJD2mjaPG7KokQr+V2UhXn4gEerISY6+jRMTPcQvuoi+3kABm4IY2soVS2v1VwDqJ/xrXdy9P5ICcxdSqijaZokeHjwv8UIt2Wahyq9JuWwi/MX39S6ikaiO91PJEq1eQBb1HHyitcW44G1Da7u7jEo2yXtB7dfjrGbS1Fwm1RyXNlhihPc8X3nbAqsdXrHuPYi4NWdc90LNsLnFffm73r5dmmVig1fVoEHY0ZUvZJ9oKHFIR2zwNxQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(2906002)(2616005)(54906003)(336012)(316002)(4326008)(36860700001)(70206006)(41300700001)(8676002)(70586007)(26005)(83380400001)(6666004)(186003)(5660300002)(47076005)(426003)(16526019)(8936002)(7696005)(44832011)(30864003)(110136005)(40480700001)(478600001)(82740400003)(356005)(86362001)(1076003)(81166007)(40460700003)(82310400005)(36756003)(22166009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:39.2264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48fc5fb1-300e-430e-0add-08daedd89ada
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E652.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4525
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lazar Lijo <Lijo.Lazar@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplifies the code so that all VCN versions will get the firmware
name from `amdgpu_ucode_ip_version_decode` and then use this filename
to load microcode as part of the early_init process.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * Move out of IP discovery and introduce early_init phase for VCN
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 94 ++++++++++---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c   |  5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c   |  5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c   |  5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c   |  5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c   |  5 +-
 7 files changed, 52 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index 6d9cb7fb67cf..48fc9059c386 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -36,25 +36,25 @@
 #include "soc15d.h"
 
 /* Firmware Names */
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
+#define FIRMWARE_RAVEN         "amdgpu/raven_vcn.bin"
+#define FIRMWARE_PICASSO       "amdgpu/picasso_vcn.bin"
+#define FIRMWARE_RAVEN2                "amdgpu/raven2_vcn.bin"
+#define FIRMWARE_ARCTURUS      "amdgpu/arcturus_vcn.bin"
+#define FIRMWARE_RENOIR                "amdgpu/renoir_vcn.bin"
+#define FIRMWARE_GREEN_SARDINE "amdgpu/green_sardine_vcn.bin"
+#define FIRMWARE_NAVI10                "amdgpu/navi10_vcn.bin"
+#define FIRMWARE_NAVI14                "amdgpu/navi14_vcn.bin"
+#define FIRMWARE_NAVI12                "amdgpu/navi12_vcn.bin"
+#define FIRMWARE_SIENNA_CICHLID        "amdgpu/sienna_cichlid_vcn.bin"
+#define FIRMWARE_NAVY_FLOUNDER "amdgpu/navy_flounder_vcn.bin"
+#define FIRMWARE_VANGOGH       "amdgpu/vangogh_vcn.bin"
+#define FIRMWARE_DIMGREY_CAVEFISH      "amdgpu/dimgrey_cavefish_vcn.bin"
+#define FIRMWARE_ALDEBARAN     "amdgpu/aldebaran_vcn.bin"
+#define FIRMWARE_BEIGE_GOBY    "amdgpu/beige_goby_vcn.bin"
+#define FIRMWARE_YELLOW_CARP   "amdgpu/yellow_carp_vcn.bin"
+#define FIRMWARE_VCN_3_1_2     "amdgpu/vcn_3_1_2.bin"
+#define FIRMWARE_VCN4_0_0      "amdgpu/vcn_4_0_0.bin"
+#define FIRMWARE_VCN4_0_2      "amdgpu/vcn_4_0_2.bin"
 #define FIRMWARE_VCN4_0_4      "amdgpu/vcn_4_0_4.bin"
 
 MODULE_FIRMWARE(FIRMWARE_RAVEN);
@@ -80,10 +80,26 @@ MODULE_FIRMWARE(FIRMWARE_VCN4_0_4);
 
 static void amdgpu_vcn_idle_work_handler(struct work_struct *work);
 
+int amdgpu_vcn_early_init(struct amdgpu_device *adev)
+{
+	char ucode_prefix[30];
+	char fw_name[40];
+	int r;
+
+	amdgpu_ucode_ip_version_decode(adev, UVD_HWIP, ucode_prefix, sizeof(ucode_prefix));
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
+	r = amdgpu_ucode_load(adev, &adev->vcn.fw, fw_name);
+	if (r) {
+		release_firmware(adev->vcn.fw);
+		adev->vcn.fw = NULL;
+	}
+
+	return r;
+}
+
 int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 {
 	unsigned long bo_size;
-	const char *fw_name;
 	const struct common_firmware_header *hdr;
 	unsigned char fw_check;
 	unsigned int fw_shared_size, log_offset;
@@ -99,46 +115,27 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
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
@@ -146,58 +143,46 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
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
@@ -206,13 +191,6 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
-	r = amdgpu_ucode_load(adev, &adev->vcn.fw, fw_name);
-	if (r) {
-		if (adev->vcn.fw)
-			release_firmware(adev->vcn.fw);
-		return r;
-	}
-
 	hdr = (const struct common_firmware_header *)adev->vcn.fw->data;
 	adev->vcn.fw_version = le32_to_cpu(hdr->ucode_version);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
index dbb8d68a30c6..d3e2af902907 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
@@ -369,6 +369,7 @@ enum vcn_ring_type {
 	VCN_UNIFIED_RING,
 };
 
+int amdgpu_vcn_early_init(struct amdgpu_device *adev);
 int amdgpu_vcn_sw_init(struct amdgpu_device *adev);
 int amdgpu_vcn_sw_fini(struct amdgpu_device *adev);
 int amdgpu_vcn_suspend(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index f0fbcda76f5e..c305b2cb8490 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -57,11 +57,12 @@ static void vcn_v1_0_idle_work_handler(struct work_struct *work);
 static void vcn_v1_0_ring_begin_use(struct amdgpu_ring *ring);
 
 /**
- * vcn_v1_0_early_init - set function pointers
+ * vcn_v1_0_early_init - set function pointers and load microcode
  *
  * @handle: amdgpu_device pointer
  *
  * Set ring and irq function pointers
+ * Load microcode from filesystem
  */
 static int vcn_v1_0_early_init(void *handle)
 {
@@ -75,7 +76,7 @@ static int vcn_v1_0_early_init(void *handle)
 
 	jpeg_v1_0_early_init(handle);
 
-	return 0;
+	return amdgpu_vcn_early_init(adev);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index 08871bad9994..4b4cd88414e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -62,11 +62,12 @@ static int vcn_v2_0_pause_dpg_mode(struct amdgpu_device *adev,
 				int inst_idx, struct dpg_pause_state *new_state);
 static int vcn_v2_0_start_sriov(struct amdgpu_device *adev);
 /**
- * vcn_v2_0_early_init - set function pointers
+ * vcn_v2_0_early_init - set function pointers and load microcode
  *
  * @handle: amdgpu_device pointer
  *
  * Set ring and irq function pointers
+ * Load microcode from filesystem
  */
 static int vcn_v2_0_early_init(void *handle)
 {
@@ -81,7 +82,7 @@ static int vcn_v2_0_early_init(void *handle)
 	vcn_v2_0_set_enc_ring_funcs(adev);
 	vcn_v2_0_set_irq_funcs(adev);
 
-	return 0;
+	return amdgpu_vcn_early_init(adev);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index ec87b00f2e05..b0b0e69c6a94 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -71,11 +71,12 @@ static int amdgpu_ih_clientid_vcns[] = {
 };
 
 /**
- * vcn_v2_5_early_init - set function pointers
+ * vcn_v2_5_early_init - set function pointers and load microcode
  *
  * @handle: amdgpu_device pointer
  *
  * Set ring and irq function pointers
+ * Load microcode from filesystem
  */
 static int vcn_v2_5_early_init(void *handle)
 {
@@ -107,7 +108,7 @@ static int vcn_v2_5_early_init(void *handle)
 	vcn_v2_5_set_irq_funcs(adev);
 	vcn_v2_5_set_ras_funcs(adev);
 
-	return 0;
+	return amdgpu_vcn_early_init(adev);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 9c8b5fd99037..bd228512424a 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -78,11 +78,12 @@ static void vcn_v3_0_dec_ring_set_wptr(struct amdgpu_ring *ring);
 static void vcn_v3_0_enc_ring_set_wptr(struct amdgpu_ring *ring);
 
 /**
- * vcn_v3_0_early_init - set function pointers
+ * vcn_v3_0_early_init - set function pointers and load microcode
  *
  * @handle: amdgpu_device pointer
  *
  * Set ring and irq function pointers
+ * Load microcode from filesystem
  */
 static int vcn_v3_0_early_init(void *handle)
 {
@@ -109,7 +110,7 @@ static int vcn_v3_0_early_init(void *handle)
 	vcn_v3_0_set_enc_ring_funcs(adev);
 	vcn_v3_0_set_irq_funcs(adev);
 
-	return 0;
+	return amdgpu_vcn_early_init(adev);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index 1e2b22299975..a79b6088374b 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -68,11 +68,12 @@ static void vcn_v4_0_unified_ring_set_wptr(struct amdgpu_ring *ring);
 static void vcn_v4_0_set_ras_funcs(struct amdgpu_device *adev);
 
 /**
- * vcn_v4_0_early_init - set function pointers
+ * vcn_v4_0_early_init - set function pointers and load microcode
  *
  * @handle: amdgpu_device pointer
  *
  * Set ring and irq function pointers
+ * Load microcode from filesystem
  */
 static int vcn_v4_0_early_init(void *handle)
 {
@@ -88,7 +89,7 @@ static int vcn_v4_0_early_init(void *handle)
 	vcn_v4_0_set_irq_funcs(adev);
 	vcn_v4_0_set_ras_funcs(adev);
 
-	return 0;
+	return amdgpu_vcn_early_init(adev);
 }
 
 /**
-- 
2.34.1

