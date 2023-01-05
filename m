Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9792465E412
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B481910E694;
	Thu,  5 Jan 2023 03:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081D510E688;
 Thu,  5 Jan 2023 03:45:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+7LRKUiA6XJNW4kLbhGVWrzziFvlEAcdxYrX1sGA04OofqGHdfgQJ2V+glsclPA9Z5mcoSzIx3VBDYtneSSYD3bqoNLi5sGns2cVf3HpnCcnIzwI7nX/Tizs613b4PcgfrHgABsXkSQjPE8SL1biSr8O4bsVAZgvjR29OU1UBVQZuUgFnYx4O836N3v5ISeBVDzA2I/RDLhLKy/yHbDpdyEgPUZwyoULMMziC/BAkd3g9Cz1RDqbqbHKq7TJwsFifpj2ouznW2TdQq8PysHpBZK7NL9U+tOIm0TR6HjIQ6jcqXbuPizYEvwcC/jDnpXSqzwBF/BnR/3NJsuhC+bBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwDWqhKW1CmhCxEUUSpv13HQmp2uQC7pOEiNSBbviwQ=;
 b=F2up8kqGR40nWfD2wusN9UyBt922Qz/33zm5rjyn2dGNsdI/P2Q8GQbAHkpSKtQ0BVyVj0sTbga0/XrFWHT8iT5oXMUEDzbvhWJY8FnFBheKTJOjjhKMDtJZTNpM2E7Ze3DTr8ftWa7jc0efUnHavwhT8hEI3Y24VFfkUUOprzmyKtC+X+so+gJAEY5r7cc6bNesdbr5Nk0Qy7rgHRVQ+EFgOAdcMl9GAMWPhEoKVssU2fnuHQBBnaKk4+n9cACPkDS3EGCTG5rbEWaKWb8+04OD8dQsO7HuJzQ4CWdD6mTJPfd1NMaKvy3pAzhzua3EbptgKjio80KErMhnf6wsZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwDWqhKW1CmhCxEUUSpv13HQmp2uQC7pOEiNSBbviwQ=;
 b=z3v/j4oXJ6GYCytClbHZ4E9tX4Ve3mJy8zVJe/MHoSRH9bTcAFMNTpnx3O0K94HqzpMfe1+NfejgwYa8/vv05fnk2H5Qw9iX6ApUtUZG5MgrL2RPN1zpUueQOU5PchC6qIFFA4ooCp+eESW5pnLLbPvcPNVRdJvUrFypyM0zWS4=
Received: from BN9PR03CA0559.namprd03.prod.outlook.com (2603:10b6:408:138::24)
 by BL0PR12MB4930.namprd12.prod.outlook.com (2603:10b6:208:1c8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:45:07 +0000
Received: from BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::4c) by BN9PR03CA0559.outlook.office365.com
 (2603:10b6:408:138::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.22 via Frontend
 Transport; Thu, 5 Jan 2023 03:45:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT077.mail.protection.outlook.com (10.13.177.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:45:07 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:59 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 37/45] drm/amd: Use `amdgpu_ucode_*` helpers for SDMA on CIK
Date: Wed, 4 Jan 2023 21:43:11 -0600
Message-ID: <20230105034327.1439-38-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT077:EE_|BL0PR12MB4930:EE_
X-MS-Office365-Filtering-Correlation-Id: e14b20f7-6450-4248-7ee9-08daeecf3d1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I2LMU4xAyUN/6AXFj3EsiClDN8n7BWWV0q80/C+a0wN3U6IUvKbF2+wSZ5/cncoKR8gTbUo9AWt9Z3ePB+ktfNTisPdPoiv7qYeUeIG1lUQq3pS22jmBtFUcK2YoS2DsCqp0WBP81KrqamPXoGzcIO0kwVNqorY8HIOnZGmJooLO3z6bvGEV5JHWaYK1GxIDiwXCjbjD6XlLD8OChdl4hDTug8XX1pEjfmtB09NSKQga7FCTYXInmLhPm+l4i0Ghe/bc3X8jS/n3hb/etVklAVQK4ShX4d8VkBtle6k7xNi6akns0txZYmAKv1QBlE+NvYnQmbXVIYJ9UUuJea0m/dZgfXGuA0aOmFmxMCg4/LXzPK4ku2P24KmYptCrTyYImuss5E6nTn7KTkF6uu53ZO71vea0xFpIcNFzca75oArix2UAnAI/TApNAkL4uLsJzvcsf1+EVWBovoYt5Rt+V+cXDjfx7kqHrLKUfbSipyfo1jJiNpRWrNhn5JujleNUJ/4FhyIYeT8FZfRJGXMHOLBe6Vv7iZZ8iQhwKg4aVovKWhCuKEVMD0Q+MeahCxTf2rNMV+kADTRjHb/OdDrMH0gIGfyrkWPAlsXehrDnj2HvJBML5lsnb9vlKJJmKXNkJXo4NIHfDTZT4UKDXF3Svv+Wpz+5eHYyKk5+t8Iuj2qMbVdr2t12ukrEhVBSazsjI3/Hbbqpys+vIA6YpwX+Z0Pc5BmK7N4JGV9WH7ppUkoL6jvUIEJZEqY9JC7mbAXAOvKh4WFcE5hhx/4FWHyKPQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(2906002)(41300700001)(44832011)(8936002)(6666004)(8676002)(4326008)(316002)(70586007)(70206006)(110136005)(54906003)(478600001)(1076003)(2616005)(7696005)(26005)(16526019)(40480700001)(186003)(83380400001)(47076005)(426003)(82310400005)(336012)(82740400003)(81166007)(356005)(86362001)(36756003)(40460700003)(36860700001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:45:07.6993 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e14b20f7-6450-4248-7ee9-08daeecf3d1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4930
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

