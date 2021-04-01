Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1B3350DB6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E196EC3B;
	Thu,  1 Apr 2021 04:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C784C6EC35;
 Thu,  1 Apr 2021 04:22:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYI+qWrFLx1xDkbWJCLCvQJZFU+yiGfP57CXMqyZ67nMyAWP8gNLkn2fdpgTQswxYF3t5ikEI1pobXSf4Bx3nJ88nP+ywETCIptNUNw6N4UwvVP33enOjwaim1wTMdNW0q7OJRSvShEJfO/167tf1nuZZWT2TIX3vKVbnIBkOEQ9fonOA7gToZzxI+6eter+bNby+JJK07jC42/SaRD85LzRNIMG3bgkq5vW6/+pkDot7v/I5V/jGnUReRJ5gti6DS2T6L0HWsht0Ia3SFQol9RhNJMh9ZB9c5hZOZ8epFC5fgv1+QtpXhLL3n2SGt1St0lVlWB99WeeqBhdKXKbMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+K8p4gr3Ji6dwQ/DgElzvDV2jh0N1MUqRaaWhd8GvY=;
 b=kBEEL9LZHIY48tTmHqpxU4g5FXJusY7Tafsfpn9+VKTE16zRzEUtrKPo4AvQJ96WbBn4HXvJZfURiOZIgdy8+ZUb0g695VLSwaX+n8Cza2jq2zJid8hCzfjr0yFw4elNMOy1C5whSUPa9DlM/LR/r8jZkV2s4gKGHGCPKEJqFr7ZOMSYxdssRsOkNaEszdswCMbizUkTvAIGu6qbOnvY3fJ32GO00bzIayWfrqUY2zoDr4+gWR63L5nL+wNx+5EYzhJyLbPTRPeewURMB0z9LUTkgbBNL8jyuueZC7CsuCnecP1eYL89Y78k+3FKrO+/FHOaPv8sCmhrmUds2Ad6fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+K8p4gr3Ji6dwQ/DgElzvDV2jh0N1MUqRaaWhd8GvY=;
 b=IKYGfozbE+tfmxZPE7LmfFgbLuqYRF5dwLyvfq618e2nP0hix/mGNStUyGAuvHRk+wxomHA9CLB5iRuKcwF9jFdA6gRzjEPbs9bKq5NGq9Qe1/C4/01ETvpQMgLfYE4PxvwACDEr2ByyonD9o1deocouSPKs06sHI/8LXodEgG0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:54 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:54 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 14/34] drm/amdkfd: register HMM device private zone
