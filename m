Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41E078B020
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 14:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0FB10E2B3;
	Mon, 28 Aug 2023 12:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE17D10E2B0;
 Mon, 28 Aug 2023 12:28:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUoq1/jdYQ1MXPlVxpq8mDUE322LYWGgRcRjuEpo7ueTIFIOQkWreOwvEuDV33L0co/OK/D03dX+Ozd4MglsjInV4QueIvWSTLe5YThBb4HNVFFyxXZ3WO9OWQRb2HHVvAJ6fBWokiBkC4qAXvNHY0pTA7EVZK9k/X+6/1R3Sz2uAE/+b9lqZE60kZjf3kpUoTzl8Fa16s0WGVCCUlzpMDfWcZNpWfb4iWZzm7ZE4oIsuP3oK2Ec4IFX8MpkWR13HqrXhC75XwzbLa5mdsreR4r0xyGmE2ZAsYp/rE7uXhz0EE1vePeQtq4lEECMtkni13NjR2mZAhqd6oPfIXgTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wl5e9WF0WM/ITv15mSoGjC9UNEgvWVN0vwHlrGio98I=;
 b=aIAZdxOF95zECbITy4gosb3poy6D+GO/+o5zoFN8s/3oNSHhuceAkQ5LqNu/uru5o0aRa4xKEqPcG0eTWl4fwOqGA0JxFdH6cThI72feb673h6FDAmY+RU0/LUuq3gIDut5iKZBBslU9iDm/wMYwGcA6tqTMxZZx48zd4/9zIVv5fyDqVYMk+KPPteMQsOoTRZNue5SkTyDOsQxjxhu8JIDIgSXDczOavEvsZ/vmWRQsXK0Orex636ixTLMLrmTMGoGNgxH1wDiRJABQd3ET/28XqWtnvgANteTj10FMbH3HhNvYR2YhXOk2e0F0ugIooPE1DivAEeP6gznJ2gxqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wl5e9WF0WM/ITv15mSoGjC9UNEgvWVN0vwHlrGio98I=;
 b=aDKEImvs7j8cbJr/fwDml2sfL8xfbaKba2ugc5gvAnseEfWh2RjO6EaycrWK+jhWjWKZ9LAFG1iDQ57NDNnHl/f9w0cY2T6OzT7hc7E+FsSLfeI8B3N+IFR6YmZu9oMdDAuN8lvRbx+g4VZhg+7mM5SP/2KOdrwG+I2gyP29rBo=
Received: from CY5PR22CA0038.namprd22.prod.outlook.com (2603:10b6:930:1d::6)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 12:28:09 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:930:1d:cafe::13) by CY5PR22CA0038.outlook.office365.com
 (2603:10b6:930:1d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34 via Frontend
 Transport; Mon, 28 Aug 2023 12:28:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.83) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Mon, 28 Aug 2023 12:28:09 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 07:26:58 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 1/7] drm/amdgpu: Added init/fini functions for workload
