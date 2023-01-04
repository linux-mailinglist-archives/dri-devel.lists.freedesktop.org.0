Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FB965DA22
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 17:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C198910E457;
	Wed,  4 Jan 2023 16:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20A010E058;
 Wed,  4 Jan 2023 16:41:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAn35OfBwj+BGxcZDLLhVM1xVQFT6sh7m10yiiOWT3CuyoeKzJQ84mqd02jDgsWiTwJWdTw7SbVkAr0omwUSmRp7Hyb/MIcMUJyaObsgSIq46CJ6VAHCpSBYrUqD5gvkzE7tsoM4fpW2vx34p9QxdZSh3Cic5DHt/bFD2sPGGZqTIebER3TFZgMFlrRbtpBW/655chINQGfe5rSYKPJWqZ80jWWvP6OOJxdg0sxitkhQZ5S2yy5CE7aGMEuPNjrpAbP4MG11U45jdgWjDbzKu3kfx+skioDRhSmpmrJkoXipCR7HVWIImbxFewI4ALsiBVDJOxcYUE1DpEv349Wlcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpx8LEP67+rj/cBdMTpYdHwfGfBYeBDBkIJIzX2znc4=;
 b=R0UYCtTVlejSWWFlG6CU+ZALYEaf/mmQQ0Q4Pqb90Q+3IiXxv7hK2R75KE79CHVSlf+1qpYlPPn41Qw7sz5pQFZtWY36RMHTLbig1YXHi2CYIP9Zob7+s1zn8OwarKJbqBF3pQ4vIRCDzQDQs+p/sWM/uS8iEu0SmcN3/GP8gXLMhN6WQBJTad3t25vHTUy1k9+8HIOIpyG1ILUb/c3lBldLu+uXc9ZRWYcg+s7tdbO0U3U8rY1bUcEbhg44nWPd7UAYqQz4BMEQs8c/CaPsyBvLQmzEBVV9fbSyWvSvEMVaIJSVm+S/ReozqgW8Ootn4Oh+JkbyzqVCe3SWNzZQ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpx8LEP67+rj/cBdMTpYdHwfGfBYeBDBkIJIzX2znc4=;
 b=MsZdlme6dIZOcwxR3j2XqyygTtUG6hmkOn7KTZI5f4194OYeViGNi/0XM1AVoh1qP0h6qbulL1b35rrGxY6KZOvfNkx4P7tilP2y0+ZOsL8MyonrBTh8jLfmANBHKI6v36kxHdFkDEcv7xsPBPFFPTxLBozpk1Ls1lPqO2wBTy8=
