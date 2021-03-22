Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4707E343EF2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D6589BFC;
	Mon, 22 Mar 2021 11:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55F189ACD;
 Mon, 22 Mar 2021 11:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbLpcQvS0fd+jrjpkWZ/666zQNoGxL3v6DeXpQqHmkfhD6tSCO08a+xmQ/kTZJ+Qk3/UlKEG8C7tQqn08NpaYjlcp4x/tY3pVItOqs8X8lIeSbGfWWzoTQnLeB/cnDkWeMYoDnVenGyFnJY2qA1P7kCyt7EsLdWvwLCOA5YDUXQ6RftynLJYob1jdcc8LOBR4BWLvG9fPHDkKWVJT83UHv+c68Tyaa6gXQK4cF0w6jQcFq0s04EIEBydpcz4AcOyblGW6Ogkq6dowdoVNGZ//s3XHSrykE9mzAuQqY3fqXb/oSw5zfJbiFoIa5PVGpsUt2MUjUQOkCO5Gz/Ln7L6QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P+S7e5pWq2G0004iqIsHPXP0LcGymQONM5u8wfXEfY=;
 b=epLSGYU4X5uhplcqPancby/nKwmF6Gqqz4vX9hfha8+62e53rZE4Mx2VXX88HNpoTZEvy245rvTSBtbHHs+PMm8oCFblD5Cr1uPuPJTyhjzjRf/Ggdttq1JcX886XTIFWkknjGyCBbzP4ZVPkbiVDTNjSjk1pYB/IXnJia4lqPAnj+Bylj9hodQQnthHggImq8Ey2pgdVNfb7xeHPy9Uv09LEHCZzHCfYsZzkTG6pZJW0bOqA7B0dwaRqb77DM3URG+qEBzrCM6q58sWI1Jfq+wnrNI/vELYdPF/VAeoKhg6Nzx5G3xX3QXHyHhRXOVgV3pzm1Q7cUiTxFbPZjlJag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P+S7e5pWq2G0004iqIsHPXP0LcGymQONM5u8wfXEfY=;
 b=hIgMIVl2Q8hCoVR519cXa5Ru6ZYMRm4PWvxGOH+rt+u3QAZnsjwxzEngqzFh53QEOJ63+uBJLbr4354ltUGoRZLWA3jGsj5A3BSJpuqEXrQvZf56FESDiVWmGr7k09fXoO26V/WK6UpiTj9iHFmaUbf/U+ARHGpPzpAusw7GIJ8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:31 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:31 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 04/44] drm/amdkfd: register svm range
