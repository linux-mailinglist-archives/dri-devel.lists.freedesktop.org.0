Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E2865E3E7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC3E10E667;
	Thu,  5 Jan 2023 03:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AF110E651;
 Thu,  5 Jan 2023 03:44:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5KBDznJn5mhL1vFfJpQqc3qI3uyw4XBeJjq6+0PlMa9A7WmjzxI8di2mB/yStqE04KdPpt9dusZe4ixMC2dK7fNUxi/OX7KsF1DvpqhyMe2hWRIKtdfHgCOhEKl1cqtTjANgj/TWb1y9iAZQ2q7EwD28Jbvgnf3QJ6ewl0r/8Q/dOenMWB0PH2dj6gVjcA99uVn384laApFxtF3ylYm6rYkSIa2aKXWaHj5fffIMSYAVo6cjmI+wqpD20ahKwlHF3FxXSOq7ca2KyGzhhziDYcjtvcPLq/HbO6XG6sp217hmJemhnz9Z2Pd3olmNjm/kS3347LuZtUZabO+l1uVGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjC/g51Q5vzmvPkjwWXVsPV89lM7q0uHF7QYq6mysSw=;
 b=mwiodhT6XHG4LhOIhs0XJOuacz1rOJNxK6QFoN87r4BFypxJWZhtAJhf0vrYvVKHYaQBxtoLv1YrMhcnrz46UZLvnC0LwSkguoSlTU20FXTUZ0yN5NLNCKCiWRIH/r9nCwXmubKnZLAhOi6mo3ynIfVb3Xw7DGFbMMvIozVy0fzC5X1tYy5iJ2DA0b7f7lZsUPV5BCY/DdS9VvPtecBLVD4QfFJKzrnSuUQ5d2Cx1/hZqzV3zG7qLkPLGB2xGfltKmitzq6sHZXpE5Vi6pGiP7V9NAZsWN/p6B18GbWlDCmeJ4a0JjLlqQrCveZ5Olua7CNdmc2PaqkBU6kadMf3RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjC/g51Q5vzmvPkjwWXVsPV89lM7q0uHF7QYq6mysSw=;
 b=0H3H9FtA8cPyGxVjF87m6+oMG7eTfu5wHUzOsbjFQfL1xLtxUwhenI/5tdjN5bzXMQoWSgekHbqLA+NvcCFd72bdFzwmfrP1ptQ/zj2InLvkPvHStFUGA7RpL1mKJMld309ZnOGVXJjXXk42kZlEgoqXuwtVeoXC/l2vUJbO1T4=
Received: from BN0PR04CA0051.namprd04.prod.outlook.com (2603:10b6:408:e8::26)
 by MN2PR12MB4584.namprd12.prod.outlook.com (2603:10b6:208:24e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:14 +0000
Received: from BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::75) by BN0PR04CA0051.outlook.office365.com
 (2603:10b6:408:e8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT109.mail.protection.outlook.com (10.13.176.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 03:44:14 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:12 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 12/45] drm/amd: Use `amdgpu_ucode_*` helpers for MES
Date: Wed, 4 Jan 2023 21:42:46 -0600
Message-ID: <20230105034327.1439-13-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT109:EE_|MN2PR12MB4584:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f06e59b-5401-449d-5dfd-08daeecf1d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iD+3vXOki9zE0nOSWs6Pn/M7Zf1iIgu6lpajHHW00vTAmqd6RzGym5Vfzf/ka4JYNSKXV7jMyClAgKrRFss1hEaUi+TrZbe1UoKt1QXvD56Lok/mP+bzt7TyLkP/VG/e4L2hTacrCNmeHOnB3oPCOtT5VDQ5Hla7G0zT5JdbzT2QdE7f0JwrZT/bmmN2K7vwNGq7YhPAumsc+iYhWlJ8Vrey/62Ugj/71PoKwk6pE80c4H9lafFQHj4q57DybiM2YSAtSfigdHStmQAwDjaq/op0XOFc6SGoHOA3Y1B4PPm7nFOr/hHmsas40hjBj9z63lY5w/oHkD353CUQvGyueVEiys3xIr2cMc85/I1eyUSZE+lAlyjBQyptZVnJGcad+hdYHTPCh8I4qWoI1aCRTgXl5kt9ylmzOzZeSzhIX0PH5pn5TxKVhgXB7NwsCSNwyqv9rMBl4cKaqOIJGNjDjmMvX0bIaOIwuKrmkvHEOci+He3nJaAb8A9aL9jH+Kq33nfAjmpfx9wGjE6YXRzMK39T4v337S083KR0etU4GymBIOatJJXlN4zJ16K99N5UAc1u7o3eq5xC2tLzTG6ZOQi4VMsZXBfq4RsaTMTHLEeVQWqMLawlp6uVOCVYYZM/6Oi4PPlhW3fCn1dl+jIcBMnqHD4o3TfVm8FGKx13gnHTyBuiAFMjdHN4+3uQzYYR4PqECKvs6y4jgxTGAOgSQzJtR04DHDYFzyto4id6cFDDsbIp9nfsAN6Sh8G74P1okMpQetSVOZ5Mu9ePSbZL8A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(54906003)(186003)(26005)(1076003)(110136005)(6666004)(70206006)(478600001)(2616005)(16526019)(4326008)(83380400001)(336012)(44832011)(8676002)(8936002)(426003)(5660300002)(47076005)(41300700001)(2906002)(316002)(70586007)(36860700001)(82740400003)(40480700001)(356005)(81166007)(40460700003)(86362001)(7696005)(36756003)(82310400005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:14.5553 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f06e59b-5401-449d-5dfd-08daeecf1d72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4584
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

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
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

