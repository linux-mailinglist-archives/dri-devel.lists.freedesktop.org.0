Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 644B47BFC07
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1C210E347;
	Tue, 10 Oct 2023 12:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BE810E344;
 Tue, 10 Oct 2023 12:59:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwSmL1hAgDfc93hXiJNQ8h2iBo36oFtXVWsUIT1cIb/cjZptVEF+RlnivUW4+LkfM4cDxCiCpZlwtAqJ7lAZZOvDYvtKeL/bCZnbCcDzryzH7zFB66TvQR7LcqtKCOlKThNataZWCRWeF7q5mc3j3GGvzud7uD/zowNscDRI7xLi3dAgMzNPfIFoFmZbe3c+iIXd1ORfhP8WB56dOj92JPKvJnh16EikWVJ+FLzd4VS6dEQe3k1AF8mdJtR75mnHRUHGON1/AdIEiLOUHMnpldZP4tt7XEUBliPT4bqJk0hqxT1Pem1Glr/hLhUkB0Py0TPmbgXAwkKa3hC823FaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2RhWZy/Sk6jACnN+MkfCPhn9WxxfEwOSMCQBqvbusY=;
 b=XmdFffFOjb8eM3VoXtB0deRX7UW3yUDjCW8M6XKrAvv7k9N/suKR7+c/KBZp5BXQtrbvViI4cQ7kNHmeMwuFISs2rfx8+JvdD3IHLmw0MTucYRDVYTTUPd3ahLvPV0wasC9HC4/mv04omU1F34A66gkAfceB+aeQFPk3dP88zlhaQ+o7p61hBU2jk8GabLyqairUMhRKK2n+ZHl7k7TCNEWNMpCVWKSbZF/hr1Kcvm4IZc2CcCqKmq/g4o/4Gp95KoJZTJ4J3f0EgzeANtpciFP1DcpmL4PTh3d5eYmlBTpHWrRipzOMvfIIH9rovQTZGholmLcYoY68aZ0amHVgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2RhWZy/Sk6jACnN+MkfCPhn9WxxfEwOSMCQBqvbusY=;
 b=kZ7JRQvw5bqyFsEuUe3VLaRxej7gJ/DXndDu33MOkAt9SVPFPa83BNQvYd6oC/J/2Yuo0b/P3QjQORe2GT0kCl31MrPMqyHEmjprobsLteViA+KNeKygwf9fkamu42YYIkct0Z/9jChLjFpfth7Zr9NoaUWAdEBsGWPvDqy/i30=
Received: from CH2PR17CA0007.namprd17.prod.outlook.com (2603:10b6:610:53::17)
 by LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 12:59:52 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::49) by CH2PR17CA0007.outlook.office365.com
 (2603:10b6:610:53::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Tue, 10 Oct 2023 12:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 12:59:52 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 07:59:46 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 02/16] platform/x86/amd/pmf: Add support PMF-TA interaction
Date: Tue, 10 Oct 2023 18:29:03 +0530
Message-ID: <20231010125917.138225-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 5960722e-9473-4de7-2d92-08dbc990cb0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SrUpNbKK3INMUUVw8i2JZ7Xr7+4hJV5uJtSsh3B5sSh3CPdncSvoYgi33MY8lTsTMUiNZIIK0TefXqqM3yEuIOTDGpA5Xcpj+BrRge4yh/2fjLQf5kr9aPfxmxRJeJ4TsyE8Wtd+enOQdiHaSet9ugJhnIEVbU+Gzi4x3Jbq4jPsqC53LEpvyhtLyfSSTr3Q+U9OFa4ijz/hIyqPWtr9Jz1CWyt2m3qR5h/J6H9YXKmdVxaGJPc0SlKJs23S9uZxiWIKWp8Ce94fRArSmaxsxZpdH5Ov9FRHj45TgYvyPHYYYtydjqh6biNK0h4MA20xri7633pz8Gdv2iF1f1Fn0uhE8MuHS907lxck5z+SAQvsu8/fNXap9BKFXw+rJHSDG4KjvaaWnBOZmvyIJ38tplvXudtXfGlTq/ylHwh2UT22ZEkj9fAz3QD8mihTHKvpeoFdKkN2SAfZ2oMrjBWwsy8ZkRY8TYSix1oeF3Vkc4QHDTlIVmvq1bJO/Xxho59YjGx9rAqAEJ4H0Zo9aHJ5yJolOeOWyN/KBzNf0PqOCSp9g5yfVOJ1dibEI+1RvrQ9JOQDywA9Sym5b4978WHN0cMhPQ2JelCS1gXhd3uVLXS1QeeO3JHKkAbKhkDmCrks+m3Qft50ZDOs36vQlUogbgsV/20vdhQ5yvhruIp67csYIFWTQ5UvwIykBppOk/MmdVeCgxUQIPTVE67O56yrQYPnQYa/HhHqFWx0aKt9ucwOu9CZPashvHV+IWHcwFN2bF9XBESyQGnKxdg7sMiM2zsKiEIXFmzMbX1zqeTNtmw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(186009)(1800799009)(82310400011)(451199024)(64100799003)(36840700001)(40470700004)(46966006)(83380400001)(40460700003)(40480700001)(2616005)(426003)(336012)(1076003)(16526019)(26005)(110136005)(70206006)(70586007)(54906003)(7416002)(316002)(356005)(41300700001)(47076005)(5660300002)(921005)(82740400003)(8676002)(4326008)(8936002)(2906002)(81166007)(36756003)(7696005)(6666004)(86362001)(478600001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 12:59:52.1519 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5960722e-9473-4de7-2d92-08dbc990cb0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451
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
index bd40458937ba..4da5c4eb053c 100644
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
index 6ec8c3726624..4036f435f1e2 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -13,9 +13,96 @@
 #include "pmf.h"
 
 #define MAX_TEE_PARAM	4
+
+/* Policy binary actions sampling frequency (in ms) */
+static int pb_actions_ms = MSEC_PER_SEC;
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
+	ta_sm = dev->shbuf;
+	memset(ta_sm, 0, sizeof(*ta_sm));
+	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
+	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
+
+	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES, &arg, param);
+
+	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(dev->dev, "TEE enact cmd failed. err: %x, ret:%d\n", arg.ret, ret);
+		return ret;
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
+	ta_sm = dev->shbuf;
+	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE;
+	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
+
+	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE, &arg, param);
+
+	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(dev->dev, "Failed to invoke TEE init cmd. err: %x, ret:%d\n", arg.ret, ret);
+		return ret;
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
@@ -96,10 +183,18 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
 
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

