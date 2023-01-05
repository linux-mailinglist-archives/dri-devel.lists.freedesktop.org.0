Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEBE65F214
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA4310E790;
	Thu,  5 Jan 2023 17:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1998F10E79B;
 Thu,  5 Jan 2023 17:02:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Inzei/gIVbwnT4cLKZqEUoRZvHGlxPabC9LdNCPMB39uOZ5TswX+QN2D+Nsi5rEx2TD6Hl1RpHVQahPuzv4SMhVUszbqaTD5ijx2yMm/L92jpLgEZ5D7upVQaAIy9JfQMtGySo7PckKQpcGRui+3RKCP1sPhyGNA4lxDHTLQ8y1QOA7VHctM/VaRp1FfLKfkPFMQ2LYTn56tRPAr9tTAzM2NxveJ6zAMjUXzIDSv8FWFD55t9soBS3HD2Wo5V6BYO3T8GqS8zJ20xz1SDja7OzjTfAUI3AjWNQ8i7lvVTdx7MtK8WMyrnmdowgfgwiUJdiQaFNWqKAUuKChxIKNhug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAvtQBdMCbVznYho7TwBbM+xg8H1h/wQ/PgQn1RmhQQ=;
 b=K1PXw2ZPhTQd89UZiuTyD2k4CsMkbpw5gK4RnDTl3LgwaM+lw86+1J0v3Yri9nTJO4weowwgbM6uSh3CZ7jM1ZjyWxQ++uTA+hcwxXAhtDt/1VWot2ffRWk4f5FhBj5tuDAr6+man75ShSkAFPmQfVIsg7JYISNBkJ4L1JlQuvNo3lOJ/59sy06XulFpcs6hZ3zmdtzRf3BJFyh1A+TyQP+N8G+fomLuWcFaJLi4RObpesq3Aq2SSF13TMP7l4rcinS/9yTRTegz3/fB56xVJQaAdF8unp9smKcXXNPByjCtLqTnDP2c9FQIlaqKhLL8GqwVqo9CV9Lpyhth6iRXtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAvtQBdMCbVznYho7TwBbM+xg8H1h/wQ/PgQn1RmhQQ=;
 b=5o+WQTiWuhm1DOj1eN4vtIu8vat4iPCeZ0IKL4q5OF6r5I8JJZQJ+18bs44EBtRLs8SNO4/Dw2/xuIdBW86FCeXKzqGaqz3VPl6LgRqIFTktuqDbBZLaDFBZrvpVUkx7vXTN6r5iYeGy1Bl+LM5zKyU5jrepB9GvG8HVo5l1agc=
Received: from BN0PR08CA0010.namprd08.prod.outlook.com (2603:10b6:408:142::11)
 by DS0PR12MB8562.namprd12.prod.outlook.com (2603:10b6:8:164::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:46 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::65) by BN0PR08CA0010.outlook.office365.com
 (2603:10b6:408:142::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 17:02:46 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:45 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 37/45] drm/amd: Use `amdgpu_ucode_*` helpers for SDMA on CIK
Date: Thu, 5 Jan 2023 11:01:23 -0600
Message-ID: <20230105170138.717-38-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT040:EE_|DS0PR12MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d1ea55-6cf1-46ba-1f5e-08daef3eab0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Arl4AXsToet2eQilDDTuhRW41Ewerl17bc9y2ePTCuRwtm2Z18NQNc6BUNU/2J1R5N3akm+TXCyajbzmdN01GO+Qb0NbFKKLcF043P2EEXp9dxbBJ2EpPFtB3aGM21aT5A4K2VMcipdv0IsmXI6NtGY5+32mvpdYNBEowuAddiZ7WbQLZazDGXCQE6dS8bslXrrEULjwnK7yZJtJGWu00Af4AanZEogFHAS6Q1NU/xg1xIKGkpS4CBzKeZQafoe+gMCwxGd43xIdVueR7NIcrvRnb6JaOkQWL19kLZ/LXZJYYhYfZ5ZHnQ0YWA1Dm6vUmRLtV1ZQjxQt9/b5PFzc3oHrUkepq2reLyOhtZNXzg5OJJshDKBgltBoIisgXeY5NOMEvt3UtreTXFdI08XmgtGbBESfI3DRIinSUeVtx9qgRibZgruHjWcmqVrLaUp7uuhPhXXKKPovDAPvDZRhnNQ7+qaoCqVz70OT8wnxY45Y74Y4G5l/1GP/jgL6/LAYP8RMltW8WPWN3cfhyudl4ZK4dVIjs/puc8jjTFD2+y9JsABTWkYvyzOysR5/zeZFAZFsQ3GQ1l+UQGj71a06Xy1t1ZHIMiUU3SUDiIu/JbWQ7J41Y90w0abZF3GqCyg1RpG6CqevAWWwtk1wwcGRVaPub9z5XxnqfaQSzCYVlTC21iUYM3Z9qJPGYRl93np8+hI2xKgNW8emCYGQq+uPhit1BCGXZJxFDlI/qLXeU60v6MZQ0evcLs/A/zjw+HR10tC6rOVk0ROjEpIT8vf8TA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(336012)(1076003)(47076005)(426003)(83380400001)(2616005)(36756003)(81166007)(26005)(186003)(16526019)(40460700003)(356005)(86362001)(40480700001)(82740400003)(36860700001)(82310400005)(2906002)(8936002)(110136005)(70206006)(70586007)(316002)(54906003)(8676002)(4326008)(5660300002)(44832011)(6666004)(41300700001)(7696005)(478600001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:46.2783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d1ea55-6cf1-46ba-1f5e-08daef3eab0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8562
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
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index cbca9866645c..67d16236b216 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -73,10 +73,9 @@ u32 amdgpu_cik_gpu_check_soft_reset(struct amdgpu_device *adev);
 static void cik_sdma_free_microcode(struct amdgpu_device *adev)
 {
 	int i;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-			release_firmware(adev->sdma.instance[i].fw);
-			adev->sdma.instance[i].fw = NULL;
-	}
+
+	for (i = 0; i < adev->sdma.num_instances; i++)
+		amdgpu_ucode_release(&adev->sdma.instance[i].fw);
 }
 
 /*
@@ -137,18 +136,15 @@ static int cik_sdma_init_microcode(struct amdgpu_device *adev)
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma.bin", chip_name);
 		else
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma1.bin", chip_name);
-		err = request_firmware(&adev->sdma.instance[i].fw, fw_name, adev->dev);
+		err = amdgpu_ucode_request(adev, &adev->sdma.instance[i].fw, fw_name);
 		if (err)
 			goto out;
-		err = amdgpu_ucode_validate(adev->sdma.instance[i].fw);
 	}
 out:
 	if (err) {
 		pr_err("cik_sdma: Failed to load firmware \"%s\"\n", fw_name);
-		for (i = 0; i < adev->sdma.num_instances; i++) {
-			release_firmware(adev->sdma.instance[i].fw);
-			adev->sdma.instance[i].fw = NULL;
-		}
+		for (i = 0; i < adev->sdma.num_instances; i++)
+			amdgpu_ucode_release(&adev->sdma.instance[i].fw);
 	}
 	return err;
 }
-- 
2.34.1

