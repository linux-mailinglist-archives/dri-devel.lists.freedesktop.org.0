Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F10E7BFC54
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D7410E35E;
	Tue, 10 Oct 2023 13:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA2B10E35D;
 Tue, 10 Oct 2023 13:00:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtHujH1IAUxheemon0NJa1OqgbG23T3UhqnH514wsXpC3SZgs7NcALsh2vJCge35EiHJogzv2QVLB22gqZo0aDsHBesa5P3SugTOM7ANZrdGdqXbTUtA0h0fxVGWiInlIT1cvaC21vu6PIoG+9SSMM9pWC0iYyly0wxVqMTeVHg5qPsC/UuhSDvhhyhcz1033Yurp7Tm1QAgVpYd4ew6FREIh6N5cRvWf2jchrJ6jSK9oVYL4BcaCCM6wAJMIcvEeSZSp5jW4d5SLwbyVvVp+PW6DDjU7B7fLIWuIWadQV1yg4aVMvLatbH3Zh08IEyE9mWuRbZYu7J/KSrVbC+o8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wp7QOQFsQRqK7c1VGgY0CCXL8tO4akQMrSQaqwz8gIA=;
 b=lEHMXMCV9g49MJnRZjOcq8B6+vcTOTX8fgHqY7VigWmYFTJ5rcADjv/FqzjUcKg7VPVvAWfdCXd6A5Yk5sHskY8EhGvN7VB71We9dgvUaKAR80QDYRKiSOgyK9GfzFKh6L7iHbvSuhvR/iGuXrDsgWvnfr9pscdzQsnA/TcgLDOA+ZI+U1dVIf3lmf6BnMY5az/uOEUdS1Cw0kD0lABYy5weQJMF52NN5KnPwHJmcyRchJzumPUsYURTpW6A3PexfG1vGlIUGHRjuRA36MtBWFHuxnJCtZY5isP9mQ8oQUI2myzb7isW4LW6YkEvO6JSywr/b6MnD7pNaA10uqI+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp7QOQFsQRqK7c1VGgY0CCXL8tO4akQMrSQaqwz8gIA=;
 b=gI+6DMVvA5b3oep5bV8UmcBVXd/+kEEWWnTqsT7yekan2gd4EMnE1+F16NX5WhoHbt7HJHiqsLG5Qvxvh5qTpQuQnxW3rdW2Cpo+j5L6XBxtt/zuc7HX9LWS9f482N37i/Fh7JC0Bxh56AYayMk/R1owuxMU1tO6BDmU2xdhWiM=
Received: from DS7PR03CA0256.namprd03.prod.outlook.com (2603:10b6:5:3b3::21)
 by SN7PR12MB8169.namprd12.prod.outlook.com (2603:10b6:806:32f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:00:53 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:5:3b3:cafe::db) by DS7PR03CA0256.outlook.office365.com
 (2603:10b6:5:3b3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37 via Frontend
 Transport; Tue, 10 Oct 2023 13:00:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Tue, 10 Oct 2023 13:00:53 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 08:00:47 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 12/16] platform/x86/amd/pmf: Add PMF-AMDGPU get interface
