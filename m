Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40E665DA6D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E753B10E590;
	Wed,  4 Jan 2023 16:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F86310E58C;
 Wed,  4 Jan 2023 16:44:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUZXkg+oCB0EMo23JgzG3poKSsXS/Pp+qNjEjLG+0uKT3oGHeXlRhWbuChWLn/dsTJk0HHbkC6+/eIOrXsdhtfEjmIRcrepy/kl6oD4GqD2XRBQdITbca+0H/pd/5FSYSsHAuUTePQffMA3j6e2rLOGg2Fz5Cb3XJUBEoPS0EAEFcMSPuWWsIZd7PF2Hh1NjXP0Vd86gnr4w3tszWm2KGw7S7V9a6AablXx9m8hEAFe5VZ5rxFjXmooQxRGY1K7P2zfyTJ8/JSFMzCGTtD4BZ6ogXTleWnYawKO3MWW3/V3XIkh57HMYsm+oIWIQrY+HxOH17LQJQpRwgEyffCUYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6zFVeH6ycNozFmqRJ49q1s8rz4/0HRquCK775mnL3k=;
 b=NLaQE9dddRbLecTM6WE6vG2SXiCV+0EdMSc23qQtu/7Gz1qawz35k80u9Y8wj9JYcS+OpiPXe471f/vwgTHLj26emzG7fhW5t6c/nNR+O9AAIPPP9B+et3Mm7GhB4AMgQn+1nMleLz4dH4PRvsD9ExZyDnNBotLTCVJlUI07kINzl7Wj+oNKDEUZvf/Wec5YIpX+4yXViKMeujKFCgORqVSabi8FhCIoXvYYPXQ4U4//dJdEXOc7Hb4tdL0JCTqkCDcnKpcHBx6TD27/nl2R7k/Fmxiy6guJxJVYRavFuSVZ96qNdsfB66Xy/Gw9Y+nQmWfWzsEE4wCdaep4I9O49g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6zFVeH6ycNozFmqRJ49q1s8rz4/0HRquCK775mnL3k=;
 b=JL/+uDs56gYDTS7zhHonI89NJoU22zHXirsKppLs8bcYny7DJ6RgYgwsCmqsScAa8GjMmT/bDQubaOcHpeGcC7jf25mTslxnJVY+bxByW84gvcpys+Lv9kMPKeHdtGlKWt9oedhlzyM60US4Hoa5t41Frop6E0krt81Vm3yuf8E=
Received: from BN8PR15CA0034.namprd15.prod.outlook.com (2603:10b6:408:c0::47)
 by PH7PR12MB6980.namprd12.prod.outlook.com (2603:10b6:510:1ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:27 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:408:c0:cafe::9a) by BN8PR15CA0034.outlook.office365.com
 (2603:10b6:408:c0::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:27 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:43:44 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 27/45] drm/amd: Load SMU microcode during early_init
Date: Wed, 4 Jan 2023 10:40:16 -0600
Message-ID: <20230104164042.30271-28-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|PH7PR12MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: 6baea5ac-0240-4b33-e73e-08daee72f184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/dXUTAwrH45xySuNDktkWlyWXt9P6vLjbhUjJ3c2uXiv847OQYpBG100PU9YkGYmH/sIYhBM3eeJpUlEqzBXRIfoJ0/1EoiohhRH7ROxZR0Ed2U9XnVLJ5FXLFLVifvUXR91JO/rYFMzgC4+rnlEeQWB+RMBk+tmnaOlNeHAXPahBPZp8Y0niTURIbK40UVGoc/72Sewln/u4jQxvAyGGkh5ElW6X74B9hXZb64q3RssuV5D6ko4hecP2tMsLnVj8Pi52MZq9mIsowLmw3dSTRrq3xBVNlQc9CaKPbmmVT6KFtvqyzCgZziwZt+elfGEtkYyooc4SYgmlPCXdtpinEu+bXaL4NnLmaXUcBdPSaCchxIKfetYv1xL2d9g9E16VKFWvy8Qsxv1B4hjEk52+iR359xFzy64GQpS9bblLGJDFIMq8SdAEhjvqVqEBTYmLXvcPguq0OVUAIRd4HWGRRIide1/KRMYU6Ji2LOADNqZTWtjS8lRDM+9x3p9Jl80Ccf8qz1N72DDfOd69PGK0sfVobXCsduMRuC1C9GwTmH9Pm1sOiLmbgO+xYxEkBz71uDVwjA1MGPCV1TGMkjwmf9dCj7Jug3+99HZ9iwyINjU9P+nEVNeYULV0/sB5XQNXuZsp9HBuUk4yVXdM1geN3aa87fRXXFpTIo1MSiWo2FEyzJB2AbjHoMf2Zo9yq7NXavF+ut9GjtgJW92fCSZTTQhPR8YvckM41Vg1K/sLY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(47076005)(426003)(1076003)(16526019)(26005)(336012)(82310400005)(7696005)(40480700001)(6666004)(86362001)(36860700001)(36756003)(40460700003)(81166007)(82740400003)(356005)(2616005)(186003)(316002)(4326008)(478600001)(41300700001)(8676002)(2906002)(5660300002)(8936002)(44832011)(70586007)(70206006)(54906003)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:27.1579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6baea5ac-0240-4b33-e73e-08daee72f184
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6980
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
 Evan Quan <evan.quan@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will ensure that the microcode is available before the firmware
framebuffer has been destroyed.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 2fa79f892a92..ec52830dde24 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -623,6 +623,7 @@ static int smu_early_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct smu_context *smu;
+	int r;
 
 	smu = kzalloc(sizeof(struct smu_context), GFP_KERNEL);
 	if (!smu)
@@ -640,7 +641,10 @@ static int smu_early_init(void *handle)
 	adev->powerplay.pp_handle = smu;
 	adev->powerplay.pp_funcs = &swsmu_pm_funcs;
 
-	return smu_set_funcs(adev);
+	r = smu_set_funcs(adev);
+	if (r)
+		return r;
+	return smu_init_microcode(smu);
 }
 
 static int smu_set_default_dpm_table(struct smu_context *smu)
@@ -1067,12 +1071,6 @@ static int smu_sw_init(void *handle)
 	smu->smu_dpm.dpm_level = AMD_DPM_FORCED_LEVEL_AUTO;
 	smu->smu_dpm.requested_dpm_level = AMD_DPM_FORCED_LEVEL_AUTO;
 
-	ret = smu_init_microcode(smu);
-	if (ret) {
-		dev_err(adev->dev, "Failed to load smu firmware!\n");
-		return ret;
-	}
-
 	ret = smu_smc_table_sw_init(smu);
 	if (ret) {
 		dev_err(adev->dev, "Failed to sw init smc table!\n");
-- 
2.34.1

