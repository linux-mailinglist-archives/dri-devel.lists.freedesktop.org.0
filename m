Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A67865DA40
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DAA10E53E;
	Wed,  4 Jan 2023 16:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5224610E53E;
 Wed,  4 Jan 2023 16:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilsBxoaeuWgTe+aLmF389P0k06mxyD71iz28ueaURldmYGjRzbyyHh6juMR3HrkMwSp092h8JGiyemiTo3rRQtUme7NtPEQAGCl6XpDa+RZtoKVkTjDsbBNhyQbMGTyk5dZq+QqWGwpCpnD8wYcDr3IFYAriJfdw6nlASmTCbHYiuwAlpzQhMClUQ582/TSNzUBGWNHla9MK/T9Iwtkm6JUnD+qQFAp4NUpscF2jKG1q2i7jP/dFjwcXyu2zNX2YaBcbE5wlw7qySj/pVbXGliLQ00hdwWSfHbZYw/Sp1NSeIb/HzNuV4t5uQUfy4dQfjed6w14nNtf2gwxMXyGdJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDQp7cpzblYgBjxCZ3eSdC+VMwONegYXTSs+j7j+GkM=;
 b=cEB2sgtK0CHG0rBTaDetgr8dTNfsaC7YsGJKPaRDr03hf2cStbEig/nxCIgt3/Q6PNNZJRr/zNTD8GoTJRJevTnCRmQe0kiR2QWPs2Nca9tA1Au5ntVUSXYtT1xcETF+pG4WXiF9SEeAoPp9qJt1d6cWBdvP3xnyeQrokb+mJgpi8uOAb8N6Vl3GIuJgAikD+1WHuDe5gIfLXE3vcHKB0w72Yo6OwkoYEkle/+6ffbKGJJOpl7LA0vYRWXW2xZB6yBTsQT3aAH3o9qu4tzWiMbwCHw1uKgkqR2enBilUizLVV7FyLMqW4kGItzFshfeMdy4AfNIOcw6ED6CLpI3Q8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDQp7cpzblYgBjxCZ3eSdC+VMwONegYXTSs+j7j+GkM=;
 b=MzavJjC1xGYqi8CXUCHE6DSjRi3xgiBRy4ocOjnY0lqBAd7PxnKRqPb7C9Z+bU0Cu/uDp6KmT52pLQchwyhAzZ6HOIJF11zDuhopJhWvi/Y+XKy5SqDqWKGaHC1wW0GfYrp4cHcGOJNhTK/WQ1FMRg9RiIHr+yc/hX9KsxQWq1c=
Received: from BN9PR03CA0625.namprd03.prod.outlook.com (2603:10b6:408:106::30)
 by MW6PR12MB7086.namprd12.prod.outlook.com (2603:10b6:303:238::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:43:06 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::a) by BN9PR03CA0625.outlook.office365.com
 (2603:10b6:408:106::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:43:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:43:06 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:42:55 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 15/45] drm/amd: Load GFX9 microcode during early_init
Date: Wed, 4 Jan 2023 10:40:04 -0600
Message-ID: <20230104164042.30271-16-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104164042.30271-1-mario.limonciello@amd.com>
References: <20230104164042.30271-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|MW6PR12MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: 66554eff-e38e-44d1-1e3a-08daee72c141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D1TdDAOE8RM4IlrjWgRUc1HgtXf4H+/nii9YdUOgEJiQ8CL47yqSWDb6k7nsJP4AWuRA7hy8j4WNbHaBzTqUfyrBFOG27JgzUJE6gZYGWrO+k2wcmrTNUpCtNKjdLmidvv50JP/FX3vrY9sZ4hhK/EuqNGkIaTz3CKSNaZROaOOSrim2aHHmPWbTy+b6PQZo3kBn3n+5aJVp9JOGO9xtcy8e5cGoP6DgR07unJO9rLr7qGSaEDRct5NCijdW5EPdOTczZVLAWqPl5+ChJ+uDjqUJxm6JvSG2jhd5/7sd3y8ej70UKEIpIac3erejrGzybRRX07mp5bXAgb/kPYKD2jdxWx0zfIKh6GORYPeEbDMKQJuomPy1E6xq0ceazlaNp3kojpUDIWSXLWYEq71EV5lUcDCpCWin+MscuGZu3CQvVJ0ZUoqMTo1zfRjs55ufXWWIv6X+zXXZWIi6v/CtK/phf5pkTby4ctZSRNXRDEPGsmJ9T8+2gpp30++VR2oIw9F/wns0sSGCvZG3oa0VPGp34W04a5yhTlWyOlofLQixKbYOJQx9o3d8lESTMmIGh5q1Jc5KAB7VvhSGTD91cWD+TMcR4yrN2JpuUnoAO9FKRBLBGgl2noV2g3wgOLr5/BKfrPeZuFwPIQ1yJOgdN3n84GuyUFyJe6JboMj5R1TMcnR39Dg+qEZgUoaZw1/tq1VIFgL0pXyEEomDL9PW/LMVMsmwRozQ90GLFWQy1sI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(47076005)(426003)(186003)(16526019)(1076003)(26005)(2616005)(81166007)(336012)(82740400003)(356005)(83380400001)(86362001)(82310400005)(36756003)(36860700001)(44832011)(40480700001)(316002)(41300700001)(8936002)(8676002)(5660300002)(4326008)(40460700003)(70206006)(6666004)(70586007)(478600001)(7696005)(110136005)(54906003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:43:06.1830 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66554eff-e38e-44d1-1e3a-08daee72c141
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7086
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
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 58 +++++----------------------
 1 file changed, 9 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 3ae46eab693c..f0c948f11213 100644
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