Date: Mon, 28 Aug 2023 17:56:08 +0530
Message-ID: <20230828122614.3815122-2-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
References: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|MN0PR12MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: 8361316d-a7cd-46cb-4426-08dba7c23cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eDdLhAPmaHmILqZyKQcv3QqYBOOB68Emjja/16/OYmRPlQJ8k5opYlemJnjNHd75Vr6wEHWH3IY2NLdsJcSHhAMtkkzYbCjo8YO8J2fnXgrKjLxhYw0I5887lMuL4dX1OSdQna9uueMVXYwsMSwYfiol1/Ws2dQZfP0pbqEzixx0eALmPzJI17UTJeGH0dncE2va5dGwb/i3MfU2xAkIDot79zMnUBxg1VSTV6gKZE9r6L5b9X69orxFxHjyvXR169fqKZ1t0PmRgSEKjSawqg45oUtx5YNA3TjPwDVNLZ5k6AY+AQzIuML10jsIWjkyc3oEvblcBajCs2eqnTZtYAFRp/GohRxQ8Mq4338xiIrdr9abtXneHsmlbKIxxkQ1I9KKCvDwaAQC1iV12AaIAYHSJb9L03rda53lNGikTOeVFbFtlskltwE+knOTn0nfTtZ6hHhHmUGbPBAzcJiFU6c5omMQIr2v/DPNYWyXoJDeAxpIB5Bg346abhpFRgDEoDuryMzO0iH9Ivj46kS+MU2H6bxjptxBNZzz3r0NdPBWOfHtY81YHZc/zuoIe1f8d/XkngjdxT74ohTAY+ZSPD0DNG7vSAdOyVeLH2Purb7N0KAOTauEzoG+BVmj1HjQ+mD0GQpNUrj9BqxYA+moQQz0FJdtlCEvg0AgZf2/qP4xbSlEj2eRB279EmDkuvc6QoIzxwYxIcObPlYffGS6YLYALgwZtPaNoiEhgVjH3Url7nhvi3QIa5uXN5RLSnmsUqGDPKgP/JjJt97OkY5F9g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199024)(1800799009)(82310400011)(186009)(36840700001)(40470700004)(46966006)(83380400001)(478600001)(81166007)(356005)(82740400003)(16526019)(336012)(426003)(36860700001)(47076005)(26005)(1076003)(2616005)(40480700001)(66899024)(7696005)(6666004)(86362001)(2906002)(316002)(5660300002)(8936002)(70206006)(4326008)(70586007)(110136005)(54906003)(41300700001)(36756003)(8676002)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 12:28:09.0975 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8361316d-a7cd-46cb-4426-08dba7c23cff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The'struct amdgpu_smu_workload' initialization/cleanup
functions is added by this patch.

v2:
- Splitting big patch into separate patches.
- Added new fini function.

v3:
- Addressed review comment to change 'power_profile_work'
  instead of 'smu_delayed_work'.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 44 +++++++++++++++
 drivers/gpu/drm/amd/include/amdgpu_workload.h | 53 +++++++++++++++++++
 5 files changed, 105 insertions(+), 1 deletion(-)
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
index 5c7d40873ee2..cd3bf641b630 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2243,6 +2243,8 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 	adev->cg_flags &= amdgpu_cg_mask;
 	adev->pg_flags &= amdgpu_pg_mask;
 
+	amdgpu_workload_profile_init(adev);
+
 	return 0;
 }
 
@@ -2890,6 +2892,8 @@ static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
 {
 	int i, r;
 
+	amdgpu_workload_profile_fini(adev);
+
 	if (amdgpu_sriov_vf(adev) && adev->virt.ras_init_done)
 		amdgpu_virt_release_ras_err_handler_data(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
new file mode 100644
index 000000000000..32166f482f77
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
@@ -0,0 +1,44 @@
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
+void amdgpu_workload_profile_init(struct amdgpu_device *adev)
+{
+	adev->smu_workload.adev = adev;
+	adev->smu_workload.submit_workload_status = 0;
+	adev->smu_workload.initialized = true;
+
+	mutex_init(&adev->smu_workload.workload_lock);
+}
+
+void amdgpu_workload_profile_fini(struct amdgpu_device *adev)
+{
+	if (!adev->smu_workload.initialized)
+		return;
+
+	adev->smu_workload.submit_workload_status = 0;
+	adev->smu_workload.initialized = false;
+	mutex_destroy(&adev->smu_workload.workload_lock);
+}
diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
new file mode 100644
index 000000000000..dc12448764a3
--- /dev/null
+++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
@@ -0,0 +1,53 @@
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
+	struct delayed_work	power_profile_work;
+	unsigned long		submit_workload_status;
+	bool			initialized;
+	atomic_t		power_profile_ref[PP_SMC_POWER_PROFILE_COUNT];
+};
+
+/* Workload mode names */
+static const char * const amdgpu_workload_mode_name[] = {
+	"Default",
+	"3D",
+	"Powersaving",
+	"Video",
+	"VR",
+	"Compute",
+	"Custom",
+	"Window3D"
+};
+
+void amdgpu_workload_profile_init(struct amdgpu_device *adev);
+
+void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
+
+#endif
-- 
2.34.1

