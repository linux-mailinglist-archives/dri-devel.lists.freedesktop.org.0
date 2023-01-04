Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B94865DA3B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AF110E530;
	Wed,  4 Jan 2023 16:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A4710E530;
 Wed,  4 Jan 2023 16:43:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZTE9FPhiFAhLDLKkYwuHAfndLWVry6VjZCkb8mZtKz96sTj5qHey+bpxtBLGX+tkH2hcaA8WR8AJoWn1otOAAhGzTCx8pIxodDDaX/Qd0g799otutUoxZp+iTDY2b6d8fzo1EL4mHo9Gchim2N3amTUNvKnJJYjuCaa1tQn0OI3VsvpvK/41nbwWaHXocZfxpWEch4b+GdTtFfEQ1nYyh8iP1PBu3RQSZFRqc+uRbExqu+vgSXei+8eWUQtDJKPXXAKUKPAMekg1YK1fvLgWxQddJln70/sSI6K4Jvp9tZu3uN4X4V/JqzmDj8JUpzy+tjOEjl7UGnGSZoLy7WxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqmZ2nAkRcQhgEH0df0U3RghwaRhIhV82O2EuOCNjeU=;
 b=MgHTysFSFy3cpcH3IPh0+HADyzjY18M9Pgl18CFFpHWed1zjlIZeB2FefxqPUciQ8yHVHcZA6rtJ3N82BduKjv9IIabnd06FJ2WDjv9nLJpyS6ck90nfMaDnoL7a8Gn/baUtBoj5VE6x/y5JOOrC/7DAVUkBOidcv7S5hAnsIXchH9fW5zSLtpaNov+EHpWH6Y2cQGDOAE82ETzw0Bhw/oZ4U6Wo/jcoK+XelfGPuNvaFQdrgP1m0jVGMCrKjKeUl+BXI/b1VHfQIWJhc02CyemHYmq4pYht8gvq+B06oxRwTTrYSjy2mUr3bwsNdtg9orY/WiLZ6G87izAFH7krYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqmZ2nAkRcQhgEH0df0U3RghwaRhIhV82O2EuOCNjeU=;
 b=Yn1u4aTkg2tu4N2j2CDeUej8IDcgn1T2TFu3eO1ePEl66ewhosYC+qc9KvPUf9aBNcr9+vHFwD0B0QkE7yReYXFjR+pdp2DrkfICv1VGe7cxxdShCAVGhQxuzEJbt8x4dv7mK+nWGOY3QzAAP2qWT0jIKG8XZ8TgOUviycNJqug=
Received: from BN9PR03CA0628.namprd03.prod.outlook.com (2603:10b6:408:106::33)
 by PH0PR12MB5450.namprd12.prod.outlook.com (2603:10b6:510:e8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:42:58 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::15) by BN9PR03CA0628.outlook.office365.com
 (2603:10b6:408:106::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:42:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:42:58 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:42:00 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 12/45] drm/amd: Use `amdgpu_ucode_*` helpers for MES
Date: Wed, 4 Jan 2023 10:40:01 -0600
Message-ID: <20230104164042.30271-13-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|PH0PR12MB5450:EE_
X-MS-Office365-Filtering-Correlation-Id: 231eaa6b-b64e-4938-dd65-08daee72bc72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f+nGelDsT7U4XHRI+PsKXtX1v2IidrBceD2uIgnM7tzy/LeFcqpbIOuUxvb4gy1fm9k3i1pEiCsImTb2ORRXulJ4EI4tAdoDqnQKlRSYEq9oCaw4yCMqlMtjaaj1UcU+sqIyGvYai2tSS67BoioQTtu2Ifc3jVKSiLbp1M90SalBl/fUJl2uZPfpCaD6L7zIDsgFiOXtePxfZU1ZOtkgA0XQ898ScYTVlOeTPH1JtTdY0gk6mLRGzlCjD+u6rVzXdYxjVHXkRARkzKyPfWsd7Zu/0Fl+qrPaRL5Y5a1quWz5ZACTRvy7V/FzA5/UXkfpZmvfcZ1QoN+ROOhekf7cc6Sb/6iUMx9LzdB59HOxM2CD/TS0oEhoWhaeYP+em1SZUzI3srZSD/Lfv7QVFpnAnm9PuZvPFne/hx9uyHB+WmSuqdL41JRQTVQohrcg6jhUm+SbgxgqOGRXpVdzceVgY1LxH9zpsmxq6aQdkMpcbtMSJvKM2IRHVwZw2Qc5smaItOqAfwSnmB3/6tCvvf0eywbv5pwFkn/nJjYSBg4NWR+BskyUjACMzCNdZNDFpjwrviI01LRAptbGy2ABid2tEvB6j7NHQBPlCJ1r2o2Js1c8Y0gNK507P2WVUaraOdLJu8BiTK1O0UkH7rkaS+6A/SqF+6SEYwRE7OXjtjqkC1C4UZIN/Nqpwst/MJuKIFaajmJVozxKl8y9bs5eRPjOtGheGw4M7uPMCQ0HjfOrB/hZhI6EW2GTm8nwhiR3+stlyWA8pKtwlkmXnK5p4+l7cw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(16526019)(54906003)(316002)(7696005)(26005)(110136005)(186003)(1076003)(478600001)(2616005)(70206006)(8676002)(336012)(70586007)(4326008)(82740400003)(426003)(41300700001)(2906002)(47076005)(83380400001)(8936002)(5660300002)(44832011)(86362001)(36756003)(36860700001)(40460700003)(356005)(40480700001)(81166007)(82310400005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:42:58.0423 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 231eaa6b-b64e-4938-dd65-08daee72bc72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5450
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

The `amdgpu_ucode_request` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

The `amdgpu_ucode_release` helper provides symmetry for releasing firmware.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 10 ++--------
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c  | 10 +---------
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c  | 10 +---------
 3 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index dd8f35234507..73ec471a8c2f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1438,11 +1438,7 @@ int amdgpu_mes_init_microcode(struct amdgpu_device *adev, int pipe)
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
 		ucode_prefix,
 		pipe == AMDGPU_MES_SCHED_PIPE ? "" : "1");