Date: Tue, 10 Oct 2023 18:29:13 +0530
Message-ID: <20231010125917.138225-13-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|SN7PR12MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 306459bb-f993-4a40-7c7e-08dbc990efb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XgzHPcrbE4xSR/ZBJ+6jChGrqn9t4fJMXoyBctNAX7afDlPsLUdAq8YV4jKYLDhgH28i1DW6Rd1bm614lfvWEyxqZL3jXTmImK0AakyMZFxdJMOygRXJ1JGb068JMocQmwy6aJ4rvkMsh3YL8lBPMHHHBuJg7PCoXwc/1Qmam4E/n1xubdJG2ik8oaMee4oRf2uH2BRi5halHtlklK+kOcjgehxMNZU5UY4NfE0yR+JKAnFzCkRqe1+4v/eVp5cWbursydVUvXAPDdctuXP6e0yv6JeEaPFkXKUouNIDUZV0kIokqAz3tlSYDgmN+npX6Pv5tGT2inpIFIMgJiOENBzhQPQUl0EyJ349FOqoTRNh9TFFrfGHK/aZiyBoyiTvda+DL44O0BT5l+taCVdzFzjEuamnJtI0d26nj2T4eOUll4DVxMmziH1lyPAbsCMBUbLY8CzL1F5JN9/UQQxjvigXTJbm246fbxPzvPTmvO4N3BS9cBAM94OzqfrIQHo8lRL3sxtaBEXox42H0KbEGrrWUifPWWI0pqsJCHoSXzvxDwhEZDDISJwpYTgb1RKBovNmqPsfqEInKF8qEUwKz1DhrcpRPJryhQ+bv4aXyAooJUJ/0YPv52ls2NLu08lO6g9j7MvjAy1NDrpCPL6TD1XmkUGWZBCRNXJ53VhlBldtko3+JHFbvQo9eBf5O24+TrQ1oyZCznqEc4GNHtN6pgK6yqHhSqt9R5zi+PMCHUTp/aHLV/uirwC34RbtYxV0xhL5v167QcdEZphFLr1snVpzNN16tS60FHbTLq1AzFo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(40460700003)(1076003)(7696005)(478600001)(2616005)(6666004)(336012)(47076005)(426003)(26005)(16526019)(30864003)(83380400001)(7416002)(2906002)(5660300002)(110136005)(54906003)(70206006)(70586007)(8936002)(4326008)(8676002)(316002)(41300700001)(356005)(82740400003)(921005)(81166007)(36860700001)(36756003)(86362001)(40480700001)(66899024)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:00:53.5289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 306459bb-f993-4a40-7c7e-08dbc990efb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8169
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

In order to provide GPU inputs to TA for the Smart PC solution to work, we
need to have interface between the PMF driver and the AMDGPU driver.

Add the initial code path for get interface from AMDGPU.

Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile     |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 136 ++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/Kconfig    |   1 +
 drivers/platform/x86/amd/pmf/core.c     |   1 +
 drivers/platform/x86/amd/pmf/pmf.h      |   3 +
 drivers/platform/x86/amd/pmf/spc.c      |  13 +++
 drivers/platform/x86/amd/pmf/tee-if.c   |  26 +++++
 include/linux/amd-pmf-io.h              |  35 ++++++
 9 files changed, 218 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
 create mode 100644 include/linux/amd-pmf-io.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 384b798a9bad..7fafccefbd7a 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -86,6 +86,8 @@ amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
 
 amdgpu-$(CONFIG_PERF_EVENTS) += amdgpu_pmu.o
 
+amdgpu-$(CONFIG_AMD_PMF) += amdgpu_pmf.o
+
 # add asic specific block
 amdgpu-$(CONFIG_DRM_AMDGPU_CIK)+= cik.o cik_ih.o \
 	dce_v8_0.o gfx_v7_0.o cik_sdma.o uvd_v4_2.o vce_v2_0.o
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index dc2d53081e80..475f3e248f35 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -50,6 +50,7 @@
 #include <linux/hashtable.h>
 #include <linux/dma-fence.h>
 #include <linux/pci.h>
