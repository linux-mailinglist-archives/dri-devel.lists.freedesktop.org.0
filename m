Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA92E7771B3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0ED10E4E7;
	Thu, 10 Aug 2023 07:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EF010E4E6;
 Thu, 10 Aug 2023 07:42:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWnUsdMYlzT+BLhd9hshsKxjS6QZ7L1cSrFd5kwD28LvXMcTLNuTJ1i8VL8vRkjkQZZQphtS+W+AgyVwS/hj1BeU9CkZ0onETDTwhL9wtGalAWg12xz60DjfZhfUlffYnJO3KAGADgajtztts9jlf9oqh7Ok4MyawgvtxgkQZLKtyjT9GX78ekHo/8/9ZSqcSX6oP+s3X+8Us3Sy96pAp7ct59iWibW61KdkLshdhhAfz4oDsly9h8BMmuRksLoP9qoW4zJEAfRseZ6QrRM/QSrsqYzE6zryL0mWZxGqbK+VnVii4npsmrmrKkPM5v+JPS1w7nVOYog6fr/JsDMwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBMyP5sjBldwqJ3K6uKO9aVAXKYlirNWck9M6BuMFVM=;
 b=NIdPwMPCnTULVR3KLOkeafZ7axdU8t9i6YArgVguBYEaH6TmMz9kS9RkyHAYh+p7+JC8ZJzBsbJxBkWIAbiiNqsr+W4BbfPwyQoSQ6GUxRE1vsWWJxCM7bRAkSOkQ6+DeUHXmyAkH4Grg/YxZDVk7STclejMiR86wfL3AzG68VXX9zKC2MqEcd7W0mHMyfsTDmj16zt0aTgkO6Z4nqpdq5OqMtwXieiXLg+Zvnz3jLabGIEvpXCyVfyVYj/Olvi9WwJUKVb/SX+IVgH6ZAYdVYzfOQ3YMlKTn2tZ9PPkWgxe7dHgyC2qU9urLl9To/iWuZtVNr8kcbeUKNYcPgg+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBMyP5sjBldwqJ3K6uKO9aVAXKYlirNWck9M6BuMFVM=;
 b=zAqJKDQ9IiHRkEX+Cs6pNW/svGZTMpIR76Y1TLbGPzkkogd0JJkoT5PWs+ENbJ3qCFoj8D5abrws9GtO8Y3x6YOBhR3N2qHyK+fmZwq6+DVcREYGjLGStZbCXgNOWm2WFoDeILOMzYBkZbvNEmiPw3ZjZ0K/VcV/hYE/aMhlSfQ=
Received: from CY5PR15CA0233.namprd15.prod.outlook.com (2603:10b6:930:88::29)
 by SN7PR12MB7882.namprd12.prod.outlook.com (2603:10b6:806:348::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Thu, 10 Aug
 2023 07:42:00 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:930:88:cafe::84) by CY5PR15CA0233.outlook.office365.com
 (2603:10b6:930:88::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 07:41:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.146) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Thu, 10 Aug 2023 07:41:59 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 02:41:51 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <Mario.Limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <Lijo.Lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>, <andrew@lunn.ch>
Subject: [PATCH V8 9/9] drm/amd/pm: enable Wifi RFI mitigation feature support
 for SMU13.0.7
