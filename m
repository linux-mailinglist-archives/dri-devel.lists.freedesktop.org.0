Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76D97AB84B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB71B10E6EA;
	Fri, 22 Sep 2023 17:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2070.outbound.protection.outlook.com [40.107.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD8C10E6E0;
 Fri, 22 Sep 2023 17:52:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCuN48GV80aC5RDa3+CJJ4lbrwXo5xjN4YGkS+YY5iuBDDBXCj5CIfoOvLawNQO/9LVwkKFpE7szDGnFBMWchjVTGdPxNRtvZcO76BrOQJEtaM1zi6nYGxkLPuNrQJb5821Fz2TMrTSmknrsSSzM1VWnHkAoKtx3VcQXtf0fFqUsygQF9sMMan9VKgnMhHJE/cklm9Sd2pnIXzhEQEAYgwMINwcUHckgiOTXk/q6wzPLrktfLwCy4Rug+qp91kVxMLXEwUrbp8Q5BIaBxc/U2hi/78b31Cu9okORvB/hyb9CRQuzpdgDbML5uZeR3Vxi3DFhuTMK2riqCxXEpU5VIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFRMKDsCi0+gO8oX5eF9s6N3hhDHuRhCTx9gMYHVFmY=;
 b=SNVxcgtN5m/moQFBYqfVu2HRh2FN0NsP1FxtTfTyHA9DDFBLviWhfRWNFXRHsyvUySdaahK5zFnJuz044l+w5emTu0GbkGUJtUiAniGf/cw2OXWl7TEK0BoPP3umxZARAc4I7jDA+DThw3294O0oGmLEkXWhGP5Cx2wWCM10D5pwJoxR+oSPGu56J2LS6xrUbRCTJXufME1AssNclTNDUyx8FWSvmY+QISvV8fJbd7YE9MANgOutThQ4+m+KdELiZQnIWS3GOUs1Hm5yGCSmbNBHq8nfP7KSujsTgQOR5JupAtLek6uIYijOaDMT6uneitWAEPn5QvCjguCHsRUp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFRMKDsCi0+gO8oX5eF9s6N3hhDHuRhCTx9gMYHVFmY=;
 b=UrMvIRK8oBrG/UB65J7aVROl6qsaLAMJQRHYmbkCRb2t+k+4YDEKuKBkSmoi+1KXVPqsDYFZkFdWJwZOLZOlvYsjmM3KdtkjuIDmuh4NyEcs+KFj3+HRqjZ0HbzL5ccatUmljEN99XJailmRZ069KH6x7RVf094QZQxShCdClDY=
Received: from BL1PR13CA0183.namprd13.prod.outlook.com (2603:10b6:208:2be::8)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 17:52:26 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::ce) by BL1PR13CA0183.outlook.office365.com
 (2603:10b6:208:2be::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.12 via Frontend
 Transport; Fri, 22 Sep 2023 17:52:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 22 Sep 2023 17:52:26 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:52:21 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
 <benjamin.tissoires@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH 09/15] platform/x86/amd/pmf: Add facility to dump TA inputs
