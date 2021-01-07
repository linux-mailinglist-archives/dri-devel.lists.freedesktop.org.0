Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AE82EC88E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909506E40A;
	Thu,  7 Jan 2021 03:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7666E3F7;
 Thu,  7 Jan 2021 03:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9WYeeQm3bWxQAwRono0Eu9v7dE8TmyAMit3CxUDLNkmDGO3Rt55O34HNVCYoo9iph6ByAe9H/sc4MdPdaHvRVPjjhb45ORYycSSEjZQe2pPXc7hNnqto1UIFVGVxre3oPnarVvXMsGKwfzMDgGHg0HKqA2xcOoHyi8WeyV4npPfzQAyrZECzuVSicsu7EVZIHLecvYp7z59Brgr+viBsXLpidwur5c8q7lGjpivyHaZ8txPRcAKX4bUvVGSMp1B9/OeM02G8AoDX6RBItkxr60TPv6iW9ICAQHcBU9mlfiHZM38dAQSgrBcysTLl4eESpg4Vg62NE365l5TFVcQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S30XF4DoaxjBRu3ciGQ68CU5TbcmA7uYCnuy7/Om/gA=;
 b=oD45+6uecUh8v7M67uTszdAqVg6iTS/6gLGSymnpmWzcPRFsVaEUxhbqkGSgFV6GNiDEybtLDKONv8X8y0EWWbf5MGGIGjV12X/GNDVpHa1dX0+OjavGt+mLIY2hTKIiP1jVxQnJ1vlM6sp+Mu6oPlxwP0XQSr+gdMj7A8yezu5PM4k3e37cK6caL0iJY4qkRGHz6NnC3a6HiKpbt6Qb9QSw3mCPnbwyplCFwdLRpkVf8dcQUgxSj4384gzqHrPAL5+YYQYzn5zPPiPJ7iW8sRr+QWOJljQoN/ZQo0j0fSXLHTzLZm8QcTdMm/25wdR+F90v3UvKVRkvF4pFBcBpXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S30XF4DoaxjBRu3ciGQ68CU5TbcmA7uYCnuy7/Om/gA=;
 b=hFYlF7xG9b/L/Z+E88rQo2Ub2CyyUWA/k4HBeshLW74mWdPoaW/tllpBKaFEsVqR1L6Sgf/LgNquCKTY47LXOdaWY1KzviwhUSY4Ho0paYZuPk92E5oQW1NnuJ4PkZlRCLmGD+H07pVT+22rxx/CQNbjf34gH9Vz1TRIbB6tfdU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:49 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:49 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/35] drm/amdkfd: register svm range
