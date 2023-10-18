Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 774BF7CD4E8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7C810E390;
	Wed, 18 Oct 2023 07:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A5010E38F;
 Wed, 18 Oct 2023 07:04:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqIOkii6ThmHy/yb/gyV0ZPzoKMu0Rbku22UKh27Vbh58EnvMMsffzBp18M7hdegW+cwzCnKFHaNsZ+V+Q4gXGzm3ydpC3GExpA0KsqPkvimwsFReTD9W+0Ell54twDdQi20FUFmOJx0VJE64F8C2B00Ns5c/j/Osd13k5xiFWhtpzQZsed22LqYhC+EOFCxRucZalkJxz43trgWTxJBJR1UltugrzLFpPE2VbikJBS/BW4R6XbFnWBcjw6SvyBCYCPZO3HO7qnyyZtGleWjw8QaYye/HY+AVshBDL/2qppafDkfkyFB0Jcos9o55hiSEULSYegh/9Kju1M7MY/yRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmU7y06Itd7QfranZqr9or5/oCfwvJzwuG0mWOSWRpI=;
 b=HxjGQSncJ1+rh1qYil9CRsrtVeaJZrOuJK3qK5rwPVP4aTkH3isv8XJde/ZwDMm++yXKBVCxD9Vc+VyM2o0BLzONqEzHIy5tb4Dbetv5THSr88mbPazCrf97wqR+VeNgz9AwLAgnIfNQGcaX2Btq3RWr7Cyh6xsyw/rX3yRLFj+0YfR26IecuxDTO03zqsnhtWnEpJEQaoYiI3SP17Wk96h8KNgl4r4aFQnq1Dne8ZegIUtiqGPEzHvuE1HaySlbFJScGNgSrPXApirTdwYGqsL0apolxNckDlVluIB9Cj7Z/Jlnm5TSIDKYs4/iAK70P94+oxSG4WdUTlHz0uDS6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmU7y06Itd7QfranZqr9or5/oCfwvJzwuG0mWOSWRpI=;
 b=hVkMxC3DSxPhv9fIrphO4vQdxlx2nP3gctuUOpSqd7PIFgE2152jOFg6XyyMhlvHSYGT6CXesouKjGeuQORv4dwx7plQHzJuW4p97f7sRSbXbY81aq6MNKnN3LqyyTR+EwZvQVrh63cqWQkvYNTGyhBW7ophukbOGNbYFUSOWxo=
Received: from DS7P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::15) by
 DS7PR12MB8324.namprd12.prod.outlook.com (2603:10b6:8:ec::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.35; Wed, 18 Oct 2023 07:04:23 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::54) by DS7P222CA0012.outlook.office365.com
 (2603:10b6:8:2e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Wed, 18 Oct 2023 07:04:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 07:04:22 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 02:04:03 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 02/17] platform/x86/amd/pmf: Add support for PMF-TA
 interaction
Date: Wed, 18 Oct 2023 12:32:26 +0530
Message-ID: <20231018070241.2041529-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|DS7PR12MB8324:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e469839-a4c0-463c-7b58-08dbcfa874b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vznu+e+9aoVj3D3AeJ7bqSjgH6LS74AbgxWGIscOcMFc7vrjAuzNYaieq+dBL/TzLLhjn/ywCGcgetZwwyh64EHdCVxJXOUU8FOTtDByLtVgT4KXQgQvA7mOf/aGch4K5MXWoHwKji5DAnkXHr9lrlA9HX8J7qQBUZzA6INmjBGV1SwgCWb8obDKiJ2DDzYv7rOHjJqWh9OSH5sC+P2HMrF1yzyV1SCM7bz8U09mu4tT4H4OefP1bB/Bj3NLD/Z62hZBo6EHroYGWSIZewIglHvl8lvEmf2ddelncuslcv2eBjbQTqV/On0rI21Rd8fOxYmpGHFnDVWL0sdmr08hq8j6glGXtXIkBjS8QRoHxegAVP3cpGBQU/21asKYgDuwLsgtoaUwe/E3cyBseqlMngP/Eq8QFM4WlufhGBt9NpUrkpVlStZ8tnplko0GNfICPuilcBFv1T4CMEk+bthsfLaJqDOM+0LiDgH2tbKXlrziwQD02D8mWZWY3QMPPw7UPjulGz6csi7dZCUjZgwWvtuRzAcHZTN7xQLEx6zWuSnvlqFlTwXtvz8C09lRaRJfZpdFuU6XSOHWdTlnSJvbJ8UtN4jgPU3uRwjLN5bWys++V8IN9/J9ebPDhi+SVR1Cioi3OBm0oGvbRVZXPflTXYyeWL9LCu+2P8CovjMRtYT9Mk+ssbxTAQaHxrltVu/KVMF4XNEUQEEl1UobWU3mNY/mYSqb5ZvYTaPEP/M8qMpov7RzntRT89rmY6qyVzPttlktut7vLqPQISl+oXUvoXNqNQ6TF1d1+MNswF9MltQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(1800799009)(82310400011)(451199024)(186009)(64100799003)(36840700001)(46966006)(40470700004)(110136005)(7416002)(356005)(921005)(40480700001)(81166007)(86362001)(41300700001)(478600001)(2906002)(36756003)(54906003)(70586007)(70206006)(36860700001)(6666004)(7696005)(316002)(8936002)(8676002)(40460700003)(16526019)(426003)(82740400003)(336012)(1076003)(26005)(2616005)(83380400001)(4326008)(47076005)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:04:22.1741 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e469839-a4c0-463c-7b58-08dbcfa874b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8324
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
index bd40458937ba..a24e34e42032 100644
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
 
+/* Command ids for TA communication */
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

