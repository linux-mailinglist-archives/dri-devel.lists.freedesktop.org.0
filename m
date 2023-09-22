Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8649B7AB85B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B512E10E6ED;
	Fri, 22 Sep 2023 17:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C329C10E6F0;
 Fri, 22 Sep 2023 17:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLcG8vb/GRXriSThl3YmwnhJ1DOELkgNkFBiO490Y64U2+/Y7THpiOfnegGpLIZQ7oQKF6WSsDA06tqYTNeLXqDHcqRI8EKQRgvON+zZ00dnbRKqoIJOKQNSIbxoCb+olBfW7pQE4b2AkIUsoNNSjEc97yx45yXLcIwp4vANm21l0FnLaZfPFbHho71l+tynSnDygZqUNiWyLagbzWwJwVdWMdYf4BHqKtNNaab2vQ2iTI48wtfNqg0Wl4bLhwmceJi1NxgEYRN7tX2iVYX3JAzktO1Kfsd15+1ux9BODFr7xuqt0zhRR4Il/7GcEM4/JyyGkeeq7Wu5yY/OfXFzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IpmrxrdMe/kHmzLijfRFeLkjrJTX2EbVrBzeS86ejs=;
 b=bdns5JMPc43gnFjzUlTFpUZLMroCyMxt+4pd6FxmMOccr8apVrGxwnnAca7EeiSL0UNNt0FsVidZglxT05inUhKUxs4JxGqo+LCtNVvUGS0fcscxmG9C3rqhas3aqbEPTV/dNvQxXgM2cZnKFhx12vPkQPc2IVpNxyyclvP25wMS6CWmIrstq7nWg5cnT8v28bD05iMwEMtKfHYBhgJnGl1CB7XTewPjb5eG/tWQzNxwXh83TPW1/TycLlHvHWTb/Pb4ONDJPnQqgkc/t9MQOCjPAxnq2LhgD50xmNlSVuVy2+VbuDcv/wFur5T90eiDR9BspWzq+kS3gaZTG5Ecfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IpmrxrdMe/kHmzLijfRFeLkjrJTX2EbVrBzeS86ejs=;
 b=QUmtN6Q0yVpoFK5WF/ysvrWX3nZxchhAu5f37qc272lYvm5vT5NfOXKHKA6TvTZX5dOhzK9Wupd/xJlw3IXLZ4FVKBgIfdKrjJW1kyRbjiPK8oOxyDy5q3TvCXpdnAve4+XlfjS17HcLWcHYVczOY4jEJPYZQCECOpoWR2i+y8A=
Received: from MN2PR18CA0027.namprd18.prod.outlook.com (2603:10b6:208:23c::32)
 by MN0PR12MB6366.namprd12.prod.outlook.com (2603:10b6:208:3c1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Fri, 22 Sep
 2023 17:52:59 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:23c:cafe::38) by MN2PR18CA0027.outlook.office365.com
 (2603:10b6:208:23c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.34 via Frontend
 Transport; Fri, 22 Sep 2023 17:52:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 22 Sep 2023 17:52:59 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:52:35 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
 <benjamin.tissoires@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH 12/15] platform/x86/amd/pmf: Add PMF-AMDGPU get interface
