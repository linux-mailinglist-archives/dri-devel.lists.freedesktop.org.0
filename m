Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3139F65C986
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A2E10E4F2;
	Tue,  3 Jan 2023 22:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D777E10E4FD;
 Tue,  3 Jan 2023 22:20:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N58V24LChrApydmBVeYoLK/WMGxCcqHPipwn1jYobAJm9PyK0boptGyQxygMRxaBjlRJjEBfDv/0oM/i+53JFRjOogtREsAO+ztGYgXWHF8q8J5/U+6L0pGG7C0bJmxfSEnG9TghOTZKZ8WQFE7YXMOQmdrhUGw529vwMGtXY4sWIycBXpxpPiKWVEVC+Zd7rc+hsCfPJbQ7UGF3K3ncklLCuxo7yvlD9eximc3WjL5ak+eRyb87icjUeIMg9PSf4S9OPp1bv7UQW/CYEHoxinxfdL9uvuVm+bMp5YL0objXteuKEDpzF55OvQGt85VQESc15TEqqgNa9EnPqN1Ndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evRxg9fq5Q3XgSkQOhK2ciBqpmNcuVPL3jls6lW06Ew=;
 b=AL7B5pFqAM9THK2OspT465JhE2719DUJcirrNQshfGOetlCme4ESy9uGXGkuPQMH66x7TYJbXTHnaOdS2NfJZ3tHhRq5bMPwf6zUw6K41KJYwYUGOs8DyukyP6fs+ImF5LOyY2w6wvugNnwsIcEd2tGBjY+/zFPLE7ufuzoBEvwJ6m65UxxG/mYEXLLO1BEtQtgFMCo1LiHJ4oDw3Fe72kEEzkTPaZBb6rj82xZ16NXHNtFevNGXTNfkTPn8s4M2FzRUn4IR/P+kiMf+54f71Q5Pg84zDL01qKc1ANug36JMUXi1uofuDQ/ZJrCWz2/UA5eyRHFegbhDzpAFY2P33A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evRxg9fq5Q3XgSkQOhK2ciBqpmNcuVPL3jls6lW06Ew=;
 b=YQCXmyeaOtAxr+3iIrKRI11rl/GmhI8OhXWk6RcHCRIG0ny+DqW+uo3+nnBxjKjk1UQQaYfTySWrC9sZs2C9K2w47SXZ9xq74XY3k7lHTHPFN7Ped7YJyD80bhU8rztgXmDSpm/W1ju6z/URa0zCRCG9rll51CfofsxTK4sRohY=
Received: from DS7PR03CA0129.namprd03.prod.outlook.com (2603:10b6:5:3b4::14)
 by DS0PR12MB7972.namprd12.prod.outlook.com (2603:10b6:8:14f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 22:19:59 +0000
Received: from DS1PEPF0000E655.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::62) by DS7PR03CA0129.outlook.office365.com
 (2603:10b6:5:3b4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E655.mail.protection.outlook.com (10.167.18.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:59 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:57 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 26/27] drm/amd: Load SMU microcode during early_init
Date: Tue, 3 Jan 2023 16:18:45 -0600
Message-ID: <20230103221852.22813-27-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230103221852.22813-1-mario.limonciello@amd.com>
References: <20230103221852.22813-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E655:EE_|DS0PR12MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: f3fa0882-0f57-4874-2160-08daedd8a709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WQL+1U4nAAeToN5ggdv0yv1P5Isg/Egog0WPPCM6Hjjfau9j06xUrLBMkGod7FujbYLaSljALr5aXRr++p6Wz8TuikCMUWO99IaGW8hfnYiEe6jmeF4D8nlbr12EuhctqbgfkvELKIpBMnwz3YmrtOSvCaLWxA7IIG84q8pk0OU/oUszCVJYHHnkVbcSAMNG3fQl833ubbNcatZtyyyW3bOKUvZa/JaOL8TDugePmSOebmcLjGL5G+vRUosyTou4dSV5Tz42FDRSia819mJ2n9z7peGbWAq5167zcOM/uKNZ2xm4MT5V3eBn1hSBgHKXCpL4SUEuum96mjDJU/euBOXdeDaSa1X0WvTnC+bXKKksMOx75BEjgMix0RSX6KIz33O4HiNQlvrN/wrgJI7RscQMJJqMkgaNbz6ih2HSQyIxsMIxZnAWxShTHWsCI1zx+L3WoYwdyFn2M3Ch/j6RtgFlJqpEoLQr2cUxYst0ziKVHYbt/NFHSmAcNeCMY7rU+Ud3sRtjeVPoaRCH0Z27bjNeyX8krcwNnT30h5ZhkVe5LX+wP/LwyX4skrMZAXCM9yH5TdE+feul3uEaIqHJvYOE1iQ2AeI593R9JPKsyULf/uBQQxXvsNeDzeEdyOCnmxsy6xwAAQVPu4c7ADXGPaEk4FElV1csS2AyXTggbmj0fmGy5wKwXSAPD1iokiuNbjkuez+sIKjmsPjK/HRSi07RyLUdd/Dq1IwQEL1ohrHiUs+BPo1ZQgmU2O87zjmvoR9nGpLeMOdwkvL0png85g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(41300700001)(40460700003)(426003)(47076005)(70206006)(316002)(336012)(8676002)(54906003)(4326008)(2616005)(70586007)(36756003)(82740400003)(36860700001)(81166007)(82310400005)(356005)(86362001)(83380400001)(44832011)(40480700001)(110136005)(5660300002)(8936002)(1076003)(2906002)(478600001)(6666004)(186003)(16526019)(26005)(7696005)(22166009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:59.6677 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fa0882-0f57-4874-2160-08daedd8a709
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E655.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7972
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

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * new patch
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

