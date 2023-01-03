Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DD165C96A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F90610E4DC;
	Tue,  3 Jan 2023 22:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F1410E294;
 Tue,  3 Jan 2023 22:19:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDfDZlCYfToefKpGyVRo8fbNW8zK20otaT/EXSgHGU476TPFU1VucNuPezd4cQK4CQG96emzYW9GRY4fV7SLY30D0bXw6ot6eFgTzn/0145GWgEnl9/UeAhOoraC0APhgEsX8oKaW928OZ88xyGjWsQY3tOPkGRZt4WCdajdk2iY+G9AyJGAJIcQ+ivm+36lqBodQ2KJPxqieNhpCOl4PwqErLyZnEu5QOuWw4MCNqYgGqe4LxLAA07ujc4BbCesqlHBfNojFZ721pwM7wFpoPyoGXzJbjLmaH0Sx2rHcbj3S2WlIH0lbdu9S0tgEsM+XxYoh431AMcQ6zUjXTK9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQzzWQTICRxoHs2IynlMSZNEQ3a9JsIDKjffnX20rQQ=;
 b=MaVOc0v9BjDuvbBvDQEok8b+Ly+RqT0A+ygG3tSKUGVCLS1fTAdoiv6QIMrkVLWW3xlZzigqn2KiAkimXV2zwCddtZQp1Kvf/ktAyaKgfEqfPs2/ZTkp78a7uQ7m9pAiddIILGRDM02HrkADlXBDY+Gj38Fy7UTycNdh/QG1rrt2mu66UjLQnjCL/qu+x5IOZ3Jlw4hCIcMSaxjfaQQbDa8etvl9M9bI2HshXth+OQo9a4vNI473DmaKeUNAQsjXM/AYMYgXzCgkPQmrmVciLnMFpvmZ5FrGlt1eM6glyoIkNSCz5mNMX6OGUuXw1jVz51aEurIe6KybdCbBuPq3YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQzzWQTICRxoHs2IynlMSZNEQ3a9JsIDKjffnX20rQQ=;
 b=ezH4BgibAONEqoepfLKLi2lGh01FrT/UggVzYhqYFVYe2NvH09VJJhe49507vfbyb1a6B0EmXBoxHxrRltD2JMOCipDbmbc9TTy8MYYXgN1XKBs24LfTIzQIZneQYozFS8BO6dDmNAO0C998VL/FdeYKchl4BVR4/iWY0mytMmE=
