Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B738A343F0B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19E489FC3;
	Mon, 22 Mar 2021 11:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E5089EB4;
 Mon, 22 Mar 2021 11:07:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtRCt+wlZJvLYYOgvH/te3oEpWHbqngWAeEJCt2sVsimTmhRMb0zPqKxFh43owxV9y6lItV70Cc2HREMtBF+4SnTE+IrXwoSrxwGswT6Qp6xaea6KYejBkmGLmrxedHbectLCj50508kv6GOrd6emFKBJMH9JGCqAIyqeKLq+NOeT6PzKGpXKkjtCeyz6WQgTqpieoXK2BU5INhE7x/J8nF7kO0w7XzP5hCIPQXo36qpJkG1KOPP0ZslozYpRnR9/sjX1wRut5Dobtj9meHQMGmZiKz+0h8+88XSOWID+x0QMZTPvK4JoX6O2sVleAiDUtSK/HqmmlpH1Nj4tARepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mACx5Cqe/3Man3BKcrkGl5gcwrFXhOoREcT9169rPXA=;
 b=ZOxeIRfnx8jhmH/A0Zb1gqB5l2aVDf57QsHid5I+DnVCIPD+ci4bDwypEtJIkB0oI3Q7rxB0F/JgZ4jzU8lEozFl3tJwebMqtfmDxTGJeDisaPOT5kwVe4k040ZPBmYOHF+N/5NQ1haViq0eRxkkt866vo9Lr8K4qilKsUqL6j9NsIwJ4hUlPekCRDdlTReBMqfimMwgi546KPX1GMK5PrIyuM3+pgzCdyYOiqwwmNUcrvB0bBpHbDMN/gbUjx0qhlTXF+vUT/dYdAUC3GDlvpJG4w+KO0NzrHtrpOber9VlByAbY28qExkZixctETSEyvUL5psxyFnJH1JlJSjh9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mACx5Cqe/3Man3BKcrkGl5gcwrFXhOoREcT9169rPXA=;
 b=btzn5JC214g20KsIMIppA7GRuVHCbSLfZRS/fGwkG2eXzobuA53IOK3yiUkAg583kv6NOIkS+X98IbBS3vzQHq21vqWtK1o2lzcKgRgPmd2xMkGwnaeeOZs/GnoWgc88fIyGHfWzPH0HZbataNYq7rhovIPj0YSWoU3zeiL0vm0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:37 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:37 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 14/44] drm/amdkfd: register HMM device private zone
