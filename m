Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE5E65DA82
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1357710E5AB;
	Wed,  4 Jan 2023 16:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433E210E58B;
 Wed,  4 Jan 2023 16:44:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmrZ1eFTxhOel/QpmKQ/u0oxxYtTajk/2D61cs8XaUx6Ceh/DtimZxK/JGowTVMx53JWhni/TpzQxU9cz4XyjxR15JdJG/P3edWBm04C3QNjMDutRvhKC6zJvSRXutLXor3KG0cN1hj/zF6LAOxvEiKnoew8y6roPTV5V0G5m74NmHknZoNyrErd0ar1On/epZabwZK8VSA9NHkfdLsCfBZCJmqzM2yjcyTkXgzCL3E9Nnne6G7jx58QXzBZ/TTqLA1lkc5M3ZrIG5sm1LRuP9zG8IIvLRNgbd5zFk0mNBqtcYfJZz3gL5Dl1UdDRjYMdLOlWW5fSV4pqh+vBKZvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajYXM5ERvcqp8aaPolHyK9jd/3gjnZ41YWnQyfSc2w0=;
 b=BnVIfwhApp8a7+rLOJDBL+hgkiNkOQH4wcY1CuhhL7ISfg3c2lxVxKraQ9wkAPXRwZeKoA55p3R9fdH4fD0549sIAV+vb5HHnQgFL5qguh4dDT5H7u5uqWsI8vbN864L/cuS0pvsJle/CTCcNG9KOoDJKmMjlYvMndlzqDDkkKJNP6AyZ5mk3ounABczUKk9HVDwoHbwQS0mYj9oNQvYfJ9WsU/MCBRyAPadjqJnQMEefNKwhfHVXSE7XugyAJoApVM773X21e5BJx0d0mIYGK438eALErFcMsP+Uw2/5hDFs8akyCA0ZuWsdVY7GAQUlolndgIlesEtC4HBbUVwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajYXM5ERvcqp8aaPolHyK9jd/3gjnZ41YWnQyfSc2w0=;
 b=oqEUEnM4HNIebHVNQ4kiBqtBToo/9rMqnUeInyul3cDF46Ga+XDTQvyNaEQz8UNeC2p1BRQppi6IVf1s2+f28h/sE5ES3iM61vHjsTsDamVJqm9VggbRemGE6QrLxKAO/QljuboWLwVqNMCRjZ+e53DB+WWdXfDCwbzo9GWc1Zo=
Received: from BN9PR03CA0605.namprd03.prod.outlook.com (2603:10b6:408:106::10)
 by PH7PR12MB6564.namprd12.prod.outlook.com (2603:10b6:510:210::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:29 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::1) by BN9PR03CA0605.outlook.office365.com
 (2603:10b6:408:106::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:29 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:44:28 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 34/45] drm/amd: Use `amdgpu_ucode_*` helpers for GMC8
Date: Wed, 4 Jan 2023 10:40:23 -0600
Message-ID: <20230104164042.30271-35-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|PH7PR12MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf7e88b-9ae7-4e28-6fcc-08daee72f2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XZjPUlU4ZvX+Sc/HSahcgs3pEGl9C/ROXssA9SNYF/5AGv7AKb+/Q2IUk6ErNPhSYWxjzxubfUsQnTU8ThcjR4C0guliwe/9j90wlZ/lUvLu3529uK3uAGeEN9QG3NHyNujHZvvDXuSliZk2satm8XfSUI+rnpwj+6Q805WJEDlXHkZ/aL3JABEA8A9sO/m4/4J54lq8MUaiGg4rN8d7EPjw2gNm1VRrshtDjPRQCF303U/2Hnz+qVgzPXv1z9sm07uFlPOvf0T62Q5mP+V0Zo+0955OGhZGZunRMDnHYXCaXox/DDJ+GvloxoVohhJfE96vUopLJsHDxSiN4+vvigkFtR0dm/uIsYnE5wehGSVRygbt3RCghElLJh868Zaxx+OnWfj75Nw/bPtyAJ4whjdt6HcVICPKrsBpLf711MwFZ+UYAngFVcbFwfDYxhFQjCFK43YSkZDMlTjGpMMQh6cleXAVSbDYdBBMYO7NFCEF1tRHD88KLmhPyelZyd3reCIqSh5r3z/+BwAZXO5haLR9KKfL0Lvzizh7Kn9oKUAUdb9EinxZv1WnfSPZwac0PG1RV94TW0DXz/ojIdNMrJhDq+0VEYet2NEn81/Hl4+7/QnilAE/SIqM0Q2A0Gc0jkFKEC8dH50KgHar/QVnrX0QwrOqEfONWtaSU5xTC9piNTmhvkyW28LNSLYoMs2lNPTtrUluv+pLultvb4jkruZ84LN6YiRkXc2Nk1IrTFg/uAd+rtjq3o8UuIeXRHZyE9pOOG80is6sz5/et0nc4w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(36756003)(110136005)(4326008)(54906003)(41300700001)(70586007)(86362001)(8676002)(70206006)(82740400003)(81166007)(356005)(36860700001)(186003)(7696005)(478600001)(26005)(6666004)(8936002)(2906002)(40460700003)(316002)(82310400005)(426003)(40480700001)(5660300002)(83380400001)(16526019)(1076003)(336012)(47076005)(44832011)(2616005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:29.1839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf7e88b-9ae7-4e28-6fcc-08daee72f2bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6564
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

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 382dde1ce74c..caea65de3e85 100644
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
+		amdgpu_ucode_release(adev->gmc.fw);
 	}
 	return err;
 }
@@ -1203,8 +1197,7 @@ static int gmc_v8_0_sw_fini(void *handle)
 	kfree(adev->gmc.vm_fault_info);
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_fini(adev);
-	release_firmware(adev->gmc.fw);
-	adev->gmc.fw = NULL;
+	amdgpu_ucode_release(adev->gmc.fw);
 
 	return 0;
 }
-- 
2.34.1

