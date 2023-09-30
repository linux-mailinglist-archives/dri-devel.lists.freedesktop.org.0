Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4387E7B3F51
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315FB10E1C7;
	Sat, 30 Sep 2023 08:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054F210E1C6;
 Sat, 30 Sep 2023 08:38:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXvcJ64eq631GDcl1Q4Xo37c1P3uG20+50ivJi7wjD+kUCXG+kA7sDnVcwGUoWo5JBMtFwVo8AtIBBvsgw+pZ6ZxG1JEJk9oi9/A2vbTksg4cLkAfyODBHde25D2pWIuPJ+BCyNJDpcsQ/6eK3Y7EZZfDG8X4Ae7O5vFnedoC17Oh+FxZ2fpiMC0blusOPuXTJcDaUsi5F2ohzHoyC+hGHuguvWi4JHsX18cNIsInCdZxzEvMgVSclQHmishG5tpN6jJ/t6eORdGjXUN6P4qP7P3m11HCWg7u89JUxhtUxztS0RxAweifHx9McduYqIUMTfUU5iNxOb9z7FFUb49hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLMuNx6brx9mbSEehP0Y+y1Oj2nURm3RJRcrXHPERUc=;
 b=ZLoeVqN+dB+81SvgoxR7fXGgz9GEWgB1JKNpOjF5bx5XIVnqdVRMnNDWLO3m1JOI60eEj0VScQjjWvISNLKcCo0zuQSagwlM08gitCuLt6FPiCxDCGYFiLzsb4fJfCX2Nkh/pRXMCauIkNpr+mgiJYMMZuhDwYnKQKJ+kTAQacKuBmVQ7qxaK4fb/XhZplp3p5Ud3FzrKxKCkPo1TTlBGyHwZ5dYG86MKHsOoeRIs6NBgo/KsmHmejpY8sSOdrESBmKN6IFAiYI0AnnqSLZg2aVMwNuZf+YkAnhCeCD2W0EF7urOYY3xmlpZO0LyigO2JD5Sg4btpAZeLanRO6nnJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLMuNx6brx9mbSEehP0Y+y1Oj2nURm3RJRcrXHPERUc=;
 b=1QKilUA/Z8WG34jk+4EQWYVv5VcyNe9HdGV/nM7p5d9Wx5YjXA3AucWHMiXd4a6KFTKN4lRUWTt2mlUWYfb4CMAq4XycCfXnfMDRWyfCHu7OWLshnhEYWLWSEtnRWlcm9XO0mE448vxrKc9duuQ2B1iqDoujLt9G/dLsREoLWOk=
Received: from MN2PR14CA0011.namprd14.prod.outlook.com (2603:10b6:208:23e::16)
 by DM4PR12MB5343.namprd12.prod.outlook.com (2603:10b6:5:389::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Sat, 30 Sep
 2023 08:38:55 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::99) by MN2PR14CA0011.outlook.office365.com
 (2603:10b6:208:23e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28 via Frontend
 Transport; Sat, 30 Sep 2023 08:38:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:38:54 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:38:50 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 06/16] platform/x86/amd/pmf: Add support to get inputs from
 other subsystems
