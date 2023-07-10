Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E1B74D040
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9EC10E147;
	Mon, 10 Jul 2023 08:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEE510E147;
 Mon, 10 Jul 2023 08:40:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBMvpLsUnoNqRT6hs+lcjLWzYW4BIUwiuZEV6hnJvLQefKaf9D9su3lt+J9O7ho6Zzt9mKeZbgjgsLh4IFMs7iFG73FFOd+rmJkYGjRD7od6h2QNJYk338vkwgUZZ8vd89yo9TD/8ouMbMq1E94UDKEnpnkmJsuX69kkU4hCZig0wbVYnn3PwSXeDyLr5KOGrTX85UlginEgG9zFtXaW0aSc7PrlmrsaAly2FlvLs96sxBgJGRF8lGOT6te79KTzJPrL2fWTGPpWhRj1jkbr6jn+qp+BYKBs26ffdi9IOzf81nLvJnYWX+hJp/7Dmt5OgilAjg2I35wg5+k7hfcFIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77oJ1lJYQNNqqP80R3eGk4gvUAHbfABBOq8qNyuku1Q=;
 b=HrZEeCw+tmV7M1b2eZy7aefXbQGDyokTBvHzAkfg2lpF/vjQbO81drL8KSChWlZzlUjUleiMoMMO+UUDk8NbssSFyeh5F3iGtAosVHpWPYReQ3+WjkESpMf66p/snRe/qEoIrhZKpN6h6qtlchOwANTTnbaLJGxSl3IZ7HSicB2yM7/I7tTWSj/elCbcrLNyQbADyFW8hZJHsLvj8JjTgVX7vVolG4te7Srp1LeoqKrL6liggui6WXIcpjehCvrD5ZqxWm56Nsug6ifsC/9BUFKZYaY1Eq9VA8vB1MsfkMSxhXi6AVg8QlUKrnZgYIO9VG4Omyo9cQ+L+QuIeZaUvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77oJ1lJYQNNqqP80R3eGk4gvUAHbfABBOq8qNyuku1Q=;
 b=XQCsfLR1Nu9Mw6MlWVeuEQen84/H5vh2TBjJEmWR3nHl8ZQKHlLfr5cMEf6z1nSWLi8GLEKUJikqAWBCL1zHPeXifHIkv45mr1OdeWp4BX+0uy8DLKq7LRa4+G15zE5dwW6R04JV44wR53Pia0OAYc/Sjkpiks3heZQ+4tmb7Vg=