Date: Fri, 22 Sep 2023 23:20:50 +0530
Message-ID: <20230922175056.244940-10-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|MN2PR12MB4424:EE_
X-MS-Office365-Filtering-Correlation-Id: 89166e51-c5df-4be9-f378-08dbbb94aee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hfna38sXuxzlEW8QXr41rfzCwpyo0fWhhkw3/jE00uiamp7LiZFHcJT45AecdfXj2Ennsiv/+6jeHoRIg7Lgk6a+5zVeJEw58bnB9aPqbW4gIcmQa3s+F2GRqH18pY07Swr/rbFg3XBgTyFgonkhvAa7WrIwKctMUd/t3JLXqwIKNL6Q5VO7lQg5xvjPzbDlxWIih0TtiRrbLjB6Anr5qanGOXhKHrOTglUi7xN5NhZa6dId0//4bnbktuaNDzlOYh91QSFwaxcV52VHU5WZjKlMKZMIzqPLnJRXbkfUmzeXlZgBLJv9KPQ5HUbaWzxIVndodlHzVlAGsEFfP5FlJDaVVC2P40JGdwHM2J+jocamBzbEIM7ndkAk5sj1E/F0ey3bJsw4OfubyCSRlrc1j73J4sQSsehYt7U9m7erHuGJu3SmQJA3cn0XGoTF4PgQ9EAXzss7/ZePlkp8yTRlrzCEWTHz7oM+ch7Sqbi1e/sSHT9mOf6xj+EuIBRAsz+Nw1TXWpfs+d7ZqhBoxn8RPesPK282NK0WUlSsbStBGEYZe4L8AWYAMidj2kHBtuQQBFjoKrW7vupPW5toUejSIGGWPAYvVVQ9IOLdl1mW4WGiZk8YjS+RhvzuNEVAo4hkG7B6s9CwYtvhOlM7K4iSiXYdq/dxbotIeVlp9Ad4f3BZdbkMGoEvfRhOG+Cog2JS/t2ewsLGRjhwbKyXPthdEA0MONMZ44KoQGamOoJg5vo51xma77hOx1kbcq+uEpqeOfdxjBJIGeNEwrIuLVALscuQfsw24S2atgB6KATRtm/TTPZgm3+rWctYQwF6X6LczFcW4zHA7Yr2rdpzJt1exw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199024)(186009)(1800799009)(230921699003)(82310400011)(46966006)(40470700004)(36840700001)(83380400001)(6666004)(7696005)(478600001)(36756003)(921005)(40460700003)(86362001)(81166007)(40480700001)(356005)(82740400003)(47076005)(36860700001)(426003)(336012)(2906002)(7416002)(1076003)(2616005)(26005)(41300700001)(4326008)(8676002)(5660300002)(110136005)(316002)(54906003)(70206006)(70586007)(16526019)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:52:26.5172 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89166e51-c5df-4be9-f378-08dbbb94aee7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424
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

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  3 +++
 drivers/platform/x86/amd/pmf/spc.c    | 37 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c    |  2 +-
 drivers/platform/x86/amd/pmf/tee-if.c |  1 +
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index c5334f1177a4..61a0f3225b62 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -592,6 +592,7 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 bool is_pprof_balanced(struct amd_pmf_dev *pmf);
 int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
 
+const char *source_as_str(unsigned int state);
 
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
@@ -622,4 +623,6 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
 
 /* Smart PC - TA interfaces */
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 08159cd5f853..5c6745f56ed1 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -13,6 +13,43 @@
 #include <linux/power_supply.h>
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
+	dev_dbg(dev->dev, "Power Source : %s\n", source_as_str(in->ev_info.power_source));
+	dev_dbg(dev->dev, "Battery Percentage : %d\n", in->ev_info.bat_percentage);
+	dev_dbg(dev->dev, "Designed Battery Capacity : %d\n", in->ev_info.bat_design);
+	dev_dbg(dev->dev, "Fully Charged Capacity : %d\n", in->ev_info.full_charge_capacity);
+	dev_dbg(dev->dev, "Drain Rate : %d\n", in->ev_info.drain_rate);
+	dev_dbg(dev->dev, "Socket Power : %d\n", in->ev_info.socket_power);
+	dev_dbg(dev->dev, "Skin Temperature : %d\n", in->ev_info.skin_temperature);
+	dev_dbg(dev->dev, "Avg C0 Residency : %d\n", in->ev_info.avg_c0residency);
+	dev_dbg(dev->dev, "Max C0 Residency : %d\n", in->ev_info.max_c0residency);
+	dev_dbg(dev->dev, "GFX Busy : %d\n", in->ev_info.gfx_busy);
+	dev_dbg(dev->dev, "Connected Display Count : %d\n", in->ev_info.monitor_count);
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
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index a70e67749be3..13e36b52dfe8 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -27,7 +27,7 @@ static const char *slider_as_str(unsigned int state)
 	}
 }
 
-static const char *source_as_str(unsigned int state)
+const char *source_as_str(unsigned int state)
 {
 	switch (state) {
 	case POWER_SOURCE_AC:
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 1629856c20b4..4844782d93c7 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -186,6 +186,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 	}
 
 	if (ta_sm->pmf_result == TA_PMF_TYPE__SUCCESS && out->actions_count) {
+		amd_pmf_dump_ta_inputs(dev, in);
 		dev_dbg(dev->dev, "action count:%d result:%x\n", out->actions_count,
 			ta_sm->pmf_result);
 		amd_pmf_apply_policies(dev, out);
-- 
2.25.1

