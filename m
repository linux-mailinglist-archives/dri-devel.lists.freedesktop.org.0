Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FC877D95E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 06:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E89910E2BA;
	Wed, 16 Aug 2023 04:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2043.outbound.protection.outlook.com [40.107.96.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CAA10E2BA;
 Wed, 16 Aug 2023 04:07:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbNQtydryTNWbYK7UR/+zAH15WKV7DU458G0f8VicjEs2JYcxwot2xEvJte55srCc9yNnO+d/mjul+tgWtPmZvA1AEFtb/dSXVT9y/GvNB/UZnYC+XfjU4aErdCRGBMjTkO0bXWIBlaMngl5qhN9vcoBmI20ym+i4kbTaqpVXKZzEf7DNa1KjZ34UMVly2x6ZCv0eYZe/D1f4wWGD00g9P2BfG35i3wQZ9d17ycPTFeA+5lgCpnQFrNTZnHXzcORjQYoiV1yA5h+HKXt9YO7KR76H6FLUIfyHbcJPq6DHoAFXgRDwu8g6lXQf4x1v2Vzc1BmMLQazHyfDBUYeeseWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XypiDWd1BPjHu4g8RaNmh+WtbjKdAd6zqqyX6ubC2nc=;
 b=GdJgYY87weLaQF9h3cJHAK1sq7LVKInhNviVhW+ek/KdMHJMJxfV1JXYjN7ndQ6K5YuNiWcZixhYw+DGAEWrUdeaAKdZrHDOJQ7Bcie7HPW9AE7/2ULGwTCbf2gNQYFbW9uFmVPdHXhmXHuUGbqS6ArmzrbfGqfHS0GdBeXc4muci3T5heih8d05cKak5mRTLgK1YO+0HN9zApZp48QVvtCTzY54KDBckXnSH0iF+/CFfnEEGp+OZco21N4Cm/81QAIBfBJLshlcAhtr4zi6j5yWVpYrxz5Sen3MlHs0NdzKAYSO1JrbvDhekzyvO7/Pj2aH51h+DyV+G4dZNcAE3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XypiDWd1BPjHu4g8RaNmh+WtbjKdAd6zqqyX6ubC2nc=;
 b=WHLaOXekzXR5UscJTl2NwKojnfF8Emnk2U/QOKvLIGTmCXFDlb6vZBGSwNBYWgJJ5h0BeLLUDdCK0zxjyuXJ9PE8aN61jtWUu8zLsLgUjQhiumMH3L8EKv3PaMljyxw5EyQS/sfZpNlS5vAJow5SlSqq1b2quhA57nxrsgbMMwA=
Received: from CH0PR07CA0017.namprd07.prod.outlook.com (2603:10b6:610:32::22)
 by DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 04:07:32 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:610:32:cafe::1d) by CH0PR07CA0017.outlook.office365.com
 (2603:10b6:610:32::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Wed, 16 Aug 2023 04:07:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Wed, 16 Aug 2023 04:07:32 +0000
Received: from mlse-blrlinux-ll.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 23:07:29 -0500
From: Lijo Lazar <lijo.lazar@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Remove gfxoff check in GFX v9.4.3
Date: Wed, 16 Aug 2023 09:37:11 +0530
Message-ID: <20230816040711.690467-1-lijo.lazar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|DM6PR12MB4297:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a9ae99-4daf-4976-876c-08db9e0e5093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ur0nfs7+vpjI4F2SdWfHn/PRl2VGumI2pHI1Ummdoap14n9lUbWo48U13k7oVWoC2zolgYfS17R2/QypjxIFUinWIZaRdF31cjbVLW89C2jJzwHo3ewFF5CNLrobFimy8Dw0e5PrBpS6X+1IL0oi3ikeDWAq7a7fuam+E1AxyNmy0VmfEpQrHxG612aGh6xBgPr73co/pECBPUMjwCMdxx8pkrx0yCBcwfiKhf3fQYBa7KV2PYgeq/ZELcCGZncqpbVOgH0twNlPpabU6dW9xcjY3y8l024peAln7UvV8i2U1G8F1eBVE42iTGlavn5KSy9Vg93H/ts0ow5Dkix2jQtyPC47xdNXOCZVKdtygVSekrKee7xqHdfZ4P1oAsr9InzSKjCfLWts1qUEOwJSO/GF3Tlu9WBVKvSoGbsQwa/B+U73lEQkdv52sguRQ4JqzlMwopjdvBnSGhiI42uPXJeUUeICxOsTHvGFccPC9WPBUT5Xna3loUG+01Hrn3QxDFeajjInG7DCj5xabQuJv8W6m9Pdv6LNf8BBWzZVIsuhaMvdBBiuxoFVSfP+MnHYIzg/dSs6HglQLPJhBRxM6Do8wZXoy+DOptg3sipIjr0OAcp0pO8Cfq81I461LL3dTspPDtNspyBCPevfR3/LfcTPrH8FGKoehNqJTdeC4LGf54sH+rdPvtIQ/kXYRmnOs0l5esHd8JGGjNtx3KTRYdFhtPGnu3PHOBkftf2U5WPXVS1myXJsoLYGErjUA1Pcjh4xVbvEU2KTQmO9B7JS4A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(396003)(346002)(136003)(1800799009)(82310400011)(451199024)(186009)(46966006)(36840700001)(40470700004)(6666004)(54906003)(70586007)(70206006)(7696005)(4744005)(2906002)(478600001)(16526019)(1076003)(336012)(426003)(26005)(6916009)(5660300002)(2616005)(83380400001)(41300700001)(316002)(47076005)(44832011)(36860700001)(8936002)(4326008)(82740400003)(8676002)(81166007)(356005)(40460700003)(36756003)(86362001)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 04:07:32.1008 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a9ae99-4daf-4976-876c-08db9e0e5093
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4297
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
Cc: Alexander.Deucher@amd.com, sfr@canb.auug.org.au, airlied@redhat.com,
 dri-devel@lists.freedesktop.org, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GFXOFF feature is not there for GFX 9.4.3 ASICs.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index d8d6807e7b96..57ed4e5c294c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -337,13 +337,11 @@ static uint64_t gfx_v9_4_3_get_gpu_clock_counter(struct amdgpu_device *adev)
 {
 	uint64_t clock;
 
-	amdgpu_gfx_off_ctrl(adev, false);
 	mutex_lock(&adev->gfx.gpu_clock_mutex);
 	WREG32_SOC15(GC, GET_INST(GC, 0), regRLC_CAPTURE_GPU_CLOCK_COUNT, 1);
 	clock = (uint64_t)RREG32_SOC15(GC, GET_INST(GC, 0), regRLC_GPU_CLOCK_COUNT_LSB) |
 		((uint64_t)RREG32_SOC15(GC, GET_INST(GC, 0), regRLC_GPU_CLOCK_COUNT_MSB) << 32ULL);
 	mutex_unlock(&adev->gfx.gpu_clock_mutex);
-	amdgpu_gfx_off_ctrl(adev, true);
 
 	return clock;
 }
-- 
2.25.1