Date: Thu,  1 Apr 2021 00:22:08 -0400
Message-Id: <20210401042228.1423-15-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b306836-9a48-413d-6f25-08d8f4c5d22d
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49165ECA4E9AC9217B58B877927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BnDpEkj1EnnXXcFsCYs3T5JXmADcMRFBjCTnoRO51m4k0qz6RzsrDEBYy1f0kEJTTeWMJ3hxlxO4RVj57s681tqMFI/0i3W/18liFL1TioqXxfHCYQGElxYqGhveFgZMvsnKYfHoGV0f0V+uDqAc+3FiDDBgEg5TMJybjx/4l7TVdvRVwoTdgKTMBGlzR5XIgJjjIE68GrN9AH01V7MQk1JNzrUpsYnix0DUfd2n8xQ09Gk8zLGTBoK1XMbQh2x3YemZ/tdbjW3X1qy3kuQ46OH6YJHNHi1SM+8Eu35Sp887BHDzXQOe9qsWEGdWNc8d9k0KGm9iJqErdTjR4meCRj1ARTbnSaHRN6KjQd/ACqEiJdb5mIgyE1IKivuX3hM0oEkGHGWmWWAyksh6+58Fl4c8M4Zk2ZghdRssCqrKlB/R+7sTTOtgYaq+Dq8ab+Kb2qlWtpLVBrzWP4g2xqTdl+2/ccqV7X/0UvvGQo1W2Gsqyyx6wlJPa+33imLFNOes7FpqD6+qLHjCm0KzjRgvJEgUzdFHPo+a3TayKyZIf1HyeB7wgpQnqWTXhvsCZJvnyIpifbuQdvqWuMtZbwTF16ROAuU4gFDcuskVo8lL0Mchhpx5NbnRM5fvvOCElhfGphg8h6eS72xXsWmvCAUgwsQc374/HCyEwcWUGXkQGnI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(956004)(66556008)(26005)(83380400001)(8676002)(8936002)(450100002)(38100700001)(4326008)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZNT3/1CCMI8iAV88Fi8nyo1pSr+SlamdTg7dB7q4zP+m6qouwLEfE1S0PsXH?=
 =?us-ascii?Q?gTYZ4UONxrgaaT8vZnvPrL1uikqVWBq/H55cbjFBXTqWoNZK6HWBiX005Iay?=
 =?us-ascii?Q?1Fpn6qB5mGuon/JvBnATC/pXq1d648jbYVO2pHuuIOTlRgUNE5aeLj35rLvC?=
 =?us-ascii?Q?keEjYnfgSlAKztJTvEEBNVMBr+0Qm0B6Ldx1o1Xg4SNP+TiobTUrXNN5gdWj?=
 =?us-ascii?Q?//K4yvIG98GYdpkuwypVAeJ4oPuJm+vCgaDsCTe7cez+/hsnUtWRFUfFY9hY?=
 =?us-ascii?Q?a/YGFeqDWZCEf8MDMECPACieHzHWumn3MQhNg8limN6R2Yh1rZRyxdENrwiw?=
 =?us-ascii?Q?penAeulzF5OXnhu1GvMITMt/bF2c4hz+eL05Z7ZDwRl2C56mKHQWfZCQ3h2p?=
 =?us-ascii?Q?Y7j9nrG4jNwZo8wEBvppPbKxQT2o6KTk4vX3JQS+8eYLtyqKqGOKZyQj9O34?=
 =?us-ascii?Q?YRetYS753Ig7FIbTRb8xzNCx/jad0ZjJ3nIwpQOif/7W3BHjUgqYfUJaHWMa?=
 =?us-ascii?Q?DP/KdebO463+gShT2kgE3OyfciFglqyg8ixaF5QwDHrFRih7H+hH+T8ARlUq?=
 =?us-ascii?Q?1e6iANyejfJDOEbzQNhyMX7iN9WaQugVMrHx52C4ofA8u4Jf04KRELUbEZE0?=
 =?us-ascii?Q?nsP2nuO4JwRxpg+0pjZMZ8Q8WLB6OcbnY+Ib67a4523SoEJOgvkxMUDvV4PW?=
 =?us-ascii?Q?9sI2UCFmA/TtCthKWcURuY/mFktl+BuuCHT+9bh1T6B5XzpoEdqiPEAP4U72?=
 =?us-ascii?Q?U0+JQ4GN+fyRpf8vrKIaAHV03DgJmNPtnKe2IrzcxlFMA2no/IUZvZ714CXm?=
 =?us-ascii?Q?tlFJCHVUERXRpRPyqnQqe7mBOgudW4vEIuNSnuyfudljT84a30C495MTlJmW?=
 =?us-ascii?Q?4xBtZwlRIpROL/eSJRcRUYsWrCdwt3VOY4Nu02m+r7TNRjz6GRpbG/9BFhzB?=
 =?us-ascii?Q?fmXhkv0CuZBvtM8qgu7aIQJgCKcaWJv3nr2BGJUUDUlM/FIFJECpSJolTwF+?=
 =?us-ascii?Q?MT6z/Yh91VXEeiJwa7mBo2tgAZJHrgM+DbyNE6nHkDHOfyFPDPaU10wFaYIU?=
 =?us-ascii?Q?0yZvbC+WkqJe/q+WyhWZw+LSzOfIu3zvmlqwDYLrOgPkYxiRQG5QA+vtgM0g?=
 =?us-ascii?Q?wmrfsLI2BGnjkKIhyPHiz+JGF/P+EMrM5lJO8MkuwbDqPISDMsqtuklO5Aif?=
 =?us-ascii?Q?CW0F9U3sCtO5WIuayK+dicy6L6Jk8J6xps8Wnk2nSkGgVLmM6MpzYsHtzs+i?=
 =?us-ascii?Q?EQRElSW4Jze+FePQ3cgpkhPDGC8WS2WbOAdt0Ab9+t7THTh+MZ6sVdV4axjV?=
 =?us-ascii?Q?BTNA0onPTleFSfWg78yYUtNf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b306836-9a48-413d-6f25-08d8f4c5d22d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:54.7112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Bh5tIFUaycDlIhLrh6u7X3TgviadxftEscvfd+wR3LJMgYkV0094XpFMWIY6JCYYqmC+fdjsyk7h5g/hRsYvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
 drivers/gpu/drm/amd/amdkfd/Kconfig       |   1 +
 drivers/gpu/drm/amd/amdkfd/Makefile      |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c  |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 103 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  48 +++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   3 +
 6 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h

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
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index f860cd705961..918aa03a9e27 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -30,6 +30,7 @@
 #include "kfd_iommu.h"
 #include "amdgpu_amdkfd.h"
 #include "kfd_smi_events.h"
+#include "kfd_migrate.h"
 
 #define MQD_SIZE_ALIGNED 768
 
@@ -814,6 +815,8 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 
 	kfd_cwsr_init(kfd);
 
+	svm_migrate_init((struct amdgpu_device *)kfd->kgd);
+
 	if (kfd_resume(kfd))
 		goto kfd_resume_error;
 
@@ -862,6 +865,7 @@ void kgd2kfd_device_exit(struct kfd_dev *kfd)
 {
 	if (kfd->init_complete) {
 		kgd2kfd_suspend(kfd, false);
+		svm_migrate_fini((struct amdgpu_device *)kfd->kgd);
 		device_queue_manager_uninit(kfd->dqm);
 		kfd_interrupt_exit(kfd);
 		kfd_topology_remove_device(kfd);
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
index 5c0efaaebd8c..ca1b0c518d46 100644
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
