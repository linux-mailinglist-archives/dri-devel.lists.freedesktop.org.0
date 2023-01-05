Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A7765F1F3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D102410E7AD;
	Thu,  5 Jan 2023 17:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D0310E791;
 Thu,  5 Jan 2023 17:02:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8YQk4s+ibVLqZeJPTxDNZ06zCBIhbPXkOmrVxtRRDKsHJImCVxqCscjV+gR+L6N/7KfPNRM2u/F8DZhUbvbP6MwjJpCMmH5DiuFVqdlZp8TU/dKWqed2EQSkyP7PNEOxO+4HiBMMoE2ZJYcQUwL3uF65m0EiWX2bBj99n57QXMaBJQZS0eJxcZ+l5dTudCwzLlS0oWRvoYd3V7xGFYCPkkOtY+WOrWAHACt2TFhE6mM/h0EhWU+6IO9xXPUuS0QuImkElUS2ypEZdMG+8RWL7iXV88TcnefihNk8k7kVOqmGOXz5GTu3jPOT9pmufLE8kL0kKwxcZ2mMjEiVStP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV5Q9ryV098KlazZ38wCpKZugkhlpM53/KjHVNDIpcg=;
 b=W70/3xGtJOoAdIPUtoUd9k4LeqgvJUPABdgPNnI2oQ5P1OK5rDRM91H8qE2xVAohiU3+9+NcHcGJhRAC2VJUhQBcC8ECwcFkNk7POYmYMnlQIoCqN8TpHjOdIhekcgZAM3Qk56TN/myNRE/9QFQBVNlTZiMxHyNqroPYLbmRHeF2p+2MAOSYEFt7lwug9Cciwq0hf3qYPxMl8EEX1xhNXuSfea3yWaWWAwmjyv1ObD0LgqkuMXLEJiEArx0XuNtynokSNG79qSr7NpNbl2yvvhFjkr4/m6noqIat8v2GrG0vl37e2DJzmsQZPiJ5MiDmgFZs2LpZEPbBwHBuyrQH2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV5Q9ryV098KlazZ38wCpKZugkhlpM53/KjHVNDIpcg=;
 b=PvUPOQgiS2zExKyxVnEL238FgF92i/ukOIE/W3qhqjFEAia7RpAiwDf0XokfxRH+K2wdP3NvFgF8l71F4LKySbXcnSSy6eGl2dH2UUaG3+5jofe9y9Hd0aYvJQjJ/nz8kYMeCne1A5ch4TDvQ3lH7VKaw7uWXJ9B2v/qoPjAN9E=
Received: from BN9PR03CA0983.namprd03.prod.outlook.com (2603:10b6:408:109::28)
 by DS0PR12MB7898.namprd12.prod.outlook.com (2603:10b6:8:14c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:39 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::91) by BN9PR03CA0983.outlook.office365.com
 (2603:10b6:408:109::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 17:02:39 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:32 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 27/45] drm/amd: Load SMU microcode during early_init
Date: Thu, 5 Jan 2023 11:01:13 -0600
Message-ID: <20230105170138.717-28-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT032:EE_|DS0PR12MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f3e8cf8-3f11-491c-e5f6-08daef3ea6f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TihazTQRdaLIyWugX5CZPSldpfSKh0MBbHrdI1GFWtjwd9vQU9BzgQv4KP9WVhVX9vcrdcY7SmXmmJPoWHa4GwphC33mtdALPJuWFpnZEGOZkFdbdjTmGv9mJqpeY5IzrA+HT68Rw+3Vy0yVp7Hemifx3raTMteetakFzyUP38CSa3tp/WK6hmzF6VIhLjaXgE/+HWpOqOYlTX9jJWl4y8haGP7fu69ECUjwukk9q0GvTz+3SapHqxrCza7jXjBzOIOiZs8dwDc2ajF/t8h5Aa1iMywRBVSFJyKiUM+Y2RKEAQU8ol91pcNr5zfUc/bwjSLMqXZTHZXu5ajd7p1tR3gNPwhgtJOoaNGQmKA6loWtIvpqE/spD4/ygYYhiwWbz1NC6X5sgLSt+usGRePSqFzVzIP/LBCMPOMdvUDcSC33TCo/yDD7LpP4Q+kfR7zl8T2kjYDooTvNsIyRXFu3sqv65FQReYS3XsTyF/jSgGzf4xNcVvUs6wHZewzjO+HK9XueRshpMEztnzeR8xeRQIpRVocx1vJAy+GMUs2UtRQV3MwdBwoN6H9OnsrA4lzvDoDr+nInPOQPiyHfKQp/WPXgEzBBBzEiXtiOh3D3jMvZaLwE4XmGUzBdeu0+rVN6OmOx9EV2unqmr7zdv5ufpu8wz3pisfRJ06/beETn05yglksBVUqaSOUDMfVrT2RPe5KFUESBiapluunf+9bKV4fUhiCcXTXmZGC6OMgr2M8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(110136005)(16526019)(478600001)(44832011)(82740400003)(40480700001)(40460700003)(36756003)(5660300002)(2616005)(1076003)(8936002)(70586007)(70206006)(47076005)(4326008)(41300700001)(426003)(356005)(8676002)(6666004)(81166007)(316002)(26005)(82310400005)(7696005)(336012)(86362001)(54906003)(83380400001)(2906002)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:39.3890 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3e8cf8-3f11-491c-e5f6-08daef3ea6f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7898
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
 Carlos Soriano Sanchez <csoriano@redhat.com>, Evan Quan <evan.quan@amd.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will ensure that the microcode is available before the firmware
framebuffer has been destroyed.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
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

