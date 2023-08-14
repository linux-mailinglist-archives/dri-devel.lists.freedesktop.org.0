Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B3277B298
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 09:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8E610E12E;
	Mon, 14 Aug 2023 07:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D36C10E12B;
 Mon, 14 Aug 2023 07:35:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0Ib7nRdV/vFTeyYmMFCTzq56A1IUrGRQPXYDgn4Vsr0MsugNojuTp2OwjfO3BYi/yyF7JUCbyyAUThw2bWs+aNNX2sOolYlh9Q20pHrOBtilm/JufjzaH0ufhRrG4kZQ1ME/AqSilzNa/0DfPjIHndml/3rgXeipvv7nUZ8Aky0dPte/ttb+SP3OTdNKiyFlfnUTFYzr7uu/hfIbFo44CUxEb641VqWMGwvphlfSJjfnn+f9czYvbTJ8snwdtEwotqlTdxtbd9FTu/lM3g8VVdl4LoCgAHsKDB3IBTP5Ts/W1NgG0cxXEUcSsGUm2ZgvN6ZKfpaNEedUJyPxnhAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=br7LQvRKU/PLh0cNoDuPOGljUilZBoJQ2kdWuSrICrM=;
 b=QCeqmhc68kaz8hoHLP9rEatWlyPLnRIKDCOyxd45jxx9KVwggzXhYa1o8BEd2GwP6tc5DX18mWcOJ10P9PMSdLhnXCbBNoI1CQqaDgkDEktFgMujqefeaJP2VIpgp8iklfMkTZRF6A/zm1akiD/oBMBEFsbKI2Pu9JtBOrQ53GBi3hjEP8ZDjIf9voE1dY2Eot368yyHqqYWZ8zFwG2BOJ+7zSdWHiOx5QK75+GN9PEP+9SIcCQPbS53avkHzB0MFUjIgBIU83/RedfP5okLiW+25bxqeoVo7W+skyDchewgsPSz2sHaixAgacCc/ZHcUYjBbdMwS9GYpj/8N8BmyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br7LQvRKU/PLh0cNoDuPOGljUilZBoJQ2kdWuSrICrM=;
 b=2HA2FbqO4/1RjYlaRB7peUk5/fNqdW7HhLACQVn3Kk/n2zx/aCDCxfBaz+G4B5EGB9D+n7YuZG8O57y8uLIZbwWDpp2ylyUnEuzvZpj3F+lj6hpmhTxVyAMzsTOa8KDomhHt+8QWgQ/vYe0f//BT/XOouJzJSlSorgLg7Lek6g4=
Received: from DM6PR10CA0033.namprd10.prod.outlook.com (2603:10b6:5:60::46) by
 CH3PR12MB8849.namprd12.prod.outlook.com (2603:10b6:610:178::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:35:30 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:5:60:cafe::41) by DM6PR10CA0033.outlook.office365.com
 (2603:10b6:5:60::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 07:35:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 07:35:30 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 02:35:26 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] drm/amdgpu: Add new api to switch on/off power profile
 mode
