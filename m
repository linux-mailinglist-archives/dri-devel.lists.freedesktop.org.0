Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E474D7BFC2A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF6510E34D;
	Tue, 10 Oct 2023 13:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9182010E34D;
 Tue, 10 Oct 2023 13:00:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHhOeIO6FLxgiA3QRkixOaHlTekpqdvm3PVLXQT9NXH/FlQsSJDCM2a307541PAra5M0TNFIe6B46kxs5Ww3yo7KcW/mYQuHPjF62hxLk5Y8MOga6cs9x5vHI+BoQ9ccgrIplk31yLFfz5gWvwnzIFlLqjXgOB/Dq9PMgVPKFyluhseIhQW4lHAxRwWFhePxf/IUY7M9lkSGhIttElmSV9TUGexuozk/FbojAaPP+VXgwHTVZ6lINYMRl+sdNx9UcC2aSx91c8acG9hFKFKpzx8EyEnBxFFuMLkxpu+AP9Q5HzcaF1JyNMHq5LEIRnfjwOaCizDExR4QfIA0afMlgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfv2jRGil4YWyMP7IT+5fE3x1mcqAlDIa05g21QMqo0=;
 b=YO1GNxIw9R7uUR+6n8pEdFfK8IhFS9qW7XijMPGJq0PJx+ETSSvJRKocAsPs4StOwHohMHYWJhIwsnquqHfRwgwubVK1An9IMsZbZ2Ne2awPagPw+RFApknRntLiqXHs8F51d/Ly6aiCU2gA7BhB1VOwQwBKqy3FdlEs9yZVg2UWVaah6OQzXtgBBg4Ov+CuH72y4hoffQDz3Yl86sfz8qr1I0qL7EQ8wdP0ZYZVnhdrJTbjxIeROnsFQ1BWZLYgFOBzLnGZJHD95wsYYuKcmNWG3pRU8wbU74E3dZsUcfpFskHuiIePlOVjNWmEl0VrrPcVaAjcSfp2kXwtSYYrhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfv2jRGil4YWyMP7IT+5fE3x1mcqAlDIa05g21QMqo0=;
 b=e8JEYCXj5/fWN/TUeMHiSl16xtO7uxbykQXM3gu5KRLfdELdKyrxpJ253vXf/dlKF6H8eL4mhubHvL5A3ltz/ziMUfqSy+qRI2XMDpqYevVMKt2q8zBytYrG5sCLTIG56qlRWnJdOfK2a0g2iG2Rc1qyzkO21wZk32Ue2n0EEyc=
Received: from CH2PR17CA0026.namprd17.prod.outlook.com (2603:10b6:610:53::36)
 by MW4PR12MB5626.namprd12.prod.outlook.com (2603:10b6:303:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Tue, 10 Oct
 2023 13:00:23 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::6b) by CH2PR17CA0026.outlook.office365.com
 (2603:10b6:610:53::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37 via Frontend
 Transport; Tue, 10 Oct 2023 13:00:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 13:00:22 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 08:00:07 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 06/16] platform/x86/amd/pmf: Add support to get inputs from
 other subsystems
Date: Tue, 10 Oct 2023 18:29:07 +0530
Message-ID: <20231010125917.138225-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|MW4PR12MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: ec35701c-78d4-4a50-4e03-08dbc990dd57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ma0ZwlJgf+nUzk3gu7L5UXFa+EO7tQhUVhxTZ/m79uKonITePY9izZTP7In6RSsrD+NsJvMtG4jgR8RDJnU4jx3Qv4AineibIz/aoiUVDL5qowOEni2aU/4+tDhqU1briyrlQfYWUoYLdVnbkq23+/E52LnYFufL6hZkzcfW7UsB/iNueYDuohLlN6/zg3qm+5Cd0p7kIOPHaZY19oetv6eTE//J3zfGlbrYwJS/dp0WREGZKzjb3TTFQiMfckozrJS31BvcLgsz8ILqq85t0izZeImrabm4jss8/y427SNeG6uY7Is00G20mKq75NdBiVmEFC9ICro0Xp6EI0R4cESdvJo9EffVAjWw/hghq3ld+dFQVRZq5BO4O4tXcDL6Io+M2WUGhv6TyutMkmatOiWVtvXhT7RmQ3sZ7X47lDmJYoO1zBxTzwWT9b5LlDoHg1EWbhVLXGdBnHAcyyYBPEV8mT4RCwJTfzyrX2tGS6ARy5VZcwN8rPhUPmZw2lonVwTyxiEYMLspL9Xy3Ipc9g3gWXgnKBPrf9Zt1TG2JLkSWq3uXNNvjsCfcEQKUcculp3ud52+zbesLyn//GSlP6s4nHcfMzhNMFrRRd/mxiBB+fjzyLqNr7imvwZf+SjD/HcOOOuoVH0Obu7HV9TUKuwxuZz4RxSOozl6LES8QU2crdFB+xrOQAAAG+J816JPic01acVmaVHVRVczrmiwypc8ddqNq/ub8hSWr9X4QLKmwITn0A501dCH5XxIceShtAK7qv3Q/ssnRImfygyxXUjfCCiOx4QDtfTvdfgu8s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(64100799003)(40470700004)(36840700001)(46966006)(1076003)(921005)(2906002)(7416002)(4326008)(8676002)(8936002)(5660300002)(54906003)(41300700001)(40460700003)(70586007)(70206006)(2616005)(110136005)(36860700001)(40480700001)(316002)(26005)(36756003)(16526019)(82740400003)(7696005)(81166007)(86362001)(83380400001)(356005)(426003)(478600001)(336012)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:00:22.8235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec35701c-78d4-4a50-4e03-08dbc990dd57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5626
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
index 51c0e17f7720..88ee3c705913 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -150,6 +150,21 @@ struct smu_pmf_metrics {
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
@@ -596,4 +611,7 @@ extern const struct attribute_group cnqf_feature_attribute_group;
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
 int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
+
+/* Smart PC - TA interfaces */
+void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
new file mode 100644
index 000000000000..91a7f1da911c
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
+	/* Get the avg and max C0 residency of all the cores */
+	max = dev->m_table.avg_core_c0residency[0];
+	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
+		avg += dev->m_table.avg_core_c0residency[i];
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
+static int amd_pmf_get_battery_prop(enum power_supply_property prop)
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
+	val = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_PRESENT);
+	if (val != 1)
+		return -EINVAL;
+
+	in->ev_info.bat_percentage = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_CAPACITY);
+	/* all values in mWh metrics */
+	in->ev_info.bat_design = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN) /
+		MILLIWATT_PER_WATT;
+	in->ev_info.full_charge_capacity = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL) /
+		MILLIWATT_PER_WATT;
+	in->ev_info.drain_rate = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_POWER_NOW) /
+		MILLIWATT_PER_WATT;
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
index 38f02676261d..277103e4346d 100644
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
 	ta_sm = dev->shbuf;
 	out = &ta_sm->pmf_output.policy_apply_table;
+	in = &ta_sm->pmf_input.enact_table;
 
 	memset(ta_sm, 0, sizeof(*ta_sm));
 	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
 	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
 
+	amd_pmf_populate_ta_inputs(dev, in);
 	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES, &arg, param);
 
 	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
-- 
2.25.1

