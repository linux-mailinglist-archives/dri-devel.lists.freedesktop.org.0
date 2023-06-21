Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C8E737AD0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 07:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E87D10E3BB;
	Wed, 21 Jun 2023 05:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B7410E3BB;
 Wed, 21 Jun 2023 05:50:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLwyG8a3BivnzvmZrPBXWtfabfPhnxN7DnUdpTHhPesNOWESNuTugtLhReX+toh2pEc5D4jtHdHr7X1oFLEnfJVbhIGvkRXnI+kKzPELH5Dtk9EkajeS8HdyLzgopYt9PKzy+VhzzZK/CY46kJkFPdQbUZ+akuFxIPiNtMEk2fQvSW+5zfFyFOISjMXdBbc0CTLHvybz0GSqjZ4jm1iqEP+OBKBxbtobNLDg80z2DXvCSIf9GwSePw6eFvq+Pa1vrjpiY8JelO9S61G9QRuL/c5yycD6DUJqsXCt7J8bCm33gzfegI6dVNli86vsYH0VCTvoySzk0pThdLsO7NtPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUPArdpXEEigCis4DV1aAiRsjHVy/YsYGKX7wtaEc18=;
 b=S+vfZuJAmHwEozzpJJ62ClzsWNdXKNhNTo4Ii7ocWp17xwXVPNWF+u2O9lc06aClS7ppQw0Qfm3wWZYB0W0xzKpyXixo8307YSHx07cIHl/KUjXqQBD77p8zMdGn78ikO4pOvEpNq+Xzp/7aSwjtTReNfQ8/Dj/ZLx3GpCnmOVEAtui6de+/KH76y+1SuACyxoe2HWK7HSVEiZFrwnKuaVkl1s5lO6gY6V8J+9VsYNb1M9uDEkk4o0SMuvepKu5suUZwdklIBOdtViIC1vM/fDluhG5K3qKuWGQWwK8IxnqhBgnq9Ick9e3peJrf9peMhVWJXam6GfOojRumJzVWNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUPArdpXEEigCis4DV1aAiRsjHVy/YsYGKX7wtaEc18=;
 b=tZiRj3UBR1JlPBcIiq/6VTz7IidX8Rif5amTBFI1ZZDA580+at6HObN7xMRxHYeUvZVLhnAEenZbMQQg0xc1ed9cYWVZAYHHjx6q/bjAYeSLR44WYLsmMAnCGN1FkZGpzLQdkBAF744QaN2ad7bvjZ2sXmoV2lWebNkiwwKekgg=
