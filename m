Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B565E408
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD63810E68A;
	Thu,  5 Jan 2023 03:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF5A10E670;
 Thu,  5 Jan 2023 03:44:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZH2WqM+ZwgSIh3VTLIVQqDLszizr7VztMeG/FjrafsdbIeEug/hh8OFRSSgGYTXvP+z9ABSTWXpqgeAtnBnCdpiOuxBweBVRc3xkB208f5uytbGj3F2rvz+DxmXzKVoCaX7Uzn7JkY5MyXXf6SNjZokI41LZEG4/QU1ipHDKX3jDVS6qi7f2hKd1cojENXOceiGtlV8Y3LE0M3mYRxQCEsO8sKOUXGIxn3wcYL3T8HjZfKW+tVGntUAmZraZ8GAGsUHMNHxoxfgr/RRO2Vyn1z9Tu9ahGn2WENwqEscl580CPx1BAqO6gepegPe38a8ecxEHw1GWtnocFHlehRax1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ir21WW4Ry2fzrQ3qSlD5koad6GPNGd+as51uOO/aS5M=;
 b=dhdjkLsbdUAcOFPlcFb5XszcEMpcTqgLgaIKZ9xNZsI+Hmdia7aqcy5CwYqXfTHWt7zTgoOcHaS1yjPt6EfMr82hRu9HowTiBOrVM8EyC1kt6xfUg2w3ftCTxs+t6dj3YKZJeXbg5X78O1gFP1tJTE5J6t2wYKfC+f7Lt2PDHitDxWhdKUFQWOGuRvVE4RoOP+nA9P41GnTxopZMU7HBzAE74D4nVXwUm7SXgFl3B31/8Eu7SXuHCOdFZya8XfnHDX4yQWezmC/3AeRzZKGCVCcdMesncFgoPq48lNqdnlqL1vTu9jNKlWKAfAIj2y4J0NwV91HHvdZ18VT/bJDGYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ir21WW4Ry2fzrQ3qSlD5koad6GPNGd+as51uOO/aS5M=;
 b=vbdytt16u4b1zEW02jHMffRg0qeWb2Tnj6HO/IBbCdfnVFlef65QB5j0E+7MXuI7k2kferPr9HP/+OrqZqSzgWA/9HDde5mlrKrE1TePY4p9LqgAXg/+bt7pd60nfVuLlO8kyUIv3rAWATvPIlxSScXoN5xDPWy1sy5GWATAAUo=
Received: from BN7PR02CA0007.namprd02.prod.outlook.com (2603:10b6:408:20::20)
 by CY8PR12MB7562.namprd12.prod.outlook.com (2603:10b6:930:95::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:44:44 +0000
Received: from BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::7e) by BN7PR02CA0007.outlook.office365.com
 (2603:10b6:408:20::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 03:44:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT107.mail.protection.outlook.com (10.13.176.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 03:44:44 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:44:42 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 27/45] drm/amd: Load SMU microcode during early_init
Date: Wed, 4 Jan 2023 21:43:01 -0600
Message-ID: <20230105034327.1439-28-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT107:EE_|CY8PR12MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: e3cac597-be9e-4994-ddff-08daeecf2f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lUOjdaMKOcPPGvyRUxuyrCcAXdizQP/BM5bqMBkeukxggm3WpKUGQ2MlrsYRWt8pDX51YmDDNJV0B9PHM9qqFMSt5ONvMsNhOSQdM04613N0vNDC3lRI69GAmyEWyl0rU21BeC/tBz83VGGHO5Bcg+6MfctMY/GMuHA2huI47Rp1BuUxjbBTns0Cz1dcYDUn6C6E/UF/swu31rMVVQ38V2UmxjCMk10Nihyi38rpvWWX31/BghSVTPuDVbn+DQeH7SYXxYcr70HPpqGCMxWjPU4AvK191lhnhbZIkU2vdm1nc+6kpiCUlW8QpdAX3PM0UkMObRQLPlyn1AsMiO3rNIGy9j7gCYDenWANL6sEZASnTK7zYgm0cC5VhvtUXCDbfpKd2b/SiF19UFem28t7rwUyntEKPOsMWZSE7F28wSPasq+Ve+BuucGMccBkLUp4HsYy88XErMw5R/como0oqRQPUQYhTgVmc2U/9o9RkRVvF0y3tHMKp6Ce2Oi5ACr3D6yYO1RfucY/mktyf19WHfhFzRu/Bd1DY9MRGZFSfPIjsdUZX4+YHju5nw/9la4BpOQn7H6fqrFK3NHqcNhYZVw7RKnvSL7XUrGwME/HcM+p8fzDf4yfZraFPw5AlT30l3mrEX1Lh8759OprgyvMJVFdH8DP2J81fvP2zuFeGISGj8qQxu1g7RO2bffXLyyqIcIDtUvV63AT6MibxJKuLb5g1KN+7uDnX+muyrjA5Oo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(5660300002)(2906002)(44832011)(8936002)(41300700001)(4326008)(8676002)(316002)(70206006)(70586007)(110136005)(54906003)(478600001)(7696005)(2616005)(1076003)(40480700001)(26005)(16526019)(186003)(6666004)(336012)(82310400005)(426003)(83380400001)(47076005)(82740400003)(81166007)(356005)(40460700003)(36860700001)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:44:44.2267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3cac597-be9e-4994-ddff-08daeecf2f21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7562
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
 Evan Quan <evan.quan@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will ensure that the microcode is available before the firmware
framebuffer has been destroyed.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 2fa79f892a92..ec52830dde24 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -623,6 +623,7 @@ static int smu_early_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct smu_context *smu;
+	int r;
 
 	smu = kzalloc(sizeof(struct smu_context), GFP_KERNEL);
 	if (!smu)
@@ -640,7 +641,10 @@ static int smu_early_init(void *handle)
 	adev->powerplay.pp_handle = smu;
 	adev->powerplay.pp_funcs = &swsmu_pm_funcs;
 
-	return smu_set_funcs(adev);
+	r = smu_set_funcs(adev);
+	if (r)
+		return r;
+	return smu_init_microcode(smu);
 }
 
 static int smu_set_default_dpm_table(struct smu_context *smu)
@@ -1067,12 +1071,6 @@ static int smu_sw_init(void *handle)
 	smu->smu_dpm.dpm_level = AMD_DPM_FORCED_LEVEL_AUTO;
 	smu->smu_dpm.requested_dpm_level = AMD_DPM_FORCED_LEVEL_AUTO;
 
-	ret = smu_init_microcode(smu);
-	if (ret) {
-		dev_err(adev->dev, "Failed to load smu firmware!\n");
-		return ret;
-	}
-
 	ret = smu_smc_table_sw_init(smu);
 	if (ret) {
 		dev_err(adev->dev, "Failed to sw init smc table!\n");
-- 
2.34.1