Received: from DS7PR03CA0356.namprd03.prod.outlook.com (2603:10b6:8:55::22) by
 SN7PR12MB8028.namprd12.prod.outlook.com (2603:10b6:806:341::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.30; Mon, 10 Jul 2023 08:40:04 +0000
Received: from DM6NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::2d) by DS7PR03CA0356.outlook.office365.com
 (2603:10b6:8:55::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30 via Frontend
 Transport; Mon, 10 Jul 2023 08:40:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT100.mail.protection.outlook.com (10.13.172.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.18 via Frontend Transport; Mon, 10 Jul 2023 08:40:03 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 10 Jul
 2023 03:39:55 -0500
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
Subject: [PATCH V6 8/9] drm/amd/pm: enable Wifi RFI mitigation feature support
 for SMU13.0.0
Date: Mon, 10 Jul 2023 16:36:40 +0800
Message-ID: <20230710083641.2132264-9-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710083641.2132264-1-evan.quan@amd.com>
References: <20230710083641.2132264-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT100:EE_|SN7PR12MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 0acf88a2-b45f-4aa8-992f-08db812141c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tSvV1OUZJpG/Gs41/u7HjbPsVkt5gw+tzjhpO3L3MHLCZ85zQUZlW0SioUraF6/SRmlYH+eiQ9T7DOTRKnG3/MtV5HYhMUqgkX/27ruw6a14zi5IuHdGk1JLA2o/iqwOKApJSe3H8i41uopXXNQmUkjusrtl3E/Fj9lkGk4XPKIJIvwoxZxnkCs6JkDUT8tncDcHT5z7vIix5SZpqOUjMq/I+FsLwpA9R1fXLaQU5N5Uh+qbwVt1geqnA4DQ48i/vdzTeAhJQ8UcV0fAsj0PcR9ZdaF5Zt2z2vcHUFsXv1/DMgdTiZX6PrlDiBAwHgJMsOWOJHbwGSxFqcxa4tYH6y2abz9BDegQwRwpug4Tea3fYjUouHAs2O9b/OV61sKhMkPTPLgjKm1MsW9MVWWze090n9PWt7Zon6V59e5Uz/ITyJGNy46MyLB0njbpQHYGqnLYd860/QPKNnRlh7Clm+LR9Tm+MxrXERb5mJg70I4iz5GVXows9Op8eMYpJ+d9NeMdtDFA0snYw04ufdI4Hu4LYM31hcfhj+0VBjP+XA5Z5R0T8TNv/41zsvJTdLMzd2yb0jh+3HdWnvupz9umkmaTw/khBN5qxbXozFI1S/s8DLblFzHGhQK2f4x2p1ZfHVGeeGkqgkofTvvoUpGm4zJeNdOclbx+4uMHba9uqjuA+EqTWddMoShW1Q1s/gGiS+4Nee+FGMV5AkbBIXj/MbLx72oa3IuA/Hy0YkL0RWq1yficJBe4ONgcWIbj3x5Opker1dDidzDvvAbuz59NRsn1UMammvByypb8nwMsQlVcK2+/fLoXeQ4vLdiwqEXz2vNMN/ni5QZoBxDxYIef2g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(40470700004)(36840700001)(46966006)(86362001)(82310400005)(82740400003)(40460700003)(40480700001)(36756003)(6666004)(7696005)(110136005)(54906003)(70206006)(70586007)(921005)(81166007)(356005)(36860700001)(16526019)(1076003)(186003)(2616005)(26005)(44832011)(7416002)(5660300002)(316002)(2906002)(478600001)(8676002)(8936002)(47076005)(336012)(426003)(83380400001)(4326008)(41300700001)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:40:03.9452 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acf88a2-b45f-4aa8-992f-08db812141c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8028
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

Fulfill the SMU13.0.0 support for Wifi RFI mitigation feature.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  3 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |  3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |  3 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  9 +++
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  | 60 +++++++++++++++++++
 5 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 5df28d4a8c30..32764c509ba8 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -325,6 +325,7 @@ enum smu_table_id
 	SMU_TABLE_PACE,
 	SMU_TABLE_ECCINFO,
 	SMU_TABLE_COMBO_PPTABLE,
+	SMU_TABLE_WIFIBAND,
 	SMU_TABLE_COUNT,
 };
 
@@ -1499,6 +1500,8 @@ enum smu_baco_seq {
 			 __dst_size);					   \
 })
 
+#define HZ_IN_MHZ		1000000U
+
 #if !defined(SWSMU_CODE_LAYER_L2) && !defined(SWSMU_CODE_LAYER_L3) && !defined(SWSMU_CODE_LAYER_L4)
 int smu_get_power_limit(void *handle,
 			uint32_t *limit,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
index 297b70b9388f..5bbb60289a79 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
@@ -245,7 +245,8 @@
 	__SMU_DUMMY_MAP(AllowGpo),	\
 	__SMU_DUMMY_MAP(Mode2Reset),	\
 	__SMU_DUMMY_MAP(RequestI2cTransaction), \
-	__SMU_DUMMY_MAP(GetMetricsTable),
+	__SMU_DUMMY_MAP(GetMetricsTable), \
+	__SMU_DUMMY_MAP(EnableUCLKShadow),
 
 #undef __SMU_DUMMY_MAP
 #define __SMU_DUMMY_MAP(type)	SMU_MSG_##type
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
index df3baaab0037..b6fae9b92303 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
@@ -303,5 +303,8 @@ int smu_v13_0_get_pptable_from_firmware(struct smu_context *smu,
 					uint32_t *size,
 					uint32_t pptable_id);
 
+int smu_v13_0_enable_uclk_shadow(struct smu_context *smu,
+				 bool enablement);
+
 #endif
 #endif
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index ca379181081c..7cb24c862720 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -2453,3 +2453,12 @@ int smu_v13_0_mode1_reset(struct smu_context *smu)
 
 	return ret;
 }
