Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3AB90790A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC1510EB06;
	Thu, 13 Jun 2024 17:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cxhNzPzX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD8A10EB0F;
 Thu, 13 Jun 2024 17:00:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6Me/RjqdKFI/roSn+BYOS/qZjQR/+FQqJHI0jRFAMNjjZgIGbbv1jFVJppO2Nq1Hebq8kvVy0LbVhEUxqeQmqCLjKVIJVq9+wiu8jdmQrwmyvnptSxyDEeuMyrHyGOWFbFH6F/W4P8Xmrjl04+UGvoUNJ9it71b+xX2aNZlQYMBuAX48MAo4BgYDt5sg87fhVt3yGJHnpV6J83c2nNFl7Cj/2d6Qfpc8XbN8JnaPxmDDfCNOQ4V14MbzecgIae7qghj3VbNVicjx79QrYNEV6nId9Vra6iMvd8/mqQxkmHVTRm5BzTPLNt10QTfaX+RhYrFh1lHo1U9V14CP5klmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bo98WnsOcDQuuodKfVb7+IugZMSMpt0pnBibAGkSCYw=;
 b=GiE/b30OVtFjNBs5h46jNkKL7SunJdukJrG31vnhLVs0oe6Wzaa/jzDE+Q9JxPYwLFFWya07vDJYMBQ3jPm9b77pbVjFmNf/DFQqPKcYOrdv6QcHlLmjQ4qw8H42sqpLbODqiWJTr4aih8sJeriUGehaDs+WRtOegsay+TQ+jSeAUfGMzaTYQwL0gEgna0V5P4GcFYhVHQAbCXSiamqKkoQ88CmfcdI7vQu5Pm3sssLtGl5RHI7te5HYLsn5Ed3G9KgKIpaNRYKxQkletnLnEh1hVVh3oM/BiyN8s+2TdC59cESFwYpgCpM2spVDiWlFC3pPdczb11Tq6lYVsqo8Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bo98WnsOcDQuuodKfVb7+IugZMSMpt0pnBibAGkSCYw=;
 b=cxhNzPzXTFIRlxX3Kkgs0AyZIAUJ0WE5nj/2VF4ZakquJxFcuTeeQBmsFrosE+TVHGnIS6kytHveRp5+fLL+SEjHmVDaqFCiTLXWm34RZhtwDfQnj1uupFIMmeIqflKuSHYo/Vr84oO4nF/TVozAkavrfwPfDm7eG8BsfQ1qWI61q+X7zHda1zvzQEKSdRyJqFsAK8SHXB3+m6L9aboQeV7jV69b/OC9ZTjQw2d3BGF9pPKMj51+uzPBcmkFlymluT87KUCgQ0vsH6aJ0Zy4FhjllxHiR7L7DvEkO+Svi5VC44WW7zapZEYnFnW1oek4f/eWZlg95QELgFctCK0xCA==
Received: from SA9PR10CA0013.namprd10.prod.outlook.com (2603:10b6:806:a7::18)
 by SA1PR12MB8888.namprd12.prod.outlook.com (2603:10b6:806:38a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 17:00:01 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:a7:cafe::5b) by SA9PR10CA0013.outlook.office365.com
 (2603:10b6:806:a7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Thu, 13 Jun 2024 17:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:45 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:44 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 06/21] drm/nouveau/nvkm: add init()/exit()
