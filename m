Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3265774399E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 12:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198C510E403;
	Fri, 30 Jun 2023 10:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF42E10E3FE;
 Fri, 30 Jun 2023 10:35:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=an9t2hp4OGSK7KXcymIj9sZ+OTaVXcigFQrMAbCM4j5i+ojBaFwa5dUaC5U+7nIbWnDAgCmmMBg4sIi0PR92EuzqwF9BalYvK/RndsueVJIrzWwyFfjpgacZloVXT0ZUQss1RN1CBxCGKnfegyh6MqEHXUxdAsIOAYCJI0CzeRJY2Um7F90hEGgydpeerNCY1SYp+amgJBo0VGy2ZkiJrsq2e4j0ohmCdTmujxInztfsoBobQPCnvhsQDMdVDaxDUlUfrqU1PP8TpFdP+aQGxpr5D287mYdVwv9793ORNuqO3ZcA6TnF1Rj6TFkFdbSg7fA3Dhe2ZDaqXVjrj2cvHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfth29BrWZrzk+qu1CaoTQ6BbwxlunM+2D18Jm9HX9w=;
 b=hSj67nbxuuLhLIPfDzXeffrQCMVv5jOBhY1cS4tZOhs1DawN1uB0pWUarap8wqYN1GUFTMARSHWxoCPfXFHJsjhI2M1ekpT0bAQmO9fWWMWMxH6gl/phD5UFnp1S5C+TmgXSf+jfYcfbbmc4sFJTv43GgCvlMCVTHlms43ZBoPYia5WFz0uzonopp+S9XQLPvUfHHpTdJJ6fxg2n/qpHAkGvgmWH3+FvGB5XYNWsSGwvRJuQpiqSC2ApgobWP7hnwagbsmlCITc9Po0PPQh1oifEZADqsIOLuTa1Lz/iMBEQYcFasPDQ6kcpelvFdcGgpcmkwrH5DfNPB5ZfclE3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfth29BrWZrzk+qu1CaoTQ6BbwxlunM+2D18Jm9HX9w=;
 b=fdj7mstPKgfFd6nme2B0SKu4II8yZUXtIPwkn7cJVZHFA9zLxctlcDmHnXoQWexrrP+qpwEiNrztr8kl8N8ny8n/wyeIGeR3EskHWmDmVE0k2Ft5PLDdIJWIMdhdiX9OWlSztEfpS5F9rUy9dBCOJCoLchvzbLqtFvnhrS39XuA=
