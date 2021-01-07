Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA7B2EC89C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF126E425;
	Thu,  7 Jan 2021 03:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910EB6E3EF;
 Thu,  7 Jan 2021 03:02:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHFhuh5r85fyQploh9ptc2WcLT/6GMqWasdRJdJa0o+5TRw5oGB/dclFxrKaNf+xYdqle1zsX2/Ne6RLAy5vdywF/1nb+gwzg0niRNHBocsEH2PCRciM+c+qF+jNb+ee6mDS5soJJZJ1Nsvesa7tTQ28PIJw8M/Cl6wi/MyGhm94BYgMNTyphDblPxPJpACMEDKodV48H4UsFnrog6wvcd/6gpGO3i1/SMrpXXujhcjQp19lSbNdGOXxjkjIOvpOYELBeb6NIOo5SmVtmEDJARnBBXR7pNtwU/Fukpv5fAqlx8Mjf1cQbF+WHBvDKI0FsakPoayTZBvmgbifcGhk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYNX2yK6gQ5e9vD0axMjZfzC/31lPz2w8gHoniE3CHI=;
 b=ieaPdFICgT7uaWj6x9ILdCjQdmY2xyE1Oy2HYfhXQ+UW4vU1Nhk28UzSYFBqefVvWVjfgtofovRqapFtjY1HqhOCu/jIHSwZDLvzPp1UXL5/Zx1L4F8emSxJNW6vNxBREW8bSLk80NfZHSWOJQ2dM3c6f5HSglANwgkDm2xcyovXcXnoDVvqz+kdz3ty42+mb/QFHRFHxkuV6SuqzLL0ylcRc5qajvwrKKUtsiwa4d+TnRpIVKnavVRv7IsujA4cLfN3Lnc60dAIhKs4Toi8GdQ6Z3PNjWCi5mbzA4aDO81PlVgxjFmwNJWmE+YTc0sC2ZjysG47DSoUgIKwHrtNrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYNX2yK6gQ5e9vD0axMjZfzC/31lPz2w8gHoniE3CHI=;
 b=e+9+77pZvgJxt8rkyZ5KhdHyWxk0d31G+Tu5xS8vbTxnWvzGykp58f/yyhjAQou/c312uhDzelx4jEjgHA0v/UCWvihM6OTTvGHBU3qUEc7zu+ym/U4yrYYVPnwc/MxyiOem5oU3glIMgjVXMVIXydNtEGUtriPPP9FCxDNIfjw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:58 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:58 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 17/35] drm/amdkfd: register HMM device private zone
