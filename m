Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 434D065E40A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE0710E68F;
	Thu,  5 Jan 2023 03:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5323610E67B;
 Thu,  5 Jan 2023 03:44:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMX+fRtebGKXZbUghJWlhi/OL5COK8iihdqMcjy/0TNwzZJpZASegDczByKVXixszbagocMc4MNSQ0T0e6LBSjrv0U8KM6HnZC1+jiYhT24E9GDFzppGwZWbA7iUJusB+xtLHHpp9rO/f75I5QnHhitMmQxghaov/suSV7GBVTwOZtiT7ov8oShqvPtqYqj//8v9RZvqz1rFPxMg2BPNLX9IgagtUnptvzMnW4Em59FWBRHzZBVVcMSOV9MavUIW30Taw+e7XUPCyVaHPE+lQeE3UwLOdI7AIZSIKTlU9dNBZAPecQFKwW/4/gG7u1/ibFKP8Oy47auJ4kNpHNq+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEzOfLNoLuBO+vsPh0E2MZNPLD4LLYELPOVzfnYbIDM=;
 b=Ix4GH2Y8zkPBB1wG5giRL+KYLA0Ob6IouiV0qo38AWGSMwJBryVwmUYo7+TT43M/3Bxt8eFETpqwHvsRjtOGGynN+X3hDLzcS3K7z7Gy91IIDsaczhVcpYvvC0AMttvibzh1ng4cY7eOP/c0Du1SsBykBc5FWVyNiCI9yr0CMLXQLfCQpiJsP7ebLg/FWDOxnIu++Qm0Q02GqkpATH55kmBSWq5q/srdOin8VSLvDPqRIp3s954PMwYaRzOJAlrgCdwWD9qA1fygymAWqVhnaZcWJhZb3Tiy/7pVPronAJcg9iawhFkuHcFMulRt2s6AtuCHwVDmo6yYStJOA7TNRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEzOfLNoLuBO+vsPh0E2MZNPLD4LLYELPOVzfnYbIDM=;
 b=vnhPkCFLDE9PpCKlWx+EdIWIs44kHjBqOBBIcM7Yaoi8m7TiAV+LDGKDWcKMVAcSfFrfPLIxcnVD2lqYH6bi3UtboG7zpdNfLZCT3azVbbRH6438I82Qvt91vt/kMNIsCqaR8niP4FFpDAVadmXTYhQZKU9VI+k+Rgw8fWeqGwM=
Received: from BN9PR03CA0809.namprd03.prod.outlook.com (2603:10b6:408:13f::34)
 by DM4PR12MB5135.namprd12.prod.outlook.com (2603:10b6:5:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:56 +0000
Received: from BN8NAM11FT084.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::bc) by BN9PR03CA0809.outlook.office365.com
 (2603:10b6:408:13f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT084.mail.protection.outlook.com (10.13.176.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:44:56 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:54 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 34/45] drm/amd: Use `amdgpu_ucode_*` helpers for GMC8
Date: Wed, 4 Jan 2023 21:43:08 -0600
Message-ID: <20230105034327.1439-35-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105034327.1439-1-mario.limonciello@amd.com>
References: <20230105034327.1439-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT084:EE_|DM4PR12MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b094c3-4b4a-4d0c-f60c-08daeecf3664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 02WgoSRI/KBuMst4fG5lV4nFXfDqrYyeYNqmEjfwrCDu0x8XJPft5hA2O+CxTD8O7nuzCciRm8zacuHNBkuCWSmo3rxoIGLDUzRof0xWRCfTGNwHd0OYnszXF4dj30DBGdR8J46LIVZbFNBvxoI8tXAYJNGWRXihcMcC8EZHzdCTaFdlkXwb5PC/kVJSZkTw7D1qYK6SQgd7f/Ao96aBmOJQXuE7HeYRXV5l7Is6vNxi2p/pNBKUzgNVNkQyayo/wiQzilyKLBdT/q/qJfe33VoXGxued6RKGZpjwJjEfTFOOtPHNH4UHQbaN2YfofZE8CUsjZeYMs1V34xzKyg8tYYCKB2j+41/RpzlHpff5G0fqcBhWSYWa9t9CW3oJl4yjldFH3eQYzlJv27n1SbZy/pTtYY6ysX+Nh0A3j3HbfCLcNFK6IR7jBvEOm0bmSjElVLWGcBP7jiYqDK3tH/h0MMXBBjNw/rKMe3KO3SqA/GVMiEgggnG6pKcYdlmk00mHC6AspIh/TpitNKdKyDw8L514C49eEG73WCwfeAPdx8d4FE6mkzkDmZuYVL9k+L2L5aZFP7JieIh6YLPqYc++iqHve5N7o6LLY6DMoAP4Ho1E3z3uD06y97Xvy8QjDixBego6vV2jLPSwcJFmA9PVx7EQxvf3bdorinPkKtQ6dPHsL/YNy8YI/eh2ZZIfyBpr4BbZohJBAd0XXfafnnI+KxISR3NpR1hrqLz9vxEXVbRqYR2MB6JkS9E6eNmFfogJs8Py0uEPvq4azcx5rCjpg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(36756003)(70206006)(70586007)(83380400001)(4326008)(5660300002)(44832011)(8676002)(86362001)(2906002)(8936002)(82740400003)(81166007)(36860700001)(54906003)(41300700001)(40460700003)(336012)(7696005)(2616005)(110136005)(6666004)(356005)(316002)(478600001)(26005)(1076003)(47076005)(82310400005)(16526019)(40480700001)(426003)(186003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:56.4104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b094c3-4b4a-4d0c-f60c-08daeecf3664
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT084.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5135
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

The `amdgpu_ucode_release` helper is for symmetry on unloading.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
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