Received: from DM6PR10CA0027.namprd10.prod.outlook.com (2603:10b6:5:60::40) by
 CY8PR12MB7585.namprd12.prod.outlook.com (2603:10b6:930:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 22:19:45 +0000
Received: from DS1PEPF0000E654.namprd02.prod.outlook.com
 (2603:10b6:5:60:cafe::f4) by DM6PR10CA0027.outlook.office365.com
 (2603:10b6:5:60::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.20 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E654.mail.protection.outlook.com (10.167.18.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:45 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:44 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 15/27] drm/amd: Load GFX9 microcode during early_init
Date: Tue, 3 Jan 2023 16:18:34 -0600
Message-ID: <20230103221852.22813-16-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E654:EE_|CY8PR12MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 09f0ac7d-c47c-4044-0354-08daedd89e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /9uULEQZD9x2JDYfei/akhbDv1JHyhWKljBcOaUVfmoLw7M1qdq1J7FUSZeq3VFOHpxDrmgCEPg9RwR03EJ60LhYYbCzUZeN5joHF1mRtN/WQ+HeJXJ7xY7uOcj/kmXb9CqANpkPVjzm9J3vpunqBCk0qpvlmRLRlkZEtioRz7fizSSwhPJCMPYYyyfZVPBNq379gEH+daxr459MsPkDlgkAxIKhdSTJ7M/e1+KKKqCKIJjH3rYTSgjl9zkkOJ60/R17bsD+YhYzb4nqGBKRzlhpAkhYFJloa9KlfMdC4TAbQfxfzEYZtspo8Rjltw+VLuRPhzbZeDVZbB0zvxRA0MxMovzgPF9oiD7/aSL4c8mxsqhaDQMkRH61CCB+BAIdcXjot/D5ueyQL1NnKhYvgd7TfAvdRJOVaC3HMoweYnkDgjoIZuKY8m8CSEcf04aypcNct/E1DgEZqZMh24fLJ/SxNAX9Ck+HBQsaQRXxhRMJ+IRqoX+7BXfFIwru7gKbH8vhBiRsrIjaAYw6zB8iSaRACX+gpF2x+2InEhiG/DfgInk6rCFNgF+G6+hQmK1X9J4qUf3FC6RaQOkuEKvuyzumkmViYGfmX2h5gs/tpbeesNwsHODxjhSC6QOPTzSpYbRt98FoQK5ktrzQST7/MaiE1LPSAwTzd36yXfb0gw5PQsJO4VpLJIICVheZTLcKKVRFYcr6jP7XnDF4gsplaMMFtTw6KS4iTVTwphwO3PvDKg/tJ8+sjPxSV1OKnB5G
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(46966006)(40470700004)(36840700001)(186003)(16526019)(7696005)(26005)(54906003)(81166007)(316002)(478600001)(110136005)(4326008)(1076003)(8676002)(6666004)(70206006)(336012)(2616005)(70586007)(82740400003)(47076005)(8936002)(44832011)(5660300002)(83380400001)(426003)(2906002)(41300700001)(356005)(36860700001)(36756003)(40460700003)(82310400005)(86362001)(40480700001)(22166009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:45.2203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f0ac7d-c47c-4044-0354-08daedd89e6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E654.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7585
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

If GFX9 microcode is required but not available during early init, the
firmware framebuffer will have already been released and the screen will
freeze.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * Move microcode load phase to early init
v2->v3:
 * Fix issues found on real hardware where num_gfx_rings not set during
   discovery
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 58 +++++----------------------
 1 file changed, 9 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 27040821d764..4e9c230e42ca 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1251,7 +1251,7 @@ static void gfx_v9_0_check_if_need_gfxoff(struct amdgpu_device *adev)
 }
 
 static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
-					  const char *chip_name)
+					  char *chip_name)
 {
 	char fw_name[30];
 	int err;
@@ -1287,7 +1287,7 @@ static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
 }
 
 static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
-					  const char *chip_name)
+				       char *chip_name)
 {
 	char fw_name[30];
 	int err;
@@ -1344,7 +1344,7 @@ static bool gfx_v9_0_load_mec2_fw_bin_support(struct amdgpu_device *adev)
 }
 
 static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
-					  const char *chip_name)
+					      char *chip_name)
 {
 	char fw_name[30];
 	int err;
@@ -1392,58 +1392,24 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 
 static int gfx_v9_0_init_microcode(struct amdgpu_device *adev)
 {
-	const char *chip_name;
+	char ucode_prefix[30];
 	int r;
 
 	DRM_DEBUG("\n");
-
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
+	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
 	/* No CPG in Arcturus */
 	if (adev->gfx.num_gfx_rings) {
-		r = gfx_v9_0_init_cp_gfx_microcode(adev, chip_name);
+		r = gfx_v9_0_init_cp_gfx_microcode(adev, ucode_prefix);
 		if (r)
 			return r;
 	}
 
-	r = gfx_v9_0_init_rlc_microcode(adev, chip_name);
+	r = gfx_v9_0_init_rlc_microcode(adev, ucode_prefix);
 	if (r)
 		return r;
 
-	r = gfx_v9_0_init_cp_compute_microcode(adev, chip_name);
+	r = gfx_v9_0_init_cp_compute_microcode(adev, ucode_prefix);
 	if (r)
 		return r;
 
@@ -2131,12 +2097,6 @@ static int gfx_v9_0_sw_init(void *handle)
 
 	adev->gfx.gfx_current_status = AMDGPU_GFX_NORMAL_MODE;
 
-	r = gfx_v9_0_init_microcode(adev);
-	if (r) {
-		DRM_ERROR("Failed to load gfx firmware!\n");
-		return r;
-	}
-
 	if (adev->gfx.rlc.funcs) {
 		if (adev->gfx.rlc.funcs->init) {
 			r = adev->gfx.rlc.funcs->init(adev);
@@ -4578,7 +4538,7 @@ static int gfx_v9_0_early_init(void *handle)
 	/* init rlcg reg access ctrl */
 	gfx_v9_0_init_rlcg_reg_access_ctrl(adev);
 
-	return 0;
+	return gfx_v9_0_init_microcode(adev);
 }
 
 static int gfx_v9_0_ecc_late_init(void *handle)
-- 
2.34.1