+#include <linux/amd-pmf-io.h>
 
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
new file mode 100644
index 000000000000..45a079c028d3
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
@@ -0,0 +1,136 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+
+ * * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#include <linux/backlight.h>
+#include "amdgpu.h"
+
+int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
+{
+	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
+	struct drm_mode_config *mode_config = &drm_dev->mode_config;
+	struct amdgpu_device *adev = drm_to_adev(drm_dev);
+	struct drm_connector_list_iter iter;
+	struct drm_connector *connector;
+	int i = 0;
+
+	/* reset the count to zero */
+	pmf->display_count = 0;
+	if (!(adev->flags & AMD_IS_APU)) {
+		DRM_ERROR("PMF-AMDGPU interface not supported\n");
+		return -ENODEV;
+	}
+
+	mutex_lock(&mode_config->mutex);
+	drm_connector_list_iter_begin(drm_dev, &iter);
+	drm_for_each_connector_iter(connector, &iter) {
+		if (connector->status == connector_status_connected) {
+			pmf->con_status[i] = connector->status;
+			pmf->connector_type[i] = connector->connector_type;
+			pmf->display_count++;
+		}
+		i++;
+
+		if (i > MAX_SUPPORTED)
+			break;
+	}
+	drm_connector_list_iter_end(&iter);
+	mutex_unlock(&mode_config->mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
+
+static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
+				     unsigned long *state)
+{
+	struct backlight_device *bd;
+
+	if (!acpi_video_backlight_use_native())
+		return -ENODEV;
+
+	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
+	if (!bd)
+		return -ENODEV;
+
+	*state = backlight_get_brightness(bd);
+
+	return 0;
+}
+
+static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
+				     unsigned long *state)
+{
+	struct backlight_device *bd;
+
+	if (!acpi_video_backlight_use_native())
+		return -ENODEV;
+
+	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
+	if (!bd)
+		return -ENODEV;
+
+	if (backlight_is_blank(bd))
+		*state = 0;
+	else
+		*state = bd->props.max_brightness;
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops bd_cooling_ops = {
+	.get_max_state = amd_pmf_gpu_get_max_state,
+	.get_cur_state = amd_pmf_gpu_get_cur_state,
+};
+
+int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf)
+{
+	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
+	struct amdgpu_device *adev = drm_to_adev(drm_dev);
+
+	if (!(adev->flags & AMD_IS_APU)) {
+		DRM_ERROR("PMF-AMDGPU interface not supported\n");
+		return -ENODEV;
+	}
+
+	if (!acpi_video_backlight_use_native())
+		return -ENODEV;
+
+	pmf->raw_bd = backlight_device_get_by_type(BACKLIGHT_RAW);
+	if (!pmf->raw_bd)
+		return -ENODEV;
+
+	pmf->cooling_dev = thermal_cooling_device_register("pmf_gpu_bd",
+							   pmf, &bd_cooling_ops);
+	if (IS_ERR(pmf->cooling_dev))
+		return -ENODEV;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(amd_pmf_gpu_init);
+
+void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf)
+{
+	thermal_cooling_device_unregister(pmf->cooling_dev);
+}
+EXPORT_SYMBOL_GPL(amd_pmf_gpu_deinit);
diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index f246252bddd8..7f430de7af44 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -10,6 +10,7 @@ config AMD_PMF
 	depends on AMD_NB
 	select ACPI_PLATFORM_PROFILE
 	depends on TEE && AMDTEE
+	depends on DRM_AMDGPU
 	help
 	  This driver provides support for the AMD Platform Management Framework.
 	  The goal is to enhance end user experience by making AMD PCs smarter,
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 64af6ddc23ae..0f48e16f5cd1 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -416,6 +416,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	}
 
 	dev->cpu_id = rdev->device;
+	dev->root = rdev;
 
 	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
 	if (err) {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 9b84121344f4..0f1c0e0bc86a 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -13,6 +13,7 @@
 
 #include <linux/acpi.h>
 #include <linux/platform_profile.h>
+#include <linux/amd-pmf-io.h>
 
 #define POLICY_BUF_MAX_SZ		0x4b000
 #define POLICY_SIGN_COOKIE		0x31535024
@@ -228,9 +229,11 @@ struct amd_pmf_dev {
 	void *shbuf;
 	struct delayed_work pb_work;
 	struct pmf_action_table *prev_data;
+	struct amd_gpu_pmf_data gfx_data;
 	u64 policy_addr;
 	void *policy_base;
 	bool smart_pc_enabled;
+	struct pci_dev *root;
 };
 
 struct apmf_sps_prop_granular {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 5cb70f183825..58b51e11e424 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -44,6 +44,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "Max C0 Residency : %u\n", in->ev_info.max_c0residency);
 	dev_dbg(dev->dev, "GFX Busy : %u\n", in->ev_info.gfx_busy);
 	dev_dbg(dev->dev, "Connected Display Count : %u\n", in->ev_info.monitor_count);
+	dev_dbg(dev->dev, "Primary Display Type : %s\n",
+		drm_get_connector_type_name(in->ev_info.display_type));
+	dev_dbg(dev->dev, "Primary Display State : %s\n", in->ev_info.display_state ?
+			"Connected" : "disconnected/unknown");
 	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
@@ -145,6 +149,14 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	return 0;
 }
 
