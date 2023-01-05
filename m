Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A2F65F1F1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560F110E7A9;
	Thu,  5 Jan 2023 17:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9823110E791;
 Thu,  5 Jan 2023 17:02:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULODzB0iHjYTbgJLoznJPwbUiWzYAaXNPYqVdnvx/Enk2GhQ9PyUa7G99u9c2ZiGQCH3lWS1vvSKl2wAUx70LzcSaVY1O2TuIFhBkhMvNTOA+cwZWV1JBl/JGlUQYdT0IFi6tjPLmgURPGNbCVNHBS7GZ0h7lovIntLW0400IyZz9Ww/ewfzE1jpj94q5Wk09n6VLFU3FWeiVfw/rMSzgOLRHZtxVziFr/G3KrpLq/9g8ETP+1SSYdLOC9wpQC85REZ8xIqEHYKvv/6vcTb2NqPiXj8pH7OyaNPRR7m2/sxUPDMeuze+gNgwLNnZoP3e7JZGIvJLNnpINroSalFe8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrtFWizcAxL/nTQlLVgjC7hYhUh0auYr2VX6N00p/y8=;
 b=M3V967wS4JPbeq6557Ooh/yYMBrwW749pLi8U7U7k1uaSTIt0f3LrvbhyrKLeF9QGBfl/ijHEBXSEFMzWJQRD7XYyf90UuEjlamHogyAfp8gbh+D7h9r6+t7R2SPkTfiYu4gqhIf8oa882Uuw3d42fd7r2fbMk3kFndWAZ4OGZ9CNy+lhvw+ibDHu7+MHSqbPjC1VPZQGVyolFpRU0NUGWtAG9tctfpzkNSBp3binxTxRFuqzJWjLoWF3pWQ182lOHFwZeogN20FlXoP3lO2PhcPxPfwn7FgucyKzHuzC8dNTOsJp3C+S+lNDSQjBxx2ZgfjmBkfnhKoaH5KPfxY6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrtFWizcAxL/nTQlLVgjC7hYhUh0auYr2VX6N00p/y8=;
 b=PDhKxjTXNKKE3ib9GNlQEUIhc8FUa4SYQvIFxuftqGaIAjAmzveaqxKTYrwt1tcpcUqJe4EMk6IEbmjqNBmiCiUFeWa1Qo3JskBMwYj5ygOf3pLHNxFlJ4HRdsmJ8H1q7r+YrNAZuXS5rH8ZxkFNANM+9xgTAsSnET204DXHB1U=
Received: from BN9PR03CA0962.namprd03.prod.outlook.com (2603:10b6:408:109::7)
 by SJ2PR12MB7989.namprd12.prod.outlook.com (2603:10b6:a03:4c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:44 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::3c) by BN9PR03CA0962.outlook.office365.com
 (2603:10b6:408:109::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:43 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:41 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 34/45] drm/amd: Use `amdgpu_ucode_*` helpers for GMC8
Date: Thu, 5 Jan 2023 11:01:20 -0600
Message-ID: <20230105170138.717-35-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT032:EE_|SJ2PR12MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: e710ba28-df71-4481-1b03-08daef3ea9a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xRsBCZoj5e28DtPIEuD9MQGvnD94+frZVQ2b/GRCxGBl52lONvX9QhU0I35LyvXT9fbrPlND3kKxQjt+LaV/XpcMkHxmNoWB8kEfV/svD3CdpMO9M5PXYq2vaKCTnav7uw71uspKOphK7OGZRAX1quaf3s5/fufcFDQ+8JRmCTUnI5J+tFWRojE8C5xAi3khjnCWIqjuw1g7cWwofG5OK2/TLS7a9cPw8xfYbkEmUwYYi+Mr8X0DHp9t6nhId3DBE7vB4fSPJx1tBuQ4XN8XxMXDpYnMmtkx6fSY/YZCpQefwDso8pF9xazwaFku9STWDhPyyiC3Vz/ttUkMlZaxotdGZDN5XUWraJTWtzzsX6qCOltGpzAhalPn7blbhqikbhu1qY/adc5PybLWEHiVxFEF0FrRo1q4daYhsL21q2aOrJV2870lzJ5dT45RsMQF84oHLk3y6ALopyMpuguZjrMydEG9B6lh7rNYT1mZ8umJbsfAEjO0kfZh87CpqQ/0MooClyTHFQcBeNiBRwvWW/hI5uhe9utjB3UCCDVhDGFvn420rqWoqfKiUZAhdnpGNSSKB11g9ITZwT1stOfQh1n+WryDuCF3S6g+MlpFhIHCyJ+PEEhHxiLF3BMgmuwh6HDBhTKzbidV2JgrLAAp3t+XTQkaMDMsIHSg28qATBSLsd9R84K7kvRD7JlvKPgd6h9QH/4MD1QLR1B5UexFpsXj6qofPhFcOTwfm6w2uLBQ8SuZ84x1ewZUVFPUY9ldSVeREQj7+wFic8cLGAb/Kw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(2906002)(5660300002)(44832011)(8936002)(41300700001)(478600001)(316002)(4326008)(8676002)(70206006)(110136005)(70586007)(54906003)(26005)(16526019)(6666004)(40480700001)(336012)(82310400005)(426003)(83380400001)(47076005)(1076003)(7696005)(2616005)(82740400003)(81166007)(356005)(186003)(86362001)(40460700003)(36860700001)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:43.8730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e710ba28-df71-4481-1b03-08daef3ea9a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7989
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

The `amdgpu_ucode_release` helper is for symmetry on unloading.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 382dde1ce74c..561daac2e6f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -264,16 +264,10 @@ static int gmc_v8_0_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mc.bin", chip_name);
-	err = request_firmware(&adev->gmc.fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->gmc.fw);
-
-out:
+	err = amdgpu_ucode_request(adev, &adev->gmc.fw, fw_name);
 	if (err) {
 		pr_err("mc: Failed to load firmware \"%s\"\n", fw_name);
-		release_firmware(adev->gmc.fw);
-		adev->gmc.fw = NULL;
+		amdgpu_ucode_release(&adev->gmc.fw);
 	}
 	return err;
 }
@@ -1203,8 +1197,7 @@ static int gmc_v8_0_sw_fini(void *handle)
 	kfree(adev->gmc.vm_fault_info);
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_fini(adev);
-	release_firmware(adev->gmc.fw);
-	adev->gmc.fw = NULL;
+	amdgpu_ucode_release(&adev->gmc.fw);
 
 	return 0;
 }
-- 
2.34.1