Date: Wed,  6 Jan 2021 22:00:58 -0500
Message-Id: <20210107030127.20393-7-Felix.Kuehling@amd.com>
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
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c5478ee1-b42c-4a88-b64d-08d8b2b8b7b4
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB399963DA93166330B0DCE58292AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W7yaJmeXAHwLI/cYWxpNvI13yq+ASBkiNdboC4RaoV5xUlF6GMzcQB83HJEMxv2IpjbevhOsvR2laslymRPN9BgbC5p3IpK19QJ0L8PA2T7WMfHKwbiwgSfPodDwlTKLIkIaKVqclmVYQWv/1phOjE5WMboQ+D3KAvkj/KvRV5BhfEphYvEBnAly6stjvzFT5dZgM4xkkNePS64bGCx+bKXjUJzYDK3itY0ny7cUslC0PXyRY7XBBrveMqMVHKuavPOMuOhPrp3o5S7Q9eCxyOeNC7HJARmRLS194x9nB2VRB1HuYSpXp6/zxFyJrFPI2M7XMHSwny19NrAhiDoFfBTRcNJtw7a0jt0vwLm39t6Y7dGKRGCWS/Fa++7jEjhfB9TuR5747Q2Hcj28km8IeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(30864003)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yk4OjWMsLsTq5uFXbgdby6I9/jUaVZIdq2gyy6q4dgJzjltoXVjJa2//QX4p?=
 =?us-ascii?Q?CW1p8Zay4xcIxFvyuPuUNgpBh5ZOkmvKCBaEwbINJrSA9fT+jpFotEKtXMxr?=
 =?us-ascii?Q?YrXr1lQfZyQQhkhJCUihd4XiwyKg2lSjH3j+4R+LjK63z4RWt6kw9N3qevq4?=
 =?us-ascii?Q?bRIMh8Hchg/F4UoGbq9OwYEjFOQ8yYQwqCfkqGdmjK7Af/3gimypg1TeAcKn?=
 =?us-ascii?Q?r1hsdefzry+TZ5ZUbuAFu0LpqMnihG/RfL1al1N3fbmXpmgn2xGaNyFnPH/h?=
 =?us-ascii?Q?SqFe8jrD7u9tZ1sZ+KtKZ9VpwtHAln0QZXYB/Mq1P9KpN2IlZP/uSmrtNUwF?=
 =?us-ascii?Q?O6+V0ihelUn+pF+4TQVPCThCfFCjZGA1cMQBILU+aSHhXUJU/NJwm2/8U+PK?=
 =?us-ascii?Q?Ud7FEUkTHaNSgJX3QvReZOumRP9oVK0GgxS4awjb7u5kLfX7xGF3qNUVpnp0?=
 =?us-ascii?Q?8PN4SCqx3ACALA1uaaErblibL/6Z2PHj2rKTi54wbW39wcw/jv/jqlz583K6?=
 =?us-ascii?Q?lS/UcdogAJzq/RqBsOZHtd9gXP8Hi6UAyod2avTO88lmTsJw99zWIx7O50Ok?=
 =?us-ascii?Q?1XnioaKsuCtOSX/n36GD+SeAjwvhcY2IlRdQHN9rphOqcX/RUH/vrrufgmlK?=
 =?us-ascii?Q?OtuUY1AWkKaIAVbNF9PWzlMOswTk6vGbbxNUxTVKnp1UAqsO/7AytE+F4jLF?=
 =?us-ascii?Q?mMLBt9F3eRS2zSkx8i346avPJtkL0AI/8wwzhxPK2F+uS5cU923nHyU/3ot0?=
 =?us-ascii?Q?EHIbMgSR2VtNF4NkBlAn4fsHJeaPQqLG7MzyaRfRNkKqUcOlH9SxuF9auqKl?=
 =?us-ascii?Q?3I1WlD6XakQrKNnKsb6DoeK9aYRK4RV9kkjUHoR6XFufN/900SRYTTf/defy?=
 =?us-ascii?Q?3n3l/PKqMTSySrlKgRPGSi3Y9dV81C3m6h5zj4PX4mtC/HXDle7sMHYDjzS1?=
 =?us-ascii?Q?Rfyxaj89Pvvgv+zeBimE30UBnwX8JtmXbiUP4T9KFq/0Hf9cKLUR70ju03CY?=
 =?us-ascii?Q?ejhH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:49.7769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: c5478ee1-b42c-4a88-b64d-08d8b2b8b7b4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiEiASEiNV93su8skVcMaNBUuzKijpIxmGPA9tjwWq8os3DpfLpJs1sOVYqopipU+S982lA520qmzb/sstDhzA==
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

svm range structure stores the range start address, size, attributes,
flags, prefetch location and gpu bitmap which indicates which GPU this
range maps to. Same virtual address is shared by CPU and GPUs.

Process has svm range list which uses both interval tree and list to
store all svm ranges registered by the process. Interval tree is used by
GPU vm fault handler and CPU page fault handler to get svm range
structure from the specific address. List is used to scan all ranges in
eviction restore work.

Apply attributes preferred location, prefetch location, mapping flags,
migration granularity to svm range, store mapping gpu index into bitmap.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/Makefile      |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  21 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  14 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |   9 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 603 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  93 ++++
 6 files changed, 741 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.h

diff --git a/drivers/gpu/drm/amd/amdkfd/Makefile b/drivers/gpu/drm/amd/amdkfd/Makefile
index e1e4115dcf78..387ce0217d35 100644
--- a/drivers/gpu/drm/amd/amdkfd/Makefile
+++ b/drivers/gpu/drm/amd/amdkfd/Makefile
@@ -54,7 +54,8 @@ AMDKFD_FILES	:= $(AMDKFD_PATH)/kfd_module.o \
 		$(AMDKFD_PATH)/kfd_dbgdev.o \
 		$(AMDKFD_PATH)/kfd_dbgmgr.o \
 		$(AMDKFD_PATH)/kfd_smi_events.o \
-		$(AMDKFD_PATH)/kfd_crat.o
+		$(AMDKFD_PATH)/kfd_crat.o \
+		$(AMDKFD_PATH)/kfd_svm.o
 
 ifneq ($(CONFIG_AMD_IOMMU_V2),)
 AMDKFD_FILES += $(AMDKFD_PATH)/kfd_iommu.o
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index c5288a6e45b9..2d3ba7e806d5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -38,6 +38,7 @@
 #include "kfd_priv.h"
 #include "kfd_device_queue_manager.h"
 #include "kfd_dbgmgr.h"
