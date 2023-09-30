Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0147B3F3F
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0775310E156;
	Sat, 30 Sep 2023 08:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26BE10E0A0;
 Sat, 30 Sep 2023 08:38:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jk6tti3ko9qqL866GnImR78+nmc7rUrRyIcVQyHHVVyU8ltcy5HugTL4swJSSlPub2qVTETeFUAPbx9VHCbPynitrYO7NaYDECYkdDlTEyfZJPMcu11P0KxrPkazr2LI/C1O9CfaLM7OeMUuHk1IvK3G+Pu/gbGKHTZH4CtLRP47NwjxHq/seIyuFsgaJFwI+2Uk7P5dw6Jodhutk5w+7QBVy50Uw7LMNET/Dpqrz+P5y2+9ZgviP7MB6rhMzebfgpMIQ0SGf2JnEO1t98vDXeb6hM6aPLXu2SyOb+q4S0AJ83O3l6arlc9N2lVgWkkBgcR0gHm+Qva8bnSN5h17xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAeLJc5nN4mbmiBHkfsm9EP+38vQ6v1sonp/qDaQT8w=;
 b=hkN0gSGSiv0QeEPalpsgfSoT4w5qXTW9tqgMvOnxFmpMfByVIIcREGzJvsefMaYBKTO8WLGYQRTpX8sdV+B63oPD56zruHeZ6Ny9HXN7ZJD7xBwPq40RAPThWjpNOt8+RI61Tl0DLTzO0+IiNLM4AgJQJ4llYulj7KEyVougtLXidGrp3VyL962txH/M9nnfrl8sSfny226RjoLGNbuaU68FLZC35UYYI4OpkVLdQ8QmmIeUZaMjQNc1s1BhN5qLjcAfE9XQEnOoebAEQUAXEGPRPOnBI+uOmHISVUlLnr0a9XcXRrete9DCxb67jGyuD5BVMPBQlK/dLJ9gd7fJ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAeLJc5nN4mbmiBHkfsm9EP+38vQ6v1sonp/qDaQT8w=;
 b=uId3Fgjwh1rOQXoUw0P70xhs6JZi1xzumgFj65qT6jAQaYqagRrkx5hTuL1i5WxO+cqD5qHSy5+wbCq2EOFk9dzMOoI6C6SOxKZQBhlnECo0Bbn822DR+58mE19nTw+6Ur7xkLc+beES7G7Ke78hfgM4IlCNxJp6AdX1myOtcns=
Received: from MN2PR04CA0022.namprd04.prod.outlook.com (2603:10b6:208:d4::35)
 by IA0PR12MB7529.namprd12.prod.outlook.com (2603:10b6:208:441::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Sat, 30 Sep
 2023 08:38:19 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:d4:cafe::39) by MN2PR04CA0022.outlook.office365.com
 (2603:10b6:208:d4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25 via Frontend
 Transport; Sat, 30 Sep 2023 08:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:38:19 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:38:14 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 01/16] platform/x86/amd/pmf: Add PMF TEE interface
