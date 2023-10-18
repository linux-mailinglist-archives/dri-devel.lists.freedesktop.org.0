Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C4C7CD511
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F9210E3A0;
	Wed, 18 Oct 2023 07:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5878610E3A0;
 Wed, 18 Oct 2023 07:05:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gjaqjldn9/uSOgs538U0hdnLk5mmN4Os3eCBal8iBfj4LbKPhUTzu8RmSAazzERJHPkaMhjIL/ozj58Cc6m9DJWVK+cLjZiLKI7sQGPctOPIP4L5U/bGpias7ZS4Oqr5aR16zY45UiMMrHhh5cmHhpoPrQE2sMT6uaJMGzdD5yLpSSQXo7rnHZqUD1m+YLx3bpzRQ6dmbFrqxnmMROyezXc+rJdUBVkSjSTnAkNEgpq3acSAgL1ppWA9g57nyNoOz6bqSfqGZ7hQaWQ1y71aeK214Ut/YpH5NKZwimUuShTLYO2tZO7qbe+MHrf0D1+NtJXccj0wu7xnl8+3zhBN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBjDfLPTF3L4Dn4BsPvY1/IBlCDqHdYjqYkYqwm+TLY=;
 b=UYbi80V4dtIkl9PhgOSHLBn3kaeWLmyYoxOUH+5JxiI7jgabY6O6YUk+8ggk1E7QJDH9Jl0HaSitcFwv176bjycTbQAwactZnOPh7OkldeZxI02eDddUH6FQo8HjMk34PxQGZeX8eybScqaO3veb774s0fbe3oVXLV4UHMPNzN+v8aKe2T5/osVG3XkCDnxI1byOS7FUCE9xnmI+dAIOd7R1AP60FbQhCDGGekYJSw9PJNNqQw1f8NUS5Xlc/OMHvAXort9OCI/cMGwdMd7HD3iPQNjf4LC478YvT9oK/TJJosaVwWMX1Kbmyi9z6VlTngIhFt/ANHtciqE6onoYqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBjDfLPTF3L4Dn4BsPvY1/IBlCDqHdYjqYkYqwm+TLY=;
 b=G/wzIbbnOis9BAg2u9s7MNPGh6rZSdxWUuvaBsIGh5yE0SbrQ10Y2QfLwTVHhLm9TEz/3G9f53ZLf7KUkAH9c1Dp/NW0/zqFmREi5scQslOzIto4DZDLPbtS/bwOiIjaW4JDbYDaFQATOiXbGl6Jc6NQi46J3nEnCazef3pejiE=
Received: from DS7PR03CA0279.namprd03.prod.outlook.com (2603:10b6:5:3ad::14)
 by PH7PR12MB9067.namprd12.prod.outlook.com (2603:10b6:510:1f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Wed, 18 Oct
 2023 07:05:19 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:3ad:cafe::8a) by DS7PR03CA0279.outlook.office365.com
 (2603:10b6:5:3ad::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Wed, 18 Oct 2023 07:05:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 07:05:18 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 02:05:13 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 10/17] platform/x86/amd/pmf: Add facility to dump TA inputs