Date: Mon, 22 Mar 2021 06:58:20 -0400
Message-Id: <20210322105900.14068-5-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dfc6b50c-a888-4a39-880a-08d8ed22b03b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3678053334A40F2C07D5F17392659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pgNoQzeR1PpPjI4lvJeCBaTPu54Wpjs8qqheqcHsBAMEOoVZQLSpEIrEUHIwEbnnh8rVtbCM3OPpccwC4uTeAgLa3djo/8zxK10M5q/zSDYeFF1W+9k7RlM430hEM+wOiPWy0jLnSEux+49nLe+/Jz8AepUeL0zIfBuWxBaSZbgudRuxPA3+WwOr/rGKzUhHDgOI0y1TaYv6//trEcFooTIJEPFhs3GVsxYqSf3BFynvJuq9rYbWcWQ5hPZ4L2JjeJhIU1qdAoaxfDBJ1ilZCmPjn3QKTMLVWH0bwdGNibL4sMomjcwz3g0B21jVOcWXtOuttHpjebBuerwHdyTrGWRtVoBTLG2wykgyre7wDeeUZIbJKqYquNDEPL9Z/OqLAc55hKDvtbKx8cm+zQ0FDBe0FiuYVXoekDLo8C/7Gx1hWypZRI89i3NRUt0tF/KOfIffjdJ57CadBXgrzL2Dt8fKtClW+Vse6tmDcoczSU1m9iTEkSecDlkmWcR3RKJyUuvAQ+4cpJMOtYpuN3OXATkXXTHCNwQeUoBYGKO58eUhc3eb3hk59VBwV4FpiNz9mxLK35B79AzJw3ccZmspzwHrgU8czc4AGug2T9EJzERSUV21HT1O+k4APo+qrrWmaAvsbp2WwvUG6PYwQf0PebndR9JYJMwLj9xwwz21w3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(54906003)(6486002)(1076003)(36756003)(30864003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2sqndPyhZEiDb6oaIVXQUbmvdw0QF5jBwq4ZhKrkmQKMGzCmQS/wJXL0lRNI?=
 =?us-ascii?Q?2rTqkWUakgrf+3DyeB0/etXvUpywcsip13xeitk/xEMCy2guXD6zh4YDffTr?=
 =?us-ascii?Q?Ia2fSf/ryhLcJbFK0I+97X/uCdU+Vie8TO4DTGUXN3dVtyPIQRJFxkXK12fx?=
 =?us-ascii?Q?a3/v0k8c4T30MPOPEJR6OvThMYMw9szKlTJUU+P7WdXgsGDyvfROaOgvcX6Q?=
 =?us-ascii?Q?KDs/hVbfwbV+WzONKGVWpKU19vfhnN0jMrJ2DeNxI9/M8J9Nu34uZMQh+kQ8?=
 =?us-ascii?Q?T4vlvveaa27rlrd2S/OxtL5jB0Vfux05ydn0bs4teRmGboh/W+j6P9YPbnkI?=
 =?us-ascii?Q?N179sf/TfqAvl6k+S+1yc7HRClRPn3Y/rRmeSnZIGFyrpi5PErdPsXlug7ev?=
 =?us-ascii?Q?wiSs5R2hawxfKkOuhg8oGQCeg75JQ0roWxxiW5qPkwqcQTpyWjEgUZQBVrL3?=
 =?us-ascii?Q?cpISvKo3I1iilFMv0qgXNMSZGDYr2xwguYVdv/2sc543fxyJd++tU8aWrlVP?=
 =?us-ascii?Q?4WJ54VPzptIz4QqwtuLqlK9AnEMIfS03dXrwq4w9ijF+eKHzl7o1q9tnk0jC?=
 =?us-ascii?Q?0gsH09/L+azF7ahgPGM0ihmTp/MS0mpud2t1jbWl6mNP/apeYmR6K87i+ed5?=
 =?us-ascii?Q?4cjvscd1h3yNigxMFsJ0U61rqs71P8zmmYTBv31jnSx0yuLZDoa099BVRbDG?=
 =?us-ascii?Q?p0ZWC9u7726jGx/bdg3nFeD7pR5WNLd1RyddtPY9LS9NlpfTqyigCOM8jkmt?=
 =?us-ascii?Q?hWPN8fxagpRbmYioIZReskZjb9VDTq0v0KJ1WqqhPPsuJdO9LYXoPGqw5J9y?=
 =?us-ascii?Q?JypULS0Zj2lKEAOx0LMpCDX+7opi5HwODoqqH5h7SXutNwO5XLZW4P6+EifO?=
 =?us-ascii?Q?zJa1BEKOaowNtg3FkzlleXTXJ0GMtVvP915PwiMa5N4i9GWFJUd1XwG1pbVg?=
 =?us-ascii?Q?QlapO/233lwtpfHxoszp6hkFbR87S0TnM5QiMIm1ckYgWm+Zio8uK2QIA9dl?=
 =?us-ascii?Q?+aL2/Jp6ArkxqCJeKnKQhdcb2RUQa5jnFEGYM+8iIBIoWF9R5fFG9AF8G7RI?=
 =?us-ascii?Q?97OowlV656L8lbAY+8JFS7Ae2/DyclVx9ZOLLfUcOXFCI4iDx0MBoB2M7dDr?=
 =?us-ascii?Q?2J/IQMw6FnApFkhp6H3Wg3pEn7n46zu1SAVjANVhGECg31/4nRvLskydnSqF?=
 =?us-ascii?Q?2hD5Nm/3JTsIF6mTBcQNpy/LRI//Ulzw4TGK58uPQ0er0KcRVjOH8WvbWpcV?=
 =?us-ascii?Q?MzIeNpnrQGAHZQe4xPsqcR+P1hzwS+Tq/D/1Q36fr6JVc4Y7pJ8M7VAQK2VU?=
 =?us-ascii?Q?RHgF6U9NYbGq6IXKg7oawh8U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc6b50c-a888-4a39-880a-08d8ed22b03b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:31.6806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9G6w2qTb1+TQx9uaGjUZc2S6woOidY9Us3IL99SuwHPjuB/KdANbmsHes/C6Uo5ElOL6oLMTZwx+ZrwAjr7iw==
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
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

