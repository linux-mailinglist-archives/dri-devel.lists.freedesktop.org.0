Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC16B7B3F41
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AF410E12E;
	Sat, 30 Sep 2023 08:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7080210E129;
 Sat, 30 Sep 2023 08:38:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LC0IQF45kD2+8gSUvXpx9WSr8J0j8wO9UYEi/vCObsQvKurL+n3XjjCcfjMn56qCoad/w5u2cYLYFn2HJEomB1dyoprrQk4S5brxjfL9KctYhiuEmP+qqE8tQiHDwSR3kcNeHoiyN/MgLg0hpmcYqwSqx5hVUmcwQg+N8jWx0wlbth4C9MYLRKldqhNYYhFIOYxq+Mkhs9LLykCo2cHKFc2W/FBratJZe++8kL517UK2Dks58GDr0O2XVf1N5RqQR81DSTvfDZu8gx+/925Dv4HudOGdbrkNnb4cN0rc+dd9LVJfSwtr2r+L7gFhecWrk8LS1WKKY1vCez3R4ztfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXZ9nu8zgiI8fl1PVckWCMbLtSVwz8sApT+QImD2RRw=;
 b=kTiyt7IfEYgilqdtXkzooJB60JjBrGG6I7jPBptapo0SpQISqyzmwcTCm700YOVQ68cZnfNJstS41hW3swSrTGs4QisGWBU7xG2FUM2K1Lo/ds+sAo4XPm62fAK0QWSqaUzhHJod3deUm/asg0/WSvfNS6B6ZBZdnx0E9RxzJyKrWvMi7iUayDZJ/tWM7bTNKcWClJvoJNQ96UtigTX2Cc0Bc45QcKP0MraN96hw1k/RmTso5bnudHRLW4ZgzUJKX34GoTZAW8JBcL5DNtwDRkzRJvKdaokhIEp7ClKHlRV0gZxd1SuZcsotTCZnkDJegVFfX3kXC2pBper3om5Nuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXZ9nu8zgiI8fl1PVckWCMbLtSVwz8sApT+QImD2RRw=;
 b=RHt6F8H9t9yBsntip9OssB3NTHYBK4bl87N3SjJ9Jfw0VbQCobL59FTeYb65Hc2wJQ5lmGtO4bpDpik070uWaptlROhSfZgiiJgUdYGl5QDlwjC2pJt2j9fvtWRZ8/cuiMUVtN7MEU5vwHcPFmW8XdQchWtQ+t/YiXRJuZhr5CE=
Received: from MN2PR14CA0010.namprd14.prod.outlook.com (2603:10b6:208:23e::15)
 by CY5PR12MB6058.namprd12.prod.outlook.com (2603:10b6:930:2d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Sat, 30 Sep
 2023 08:38:24 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::4) by MN2PR14CA0010.outlook.office365.com
 (2603:10b6:208:23e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28 via Frontend
 Transport; Sat, 30 Sep 2023 08:38:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:38:24 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:38:19 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 02/16] platform/x86/amd/pmf: Add support PMF-TA interaction
Date: Sat, 30 Sep 2023 14:07:01 +0530
Message-ID: <20230930083715.2050863-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|CY5PR12MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: eb861e27-769a-4e69-b218-08dbc1909c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C125aaqOmUBFhBqcUF8MLCPiE9Lqe2PvVbc0WUwR9/ZsTDQBI3DEl0yZmUnRLeCppwesl8WpVkAFmyh5xDrIugr7RiNNU2IAzAM1E1ebqLbdXbocSe+j5fB+jDQjVybiZoWRV6kdwR/JPlaAFBKvLrPEbBMPHVUFJ/4N7pNoyD61f6d8tE8h1W4SLeKQuK618M89fKnVMQf50PEo57/An4B/lJj61EAT4yJLrjkfhUMJEzVgkUKksWO6IHzmgrcm5uArdXDYkVEvcMuy94MZtn5hmSAJcGU6bvE1T8J79GSwq5JLorgBhTHEilnOvPt/Yhf+UnNzvahVDBDZMq79di66hd9VaxtWozj3ldAze9o+NDbnJWUq5+G4jW5Kwj8U37X6kvetHIqJUA4MCq7kfg1LbZh0eHDkSVilUqIBEzsNZidWvveUO/j+tG6wnomuL3kXni0oEWnc3q2Hgcsk2KSwiUwN5h9WtY73/DV9Mopzd0Ox9Et61ro6q7Xofsi+kRRyigp2w7XJ+yKzfP/ZDo8TqGzNP1yOxvj7GHXsNigZMzfAkXzAQM0hcFzXTtZQeR0Tqa0+7MQ/t/8z2CG1VDaek6ZJyrQdqIdHwVOCtYp4qJi6bsDPCaCsJcHZSZ9uVbAiyDj1ykks1PBgCmwAFO15FjDdL1YEmciuRmW95RUD/znSTCtNE0A713awkIOgoLYS8SpRTraZEixqCnvpaxlH1fEIyr9kIfQSD7Alod5PIgQK2KECVLn787wYYMx6QCutd89AJOa7e/pYW0znj+heETcrqxbjhIYpequDI40=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799009)(36840700001)(46966006)(40470700004)(81166007)(86362001)(82740400003)(921005)(356005)(40460700003)(40480700001)(36756003)(478600001)(70206006)(54906003)(2616005)(7696005)(6666004)(7416002)(70586007)(8936002)(5660300002)(316002)(8676002)(4326008)(83380400001)(2906002)(41300700001)(47076005)(110136005)(16526019)(36860700001)(26005)(1076003)(336012)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:38:24.0772 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb861e27-769a-4e69-b218-08dbc1909c16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6058
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