Date: Wed, 18 Oct 2023 12:32:34 +0530
Message-ID: <20231018070241.2041529-11-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|PH7PR12MB9067:EE_
X-MS-Office365-Filtering-Correlation-Id: da849d8e-ebab-44a8-b721-08dbcfa89699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xsmZGsHI5M5NJeDW69HhQDGBDemtjuOJlbemDosKJGLguO3G9ojgkSxFt1BGiK0OLHEs1SGKSiKkXULoZn4N0SyAWO8ECn22Ttkba8xNQoEbHSJ2/RbKOyVpUBHyPcXDi54VzhjUi20u9ZSZI03a/+2Tf6LyGuQoJeQugBqWl2sBLipcN0H7RypvSTjZQTCwgm9Ii5c60Rg1wz4uq59ACum4+yuCpK8ds5yL97GtyopFgTdSitqC54LpyJ9AxU9tIDhnDsbfrC+opYv5KyO16ecamvo9lzAeLAfTrbD98MwDwQDIqANukBn8M2/2Jl5JiQlDRiLr0GICqP49krcJh3OLbgKxrF4C7IuDGFX5TBv+8GJBrESQQHBHEcRMsOYhr+EaXVV6V42fuj8tIgU1NYcbxpWXPwsJ4aa2JOnwMxlT3WiO4YOd1dG6hUsMtUj6X7yIzFRBHY8pcZmQPPxg/c8nK9n48/vR+GvE0Ke2ac7px5M+9Y5GosUk3jyQRfgRg2y3pBoTP+Y0+3zF4rwnmdUBJHxqN1SkJGbt8c3ft/GSp09ob86vDe4h98eoa58dhy2CJJAT5ybTMMQTq3FRTpeIi0BSPwNrpCtLBL0fSS7317WzntRHQ0uUY57mlqnfbnV0xCan1h7DOHberfCQU8TT9Ppanaq0iyQfGEU1YTsbhPgNqey5x6ZluD9EAMvGMYEcX2g3xitDB0rvE2vyPTB1YufMe3JBqDRWgTjMCHWbe7xObZuhIxodDxJJyiftxNcWkmtHoG+Yh7uwDDQB+0jK27NvmjrBAv4E3LZotQg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(82310400011)(1800799009)(186009)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(40480700001)(36756003)(86362001)(40460700003)(26005)(110136005)(316002)(70206006)(70586007)(36860700001)(356005)(81166007)(921005)(82740400003)(54906003)(47076005)(336012)(83380400001)(7696005)(6666004)(1076003)(16526019)(2616005)(426003)(8936002)(478600001)(41300700001)(5660300002)(4326008)(8676002)(2906002)(7416002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:05:18.8981 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da849d8e-ebab-44a8-b721-08dbcfa89699
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9067
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

PMF driver sends constant inputs to TA which its gets via the other
subsystems in the kernel. To debug certain TA issues knowing what inputs
being sent to TA becomes critical. Add debug facility to the driver which
can isolate Smart PC and TA related issues.

Also, make source_as_str() as non-static function as this helper is
required outside of sps.c file.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  3 +++
 drivers/platform/x86/amd/pmf/spc.c    | 37 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/tee-if.c |  1 +
 3 files changed, 41 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 216a9f795436..593930519039 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -602,6 +602,7 @@ bool is_pprof_balanced(struct amd_pmf_dev *pmf);
 int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
 const char *amd_pmf_source_as_str(unsigned int state);
 
+const char *amd_pmf_source_as_str(unsigned int state);
 
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
@@ -632,4 +633,6 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
 
 /* Smart PC - TA interfaces */
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index bd5061fdfdbe..512e0c66efdc 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -14,6 +14,43 @@
 #include <linux/units.h>
 #include "pmf.h"
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+static const char *ta_slider_as_str(unsigned int state)
+{
+	switch (state) {
+	case TA_BEST_PERFORMANCE:
+		return "PERFORMANCE";
+	case TA_BETTER_PERFORMANCE:
+		return "BALANCED";
+	case TA_BEST_BATTERY:
+		return "POWER_SAVER";
+	default:
+		return "Unknown TA Slider State";
+	}
+}
+
+void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	dev_dbg(dev->dev, "==== TA inputs START ====\n");
+	dev_dbg(dev->dev, "Slider State : %s\n", ta_slider_as_str(in->ev_info.power_slider));
+	dev_dbg(dev->dev, "Power Source : %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
+	dev_dbg(dev->dev, "Battery Percentage : %u\n", in->ev_info.bat_percentage);
+	dev_dbg(dev->dev, "Designed Battery Capacity : %u\n", in->ev_info.bat_design);
+	dev_dbg(dev->dev, "Fully Charged Capacity : %u\n", in->ev_info.full_charge_capacity);
+	dev_dbg(dev->dev, "Drain Rate : %d\n", in->ev_info.drain_rate);
+	dev_dbg(dev->dev, "Socket Power : %u\n", in->ev_info.socket_power);
+	dev_dbg(dev->dev, "Skin Temperature : %u\n", in->ev_info.skin_temperature);
+	dev_dbg(dev->dev, "Avg C0 Residency : %u\n", in->ev_info.avg_c0residency);
+	dev_dbg(dev->dev, "Max C0 Residency : %u\n", in->ev_info.max_c0residency);
+	dev_dbg(dev->dev, "GFX Busy : %u\n", in->ev_info.gfx_busy);
+	dev_dbg(dev->dev, "Connected Display Count : %u\n", in->ev_info.monitor_count);
+	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
+	dev_dbg(dev->dev, "==== TA inputs END ====\n");
+}
+#else
+void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
+#endif
+
 static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	u16 max, avg = 0;
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index d48f980fb1db..0eba258f4040 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -182,6 +182,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 	}
 
 	if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS && out->actions_count) {
+		amd_pmf_dump_ta_inputs(dev, in);
 		dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
 			ta_sm->pmf_result);
 		amd_pmf_apply_policies(dev, out);
-- 
2.25.1