+#include "kfd_svm.h"
 #include "amdgpu_amdkfd.h"
 #include "kfd_smi_events.h"
 
@@ -1748,7 +1749,25 @@ static int kfd_ioctl_smi_events(struct file *filep,
 
 static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 {
-	return -EINVAL;
+	struct kfd_ioctl_svm_args *args = data;
+	int r = 0;
+
+	pr_debug("start 0x%llx size 0x%llx op 0x%x nattr 0x%x\n",
+		 args->start_addr, args->size, args->op, args->nattr);
+
+	if ((args->start_addr & ~PAGE_MASK) || (args->size & ~PAGE_MASK))
+		return -EINVAL;
+	if (!args->start_addr || !args->size)
+		return -EINVAL;
+
+	mutex_lock(&p->mutex);
+
+	r = svm_ioctl(p, args->op, args->start_addr, args->size, args->nattr,
+		      args->attrs);
+
+	mutex_unlock(&p->mutex);
+
+	return r;
 }
 
 #define AMDKFD_IOCTL_DEF(ioctl, _func, _flags) \
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 4ef8804adcf5..cbb2bae1982d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -726,6 +726,17 @@ struct kfd_process_device {
 
 #define qpd_to_pdd(x) container_of(x, struct kfd_process_device, qpd)
 
+struct svm_range_list {
+	struct mutex			lock; /* use svms_lock/unlock(svms) */;
+	unsigned int			saved_flags;
+	struct rb_root_cached		objects;
+	struct list_head		list;
+	struct srcu_struct		srcu;
+	struct work_struct		srcu_free_work;
+	struct list_head		free_list;
+	struct mutex			free_list_lock;
+};
+
 /* Process data */
 struct kfd_process {
 	/*
@@ -804,6 +815,9 @@ struct kfd_process {
 	struct kobject *kobj;
 	struct kobject *kobj_queues;
 	struct attribute attr_pasid;
+
+	/* shared virtual memory registered by this process */
+	struct svm_range_list svms;
 };
 
 #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 7396f3a6d0ee..791f17308b1b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -35,6 +35,7 @@
 #include <linux/pm_runtime.h>
 #include "amdgpu_amdkfd.h"
 #include "amdgpu.h"
+#include "kfd_svm.h"
 
 struct mm_struct;
 
@@ -42,6 +43,7 @@ struct mm_struct;
 #include "kfd_device_queue_manager.h"
 #include "kfd_dbgmgr.h"
 #include "kfd_iommu.h"
+#include "kfd_svm.h"
 
 /*
  * List of struct kfd_process (field kfd_process).
@@ -997,6 +999,7 @@ static void kfd_process_wq_release(struct work_struct *work)
 	kfd_iommu_unbind_process(p);
 
 	kfd_process_free_outstanding_kfd_bos(p);
+	svm_range_list_fini(p);
 
 	kfd_process_destroy_pdds(p);
 	dma_fence_put(p->ef);
@@ -1190,6 +1193,10 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	if (err != 0)
 		goto err_init_apertures;
 
+	err = svm_range_list_init(process);
+	if (err)
+		goto err_init_svm_range_list;
+
 	/* Must be last, have to use release destruction after this */
 	process->mmu_notifier.ops = &kfd_process_mmu_notifier_ops;
 	err = mmu_notifier_register(&process->mmu_notifier, process->mm);
@@ -1203,6 +1210,8 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	return process;
 
 err_register_notifier:
+	svm_range_list_fini(process);
+err_init_svm_range_list:
 	kfd_process_free_outstanding_kfd_bos(process);
 	kfd_process_destroy_pdds(process);
 err_init_apertures:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
new file mode 100644
index 000000000000..0b0410837be9
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -0,0 +1,603 @@
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
+#include "amdgpu_sync.h"
+#include "amdgpu_object.h"
+#include "amdgpu_vm.h"
+#include "amdgpu_mn.h"
+#include "kfd_priv.h"
+#include "kfd_svm.h"
+
+/**
+ * svm_range_unlink - unlink svm_range from lists and interval tree
+ * @prange: svm range structure to be removed
+ *
+ * Remove the svm range from svms interval tree and link list
+ *
+ * Context: The caller must hold svms_lock
+ */
+static void svm_range_unlink(struct svm_range *prange)
+{
+	pr_debug("prange 0x%p [0x%lx 0x%lx]\n", prange, prange->it_node.start,
+		 prange->it_node.last);
+
+	list_del_rcu(&prange->list);
+	interval_tree_remove(&prange->it_node, &prange->svms->objects);
+}
+
+/**
+ * svm_range_add_to_svms - add svm range to svms
+ * @prange: svm range structure to be added
+ *
+ * Add the svm range to svms interval tree and link list
+ *
+ * Context: The caller must hold svms_lock
+ */
+static void svm_range_add_to_svms(struct svm_range *prange)
+{
+	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+		 prange->it_node.start, prange->it_node.last);
+
+	list_add_tail_rcu(&prange->list, &prange->svms->list);
+	interval_tree_insert(&prange->it_node, &prange->svms->objects);
+}
+
+static void svm_range_remove(struct svm_range *prange)
+{
+	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+		 prange->it_node.start, prange->it_node.last);
+
+	kvfree(prange->pages_addr);
+	kfree(prange);
+}
+
+static void
+svm_range_set_default_attributes(int32_t *location, int32_t *prefetch_loc,
+				 uint8_t *granularity, uint32_t *flags)
+{
+	*location = 0;
+	*prefetch_loc = 0;
+	*granularity = 9;
+	*flags =
+		KFD_IOCTL_SVM_FLAG_HOST_ACCESS | KFD_IOCTL_SVM_FLAG_COHERENT;
+}
+
+static struct
+svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
+			 uint64_t last)
+{
+	uint64_t size = last - start + 1;
+	struct svm_range *prange;
+
+	prange = kzalloc(sizeof(*prange), GFP_KERNEL);
+	if (!prange)
+		return NULL;
+	prange->npages = size;
+	prange->svms = svms;
+	prange->it_node.start = start;
+	prange->it_node.last = last;
+	INIT_LIST_HEAD(&prange->list);
+	INIT_LIST_HEAD(&prange->update_list);
+	INIT_LIST_HEAD(&prange->remove_list);
+	svm_range_set_default_attributes(&prange->preferred_loc,
+					 &prange->prefetch_loc,
+					 &prange->granularity, &prange->flags);
+
+	pr_debug("svms 0x%p [0x%llx 0x%llx]\n", svms, start, last);
+
+	return prange;
+}
+
+static struct kfd_dev *
+svm_get_supported_dev_by_id(struct kfd_process *p, uint32_t gpu_id,
+			    int *r_gpuidx)
+{
+	struct kfd_dev *dev;
+	int gpuidx;
+	int r;
+
+	gpuidx = kfd_process_gpuidx_from_gpuid(p, gpu_id);
+	if (gpuidx < 0) {
+		pr_debug("failed to get device by id 0x%x\n", gpu_id);
+		return NULL;
+	}
+	r = kfd_process_device_from_gpuidx(p, gpuidx, &dev);
+	if (r < 0) {
+		pr_debug("failed to get device by idx 0x%x\n", gpuidx);
+		return NULL;
+	}
+	if (dev->device_info->asic_family < CHIP_VEGA10) {
+		pr_debug("device id 0x%x does not support SVM\n", gpu_id);
+		return NULL;
+	}
+	if (r_gpuidx)
+		*r_gpuidx = gpuidx;
+	return dev;
+}
+
+static int
+svm_range_apply_attrs(struct kfd_process *p, struct svm_range *prange,
+		      uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
+{
+	uint32_t i;
+	int gpuidx;
+
+	for (i = 0; i < nattr; i++) {
+		switch (attrs[i].type) {
+		case KFD_IOCTL_SVM_ATTR_PREFERRED_LOC:
+			if (attrs[i].value != KFD_IOCTL_SVM_LOCATION_SYSMEM &&
+			    attrs[i].value != KFD_IOCTL_SVM_LOCATION_UNDEFINED &&
+			    !svm_get_supported_dev_by_id(p, attrs[i].value, NULL))
+				return -EINVAL;
+			prange->preferred_loc = attrs[i].value;
+			break;
+		case KFD_IOCTL_SVM_ATTR_PREFETCH_LOC:
+			if (attrs[i].value != KFD_IOCTL_SVM_LOCATION_SYSMEM &&
+			    !svm_get_supported_dev_by_id(p, attrs[i].value, NULL))
+				return -EINVAL;
+			prange->prefetch_loc = attrs[i].value;
+			break;
+		case KFD_IOCTL_SVM_ATTR_ACCESS:
+		case KFD_IOCTL_SVM_ATTR_ACCESS_IN_PLACE:
+		case KFD_IOCTL_SVM_ATTR_NO_ACCESS:
+			if (!svm_get_supported_dev_by_id(p, attrs[i].value,
+							 &gpuidx))
+				return -EINVAL;
+			if (attrs[i].type == KFD_IOCTL_SVM_ATTR_NO_ACCESS) {
+				bitmap_clear(prange->bitmap_access, gpuidx, 1);
+				bitmap_clear(prange->bitmap_aip, gpuidx, 1);
+			} else if (attrs[i].type == KFD_IOCTL_SVM_ATTR_ACCESS) {
+				bitmap_set(prange->bitmap_access, gpuidx, 1);
+				bitmap_clear(prange->bitmap_aip, gpuidx, 1);
+			} else {
+				bitmap_clear(prange->bitmap_access, gpuidx, 1);
+				bitmap_set(prange->bitmap_aip, gpuidx, 1);
+			}
+			break;
+		case KFD_IOCTL_SVM_ATTR_SET_FLAGS:
+			prange->flags |= attrs[i].value;
+			break;
+		case KFD_IOCTL_SVM_ATTR_CLR_FLAGS:
+			prange->flags &= ~attrs[i].value;
+			break;
+		case KFD_IOCTL_SVM_ATTR_GRANULARITY:
+			prange->granularity = attrs[i].value;
+			break;
+		default:
+			pr_debug("unknown attr type 0x%x\n", attrs[i].type);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * svm_range_debug_dump - print all range information from svms
+ * @svms: svm range list header
+ *
+ * debug output svm range start, end, pages_addr, prefetch location from svms
+ * interval tree and link list
+ *
+ * Context: The caller must hold svms_lock
+ */
+static void svm_range_debug_dump(struct svm_range_list *svms)
+{
+	struct interval_tree_node *node;
+	struct svm_range *prange;
+
+	pr_debug("dump svms 0x%p list\n", svms);
+	pr_debug("range\tstart\tpage\tend\t\tpages_addr\tlocation\n");
+
+	/* Not using list_for_each_entry_rcu because the caller is holding the
+	 * svms lock
+	 */
+	list_for_each_entry(prange, &svms->list, list) {
+		pr_debug("0x%lx\t0x%llx\t0x%llx\t0x%llx\t0x%x\n",
+			 prange->it_node.start, prange->npages,
+			 prange->it_node.start + prange->npages - 1,
+			 prange->pages_addr ? *prange->pages_addr : 0,
+			 prange->actual_loc);
+	}
+
+	pr_debug("dump svms 0x%p interval tree\n", svms);
+	pr_debug("range\tstart\tpage\tend\t\tpages_addr\tlocation\n");
+	node = interval_tree_iter_first(&svms->objects, 0, ~0ULL);
+	while (node) {
+		prange = container_of(node, struct svm_range, it_node);
+		pr_debug("0x%lx\t0x%llx\t0x%llx\t0x%llx\t0x%x\n",
+			 prange->it_node.start, prange->npages,
+			 prange->it_node.start + prange->npages - 1,
+			 prange->pages_addr ? *prange->pages_addr : 0,
+			 prange->actual_loc);
+		node = interval_tree_iter_next(node, 0, ~0ULL);
+	}
+}
+
+/**
+ * svm_range_handle_overlap - split overlap ranges
+ * @svms: svm range list header
+ * @new: range added with this attributes
+ * @start: range added start address, in pages
+ * @last: range last address, in pages
+ * @update_list: output, the ranges attributes are updated. For set_attr, this
+ *               will do validation and map to GPUs. For unmap, this will be
+ *               removed and unmap from GPUs
+ * @insert_list: output, the ranges will be inserted into svms, attributes are
+ *               not changes. For set_attr, this will add into svms. For unmap,
+ *               will remove duplicate range from update_list because it is
+ *               unmapped, should not insert to svms.
+ * @remove_list:output, the ranges will be removed from svms
+ * @left: the remaining range after overlap, For set_attr, this will be added
+ *        as new range. For unmap, this is ignored.
+ *
+ * Total have 5 overlap cases.
+ *
+ * Context: The caller must hold svms_lock
+ */
+static int
+svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
+			 unsigned long start, unsigned long last,
+			 struct list_head *update_list,
+			 struct list_head *insert_list,
+			 struct list_head *remove_list,
+			 unsigned long *left)
+{
+	struct interval_tree_node *node;
+	struct svm_range *prange;
+	struct svm_range *tmp;
+	int r = 0;
+
+	INIT_LIST_HEAD(update_list);
+	INIT_LIST_HEAD(insert_list);
+	INIT_LIST_HEAD(remove_list);
+
+	node = interval_tree_iter_first(&svms->objects, start, last);
+	while (node) {
+		struct interval_tree_node *next;
+
+		pr_debug("found overlap node [0x%lx 0x%lx]\n", node->start,
+			 node->last);
+
+		prange = container_of(node, struct svm_range, it_node);
+		next = interval_tree_iter_next(node, start, last);
+
+		if (node->start < start && node->last > last) {
+			pr_debug("split in 2 ranges\n");
+			start = last + 1;
+
+		} else if (node->start < start) {
+			/*
+			 * For node->last == last, will exit loop
+			 * for node->last < last, will continue in next loop
+			 */
+			uint64_t old_last = node->last;
+
+			start = old_last + 1;
+
+		} else if (node->start == start && node->last > last) {
+			pr_debug("change old range start\n");
+
+			start = last + 1;
+
+		} else if (node->start == start) {
+			if (prange->it_node.last == last)
+				pr_debug("found exactly same range\n");
+			else
+				pr_debug("next loop to add remaining range\n");
+
+			start = node->last + 1;
+
+		} else { /* node->start > start */
+			pr_debug("add new range at front\n");
+
+			start = node->last + 1;
+		}
+
+		if (r)
+			goto out;
+
+		node = next;
+	}
+
+	if (left && start <= last)
+		*left = last - start + 1;
+
+out:
+	if (r)
+		list_for_each_entry_safe(prange, tmp, insert_list, list)
+			svm_range_remove(prange);
+
+	return r;
+}
+
+static void svm_range_srcu_free_work(struct work_struct *work_struct)
+{
+	struct svm_range_list *svms;
+	struct svm_range *prange;
+	struct svm_range *tmp;
+
+	svms = container_of(work_struct, struct svm_range_list, srcu_free_work);
+
+	synchronize_srcu(&svms->srcu);
+
+	mutex_lock(&svms->free_list_lock);
+	list_for_each_entry_safe(prange, tmp, &svms->free_list, remove_list) {
+		list_del(&prange->remove_list);
+		svm_range_remove(prange);
+	}
+	mutex_unlock(&svms->free_list_lock);
+}
+
+void svm_range_list_fini(struct kfd_process *p)
+{
+	pr_debug("pasid 0x%x svms 0x%p\n", p->pasid, &p->svms);
+
+	/* Ensure srcu free work is finished before process is destroyed */
+	flush_work(&p->svms.srcu_free_work);
+	cleanup_srcu_struct(&p->svms.srcu);
+	mutex_destroy(&p->svms.free_list_lock);
+}
+
+int svm_range_list_init(struct kfd_process *p)
+{
+	struct svm_range_list *svms = &p->svms;
+	int r;
+
+	svms->objects = RB_ROOT_CACHED;
+	mutex_init(&svms->lock);
+	INIT_LIST_HEAD(&svms->list);
+	r = init_srcu_struct(&svms->srcu);
+	if (r) {
+		pr_debug("failed %d to init srcu\n", r);
+		return r;
+	}
+	INIT_WORK(&svms->srcu_free_work, svm_range_srcu_free_work);
+	INIT_LIST_HEAD(&svms->free_list);
+	mutex_init(&svms->free_list_lock);
+
+	return 0;
+}
+
+/**
+ * svm_range_is_valid - check if virtual address range is valid
+ * @mm: current process mm_struct
+ * @start: range start address, in pages
+ * @size: range size, in pages
+ *
+ * Valid virtual address range means it belongs to one or more VMAs
+ *
+ * Context: Process context
+ *
+ * Return:
+ *  true - valid svm range
+ *  false - invalid svm range
+ */
+static bool
+svm_range_is_valid(struct mm_struct *mm, uint64_t start, uint64_t size)
+{
+	const unsigned long device_vma = VM_IO | VM_PFNMAP | VM_MIXEDMAP;
+	struct vm_area_struct *vma;
+	unsigned long end;
+
+	start <<= PAGE_SHIFT;
+	end = start + (size << PAGE_SHIFT);
+
+	do {
+		vma = find_vma(mm, start);
+		if (!vma || start < vma->vm_start ||
+		    (vma->vm_flags & device_vma))
+			return false;
+		start = min(end, vma->vm_end);
+	} while (start < end);
+
+	return true;
+}
+
+/**
+ * svm_range_add - add svm range and handle overlap
+ * @p: the range add to this process svms
+ * @start: page size aligned
+ * @size: page size aligned
+ * @nattr: number of attributes
+ * @attrs: array of attributes
+ * @update_list: output, the ranges need validate and update GPU mapping
+ * @insert_list: output, the ranges need insert to svms
+ * @remove_list: output, the ranges are replaced and need remove from svms
+ *
+ * Check if the virtual address range has overlap with the registered ranges,
+ * split the overlapped range, copy and adjust pages address and vram nodes in
+ * old and new ranges.
+ *
+ * Context: Process context, takes and releases svms_lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+static int
+svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
+	      uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs,
+	      struct list_head *update_list, struct list_head *insert_list,
+	      struct list_head *remove_list)
+{
+	uint64_t last = start + size - 1UL;
+	struct svm_range_list *svms;
+	struct svm_range new = {0};
+	struct svm_range *prange;
+	unsigned long left = 0;
+	int r = 0;
+
+	pr_debug("svms 0x%p [0x%llx 0x%llx]\n", &p->svms, start, last);
+
+	r = svm_range_apply_attrs(p, &new, nattr, attrs);
+	if (r)
+		return r;
+
+	svms = &p->svms;
+
+	r = svm_range_handle_overlap(svms, &new, start, last, update_list,
+				     insert_list, remove_list, &left);
+	if (r)
+		return r;
+
+	if (left) {
+		prange = svm_range_new(svms, last - left + 1, last);
+		list_add(&prange->list, insert_list);
+		list_add(&prange->update_list, update_list);
+	}
+
+	return 0;
+}
+
+static int
+svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
+		   uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
+{
+	struct amdkfd_process_info *process_info = p->kgd_process_info;
+	struct mm_struct *mm = current->mm;
+	struct list_head update_list;
+	struct list_head insert_list;
+	struct list_head remove_list;
+	struct svm_range_list *svms;
+	struct svm_range *prange;
+	struct svm_range *tmp;
+	int srcu_idx;
+	int r = 0;
+
+	pr_debug("pasid 0x%x svms 0x%p [0x%llx 0x%llx] pages 0x%llx\n",
+		 p->pasid, &p->svms, start, start + size - 1, size);
+
+	mmap_read_lock(mm);
+	if (!svm_range_is_valid(mm, start, size)) {
+		pr_debug("invalid range\n");
+		mmap_read_unlock(mm);
+		return -EFAULT;
+	}
+	mmap_read_unlock(mm);
+
+	mutex_lock(&process_info->lock);
+
+	svms = &p->svms;
+	svms_lock(svms);
+
+	r = svm_range_add(p, start, size, nattr, attrs, &update_list,
+			  &insert_list, &remove_list);
+	if (r) {
+		svms_unlock(svms);
+		mutex_unlock(&process_info->lock);
+		return r;
+	}
+
+	list_for_each_entry_safe(prange, tmp, &insert_list, list)
+		svm_range_add_to_svms(prange);
+
+	/* Hold read lock to prevent prange is removed after unlocking svms */
+	srcu_idx = srcu_read_lock(&svms->srcu);
+	svms_unlock(svms);
+
+	/* Hold mm->map_sem and check if svm range is unmapped in parallel */
+	mmap_read_lock(mm);
+
+	if (!svm_range_is_valid(mm, start, size)) {
+		pr_debug("range is unmapped\n");
+		mmap_read_unlock(mm);
+		srcu_read_unlock(&svms->srcu, srcu_idx);
+		r = -EFAULT;
+		goto out_remove;
+	}
+
+	list_for_each_entry(prange, &update_list, update_list) {
+
+		r = svm_range_apply_attrs(p, prange, nattr, attrs);
+		if (r) {
+			pr_debug("failed %d to apply attrs\n", r);
+			mmap_read_unlock(mm);
+			srcu_read_unlock(&prange->svms->srcu, srcu_idx);
+			goto out_remove;
+		}
+	}
+
+	srcu_read_unlock(&svms->srcu, srcu_idx);
+	svms_lock(svms);
+
+	mutex_lock(&svms->free_list_lock);
+	list_for_each_entry_safe(prange, tmp, &remove_list, remove_list) {
+		pr_debug("remove overlap prange svms 0x%p [0x%lx 0x%lx]\n",
+			 prange->svms, prange->it_node.start,
+			 prange->it_node.last);
+		svm_range_unlink(prange);
+
+		pr_debug("schedule to free prange svms 0x%p [0x%lx 0x%lx]\n",
+			 prange->svms, prange->it_node.start,
+			 prange->it_node.last);
+		list_add_tail(&prange->remove_list, &svms->free_list);
+	}
+	if (!list_empty(&svms->free_list))
+		schedule_work(&svms->srcu_free_work);
+	mutex_unlock(&svms->free_list_lock);
+
+	svm_range_debug_dump(svms);
+
+	svms_unlock(svms);
+	mmap_read_unlock(mm);
+	mutex_unlock(&process_info->lock);
+
+	pr_debug("pasid 0x%x svms 0x%p [0x%llx 0x%llx] done\n", p->pasid,
+		 &p->svms, start, start + size - 1);
+
+	return 0;
+
+out_remove:
+	svms_lock(svms);
+	list_for_each_entry_safe(prange, tmp, &insert_list, list) {
+		svm_range_unlink(prange);
+		list_add_tail(&prange->remove_list, &svms->free_list);
+	}
+	if (!list_empty(&svms->free_list))
+		schedule_work(&svms->srcu_free_work);
+	svms_unlock(svms);
+	mutex_unlock(&process_info->lock);
+
+	return r;
+}
+
+int
+svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
+	  uint64_t size, uint32_t nattrs, struct kfd_ioctl_svm_attribute *attrs)
+{
+	int r;
+
+	start >>= PAGE_SHIFT;
+	size >>= PAGE_SHIFT;
+
+	switch (op) {
+	case KFD_IOCTL_SVM_OP_SET_ATTR:
+		r = svm_range_set_attr(p, start, size, nattrs, attrs);
+		break;
+	default:
+		r = EINVAL;
+		break;
+	}
+
+	return r;
+}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
new file mode 100644
index 000000000000..c7c54fb73dfb
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -0,0 +1,93 @@
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
+#ifndef KFD_SVM_H_
+#define KFD_SVM_H_
+
+#include <linux/rwsem.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/sched/mm.h>
+#include <linux/hmm.h>
+#include "amdgpu.h"
+#include "kfd_priv.h"
+
+/**
+ * struct svm_range - shared virtual memory range
+ *
+ * @svms:       list of svm ranges, structure defined in kfd_process
+ * @it_node:    node [start, last] stored in interval tree, start, last are page
+ *              aligned, page size is (last - start + 1)
+ * @list:       link list node, used to scan all ranges of svms
+ * @update_list:link list node used to add to update_list
+ * @remove_list:link list node used to add to remove list
+ * @npages:     number of pages
+ * @pages_addr: list of system memory physical page address
+ * @flags:      flags defined as KFD_IOCTL_SVM_FLAG_*
+ * @perferred_loc: perferred location, 0 for CPU, or GPU id
+ * @perfetch_loc: last prefetch location, 0 for CPU, or GPU id
+ * @actual_loc: the actual location, 0 for CPU, or GPU id
+ * @granularity:migration granularity, log2 num pages
+ * @bitmap_access: index bitmap of GPUs which can access the range
+ * @bitmap_aip: index bitmap of GPUs which can access the range in place
+ *
+ * Data structure for virtual memory range shared by CPU and GPUs, it can be
+ * allocated from system memory ram or device vram, and migrate from ram to vram
+ * or from vram to ram.
+ */
+struct svm_range {
+	struct svm_range_list		*svms;
+	struct interval_tree_node	it_node;
+	struct list_head		list;
+	struct list_head		update_list;
+	struct list_head		remove_list;
+	uint64_t			npages;
+	dma_addr_t			*pages_addr;
+	uint32_t			flags;
+	uint32_t			preferred_loc;
+	uint32_t			prefetch_loc;
+	uint32_t			actual_loc;
+	uint8_t				granularity;
+	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
+	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
+};
+
+static inline void svms_lock(struct svm_range_list *svms)
+{
+	mutex_lock(&svms->lock);
+	svms->saved_flags = memalloc_nofs_save();
+
+}
+static inline void svms_unlock(struct svm_range_list *svms)
+{
+	memalloc_nofs_restore(svms->saved_flags);
+	mutex_unlock(&svms->lock);
+}
+
+int svm_range_list_init(struct kfd_process *p);
+void svm_range_list_fini(struct kfd_process *p);
+int svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
+	      uint64_t size, uint32_t nattrs,
+	      struct kfd_ioctl_svm_attribute *attrs);
+
+#endif /* KFD_SVM_H_ */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
