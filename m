Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E2C65F212
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DBE10E7C4;
	Thu,  5 Jan 2023 17:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2046.outbound.protection.outlook.com [40.107.95.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DC910E7AD;
 Thu,  5 Jan 2023 17:02:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i92bOR58qAwScvH1U6sOf+ch+l0MqYajVIdFyjXaZeNu/gvVhEzMKL8Txg4cc959Pg1G6q0wdXfVqI8KZzo1XhaiSqRnSMvW/2D6T9XjOlQFql1hcKiuafATINTNdnmkIMS6M++zzeR/sLe2u+3P0IBBWfOSUgoyAcxB7Ze24osKAKDJywZcN4+vBn4klOUzZyloKnak1S3gP6mrd0EGzJ4w/HOpBGVGS1iPYN7Pn1AW1R+bI+p+pG8967xhG+tasgirT884yjvtOqR+XAcP+D62d59ZKG7+G78AfavI4BCYeaMTMPKU2TUDq3WqL+7nDgrnCxL4m/qprujfySI+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXyOmJXDTom6NbblJzJNlsYjnpdRilWNyJSnHeV9VlQ=;
 b=kAzmo4MCdUT91Mx77buLKpl2KdzFcWE739wtr5T+8W6nI5HzyYpe6KoSEE/J02EgehqDrbnJ1ZhDfDkndyhKeQV8IXDElY2ZNnuTT+m1kF42uXkRZqerUio72d4zv7qGmSScFHR2vzRwVTbzDAx+HpYl8X55XTlJt2wRIBZsaW2Iwg1lC8odJ61YXQrIko+cXFqknaCFg7VVdtkOFwMyCi3Uj5702rVHa31MmzxsEn4liWUY7LUooGJlp/42KZWAnxB4JQkPbdrYJuNadg/IP7Gjij8uAOYJB7uYGaMkuHmuVbO6tLOkTTFSggmhZCS8dzPyn/b8q6mqTfl2KSJEpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXyOmJXDTom6NbblJzJNlsYjnpdRilWNyJSnHeV9VlQ=;
 b=E29YRyLwYlRS33Nl+JRIwn+4tXn16OESh9bh9bSdk2RMgu56bJVwhEjPkjAIU7FehmaOQZ1aUt5kreLStNmYYzbPaY20EnBruY8O4fAoFcNG7rSAfglQuU26AQRDZczV3/vgj2pJV5mJkf+Be+vL2dG3gDSb8IyhjXL/19twkos=
Received: from BN8PR03CA0020.namprd03.prod.outlook.com (2603:10b6:408:94::33)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Thu, 5 Jan 2023 17:02:53 +0000
Received: from BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::9c) by BN8PR03CA0020.outlook.office365.com
 (2603:10b6:408:94::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:53 +0000
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
 2023 11:02:51 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 42/45] drm/amd: Use `amdgpu_ucode_*` helpers for DMCU
Date: Thu, 5 Jan 2023 11:01:28 -0600
Message-ID: <20230105170138.717-43-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT104:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 3976f190-3767-4e7e-3279-08daef3eaf07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w/KU0pz4pHW2M2PmZQsFjykArSJ4S7EeGn7To4kIXI6JdLKUCJ3JRFy1Mw3B8ezojINAI2kEvmup7XenQy1RIEYxV6BxkQnYmaihe+9jhXvPv3N0uh4J0nHz8qyd7jLjU6sVCri3ZtTXgDxvD79+Wr5iSwsCQDWh8YUizMjHur/mV6uOMeh81mr36nOhkA1k11M504Eo7KUoCUsUf58EV0iXysxRu/VI0AsSZD3MKvBa3EZSZsqf/PCDOOQ1mS284ov5OizwQu25d2jLGjfA/KLY0G7XO+jyEObZkGkWUoBHzrfMUwlzo0ktfYlMLwDuk8uhTVnKhnwHOzA8ILZNDT/lpL+kNzDDxfEYcWH6FkcY81GFDx5RDZLIKLeB+4cNFCEI/Tt6g+08+JFjaBdrOPPfSCe3WjiLF7t+b1/RSrpyfciXtRy8BGEWJvhmHO5EUyENOr1k0xRXi627jcGcbhz+rRRbKAAGALgjQympO+P/K4L9vXP7ByBWvL8yWUIEVdmHTBF5IaeaYu2pSZFgOtsZt0Z/VuZ4jPndHLVW7escGQf+5AJC7LThDUO+5TIR14z6rHB9xuCI87LJ3I2hxDrX24gwp9PGqGVBWD3M9wDLSIEJ8lAycAAH8ITvG+7X7x0J/mWVCUsoYZVxrUoIkn0j5h9M3WqqXBl9wNUd6dSRjHXAVfSyq27J27JlGeVyPU8RSg/b30f1t3jxjQCBaAjasCqRel7K9LY/aAd8i1yr/EF1wyn6l7bvIDzU6i2f57lsMEr7ZsYraoN39ZXwjA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(36840700001)(40470700004)(46966006)(47076005)(36860700001)(426003)(83380400001)(5660300002)(82740400003)(81166007)(2906002)(44832011)(41300700001)(356005)(8936002)(4326008)(40480700001)(7696005)(40460700003)(316002)(186003)(2616005)(336012)(8676002)(26005)(1076003)(82310400005)(16526019)(6666004)(478600001)(70586007)(54906003)(110136005)(86362001)(70206006)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:52.9373 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3976f190-3767-4e7e-3279-08daef3eaf07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>, Lijo
 Lazar <lijo.lazar@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 61c192ead62f..79c4652e8e40 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1881,20 +1881,13 @@ static int load_dmcu_fw(struct amdgpu_device *adev)
 		return 0;
 	}
 
-	r = request_firmware_direct(&adev->dm.fw_dmcu, fw_name_dmcu, adev->dev);
-	if (r == -ENOENT) {
+	r = amdgpu_ucode_request(adev, &adev->dm.fw_dmcu, fw_name_dmcu);
+	if (r == -ENODEV) {
 		/* DMCU firmware is not necessary, so don't raise a fuss if it's missing */
 		DRM_DEBUG_KMS("dm: DMCU firmware not found\n");
 		adev->dm.fw_dmcu = NULL;
 		return 0;
 	}
-	if (r) {
-		dev_err(adev->dev, "amdgpu_dm: Can't load firmware \"%s\"\n",
-			fw_name_dmcu);
-		return r;
-	}
-
-	r = amdgpu_ucode_validate(adev->dm.fw_dmcu);
 	if (r) {
 		dev_err(adev->dev, "amdgpu_dm: Can't validate firmware \"%s\"\n",
 			fw_name_dmcu);
-- 
2.34.1

