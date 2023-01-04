Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ADE65DA88
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3448410E5BA;
	Wed,  4 Jan 2023 16:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B950E10E58D;
 Wed,  4 Jan 2023 16:44:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nt0fNu/LoWAPzsNFfc/WEyjk7fsaa0+Znm1uwI4Axlne+Xg/1g5FqHgiwmsy1qfDIWuhrCOBhBdgJqZg/E4zza7q+pGNM1R3qcB6qZLnD0ufq+a25dQXXXjC51LHuHo/lX/t0v2Zxdc148zuaQExABCSdiK1h/Z4UgyFYwftOL+gy8BgF07aHY/VSWx1/7S8RpzkSgVjAvjPlfPvGqOdtXvlenHHFZQA26kVtZdKv0A7j1T/fQZcR4IojjBnqQ9pUzK1XCpdvsBnSjyqoi9OKe3Tq1ss4yQjYqzuN3qFGTKAN6ZsBj54ImcijzjB/581JQ4c3y+gZzUm7UjlYl7kYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfKqq4ZfjgU4XiCBoOylCvIDUSAfYdnuISmcSjcrCz4=;
 b=O72k8P32KYbO46zf/h6yF/rzjfuLf1jQ7sD6XGK6Y393d3/aNNe1eiNZi+socd0m+t9BET12IVEYrsATaW2pG48f4tw2DEIqqEsTCxogOK25FtCO2x3gHmBYOXrwvr7pLTttqZMMZqGZgZumrkSof5TTxa0tGGYwkBAL12ym45dY4QB9NKVWYlZDXYR39y3LATfqHcPIf5UlBfzFX00sakciSRU3rZvzsiZYAFq0BPnRIARJPLmCyB/l39n59rYLE1GbXgvYcX/qTHTi782XFcx0uMraCZq9URGr32GS+oI9hq/X38EXybVtzNp9lDNBoe97s7yXEPdS9pVhqfgd8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfKqq4ZfjgU4XiCBoOylCvIDUSAfYdnuISmcSjcrCz4=;
 b=D13t7E3cFbpDoEYN3uqoue3KLAwZ43n/WVOyOuu00mMgPClvAczOSXiNgZ1Vd6RloXTxa/sJVi56BWeJK8dNoqws6qk0v/IZBnuynPv+zXvY9j4FgVbVPGXzl6QVUUf+eEvN9d9Y94gEsZbw+5s2HdO7u4+SRu6Pa1mvvrNCx/E=
Received: from BN9PR03CA0602.namprd03.prod.outlook.com (2603:10b6:408:106::7)
 by BL1PR12MB5873.namprd12.prod.outlook.com (2603:10b6:208:395::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:44:30 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::e) by BN9PR03CA0602.outlook.office365.com
 (2603:10b6:408:106::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:44:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:44:30 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:44:29 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 35/45] drm/amd: Use `amdgpu_ucode_*` helpers for SDMA2.4
Date: Wed, 4 Jan 2023 10:40:24 -0600
Message-ID: <20230104164042.30271-36-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|BL1PR12MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: fa35cc59-e8d1-4392-dfaf-08daee72f34d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tHIyjEWaEzhlMIFPwVyH+ipSALbRSft5YWyz0o7a1LucVAH+K1u53EYHlohe/8l0bBhkkJw/zCePWkGAfKKVBmOrcEiYbrv1Spk0RyeMDJekp9xOPonlmL+3OB5F+HxpFoLP7n2+NOTsdBOYP/dLxpCADiY+m3j8RItOWHVBGTlZOD4t9i41AkAP3Q8fBmsAufi+UQLs9kkclwCAuhSVyykQPCf7j0jYnoirKZeGVWUn254avJZtF0HdhFAgqIJVb2P3RT4jDNyt9Cz7VOO6RLSzyoESgJuNv5Uy4vWJyMXoG/lOWnTFjjikIQzBIhpX0Wydb2H2tq4QmcvAy1gaRzfLdLLd5ZYSGRlBeKJkg3rQxYBvuhdScZU3VIO2lrXvsIgW3yuhMOYsXY5AfmY7w3FzhUChu1jx56rxU9JT8mDWV+cPqnZyea55x3+orB6VFZ4EccNp3T5guF1berTo9S+fEq95jVG5nfcGcSSDemFvGSJaBueaMyYL8ySAEcvk/cbdcJR5nswpuCEL/vpqdkuoxSOVtAPXh6Z2O8VkFlWM0ylXq1jLA2X0FcfjyHA5Xji9voMYcarTy03y14VVgWvWXQT2EAKHooMnSHzxeuP/0iAbGbc3J7fNnBoXRtYDC4W+T+G1uCfDNs6gVdnbj2PkKmBY3tDs7z7qNHEtxGpSMxXcj/CLHoj3/MZgQvKdZYaPvuwv6biIuNlk+t0Ew1Wf6aQT163E/p6UF8vixkDrZYuWgKhjppqepshwWU8U
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(70586007)(4326008)(41300700001)(70206006)(47076005)(8676002)(426003)(356005)(86362001)(336012)(186003)(54906003)(2906002)(83380400001)(81166007)(6666004)(316002)(7696005)(82310400005)(26005)(36860700001)(478600001)(44832011)(16526019)(82740400003)(110136005)(1076003)(8936002)(36756003)(40460700003)(5660300002)(40480700001)(2616005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:44:30.1527 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa35cc59-e8d1-4392-dfaf-08daee72f34d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5873
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
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index c52d246a1d96..297695731efd 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -113,10 +113,9 @@ static void sdma_v2_4_init_golden_registers(struct amdgpu_device *adev)
 static void sdma_v2_4_free_microcode(struct amdgpu_device *adev)
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
@@ -151,10 +150,7 @@ static int sdma_v2_4_init_microcode(struct amdgpu_device *adev)
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
@@ -176,10 +172,8 @@ static int sdma_v2_4_init_microcode(struct amdgpu_device *adev)
 out:
 	if (err) {
 		pr_err("sdma_v2_4: Failed to load firmware \"%s\"\n", fw_name);
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

