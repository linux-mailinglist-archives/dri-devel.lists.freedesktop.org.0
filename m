Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD18765F1C6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7F510E778;
	Thu,  5 Jan 2023 17:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166E210E77B;
 Thu,  5 Jan 2023 17:02:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEsculBJslwqHsMT6RMrsLyBz56MBuui32iBIPLIc3SwldBYx69/N+NtzaNczWTxnq5WBNROIsDxCow2Nd3PUHz3wO1ppZlPu+3B1/CXC6xkE2LU+mfWAE5gVsRbzTnajF9wIp4OLRFPkg25cYMQbFYTn55hVYVS/BOxoLSN5JTrnp8fnOgY9v6WdJzEJi67B1oGL/DTCSwlJuC+g8ucQBi6LaRas9GVnX2/FWdWhpgOm7S3bPNQKNYTengq8aypuCPKh+4dJAkh16Mymdjs5NeQAkIZr8H2EzvhpjwxWO3iYYHo73S84Kyoto6pOa1vtiqHCuoOuv/+9s0/Mg1Kfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5P5dGWbg82Uh7g1BUc5vpMngNBiQdDSCX9/8s9yMdY=;
 b=F7rK7ScN3/LSFBwlnmtW9N86bbe0UVI12Ahl4wrkoJHknNHEv/O+eAtKOQ7gbhc8sLm0DO75FRltlyy0a0NvsZHEove5bUuZcEXanEBfy5UL1uNrAgNjxZ3QeKRGi8DKkBcZVkLT9bkuKttRM09hs8/akFqqgJOJ6JSBteMRFM1Rvkxetg25JNMKLjcdkG4Y20JUaY960vtJRtmgLnMeHwSUqVkPOtwhddLdpRJc4cqEBWdv6QOICp1/9twbCrHiEOrCcfeFx0hqPPKbFmF/YVrum2MENBZWsPfBmee7SrXRUVJrd82DvSbl76cUFa7lWIuvY/4TYUt7O/8t0YAikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5P5dGWbg82Uh7g1BUc5vpMngNBiQdDSCX9/8s9yMdY=;
 b=oYDAJ1nCavKIawPVdOvpLOnzhxNlaQOyIJ3zSJgWDsEo2k+DXS0N4XmXQWogl1Q77Pxqgp9vY/G8bqAcUEwcmHdSd78YG56XRV0YOHdUZemWEHb2cRI9ZtaN5+iQlv1r6ago1wGjiHTCkYeZLNZXWiylJIeEVUKeGVDgNX4F1S0=
Received: from BN9PR03CA0361.namprd03.prod.outlook.com (2603:10b6:408:f7::6)
 by MN0PR12MB5930.namprd12.prod.outlook.com (2603:10b6:208:37d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:14 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::b8) by BN9PR03CA0361.outlook.office365.com
 (2603:10b6:408:f7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 17:02:14 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:12 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 12/45] drm/amd: Use `amdgpu_ucode_*` helpers for MES
Date: Thu, 5 Jan 2023 11:00:58 -0600
Message-ID: <20230105170138.717-13-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|MN0PR12MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: 89530c10-af72-440c-578e-08daef3e9834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wCB/dqKCoZksviMLntp+NSZk/j/xNxKdoEb81furCGPt+grlwftvb1yFoEHJAh/0w8+ReQ8EM79rvhu+4H+rDac3/vlNR1HBYUhOQWrVK2ElRng2PrvqZqzmTxhA2S22QYSLJpxHstBpncBuJBzNoirDbNyhDH6tU2mx8SUdNLnllr6bM4IkIjjpukfSv7d6w2qrXEOOZKvnN5pAbyV4Qm6Mkpce9ETZdKg1laEIhSkGlWMRlYs3vC76BWIk/8hLSDh51zVhi6ILq0cD/QXQ7KcRFpTmvzLSvIAEpNimd8OHmK3nHS7Btr3LZUm4zs4YhDQMJOcrsTlH6v0Y9Sb01hzgC9JqP2l0zaFApdRLiv2vphy21ILJpz/o0ITSQ5NF3m0oAE3Fh9gagc+tPOITAnW4UN5UF6CEv4mz+lQtA341S6DW6u+OPl+ljxI3HdhqNb+60EpleDtnhML56fXPMET9yMKe0iSimRnykmPmAFP3PLVn/Zx/dgstOWSnz2UW6nojjWrOQtaYpv5WcYG/OpFQw3ZQz0trV9ebrIcjNL+qIpg/ajCqPRVYWRPY9c37SZn2PQzRPQHSqG+iZNE/ctSdufVHaz7ghytfjBRMlnfLeqN+Q52u7a+ijaRR1xrATAKk4o3u3DfGc7Nntr8iRFXOSN4onkujMbPAbAkRZuIJNohpS2+HxKhu+gcdZzYkstqdNmkjWW5YhB/6CEJcDawJZPelCwWKHpZmbnK0dP8tagQt6GgXYjFtNlwv7qSTlWOpJb+rxHC2TSM6O99s5w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(36840700001)(46966006)(40470700004)(70206006)(44832011)(8936002)(70586007)(5660300002)(316002)(54906003)(2906002)(41300700001)(4326008)(8676002)(36860700001)(82310400005)(6666004)(110136005)(478600001)(36756003)(186003)(336012)(26005)(1076003)(47076005)(16526019)(426003)(83380400001)(2616005)(7696005)(40480700001)(82740400003)(86362001)(81166007)(40460700003)(356005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:14.6455 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89530c10-af72-440c-578e-08daef3e9834
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5930
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

The `amdgpu_ucode_request` helper will ensure that the return code for
missing firmware is -ENODEV so that early_init can fail.

The `amdgpu_ucode_release` helper provides symmetry for releasing firmware.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 10 ++--------
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c  | 10 +---------
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c  | 10 +---------
 3 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index dd8f35234507..82e27bd4f038 100644
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
+	amdgpu_ucode_release(&adev->mes.fw[pipe]);
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
index 9c5ff8b7c202..7848b9de79ce 100644
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
+		amdgpu_ucode_release(&adev->mes.fw[pipe]);
 	}
 
 	amdgpu_bo_free_kernel(&adev->gfx.kiq.ring.mqd_obj,
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 3af77a32baac..a0125e103007 100644
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
+		amdgpu_ucode_release(&adev->mes.fw[pipe]);
 	}
 
 	amdgpu_bo_free_kernel(&adev->gfx.kiq.ring.mqd_obj,
-- 
2.34.1

