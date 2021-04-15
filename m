Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3F435FF53
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001436E99A;
	Thu, 15 Apr 2021 01:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E260F6E9AB;
 Thu, 15 Apr 2021 01:24:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFpFA9oTfxE/eoy6i8c2TsksZRfWn3VktM+QVyNdP9GwORrbFjhdJ+QW0zB5uL7AlVFlrP07pd61XwpU7zmHNl7RP4s4uCnI/J5IYg3SQZLEBZHbMo2muKYeEU3tDukCdh1QVk1N3EFUIxhRhKRdY1s+DXyC3vutkadlOlICUNV8/6mzJQ9+WQZJQau4zjokGu9ZmRks+YcOPu/teQ30LRws1duyhKKobux/SkEjicSlto7oJpSla199nK7YSxP93G2crRaME3oSUEZIZH02S+RN+elzoOyaXHZ0OBzE/k7N/fo6N5NCL1Rhnv/NJppo9yHmf3+NSeNaOM/w0wu7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDRYLubAR5EYI5yjWJjCJx/6o+jDlnFw1qGG2Z8KcdU=;
 b=esD2Upwr5itXoV1SzbfhQowuZjf7QVptA5/TLSAmnv4/jqIQM4yycP54yiNPLDGaZubncjAfxjeQflrDoTPtTZnmHKvvcaVYKQNmuUsb0jSo2Pj1cNmp32Qu+w2iTTxRl8XAz2LKsdkzuJlGiyG8tHa9L2Z/J19Ivewa/8yARX3LMaiQjkY/IgSlNLvohCedU7+tArEQ8/wpms2Ld83Y3x/S4tx0R+Lm3OqDG4ZtV7fK1u9P9i9bAn/efM77relcUl0ImzlAOrE4qF/3/riTw7KGhrwYxQKrwmR+gugPR/q2nfMbM7dWw73/67ayrBr7R8OMyChyqZGlgZaFZW3v1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDRYLubAR5EYI5yjWJjCJx/6o+jDlnFw1qGG2Z8KcdU=;
 b=vn35GvPNu5WHvE/UdNj4uw2Y++oqLLodbk3I+lZB+HWFtH9G4DiclJxLMlX3Kbuo0jJSoEQTUmuds4Rx/HSb0B+lJFkV02w/Ig+u7VNQfIijHqkziAOuw4Nm1Qqkh40WSvg++ywunobh31VZPjbI3WSwAGs1NW7dP/BHMc5DWMk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4797.namprd12.prod.outlook.com (2603:10b6:208:a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 01:24:02 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:02 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 15/34] drm/amdkfd: register HMM device private zone
