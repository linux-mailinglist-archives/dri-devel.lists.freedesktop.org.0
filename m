Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE967BFC00
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 14:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA86E10E342;
	Tue, 10 Oct 2023 12:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2071.outbound.protection.outlook.com [40.107.100.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC9410E341;
 Tue, 10 Oct 2023 12:59:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6R5EpzABAVgnr6UNPTRjcGAiu9N2L7+pDzsB5zyV0C5KzCOMxZ6KnKFeFNdwI7R+epd7iTQt36M92kEGeaZDpGsWx1rQ2BWzYvMhti4k6Mmum9FaDFhwPDxwn0IVGA/G2mrF7dD5BgbOUpQwyQekMpYnW3YE74iE3KhCRtBq2wF0FroZYe00qEFKGmhSJYihJsFTxO6KJDusDMwOoYnlO/ihXdOBdKl7X7BBalKQ18RRMHWtKNojPbkabWCzH1vTy3SnnCbvrIMc80Uz5nE6mSezQzIurn2tjMcHzYyV2Z/T1b6SgtVS8BaSfSeMuUubqMbAWxaqkOe22tXVo7dFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16Ov2YieS2EUUrWT29MOsu9C5MjQXV0ONbbb60HTmXo=;
 b=JlvVtn3pMiDRVyg5xmt/o0GIgvU6rLDMWpwm7Yw/6TR0HBSYE5eeo31PZVj+AH9EndIgMjR9jQ9JcFW6jw1ltaf+SzwkSBzujhifcRQIVpC1i+lAkrxH2ekBNAI8WrYXGJ8wBC6dJPfMda6nRZNAUZhVBrlNUpCHRwF7eWE84ly1CMf1fiMvZIibx0W18k+ASGUr1oFCxEZ7Y6qlGwl49RjCOqDKKAjEzbOHrr9EGGoVJe83lqa51ICbr1HU04SIZoNwpcWvmxJd5gw68crOGrckIDmblcQOIlkbfU8T+v1FOeRT/2GobC1phFbvfnWbAn7z0xJY0Wj/Y67qAkgzZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16Ov2YieS2EUUrWT29MOsu9C5MjQXV0ONbbb60HTmXo=;
 b=VCLNP0V4MqIOnCMJLqcx/pLcjMCMMHqOl4M7YuOepPny2LZYNh3kJxPckaWxTat+U1hoteB5Sn9JtU91d/1/sABscGX/e+VX0Aw7hlLrt7AWKpid2xX8kyh+ufM4Mi5lk0RSn1EmAJjgwudufWZz91170HRL2DsWNWgKhjr96Rs=
Received: from DM6PR04CA0028.namprd04.prod.outlook.com (2603:10b6:5:334::33)
 by DM6PR12MB4122.namprd12.prod.outlook.com (2603:10b6:5:214::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 10 Oct
 2023 12:59:47 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::ad) by DM6PR04CA0028.outlook.office365.com
 (2603:10b6:5:334::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31 via Frontend
 Transport; Tue, 10 Oct 2023 12:59:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 12:59:47 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 07:59:41 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 01/16] platform/x86/amd/pmf: Add PMF TEE interface
Date: Tue, 10 Oct 2023 18:29:02 +0530
Message-ID: <20231010125917.138225-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|DM6PR12MB4122:EE_
X-MS-Office365-Filtering-Correlation-Id: c98fbb95-985e-4890-fd42-08dbc990c80f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xsTsRRMsefqXNllyjssyHh9CVbM9T5nYgBHQ+JLuqE7UwHV52rKdjGAiwdw1BLULiA0FVj132K2FbqGzxcLSiWZoyQVZm50EPB9zTvya/fZF03FPTDu2J/ilaZpHNRyfkoHM4lviLIzlpmtHko7TI4mA2uVvuPqyuN8i8br7424FhbZgvkDGlEt9dwCc6HNtlR21Kyc4e5YnMXFPun0h6PlKkK2kAARGJ0bMTfAvtRViOqngxJrVrb2FtMZS5dKCmyACRohpK+rTA5xV6EHNlq9oQiZZoJuUkSoqYAU5dx85LPXYJDbiMQIJHREZQi4xIby8MI/uQ4iyLHUyp6y8T5IvbL5+HS8LFm8FTYGbNH26cu4mMJ8soaWCdWPmJeFVc2lNLmeoFoFlqotzeXvv9sbOMkbwcvrUUoLcwr8ModDTnUpYEpw1xuxmsgycG39m1qG89oKFuOT4rrjjb0OYW1l2dm5IXuE6uQvlD7HOwqYQtsdVhArDVtRBdN/EBNPxjC/P78WTb3/ye9uI7ml8FsbzVzBBEecdWjpRoWQfCCq+5Pid86fXXLKIh/cX5LGJRKFXBkmBE/tY6qfkMu+SwNSbv3NhzX4zxoSIuFrAiJtqmufiFIHM5ZeAwPJ6nPXdJ2oXFt6htzgteV6YE9h1dsNFzJgzhUSOg62rTZGlWjoFpLrERKP2bZNS3h4sq10nhu/aQ7MNUXfopHtOzPYaWOmPGBvc6Q9Ob4oYfnlwxcoBMOSI6fsI+3AHOnPO/FxmQzyeo32W35hLlvma+SumqzrjeWq9/YcCkxr//fHBW3I=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(64100799003)(36840700001)(40470700004)(46966006)(82740400003)(2616005)(7696005)(1076003)(478600001)(316002)(41300700001)(336012)(83380400001)(47076005)(426003)(7416002)(2906002)(70586007)(110136005)(5660300002)(54906003)(8936002)(70206006)(8676002)(4326008)(16526019)(26005)(40460700003)(921005)(36860700001)(356005)(36756003)(40480700001)(81166007)(86362001)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 12:59:47.1240 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c98fbb95-985e-4890-fd42-08dbc990c80f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4122
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

AMD PMF driver loads the PMF TA (Trusted Application) into the AMD
ASP's (AMD Security Processor) TEE (Trusted Execution Environment).

PMF Trusted Application is a secured firmware placed under
/lib/firmware/amdtee gets loaded only when the TEE environment is
initialized. Add the initial code path to build these pipes.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig  |   1 +
 drivers/platform/x86/amd/pmf/Makefile |   3 +-
 drivers/platform/x86/amd/pmf/core.c   |  10 ++-
 drivers/platform/x86/amd/pmf/pmf.h    |  16 ++++
 drivers/platform/x86/amd/pmf/tee-if.c | 105 ++++++++++++++++++++++++++
 5 files changed, 130 insertions(+), 5 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmf/tee-if.c

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index 3064bc8ea167..32a029e8db80 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -9,6 +9,7 @@ config AMD_PMF
 	depends on POWER_SUPPLY
 	depends on AMD_NB
 	select ACPI_PLATFORM_PROFILE
+	depends on TEE
 	help
 	  This driver provides support for the AMD Platform Management Framework.
 	  The goal is to enhance end user experience by making AMD PCs smarter,
diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index fdededf54392..d2746ee7369f 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -6,4 +6,5 @@
 
 obj-$(CONFIG_AMD_PMF) += amd-pmf.o
 amd-pmf-objs := core.o acpi.o sps.o \
-		auto-mode.o cnqf.o
+		auto-mode.o cnqf.o \
+		tee-if.o
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 78ed3ee22555..d57ed038f0c9 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -309,13 +309,13 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
 	}
 
