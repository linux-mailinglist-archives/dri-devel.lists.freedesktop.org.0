Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D86D732828
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 08:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F9E10E5B7;
	Fri, 16 Jun 2023 06:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0226910E5B7;
 Fri, 16 Jun 2023 06:59:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eM3ALuLW2bO38Yg5AmFc2WGSc04j0AtSRzZpExnBfIvfvC1NHPyQJ4XalH490mTkKtMEujYxkqcs7WPGAXOw6pl6n4zIaz+boWlsdFemkvOpQCfw7pdeszB0yr3RIYZoGMquKt3DAVrx0TP2P6E+e8h+98TG4c5UB6Hez8g6BZmaTmnvYoUcmeo+SqGtNHLvhIsWgsu0NxVXtYNojH6FhIBmISkDRYt6ukLl4Xg0MYMchn4HcrBZEbVwXps2QPdfpK0ITiKzIq3acKuZmyrm7VFizgAm75AeH4V0kWUpd15pfD5qAJgCCh1CLMQmbcr97MOLTZEqVLSmVYlC3mR6Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uE+bqOMK/vEPNCeadJJAJvY4Ncouei1S5fSDGvN5UTc=;
 b=DaVrbSVmz/65cXUrJRlwzWmrZRdQuDzcTjyzTF5KOAs4M3n13LaV1Ea0os+Sx2NdBKpkhUVF9aMnpJFXXOFTXerkUzp6ILDX07E3gQgdp9YH7q/ke1C2Ci9dZby76Ni/b254UkCdPjAooCN3pUh0xyKelZg8XxEvnSp3rNYxYx5o2ZaBiRr5pOj47LXnA4rYeRw+LckwUDLBu6sbseHt4zo+gvy2GEudzRAx8dvaricCh2nZXg4MmQzp0BwfRpYOgo9teT//kYZnOwRnNozTmNTyZbhbv5q8ZCgDLGhejQ5fAfeD2uJe2A94JnbEXodGSii5ykxvE9U+SGCPEJQ14A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uE+bqOMK/vEPNCeadJJAJvY4Ncouei1S5fSDGvN5UTc=;
 b=NVejxeaInamfF1ktLA8XLLOBDvq+Mg6Nu0MA7Nshnb8x4b7u/ifItgN9aeZCKT6aqJ6LxjqV0+dOI1zu4t5X8z7NYA35ukB1Kpbatup1goEKvwiZFCkuJ7LF6MczeK6ojQaY8DmWH2fXU/ZTwHggMr8fL+zkLwGCGOz4y6JMyWA=
Received: from BN7PR02CA0009.namprd02.prod.outlook.com (2603:10b6:408:20::22)
 by IA0PR12MB8645.namprd12.prod.outlook.com (2603:10b6:208:48f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 06:59:34 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::61) by BN7PR02CA0009.outlook.office365.com
 (2603:10b6:408:20::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29 via Frontend
 Transport; Fri, 16 Jun 2023 06:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.29 via Frontend Transport; Fri, 16 Jun 2023 06:59:34 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 16 Jun
 2023 01:59:28 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <kvalo@kernel.org>, <nbd@nbd.name>, <lorenzo@kernel.org>,
 <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH V3 7/7] drm/amd/pm: enable Wifi RFI mitigation feature support
 for SMU13.0.7
Date: Fri, 16 Jun 2023 14:57:57 +0800
Message-ID: <20230616065757.1054422-8-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616065757.1054422-1-evan.quan@amd.com>
References: <20230616065757.1054422-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT021:EE_|IA0PR12MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d2a67b-b03e-485d-d802-08db6e373e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MremAtLguZwFMuHBILadQECqMSpjCQHzqvGTwBLvJxdCYtH54pC9CyMmkctWC6hb6Quk7U8i/oCbhJskpyYdyvroyXzcY3xWreXsCInBg3j+uLIFcc5esyZT1mrXNlgvtWN4hzrtaocnr8VtH7NsUzBYK37YOOLYMGAsrhgpyEa+d5ysetaH3GwHfVbW2H0fpYQeVMe+ffxwCdBy/NOp2GqOzoz5FbeH2stxkF8M+691WtWCQNUvSOv6DMgMCyWvSaf/YDjo0HonDg6AKQ54VPGpZ7GHFPtWgn7tlCwCvthPSi+ZB+V/CrQpsgUTBPdK/qtwqUPi4j/QxnnT1LyVwyCK1YIwyKvayW8oNL4pDZFw1K77487ACLr4Yil/AGM7AbYSiOcWxN1XTcj8gbQ6LtMf+ZeRVHM+VuEl9T14ti6QFy345D7B8DWHJtNt0h2bAtBTSErz7xHvQXWGle2k356hpbZ3vjgJURFwTbHcJTy4nuv+/7rOMhUUMQIP64V094/i+2EHFT57kglgnMlcp9SL6RHREDU2yj9yxoTmw/SaHs/oRIKmd71hbWZMpfvnYRvk+/FrtWo/v/o4bPUuunDGDyZMK21rCoaLUJhr3/nJgeEEj0e25RYm9+o7VgIQU+ZegtteWFz2loRK076RR6Qx3QhILbl9KavB911LeRVQ6uXky5L4Ur2aqulHMcjGuOoP/vx9+HYkEPfRYcPGfWZgtb5kahbfkeLw16+NuGWFQEE0G+MU8j4JaXt1BN4t+rIg64KpJfZiERRsIb3LuQDVSA0bRQ2smdmYvz4rUCM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(44832011)(7416002)(70586007)(4326008)(86362001)(2906002)(316002)(6636002)(70206006)(41300700001)(110136005)(5660300002)(8676002)(8936002)(54906003)(356005)(40480700001)(82310400005)(478600001)(81166007)(921005)(7696005)(6666004)(82740400003)(40460700003)(47076005)(83380400001)(186003)(26005)(16526019)(1076003)(36756003)(2616005)(426003)(336012)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 06:59:34.5218 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d2a67b-b03e-485d-d802-08db6e373e02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8645
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fulfill the SMU13.0.7 support for Wifi RFI mitigation feature.

Signed-off-by: Evan Quan <evan.quan@amd.com>
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