Date: Wed,  6 Jan 2021 22:01:09 -0500
Message-Id: <20210107030127.20393-18-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f9c88bd2-cf3c-4406-0336-08d8b2b8bcce
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB399998B2B63D6534180C25EA92AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zwRC7MWlP+mEE4ojHNjYLB2ScU6BaUpKlpJgLmFrbZolnGQdmhMYaE5xnPO7XuyJ64UKhw4r7w1QdxJuWs01cKpPNAb7T9iFavqxciXPJ+a5O7wtiQPaTPYDYCrOuTERqH3jLfEdvL4Fyu4CRjeeDZHTAV3X4DAtrLlj2gTNKf+gORJzJ8egpLzoz0OIy1bTWZm5dmkgurwK7lEfKVLZD+onpT/97DTLy3o3tTrUWtNG6QGvkUmxT3AvdYFZg2lkk1EJgd34kKzgyN2y26xbYgbrJiWxypx9oc/rIYgsjyHjSviC/EoljuuEWBvBh2NUkHGoKr4JzdWRlzKmSR2HsXBL17co2GSvt/6Ou7XEqVTsW+MR5cT6RQHLEpb+kFG18oZkc9RpBBrSRs76bLZaTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sEABZGU0LKchRMR7lma7eU7TtKjGwWT+xF0FteNFjTNaNjMXvChhZo6Oatpl?=
 =?us-ascii?Q?c0fp6vaMcdG2dE6I81r655COST/3jZiOUiKHXFFWOXpmE7A1P9UlcXaYnOP8?=
 =?us-ascii?Q?WNwf+4GDA3ojpLrU2Z6hoW3rt8xtK2uZHa4EuIpmnZmgB5FEQwh/NtJjcqe3?=
 =?us-ascii?Q?eiKgHc/rJKpCa1ddgKQHCBo4GzVsAoHKNh9yILRLNgZk9dynmGHaDzY+Xy3H?=
 =?us-ascii?Q?VPE8S2mElHWjqMoVG4ENIqLqXaDCZwknwM13wC6eaM7zmNFAm545NdAZHrG5?=
 =?us-ascii?Q?WI1ZZu/flkyD01BXAmEe6pRhAeAwPeDYg79UBoa4dnEbDlJ59raZmeTsaKN5?=
 =?us-ascii?Q?UVdYfHbjLBszGgN4IdGFOZbtqKXPhR71g/W4STsqc2xuV/MFeeUR2C/D/pcq?=
 =?us-ascii?Q?6UWS9JXYMaHljDs8+9BzM8H9pn6xVubvHIAsLjk1ze8jXz8uXVEg9kEGzka9?=
 =?us-ascii?Q?NpidUetnb0Dp8ONlHzw7dDLu/3DQhhVOz/A7yaXETVHZ8bg3H79ztslad0LJ?=
 =?us-ascii?Q?8umv0KWetOU2w9atoy3LQDZKDznBCLter0szMxG3TicXV7vBZkqN24q7tFg5?=
 =?us-ascii?Q?42zCeFFlNmAjqrJrrbLpMZE/dzoK7JAD6WEgebyGTnhV163UYdoT9c5rBb32?=
 =?us-ascii?Q?N9MrMGtdz3d85snmjgXzVexugAwyUWhS36OI9pUun+K6tcoiocZSCB+Nqkf8?=
 =?us-ascii?Q?rmH7YFxkzadB66+CeYdtA7TcNGi5qOWW08E+WzLmYalHszWPJmPjrIu/35bD?=
 =?us-ascii?Q?q1l2ppO++/WIVhvEfVrD5VAGtZrm3e5tvwBNmtovMiDDU7SKvURhYIU5FLvw?=
 =?us-ascii?Q?YCTpQYs8oMuBEB/mxQHcAF6PTDRsIV3LhgZmVfv3i6tD93x2CwwgfaCDyrBD?=
 =?us-ascii?Q?on5tZzfhBL77slsPdGnjcJx9NMzBZeU7h33vOB9e0JpTjDKn3xRW8r7bpijr?=
 =?us-ascii?Q?INsNSYySC0ane+3xMZLlIf15AUT0hFzXmoevtxXm0mWzETpvB/G+lwOSmF8A?=
 =?us-ascii?Q?vcPt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:58.2138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c88bd2-cf3c-4406-0336-08d8b2b8bcce
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OiRAn7OutGhD1x7p/DaYZSb/Vilod2dWqcj4PwwRN7bOSXrW0alsVY1gBMwH5VJbyQ1udJrR3R6LbmLfxVK8Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

Register vram memory as MEMORY_DEVICE_PRIVATE type resource, to
allocate vram backing pages for page migration.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c |   3 +
 drivers/gpu/drm/amd/amdkfd/Makefile        |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c   | 101 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h   |  48 ++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h      |   3 +
 5 files changed, 157 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index db96d69eb45e..562bb5b69137 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -30,6 +30,7 @@
 #include <linux/dma-buf.h>
 #include "amdgpu_xgmi.h"
 #include <uapi/linux/kfd_ioctl.h>
