Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A179F65F1DA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1A910E796;
	Thu,  5 Jan 2023 17:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2045.outbound.protection.outlook.com [40.107.102.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D13510E794;
 Thu,  5 Jan 2023 17:02:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSEz5tCqklOy0/eUgF8r4Xw655UfZbCqMFXtAPA65p4dClAVtNhetmxKW+TDHpl1Zz4HDt5VFK3OTYu9kBOot5rria0i1EdWUbppeEYwAC2QCvIHj516MnPLcuYrHeKD6wk1UJLIeazs9aOXEc3yVJsah1GBnlZhPYuj33sfuOHNgSYUqfPxdIaNamFJAykH2T7MV4L+mV7cdvhhOOXxPunf9QDMkEIOR4qKHIzwO0YM2qxfnT+m7yKDXrcniqV2Fp1F9eghGaQzouem24RA+KUCijdyx+A+wV/yy5m6AgRAonVtSFKs3E4Wi4syTPBqBwmwm/vJorv7nwmUVBBoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yRHGDLRUXxsSSXHLW3h/kwCGwYLIu0ebIvPK6hFwTc=;
 b=LAk0+FdNOmKErYRTq6qGI0Dj/QpjUKsFLsXUaYB89KMZXDegGymP/ucjpHobTKUc/3JF7xiqvYcTNpmhYVk7iiA4jAqX9St8giEih0u4mIikKmSn0S2kPiHCfrilhEUhZRdEs0XRnk+o630+Fv6rFNlIL9Ibp1ufhu/0tUg4SfOiUZwkH0bgVpeBdSIF04PYjOpTxJvG1m63wAOYLmqDZa//hhJMcZumHCYtZdIGrLnAjq0kILCSv6bwbef+rQkYxHv0OltUnivsnIbPV6kBS56smpQ6ug1Fla0TynlBRX5xfQ2BOsC03oV+ot47OoOaTCqH7uGdmFidNGeQZZXS7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yRHGDLRUXxsSSXHLW3h/kwCGwYLIu0ebIvPK6hFwTc=;
 b=lu94uR6+4E0fFSm/WTaUaMnQFbEon2DNTIXYvIH7mBrNQvRK2GhgWUhb9ChYk/yjiCXtSCERKRHh1NuuJLZY8CXyOdc4zWhhUrb4/o7U7J72fR/xXljNDBIyfFcmOPUF7vEH+BLwQo525zHkc7T/QyNAD6A35HOK9wj7/P7BuDg=
Received: from BN9PR03CA0987.namprd03.prod.outlook.com (2603:10b6:408:109::32)
 by IA0PR12MB7604.namprd12.prod.outlook.com (2603:10b6:208:438::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:38 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::a2) by BN9PR03CA0987.outlook.office365.com
 (2603:10b6:408:109::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:37 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:29 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 25/45] drm/amd: Use `amdgpu_ucode_release` helper for DMUB
Date: Thu, 5 Jan 2023 11:01:11 -0600
Message-ID: <20230105170138.717-26-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT032:EE_|IA0PR12MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bd2ce2-30ed-476d-1fb4-08daef3ea5e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1naLp9JHM/Say5Ewtvj42lGDtbTpGv8aWmikvsqSRJqas7Bns3aVZN36pKCnWCKwrq1Ls9Au/gfQhGgEpzcq6Co2HpxjQNipoat/LkrPg1pMJuwj7nYweMXg2qNgNPSkNoqZvRoIEqp3YXfDyl8XjUH9+wVDfXNoIy2SJWI6AwDrUCC/+xyADSSmc3xoJmJScPMTN0nENu6BK7oqyLN3oUHwFry9nebFp2WBLV+8GtIVMdXwFbrJmtDyfP+tdUqHitI5TMZBUieIcodWjIUcj3Ygr0UkFw8enSuQwTR2JtzvEGOgF0gAONiEh6HuQ9wdcvxriKZnGs2uxJWBTsgfPF8vNMesAjfcobyekMBASkcV1c3GYNVDUq5cJ+MVRavvbUg1MnhWAOJywXElueQfU1dvWU55e8v1sRvBgaA0T+hBMderBHqhgnqT1bHs4/YjEeyunGGB848lN2X3FT0fu8t5iYoB4ODldERCUffwc94bbseWHvFJiN3+j/Qc3Oi7E+ITINwg9SfoILxsWQ+qY64ZijQhmBWmZ/XjgzBRxZBQiThiWdh10/NWsX1l3JPm6w72PHkH2Ra1N8kWcIOY45+53d8B8LeQI778BHE7e1bk+zmw1xd1Mnm4RNO9STbuoE9oh31O2z4G9/BplSavpP/GUfSDRHIzIGrdb+ny/TCmql/ifXyfOqwaC3kXEJIOAKsojkfTaIr0ZkFzRHiiOXcb5fqS+1VOyeonTz6vuhSP6+x8jwnhV6/iD0820mGBszhqMnFLMX5rYk5TvKua+A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(8936002)(41300700001)(5660300002)(8676002)(70586007)(54906003)(110136005)(2906002)(4326008)(7696005)(70206006)(316002)(6666004)(478600001)(47076005)(336012)(86362001)(426003)(44832011)(26005)(186003)(83380400001)(16526019)(2616005)(36756003)(82740400003)(81166007)(40480700001)(356005)(1076003)(40460700003)(36860700001)(82310400005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:37.6079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bd2ce2-30ed-476d-1fb4-08daef3ea5e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7604
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

The `amdgpu_ucode_release` helper is for symmetry on unloading.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c8c5d37c8b3a..61c192ead62f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1898,8 +1898,7 @@ static int load_dmcu_fw(struct amdgpu_device *adev)
 	if (r) {
 		dev_err(adev->dev, "amdgpu_dm: Can't validate firmware \"%s\"\n",
 			fw_name_dmcu);
-		release_firmware(adev->dm.fw_dmcu);
-		adev->dm.fw_dmcu = NULL;
+		amdgpu_ucode_release(&adev->dm.fw_dmcu);
 		return r;
 	}
 
@@ -2113,11 +2112,8 @@ static int dm_sw_fini(void *handle)
 		adev->dm.dmub_srv = NULL;
 	}
 
-	release_firmware(adev->dm.dmub_fw);
-	adev->dm.dmub_fw = NULL;
-
-	release_firmware(adev->dm.fw_dmcu);
-	adev->dm.fw_dmcu = NULL;
+	amdgpu_ucode_release(&adev->dm.dmub_fw);
+	amdgpu_ucode_release(&adev->dm.fw_dmcu);
 
 	return 0;
 }
-- 
2.34.1

