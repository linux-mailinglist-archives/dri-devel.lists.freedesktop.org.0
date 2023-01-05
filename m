Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A44A65F1CE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952A410E783;
	Thu,  5 Jan 2023 17:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B1110E77F;
 Thu,  5 Jan 2023 17:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QENnkTlSQLw6mDExkiIkwBeiuz71VIOfX9SIO+nREO0j+vjyE0zKMFCZPfhJzq0roS+QMCwNDyV2fUHh3EeMK7Ofg/xhv6qKqOgD8JhTacuJwxxmmPL+6WeZvuu02LELYwAersB+k3NGF5vscn0BUx/w8yhA344Ram5YVMw9GkOdxhHIgOQunZY7bw28zuSdBNG6UqDpoEKqLGza0GmiWzqZIi8D5jJoIE8e9TlBYUNVlBoYvjSIA3xAT7Z0lHgqU+el0poxPubSFJ3wRdiOGkmzJ+0986Xkxj4n6dNe2/cXJ3q9p2wyfEqjDSI2j9uYeBca+/P3mKDa0gkuNNgOxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2Q+RtAWIy3R8U+SGqlKW7qnjRA/99U8A9OYiRjJeS4=;
 b=Ndt+HmMEUkGgcQl+QJNRxo4ZDbc6bGMC74lScGm5dCYsR7gX9CIumQUtaZ9DduU6N1cfeQG2rqrLLxvnFDxwdExCK/5ZaRuGlCTfw28sW5TcQS8U8AxdTl7k6cleLExiuWfETKOOHg8lonAlDG1bNfTKdx/TuWJ3RN0L5S6unlF7I5U2vWw+u86KIrc3eSQSZxBriCaUaoGyq1AQibJZlpVH5NB8iFU/z6uCTJjLf5/C22zaeuhCVFeAQ/BQTSEnCbAjCxuZbIhoSwlKBbqWKeaZvHrp1+JamnskMG8s/SRFj/VIZr+BuGQDGwUE2CpXzxrvLfPQUIHQAcFef2LENQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2Q+RtAWIy3R8U+SGqlKW7qnjRA/99U8A9OYiRjJeS4=;
 b=PoY/BJw0dZa885IuuqDY3IZg3SL4ocwJlkgqOO3hkZoXxWefHPmjGGulbViftsdXVwL2jwYqg2Zm6Il7KmJg91BW3afSiI7MId8E8Zn+ADy0YQstSXQb1uPTL0NLwyAotgpz0ryTNKPTZ5mLCmSFjOO66CPDcI9A9LXTH1RgFuo=
Received: from BN9PR03CA0377.namprd03.prod.outlook.com (2603:10b6:408:f7::22)
 by CH2PR12MB4165.namprd12.prod.outlook.com (2603:10b6:610:a4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:18 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::28) by BN9PR03CA0377.outlook.office365.com
 (2603:10b6:408:f7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 17:02:17 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:16 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 15/45] drm/amd: Load GFX9 microcode during early_init
Date: Thu, 5 Jan 2023 11:01:01 -0600
Message-ID: <20230105170138.717-16-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|CH2PR12MB4165:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9a0017-b4fa-45cd-ae45-08daef3e9a1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kLrmewFr2MAG+7UZvo9BhgXlUyZpb9I70SAvp152JV+VAHmqSIhcawZm0c/33gkw20nv8PmRBQOKaET+SyjhQFt9wMcMYDceotYp1yoBvGew6QKwBJQQ2pJS3VgxPGUlVlGCgyFEmAM3EJCMrwIWsXZz1+37upP4l304yhamXuzZEm4/rkVJ2jjirEJywFaJqVB9fokNyTIUzUNcZkhPY+B9SKYPiLIW35TVUyNPdhL75KiheUnE8sC/sbb1QLrTGxP79YT9hnGsMFbCceBXdzvPx1ma6gQOh1zIbZ/TLdrK9v9ZmnlBXTBeka4iSJtGPCKYUImtPJKh8YuVE4ncS5lunhWWbeZkVx9XQ7vM1xDoxxJEcTthdAcQ4pqtqiTTgOOoGj0Er49LI3XTX52dTvVUWtRZF7C48JUC9wHaZ63+AXOdV2CI4EWmy1ZkiW8QMFu2F573sY3DpWp0VM9dh9u/fjzbxX/wimugzrPZMeJJfGivoWmEBGDHrzvQVlnfpv4mknOEYm5jBCUnapg09Q4RIN61EvZCwkiVjEKbm8DxgAdbsi4firRysi6utRzj2iwkZv3LQwoIcFtJeoYU5Wn6iDvA/QLkTTUFd7wFNbt+dISPllnrVWyS6nEuQQMgb1gslaVkWzzooLLR4PMg+oAoarYIFxObcUhLG2ZjpNwpue2SoHqY4YIWxfp6i1149ut8DI/FYYh6+/c1CrQkuFlFkKzQj9WRRg+36p/tpSk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199015)(40470700004)(36840700001)(46966006)(47076005)(426003)(83380400001)(1076003)(82310400005)(26005)(186003)(16526019)(336012)(40480700001)(7696005)(6666004)(2616005)(40460700003)(86362001)(36860700001)(36756003)(81166007)(356005)(82740400003)(4326008)(41300700001)(8676002)(2906002)(5660300002)(44832011)(8936002)(478600001)(316002)(70586007)(70206006)(54906003)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:17.8328 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9a0017-b4fa-45cd-ae45-08daef3e9a1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4165
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

If GFX9 microcode is required but not available during early init, the
firmware framebuffer will have already been released and the screen will
freeze.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 58 +++++----------------------
 1 file changed, 9 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index ef2dbebbc90c..0dba690cf7dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1245,7 +1245,7 @@ static void gfx_v9_0_check_if_need_gfxoff(struct amdgpu_device *adev)
 }
 
 static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
-					  const char *chip_name)
+					  char *chip_name)
 {
 	char fw_name[30];
 	int err;
@@ -1278,7 +1278,7 @@ static int gfx_v9_0_init_cp_gfx_microcode(struct amdgpu_device *adev,
 }
 
 static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
-					  const char *chip_name)
+				       char *chip_name)
 {
 	char fw_name[30];
 	int err;
@@ -1333,7 +1333,7 @@ static bool gfx_v9_0_load_mec2_fw_bin_support(struct amdgpu_device *adev)
 }
 
 static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
-					  const char *chip_name)
+					      char *chip_name)
 {
 	char fw_name[30];
 	int err;
@@ -1379,58 +1379,24 @@ static int gfx_v9_0_init_cp_compute_microcode(struct amdgpu_device *adev,
 
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
 
@@ -2118,12 +2084,6 @@ static int gfx_v9_0_sw_init(void *handle)
 
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
@@ -4565,7 +4525,7 @@ static int gfx_v9_0_early_init(void *handle)
 	/* init rlcg reg access ctrl */
 	gfx_v9_0_init_rlcg_reg_access_ctrl(adev);
 
-	return 0;
+	return gfx_v9_0_init_microcode(adev);
 }
 
 static int gfx_v9_0_ecc_late_init(void *handle)
-- 
2.34.1

