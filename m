Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EB8737ACD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 07:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA0610E3BD;
	Wed, 21 Jun 2023 05:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E9F10E3BC;
 Wed, 21 Jun 2023 05:49:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D833BY1lnxUM4z8xn39HoYOhQJxLEQBnUPwQyef5csQjPRQgYL6KqPfTmrQRo8uDxINZkfT2eOuTh9DCkLNtq0PQhF+kxjn3WNEQ8R5smP3SgEqC9GwlKkID+zhuF37mjqQlLdhmwE+iM6q91pLXJA6WjrA66xUt4fOWWGPzrKu1iHXnmIzlfTplleWWDjT4VaqChsgea6MTcpiZp+P+QmK+B3E3bdLdGJLceis3eYW1m7Sp0CRVh5c1lzeQhv6zULhTKyJTXpUBe2QXF5jzm3nRbT2rKS+oVV5GHNn8zcBdmIK18gBnBcDr/Uatvd2Qre+Z18z7ptWfhnIE2mi5MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z6ibdcFT/8MmVrVyhFkBUyZoPiugSXma1cMC0A9HYI=;
 b=OOi8HBdomodeF8c5tShl/8EQWAFnywouDUg1jFyOAwypOslN4ciRfGmabwGCsBus5h04HHh/bxhljHhy0V/IRtlY8stRcTZpLaSvMMSB99kb7dFJgQk4ToeGk9C4MWXfErfOnR0MOX9Q4pwIUJxh39Uo0SE2teGkB06VQJQ9AebstQT/tEanugWoeyveWW8CjW9F3hliTLboKlwVKEghevBOYg0OkZW2O96KDBASExf4X+kNgy4BmKkBzzBBF6x0LlQdmNAZufzdgEnog/SA3xgzcANW5YYJkNKHJGy2IxIdm+c/RsNpHPaIlueRE9a+zp77/tIfg3e3ZvPE7eJ89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z6ibdcFT/8MmVrVyhFkBUyZoPiugSXma1cMC0A9HYI=;
 b=tewzGVxgrW7/OwsdTnRaSDm+Y97nNicPRpSBjbj+6o47QVkbx3/1KMgquOutlAEHc3H+VNdjV8k7pC/4ql0hResFT6iEfXXPDKJmqEXCP1XrlneLi8teHk6MVHBSLrXv7Hk3siPIpbUVrmu7cSTofIx8ymmGZ9QO9Qbs3K0U4wk=
Received: from DM6PR12CA0010.namprd12.prod.outlook.com (2603:10b6:5:1c0::23)
 by SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 05:49:44 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::da) by DM6PR12CA0010.outlook.office365.com
 (2603:10b6:5:1c0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Wed, 21 Jun 2023 05:49:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Wed, 21 Jun 2023 05:49:44 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 00:49:34 -0500
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
Subject: [PATCH V4 7/8] drm/amd/pm: enable Wifi RFI mitigation feature support
 for SMU13.0.0
Date: Wed, 21 Jun 2023 13:46:02 +0800
Message-ID: <20230621054603.1262299-8-evan.quan@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b29972b-593b-42ad-2a74-08db721b5079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 60TKyO6o4VtdTvHM3KMDh2BirClAhy4Lwh/0SLdgOmwIQefOGFx5XdspzfkqhIL6pKQCGh7a9HryIENcADk9W784csuKfugpDhHmIrM9Pe9hwsFE1VgC+23Ts0ZqqLE6FxF+5UZQ214uEfjg/Yna9nr3WtOg97/IY9hPcigDadekY6BZQGEQMJlgPUcKI2yIMpZHkKGLzYd5bSGLsDI+0pM6fyFPL4XTHrzX9D0sTjMKZ6HZHFE5CBSaNjZ8G+3wv9Bcqd1i9ewAuL9vw7csi4LdsBiOYtYSxt8CGLsguugp2JNrAbXWpXUH6aXC0y2gEdE1tiVASGu5Z+SmH5Qq1NvHEDPrlIVtTN/3DCyyp9nvvLOeC4brrU6wtlHczNJJZ82uVPIOhbOs+Sm0AxVpAye9UuysLrtKUvBvkJTdlY6badVSiMzHhvnnAv2+cxxFjLDxCh8UzBiguVkEi3Vvex4zz4NGcConJ594bQdCqb21JGBpak6E7ARwsq+o6MuvXdKivUfXBi/EqCfG3eKJ7QNpZCLtLQOKNsRZvX94FH4p4zXNBGL9JFiFwixsMfeTMQOm6JeAVKh5OLsCQrr/TE27Uh5XtgnaNlanhvAIKwHWLiDvQubLXN5TxXJaSDaHbqv2ZteT0FAKL5P6JhEtp05G3/nwJ5YNgZBVX0JKE0dqhzeBg0yGlVF3Y2yjGQ0kjz2g409HdeCPurPz5C+oi6ElPda4K2Vr7lueH31d2aoi0PeimivZaxOJtXWJ9Q3Q1n7OcfmQXK6A/AZpC76FbL/mAlNs5nBq+n9aV3wxJ+D5tfFgYVUV1eIkx5q9uvIqSTl8UEb/sf70PxwZCOs2+Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(46966006)(36840700001)(40470700004)(81166007)(921005)(40480700001)(82740400003)(36756003)(356005)(82310400005)(86362001)(7416002)(40460700003)(70206006)(4326008)(44832011)(316002)(26005)(186003)(110136005)(54906003)(5660300002)(70586007)(6666004)(7696005)(16526019)(8936002)(1076003)(426003)(2616005)(2906002)(36860700001)(8676002)(478600001)(47076005)(336012)(41300700001)(83380400001)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 05:49:44.1921 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b29972b-593b-42ad-2a74-08db721b5079
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119
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
index aa63cc43d41c..a8a4be32cc59 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -323,6 +323,7 @@ enum smu_table_id
 	SMU_TABLE_PACE,
 	SMU_TABLE_ECCINFO,
 	SMU_TABLE_COMBO_PPTABLE,
+	SMU_TABLE_WIFIBAND,
 	SMU_TABLE_COUNT,
 };
 
@@ -1496,6 +1497,8 @@ enum smu_baco_seq {
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
index 393c6a7b9609..8c2230d1d862 100644
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
index 09405ef1e3c8..cf75feaee779 100644
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
@@ -2112,6 +2117,58 @@ static ssize_t smu_v13_0_0_get_ecc_info(struct smu_context *smu,
 	return ret;
 }
 
+static bool smu_v13_0_0_wbrf_support_check(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+
+	switch (adev->ip_versions[MP1_HWIP][0]) {
+	case IP_VERSION(13, 0, 0):
+		return smu->smc_fw_version >= 0x004e5f00;
+	case IP_VERSION(13, 0, 10):
+		return smu->smc_fw_version >= 0x00503000;
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
@@ -2188,6 +2245,9 @@ static const struct pptable_funcs smu_v13_0_0_ppt_funcs = {
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