Date: Fri, 14 Jun 2024 02:59:58 +1000
Message-ID: <20240613170046.88687-7-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240613170046.88687-1-bskeggs@nvidia.com>
References: <20240613170046.88687-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|SA1PR12MB8888:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b17b59-9a63-48c1-891a-08dc8bca43e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LcOkMGGV4XcdcxVRp4VFu3repM/BdgPs54DgSCeGEmRwl1DvmoMwjAIN3TCL?=
 =?us-ascii?Q?ObliMywCOXzUSRr6wEwgIScaPjoDjc/5azuDWzxVHAJz6M415UU0Why6KAg4?=
 =?us-ascii?Q?bUVwp5/iCuMXvvWHCuZSH2cijPgoG+MlqWShDbK6nwE3HBNjFZsEOBepdOmI?=
 =?us-ascii?Q?mgsoyZUayLpTiITAb9Lwe72H4QHWMgDFjOSXy8kkkwJX59ILPTTJ8hlqIewY?=
 =?us-ascii?Q?QGap/mx5zHDpKw3NPggpVvD32BN6jo0IyHoW9fMq+3hXFlVYG1ZC+jtyBuYj?=
 =?us-ascii?Q?gtSd26OsaGzGKY3wqU85XkjO9R8cpbfkOflfGomKQBBHZLENsSvceAL/rCLr?=
 =?us-ascii?Q?9DWq4rJj6m7CtGVpHWcWxbhupkB26YdggfLdib3V1W49maIslq6yZmJBUkTs?=
 =?us-ascii?Q?lU9fyV41Hd2+t2uOdIeJlOZ1nKwz9eCshpabsysLgfnfG/8hCHRRIPr427Yi?=
 =?us-ascii?Q?V1ngQqFBKMSeKknEfyKFMyEXZos/Mn0pAkSLoHDq9DrSI8futXhykRG2zAIe?=
 =?us-ascii?Q?MIp+nznfPWnkgOec9rcU9/d5bUw8wYJfIPMMJQuIE9ptmvKwQJ2WwRPmgo7i?=
 =?us-ascii?Q?8jqPnmLUpMJsfbLCzi6HLVbQu6G8Vg1reZP3M1jVx1k18wMg2TqEMnTVyOsN?=
 =?us-ascii?Q?BDne36/KIkm/nGRmUM7qceIwpIcJ0N1tp2k9iSI8NV64eAAlvOzr/ZDniVCw?=
 =?us-ascii?Q?QcA+VJP6kEMTn4v1G8Hh3X77lBR/UuGj+MosNn53PsxMCMRDH3ESArhKrdEg?=
 =?us-ascii?Q?p3hWRheq3xFPI1qshYc8N3yNDlEd7GmhavnEMro+S4cdqyS2G4QgG4N79tVY?=
 =?us-ascii?Q?rbvMixlf9RTSKVbe3TjfWaIvc+jQc3O48PddnACuRlaKg94OxyZh2MwMhBWo?=
 =?us-ascii?Q?Ui24dX/vXi6NbKFuP/wXIDUMhMin5S7RMIoizGMjeeYBnI5IEaYGmSGX8VV5?=
 =?us-ascii?Q?F2L6Kqkfngt73gqaf5kcC5jlm0jckN7sKNLrTsAOx6wluYvixk3S1mC/XI6A?=
 =?us-ascii?Q?Z/pQxlTNJn8tgiG2nNXOU3QTEulN8VOqgkQ3+ZW1GuD2YVlkVUpoX/900lK0?=
 =?us-ascii?Q?T344XCEyV5z7ptqdDzlPYjfi/PbBdkTFdgtsifWvPi7o1M4XbixgfVz2CpsK?=
 =?us-ascii?Q?2p1+B7f9zjkLrD/VxIuNrsmLTvPW7lwUvReFGYk70/b199vhJ019AKFaMl47?=
 =?us-ascii?Q?RsHr9u/etSqOYluLxCzOztGdV1BFlZ7lqTTFQrlpwrtUB1xKkFR1XdVHIwq2?=
 =?us-ascii?Q?bgjsZWuBlbQNPDqmCi96PJoi2ZdNojlQb8cqUL1nkCBTFI96iKAVPcorAdvl?=
 =?us-ascii?Q?aC/O95GEOENd/kB80MBXwNpeuqgF1CHbb6pvKBYd0M/naz+Yhb5VQTjmx5js?=
 =?us-ascii?Q?0N07fVP5a4msfTY+dvczU0c+bLtAheRYF7U3HXdowCoib4tjww=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:01.7172 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b17b59-9a63-48c1-891a-08dc8bca43e8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8888
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add stub init()/exit() functions that subsequent patches will use as
they move the pci/platform-specific code out of the DRM driver.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../drm/nouveau/include/nvkm/core/module.h    |  8 +++++
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  9 +++++
 drivers/gpu/drm/nouveau/nvkm/Kbuild           |  3 ++
 drivers/gpu/drm/nouveau/nvkm/core/Kbuild      |  2 +-
 drivers/gpu/drm/nouveau/nvkm/module.c         | 33 +++++++++++++++++++
 5 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/module.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/module.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/module.h b/drivers/gpu/drm/nouveau/include/nvkm/core/module.h
new file mode 100644
index 000000000000..5cf80e4deb90
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/module.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_MODULE_H__
+#define __NVKM_MODULE_H__
+#include <linux/module.h>
+
+int __init nvkm_init(void);
+void __exit nvkm_exit(void);
+#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 09947790f677..0bf39b05926f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -39,6 +39,7 @@
 
 #include <core/driver.h>
 #include <core/gpuobj.h>
+#include <core/module.h>
 #include <core/option.h>
 #include <core/pci.h>
 #include <core/tegra.h>
@@ -1375,6 +1376,8 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 static int __init
 nouveau_drm_init(void)
 {
+	int ret;
+
 	driver_pci = driver_stub;
 	driver_platform = driver_stub;
 
@@ -1388,6 +1391,10 @@ nouveau_drm_init(void)
 	if (!nouveau_modeset)
 		return 0;
 
+	ret = nvkm_init();
+	if (ret)
+		return ret;
+
 #ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
 	platform_driver_register(&nouveau_platform_driver);
 #endif
@@ -1419,6 +1426,8 @@ nouveau_drm_exit(void)
 #endif
 	if (IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM))
 		mmu_notifier_synchronize();
+
+	nvkm_exit();
 }
 
 module_init(nouveau_drm_init);
diff --git a/drivers/gpu/drm/nouveau/nvkm/Kbuild b/drivers/gpu/drm/nouveau/nvkm/Kbuild
index f68c19586b53..9e1a6ab937e1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/Kbuild
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: MIT
+
+nvkm-y := nvkm/module.o
+
 include $(src)/nvkm/core/Kbuild
 include $(src)/nvkm/nvfw/Kbuild
 include $(src)/nvkm/device/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/Kbuild b/drivers/gpu/drm/nouveau/nvkm/core/Kbuild
index 50ff041ecdf0..70cec7bbb018 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/core/Kbuild
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: MIT
-nvkm-y := nvkm/core/client.o
+nvkm-y += nvkm/core/client.o
 nvkm-y += nvkm/core/driver.o
 nvkm-y += nvkm/core/engine.o
 nvkm-y += nvkm/core/enum.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/module.c b/drivers/gpu/drm/nouveau/nvkm/module.c
new file mode 100644
index 000000000000..66d28465514b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/module.c
@@ -0,0 +1,33 @@
+/*
+ * Copyright (c) 2024, NVIDIA CORPORATION. All rights reserved.
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
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include <core/module.h>
+
+void __exit
+nvkm_exit(void)
+{
+}
+
+int __init
+nvkm_init(void)
+{
+	return 0;
+}
-- 
2.44.0