Received: from DS7PR03CA0238.namprd03.prod.outlook.com (2603:10b6:5:3ba::33)
 by IA1PR12MB8357.namprd12.prod.outlook.com (2603:10b6:208:3ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 30 Jun
 2023 10:35:34 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::a3) by DS7PR03CA0238.outlook.office365.com
 (2603:10b6:5:3ba::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 10:35:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.49 via Frontend Transport; Fri, 30 Jun 2023 10:35:33 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 05:35:26 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <Mario.Limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <Lijo.Lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>
Subject: [PATCH V5 9/9] drm/amd/pm: enable Wifi RFI mitigation feature support
 for SMU13.0.7
Date: Fri, 30 Jun 2023 18:32:40 +0800
Message-ID: <20230630103240.1557100-10-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230630103240.1557100-1-evan.quan@amd.com>
References: <20230630103240.1557100-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT066:EE_|IA1PR12MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: ec17b99f-5e18-4126-1f48-08db7955bc37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gc9QSWXbnkwvEF9SJSkxyi880uE5eYjV8yoxgAYdLgwTMNrCCZ+gPx8N4GQOpcc53RubPd2v35iOyQPyoLbVDRhpETZV3rq8SF7m5H1ZNKUMxM2r6R6INe3JMjeIOSGOH/+uqPalyyBZiUBYqhKpIGz1qOKvfKUZqsruv1VAuUO1WYdmDkyfjD3ysWTVoDZYV9oCOyg5SUd5KUkm2z8m8zEsarP5yj83J7jH9rA3Yawv/woBIG4EZX/0029wkM4IoCWLhAaW36KZhMZUSNFyCZtb4ZtO6y9bTEh3TWTUvVNjBI62rq2SZ6VQMdpnktJGI8Cvvq5xmVHrtzdbUJ6X6kP0UNZYV9UKk/V0WJhH05RXoQmhBc9FF3CNtBc33tSod/OGZFn/5Xs8x7qk/j1QRTEPmNnF341EAgpDicStTm+E2Q3op6rpLCftM/iXCXSFlSfl8yFDg1yzVcKTLZM9XXXZU13pbKvW8ZGve2RVJcd2lGvbtQQmxZrSXCc292i/eXMBDcvbFcy/h/2+hcRoXBxLCuPPQYc2DcIoazgpGLZdRevIt6jroJeSIN8x/Q2Sj0SOWmRkmwfPL9mL3+O5W3kTGRaq1TgDHJJE8Rz26bT/cLGu6rM+aAcru2GyNl1OLfXyDBXQqha/47N3RgLlaGeSzNVodJL9DRWKLGD2aveZD6IpvdOd1QoWCSYnDrlIXg+/aMjZ3TcUJT5H49By/uG6U1wUL3CNP3znSjnAUdRHYQsUww9Rd6Tj3qZe2bdmW6So3ww+agFgARimksPMt0bqxHiExhM6GKvqnBChvJfpNib9WMVkx9JYNQumirnQSa+byb0kdWWnXNLlp2hCZw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(426003)(83380400001)(336012)(47076005)(316002)(6666004)(110136005)(8676002)(7696005)(4326008)(8936002)(41300700001)(40460700003)(36860700001)(36756003)(54906003)(40480700001)(82310400005)(82740400003)(86362001)(81166007)(356005)(921005)(2616005)(70586007)(44832011)(7416002)(5660300002)(478600001)(70206006)(2906002)(186003)(16526019)(26005)(1076003)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 10:35:33.9186 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec17b99f-5e18-4126-1f48-08db7955bc37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8357
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
index bba621615abf..4a680756208b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -126,6 +126,7 @@ static struct cmn2asic_msg_mapping smu_v13_0_7_message_map[SMU_MSG_MAX_COUNT] =
 	MSG_MAP(AllowGpo,			PPSMC_MSG_SetGpoAllow,           0),
 	MSG_MAP(GetPptLimit,			PPSMC_MSG_GetPptLimit,                 0),
 	MSG_MAP(NotifyPowerSource,		PPSMC_MSG_NotifyPowerSource,           0),
+	MSG_MAP(EnableUCLKShadow,		PPSMC_MSG_EnableUCLKShadow,            0),
 };
 
 static struct cmn2asic_mapping smu_v13_0_7_clk_map[SMU_CLK_COUNT] = {
@@ -206,6 +207,7 @@ static struct cmn2asic_mapping smu_v13_0_7_table_map[SMU_TABLE_COUNT] = {
 	TAB_MAP(DRIVER_SMU_CONFIG),
 	TAB_MAP(ACTIVITY_MONITOR_COEFF),
 	[SMU_TABLE_COMBO_PPTABLE] = {1, TABLE_COMBO_PPTABLE},
+	TAB_MAP(WIFIBAND),
 };
 
 static struct cmn2asic_mapping smu_v13_0_7_pwr_src_map[SMU_POWER_SOURCE_COUNT] = {
@@ -488,6 +490,9 @@ static int smu_v13_0_7_tables_init(struct smu_context *smu)
 	               AMDGPU_GEM_DOMAIN_VRAM);
 	SMU_TABLE_INIT(tables, SMU_TABLE_COMBO_PPTABLE, MP0_MP1_DATA_REGION_SIZE_COMBOPPTABLE,
 			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_WIFIBAND,
+		       sizeof(WifiBandEntryTable_t), PAGE_SIZE,
+		       AMDGPU_GEM_DOMAIN_VRAM);
 
 	smu_table->metrics_table = kzalloc(sizeof(SmuMetricsExternal_t), GFP_KERNEL);
 	if (!smu_table->metrics_table)
@@ -1722,6 +1727,57 @@ static int smu_v13_0_7_set_df_cstate(struct smu_context *smu,
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
@@ -1787,6 +1843,9 @@ static const struct pptable_funcs smu_v13_0_7_ppt_funcs = {
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