PMF TA (Trusted Application) loads via the TEE environment into the
AMD ASP.

PMF-TA supports two commands:
1) Init: Initialize the TA with the PMF Smart PC policy binary and
start the policy engine. A policy is a combination of inputs and
outputs, where;
 - the inputs are the changing dynamics of the system like the user
   behaviour, system heuristics etc.
 - the outputs, which are the actions to be set on the system which
   lead to better power management and enhanced user experience.

PMF driver acts as a central manager in this case to supply the
inputs required to the TA (either by getting the information from
the other kernel subsystems or from userland)

2) Enact: Enact the output actions from the TA. The action could be
applying a new thermal limit to boost/throttle the power limits or
change system behavior.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    | 10 +++
 drivers/platform/x86/amd/pmf/tee-if.c | 97 ++++++++++++++++++++++++++-
 2 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 02460c2a31ea..e0837799f521 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -59,6 +59,9 @@
 #define ARG_NONE 0
 #define AVG_SAMPLE_SIZE 3
 
+/* TA macros */
+#define PMF_TA_IF_VERSION_MAJOR				1
+
 /* AMD PMF BIOS interfaces */
 struct apmf_verify_interface {
 	u16 size;
@@ -184,6 +187,7 @@ struct amd_pmf_dev {
 	struct tee_shm *fw_shm_pool;
 	u32 session_id;
 	void *shbuf;
+	struct delayed_work pb_work;
 	bool smart_pc_enabled;
 };
 
@@ -395,6 +399,12 @@ struct apmf_dyn_slider_output {
 	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
 } __packed;
 
+/* cmd ids for TA communication */
+enum ta_pmf_command {
+	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
+	TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES,
+};
+
 struct ta_pmf_shared_memory {
 	int command_id;
 	int resp_id;
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 4db80ca59a11..1b3985cd7c08 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -13,9 +13,96 @@
 #include "pmf.h"
 
 #define MAX_TEE_PARAM	4
+
+/* Policy binary actions sampling frequency (in ms) */
+static int pb_actions_ms = 1000;
+#ifdef CONFIG_AMD_PMF_DEBUG
+module_param(pb_actions_ms, int, 0644);
+MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (default = 1000ms)");
+#endif
+
 static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
 						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
 
+static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
+				 struct tee_ioctl_invoke_arg *arg,
+				 struct tee_param *param)
+{
+	memset(arg, 0, sizeof(*arg));
+	memset(param, 0, MAX_TEE_PARAM * sizeof(*param));
+
+	arg->func = cmd;
+	arg->session = dev->session_id;
+	arg->num_params = MAX_TEE_PARAM;
+
+	/* Fill invoke cmd params */
+	param[0].u.memref.size = sizeof(struct ta_pmf_shared_memory);
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
+	param[0].u.memref.shm = dev->fw_shm_pool;
+	param[0].u.memref.shm_offs = 0;
+}
+
+static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
+{
+	struct ta_pmf_shared_memory *ta_sm = NULL;
+	struct tee_param param[MAX_TEE_PARAM];
+	struct tee_ioctl_invoke_arg arg;
+	int ret = 0;
+
+	if (!dev->tee_ctx)
+		return -ENODEV;
+
+	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
+	memset(ta_sm, 0, sizeof(struct ta_pmf_shared_memory));
+	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
+	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
+
+	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES, &arg, param);
+
+	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(dev->dev, "TEE enact cmd failed. err: %x, ret:%x\n", arg.ret, ret);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
+{
+	struct ta_pmf_shared_memory *ta_sm = NULL;
+	struct tee_param param[MAX_TEE_PARAM];
+	struct tee_ioctl_invoke_arg arg;
+	int ret = 0;
+
+	if (!dev->tee_ctx) {
+		dev_err(dev->dev, "Failed to get TEE context\n");
+		return -ENODEV;
+	}
+
+	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
+	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE;
+	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
+
+	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE, &arg, param);
+
+	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(dev->dev, "Failed to invoke TEE init cmd. err: %x, ret:%x\n", arg.ret, ret);
+		return -EINVAL;
+	}
+
+	return ta_sm->pmf_result;
+}
+
+static void amd_pmf_invoke_cmd(struct work_struct *work)
+{
+	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, pb_work.work);
+
+	amd_pmf_invoke_cmd_enact(dev);
+	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
+}
+
 static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
 {
 	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
@@ -103,10 +190,18 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
 
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 {
-	return amd_pmf_tee_init(dev);
+	int ret;
+
+	ret = amd_pmf_tee_init(dev);
+	if (ret)
+		return ret;
+
+	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
+	return 0;
 }
 
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
 {
+	cancel_delayed_work_sync(&dev->pb_work);
 	amd_pmf_tee_deinit(dev);
 }
-- 
2.25.1