Date: Thu, 10 Aug 2023 15:38:03 +0800
Message-ID: <20230810073803.1643451-10-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810073803.1643451-1-evan.quan@amd.com>
References: <20230810073803.1643451-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SN7PR12MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 2645e1bb-d213-46b1-e026-08db997547da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LeRKh9mRJ6CAvSBAx6lPLSKFZDcYzELuoznfWpSoDoQj1MjItEEgn0q9v8ePZPECaigv+QTq+5Xk8720gKXnmIjL5cEL7daeYz5nM/5b+DT/LxwtrTp9YTWQ0vopw8BYXzPfgC8/Qgkuz2MII3N0IFTFksjuE13GxhHsgo4BDad/Va/6mlaHNCyU9SHvRmsTFoOPSRukQOXPqxYi2GZcna882NxY+myac/4bOLazL53UVp7j4v1tFj5LGH1szg3OB+JSN/YPAM2GQhfGhMBIAL6g7iMLcRdlamNKGEdVE7/NFOWSW9D/ympgZjU9+k805wKRVBGeaepRI3PViaQ+eMLjkiFR35sJL5fX/VpJ3etWF5gynSpxhuchXq2SQMtXxoiTI1LCpSvDVaTsUsBzYsE3WPB58isPOhs3aTmPM9FNP6Z41mq2IBTCo1ZAABFcI8k6y/NZ1h+GihpvvPgvIuAHKlJm3m0qtMIugI+eh7pOrlzEdcdEXkENBAmKGRKeSiz2ciwbCueXayMFmIhkJQX1z0NFhEP1XwRQFDOmOd2+P6XvOotoL8KZxwQx/2JLdA7WzPMKhtCI046Jl1siJgEO7cicMsgra/pWUOLf6MBL/3FUKXdLF/lCPiwKEsCA1Pjst998BU38UbxUL6hAr4upgXdCylD9h4XxXPqH4NQe3Dd743kI1DxzzktdFafYJERcVQgLNXlU6mkV/sN6tEm7wbMwTeVTqkBFnnnCHykBCWXVBBsl4sdC6id1HF5pogq2/wW2oIE2iUhrrsbWZGP8IqgHsrm8sd1LZ1nbPan7UUZpTRVmdmqb0RG2WfUS74QM/EYDEEFEYSxemlzGMQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(186006)(1800799006)(82310400008)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(1076003)(70206006)(54906003)(16526019)(26005)(336012)(478600001)(6666004)(110136005)(36756003)(70586007)(83380400001)(47076005)(426003)(2616005)(36860700001)(41300700001)(316002)(44832011)(7416002)(7696005)(4326008)(2906002)(86362001)(921005)(81166007)(5660300002)(8936002)(356005)(82740400003)(8676002)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:41:59.7557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2645e1bb-d213-46b1-e026-08db997547da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7882
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
 Evan Quan <evan.quan@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fulfill the SMU13.0.7 support for Wifi RFI mitigation feature.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
index b1f0937ccade..d02fe284b05d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -126,6 +126,7 @@ static struct cmn2asic_msg_mapping smu_v13_0_7_message_map[SMU_MSG_MAX_COUNT] =
 	MSG_MAP(AllowGpo,			PPSMC_MSG_SetGpoAllow,           0),
 	MSG_MAP(GetPptLimit,			PPSMC_MSG_GetPptLimit,                 0),
 	MSG_MAP(NotifyPowerSource,		PPSMC_MSG_NotifyPowerSource,           0),
+	MSG_MAP(EnableUCLKShadow,		PPSMC_MSG_EnableUCLKShadow,            0),
 };
 
 static struct cmn2asic_mapping smu_v13_0_7_clk_map[SMU_CLK_COUNT] = {
@@ -207,6 +208,7 @@ static struct cmn2asic_mapping smu_v13_0_7_table_map[SMU_TABLE_COUNT] = {
 	TAB_MAP(ACTIVITY_MONITOR_COEFF),
 	[SMU_TABLE_COMBO_PPTABLE] = {1, TABLE_COMBO_PPTABLE},
 	TAB_MAP(OVERDRIVE),
+	TAB_MAP(WIFIBAND),
 };
 
 static struct cmn2asic_mapping smu_v13_0_7_pwr_src_map[SMU_POWER_SOURCE_COUNT] = {
@@ -497,6 +499,9 @@ static int smu_v13_0_7_tables_init(struct smu_context *smu)
 	               AMDGPU_GEM_DOMAIN_VRAM);
 	SMU_TABLE_INIT(tables, SMU_TABLE_COMBO_PPTABLE, MP0_MP1_DATA_REGION_SIZE_COMBOPPTABLE,
 			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_WIFIBAND,
+		       sizeof(WifiBandEntryTable_t), PAGE_SIZE,
+		       AMDGPU_GEM_DOMAIN_VRAM);
 
 	smu_table->metrics_table = kzalloc(sizeof(SmuMetricsExternal_t), GFP_KERNEL);
 	if (!smu_table->metrics_table)
@@ -2173,6 +2178,57 @@ static int smu_v13_0_7_set_df_cstate(struct smu_context *smu,
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
@@ -2241,6 +2297,9 @@ static const struct pptable_funcs smu_v13_0_7_ppt_funcs = {
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