+#include "kfd_migrate.h"
 
 /* Total memory size in system memory and all GPU VRAM. Used to
  * estimate worst case amount of memory to reserve for page tables
@@ -170,12 +171,14 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
 		}
 
 		kgd2kfd_device_init(adev->kfd.dev, adev_to_drm(adev), &gpu_resources);
+		svm_migrate_init(adev);
 	}
 }
 
 void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev)
 {
 	if (adev->kfd.dev) {
+		svm_migrate_fini(adev);
 		kgd2kfd_device_exit(adev->kfd.dev);
 		adev->kfd.dev = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/amdkfd/Makefile b/drivers/gpu/drm/amd/amdkfd/Makefile
index 387ce0217d35..a93301dbc464 100644
--- a/drivers/gpu/drm/amd/amdkfd/Makefile
+++ b/drivers/gpu/drm/amd/amdkfd/Makefile
@@ -55,7 +55,8 @@ AMDKFD_FILES	:= $(AMDKFD_PATH)/kfd_module.o \
 		$(AMDKFD_PATH)/kfd_dbgmgr.o \
 		$(AMDKFD_PATH)/kfd_smi_events.o \
 		$(AMDKFD_PATH)/kfd_crat.o \
-		$(AMDKFD_PATH)/kfd_svm.o
+		$(AMDKFD_PATH)/kfd_svm.o \
+		$(AMDKFD_PATH)/kfd_migrate.o
 
 ifneq ($(CONFIG_AMD_IOMMU_V2),)
 AMDKFD_FILES += $(AMDKFD_PATH)/kfd_iommu.o
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
new file mode 100644
index 000000000000..1950b86f1562
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -0,0 +1,101 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
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
+ */
+
+#include <linux/types.h>
+#include <linux/hmm.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+#include "amdgpu_sync.h"
+#include "amdgpu_object.h"
+#include "amdgpu_vm.h"
+#include "amdgpu_mn.h"
+#include "kfd_priv.h"
+#include "kfd_svm.h"
+#include "kfd_migrate.h"
+
+static void svm_migrate_page_free(struct page *page)
+{
+}
+
+/**
+ * svm_migrate_to_ram - CPU page fault handler
+ * @vmf: CPU vm fault vma, address
+ *
+ * Context: vm fault handler, mm->mmap_sem is taken
+ *
+ * Return:
+ * 0 - OK
+ * VM_FAULT_SIGBUS - notice application to have SIGBUS page fault
+ */
+static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
+{
+	return VM_FAULT_SIGBUS;
+}
+
+static const struct dev_pagemap_ops svm_migrate_pgmap_ops = {
+	.page_free		= svm_migrate_page_free,
+	.migrate_to_ram		= svm_migrate_to_ram,
+};
+
+int svm_migrate_init(struct amdgpu_device *adev)
+{
+	struct kfd_dev *kfddev = adev->kfd.dev;
+	struct dev_pagemap *pgmap;
+	struct resource *res;
+	unsigned long size;
+	void *r;
+
+	/* Page migration works on Vega10 or newer */
+	if (kfddev->device_info->asic_family < CHIP_VEGA10)
+		return -EINVAL;
+
+	pgmap = &kfddev->pgmap;
+	memset(pgmap, 0, sizeof(*pgmap));
+
+	/* TODO: register all vram to HMM for now.
+	 * should remove reserved size
+	 */
+	size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
+	res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+	if (IS_ERR(res))
+		return -ENOMEM;
+
+	pgmap->type = MEMORY_DEVICE_PRIVATE;
+	pgmap->res = *res;
+	pgmap->ops = &svm_migrate_pgmap_ops;
+	pgmap->owner = adev;
+	pgmap->flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	r = devm_memremap_pages(adev->dev, pgmap);
+	if (IS_ERR(r)) {
+		pr_err("failed to register HMM device memory\n");
+		return PTR_ERR(r);
+	}
+
+	pr_info("HMM registered %ldMB device memory\n", size >> 20);
+
+	return 0;
+}
+
+void svm_migrate_fini(struct amdgpu_device *adev)
+{
+	memunmap_pages(&adev->kfd.dev->pgmap);
+}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
new file mode 100644
index 000000000000..98ab685d3e17
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -0,0 +1,48 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
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
+#ifndef KFD_MIGRATE_H_
+#define KFD_MIGRATE_H_
+
+#include <linux/rwsem.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/sched/mm.h>
+#include <linux/hmm.h>
+#include "kfd_priv.h"
+#include "kfd_svm.h"
+
+#if defined(CONFIG_DEVICE_PRIVATE)
+int svm_migrate_init(struct amdgpu_device *adev);
+void svm_migrate_fini(struct amdgpu_device *adev);
+
+#else
+static inline int svm_migrate_init(struct amdgpu_device *adev)
+{
+	DRM_WARN_ONCE("DEVICE_PRIVATE kernel config option is not enabled, "
+		      "add CONFIG_DEVICE_PRIVATE=y in config file to fix\n");
+	return -ENODEV;
+}
+static inline void svm_migrate_fini(struct amdgpu_device *adev) {}
+#endif
+#endif /* KFD_MIGRATE_H_ */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 7a4b4b6dcf32..d5367e770b39 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -317,6 +317,9 @@ struct kfd_dev {
 	unsigned int max_doorbell_slices;
 
 	int noretry;
+
+	/* HMM page migration MEMORY_DEVICE_PRIVATE mapping */
+	struct dev_pagemap pgmap;
 };
 
 enum kfd_mempool {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