Date: Mon, 22 Mar 2021 06:58:30 -0400
Message-Id: <20210322105900.14068-15-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 41f19750-44b0-4115-05ab-08d8ed22b391
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB36786386BA5B5F4E1B27C37B92659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7f1Yly11KNkjejkB6AMYKNO5CdrwqTN6VtUceys9iWOjwClMW0psKAb75B0AErtHOXprtJHMdvDfvr8bKGqTQtUwvqw/dRPA8qcpQF9effQoXscQkOdP1SkPaIJ+ZEPDFdxBPtnLnCGKz9K50Ej01fYFcQdklYw5ZmBV0IrY6Hb5k+l5pmCcqjBoifC2S+L9WJTjDytnawFopZKu/pgnKjabat8/xrdhH2cmdRcuj877xpeSM0Sfl8mgL1Oko3HpyszPYoWpPm6j393bl9Oh5aoFamhHdTYEJcVai8QQ6vpME62+jxQjANU6rLdd0OtlB+Pyn/q1DIWztqlCdkYGGPf32ZpDbcGeftUHK7LGXjd8peBrrpoq36u/s6oGUkVP0zF1Qu8iABzwDrA6+gTGbMeQtqFbPhLg2x9KZvPTnNVaPAk6jCIEK6BSzJL8KltOc7B7g1bnPqyyYqnFLnpSQB888aWGqX3sJ7KeT3szlpyULDVstfEwBWBjOf+cVy4yru+/C0+rh9Z7+RvrU4KJfxoeUr/dvu6FYBN5ywQQEz48t/rb1xM8SUkgWVzGYB4QVWLezHawbW9AVmA4SfHMNuJFYNUdI+fcuSy/yGyy2jWASzJLvIKx3uC4L3uswv30rIEC1bgJatucITbOd2c9fWtT3kfQMfgKTA6jHS7VS2Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(6486002)(1076003)(36756003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?s4zGFi/7w/h6n8SSX5AVt+NTUlxZ87hmfAb6tJVy04Jqi9X/DgYAgKHS8HlO?=
 =?us-ascii?Q?+VvKQ5lSrPGmXl+e0OfVGdhOmRRuutVAfUjrHBQ1rDnsCHCGRPFdIJLVD38Q?=
 =?us-ascii?Q?pcMI0epvMjbqNTuXX4NEFewkeMpDs6xYXBsCbqHyRkjYrKPpouZ/oseJKZ/S?=
 =?us-ascii?Q?Kzm2PG6ypqS+SoRnsyKGJcgebamJTiKU8qv0fXo8IPrHqr9aqA50ZxRW1JB/?=
 =?us-ascii?Q?8vSC/gaFKV31RN88VwoVTFvRIZIEHbD1VXVXp3Fnk1FA2vR9XesIqBxZ1cHI?=
 =?us-ascii?Q?YWUF6m5ZhyrAxZvXqPZstOQv81s+56bLdkXDxuzuwR18/fD1Zy6bp3wnsdn6?=
 =?us-ascii?Q?H6zNilPIGJYN2SnVd3p68uBEEoeLK6B5jOifH3tF6KL2vWEIosTK26m+Ni4e?=
 =?us-ascii?Q?Ok2261QTtUr3AHHouLkjmEoNImUWIHprLYtK1X6/nsllYMqmPvsdj6knHR42?=
 =?us-ascii?Q?YTSIWyRfIqIicSnBjqHtSX5JAFFYCA+gKlvnyGRiIx0zQR9kk8JWI1cwX/FJ?=
 =?us-ascii?Q?F25JMXcHoTPVXTen3GeQpanSP4B4anErlCmTf6qa5X8gn2DQaNLASM9BJBat?=
 =?us-ascii?Q?IzkzDnx6bBjmouFnVVAmvpRQKEpoWrO/LnsDPUfvVRVUP8csnI/W1QGZZYRQ?=
 =?us-ascii?Q?14W2K2u2MgUVt359y29pr1RcoIVKphFdL6xl5XzIMskJVJX41Jw9qehaS6Nm?=
 =?us-ascii?Q?pp587NfmMIxf0LY9woF2gl2kBgCYSAcP/N1PUhfwA71O2hID/dz5lXdJ+R9q?=
 =?us-ascii?Q?2KzdIszBhMrhFrUGzyVrCM3nUTNcb55dS/P8IJey3nGaGlPwkCO5FN9ZEJFV?=
 =?us-ascii?Q?OVTbo6Kf1870po7pYWPbKzkGbKaHAv3D/vUdE19BQf3fvNPShc9TfM2hqV1O?=
 =?us-ascii?Q?FMdSPbpq+6+5wgrFblAu9sc3DPQzg40VgTeDBP43TVjuq9EXdv+fPuNu+PxR?=
 =?us-ascii?Q?nPGRhP4ATYX2T4sb31o3HqYy4ImIzC+mcxcRYXqDr29eXEIkslqe2aT5OtHE?=
 =?us-ascii?Q?tx1uKriXdpVXG9funDbzG5cm7XV7eJkkoQWf9XQGvHtfizjkK3SnDqtgnFK4?=
 =?us-ascii?Q?6JBGXqjUxzrt83OGoxKiZZSf1p7wyJl/2KEsZoImAUahHckg3iBgpSZT5M47?=
 =?us-ascii?Q?PZs7smZvy3DqmmblLLg/hP4146FU7NuvIMadGN2j/wujTHGvABxvdQ5An7Gy?=
 =?us-ascii?Q?phnI6drYlHG0BsztmW/wyJdPyKhId4nVuMufrcaz/mRk7mkyIUMhzyvJluqy?=
 =?us-ascii?Q?4DRcKWDZVoi3Jg9nksy4PPMLFJH8o/zgqKJE3rfABoKvVUKzBwYpn6OZukS8?=
 =?us-ascii?Q?2LuJIahJXCYWdhBiaxa1ibVi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f19750-44b0-4115-05ab-08d8ed22b391
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:37.2103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U9T1wLu3b93zNtzcvUZbuRKDkTiwh2BMFk2ePsnu9CBQkkE0r3aSSgNrEfOB+0czFCsjIFWIYvv21Iey1XOlSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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
Cc: Philip Yang <Philip.Yang@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c |   4 +
 drivers/gpu/drm/amd/amdkfd/Kconfig         |   1 +
 drivers/gpu/drm/amd/amdkfd/Makefile        |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c   | 103 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h   |  48 ++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h      |   3 +
 6 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 5f6696a3c778..eb40b3879a0b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -30,6 +30,7 @@
 #include <linux/dma-buf.h>
 #include "amdgpu_xgmi.h"
 #include <uapi/linux/kfd_ioctl.h>
+#include "kfd_migrate.h"
 
 /* Total memory size in system memory and all GPU VRAM. Used to
  * estimate worst case amount of memory to reserve for page tables
@@ -167,12 +168,15 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
 
 		adev->kfd.init_complete = kgd2kfd_device_init(adev->kfd.dev,
 						adev_to_drm(adev), &gpu_resources);
+		if (adev->kfd.init_complete)
+			svm_migrate_init(adev);
 	}
 }
 
 void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev)
 {
 	if (adev->kfd.dev) {
+		svm_migrate_fini(adev);
 		kgd2kfd_device_exit(adev->kfd.dev);
 		adev->kfd.dev = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index f02c938f75da..7880fc101a3b 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -8,6 +8,7 @@ config HSA_AMD
 	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
 	imply AMD_IOMMU_V2 if X86_64
 	select HMM_MIRROR
+	select DEVICE_PRIVATE
 	select MMU_NOTIFIER
 	select DRM_AMDGPU_USERPTR
 	help
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
index 000000000000..4bb39c562665
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -0,0 +1,103 @@
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
+	pgmap->nr_range = 1;
+	pgmap->range.start = res->start;
+	pgmap->range.end = res->end;
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
index d66430740e52..755c0517867d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -322,6 +322,9 @@ struct kfd_dev {
 	unsigned int max_doorbell_slices;
 
 	int noretry;
+
+	/* HMM page migration MEMORY_DEVICE_PRIVATE mapping */
+	struct dev_pagemap pgmap;
 };
 
 enum kfd_mempool {
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