-	/* Enable Auto Mode */
-	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
+	if (amd_pmf_init_smart_pc(dev)) {
+		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
+	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
 		amd_pmf_init_auto_mode(dev);
 		dev_dbg(dev->dev, "Auto Mode Init done\n");
 	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
 			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
-		/* Enable Cool n Quiet Framework (CnQF) */
 		ret = amd_pmf_init_cnqf(dev);
 		if (ret)
 			dev_warn(dev->dev, "CnQF Init failed\n");
@@ -330,7 +330,9 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 		amd_pmf_deinit_sps(dev);
 	}
 
-	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
+	if (dev->smart_pc_enabled) {
+		amd_pmf_deinit_smart_pc(dev);
+	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
 		amd_pmf_deinit_auto_mode(dev);
 	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
 			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index deba88e6e4c8..bd40458937ba 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -179,6 +179,12 @@ struct amd_pmf_dev {
 	bool cnqf_enabled;
 	bool cnqf_supported;
 	struct notifier_block pwr_src_notifier;
+	/* Smart PC solution builder */
+	struct tee_context *tee_ctx;
+	struct tee_shm *fw_shm_pool;
+	u32 session_id;
+	void *shbuf;
+	bool smart_pc_enabled;
 };
 
 struct apmf_sps_prop_granular {
@@ -389,6 +395,13 @@ struct apmf_dyn_slider_output {
 	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
 } __packed;
 
+struct ta_pmf_shared_memory {
+	int command_id;
+	int resp_id;
+	u32 pmf_result;
+	u32 if_version;
+};
+
 /* Core Layer */
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
@@ -433,4 +446,7 @@ void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
 int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
 extern const struct attribute_group cnqf_feature_attribute_group;
 
+/* Smart PC builder Layer */
+int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
+void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
new file mode 100644
index 000000000000..6ec8c3726624
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Platform Management Framework Driver - TEE Interface
+ *
+ * Copyright (c) 2023, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#include <linux/tee_drv.h>
+#include <linux/uuid.h>
+#include "pmf.h"
+
+#define MAX_TEE_PARAM	4
+static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
+						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
+
+static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
+}
+
+static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
+{
+	struct tee_ioctl_open_session_arg sess_arg = {};
+	int rc;
+
+	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
+	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
+	sess_arg.num_params = 0;
+
+	rc = tee_client_open_session(ctx, &sess_arg, NULL);
+	if (rc < 0 || sess_arg.ret != 0) {
+		pr_err("Failed to open TEE session err:%#x, rc:%d\n", sess_arg.ret, rc);
+		return rc;
+	}
+
+	*id = sess_arg.session;
+
+	return rc;
+}
+
+static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
+{
+	u32 size;
+	int ret;
+
+	dev->tee_ctx = tee_client_open_context(NULL, amd_pmf_amdtee_ta_match, NULL, NULL);
+	if (IS_ERR(dev->tee_ctx)) {
+		dev_err(dev->dev, "Failed to open TEE context\n");
+		return PTR_ERR(dev->tee_ctx);
+	}
+
+	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id);
+	if (ret) {
+		dev_err(dev->dev, "Failed to open TA session (%d)\n", ret);
+		ret = -EINVAL;
+		goto out_ctx;
+	}
+
+	size = sizeof(struct ta_pmf_shared_memory);
+	dev->fw_shm_pool = tee_shm_alloc_kernel_buf(dev->tee_ctx, size);
+	if (IS_ERR(dev->fw_shm_pool)) {
+		dev_err(dev->dev, "Failed to alloc TEE shared memory\n");
+		ret = PTR_ERR(dev->fw_shm_pool);
+		goto out_sess;
+	}
+
+	dev->shbuf = tee_shm_get_va(dev->fw_shm_pool, 0);
+	if (IS_ERR(dev->shbuf)) {
+		dev_err(dev->dev, "Failed to get TEE virtual address\n");
+		ret = PTR_ERR(dev->shbuf);
+		goto out_shm;
+	}
+	dev_dbg(dev->dev, "TEE init done\n");
+
+	return 0;
+
+out_shm:
+	tee_shm_free(dev->fw_shm_pool);
+out_sess:
+	tee_client_close_session(dev->tee_ctx, dev->session_id);
+out_ctx:
+	tee_client_close_context(dev->tee_ctx);
+
+	return ret;
+}
+
+static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
+{
+	tee_shm_free(dev->fw_shm_pool);
+	tee_client_close_session(dev->tee_ctx, dev->session_id);
+	tee_client_close_context(dev->tee_ctx);
+}
+
+int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
+{
+	return amd_pmf_tee_init(dev);
+}
+
+void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
+{
+	amd_pmf_tee_deinit(dev);
+}
-- 
2.25.1

