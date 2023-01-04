Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0843965DA6C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051D410E597;
	Wed,  4 Jan 2023 16:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D2310E58C;
 Wed,  4 Jan 2023 16:44:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFD5vkwIKcq7SszBRvwAAGN7B2TfA4HpiVkwpjta0D9UFgVuKDqurkWo5BZZeuJ7arhkBNZvhuSp+6KglyM9Z+0mRB9yQnYAINsTTXCnkWjEB9tIWFVl3HwHUl0O3TRHO6X/w/BMWaJ/swRNcsl3ALXJBGd/OwXH1U+/ClyF44Hp+v2DscHyvSJc+71s2gDLYjEF3Fb1Q8TH08XvbstIBnZrSLlelHjpXTkesCggbo5ukzcS/bUL4R96SMe0WnJpTjYlEi+hTUiivcpOur0L+zcoA4CCvJTMigQm0DEGr450vf3xlR/WGEhOuUaLIUM4dopvN/K6xDWT25DLXe8DTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcFaQ6tiACY+u/8gC6lqi/OSCcd2YkehJs+D36wu3gQ=;
 b=PSXEc3O2W+xISb7heJatIlZcfpry4twatkjLsNwMz2jnB0kZMJ1cf+UopU4U/DYMyzaBaSxknYFEzoMEamfIL7F7ZKyEh7urpyiYTFxMGTX9HsGHRomvPA3mecVXTKGhbXQySSuTtV852WLsVdMXibQdymHoNwPBI8wuL9M/ZtgUeBGVx+fDpUTK2hbehBGoSl3Oks9abZ9jlbBEUg5zrjNlhm1stYH72+5fCgJb2cnzB0nbLQordodxw1Wk1CrlHOWGXEjIdB7WKTVZMDBaOKD302/YZqGJloGG6p9nOM755yb/D9qO/6NNcjJVjdRziWc5P33oLj5oOZfNR5lqwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcFaQ6tiACY+u/8gC6lqi/OSCcd2YkehJs+D36wu3gQ=;
 b=Ir7SZK6GlNO8bZPcA6K1AMMdbjr9cvY05caxDQ9HSLpLVmWUCeNwQ0Fn3x5f2gCUJBXBjwQcCqskjPrAx9Wrdwt4jeqAddcklFQ8kmcGz7cdG7gu+rnDOdNDAQRKzPtRiF5ra+Qlf/Dxy7/urR6D6M5RjtbTqzazSZxG1uNhVNA=
Received: from BN8PR15CA0020.namprd15.prod.outlook.com (2603:10b6:408:c0::33)
 by SJ0PR12MB6734.namprd12.prod.outlook.com (2603:10b6:a03:478::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:31 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:408:c0:cafe::c1) by BN8PR15CA0020.outlook.office365.com
 (2603:10b6:408:c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.20 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:31 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:44:30 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 36/45] drm/amd: Use `amdgpu_ucode_*` helpers for SDMA3.0
Date: Wed, 4 Jan 2023 10:40:25 -0600
Message-ID: <20230104164042.30271-37-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|SJ0PR12MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: f789f3d8-5390-4e33-2ef5-08daee72f3f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXrONkGLS5F3cXiBZWNxGGcA/qeN3sXgSZc3K+kAc4S8ts6uYKQZ+2fZgdcX5Af32PO1NKGCcjjiKJugOgxB3fUxCYisMRhQxPLVVu4Hxsm/k94fa7DNVtzym4JxvQ5IF5XAMt9UtGrLzjfJmuwPO/SrGrdz+nA0V5+nq8Et15qFgXGceRBGsM96DoHNcglwt3fPMVikf1IdnywiB6oPwYTtiFQTh16DrlfZaM166DMHz5wpqGrW9jzYdK0Yj2RUbrN3XEmDv8ceWbIsMqKpRSIhQU4ZydhRY4LPLmnyx6/TTIii62higLnOAXSRtwqtNEz8V0zqZJm+3aDZyPL0gq/Y/rGt9oRAJIvvOvPeZUBAjXJjYkguGELmQYoAjAYsMMB2kpJL1AB4EVPwtCGG7dRnzRHCesTRXNtX3HaqmfS8zN9gTfBLWf4No2eN7yW0hWuC66HHyP41/gxi+alCKd504M+l29DheGJnaFjyRglv+SQ+T1ZX59I4fOjja8c9pGG3cECxBwCbNnZKclrZV/Xin6l/5hBEFM8+lYy2bUQ0tH4PsnrB92FF5q879WqyJsJTD2fY0IDjSwgi/T6MEjgcRUZvv4I0K475mDlgjpuzO7ME8D5tyqOVaHbnYY6vr6YhM4MjD5DR27DtpigjRzVzXbrPqjHdlBwmw1YTKCi3ZBaTQmfhqxfUdu9dvKyBjYURddmo3jr7GO8XRhMDw9d1vjEPDdJFgaqBQaeeiHpy7/gMLGrRhZTKT6WsKtbz
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(426003)(83380400001)(86362001)(82740400003)(356005)(47076005)(2906002)(8936002)(41300700001)(5660300002)(44832011)(40480700001)(316002)(40460700003)(478600001)(82310400005)(6666004)(26005)(336012)(1076003)(186003)(8676002)(4326008)(2616005)(7696005)(16526019)(110136005)(70206006)(54906003)(81166007)(70586007)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:31.2360 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f789f3d8-5390-4e33-2ef5-08daee72f3f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6734
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
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 486d9b5c1b9e..337e348d5ae4 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -250,10 +250,9 @@ static void sdma_v3_0_init_golden_registers(struct amdgpu_device *adev)
 static void sdma_v3_0_free_microcode(struct amdgpu_device *adev)
 {
 	int i;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		release_firmware(adev->sdma.instance[i].fw);
-		adev->sdma.instance[i].fw = NULL;
-	}
+
+	for (i = 0; i < adev->sdma.num_instances; i++)
+		amdgpu_ucode_release(adev->sdma.instance[i].fw);
 }
 
 /**
@@ -309,10 +308,7 @@ static int sdma_v3_0_init_microcode(struct amdgpu_device *adev)
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma.bin", chip_name);
 		else
 			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma1.bin", chip_name);
-		err = request_firmware(&adev->sdma.instance[i].fw, fw_name, adev->dev);
-		if (err)
-			goto out;
-		err = amdgpu_ucode_validate(adev->sdma.instance[i].fw);
+		err = amdgpu_ucode_request(adev, &adev->sdma.instance[i].fw, fw_name);
 		if (err)
 			goto out;
 		hdr = (const struct sdma_firmware_header_v1_0 *)adev->sdma.instance[i].fw->data;
@@ -332,10 +328,8 @@ static int sdma_v3_0_init_microcode(struct amdgpu_device *adev)
 out:
 	if (err) {
 		pr_err("sdma_v3_0: Failed to load firmware \"%s\"\n", fw_name);
-		for (i = 0; i < adev->sdma.num_instances; i++) {
-			release_firmware(adev->sdma.instance[i].fw);
-			adev->sdma.instance[i].fw = NULL;
-		}
+		for (i = 0; i < adev->sdma.num_instances; i++)
+			amdgpu_ucode_release(adev->sdma.instance[i].fw);
 	}
 	return err;
 }
-- 
2.34.1

