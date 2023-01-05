Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5981365F1BE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5C410E76E;
	Thu,  5 Jan 2023 17:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2691410E76F;
 Thu,  5 Jan 2023 17:02:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFVoHtam9PGOZIuqB5VQmXpZixIiz4gIUGAQ2bZgbtSXezVjJld0kCzJcZZ9CkOyFzdFDZJhnzdjAr1At4W+0xJDoQDHTc0lkyG6KQ8RR2eCVXQe8XRBiiWeUpTGpAI/vl5cH2w4TMlDlECNsTiRbwsthW/KmD294aUx+/sY/+2RCGf7ic6UJhJYLItoQ9NCEXBESGl/rlnYNJPTOQhYNdRj8BPnel7po/jKGnN5zHJmhlcLoqg0ekTU7jQF/3vtT4Xpc5b80vBv6LOmpm/NiWREuO0pM4WgRYW0sz9aSajwcn97+bE56ln+b+ocjEYS8owNcn+9bMVLHoyuR6Qqyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wo5Xw+yjszQ3IXMnYKxZWj1JMqzXR6rotKr7yTUU3jw=;
 b=n8tLvqgHHbmAD3GyXLEaNpJZE5ShxPiCryoxuG+A3hVwycLtwlH4v3qLLQhVE03uQ6x+LhltKCoyPTkxjiev0zeXEnW7TBD969Ub3YvfQ51qbq49xH9z5x9JpvXLcvrLkTdQO0Fmou1WTOSHUnZTwegYXlgU/irRsTEyu7ZmKc/g6Fx4DOBi0s86TzkKESTpqnu5KnB29T7085rg89S/ntBM+yclu/PZohIg4hIrFwqcU0fTbctGDUL5NgU3Hrv9g6wSkdUwXGwEyZAuilpUdGeKOZpHZrw+Panf0S8loj3VSrTbnJoP3oVrLWTJWQIZ/XczZMl1EpY3USmAUng7nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wo5Xw+yjszQ3IXMnYKxZWj1JMqzXR6rotKr7yTUU3jw=;
 b=gRbU8pYJI51noysIopDm16QqCNno7SbwJjjgnfr0UoF+SYxrblIrKv2/044kedLoo+yfIRgqkVBkV7xSlf8wCh5sYjeeozsTcMliDm8OMekGZNF7uPVTzLArp/r7U9ojdh5G6xkbqpw+7+yA/zBMfW89i/j/O2+eGhb8gxEgc7w=
Received: from BN0PR04CA0105.namprd04.prod.outlook.com (2603:10b6:408:ec::20)
 by SN7PR12MB8060.namprd12.prod.outlook.com (2603:10b6:806:343::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:08 +0000
Received: from BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::38) by BN0PR04CA0105.outlook.office365.com
 (2603:10b6:408:ec::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT113.mail.protection.outlook.com (10.13.176.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 17:02:08 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:07 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 09/45] drm/amd: Use `amdgpu_ucode_*` helpers for VCN
Date: Thu, 5 Jan 2023 11:00:55 -0600
Message-ID: <20230105170138.717-10-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT113:EE_|SN7PR12MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: 4045ac63-008d-4f6f-f9ad-08daef3e9484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MNJajin5x/nysJl7K1e8swfAXQAGSFp8yQzSPnIngeZWVUA9pER17C6/w8zpEGNMA0rA0RrieEAF/oTR5WsdhV2EVadAp9uJhQq63ykrPoqnOOq5/bsCx6IHCEzJe+4BbEYUS6sfoZrk1o5H/xmpgt5+joOfHbZ+M214f7pPuEMvgt2XPa0iYr2dqnco3YgH8WwyjcSS3LYaGdhgVhRsJ+0oC8GCQngWc9TqBkQTmk5SO+rGFukeP6Qd3mhMCcAigAotSwZkKaaUX/5ptksmYdqw6DVOrkZilLJ9yMTPFNXJEQ2B84Z/r7cl61uEUX0ll7e2gLhy/gMms7UB+B6UlTEYuxE4L9/4a0MNYHpMLZaKPZ3j6ymVuDhp59fATDRh4beemeNi2Mkmz0PX0Ym9K46pPQZgrQRV4rbSOCvNI7KMdTulUVTqH+PYINSIhiPnhkvePMIc+tPEfEBAAEi6LgXIUae9QXcTx+3QFBjGZJ60U1gno/zSZkLsCZuZgaZ6XOIsLKA9+FSBjVZ9YRR7cuiVmY26wD+4KvmTLnv/QgCFJ9g+c6E2Hq+HKlhWJdNrK85RKsS5qadQtzA1NQI50sBBCo9TdwCuVykPVEZwmzurj5LtuDAKQ0U0n25uVt8Ly0fPyt8fYibQkqoxqsiHUMfEuKuokiimqWsZHrW78jl1TyfowS+4DUYq5mGM0dpAXQxm6z1DbzrRn8qn4O2HVqbr8pyqnI5XzmBd22Y1/xc7mG9SVzdoPABIMmxHHFhxhW+XjtWeWYxzS534lRDwiw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(81166007)(356005)(82740400003)(40480700001)(36756003)(82310400005)(7696005)(40460700003)(86362001)(2616005)(478600001)(16526019)(186003)(1076003)(110136005)(26005)(54906003)(6666004)(70206006)(316002)(4326008)(2906002)(70586007)(36860700001)(426003)(47076005)(8676002)(8936002)(83380400001)(44832011)(336012)(41300700001)(5660300002)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:08.4631 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4045ac63-008d-4f6f-f9ad-08daef3e9484
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8060
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

The `amdgpu_ucode_release` helper is for symmetry.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index a23e26b272b4..b37400107a37 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -206,19 +206,9 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
-	r = request_firmware(&adev->vcn.fw, fw_name, adev->dev);
+	r = amdgpu_ucode_request(adev, &adev->vcn.fw, fw_name);
 	if (r) {
-		dev_err(adev->dev, "amdgpu_vcn: Can't load firmware \"%s\"\n",
-			fw_name);
-		return r;
-	}
-
-	r = amdgpu_ucode_validate(adev->vcn.fw);
-	if (r) {
-		dev_err(adev->dev, "amdgpu_vcn: Can't validate firmware \"%s\"\n",
-			fw_name);
-		release_firmware(adev->vcn.fw);
-		adev->vcn.fw = NULL;
+		amdgpu_ucode_release(&adev->vcn.fw);
 		return r;
 	}
 
@@ -333,7 +323,7 @@ int amdgpu_vcn_sw_fini(struct amdgpu_device *adev)
 			amdgpu_ring_fini(&adev->vcn.inst[j].ring_enc[i]);
 	}
 
-	release_firmware(adev->vcn.fw);
+	amdgpu_ucode_release(&adev->vcn.fw);
 	mutex_destroy(&adev->vcn.vcn1_jpeg1_workaround);
 	mutex_destroy(&adev->vcn.vcn_pg_lock);
 
-- 
2.34.1

