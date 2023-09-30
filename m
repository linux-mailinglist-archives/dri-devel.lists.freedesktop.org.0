Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C01FF7B3F5D
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABB910E1D2;
	Sat, 30 Sep 2023 08:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA1710E1D0;
 Sat, 30 Sep 2023 08:39:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVSid6SxFxThYn9CdorKMhVgyWHyMNAQdN92pInGxer38Kc2unJ/88KgXeehQg/d5rFxd04JC8X+dTRNo2rbqJ4n/BKlsQZ+uYO7YuitE6Jona62WP6alZbg3VzdM+Wi2HcM6Q+dVa6jR/krOCyu4h29GHkhWERCuuseVacjCbjNOkaxiPw88WCoxfYsMehdGz0rw3crAuKHQENSrhUqbwhe4aAWt9JJ7Dwa4Mdcy24lIzXSmoI8iX3RKezMKEwIEUzgcDGvHFcY0YQxa7FE/jNCGSwTHr0h24Gz+3X1NsZb4jKXn5NgaeDcIepzgueH2nlfrLqOAKL108GFzITa+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Uta5TUsJdI6QyGMlOLV58HXi0zHWzSpkx2drtgPLRY=;
 b=fdWhFrVRqmjZJi3guY16mghxF7bKgRilu5rLNioVyPounreFE2PvoJP/cEI/Ig9xnZscFhzSEATyAMj6w+m0uJjfoCNB6RqHq+a/IYFFfzPd71iby4/PIi05u7HlB6geWbVkwsxGx+Ro+0m2WHai/P09s7IHyDBd+B7ueJN3x16j7TC+LIcktjmlXa/V7vxCBi/O5g3i2DOsJ77KwRk6pDbv+Xjy9FYlFZyRMz3w07i8rFxM+VK/rY//LqsGH9IUDaXk9yX92+cHwrxQynPY7d+Yksc89ugroK8+vuuQPbhMQvTCgmHuZ4Of6rfKY1+nzt3wRdC7up1j7DPQupGr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Uta5TUsJdI6QyGMlOLV58HXi0zHWzSpkx2drtgPLRY=;
 b=bp3pQVdIaZxVLFtUT6WgEu0EXc7R4/1rZFYFeMZ22KA1ns/8Azf2D13/vpw1kP0Wydip0eg6gIcD/cjFJwEiYauf7kcuTzzFKBDZYKIB9bABhdHGbr8oygWhJsmuUE16XQLTRL5f9ivJzyEJPNkOBinTo8pDJg/nFbb/s/BppZI=
Received: from MN2PR04CA0005.namprd04.prod.outlook.com (2603:10b6:208:d4::18)
 by MW3PR12MB4507.namprd12.prod.outlook.com (2603:10b6:303:2c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Sat, 30 Sep
 2023 08:39:11 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:d4:cafe::55) by MN2PR04CA0005.outlook.office365.com
 (2603:10b6:208:d4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28 via Frontend
 Transport; Sat, 30 Sep 2023 08:39:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:39:10 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:39:04 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 09/16] platform/x86/amd/pmf: Add facility to dump TA inputs
Date: Sat, 30 Sep 2023 14:07:08 +0530
Message-ID: <20230930083715.2050863-10-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|MW3PR12MB4507:EE_
X-MS-Office365-Filtering-Correlation-Id: ded81c90-dc3d-4eae-2b73-08dbc190b7c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2SAzQ238q7ymVOeS8vvlL0ghuIJyRa5A3Es4MKFu3rvo4JJoi+BkC3z5BOdNaGm/SPC0I695mYH1wMgXwBHYv30WmTa6iYkZLqtnJhjbkiFnJ1G6rM95e6BPE6Cvq1VZJTDAZsvkaX5rBfQLPDELXLy1arWRBNnE3loMv1itvIDFOhahwlSZt08NzjbRiozBk4C/IbdABrOPmVpWwhnLK3sEFHkh7W7JaHOqjb/WhHF4NNbIlSFTW8JeJVOgbrrNsmHNtWuzl6crgZO6jUAC7FOHGuUnX5rDNx9OddHhT85Qssbp6bcx07arMIWwvpV0D2JUYorhSEnvcfvxgRh4U0ivBqTgR6/8HuXcLm2wXp08zPm9PFGv4AbuDcnK6GSt9Oy0UpOJ7pVJVNWV+u/ko9btn56JicnKx2HzbgfNB/atepbqZctXzER0talNbpuDh5k2kVotMa9zH8edsbBZVhzGTX/8kmQWXkB/XzchU+Qt2VroRZUB98yC1i5GWF7zYyRJAZCicV1kxQS6aSh7LMoXkfN6Ql6W8hPZ7IVZKXhWY9lkfKO0isThct9I2xtIWaRa9gdohtfYvjViaJVxAVA09FdaZO+XYuNpaWF7khukbf4u3VamnSrLboMK+DbkNCz4hJbBKRTv+GwJ4qxqNGRHTNF71Qc0Q0eRMk06OQgbh5f9oNe+dJRSSfkJKxpobP6BKqXHSTqFg0ErkDm/Zbc7acuKT2EGw721lEU5BuThs9w/k11HMDfP7BzQBpBhZVhkhV+mOmIWBEcM5J+Q76wqjlrgy6ye6UJDKTuA+Ow=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(82310400011)(1800799009)(186009)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(40460700003)(7696005)(83380400001)(82740400003)(81166007)(921005)(356005)(86362001)(36860700001)(47076005)(36756003)(1076003)(26005)(2616005)(40480700001)(16526019)(426003)(336012)(316002)(54906003)(41300700001)(7416002)(110136005)(70206006)(70586007)(2906002)(5660300002)(8676002)(8936002)(4326008)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:39:10.4929 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ded81c90-dc3d-4eae-2b73-08dbc190b7c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4507
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
index 34778192432e..2ad5ece47601 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -595,6 +595,7 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 bool is_pprof_balanced(struct amd_pmf_dev *pmf);
 int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
 
+const char *source_as_str(unsigned int state);
 
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
@@ -625,4 +626,6 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
 
 /* Smart PC - TA interfaces */
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 3113bde051d9..3aee78629cce 100644
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
+	dev_dbg(dev->dev, "Power Source : %s\n", source_as_str(in->ev_info.power_source));
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
index 961011530c1b..b0711b2f8c8f 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -187,6 +187,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 	}
 
 	if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS && out->actions_count) {
+		amd_pmf_dump_ta_inputs(dev, in);
 		dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
 			ta_sm->pmf_result);
 		amd_pmf_apply_policies(dev, out);
-- 
2.25.1