Date: Sat, 30 Sep 2023 14:07:05 +0530
Message-ID: <20230930083715.2050863-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|DM4PR12MB5343:EE_
X-MS-Office365-Filtering-Correlation-Id: 146e361b-c726-4aa2-05ff-08dbc190ae79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5AJ4uZBXV3RTJSNFF3l+bDxi4t7iZzvgjYxpLc++3xHgTyby+ZcSGBbtSU47wBs+WlF3xmgKbgP+vXxrtgVvDv067vvBWvtvx2Bq7A8zYhbhFZt8RPfgbX3s/iASRcgbqjMcMYaFqncKGAnpAHh4KheYIIUOhhJx6h//ogU1voy57sY4zWr2JBN/NYCjOB0vaw72PXW6L24Q5BEejcLyugyWSaRC6+8Lttebn+ypLrWuduGnmsMQ4WhCFInzsgPmk5YEgao3zOZ+Ng1td88aNzFD5HafKAadOsnUUEqkM2uspOZ3Nn1eLFUUcr/6pzUO0mKaRJN14L5zEKNF4PhxcRlxJGfIZTt0ank26fmkSIiBX0/hYIPvff3jVhgQsGmo6EMd8VK5+wMI4TgEEo7roafF9zsu8VTwlsWlQYU+nmugFskUoKW7amEsna51kp8Uku9nr0m2rx+lrJotHoHI4VeXoZuUIPUWRZoZtO2OEQor0/0YrBleTu5192E0pA2yXNRbvRUol8fgNUB3RW9SDEa6s0O8SMNG2v7EvetSM8iulhXXo4pdfw8mMY65x+g6CiO/2lKw40SAENyiCbQPupxLSKHsbIlD0gwhZR0MnaQItnOMNC8klVeH8JO3R2cl65EOcQanq88zANDTLCsMqYWQWCowB5528V7z/nvQn6SUYaJVWTv7uJTXAuGVcyokQgVv1bG0Xje+yQjATMQjaoLvGcfFNG2geZSbxGhKc+2qKgdEo5FWmgQdgUAszNYRUuOWTJzKPM8RwE7Y20262rTPrCQAnEUMu0pvEggfZ08=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(7696005)(2616005)(40460700003)(86362001)(36756003)(921005)(356005)(81166007)(82740400003)(40480700001)(36860700001)(1076003)(336012)(426003)(2906002)(478600001)(47076005)(6666004)(83380400001)(7416002)(8936002)(4326008)(26005)(8676002)(16526019)(41300700001)(316002)(70586007)(5660300002)(110136005)(70206006)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:38:54.8269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 146e361b-c726-4aa2-05ff-08dbc190ae79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5343
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PMF driver sends changing inputs from each subystem to TA for evaluating
the conditions in the policy binary.

Add initial support of plumbing in the PMF driver for Smart PC to get
information from other subsystems in the kernel.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Makefile |   2 +-
 drivers/platform/x86/amd/pmf/pmf.h    |  18 ++++
 drivers/platform/x86/amd/pmf/spc.c    | 119 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/tee-if.c |   3 +
 4 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/amd/pmf/spc.c

diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index d2746ee7369f..6b26e48ce8ad 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -7,4 +7,4 @@
 obj-$(CONFIG_AMD_PMF) += amd-pmf.o
 amd-pmf-objs := core.o acpi.o sps.o \
 		auto-mode.o cnqf.o \