Received: from SA1P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::23)
 by PH0PR12MB5468.namprd12.prod.outlook.com (2603:10b6:510:ea::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 05:50:32 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:22c:cafe::27) by SA1P222CA0014.outlook.office365.com
 (2603:10b6:806:22c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23 via Frontend
 Transport; Wed, 21 Jun 2023 05:50:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.23 via Frontend Transport; Wed, 21 Jun 2023 05:50:32 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 00:49:42 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <mario.limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <lijo.lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>
Subject: [PATCH V4 8/8] drm/amd/pm: enable Wifi RFI mitigation feature support
 for SMU13.0.7
Date: Wed, 21 Jun 2023 13:46:03 +0800
Message-ID: <20230621054603.1262299-9-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230621054603.1262299-1-evan.quan@amd.com>
References: <20230621054603.1262299-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|PH0PR12MB5468:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f3f6f1-88e5-4e19-c5b6-08db721b6d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FOHwDvswiXY+YNoM7ysUqleQpS37ZcreZeY/mfrohqek4cUP3pzSWyd4LfYiJ9HBM4uJ8xgsx0u17+JsPHI9hEgS628jSTG0kMBZstbJEByXXlcxzqvMJal7QnrGZ/IdP3gtNxu2YPiqMbsghVXG00vuLMckySv7V8ZBPhMSRC7q1jyKhMw59gHh7wiQSZmcMKs+Fqw95QX/tmrWSWAH9nxYo1rFXYq3T5YUxtZj/CtsHmkO7757xvG6DdzWDkX6bJFSKvriy0GRPsJt7+T4jexC9Hf0XHtwiP2gPZdkUL97iS5Qg+s+xSgTZoD3K5PHmJ4od9+Jh77dk8M44wyEq6pdFLNkVhZA5yzJAFo4gKUnzgj70JTqdTsKfaA8zEILNHc5teivS1ENLI8D8UhPQD8DPdBdyR/3JZ+RZ32gQ+d2R9EiAbs7ZqHGAsOSlkoDHx9pNmTcEmMyBMLhC69LSiwdaizAmSc5Mj3e0o5YaYbpCFsYY01IapwMDUcDLaJbY8BQcDi6hSnFwJVnhibzaQc022PHoAyl/EHk+nF3yGU1+KRDShAQrq6Vx0GCZWQBr9zr8nGutnozbPg+bS8xMnCDCjVlRXZfe1PNaLRQhxeoMgkCLBGJ98BiwZUgfnLFYqQHXquZDdteIo/sqbMg8B7UTbZnFDzJlEptZdakFkHN2BW2pkmV2nOBL0XZbO5ktWMu/SsN+Nd5su+ndrb/LUiAMwxxmXPeVFqIGdBsbvMSQIWGvGmNOj7+xt95Qkei525zRmqnJU0vI5Z8ESqPlbn6C7UhRc9AAvUF2ND2nkfeZzxJIKZN2DXAYg8FzfE/8WNgRtg4MVa46B6ZF9QNJg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199021)(40470700004)(36840700001)(46966006)(356005)(81166007)(921005)(82740400003)(336012)(1076003)(426003)(83380400001)(26005)(186003)(2616005)(16526019)(36860700001)(40480700001)(47076005)(44832011)(7416002)(5660300002)(8936002)(8676002)(41300700001)(2906002)(36756003)(6666004)(478600001)(7696005)(70206006)(70586007)(4326008)(40460700003)(316002)(110136005)(54906003)(86362001)(82310400005)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 05:50:32.4381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f3f6f1-88e5-4e19-c5b6-08db721b6d33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5468
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fulfill the SMU13.0.7 support for Wifi RFI mitigation feature.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
index 98a33f8ee209..16c1c04e2034 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -125,6 +125,7 @@ static struct cmn2asic_msg_mapping smu_v13_0_7_message_map[SMU_MSG_MAX_COUNT] =
 	MSG_MAP(ArmD3,				PPSMC_MSG_ArmD3,                       0),
 	MSG_MAP(AllowGpo,			PPSMC_MSG_SetGpoAllow,           0),
 	MSG_MAP(GetPptLimit,			PPSMC_MSG_GetPptLimit,                 0),
+	MSG_MAP(EnableUCLKShadow,		PPSMC_MSG_EnableUCLKShadow,            0),
 };
 
 static struct cmn2asic_mapping smu_v13_0_7_clk_map[SMU_CLK_COUNT] = {
@@ -205,6 +206,7 @@ static struct cmn2asic_mapping smu_v13_0_7_table_map[SMU_TABLE_COUNT] = {
 	TAB_MAP(DRIVER_SMU_CONFIG),
 	TAB_MAP(ACTIVITY_MONITOR_COEFF),
 	[SMU_TABLE_COMBO_PPTABLE] = {1, TABLE_COMBO_PPTABLE},
+	TAB_MAP(WIFIBAND),
 };
 
 static struct cmn2asic_mapping smu_v13_0_7_pwr_src_map[SMU_POWER_SOURCE_COUNT] = {
@@ -487,6 +489,9 @@ static int smu_v13_0_7_tables_init(struct smu_context *smu)
 	               AMDGPU_GEM_DOMAIN_VRAM);
 	SMU_TABLE_INIT(tables, SMU_TABLE_COMBO_PPTABLE, MP0_MP1_DATA_REGION_SIZE_COMBOPPTABLE,
 			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_WIFIBAND,
+		       sizeof(WifiBandEntryTable_t), PAGE_SIZE,
+		       AMDGPU_GEM_DOMAIN_VRAM);
 
 	smu_table->metrics_table = kzalloc(sizeof(SmuMetricsExternal_t), GFP_KERNEL);
 	if (!smu_table->metrics_table)
@@ -1721,6 +1726,57 @@ static int smu_v13_0_7_set_df_cstate(struct smu_context *smu,
 					       NULL);
 }
 
