Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3B465F211
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C0610E7C6;
	Thu,  5 Jan 2023 17:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4E510E7AF;
 Thu,  5 Jan 2023 17:02:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XN7wXjCbvn3yecgz9xlmPxp9NiU0VKHxlU/gGpG+wi1SdayoodNQ/SzZTWePt6Xic8xT3t5nsFz47stUM3kbzc0w27WLnGGaAwN1Anj4qh9P5L7jKMbQ3a63iJsi390P5dmc+X2SvoY9OnsuZrKdvqRHdpUcT4R4G4AFBlRGNO0Ekzg/Lxo9Pyr14MWfNCh7i08z1pdG5FIz+DlfDwb04GYRpeGmfbAXxNIuU+W+lpObwE8YpCgCUY0iAib5oLZaCm/nslts3hpybO2PlWztnDZjZvZEOKGFLA+/kZyU4D1vH+ee1RsdwgCpjdg6ER1ZeXtRq7SMMcfBM50oi8aT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsWjDcawS4yZdq+sUv3zGzFYZNKhuoLJMWU0sY10XC0=;
 b=Zp3tiiKOi+x9G4w4b0VQ4uw5dBXun9muyLdh/CTXPAH6X0DPwYZkphedVWn+7i0eTlsMZANpnT67Ml3FgqrSIXSzIWfjCR3+kFtedbg8XojwjUiNokl97EeyccsVub7rEk8tn1k9Y6oUT7LW/9J/a90cIZSnIwqPdkauiKCYqAlDVFsnC1v4CeyAEZ6lsRMBrYYpfaAunn++zmHAj3c4lXsGKbFnMZVxloNbAxb9oND/TVn5IrKe010/w2lugfQ869I3sQt25iwL3GE+RcOquVYMMLbEAfVbDfRc6PXOYH9ZcYIt/OQ5tAH2O2SEgr3y1j1r03vXLPKxvwIYpgk0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsWjDcawS4yZdq+sUv3zGzFYZNKhuoLJMWU0sY10XC0=;
 b=wbyknZeePaSslA8ExDZhuv1TRNRtMCl+9JuYwSpUmf8Vffh6wf0kxhFOV6gSdHVfUK/iqJwcIu2RenSzy5jCI21w8VoIhJWgXM4SdVIYb/orGp0Z16jSwEeqTxoLBYBXJXzqLVkX6eHgSIFaqqHQb7iasHMSgv+kP2LuJfJqHFc=
Received: from BN8PR03CA0009.namprd03.prod.outlook.com (2603:10b6:408:94::22)
 by DM4PR12MB5038.namprd12.prod.outlook.com (2603:10b6:5:389::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:52 +0000
Received: from BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::72) by BN8PR03CA0009.outlook.office365.com
 (2603:10b6:408:94::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT104.mail.protection.outlook.com (10.13.177.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:52 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:49 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 41/45] drm/amd: Use `amdgpu_ucode_*` helpers for GPU info
 bin
Date: Thu, 5 Jan 2023 11:01:27 -0600
Message-ID: <20230105170138.717-42-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT104:EE_|DM4PR12MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b9df4e-ebbf-41eb-221c-08daef3eaed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g9HrHfukg6Ul9HuR0ngRchhaiiJDSuoinx3AvmlUUhhPa8w1rGTINNbUAV99qj1obFfYdjv0+XCZV2qMEH+BNUZLIdNfXWBZG/Vb4vfEgyaeHy+4TGUCArJ3uGv3FWWleZVGc0YEpWJ863VSIeKyAZpP4DeKP67ClRlz2i9Qp1/cFHVomIgF0XI3jApT4SAQQGS8ruLJWF4stpcIH4Mg/NuEGhiLVujVWCpVeCwf+jb4513R2xeE9r26FHs94Bs1o+CxaPuP6nr/J3ofe9Kcfbrb1ZrSdZTacKIpS6pA5uDup7Vo4UEY3EMPAC5Le8V0vUO01et/nLOvPx6MWXynAjPBj02Y6LcVikI6KpNpboMJ1az1xTdrdKs4WvIWZSpy74hyKek87R66DseAxmdXfu82pD8WbhIf+K7PmIN6gBZazw+znZc4etm+RvbdnQPb/n+EeiosR6qxFdlNVLLJjmXIJ93Tu/516Lp6ZiqIm2Sa6W7UBsqjKubW2HV8c+0akSdF+TZuXA2iD3EYLM2tw9B9sqR7VYq0jooZCCzji76v0gljCwBVzoJdDp6GCxb8r9UDEbGNe75rhzEs0FS3MzGgWcVLARKtGt1/OL8FqbEAgOFX1EXHwSSU56xjgW1cTonQa1BjMLNx3TT7GXSVv9S0sAqo6o0aghRUXZ1oTM5GcXC5xp/1iUIxKZoeRJZg6wXH+OKTdsaGN17TLVI1dcvzHJav3WVkMrvA2D4ajRkvn69GbxYc9tBkb4vyR1x+/85Vq/RLU1Kw8x/VvDuViQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(47076005)(83380400001)(426003)(1076003)(186003)(26005)(82310400005)(336012)(2616005)(7696005)(16526019)(6666004)(40480700001)(86362001)(36860700001)(36756003)(40460700003)(356005)(82740400003)(81166007)(110136005)(4326008)(41300700001)(8676002)(2906002)(70586007)(5660300002)(44832011)(8936002)(478600001)(316002)(70206006)(54906003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:52.5935 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b9df4e-ebbf-41eb-221c-08daef3eaed5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5038
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index cdb681398a99..406d53ac3096 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1983,17 +1983,10 @@ static int amdgpu_device_parse_gpu_info_fw(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_gpu_info.bin", chip_name);
-	err = request_firmware(&adev->firmware.gpu_info_fw, fw_name, adev->dev);
+	err = amdgpu_ucode_request(adev, &adev->firmware.gpu_info_fw, fw_name);
 	if (err) {
 		dev_err(adev->dev,
-			"Failed to load gpu_info firmware \"%s\"\n",
-			fw_name);
-		goto out;
-	}
-	err = amdgpu_ucode_validate(adev->firmware.gpu_info_fw);
-	if (err) {
-		dev_err(adev->dev,
-			"Failed to validate gpu_info firmware \"%s\"\n",
+			"Failed to get gpu_info firmware \"%s\"\n",
 			fw_name);
 		goto out;
 	}
@@ -4030,8 +4023,7 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 
 	amdgpu_fence_driver_sw_fini(adev);
 	amdgpu_device_ip_fini(adev);
-	release_firmware(adev->firmware.gpu_info_fw);
-	adev->firmware.gpu_info_fw = NULL;
+	amdgpu_ucode_release(&adev->firmware.gpu_info_fw);
 	adev->accel_working = false;
 	dma_fence_put(rcu_dereference_protected(adev->gang_submit, true));
 
-- 
2.34.1