-	r = request_firmware(&adev->mes.fw[pipe], fw_name, adev->dev);
-	if (r)
-		goto out;
-
-	r = amdgpu_ucode_validate(adev->mes.fw[pipe]);
+	r = amdgpu_ucode_request(adev, &adev->mes.fw[pipe], fw_name);
 	if (r)
 		goto out;
 
@@ -1482,9 +1478,7 @@ int amdgpu_mes_init_microcode(struct amdgpu_device *adev, int pipe)
 	}
 
 	return 0;
-
 out:
-	release_firmware(adev->mes.fw[pipe]);
-	adev->mes.fw[pipe] = NULL;
+	amdgpu_ucode_release(adev->mes.fw[pipe]);
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
index 9c5ff8b7c202..a2c96a86538c 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
@@ -379,13 +379,6 @@ static const struct amdgpu_mes_funcs mes_v10_1_funcs = {
 	.resume_gang = mes_v10_1_resume_gang,
 };
 
-static void mes_v10_1_free_microcode(struct amdgpu_device *adev,
-				     enum admgpu_mes_pipe pipe)
-{
-	release_firmware(adev->mes.fw[pipe]);
-	adev->mes.fw[pipe] = NULL;
-}
-
 static int mes_v10_1_allocate_ucode_buffer(struct amdgpu_device *adev,
 					   enum admgpu_mes_pipe pipe)
 {
@@ -979,8 +972,7 @@ static int mes_v10_1_sw_fini(void *handle)
 		amdgpu_bo_free_kernel(&adev->mes.eop_gpu_obj[pipe],
 				      &adev->mes.eop_gpu_addr[pipe],
 				      NULL);
-
-		mes_v10_1_free_microcode(adev, pipe);
+		amdgpu_ucode_release(adev->mes.fw[pipe]);
 	}
 
 	amdgpu_bo_free_kernel(&adev->gfx.kiq.ring.mqd_obj,
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 3af77a32baac..4dab62335d0d 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -459,13 +459,6 @@ static const struct amdgpu_mes_funcs mes_v11_0_funcs = {
 	.misc_op = mes_v11_0_misc_op,
 };
 
-static void mes_v11_0_free_microcode(struct amdgpu_device *adev,
-				     enum admgpu_mes_pipe pipe)
-{
-	release_firmware(adev->mes.fw[pipe]);
-	adev->mes.fw[pipe] = NULL;
-}
-
 static int mes_v11_0_allocate_ucode_buffer(struct amdgpu_device *adev,
 					   enum admgpu_mes_pipe pipe)
 {
@@ -1069,8 +1062,7 @@ static int mes_v11_0_sw_fini(void *handle)
 		amdgpu_bo_free_kernel(&adev->mes.eop_gpu_obj[pipe],
 				      &adev->mes.eop_gpu_addr[pipe],
 				      NULL);
-
-		mes_v11_0_free_microcode(adev, pipe);
+		amdgpu_ucode_release(adev->mes.fw[pipe]);
 	}
 
 	amdgpu_bo_free_kernel(&adev->gfx.kiq.ring.mqd_obj,
-- 
2.34.1