+
+int smu_v13_0_enable_uclk_shadow(struct smu_context *smu,
+				 bool enablement)
+{
+	return smu_cmn_send_smc_msg_with_param(smu,
+					       SMU_MSG_EnableUCLKShadow,
+					       enablement,
+					       NULL);
+}
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index 08577d1b84ec..3e864bd2c5a4 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -155,6 +155,7 @@ static struct cmn2asic_msg_mapping smu_v13_0_0_message_map[SMU_MSG_MAX_COUNT] =
 	MSG_MAP(AllowGpo,			PPSMC_MSG_SetGpoAllow,           0),
 	MSG_MAP(AllowIHHostInterrupt,		PPSMC_MSG_AllowIHHostInterrupt,       0),
 	MSG_MAP(ReenableAcDcInterrupt,		PPSMC_MSG_ReenableAcDcInterrupt,       0),
+	MSG_MAP(EnableUCLKShadow,		PPSMC_MSG_EnableUCLKShadow,            0),
 };
 
 static struct cmn2asic_mapping smu_v13_0_0_clk_map[SMU_CLK_COUNT] = {
@@ -235,6 +236,7 @@ static struct cmn2asic_mapping smu_v13_0_0_table_map[SMU_TABLE_COUNT] = {
 	TAB_MAP(DRIVER_SMU_CONFIG),
 	TAB_MAP(ACTIVITY_MONITOR_COEFF),
 	[SMU_TABLE_COMBO_PPTABLE] = {1, TABLE_COMBO_PPTABLE},
+	TAB_MAP(WIFIBAND),
 	TAB_MAP(I2C_COMMANDS),
 	TAB_MAP(ECCINFO),
 };
@@ -472,6 +474,9 @@ static int smu_v13_0_0_tables_init(struct smu_context *smu)
 			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
 	SMU_TABLE_INIT(tables, SMU_TABLE_ECCINFO, sizeof(EccInfoTable_t),
 			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_WIFIBAND,
+		       sizeof(WifiBandEntryTable_t), PAGE_SIZE,
+		       AMDGPU_GEM_DOMAIN_VRAM);
 
 	smu_table->metrics_table = kzalloc(sizeof(SmuMetricsExternal_t), GFP_KERNEL);
 	if (!smu_table->metrics_table)
@@ -2141,6 +2146,58 @@ static ssize_t smu_v13_0_0_get_ecc_info(struct smu_context *smu,
 	return ret;
 }
 
+static bool smu_v13_0_0_wbrf_support_check(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+
+	switch (adev->ip_versions[MP1_HWIP][0]) {
+	case IP_VERSION(13, 0, 0):
+		return smu->smc_fw_version >= 0x004e6300;
+	case IP_VERSION(13, 0, 10):
+		return smu->smc_fw_version >= 0x00503300;
+	default:
+		return false;
+	}
+}
+
+static int smu_v13_0_0_set_wbrf_exclusion_ranges(struct smu_context *smu,
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
+	 * Per confirm with PMFW team, WifiBandEntryNum = 0
+	 * is a valid setting. So, there should be no direct
+	 * return on that.
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
 static const struct pptable_funcs smu_v13_0_0_ppt_funcs = {
 	.get_allowed_feature_mask = smu_v13_0_0_get_allowed_feature_mask,
 	.set_default_dpm_table = smu_v13_0_0_set_default_dpm_table,
@@ -2217,6 +2274,9 @@ static const struct pptable_funcs smu_v13_0_0_ppt_funcs = {
 	.send_hbm_bad_channel_flag = smu_v13_0_0_send_bad_mem_channel_flag,
 	.gpo_control = smu_v13_0_gpo_control,
 	.get_ecc_info = smu_v13_0_0_get_ecc_info,
+	.is_asic_wbrf_supported = smu_v13_0_0_wbrf_support_check,
+	.enable_uclk_shadow = smu_v13_0_enable_uclk_shadow,
+	.set_wbrf_exclusion_ranges = smu_v13_0_0_set_wbrf_exclusion_ranges,
 };
 
 void smu_v13_0_0_set_ppt_funcs(struct smu_context *smu)
-- 
2.34.1