No overlap range interval [start, last] exist in svms object interval
tree. If process registers new range which has overlap with old range,
the old range split into 2 ranges depending on the overlap happens at
head or tail part of old range.

Apply attributes preferred location, prefetch location, mapping flags,
migration granularity to svm range, store mapping gpu index into bitmap.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/Makefile      |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  17 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   8 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |   9 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 791 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  87 +++
 6 files changed, 914 insertions(+), 1 deletion(-)
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
index dbc824cc6b32..9511826ac8ae 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -38,6 +38,7 @@
 #include "kfd_priv.h"
 #include "kfd_device_queue_manager.h"
 #include "kfd_dbgmgr.h"
+#include "kfd_svm.h"
 #include "amdgpu_amdkfd.h"
 #include "kfd_smi_events.h"
 
@@ -1744,11 +1745,27 @@ static int kfd_ioctl_smi_events(struct file *filep,
 
 static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 {
+	struct kfd_ioctl_svm_args *args = data;
 	int r = 0;
 
 	if (p->svm_disabled)
 		return -EPERM;
 
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
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 18fc2ccd1a77..f547e1282d69 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -731,6 +731,12 @@ struct kfd_process_device {
 
 #define qpd_to_pdd(x) container_of(x, struct kfd_process_device, qpd)
 
+struct svm_range_list {
+	struct mutex			lock;
+	struct rb_root_cached		objects;
+	struct list_head		list;
+};
+
 /* Process data */
 struct kfd_process {
 	/*
@@ -810,6 +816,8 @@ struct kfd_process {
 	struct kobject *kobj_queues;
 	struct attribute attr_pasid;
 
+	/* shared virtual memory registered by this process */
+	struct svm_range_list svms;
 	bool svm_disabled;
 };
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 89e7c125d334..4d7a67141190 100644
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
@@ -1003,6 +1005,7 @@ static void kfd_process_wq_release(struct work_struct *work)
 	kfd_iommu_unbind_process(p);
 
 	kfd_process_free_outstanding_kfd_bos(p);
+	svm_range_list_fini(p);
 
 	kfd_process_destroy_pdds(p);
 	dma_fence_put(p->ef);
@@ -1228,6 +1231,10 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	if (err != 0)
 		goto err_init_apertures;
 
+	err = svm_range_list_init(process);
+	if (err)
+		goto err_init_svm_range_list;
+
 	/* alloc_notifier needs to find the process in the hash table */
 	hash_add_rcu(kfd_processes_table, &process->kfd_processes,
 			(uintptr_t)process->mm);
@@ -1250,6 +1257,8 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 
 err_register_notifier:
 	hash_del_rcu(&process->kfd_processes);
+	svm_range_list_fini(process);
+err_init_svm_range_list:
 	kfd_process_free_outstanding_kfd_bos(process);
 	kfd_process_destroy_pdds(process);
 err_init_apertures:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
new file mode 100644
index 000000000000..22f942bb2b0c
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -0,0 +1,791 @@
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
+ * Context: The caller must hold svms->lock
+ */
+static void svm_range_unlink(struct svm_range *prange)
+{
+	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms,
+		 prange, prange->start, prange->last);
+
+	list_del(&prange->list);
+	if (prange->it_node.start != 0 && prange->it_node.last != 0)
+		interval_tree_remove(&prange->it_node, &prange->svms->objects);
+}
+
+/**
+ * svm_range_add_to_svms - add svm range to svms
+ * @prange: svm range structure to be added
+ *
+ * Add the svm range to svms interval tree and link list
+ *
+ * Context: The caller must hold svms->lock
+ */
+static void svm_range_add_to_svms(struct svm_range *prange)
+{
+	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms,
+		 prange, prange->start, prange->last);
+
+	list_add_tail(&prange->list, &prange->svms->list);
+	prange->it_node.start = prange->start;
+	prange->it_node.last = prange->last;
+	interval_tree_insert(&prange->it_node, &prange->svms->objects);
+}
+
+static void svm_range_free(struct svm_range *prange)
+{
+	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms, prange,
+		 prange->start, prange->last);
+
+	kvfree(prange->pages_addr);
+	kfree(prange);
+}
+
+static void
+svm_range_set_default_attributes(int32_t *location, int32_t *prefetch_loc,
+				 uint8_t *granularity, uint32_t *flags)
+{
+	*location = KFD_IOCTL_SVM_LOCATION_UNDEFINED;
+	*prefetch_loc = KFD_IOCTL_SVM_LOCATION_UNDEFINED;
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
+	prange->start = start;
+	prange->last = last;
+	INIT_LIST_HEAD(&prange->list);
+	INIT_LIST_HEAD(&prange->update_list);
+	INIT_LIST_HEAD(&prange->remove_list);
+	INIT_LIST_HEAD(&prange->insert_list);
+	svm_range_set_default_attributes(&prange->preferred_loc,
+					 &prange->prefetch_loc,
+					 &prange->granularity, &prange->flags);
+
+	pr_debug("svms 0x%p [0x%llx 0x%llx]\n", svms, start, last);
+
+	return prange;
+}
+
+static int
+svm_range_check_attr(struct kfd_process *p,
+		     uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
+{
+	uint32_t i;
+	int gpuidx;
+
+	for (i = 0; i < nattr; i++) {
+		switch (attrs[i].type) {
+		case KFD_IOCTL_SVM_ATTR_PREFERRED_LOC:
+			if (attrs[i].value != KFD_IOCTL_SVM_LOCATION_SYSMEM &&
+			    attrs[i].value != KFD_IOCTL_SVM_LOCATION_UNDEFINED &&
+			    kfd_process_gpuidx_from_gpuid(p,
+							  attrs[i].value) < 0) {
+				pr_debug("no GPU 0x%x found\n", attrs[i].value);
+				return -EINVAL;
+			}
+			break;
+		case KFD_IOCTL_SVM_ATTR_PREFETCH_LOC:
+			if (attrs[i].value != KFD_IOCTL_SVM_LOCATION_SYSMEM &&
+			    kfd_process_gpuidx_from_gpuid(p,
+							  attrs[i].value) < 0) {
+				pr_debug("no GPU 0x%x found\n", attrs[i].value);
+				return -EINVAL;
+			}
+			break;
+		case KFD_IOCTL_SVM_ATTR_ACCESS:
+		case KFD_IOCTL_SVM_ATTR_ACCESS_IN_PLACE:
+		case KFD_IOCTL_SVM_ATTR_NO_ACCESS:
+			gpuidx = kfd_process_gpuidx_from_gpuid(p,
+							       attrs[i].value);
+			if (gpuidx < 0) {
+				pr_debug("no GPU 0x%x found\n", attrs[i].value);
+				return -EINVAL;
+			}
+			break;
+		case KFD_IOCTL_SVM_ATTR_SET_FLAGS:
+			break;
+		case KFD_IOCTL_SVM_ATTR_CLR_FLAGS:
+			break;
+		case KFD_IOCTL_SVM_ATTR_GRANULARITY:
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
+static void
+svm_range_apply_attrs(struct kfd_process *p, struct svm_range *prange,
+		      uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
+{
+	uint32_t i;
+	int gpuidx;
+
+	for (i = 0; i < nattr; i++) {
+		switch (attrs[i].type) {
+		case KFD_IOCTL_SVM_ATTR_PREFERRED_LOC:
+			prange->preferred_loc = attrs[i].value;
+			break;
+		case KFD_IOCTL_SVM_ATTR_PREFETCH_LOC:
+			prange->prefetch_loc = attrs[i].value;
+			break;
+		case KFD_IOCTL_SVM_ATTR_ACCESS:
+		case KFD_IOCTL_SVM_ATTR_ACCESS_IN_PLACE:
+		case KFD_IOCTL_SVM_ATTR_NO_ACCESS:
+			gpuidx = kfd_process_gpuidx_from_gpuid(p,
+							       attrs[i].value);
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
+			WARN_ONCE(1, "svm_range_check_attrs wasn't called?");
+		}
+	}
+}
+
+/**
+ * svm_range_debug_dump - print all range information from svms
+ * @svms: svm range list header
+ *
+ * debug output svm range start, end, pages_addr, prefetch location from svms
+ * interval tree and link list
+ *
+ * Context: The caller must hold svms->lock
+ */
+static void svm_range_debug_dump(struct svm_range_list *svms)
+{
+	struct interval_tree_node *node;
+	struct svm_range *prange;
+
+	pr_debug("dump svms 0x%p list\n", svms);
+	pr_debug("range\tstart\tpage\tend\t\tpages_addr\tlocation\n");
+
+	list_for_each_entry(prange, &svms->list, list) {
+		pr_debug("0x%p 0x%lx\t0x%llx\t0x%llx\t0x%lx\t0x%x\n",
+			 prange, prange->start, prange->npages,
+			 prange->start + prange->npages - 1,
+			 prange->pages_addr ? *prange->pages_addr : 0,
+			 prange->actual_loc);
+	}
+
+	pr_debug("dump svms 0x%p interval tree\n", svms);
+	pr_debug("range\tstart\tpage\tend\t\tpages_addr\tlocation\n");
+	node = interval_tree_iter_first(&svms->objects, 0, ~0ULL);
+	while (node) {
+		prange = container_of(node, struct svm_range, it_node);
+		pr_debug("0x%p 0x%lx\t0x%llx\t0x%llx\t0x%lx\t0x%x\n",
+			 prange, prange->start, prange->npages,
+			 prange->start + prange->npages - 1,
+			 prange->pages_addr ? *prange->pages_addr : 0,
+			 prange->actual_loc);
+		node = interval_tree_iter_next(node, 0, ~0ULL);
+	}
+}
+
+static bool
+svm_range_is_same_attrs(struct svm_range *old, struct svm_range *new)
+{
+	return (old->prefetch_loc == new->prefetch_loc &&
+		old->flags == new->flags &&
+		old->granularity == new->granularity);
+}
+
+static int
+svm_range_split_pages(struct svm_range *new, struct svm_range *old,
+		      uint64_t start, uint64_t last)
+{
+	unsigned long old_start;
+	unsigned long *pages_addr;
+	uint64_t d;
+
+	old_start = old->start;
+	new->pages_addr = kvmalloc_array(new->npages,
+					 sizeof(*new->pages_addr),
+					 GFP_KERNEL | __GFP_ZERO);
+	if (!new->pages_addr)
+		return -ENOMEM;
+
+	d = new->start - old_start;
+	memcpy(new->pages_addr, old->pages_addr + d,
+	       new->npages * sizeof(*new->pages_addr));
+
+	old->npages = last - start + 1;
+	old->start = start;
+	old->last = last;
+
+	pages_addr = kvmalloc_array(old->npages, sizeof(*pages_addr),
+				    GFP_KERNEL);
+	if (!pages_addr) {
+		kvfree(new->pages_addr);
+		return -ENOMEM;
+	}
+
+	d = start - old_start;
+	memcpy(pages_addr, old->pages_addr + d,
+	       old->npages * sizeof(*pages_addr));
+
+	kvfree(old->pages_addr);
+	old->pages_addr = pages_addr;
+
+	return 0;
+}
+
+/**
+ * svm_range_split_adjust - split range and adjust
+ *
+ * @new: new range
+ * @old: the old range
+ * @start: the old range adjust to start address in pages
+ * @last: the old range adjust to last address in pages
+ *
+ * Copy system memory pages, pages_addr or vram mm_nodes in old range to new
+ * range from new_start up to size new->npages, the remaining old range is from
+ * start to last
+ *
+ * Return:
+ * 0 - OK, -ENOMEM - out of memory
+ */
+static int
+svm_range_split_adjust(struct svm_range *new, struct svm_range *old,
+		      uint64_t start, uint64_t last)
+{
+	int r = -EINVAL;
+
+	pr_debug("svms 0x%p new 0x%lx old [0x%lx 0x%lx] => [0x%llx 0x%llx]\n",
+		 new->svms, new->start, old->start, old->last, start, last);
+
+	if (new->start < old->start ||
+	    new->last > old->last) {
+		WARN_ONCE(1, "invalid new range start or last\n");
+		return -EINVAL;
+	}
+
+	if (old->pages_addr)
+		r = svm_range_split_pages(new, old, start, last);
+	else
+		WARN_ONCE(1, "split adjust invalid pages_addr and nodes\n");
+	if (r)
+		return r;
+
+	old->npages = last - start + 1;
+	old->start = start;
+	old->last = last;
+	new->flags = old->flags;
+	new->preferred_loc = old->preferred_loc;
+	new->prefetch_loc = old->prefetch_loc;
+	new->actual_loc = old->actual_loc;
+	new->granularity = old->granularity;
+	bitmap_copy(new->bitmap_access, old->bitmap_access, MAX_GPU_INSTANCE);
+	bitmap_copy(new->bitmap_aip, old->bitmap_aip, MAX_GPU_INSTANCE);
+
+	return 0;
+}
+
+/**
+ * svm_range_split - split a range in 2 ranges
+ *
+ * @prange: the svm range to split
+ * @start: the remaining range start address in pages
+ * @last: the remaining range last address in pages
+ * @new: the result new range generated
+ *
+ * Two cases only:
+ * case 1: if start == prange->start
+ *         prange ==> prange[start, last]
+ *         new range [last + 1, prange->last]
+ *
+ * case 2: if last == prange->last
+ *         prange ==> prange[start, last]
+ *         new range [prange->start, start - 1]
+ *
+ * Context: Caller hold svms->rw_sem as write mode
+ *
+ * Return:
+ * 0 - OK, -ENOMEM - out of memory, -EINVAL - invalid start, last
+ */
+static int
+svm_range_split(struct svm_range *prange, uint64_t start, uint64_t last,
+		struct svm_range **new)
+{
+	uint64_t old_start = prange->start;
+	uint64_t old_last = prange->last;
+	struct svm_range_list *svms;
+	int r = 0;
+
+	pr_debug("svms 0x%p [0x%llx 0x%llx] to [0x%llx 0x%llx]\n", prange->svms,
+		 old_start, old_last, start, last);
+
+	if (old_start != start && old_last != last)
+		return -EINVAL;
+	if (start < old_start || last > old_last)
+		return -EINVAL;
+
+	svms = prange->svms;
+	if (old_start == start)
+		*new = svm_range_new(svms, last + 1, old_last);
+	else
+		*new = svm_range_new(svms, old_start, start - 1);
+	if (!*new)
+		return -ENOMEM;
+
+	r = svm_range_split_adjust(*new, prange, start, last);
+	if (r) {
+		pr_debug("failed %d split [0x%llx 0x%llx] to [0x%llx 0x%llx]\n",
+			 r, old_start, old_last, start, last);
+		svm_range_free(*new);
+		*new = NULL;
+	}
+
+	return r;
+}
+
+static int
+svm_range_split_tail(struct svm_range *prange, struct svm_range *new,
+		     uint64_t new_last, struct list_head *insert_list)
+{
+	struct svm_range *tail;
+	int r = svm_range_split(prange, prange->start, new_last, &tail);
+
+	if (!r)
+		list_add(&tail->insert_list, insert_list);
+	return r;
+}
+
+static int
+svm_range_split_head(struct svm_range *prange, struct svm_range *new,
+		     uint64_t new_start, struct list_head *insert_list)
+{
+	struct svm_range *head;
+	int r = svm_range_split(prange, new_start, prange->last, &head);
+
+	if (!r)
+		list_add(&head->insert_list, insert_list);
+	return r;
+}
+
+struct svm_range *svm_range_clone(struct svm_range *old)
+{
+	struct svm_range *new;
+
+	new = svm_range_new(old->svms, old->start, old->last);
+	if (!new)
+		return NULL;
+
+	if (old->pages_addr) {
+		new->pages_addr = kvmalloc_array(new->npages,
+						 sizeof(*new->pages_addr),
+						 GFP_KERNEL);
+		if (!new->pages_addr) {
+			kfree(new);
+			return NULL;
+		}
+		memcpy(new->pages_addr, old->pages_addr,
+		       old->npages * sizeof(*old->pages_addr));
+	}
+
+	new->flags = old->flags;
+	new->preferred_loc = old->preferred_loc;
+	new->prefetch_loc = old->prefetch_loc;
+	new->actual_loc = old->actual_loc;
+	new->granularity = old->granularity;
+	bitmap_copy(new->bitmap_access, old->bitmap_access, MAX_GPU_INSTANCE);
+	bitmap_copy(new->bitmap_aip, old->bitmap_aip, MAX_GPU_INSTANCE);
+
+	return new;
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
+ *               not changes. For set_attr, this will add into svms.
+ * @remove_list:output, the ranges will be removed from svms
+ * @left: the remaining range after overlap, For set_attr, this will be added
+ *        as new range.
+ *
+ * Total have 5 overlap cases.
+ *
+ * This function handles overlap of an address interval with existing
+ * struct svm_ranges for applying new attributes. This may require
+ * splitting existing struct svm_ranges. All changes should be applied to
+ * the range_list and interval tree transactionally. If any split operation
+ * fails, the entire update fails. Therefore the existing overlapping
+ * svm_ranges are cloned and the original svm_ranges left unchanged. If the
+ * transaction succeeds, the modified clones are added and the originals
+ * freed. Otherwise the clones are removed and the old svm_ranges remain.
+ *
+ * Context: The caller must hold svms->lock
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
+		struct svm_range *old;
+		unsigned long next_start;
+
+		pr_debug("found overlap node [0x%lx 0x%lx]\n", node->start,
+			 node->last);
+
+		old = container_of(node, struct svm_range, it_node);
+		next = interval_tree_iter_next(node, start, last);
+		next_start = min(node->last, last) + 1;
+
+		if (node->start < start || node->last > last) {
+			/* node intersects the updated range, clone+split it */
+			prange = svm_range_clone(old);
+			if (!prange) {
+				r = -ENOMEM;
+				goto out;
+			}
+
+			list_add(&old->remove_list, remove_list);
+			list_add(&prange->insert_list, insert_list);
+
+			if (node->start < start) {
+				pr_debug("change old range start\n");
+				r = svm_range_split_head(prange, new, start,
+							 insert_list);
+				if (r)
+					goto out;
+			}
+			if (node->last > last) {
+				pr_debug("change old range last\n");
+				r = svm_range_split_tail(prange, new, last,
+							 insert_list);
+				if (r)
+					goto out;
+			}
+		} else {
+			/* The node is contained within start..last,
+			 * just update it
+			 */
+			prange = old;
+		}
+
+		if (!svm_range_is_same_attrs(prange, new))
+			list_add(&prange->update_list, update_list);
+
+		/* insert a new node if needed */
+		if (node->start > start) {
+			prange = svm_range_new(prange->svms, start,
+					       node->start - 1);
+			if (!prange) {
+				r = -ENOMEM;
+				goto out;
+			}
+
+			list_add(&prange->insert_list, insert_list);
+			list_add(&prange->update_list, update_list);
+		}
+
+		node = next;
+		start = next_start;
+	}
+
+	if (left && start <= last)
+		*left = last - start + 1;
+
+out:
+	if (r)
+		list_for_each_entry_safe(prange, tmp, insert_list, insert_list)
+			svm_range_free(prange);
+
+	return r;
+}
+
+void svm_range_list_fini(struct kfd_process *p)
+{
+	pr_debug("pasid 0x%x svms 0x%p\n", p->pasid, &p->svms);
+}
+
+int svm_range_list_init(struct kfd_process *p)
+{
+	struct svm_range_list *svms = &p->svms;
+
+	svms->objects = RB_ROOT_CACHED;
+	mutex_init(&svms->lock);
+	INIT_LIST_HEAD(&svms->list);
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
+ * Context: Process context, caller must hold svms->lock
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
+	svm_range_apply_attrs(p, &new, nattr, attrs);
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
+		list_add(&prange->insert_list, insert_list);
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
+	struct svm_range *next;
+	int r = 0;
+
+	pr_debug("pasid 0x%x svms 0x%p [0x%llx 0x%llx] pages 0x%llx\n",
+		 p->pasid, &p->svms, start, start + size - 1, size);
+
+	r = svm_range_check_attr(p, nattr, attrs);
+	if (r)
+		return r;
+
+	svms = &p->svms;
+
+	mutex_lock(&process_info->lock);
+
+	mmap_write_lock(mm);
+
+	if (!svm_range_is_valid(mm, start, size)) {
+		pr_debug("invalid range\n");
+		r = -EFAULT;
+		mmap_write_unlock(mm);
+		goto out;
+	}
+
+	mutex_lock(&svms->lock);
+
+	/* Add new range and split existing ranges as needed */
+	r = svm_range_add(p, start, size, nattr, attrs, &update_list,
+			  &insert_list, &remove_list);
+	if (r) {
+		mutex_unlock(&svms->lock);
+		mmap_write_unlock(mm);
+		goto out;
+	}
+	/* Apply changes as a transaction */
+	list_for_each_entry_safe(prange, next, &insert_list, insert_list) {
+		svm_range_add_to_svms(prange);
+	}
+	list_for_each_entry(prange, &update_list, update_list) {
+		svm_range_apply_attrs(p, prange, nattr, attrs);
+		/* TODO: unmap ranges from GPU that lost access */
+	}
+	list_for_each_entry_safe(prange, next, &remove_list,
+				remove_list) {
+		pr_debug("unlink old 0x%p prange 0x%p [0x%lx 0x%lx]\n",
+			 prange->svms, prange, prange->start,
+			 prange->last);
+		svm_range_unlink(prange);
+		svm_range_free(prange);
+	}
+
+	mmap_write_downgrade(mm);
+	/* Trigger migrations and revalidate and map to GPUs as needed. If
+	 * this fails we may be left with partially completed actions. There
+	 * is no clean way of rolling back to the previous state in such a
+	 * case because the rollback wouldn't be guaranteed to work either.
+	 */
+	list_for_each_entry(prange, &update_list, update_list) {
+		/* TODO */
+	}
+
+	svm_range_debug_dump(svms);
+
+	mutex_unlock(&svms->lock);
+	mmap_read_unlock(mm);
+out:
+	mutex_unlock(&process_info->lock);
+
+	pr_debug("pasid 0x%x svms 0x%p [0x%llx 0x%llx] done, r=%d\n", p->pasid,
+		 &p->svms, start, start + size - 1, r);
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
index 000000000000..c46cdad9d1a3
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -0,0 +1,87 @@
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
+ * @start:      range start address in pages
+ * @last:       range last address in pages
+ * @it_node:    node [start, last] stored in interval tree, start, last are page
+ *              aligned, page size is (last - start + 1)
+ * @list:       link list node, used to scan all ranges of svms
+ * @update_list:link list node used to add to update_list
+ * @remove_list:link list node used to add to remove list
+ * @insert_list:link list node used to add to insert list
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
+	unsigned long			start;
+	unsigned long			last;
+	struct interval_tree_node	it_node;
+	struct list_head		list;
+	struct list_head		update_list;
+	struct list_head		remove_list;
+	struct list_head		insert_list;
+	uint64_t			npages;
+	unsigned long			*pages_addr;
+	uint32_t			flags;
+	uint32_t			preferred_loc;
+	uint32_t			prefetch_loc;
+	uint32_t			actual_loc;
+	uint8_t				granularity;
+	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
+	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
+};
+
+int svm_range_list_init(struct kfd_process *p);
+void svm_range_list_fini(struct kfd_process *p);
+int svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
+	      uint64_t size, uint32_t nattrs,
+	      struct kfd_ioctl_svm_attribute *attrs);
+
+#endif /* KFD_SVM_H_ */
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
