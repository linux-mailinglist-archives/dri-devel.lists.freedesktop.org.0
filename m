Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D4F7AB83A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8552B10E6D9;
	Fri, 22 Sep 2023 17:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418A910E6D9;
 Fri, 22 Sep 2023 17:51:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKs9jB74pdl7zfGDgpV1I8aedEISi5Xj0zlHqPFl/y+Q55O9+nuvXpbe4/CGmh3WeNBuD3ozj7nim4QN0rVm2vs+oiXEVm+4X3BY0/KE+ryt1XA0b7qYoLgyy55zBWM29rMjhFp0pBg9XcbXCYbI32TIg21xW0mhL4iaEQGhS1ziCQBPgxzi9UtqHKTfZ2JKkc7hFr07e4rbURGHKK4oInCzdgiPGW78UY7ljnWXB4vDxVb8Oj4iNunX4WDlEupYwdUzXvVnZtOVQObttPYnigWL+Us5GXGAc4lP/v3OILkHDO/BVTCIb0icGq4J0vdzqqQixw2B7IYXsj5IQ/Yhew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rGiesDEPc/x/okJXb/tTvuoPo44x9iNOUkjocF5IeU=;
 b=JSfv2TVVUYRuO3Vciq/s6CVODIJ88F5oX0NYIhDUFdHv+HAoEpJgPvflwzdxWL3/SRyZFjpW/PHRy+T8kain8eSyB2s1J2bM/dqESkDO7YkJ1KOkqWj39TQ+ROFKYAQpt02HW2pm8PWWzmFPwlmFruVPBcrecypUd2emgAjBJTfEwkDhwudIBiP4nvFOougYlrZRJiGYfXfTTGQgvfM+MW+ftEv1WIDK3khtb/WukeU3HRl9DgO00TXBMp0DnJ4YOyLfI4D+gS5arIWXqCXGprspheOg5quVR/3dupiwd6CWpQqohS8eYV9JooX+8S3U01VXq5O/9v8Xzm65meN2vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rGiesDEPc/x/okJXb/tTvuoPo44x9iNOUkjocF5IeU=;
 b=r4VIZMuQ0BBJ9Yx7TeX/85mYqrwxCEXuttMa+9LGD4/6z08XGsC7sQQqtpbV1oiUyDw8u5VIq64p2VdhZZjZTA6+cuqTvmAAmNc0pu8EuxWvAHCsCNEKbGJyNNYzE/c9rwxlwrSLw2GUIVCVHhBUpixRrPVe5r5duLVN2XM8Ht8=
Received: from SA1P222CA0172.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::28)
 by PH8PR12MB7350.namprd12.prod.outlook.com (2603:10b6:510:216::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Fri, 22 Sep
 2023 17:51:54 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:3c3:cafe::29) by SA1P222CA0172.outlook.office365.com
 (2603:10b6:806:3c3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.34 via Frontend
 Transport; Fri, 22 Sep 2023 17:51:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 22 Sep 2023 17:51:53 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:51:48 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
 <benjamin.tissoires@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH 02/15] platform/x86/amd/pmf: Add support PMF-TA interaction
Date: Fri, 22 Sep 2023 23:20:43 +0530
Message-ID: <20230922175056.244940-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|PH8PR12MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: e20a8ed7-572f-4021-ad07-08dbbb949b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1bXoLgt+2RS6gv5cgpd1jNEILMH1tnDlgrlB63Itw6vQjnQ5IdrVXr4ZG32hMQLGVdoJkMfCFXjzlq3FZKD04SGyt4S04cP2UDr09622dy6jXFNEei+6hsBLTxR+sU2EZNcuahTBG1SzvXGz2KBJMO8eSVScUYjshWKt2a+Q0BjEDal1D34vPXg2UEvhddshbjzNF/4FUL2Hh9qX+nIRtLG1smrwCR+Wj+sFeVMQXFds042SSndSR3aWa9WrPEmX61eiFfbQr/aHmTseCLmDyawaA3Ht8ZyssPWaM0Xw0F85JihJpXTqiaVwlVoCfPUfp8ow5p12W0ID3V7SDaxZd56acrYqBQIIcHjSKORMDZrrPdov+50lNedHORsWbB6baCeocAWIe1dKYvy51a87lWv3s/f8uD7dhALG55nlcS1R+xqt+Kv4z/ICeWW2v9IUn7eEMbSWtZ9Q/9YwoTQW7aoQUEMKdaQ1qePBvEQ6sC4CYMbDK62qHvCnKFTVggNcGhDXylS/qe4YNP+7Tyw2PdT1VHqKH/xoQS/HfC1iG6xRYRsgdjUWWZ04a6rDmP0qFBtymh440zjW0u4JOQWzlhpt6cK1/Jo+07Ulo1vJWHrV7BpMleUbkRQX+aVhPEF+7eWaw8KuB0CRk0hY9mPsbZEUjqPJ2s13p9PRo58la/WY0wlrktX1a0MBzWJtLIQqLY5oh30wnDz0I2kuLGlJ1Sef2PPAS75WttQdkD0h8eSTMXTRH7IbxBzkK4n3tYUcv91dDVpfkq5uGM8rZZbGI3B4xqm3lxB4N45C7kJYriAGTNI0cW3yB2/tmDqjacFE81hpr5UySB9dmO0KuVjyFQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199024)(230921699003)(82310400011)(186009)(1800799009)(40470700004)(46966006)(36840700001)(478600001)(7696005)(40480700001)(5660300002)(86362001)(316002)(41300700001)(54906003)(110136005)(70206006)(70586007)(6666004)(2616005)(8936002)(921005)(356005)(81166007)(82740400003)(16526019)(26005)(47076005)(36860700001)(336012)(36756003)(426003)(4326008)(1076003)(8676002)(40460700003)(83380400001)(7416002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:51:53.9249 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e20a8ed7-572f-4021-ad07-08dbbb949b67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7350
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
index 02460c2a31ea..a9333ff6c0a7 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -59,6 +59,9 @@
 #define ARG_NONE 0
 #define AVG_SAMPLE_SIZE 3
 
+/* TA macros */
+#define PMF_TA_IF_VERSION__MAJOR				1
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
+	TA_PMF_COMMAND_POLICY_BUILDER__INITIALIZE,
+	TA_PMF_COMMAND_POLICY_BUILDER__ENACT_POLICIES
+};
+
 struct ta_pmf_shared_memory {
 	int command_id;
 	int resp_id;
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index b48340edbf44..1fce04beacb3 100644
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
+	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER__ENACT_POLICIES;
+	ta_sm->if_version = PMF_TA_IF_VERSION__MAJOR;
+
+	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER__ENACT_POLICIES, &arg, param);
+
+	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(dev->dev, "%s failed TEE err: %x, ret:%x\n", __func__, arg.ret, ret);
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
+		dev_err(dev->dev, "%s tee_ctx no context\n", __func__);
+		return -ENODEV;
+	}
+
+	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
+	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER__INITIALIZE;
+	ta_sm->if_version = PMF_TA_IF_VERSION__MAJOR;
+
+	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER__INITIALIZE, &arg, param);
+
+	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(dev->dev, "%s failed TEE err: %x, ret:%x\n", __func__, arg.ret, ret);
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
@@ -97,10 +184,18 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
 
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