-		tee-if.o
+		tee-if.o spc.o
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 6f4b6f4ecee4..60b11455dadf 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -149,6 +149,21 @@ struct smu_pmf_metrics {
 	u16 infra_gfx_maxfreq; /* in MHz */
 	u16 skin_temp; /* in centi-Celsius */
 	u16 device_state;
+	u16 curtemp; /* in centi-Celsius */
+	u16 filter_alpha_value;
+	u16 avg_gfx_clkfrequency;
+	u16 avg_fclk_frequency;
+	u16 avg_gfx_activity;
+	u16 avg_socclk_frequency;
+	u16 avg_vclk_frequency;
+	u16 avg_vcn_activity;
+	u16 avg_dram_reads;
+	u16 avg_dram_writes;
+	u16 avg_socket_power;
+	u16 avg_core_power[2];
+	u16 avg_core_c0residency[16];
+	u16 spare1;
+	u32 metrics_counter;
 } __packed;
 
 enum amd_stt_skin_temp {
@@ -595,4 +610,7 @@ extern const struct attribute_group cnqf_feature_attribute_group;
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
 int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
+
+/* Smart PC - TA interfaces */
+void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
new file mode 100644
index 000000000000..3113bde051d9
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Platform Management Framework Driver - Smart PC Capabilities
+ *
+ * Copyright (c) 2023, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *          Patil Rajesh Reddy <Patil.Reddy@amd.com>
+ */
+
+#include <acpi/button.h>
+#include <linux/power_supply.h>
+#include <linux/units.h>
+#include "pmf.h"
+
+static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	u16 max, avg = 0;
+	int i;
+
+	memset(dev->buf, 0, sizeof(dev->m_table));
+	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
+	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
+
+	in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
+	in->ev_info.skin_temperature = dev->m_table.skin_temp;
+
+	/* get the avg C0 residency of all the cores */
+	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++)
+		avg += dev->m_table.avg_core_c0residency[i];
+
+	/* get the max C0 residency of all the cores */
+	max = dev->m_table.avg_core_c0residency[0];
+	for (i = 1; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
+		if (dev->m_table.avg_core_c0residency[i] > max)
+			max = dev->m_table.avg_core_c0residency[i];
+	}
+
+	in->ev_info.avg_c0residency = avg / ARRAY_SIZE(dev->m_table.avg_core_c0residency);
+	in->ev_info.max_c0residency = max;
+	in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
+}
+
+static const char * const pmf_battery_supply_name[] = {
+	"BATT",
+	"BAT0",
+};
+
+static int get_battery_prop(enum power_supply_property prop)
+{
+	union power_supply_propval value;
+	struct power_supply *psy;
+	int i, ret = -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(pmf_battery_supply_name); i++) {
+		psy = power_supply_get_by_name(pmf_battery_supply_name[i]);
+		if (!psy)
+			continue;
+
+		ret = power_supply_get_property(psy, prop, &value);
+		if (ret) {
+			power_supply_put(psy);
+			return ret;
+		}
+	}
+
+	return value.intval;
+}
+
+static int amd_pmf_get_battery_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	int val;
+
+	val = get_battery_prop(POWER_SUPPLY_PROP_PRESENT);
+	if (val != 1)
+		return -EINVAL;
+
+	in->ev_info.bat_percentage = get_battery_prop(POWER_SUPPLY_PROP_CAPACITY);
+	/* all values in mWh metrics */
+	in->ev_info.bat_design = get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN) / MILLI;
+	in->ev_info.full_charge_capacity = get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL) / MILLI;
+	in->ev_info.drain_rate = get_battery_prop(POWER_SUPPLY_PROP_POWER_NOW) / MILLI;
+
+	return 0;
+}
+
+static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	int val;
+
+	switch (dev->current_profile) {
+	case PLATFORM_PROFILE_PERFORMANCE:
+		val = TA_BEST_PERFORMANCE;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		val = TA_BETTER_PERFORMANCE;
+		break;
+	case PLATFORM_PROFILE_LOW_POWER:
+		val = TA_BEST_BATTERY;
+		break;
+	default:
+		dev_err(dev->dev, "Unknown Platform Profile.\n");
+		return -EOPNOTSUPP;
+	}
+	in->ev_info.power_slider = val;
+
+	return 0;
+}
+
+void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	/* TA side lid open is 1 and close is 0, hence the ! here */
+	in->ev_info.lid_state = !acpi_lid_open();
+	in->ev_info.power_source = amd_pmf_get_power_source();
+	amd_pmf_get_smu_info(dev, in);
+	amd_pmf_get_battery_info(dev, in);
+	amd_pmf_get_slider_info(dev, in);
+}
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 15aa6e6e1050..1fc3b57f8d78 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -113,6 +113,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 {
 	struct ta_pmf_shared_memory *ta_sm = NULL;
 	struct ta_pmf_enact_result *out = NULL;
+	struct ta_pmf_enact_table *in = NULL;
 	struct tee_param param[MAX_TEE_PARAM];
 	struct tee_ioctl_invoke_arg arg;
 	int ret = 0;
@@ -123,11 +124,13 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 	memset(dev->shbuf, 0, dev->policy_sz);
 	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
 	out = &ta_sm->pmf_output.policy_apply_table;
+	in = &ta_sm->pmf_input.enact_table;
 
 	memset(ta_sm, 0, sizeof(struct ta_pmf_shared_memory));
 	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
 	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
 
+	amd_pmf_populate_ta_inputs(dev, in);
 	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES, &arg, param);
 
 	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
-- 
2.25.1

