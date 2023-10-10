Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE0A7BFC40
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322A110E356;
	Tue, 10 Oct 2023 13:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2082.outbound.protection.outlook.com [40.107.212.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0610310E356;
 Tue, 10 Oct 2023 13:00:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndYx1q4LrFcW4vQTo5bXnbmaIsUFlwGBpUTPqHURiD9zY/jcxVV9QOS06yk8GLP7E20/XpenMo7tlfIIPg3FPlW2Y7Mxlw1b8rDUv2I36iPkgyoOtUWmijHWTjdSgG0Oj8WH0LIn9X8f3i+A7LAoPOrZcVNmVawkG/ZRP9etrRQ0GG6hDZIv/bYyMS7c+JZg5BI22/d6zu6Zoys231BOC9gutpD88TNNOQw0t3NXJDB8bJmrG7QNl5+zFFaQUQ8bbQAUYxHsUOM+w09EZkL9hl2NomHQcsTjQoDO+akIbtgPGNalMjviX26w9uoIEcwO7va3d1zDQ/30YnjDzOKWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVlGmf58q+ROJ9lsVAiILMM/1+LGjCsaimzOXOdAreE=;
 b=Dy0+MXvwuVaGoGm/dyZEFRDfKNUIRXFCfNmDIMuqs7k8oEIaOchLozAd7MMgOxHXOHiRZIbTnvJuFeZcrtvNxrj8Xu70+rJJFUdDg/HBRp87+TseG9zDIuvxwpnALpXf3v09h7125zkgtC7GDmOfyy0H+Q3kn77T3o2LA30UsRgv/4bRfLcuQF0u5PaMbFLw9/q/+1ObkJuldEAas30+Cg+0faAd9f/x1LI1B+7PyspFJEa3B7n1Nq1poAqvhBKfsqJV4mkUJKGDNO7iU0UWB8MrIB5FnEHazTAhvkWnCITseNkXXZPWVBuRo4yFLkkZU5tjdRGYPjX/WPf6M1413A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVlGmf58q+ROJ9lsVAiILMM/1+LGjCsaimzOXOdAreE=;
 b=WuZ5XeBcA6QpFrIcUPBh7s1/2sbMcRQBc5Rmox+xK8ySgdtrNaShy0Yi/bq8qJGdoyGp/1jh0CJanzc1rhxiB91mnRepnQRdXZJCwRvcRTuHGW9BQEt0PvTZtkcVBL3UZ1KOFq+0hknwb2xwhC5eb9CmQDFrKSLe/GOcmTNCoYw=
Received: from DM6PR04CA0003.namprd04.prod.outlook.com (2603:10b6:5:334::8) by
 PH7PR12MB5998.namprd12.prod.outlook.com (2603:10b6:510:1da::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.37; Tue, 10 Oct 2023 13:00:37 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::73) by DM6PR04CA0003.outlook.office365.com
 (2603:10b6:5:334::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.25 via Frontend
 Transport; Tue, 10 Oct 2023 13:00:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 13:00:37 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 08:00:32 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 09/16] platform/x86/amd/pmf: Add facility to dump TA inputs
Date: Tue, 10 Oct 2023 18:29:10 +0530
Message-ID: <20231010125917.138225-10-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|PH7PR12MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c1be4a-93d6-4858-fdbb-08dbc990e624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I1N8Q+9Q+ienC2Mva2VW2+AhCdwbsSw0zHuRd7+orBviDDrQCq2vvCsbUYJuIrPtykkT9a2YpIwVNShrgxT9aGtw1izxbzZ8OZqh/Mgv/0+sbv2fS0EBwrABelqB4AAvR8flcuQjxMXBJKStDqlkWiXq9j9OGDCDeg66XgkHcAcT31i6SFMqrE0fwqhJS3U9EOYPjWZgmI0GQtQuePeMGNFAEA9l1sqAiekWbrFjgz9btpLA2WD7PlZjTPkRsULbaB37bluNaCrdolcvrP/8FV4HKGbqiTZmckN82okoo2uX5xjdTlOif8K7tgl4mBrMRlEN8sQ2sL25C25TzdrX59ICNR6vG66nBRS2+bYBPsdwPqQvKPPdX8QNLeKzq/K/By6RaQPfa0pJnyJeKBd1uGW080WkBK0oOu+V0mYUkMZfPAZvPouzTtFg+31BVHhDYSS5EW1Fyn2DVKayH//ZwdgWxTbM8K/t7hOSgRhGcv0lbfNcMoSjKszFg39bgzVabULTmt5ZhGwVXvX4QNtgQVnvi9iSSnBMJeVh05WgaaNKeumkoT97S3RPt19F9+4Wupn0a/ITfnMT3uzohqW2MpC6wpx0czrSluDzpIKgZ4MhXiTaCl00pBsEh/Y4tM3Fa111bDOeXTJif7j7d9k1QPvFe0+xjbp7ONYUP6M1Pk1byd3O0kEAvgehiyIUTVBiX7Vgi3ks2a657Gd8PXoIMInXmo0XuOqCEHu44twBJkLnPcYRkUtGSwnrwkzGQoVAyo0RqKRBKLgIQ5T2VYKjy33Df3FRN2tMyOp0ifJrA0k=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(64100799003)(36840700001)(40470700004)(46966006)(82740400003)(2616005)(7696005)(1076003)(478600001)(316002)(41300700001)(336012)(83380400001)(47076005)(426003)(7416002)(2906002)(70586007)(110136005)(5660300002)(54906003)(8936002)(70206006)(8676002)(4326008)(16526019)(26005)(40460700003)(921005)(36860700001)(356005)(36756003)(40480700001)(81166007)(86362001)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:00:37.5933 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c1be4a-93d6-4858-fdbb-08dbc990e624
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5998
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
 drivers/platform/x86/amd/pmf/sps.c    |  2 +-
 drivers/platform/x86/amd/pmf/tee-if.c |  1 +
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 67f11113d5a7..3d98d9bea96b 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -596,6 +596,7 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 bool is_pprof_balanced(struct amd_pmf_dev *pmf);
 int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
 
+const char *amd_pmf_source_as_str(unsigned int state);
 
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
@@ -626,4 +627,6 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
 
 /* Smart PC - TA interfaces */
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 91a7f1da911c..5cb70f183825 100644
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
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index a70e67749be3..781fde00e0e7 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -27,7 +27,7 @@ static const char *slider_as_str(unsigned int state)
 	}
 }
 
-static const char *source_as_str(unsigned int state)
+const char *amd_pmf_source_as_str(unsigned int state)
 {
 	switch (state) {
 	case POWER_SOURCE_AC:
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index c08ef13a1494..80252309575b 100644
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