+static bool smu_v13_0_7_wbrf_support_check(struct smu_context *smu)
+{
+	return smu->smc_fw_version > 0x00524600;
+}
+
+static int smu_v13_0_7_set_wbrf_exclusion_ranges(struct smu_context *smu,
+						 struct exclusion_range *exclusion_ranges)
+{
+	WifiBandEntryTable_t wifi_bands;
+	int valid_entries = 0;
+	int ret, i;
+
+	memset(&wifi_bands, 0, sizeof(wifi_bands));
+	for (i = 0; i < ARRAY_SIZE(wifi_bands.WifiBandEntry); i++) {
+		if (!exclusion_ranges[i].start &&
+		    !exclusion_ranges[i].end)
+			break;
+
+		/* PMFW expects the inputs to be in Mhz unit */
+		wifi_bands.WifiBandEntry[valid_entries].LowFreq =
+			DIV_ROUND_DOWN_ULL(exclusion_ranges[i].start, HZ_IN_MHZ);
+		wifi_bands.WifiBandEntry[valid_entries++].HighFreq =
+			DIV_ROUND_UP_ULL(exclusion_ranges[i].end, HZ_IN_MHZ);
+	}
+	wifi_bands.WifiBandEntryNum = valid_entries;
+
+	/*
+	 * Per confirm with PMFW team, WifiBandEntryNum = 0 is a valid setting.
+	 * Considering the scenarios below:
+	 * - At first the wifi device adds an exclusion range e.g. (2400,2500) to
+	 *   BIOS and our driver gets notified. We will set WifiBandEntryNum = 1
+	 *   and pass the WifiBandEntry (2400, 2500) to PMFW.
+	 *
+	 * - Later the wifi device removes the wifiband list added above and
+	 *   our driver gets notified again. At this time, driver will set
+	 *   WifiBandEntryNum = 0 and pass an empty WifiBandEntry list to PMFW.
+	 *   - PMFW may still need to do some uclk shadow update(e.g. switching
+	 *     from shadow clock back to primary clock) on receiving this.
+	 */
+
+	ret = smu_cmn_update_table(smu,
+				   SMU_TABLE_WIFIBAND,
+				   0,
+				   (void *)(&wifi_bands),
+				   true);
+	if (ret)
+		dev_err(smu->adev->dev, "Failed to set wifiband!");
+
+	return ret;
+}
+
 static const struct pptable_funcs smu_v13_0_7_ppt_funcs = {
 	.get_allowed_feature_mask = smu_v13_0_7_get_allowed_feature_mask,
 	.set_default_dpm_table = smu_v13_0_7_set_default_dpm_table,
@@ -1786,6 +1842,9 @@ static const struct pptable_funcs smu_v13_0_7_ppt_funcs = {
 	.set_mp1_state = smu_v13_0_7_set_mp1_state,
 	.set_df_cstate = smu_v13_0_7_set_df_cstate,
 	.gpo_control = smu_v13_0_gpo_control,
+	.is_asic_wbrf_supported = smu_v13_0_7_wbrf_support_check,
+	.enable_uclk_shadow = smu_v13_0_enable_uclk_shadow,
+	.set_wbrf_exclusion_ranges = smu_v13_0_7_set_wbrf_exclusion_ranges,
 };
 
 void smu_v13_0_7_set_ppt_funcs(struct smu_context *smu)
-- 
2.34.1

