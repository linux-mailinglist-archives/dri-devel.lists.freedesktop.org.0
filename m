Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 648DB7823EB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DBB10E1E7;
	Mon, 21 Aug 2023 06:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC8310E1E7;
 Mon, 21 Aug 2023 06:48:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sp2wcvOM1YagOx6/faxppi0eXiTxw6kJ5YytwxHAUfBgJJgUmpT7ZiY5Gts3qRXFDZ1nvY5ZjUymaJsJnmUZftD3/BQmZyWSSWJ9RxsexdlpReEc0EJgCwVXCSvu9lUlXkH5Jjt+2njaBVN6ysK6oiI8hbNeIe9VVuAJwHM1wZWU9+RxDnwubmKVCZJbYVF/tFnj0BYE/1igVnMF2zDwO0nQ4dxYXqNVVy81z3D/MBBOKspTv9lHfySpGhzysn4vqScCjvONTE0qdKrhjf/0fVRyLByBUsTBWv0JYm1xMWeUUFhcT3A1hEhdFKvqAEgcCKu4vLj3NreONc4uwgpp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yq5mHPFnQ16ouU+uANEHFR06gHerCNL8e6qeQuTzM/M=;
 b=S7q5ZU4WeLBOKOsEaC3BoaoE3aN54P8rNhavpRP0kIuUQTjEH9nTvsTrlI41AEp2Atbrab5WfZD4a2vTpHf1v1xSxcZ1lGYBGhAOv/lDzi8QFgN6L+EIMDVoMOQVtmL1ZmX9jPW8tGs7tqJOnjqa05F2FgEJgySOUrkmOJl2d9OfnD4KEshv4oHRn46tLVJs0i016GR9RcK/u01Sq3YU0ZQxr3UCJ9puolNH9YIbuEuZsgIzxApJz891R6dgvmRYl7S91i7EoBxO4I+FH9jTcy8eghLkzno6eFHyMSzWSIcaupe8AY921beQtgAHdEmVW3diFT7wwGYMZnqQdO6BXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq5mHPFnQ16ouU+uANEHFR06gHerCNL8e6qeQuTzM/M=;
 b=UHDDtlTAy4iZcnEEV5K4/CsM6Y/iCHA7jUZzb/q0XmLQLaP/Ispjm2lONBooj3uEpyIyog665j7+v+JOfUlHnRkvwQe9trEeJF4ei9oDnqN0+FHEWSho1RwkuOkcOp/TbUKsK4qlHVArHpoqToveEuvHvh3gYsTf6bwqywnK35k=
Received: from SN7P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::27)
 by CY8PR12MB7435.namprd12.prod.outlook.com (2603:10b6:930:51::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 06:48:30 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:123:cafe::f3) by SN7P220CA0022.outlook.office365.com
 (2603:10b6:806:123::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 06:48:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Mon, 21 Aug 2023 06:48:30 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 01:48:26 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 1/7] drm/amdgpu: Added init/fini functions for workload
Date: Mon, 21 Aug 2023 12:17:53 +0530
Message-ID: <20230821064759.94223-2-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821064759.94223-1-Arvind.Yadav@amd.com>
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|CY8PR12MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d31cbaa-7812-4dc0-d916-08dba212a173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mDy/IdLHRz6Pt/1r+7aOZ6jPsxyEZ/VojcYV2Iy6vq+Xrf/n+8aAR+NCZHwK/W9mrkoijCv4LCDnvkzdpnKVTp7PSMpskAfWWC0uex27nd+iLvIIbWJCrvSI77ZIgvnN4oHWa3LOovQP1ce+5MPUcxcuVxA5ZwGT1l4pJIyqZcwqbZEefhvsTCEnL9ouitQDID/mmAC0Qzfg6kRIDiJ5tX7SDBSPMRdtRAtxKpIXiJ56BiLC3yRYqpqzRNrsLgfguuWXxnTYOuAfJ7mQVh6Hp8InAR0dblqiCR6axNBhwHE4mBmO78fPBgHpfBRa6/OXp5ydBEXoql7MxwGusVOWc7yPAUr+lUI1XxqzSfFsQe5Q9MBpT0JvNclXuCDc75ULVcGexYynhw76Fdv/kh/TirjOxoTPAx/5TPYswTm0pEI2RWM9/gwT2P7U1AKN1jTu15W2BAmGUkyoXvYw9wBbkG6iVHTlYQxcchXAJD8hGkza49PmtNj1lcN79V09CgnLF6fEdYrVbcBPizFn1EWreIxw9qJm606uC/iP4cQsr703cZfGrJ1qvIaWZ4rp7G9aQmp+tx4/a/8Wg4euL2hlghEvmr3HHDXsZHMwzg9ZXV5m+ud89XPpLaG8S7ASTp10wIkAYH+HioQuVtd4UFP2AGTuFJgoZncHp9EV6W5XYi/8vFVsQRH23deMIUNtedSqNYPUvaNYAq067CQeRxz3Net7sFrN1HfOH6x6n5YXh3PUC6HHtBXgz4ITSK3emlzsY34RwG5UO+S9rgvmA8JbuQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(186009)(1800799009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(54906003)(70586007)(70206006)(316002)(66899024)(110136005)(8676002)(2616005)(8936002)(4326008)(1076003)(36756003)(40460700003)(41300700001)(82740400003)(356005)(81166007)(478600001)(6666004)(7696005)(40480700001)(2906002)(83380400001)(86362001)(36860700001)(47076005)(336012)(426003)(5660300002)(26005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 06:48:30.4267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d31cbaa-7812-4dc0-d916-08dba212a173
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7435
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

Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
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
index 000000000000..5d0f068422d4
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
+	struct delayed_work	smu_delayed_work;
+	uint32_t		submit_workload_status;
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