Date: Fri, 22 Sep 2023 23:20:53 +0530
Message-ID: <20230922175056.244940-13-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|MN0PR12MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 520f9621-f353-43b4-e5cf-08dbbb94c259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wW5DeTy0AHprgHYwkq0VKx3gCAcSa+h8JmhnqZmgZls98/l/2D3lBZTEt6QZdeK7A7KwGuaq/DzD1vGlgzuEtC90VCWcXLXiue7E2cqUSsracunEZ6aYJPaBnEcXbCPajCbyT070lZj6LawgMIVT4/aPFW7aMMqmt3gbuNU5kWEzd+qhIUDVF8pc6SmqKHyCTt9c+LHGvJBHSi2l7Y9v4IgC87JXLbk2zFZWc/mmXdvMRUUmDAzJ3AWcCo9L81NLWXvC9AUnJFalHeFkEV/zTE2Fcio6OtkdZXPOEFrbn9ayEACoG0bgAJOE/RrH/w1SOdfm2WFvjbZ7c3CmFEP/GkM+HwepjdE9X3BwDKCD0UuHEhKrb/NOvw0hAfIZ4VHFpmcdv4AUfXv0AQne6sEccjgD0bQ/MLZ4nzWs6UT87ZHNq5mP34De0C+1A79vQTreteRn78sb+wP4ySLjmvbve0yJh1AXStMr2L1+xwxIPHFkGS0R7lGMfZF95GeUJW8ST9X/qKwCH2E12pJBBbvqmk4U+z94Xo8kU4+szvXo+oP6zxmHkSleK4ESQs6Ajox8rILHPa12S9C7VFyyBQp9bDTi7rjqDOza9s5K/++eueuMRORYDqNjJuCUi+zvjVOMFW4VDEIwluuVSNb3+Z4w/PfTVX53t4Uor6fSvcveTE382V5AIxaoVJ/KTJhOum2WiMDsZd8gO+bURJM+o6UeWdLI4BlWqFK1UR+LBb6ogggaV6Z2aPVtqefBL7LoQ6toehH3Eyknjl7/7ux/sVOTnkb6vLqkRgAV4YX09qHFLT0UGtwo6NLRgVqDjNQOvc+JE+V7d2JA0Io5aaJgm3AxgQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230921699003)(451199024)(1800799009)(186009)(82310400011)(46966006)(40470700004)(36840700001)(4326008)(8676002)(41300700001)(70206006)(70586007)(8936002)(478600001)(40480700001)(54906003)(316002)(110136005)(5660300002)(40460700003)(2906002)(30864003)(7416002)(81166007)(47076005)(921005)(356005)(82740400003)(83380400001)(16526019)(26005)(426003)(336012)(1076003)(2616005)(66899024)(86362001)(36860700001)(6666004)(7696005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:52:59.2813 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 520f9621-f353-43b4-e5cf-08dbbb94c259
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6366
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
 drivers/gpu/drm/amd/amdgpu/Makefile     |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 70 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/Kconfig    |  1 +
 drivers/platform/x86/amd/pmf/core.c     |  1 +
 drivers/platform/x86/amd/pmf/pmf.h      |  4 ++
 drivers/platform/x86/amd/pmf/spc.c      | 13 +++++
 drivers/platform/x86/amd/pmf/tee-if.c   | 22 ++++++++
 include/linux/amd-pmf-io.h              | 28 ++++++++++
 9 files changed, 142 insertions(+)
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
index 000000000000..232d11833ddc
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
@@ -0,0 +1,70 @@
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
+	struct backlight_device *bd;
+	int i = 0;
+
+	/* reset the count to zero */
+	pmf->display_count = 0;
+	if (!(adev->flags & AMD_IS_APU)) {
+		DRM_ERROR("PMF-AMDGPU interface not supported\n");
+		return -ENODEV;
+	}
+
+	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
+	if (!bd)
+		return -ENODEV;
+
+	pmf->brightness = backlight_get_brightness(bd);
+
+	mutex_lock(&mode_config->mutex);
+	drm_connector_list_iter_begin(drm_dev, &iter);
+
+	drm_for_each_connector_iter(connector, &iter) {
+		if (i > MAX_SUPPORTED)
+			break;
+
+		if (connector->status == connector_status_connected) {
+			pmf->con_status[i] = connector->status;
+			pmf->connector_type[i] = connector->connector_type;
+			pmf->display_count++;
+		}
+		i++;
+	}
+	drm_connector_list_iter_end(&iter);
+	mutex_unlock(&mode_config->mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index 437b78c6d1c5..0cd08f9ab51b 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -10,6 +10,7 @@ config AMD_PMF
 	depends on AMD_NB
 	select ACPI_PLATFORM_PROFILE
 	depends on AMDTEE
+	depends on DRM_AMDGPU
 	help
 	  This driver provides support for the AMD Platform Management Framework.
 	  The goal is to enhance end user experience by making AMD PCs smarter,
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index dbfe7c1d6fc4..c468d208b1dc 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -396,6 +396,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	}
 
 	dev->cpu_id = rdev->device;
+	dev->root = rdev;
 
 	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
 	if (err) {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 780c442239e3..9032df4ba48a 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -13,6 +13,8 @@
 
 #include <linux/acpi.h>
 #include <linux/platform_profile.h>
+#include <linux/amd-pmf-io.h>
+
 #define POLICY_BUF_MAX_SZ		0x4b000
 #define POLICY_SIGN_COOKIE		0x31535024
 
@@ -224,9 +226,11 @@ struct amd_pmf_dev {
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
index 5c6745f56ed1..5f3ab1ce09d2 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -43,6 +43,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "Max C0 Residency : %d\n", in->ev_info.max_c0residency);
 	dev_dbg(dev->dev, "GFX Busy : %d\n", in->ev_info.gfx_busy);
 	dev_dbg(dev->dev, "Connected Display Count : %d\n", in->ev_info.monitor_count);
+	dev_dbg(dev->dev, "Primary Display Type : %s\n",
+		drm_get_connector_type_name(in->ev_info.display_type));
+	dev_dbg(dev->dev, "Primary Display State : %s\n", in->ev_info.display_state ?
+			"Connected" : "disconnected/unknown");
 	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
@@ -144,6 +148,14 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
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
@@ -152,4 +164,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
 	amd_pmf_get_smu_info(dev, in);
 	amd_pmf_get_battery_info(dev, in);
 	amd_pmf_get_slider_info(dev, in);
+	amd_pmf_get_gpu_info(dev, in);
 }
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 3daa122f35d5..1608996654e8 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/pci.h>
 #include <linux/tee_drv.h>
 #include <linux/uuid.h>
 #include "pmf.h"
@@ -345,6 +346,20 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 	return amd_pmf_start_policy_engine(dev);
 }
 