Date: Sat, 30 Sep 2023 14:07:00 +0530
Message-ID: <20230930083715.2050863-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|IA0PR12MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f8ea00-66dd-4734-2a6e-08dbc1909943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GfzmgEs+1/iPtUwyIuKj/VaZPtOvCoUr+AQghbceAdUxau9HoVQgpeqPAesCWcuBgCoMQu+sChiwaHVMkZuv+aNbU/bL4YLKRgnKqA7h9qBJuSC85qXh8e2Kms2WfE3uCzoISNuAVCwNRgcGKD0a+CVgeRuSK7UlrY77LeIlMMI7YL0trdp2Y/Gyqz1Il7Diy6Sw4U/SAIboT6VAzN+sS5M+K4+P8LTH7JrlIwBzXR7f0l/PhXBiv88xBmQqngyHyKoIO2iDnUX/jwBIyGF/ccyEoN0faUEE/qR9cP2Mfk4OX1MkyJxK7a/gK8M5zmYOBcioSIDBUmazYJjN8dVGLbFrx7Ih1zsSiQwQoFxCYqnFZLYxCStbaD4YITV4R98+aAJNMPsFR7tGTzaGL9mmbbgDJqnlvo/FIvKtYEt34QFMhcIUxCqF90CINp3jf9gXrpbm/v3Afh/jW4mYfmtNFFNcIC1Em0/3TmVHhPRKgr/g4ejxHTkXAstZuTH4gZ4abgOytL1KWK5zIXAYH+u6OFuCx6bEVY3Ny4cmLps6W7c4/elKAnQgYmRLNaxKnlNXa8s0NEz+RE2Saj/Tfa+1boYtclYWh27Dh6+Y8VE0wxD3LSor5AxF6GXLm34sC7siCBGwuChhRILOAFX+C+6sOtkgoI71S5JFfU/aTn4nt4HRZWNC7kTEOO700FLxI6nPFpbu+31durFnCNcoYa4XCPsVke1drMHu4K/8gBnFDP3W2XotH8Os+9igqIEkV1P09pgkSnA9p/EIXhKtMzrI499dCTUyo137Tjbz0nS0fZ0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(396003)(376002)(39860400002)(230922051799003)(82310400011)(1800799009)(186009)(451199024)(64100799003)(40470700004)(36840700001)(46966006)(41300700001)(40480700001)(40460700003)(316002)(54906003)(110136005)(336012)(70586007)(70206006)(426003)(36756003)(7416002)(83380400001)(26005)(16526019)(81166007)(921005)(82740400003)(356005)(47076005)(2906002)(86362001)(5660300002)(1076003)(36860700001)(4326008)(8676002)(8936002)(6666004)(2616005)(478600001)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:38:19.3511 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f8ea00-66dd-4734-2a6e-08dbc1909943
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7529
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
 drivers/platform/x86/amd/pmf/Makefile |   3 +-
 drivers/platform/x86/amd/pmf/core.c   |  11 ++-
 drivers/platform/x86/amd/pmf/pmf.h    |  16 ++++
 drivers/platform/x86/amd/pmf/tee-if.c | 112 ++++++++++++++++++++++++++
 4 files changed, 138 insertions(+), 4 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmf/tee-if.c

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
index 78ed3ee22555..68f1389dda3e 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -309,8 +309,11 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
 	}
 
-	/* Enable Auto Mode */
-	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
+	if (amd_pmf_init_smart_pc(dev)) {
+		/* Enable Smart PC Solution builder */
+		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
+	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
+		/* Enable Auto Mode */
 		amd_pmf_init_auto_mode(dev);
 		dev_dbg(dev->dev, "Auto Mode Init done\n");
 	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
@@ -330,7 +333,9 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
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
index deba88e6e4c8..02460c2a31ea 100644
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
 
+/* Smart PC builder Layer*/
+int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
+void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
new file mode 100644
index 000000000000..4db80ca59a11
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -0,0 +1,112 @@
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
+		pr_err("Failed to open TEE session err:%#x, ret:%#x\n", sess_arg.ret, rc);
+		rc = -EINVAL;
+	} else {
+		*id = sess_arg.session;
+	}
+
+	return rc;
+}
+
+static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
+{
+	int ret;
+	u32 size;
+
+	/* Open context with TEE driver */
+	dev->tee_ctx = tee_client_open_context(NULL, amd_pmf_amdtee_ta_match, NULL, NULL);
+	if (IS_ERR(dev->tee_ctx)) {
+		dev_err(dev->dev, "Failed to open TEE context\n");
+		return PTR_ERR(dev->tee_ctx);
+	}
+
+	/* Open session with PMF Trusted App */
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
+	/* Free the shared memory pool */
+	tee_shm_free(dev->fw_shm_pool);
+
+	/* close the existing session with PMF TA*/
+	tee_client_close_session(dev->tee_ctx, dev->session_id);
+
+	/* close the context with TEE driver */
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

