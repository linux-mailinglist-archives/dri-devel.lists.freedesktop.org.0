Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD85665E400
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CC910E681;
	Thu,  5 Jan 2023 03:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F3210E673;
 Thu,  5 Jan 2023 03:44:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbxplND9Xq/viZvqOurGC1ExNxCMVcIBJpvsk05fkwbmXX/hajdEmFqJ+RvZLAL3wUupviLizrfnevNh3EPGTwC48RnupKZfIa4EPjzPyeZkS8lF4XgP6mA08fzz/I8+9wfU82SKlKLbLzqjo42zCgYW9n3vsgWblbys8BTZNGI/BerPpmO/zy7mu6SU7cB41wJnKQTkjKHbbJAWzpgZVYlgxFgpOX7Kz26xJtSw5Pgess+uFnmpH07Dze+aiBgnxAYsx3hxBRBi1BR6QZEhCXI1izvZkKNZA1hK48ZVH9pTNi8rmdq5bn1VQXE9+Rv17tWgxK4L+K4+X4EA2JaeMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wW0H8xBxxemXxfF95KVxKdkJQyW5ED76EiETZMHIwcw=;
 b=NGzKx4zcyCctIoM+XQEK6eOtiew5IzJdd/5T13kwHOosJiPc5WlqYLHqQ8Wt1Qj+3iwSIURmkM2v8zmRmrLT+QvjSFzvXnMIJvpxNWiWwm7wOdpsAgBH037yuqt3YR8OfR19jHKhZPMKcbl/XrvnnTIsr9515aHFl6xuHiCRgxneKCXvWppLFNUhOZTjPqguL5SIb2799vpaZfTgRF9DewkASAUV3zfNpPll1h51GKTR/JClp/rGFaMZeRFn5BODDaB+Q4h7LzLnBzqbJvb644ViwAxbeneZ7J/EKKG+vOzO58MZUnsiiMEUJMbx7nXG7M9b4vadh1dpiOYxu8sfsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wW0H8xBxxemXxfF95KVxKdkJQyW5ED76EiETZMHIwcw=;
 b=tM7OwD2AHpuPCnHlWhToL06cg8x1tKj0zFUnWwU0LvGgiqDJMM71UQ1eBZ1oXOkGyru4IdhbF9PsUReAsmveABxnHQOxu4WSkV2Mxx8t3NS65bMeFVrAXS9RnvWpbS1l29/116X9mcyC3YeyGmZuAYaHoeCVkyz8NkUS9degKTM=
Received: from BN9PR03CA0940.namprd03.prod.outlook.com (2603:10b6:408:108::15)
 by DS7PR12MB8276.namprd12.prod.outlook.com (2603:10b6:8:da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:53 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::fc) by BN9PR03CA0940.outlook.office365.com
 (2603:10b6:408:108::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:44:53 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:51 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 32/45] drm/amd: Use `amdgpu_ucode_*` helpers for GMC6
Date: Wed, 4 Jan 2023 21:43:06 -0600
Message-ID: <20230105034327.1439-33-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT050:EE_|DS7PR12MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4bf051-8f69-40de-20fd-08daeecf348a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DCkEWdOvBg11Bd1a5tnfjL/15iWPs//L7ddoWXjWvKnXAh3168AiiO1AgxqXWPhQ2q8Pz5aXxlgHzYF8cVXA641VbYxMXtZffUpHC9gvw5AoOFUR2TQhGPyeW/rqjwUe7RyU0Lwp00IXctmI66l+20S1YEaA+S5pnN24LbPmVKSraOxbeWoDnHzKcbHCk9oD5qBopOfOPJR9JcpeRZwLKiRa97GlGh8KxIPBNthVGYVTBEytiD7D6iBXTu+GtqIyeChxz46fc+QWKkOLjJQeJALdlJb4Ar17jDPEuSrPevvCnioDpnbTrefuXuq+ytOCuedjtQayAjZzH2BMxYVPQ7kgzqAf81CBqE7ZXuj9oniR18RTCpfqhhZJPLD28dQuzNOzrk+jsj/TTtYSxKOgKnHUeVdLOHwLSykiJhmbc95nnlgRIBRa13ERvKi4gIb3nJKQ3LVbWA95/IRVW14CSRdUN1ZLRq1zr7xHVUMLEz2x/fdeh8rT9KFbhn9J7YifLvn9rasL+UTX2wk66cTWdoJYGfNED8nBPUpF5d7AvK1QImaNVnhDyUTihLTEIpdWk19Bks5ygOH4Wi5WIA7YoeZYzKOOl+LOPg52guFTA+fcfDC1H6IKYbx+iPc9h0O96aQlhXYJWKSK0IEJz4WdevCHce3RcEOAL0L4oiCFk4+AFLXex8rAbVkYy5UiZPmjCU8qbUnLOVfzoURQU7lkLdH6zLJnYZGiQI7exM+wkeMCHBVjOZ/85Rrha/cf7hM3QU9JFggGTeoR/XRZ4pirRQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(47076005)(426003)(83380400001)(82310400005)(16526019)(26005)(336012)(2616005)(186003)(6666004)(1076003)(40480700001)(7696005)(86362001)(40460700003)(36860700001)(36756003)(82740400003)(356005)(81166007)(41300700001)(4326008)(8676002)(2906002)(5660300002)(44832011)(8936002)(478600001)(70206006)(54906003)(70586007)(316002)(110136005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:53.2986 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4bf051-8f69-40de-20fd-08daeecf348a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8276
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