+static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
+{
+	struct amd_pmf_dev *dev = data;
+
+	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
+		dev->gfx_data.gpu_dev = pci_get_device(pdev->vendor, pdev->device, NULL);
+		if (dev->gfx_data.gpu_dev) {
+			pci_dev_put(pdev);
+			return 1; /* stop walking */
+		}
+	}
+	return 0; /* continue walking */
+}
+
 static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
 {
 	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
@@ -435,6 +450,12 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
 	amd_pmf_set_dram_addr(dev);
 	amd_pmf_get_bios_buffer(dev);
+
+	/* get amdgpu handle */
+	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
+	if (!dev->gfx_data.gpu_dev)
+		dev_err(dev->dev, "GPU handle not found!\n");
+
 	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
 	if (!dev->prev_data)
 		return -ENOMEM;
@@ -451,5 +472,6 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
 	kfree(dev->prev_data);
 	kfree(dev->policy_buf);
 	cancel_delayed_work_sync(&dev->pb_work);
+	pci_dev_put(dev->gfx_data.gpu_dev);
 	amd_pmf_tee_deinit(dev);
 }
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
new file mode 100644
index 000000000000..a2d4af231362
--- /dev/null
+++ b/include/linux/amd-pmf-io.h
@@ -0,0 +1,28 @@
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
+#include <drm/drm_connector.h>
+
+#define MAX_SUPPORTED 4
+
+/* amdgpu */
+struct amd_gpu_pmf_data {
+	struct pci_dev *gpu_dev;
+	enum drm_connector_status con_status[MAX_SUPPORTED];
+	int display_count;
+	int connector_type[MAX_SUPPORTED];
+	int brightness;
+};
+
+int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
+#endif
-- 
2.25.1

