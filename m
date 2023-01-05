Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B0565F206
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3D310E7BF;
	Thu,  5 Jan 2023 17:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C0A10E794;
 Thu,  5 Jan 2023 17:02:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S86voKqC3bt+o7jstD1obf0k2CZ+EKVjpXWb3yLa9itXgFA582pCzS9Wm2m2igTCGbZnsOlIqlhiwzoQIbS/y4WcN8InvIox+vcxCjGKDs7TF3wTkXMU0qA/GzxhqPvEsBqmhrkhuwDbx5N8suqXt2gBQjQre4fkBLyZT7vnW3Xe0RzJqqffSGNfQLQ5kt/MnW4YDkveQlco3AUuc9W+muTt5Aze4XNhqB+nlui7s3j9VrKam/vjkfLyhEUkH6pwvuAedvotWETI6wBDJvzysCnW38YWgdY42f0jNVBMvYhxpeJvPW+8uMTiAroItdyryGhcjFZ0E8nVaaO/nPyvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKBnu/wN8+8k/FWCetmYXkRd4E5LYNBHFYmXSUzroiw=;
 b=T4Q7ZxuYqiAyAxR/v9vqVMzNg8EnQBDU1Ed/+rwjXLLYrQBKY1ld/o88b895zUi/b2dBXwaOaDba28v4k3J1R+1KWFuDPXWezht9QYGLpIoKPUJ73rtlYMAo6WZ8KfIvEjUFhuO5ubZJ30ixIa1JKLVDB0FLfMLJTLJ9xv5Ss5R39KmNFrcB5wJX4BaFN/udjqI0/bQU9TZWhP9wOgoB2nWlOqjj6FbfbTxFN41/kE+a68dtLwpYUCYzkwcNcKGfe4LQWzAPzTlRqz1szGaaw6g3pvG3gSPVSlnyUHoXDAFvOmni1+tY3J6HchdPhWlqVBDL7X+u6G8oMlAj4ISsNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKBnu/wN8+8k/FWCetmYXkRd4E5LYNBHFYmXSUzroiw=;
 b=2xqu9Hf7JEDLG3nGapeGp3uM4gJZKBGB8IOI547Nj2C2/ZbGxSvg3jxiAfH6MyAj4NdB7Id8flwxWSQ5HcxoHglu/O3Pqb1FmBQ+Dp/oEAhcVYDTzGbB6S+FLhtygGJhwbTw3FGfoBL+pMMuUrGognbNgeno5O65j2vys3nu1hc=
Received: from BN9PR03CA0971.namprd03.prod.outlook.com (2603:10b6:408:109::16)
 by SA1PR12MB7341.namprd12.prod.outlook.com (2603:10b6:806:2ba::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:43 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::10) by BN9PR03CA0971.outlook.office365.com
 (2603:10b6:408:109::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
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
 2023 11:02:38 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 32/45] drm/amd: Use `amdgpu_ucode_*` helpers for GMC6
Date: Thu, 5 Jan 2023 11:01:18 -0600
Message-ID: <20230105170138.717-33-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT032:EE_|SA1PR12MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: ac36115d-9701-41fb-1f1c-08daef3ea962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9EdeVzewXw1BOuE2LlXSXLoGYKcw8gk+ZtGGJavQi9V2ltSzrXlLLWszPq8GE5QUKFQzEDGzJkwdQePhRZE9Yc8s87LIhsW3Px1Z9Wifm8M10Dq/VDeVZB29UG5+IB3FpXiRel0/MYwMQlTy3rSoK5S3bgZ1r6doypiCowYgPdbufTUvJzWjKCzglnDq+vYP0ThmVhMoy0hfyPWk7ZYCR3/ii4jTP9mYk3cnk7IBwcG9R3/JNVcN3PWwYRoRahBW3WIEo6XrEom/dKA97IUoYIuAY2q5NGU3fpd885tnq6bTtOvbwYsrxuwwRkc7oNNnjAL1kPDqVGd+zWdCNfoYMt+XNDcPab4XkeLSA4U3z70iyW+m3+fa+HrEG7gfCEYjuWFIszEBovHANYb9IZxmF+WEbNU+zXsBxy4BCuBu360cv/A0aoHNOcXIaGtu9QCcH45ZjUhVi0okfkVEkmBIpT8BVKQbhdIkCeRbwBlfYOBa20UkaWEimioUlFGxWp/JfPrsntTgHhxjVEdEJ3w2DZlFbfH3yUtv1Waw+SVYYnt/+c1vAdnBIGAOww7MQZMZ1u1h/N9Trj7Fve68YoPbuE/zarMlYq6CwWZtSf1/yuGVItqjtp/TAu329U9inN8sdLbIRrouPRmGyhzEc5hd48avdtx0w1BOTG0xFNRSZU3XFo7EVsf/Re0kYlEeb/APH336nizPch4kijAiq+lZwpD8mgcqWQsPNpRmEzknKrIRewi6PsEjoZUcfnQqJZUEmas+XzC+gAz6vg//XdP7fg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(4326008)(316002)(41300700001)(70586007)(8676002)(8936002)(54906003)(110136005)(44832011)(2906002)(6666004)(7696005)(186003)(26005)(478600001)(70206006)(16526019)(40480700001)(86362001)(83380400001)(2616005)(1076003)(336012)(36860700001)(426003)(47076005)(82740400003)(81166007)(36756003)(356005)(82310400005)(40460700003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:43.4668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac36115d-9701-41fb-1f1c-08daef3ea962
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7341
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
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index ec291d28edff..d154ab48f507 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -131,19 +131,12 @@ static int gmc_v6_0_init_microcode(struct amdgpu_device *adev)
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/si58_mc.bin");
 	else
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mc.bin", chip_name);
-	err = request_firmware(&adev->gmc.fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-
-	err = amdgpu_ucode_validate(adev->gmc.fw);
-
-out:
+	err = amdgpu_ucode_request(adev, &adev->gmc.fw, fw_name);
 	if (err) {
 		dev_err(adev->dev,
 		       "si_mc: Failed to load firmware \"%s\"\n",
 		       fw_name);
-		release_firmware(adev->gmc.fw);
-		adev->gmc.fw = NULL;
+		amdgpu_ucode_release(&adev->gmc.fw);
 	}
 	return err;
 }
@@ -894,8 +887,7 @@ static int gmc_v6_0_sw_fini(void *handle)
 	amdgpu_vm_manager_fini(adev);
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_fini(adev);
-	release_firmware(adev->gmc.fw);
-	adev->gmc.fw = NULL;
+	amdgpu_ucode_release(&adev->gmc.fw);
 
 	return 0;
 }
-- 
2.34.1