+static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	amd_pmf_get_gfx_data(&dev->gfx_data);
+	in->ev_info.monitor_count = dev->gfx_data.display_count;
+	in->ev_info.display_type = dev->gfx_data.connector_type[0];
+	in->ev_info.display_state = dev->gfx_data.con_status[0];
+}
+
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	/* TA side lid open is 1 and close is 0, hence the ! here */
@@ -153,4 +165,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
 	amd_pmf_get_smu_info(dev, in);
 	amd_pmf_get_battery_info(dev, in);
 	amd_pmf_get_slider_info(dev, in);
+	amd_pmf_get_gpu_info(dev, in);
 }
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index e4386f503ad0..e9a257a91325 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/pci.h>
 #include <linux/tee_drv.h>
 #include <linux/uuid.h>
 #include "pmf.h"
@@ -356,6 +357,19 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 	return amd_pmf_start_policy_engine(dev);
 }
 
+static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
+{
+	struct amd_pmf_dev *dev = data;
+
+	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
+		/* found the amdgpu handle from the pci root after walking through the pci bus */
+		dev->gfx_data.gpu_dev = pdev;
+		return 1; /* stop walking */
+	}
+
+	return 0; /* continue walking */
+}
+
 static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
 {
 	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
@@ -445,6 +459,15 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
 	amd_pmf_set_dram_addr(dev);
 	amd_pmf_get_bios_buffer(dev);
+
+	/* get amdgpu handle */
+	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
+	if (!dev->gfx_data.gpu_dev)
+		dev_err(dev->dev, "GPU handle not found!\n");
+
+	if (!amd_pmf_gpu_init(&dev->gfx_data))
+		dev->gfx_data.gpu_dev_en = true;
+
 	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
 	if (!dev->prev_data)
 		return -ENOMEM;
@@ -460,5 +483,8 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
 	kfree(dev->prev_data);
 	kfree(dev->policy_buf);
 	cancel_delayed_work_sync(&dev->pb_work);
+	if (dev->gfx_data.gpu_dev_en)
+		amd_pmf_gpu_deinit(&dev->gfx_data);
+	pci_dev_put(dev->gfx_data.gpu_dev);
 	amd_pmf_tee_deinit(dev);
 }
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
new file mode 100644
index 000000000000..5f79e66a41b3
--- /dev/null
+++ b/include/linux/amd-pmf-io.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD Platform Management Framework Interface
+ *
+ * Copyright (c) 2023, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#ifndef AMD_PMF_IO_H
+#define AMD_PMF_IO_H
+
+#include <acpi/video.h>
+#include <drm/drm_connector.h>
+#include <linux/backlight.h>
+#include <linux/thermal.h>
+
+#define MAX_SUPPORTED 4
+
+/* amdgpu */
+struct amd_gpu_pmf_data {
+	struct pci_dev *gpu_dev;
+	struct backlight_device *raw_bd;
+	struct thermal_cooling_device *cooling_dev;
+	enum drm_connector_status con_status[MAX_SUPPORTED];
+	int display_count;
+	int connector_type[MAX_SUPPORTED];
+	bool gpu_dev_en;
+};
+
+int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
+int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf);
+void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf);
+#endif
-- 
2.25.1