Date: Wed, 14 Apr 2021 21:23:18 -0400
Message-Id: <20210415012337.1755-16-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71dfa49d-8d79-410a-5d85-08d8ffad26bf
X-MS-TrafficTypeDiagnostic: MN2PR12MB4797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4797FCCCE7A6F6A5C9B7E7BD924D9@MN2PR12MB4797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ICcxTh6IkpHRssGcW7LRhKCdYGEe20bwXshOaXMOl/nrA3k6tLU/nvT3QnDSE82N3tSJxR5c5psZBuzPjxr0+DiN/H0+hSVOJxjsEn5kJCW5NlTqwV3nxK00tkOiUCCI02shjMImjGyqzRPLvcy4Ab1bXZo/NNbTktpQ6FgScVUHXd3D8KLkHJoCyvKagcgfBGnmkJ9PwdCRU+D/Ibe0rOjNVNk0UkxQu9s5a5Gax4sUn7oxDITu4EBFktekQ9V1uFwsNjJZUI1jFGeYeznDeal2hlAOYE/X6pHvCbMbr5TzkOsuLNKu43yepLhN/seFOug7szsmzsbSU3w03A1FnqjVLEizJtkEMha+N03DX7X+QKQVoDCNGyvO15mu/xTZjOQ+q4IkR2KmPM/MtR4Eg/lgsGdzr0vIROEyQ6Dj4tETl9OSYJuOm8gfSVKJvp1Zub9Ew3JHzxReuMhxkHv+fNWPEdlMPsuNiGJODNLJ2exVL/oal5fQDQCWRzVNfHAy5ZI99Gm2zLqUHsiGkAR3dSbV+Ug9LHJ9Lu6/47JC5W+LelqtYFyj+FPI1PYNHwAlL91SXKIpBrSQr68x8J3poIEGsP0oD7BREMBMtoMJcNkXxvQ0lPnHINj65oD2X4cg/ft5Fybgt+0cawvZj6dyLFJGRL0tG2q/VVdcgZPslzo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(86362001)(66476007)(66946007)(2906002)(38350700002)(186003)(36756003)(16526019)(450100002)(38100700002)(5660300002)(83380400001)(66556008)(4326008)(52116002)(7696005)(478600001)(6486002)(8936002)(2616005)(8676002)(1076003)(6666004)(956004)(26005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6ZZCUo4X3Gg9RNqq96yhytpBMBvfRVBKr//YB+BFA83hqx/gmjbsZyBihk+r?=
 =?us-ascii?Q?JwWiCPDPgDeRfYE+w7tIuFEjhcYMmeENv4eTXaCAIff6rAbDwKOKnjJkthOs?=
 =?us-ascii?Q?AU/JV/6HPE+/iN5SgWp7gsd6uu1ZpF0b+q7MBwvtg/0BK49Z7Zgk+UHmbZlr?=
 =?us-ascii?Q?u1oDx1AxJSJpzdo/9975K0l7+5VILDtCNa21VnAcoY+4Dh7NVa2GkxcHGeU9?=
 =?us-ascii?Q?1Y92Ob5txULEgLAdkWVnnaEUT+qdj00zRTYouhGFe7e5eJt4W0p3LNesL+Mk?=
 =?us-ascii?Q?CKczMKKG8Yy72+v+t73Qa4n52oIMkiZskrMF1bVnRvNonu/9zjJZPbL1cPaz?=
 =?us-ascii?Q?Pb8X41cMzMlYMRF/vDfYu39/ARNY2y3BSJqDu9MXzt27WsP/RE7oqfuJKAnH?=
 =?us-ascii?Q?t+zlXW4rB0qNEKHX8E534macFIwYXZk2hJJY7O0ckpawqqxijkrNPDI2fqM0?=
 =?us-ascii?Q?csMb9JNEC4PAob/K+/i+2DZxh9r9gaPXCA2heImdy3VyfKiBsiaS/HKmGkTr?=
 =?us-ascii?Q?1Bsbzqiq5BlPLRgJdYmKqjGrShL4ZnUGb8gv3Ea4sZvOWPk75VCFNocpL3Z+?=
 =?us-ascii?Q?MhggTDU3Wmhqe3e3IYry90iECy0XRQcwZ17W3zpUaPgvcBhB7m5fpiIFREUA?=
 =?us-ascii?Q?kEEIVWY294VcsL3jYVYvRsIoBnThDSyT5+Rsl2Gt636gHP9Lkt2I7F0hVZjS?=
 =?us-ascii?Q?goHeDuzoWrJJwU0PA57fwujStgdyNTDu7UPC7TniWyVUGDWCRPUZ1gmV2xRC?=
 =?us-ascii?Q?e7/MeTsrlRbEObYYyvcSlApLmNlB6t2HZJSce+3eG565THI9SUJR/1XSwOFX?=
 =?us-ascii?Q?+e13YM7S7JVexIb8ZP/ZHR0QwslCDoLF0UTF2TiOu3bCN5igsVgkUbE9RbaO?=
 =?us-ascii?Q?dOA5LoJk17a910uuhqJeul9F4Q0O1djtjYyo616iZppB84bhbCOePyedGkLY?=
 =?us-ascii?Q?uLYxmD0Xqj0wzFEj/IpZxci5AmE505p/ASNnFytIEdL82dgdQTrqRMI36rJ1?=
 =?us-ascii?Q?qflWODiDo4Mk2rbLv26OMaE9IPkMKeHBXUpfeSt/rtwF7rS3ENtvzLJ6AoDd?=
 =?us-ascii?Q?cxNi9oh8FpOoR57LDTxAeVpg0ybWbUItqn4YDvP6kugTsguDvGskos3l45a9?=
 =?us-ascii?Q?zGaluqzCd+H3HiqqGiS+mgV+AVLCzMo+uI/SROGIenJQglDiLCSFpvhxePTu?=
 =?us-ascii?Q?9hGqoIgWmAuubCu2VRyLSslymNpRCT2zDZPnyFxbXkBmmxVV8MnYNO7L9WC9?=
 =?us-ascii?Q?YD9ZbGLN3eJYBWQwl95QHRkdRa8qIiww1sBfZKmg8wM9t06PQZOESuWqXYHg?=
 =?us-ascii?Q?cc9NuvgbXuBoKBXu0JjY8pJz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71dfa49d-8d79-410a-5d85-08d8ffad26bf
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:01.9407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06VITsoNJ+O6Txjjs7/WJ/rtQZb/LDnfmk6Rgzcp1EONMribW0ZzKymyOoB8YoHjdqtRfqThZOR/AYL/I4IBgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4797
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
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig       |   2 +
 drivers/gpu/drm/amd/amdkfd/Makefile      |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c  |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 104 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  49 +++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   3 +
 6 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index f02c938f75da..fb8d85716599 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -8,6 +8,8 @@ config HSA_AMD
 	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
 	imply AMD_IOMMU_V2 if X86_64
 	select HMM_MIRROR
+	select ZONE_DEVICE
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
index 357b9bf62a1c..b31bae91fbd0 100644
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
index 000000000000..0361396d17cb
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright 2020-2021 Advanced Micro Devices, Inc.
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
index 000000000000..89392548ec44
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright 2020-2021 Advanced Micro Devices, Inc.
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