Date: Mon, 14 Aug 2023 13:04:36 +0530
Message-ID: <20230814073438.10682-2-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230814073438.10682-1-Arvind.Yadav@amd.com>
References: <20230814073438.10682-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|CH3PR12MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5d9ae3-5854-470e-6a3f-08db9c99095f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LjIUP2m+ysM+OFDhpWs0QvS4rmTynSKN7XAFpHeELGJXEIH03fzrx6Vcs+/sjOJ1cQLNa920DWJ38gHsTGtFpsJ8R05B/E4EkZpm4XFIlk7SGE2ImDNVADeyiXUpLGPcKh3b/X7yoysETchvvhBXE+gRbegswe/vRGk8hMmupOULuBwACXBvbsHIW664KyIoNIt+E11Aa9Op5x0phRd9IOsliIFJlXNgCKsM2dy8uizXZQBs6/lspy+bNPXlCrtBivYf03OFs6fmpTK/eQJeKDB2OKv/skLD1LBep5OCVhfII678eMNrvobBKIFpu1Y8ZraSuqktpWN3rK6kaW1czzbo6rarCAUzkve7O3hrkh5TI1jkUQ9T22bIgkprB7sdnvHvSwAgGrIiVWJf0Gk1GnBJeA4O52jGqFVXWEThiGHDpbs4RWXZuhtHif+MS45OyDlRMDav1wbRmgBw7mxQsVlVt8oYmmxdPd3/sCaF+YGvGPnBFpvF35vzRwwO9834LNtGfMadH36rSmmR1gpaA51qNfDBHJplyGdk+DyWcmsAExRAAokwtzcSjfwE8vTxEIEuVgxmHzbPPocgfjbLhZSREpeWptliFEOevBtMSS84UeXkATjtYmVVoLuhfLacBYKVatrbZtKEGKbfd4C8+3Y4ORWz5XP+IO3TOhJjGm3JOUo54W4oRnl/bkNz0Cc8ukZRr1lTp67dnHKOLjLrvnn2nHK5sTqvl5mvMy8SEhI+n/4ztKe126gRzCcK9LIyuQEYwX5fdI4YDed5FG539g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(82310400008)(1800799006)(186006)(451199021)(40470700004)(46966006)(36840700001)(16526019)(83380400001)(36860700001)(36756003)(1076003)(26005)(336012)(54906003)(478600001)(110136005)(7696005)(6666004)(426003)(2616005)(47076005)(82740400003)(86362001)(356005)(81166007)(5660300002)(41300700001)(316002)(4326008)(70586007)(70206006)(2906002)(40480700001)(66899021)(40460700003)(8936002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:35:30.3140 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5d9ae3-5854-470e-6a3f-08db9c99095f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8849
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
Cc: Christian Koenig <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a function which will allow to
change the GPU power profile based on a submitted job.
This can optimize the power performance when the
workload is on.

Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 156 ++++++++++++++++++
 drivers/gpu/drm/amd/include/amdgpu_workload.h |  44 +++++
 5 files changed, 206 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
 create mode 100644 drivers/gpu/drm/amd/include/amdgpu_workload.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 415a7fa395c4..6a9e187d61e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -60,7 +60,7 @@ amdgpu-y += amdgpu_device.o amdgpu_kms.o \
 	amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
 	amdgpu_fw_attestation.o amdgpu_securedisplay.o \
 	amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
-	amdgpu_ring_mux.o
+	amdgpu_ring_mux.o amdgpu_workload.o
 
 amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 02b827785e39..1939fa1af8a6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -107,6 +107,7 @@
 #include "amdgpu_fdinfo.h"
 #include "amdgpu_mca.h"
 #include "amdgpu_ras.h"
+#include "amdgpu_workload.h"
 
 #define MAX_GPU_INSTANCE		16
 
@@ -1050,6 +1051,8 @@ struct amdgpu_device {
 
 	bool                            job_hang;
 	bool                            dc_enabled;
+
+	struct amdgpu_smu_workload	smu_workload;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 5c7d40873ee2..0ec18b8fe29f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3672,6 +3672,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
 
+	amdgpu_smu_workload_init(adev);
+
 	adev->gfx.gfx_off_req_count = 1;
 	adev->gfx.gfx_off_residency = 0;
 	adev->gfx.gfx_off_entrycount = 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
new file mode 100644
index 000000000000..ce0339d75c12
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: MIT
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
+ *
+ */
+
+#include "amdgpu.h"
+
+/* 100 millsecond timeout */
+#define SMU_IDLE_TIMEOUT	msecs_to_jiffies(100)
+
+static enum PP_SMC_POWER_PROFILE
+ring_to_power_profile(uint32_t ring_type)
+{
+	switch (ring_type) {
+	case AMDGPU_RING_TYPE_GFX:
+		return PP_SMC_POWER_PROFILE_FULLSCREEN3D;
+	case AMDGPU_RING_TYPE_COMPUTE:
+		return PP_SMC_POWER_PROFILE_COMPUTE;
+	case AMDGPU_RING_TYPE_UVD:
+	case AMDGPU_RING_TYPE_VCE:
+	case AMDGPU_RING_TYPE_UVD_ENC:
+	case AMDGPU_RING_TYPE_VCN_DEC:
+	case AMDGPU_RING_TYPE_VCN_ENC:
+	case AMDGPU_RING_TYPE_VCN_JPEG:
+		return PP_SMC_POWER_PROFILE_VIDEO;
+	default:
+		return PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
+	}
+}
+
+static void
+amdgpu_power_profile_set(struct amdgpu_device *adev,
+			 enum PP_SMC_POWER_PROFILE profile)
+{
+	int ret = amdgpu_dpm_switch_power_profile(adev, profile, true);
+
+	if (ret == 0) {
+		/* Set the bit for the submitted workload profile */
+		adev->smu_workload.submit_workload_status |= (1 << profile);
+		atomic_inc(&adev->smu_workload.power_profile_ref[profile]);
+	} else {
+		DRM_ERROR("Failed to set power profile, error %d\n", ret);
+	}
+
+}
+
+static void
+amdgpu_power_profile_clear(struct amdgpu_device *adev,
+			   enum PP_SMC_POWER_PROFILE profile)
+{
+	int ret = amdgpu_dpm_switch_power_profile(adev, profile, false);
+
+	if (ret == 0) {
+		 /* Clear the bit for the submitted workload profile */
+		adev->smu_workload.submit_workload_status &= ~(1 << profile);
+	} else
+		DRM_ERROR("Failed to clear power profile, error %d\n", ret);
+
+}
+
+static void amdgpu_smu_idle_work_handler(struct work_struct *work)
+{
+
+	struct amdgpu_smu_workload *wl = container_of(work,
+						      struct amdgpu_smu_workload,
+						      smu_delayed_work.work);
+	struct amdgpu_device *adev = wl->adev;
+	bool reschedule = false;
+
+	mutex_lock(&adev->smu_workload.workload_lock);
+	for (int index  = fls(adev->smu_workload.submit_workload_status);
+	     index >= 0; index--) {
+		if (!atomic_read(&adev->smu_workload.power_profile_ref[index]) &&
+		    adev->smu_workload.submit_workload_status & (1 << index)) {
+			amdgpu_power_profile_clear(adev, index);
+		} else if (atomic_read(&adev->smu_workload.power_profile_ref[index]))
+			reschedule = true;
+	}
+
+	if (reschedule)
+		schedule_delayed_work(&adev->smu_workload.smu_delayed_work,
+				      SMU_IDLE_TIMEOUT);
+
+	mutex_unlock(&adev->smu_workload.workload_lock);
+}
+
+void amdgpu_put_workload_profile(struct amdgpu_device *adev,
+				 uint32_t ring_type)
+{
+
+	enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
+
+	if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
+		return;
+
+	mutex_lock(&adev->smu_workload.workload_lock);
+	atomic_dec(&adev->smu_workload.power_profile_ref[profile]);
+	schedule_delayed_work(&adev->smu_workload.smu_delayed_work, SMU_IDLE_TIMEOUT);
+	mutex_unlock(&adev->smu_workload.workload_lock);
+}
+
+void amdgpu_set_workload_profile(struct amdgpu_device *adev,
+				 uint32_t ring_type)
+{
+	enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
+
+	if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
+		return;
+
+	mutex_lock(&adev->smu_workload.workload_lock);
+	cancel_delayed_work_sync(&adev->smu_workload.smu_delayed_work);
+
+	amdgpu_power_profile_set(adev, profile);
+
+	/* Clear the already finished jobs of higher power profile*/
+	for (int index = fls(adev->smu_workload.submit_workload_status);
+	     index > profile; index--) {
+		if (!atomic_read(&adev->smu_workload.power_profile_ref[index]) &&
+		    adev->smu_workload.submit_workload_status & (1 << index)) {
+			amdgpu_power_profile_clear(adev, index);
+		}
+	}
+
+	mutex_unlock(&adev->smu_workload.workload_lock);
+}
+
+void amdgpu_smu_workload_init(struct amdgpu_device *adev)
+{
+	struct amdgpu_smu_workload wl;
+
+	wl.adev = adev;
+	wl.submit_workload_status = 0;
+	adev->smu_workload = wl;
+
+	mutex_init(&adev->smu_workload.workload_lock);
+	INIT_DELAYED_WORK(&adev->smu_workload.smu_delayed_work, amdgpu_smu_idle_work_handler);
+}
diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
new file mode 100644
index 000000000000..09804c3d2869
--- /dev/null
+++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT */
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
+ *
+ */
+
+#ifndef _AMDGPU_WORKLOAD_H_
+#define _AMDGPU_WORKLOAD_H_
+
+struct amdgpu_smu_workload {
+	struct amdgpu_device	*adev;
+	struct mutex		workload_lock;
+	struct delayed_work	smu_delayed_work;
+	uint32_t		submit_workload_status;
+	atomic_t		power_profile_ref[PP_SMC_POWER_PROFILE_COUNT];
+};
+
+void amdgpu_set_workload_profile(struct amdgpu_device *adev,
+				 uint32_t ring_type);
+
+void amdgpu_put_workload_profile(struct amdgpu_device *adev,
+				 uint32_t ring_type);
+
+void amdgpu_smu_workload_init(struct amdgpu_device *adev);
+
+#endif
-- 
2.34.1