Received: from DS7PR03CA0306.namprd03.prod.outlook.com (2603:10b6:8:2b::14) by
 PH0PR12MB5449.namprd12.prod.outlook.com (2603:10b6:510:e7::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Wed, 4 Jan 2023 16:41:51 +0000
Received: from DS1PEPF0000E644.namprd02.prod.outlook.com
 (2603:10b6:8:2b:cafe::cf) by DS7PR03CA0306.outlook.office365.com
 (2603:10b6:8:2b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 16:41:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E644.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 16:41:51 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 10:41:48 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 03/45] drm/amd: Convert SMUv11 microcode to use
 `amdgpu_ucode_ip_version_decode`
Date: Wed, 4 Jan 2023 10:39:52 -0600
Message-ID: <20230104164042.30271-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104164042.30271-1-mario.limonciello@amd.com>
References: <20230104164042.30271-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E644:EE_|PH0PR12MB5449:EE_
X-MS-Office365-Filtering-Correlation-Id: 201f944e-3063-4800-dcc5-08daee729497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gw8RxR/D61fptW5qfwVXY4FBri0YZo6ZlgYUUvxs0mI0h5/EVljLRd30Ja0/qb+dTbw9W+egVJKbQfAN9zyCQSMLxSRw4E/oNcccgaq5QxtGcn4p8BaeL+mA54GwmLMYbvLNdF9G3j022AwCPhhrPGnTD9TMb/tvVZbZQydSLaawJXZSd8px15oZwsNRKiM1iRinB6CaP1+RWL2v5h97N+uu37ltfxsTm1G5wKNVY9chw7Bc01jH3QZ8ctz/KVSvmKDtcsJcfKXLuN4pn9OJvDqBvHu0ScyPJdvSkEVx3BrGnhOoJy8nJbnuGKsITiv2GsOtR5sfryQdYKWrYJh9Duw3afCiA+ZNUx0t0Xj9sxkuayAd4hjMy/A+jnqWPyaJePeFI/N3oRCn2Dm15OFHbV3anWVoxSYrrLQB9wqEIvP1JSnklBM24wx0Y6F+T316r/Cc366P4oq9AvvQeAy7uuVZEEyg6QobJNF/LZrLjAi9PafgvTy0fSJDHr+ZA8KPmzbpVwYUUmtgeTVjEFR58wh1zxzZej2y/YlepWNtWO66FFfs73w6MD/oWdh85T5bakWqHoQ03GmHhZHcemlmPyKAGYszvGL8faDjHu8NzSczvSmDybBKsP6OQeA8SauM8wjsYE/yor3jSz7wrtxZJE3gE2ceqVZEnn6vx4zF9+b96mv+PQxgS4N/AUlGRbH8vvVZHAQqDX2gCLEuP00dyqA51GR4AErXXazPSyDgtt847Og18yWIYzCCq+KUkCc9qR1Z5k0FvzUgev4aOTXYvA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(16526019)(54906003)(316002)(6666004)(7696005)(26005)(110136005)(186003)(1076003)(478600001)(2616005)(70206006)(8676002)(336012)(70586007)(4326008)(82740400003)(426003)(41300700001)(66574015)(2906002)(47076005)(83380400001)(8936002)(5660300002)(44832011)(86362001)(36756003)(36860700001)(40460700003)(356005)(40480700001)(81166007)(82310400005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:41:51.2228 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 201f944e-3063-4800-dcc5-08daee729497
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E644.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5449
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

Remove the special casing from SMU v11 code. No intended functional
changes.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    | 35 ++-----------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index ad66d57aa102..d4756bd30830 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -93,7 +93,7 @@ static void smu_v11_0_poll_baco_exit(struct smu_context *smu)
 int smu_v11_0_init_microcode(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
-	const char *chip_name;
+	char ucode_prefix[30];
 	char fw_name[SMU_FW_NAME_LEN];
 	int err = 0;
 	const struct smc_firmware_header_v1_0 *hdr;
@@ -105,38 +105,9 @@ int smu_v11_0_init_microcode(struct smu_context *smu)
 	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7))))
 		return 0;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
-	case IP_VERSION(11, 0, 0):
-		chip_name = "navi10";
-		break;
-	case IP_VERSION(11, 0, 5):
-		chip_name = "navi14";
-		break;
-	case IP_VERSION(11, 0, 9):
-		chip_name = "navi12";
-		break;
-	case IP_VERSION(11, 0, 7):
-		chip_name = "sienna_cichlid";
-		break;
-	case IP_VERSION(11, 0, 11):
-		chip_name = "navy_flounder";
-		break;
-	case IP_VERSION(11, 0, 12):
-		chip_name = "dimgrey_cavefish";
-		break;
-	case IP_VERSION(11, 0, 13):
-		chip_name = "beige_goby";
-		break;
-	case IP_VERSION(11, 0, 2):
-		chip_name = "arcturus";
-		break;
-	default:
-		dev_err(adev->dev, "Unsupported IP version 0x%x\n",
-			adev->ip_versions[MP1_HWIP][0]);
-		return -EINVAL;
-	}
+	amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_smc.bin", chip_name);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
 
 	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
 	if (err)
-- 
2.34.1

