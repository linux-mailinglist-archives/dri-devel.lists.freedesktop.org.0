Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0CF3704CA
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D3F6F62D;
	Sat,  1 May 2021 01:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6458A6F62A;
 Sat,  1 May 2021 01:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GexgMiODj4rDiy/hE7yFBi230FzSguLP0+Ny6zhrdPajxfabC1uRUju/Ylqz12nnnC1FuElsgTHNqhwLXOBmQhsZQrH6UbttUb4BlQjj2uyRyZ9kkOgKLz3O7YalZ4IHrv9Hasfs5rOfivJ5tVh+ZXFppS7u8jNnL8h4F4gON6bQYrut9IXyrXvB+fYiaOyHp49RhQu7MFhH0XD/1f0HvlfSsMGBLbVHbzW1ejnRif/MgIKBL4U8qTuf0xvRPLunSHg5ZDC7ENG3u5L4if5mVjX9Nx8XDFQweMmsv60djZKSu0nrqQU4gU0gKJL/AH7d8VPW5Zqy3trmzil34KgnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGbL5Z1uEJL6qKbL9W3FhW+k+4tH61MLCE34y69t2Bo=;
 b=AJniU+jgl1oz8Jr6ivfJWfR4rn2oQtKIW7bzdjo/JkhY0WZNhYVWFG220A+OPQ5fR4OhPHQmNQK/leOg8YKhpT/Urk9scd7aH/sUl4T+UciiBLNf0284O+mrwepbWXoACDQnNV1rRc4Nl3aFoURx+iIaM+flEJOUqyBbIlLiHe6DbNPM4cwm0mVn/UJSOOkM/wLChgoqYKA1+tS0VsMn8+ZVcSvVvctw5E4YvBOY2O/+AG+DIZrWgDc/eubRAVAIj+u9zDgLI7eea+Ox0wJb64hPq2UV9yTyHmFBXiadEz7MZ419NE1aI7/az6sc3XHFedu0oQFk8j09UYqhpBH6qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGbL5Z1uEJL6qKbL9W3FhW+k+4tH61MLCE34y69t2Bo=;
 b=x7hf8r1IOAFJ9ZVn9UFPKC3cGzv+VBNFc9E18E7pZASM+TGPTqo6f5Q04qk3PL3TgBTxwx3523uj2YsqEkFFEANQ1yuXS/HM5m4Vk9q6bBSzedUNtVzL8JitXLzeS52BvjoRHBFYmDViTnIO8JbRKe2cfVmRZDyQGYZH4VuQQyw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (52.135.46.212) by
 MN2PR12MB4142.namprd12.prod.outlook.com (52.135.51.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25; Sat, 1 May 2021 01:58:22 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:22 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 05/17] drm/amdkfd: CRIU Implement KFD dumper ioctl
Date: Fri, 30 Apr 2021 21:57:40 -0400
Message-Id: <20210501015752.888-6-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501015752.888-1-Felix.Kuehling@amd.com>
References: <20210501015752.888-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.54.211) by
 YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 633a62bf-04ff-42aa-9eca-08d90c44999b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4142009E3075170398F5B6B9925D9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nyhVKw77Slpvb75GM0gEpHAlIfMX4O9D6PQ9pBG6LUF17N1ST9E5ghEfBvWDk29Ztds88Z4RlbBFS5g5NONpG1yx7YHR8kDZzIMjV4dRul3XL6XMxjpNU4dikRRblKcXJkSjAuqRNVCWOSGYYReKsqrx9pXXeWlgSKlsVfAcG2EcowZv/2yaVfbTClWV0EOqU2fUr6XC1LNoO7DZ5f5nwCbY2dr18N7eRkb/kO4JtVebpJb8OnI8BGUYg0mupDfmQVLCE/FkNdIX+tMjnTf8U0ZwNsrRb8S13Q02pAAWhTPfD+WEfuiaBlPQvsef0+iWDSdcMU89WUx/rTfbL16Aun+OUW7jqd3tPOpGRMJosE29CcYoMk1J7L1Ce1SY+UY/kgNYpQFg2xT2UA/4AyAykXPK9iGmggs1QclevFnfJRtnHZyZSxu7J89VTfQWYNHR8tMEnAiKi9PTCc9KQ32/gPuUi2j1DzpIRQtq+duLanYg4oekMdmKWYfk1nVKR6P6GsjPKDWdjMNfQYQ7sQPuIFULvGdVjp6zKNMTBb4tNTYAIC5l/fmaMGweyemqf4/clDEwyWjfZoOhrhtRdMOFb8gtOg3ZDNIuwM/83TPCAY25g9vsDDvSTZzZRUqQbDOoYeRZLOQNRgMJid3kYzeLMl1ylfUVaspXak8GZ0ez9D19ggGruOq1eui4TY1JNbHf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(66556008)(6506007)(54906003)(2616005)(66946007)(66476007)(52116002)(956004)(38100700002)(6512007)(450100002)(4326008)(8676002)(8936002)(478600001)(2906002)(6486002)(86362001)(26005)(186003)(16526019)(83380400001)(5660300002)(1076003)(36756003)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PEq+30bMywq7nBnKfhnjcCuEDUVpFIIZ5B8p8m/4dvXoH9p+6vZrLyHVFm4X?=
 =?us-ascii?Q?ysxgGESEMTZp69PfN+G/v/I86N7tbE9OPWdOpuMGdLMTRCNGGu0BFJTCTNV8?=
 =?us-ascii?Q?RW9VO+D1UZ+el3IJmVujryg3y2ReGQmMEOEl/2m54zupnUEtKjZabisN3FO5?=
 =?us-ascii?Q?+2upfpgLDY6L8IQNJkjSwhGd8v60Vo2oOoSefY/gs4rQ+L2aJenK96Jh45+s?=
 =?us-ascii?Q?f7rSyD1MNoQuJGpDiiQ2ekaaSHVovnF9gOB/yqiQdsIAGatIknzWzM/jr6CR?=
 =?us-ascii?Q?q5za+WTz3fvGhgZriSTCMbAxOsfDeHOLLZTLFgRzqJTs0hjCT986xwkjJKx7?=
 =?us-ascii?Q?PikwY/negToPu8V6DU15JPCYBtTkkKcoucLlDqi9KGBQFLlc7ybIYmrY2d4E?=
 =?us-ascii?Q?DRi7sIZ/+iOPfjcPjl9v2V0jBtHLGd2Jbz/znWzsDIAV01bvF0OWfj6lFiFz?=
 =?us-ascii?Q?kELFQ72JjBkb6X6pa/DY35dIel2fR42CVlDe5sZ1dL8Wm8aaeJBfLXVgTapf?=
 =?us-ascii?Q?8H6V0sJUxeuaaeX4+wXNWZhseGgN1U5cgpUsR7z3XBFjeVureEtfITiXFTzz?=
 =?us-ascii?Q?vUEwZTB/AFgvBdDol6M51hd9d/jLoZ3xvR5mfsHLoaVVLPfqSEFGFuMp1e7v?=
 =?us-ascii?Q?AIQyYwnO5nFNYPggn1IjLNLb4nuwyP14mejH9TH1sNrtfqMhGTwSbTVB+1sP?=
 =?us-ascii?Q?yW8+wEwMzKJJ8M82qbHQiT5qFZ5AcqILG0LQPf1Y12DJcePZG8o2Fev6GQjT?=
 =?us-ascii?Q?BvQGfO72TmKV5SzzF/Xm2BZRpulUte6tV+yz3kVSnlbkcQDBDWSM7mxK2vX1?=
 =?us-ascii?Q?NXULavb4zo2k4ONGJYRvZWiEk2X4LGgU0iJTt6cD8zxmO2v/pPTGhow+xKJM?=
 =?us-ascii?Q?lPcRQYFUbjp4slFyJ0ZvLoKACQIFyKNz971bAmiUOjazJn/8G6bnbgQVDCw7?=
 =?us-ascii?Q?ZkHuGDiSttjzTTgmcUmWldZpEg5EvvH3tpdDLOxV/sxFtN7JrMRvuUeY3uYe?=
 =?us-ascii?Q?PSaXpKswMpgRmnXwJ4innIC3JRaYIUnWGVjlz3ui5SL9HuuqfB8u0q1sx9xE?=
 =?us-ascii?Q?0WBBdrD4r1WKeDIbyL36lw/FV9Ulo+feElnqDMoci3HTnBsL6C4aeeByYugU?=
 =?us-ascii?Q?U4IkzSVklJ4+I8JacnyyiTzlNK0ZbqVD2ObP0im4ZwDUfNT0Nnp7TYC9Zwb9?=
 =?us-ascii?Q?UyEgz15vN+crTVBniktWxF7T9O4QfzcmH6ak3z9KJDhlAykQnk+qKBLO1DYo?=
 =?us-ascii?Q?VQiM0AqUq/kgte1LOfRSGOWustVvxYYbttjkf0fR9gmW/zkG1wkZc0vNVyxq?=
 =?us-ascii?Q?IVeY6KmPsMhzn3vx21g2wzhz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633a62bf-04ff-42aa-9eca-08d90c44999b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:22.5840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QY0N/vBQiB9NM3ejrpSSSe0Z3CA2CHKqewQQJS+dmF5XAL/H8UvMHnMLMNMQx7wW8zeV6rlF8r3o5SygsOSOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: David Yat Sin <david.yatsin@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

This adds support to discover the buffer objects that belong to a
process being checkpointed. The data corresponding to these buffer
objects is returned to user space plugin running under criu master
context which then stores this info to recreate these buffer objects
during a restore operation.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
(cherry picked from commit 1f114a541bd21873de905db64bb9efa673274d4b)
(cherry picked from commit 20c435fad57d3201e5402e38ae778f1f0f84a09d)
Change-Id: Ifdbeee3606578db61bdc9aca7528272e20a38256
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 96 +++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 6b347ce5992f..1454f5613e60 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -42,6 +42,7 @@
 #include "kfd_svm.h"
 #include "amdgpu_amdkfd.h"
 #include "kfd_smi_events.h"
+#include "amdgpu_object.h"
 
 static long kfd_ioctl(struct file *, unsigned int, unsigned long);
 static int kfd_open(struct inode *, struct file *);
@@ -1806,9 +1807,102 @@ static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 static int kfd_ioctl_criu_dumper(struct file *filep,
 				struct kfd_process *p, void *data)
 {
+	struct kfd_ioctl_criu_dumper_args *args = data;
+	struct kfd_criu_bo_buckets *bo_bucket;
+	struct amdgpu_bo *dumper_bo;
+	int ret, id, index, i = 0;
+	struct kgd_mem *kgd_mem;
+	void *mem;
+
 	pr_info("Inside %s\n",__func__);
 
-	return 0;
+	if (args->num_of_bos == 0) {
+		pr_err("No BOs to be dumped\n");
+		return -EINVAL;
+	}
+
+	if (p->n_pdds != args->num_of_devices) {
+		pr_err("Invalid number of devices %d (expected = %d)\n",
+								args->num_of_devices, p->n_pdds);
+		return -EINVAL;
+	}
+
+	pr_debug("num of bos = %llu\n", args->num_of_bos);
+
+	bo_bucket = kvzalloc((sizeof(struct kfd_criu_bo_buckets) *
+			     args->num_of_bos), GFP_KERNEL);
+	if (!bo_bucket)
+		return -ENOMEM;
+
+	mutex_lock(&p->mutex);
+
+	if (!kfd_has_process_device_data(p)) {
+		pr_err("No pdd for given process\n");
+		ret = -ENODEV;
+		goto err_unlock;
+	}
+
+	/* Run over all PDDs of the process */
+	for (index = 0; index < p->n_pdds; index++) {
+		struct kfd_process_device *pdd = p->pdds[index];
+
+		idr_for_each_entry(&pdd->alloc_idr, mem, id) {
+			if (!mem) {
+				ret = -ENOMEM;
+				goto err_unlock;
+			}
+
+			kgd_mem = (struct kgd_mem *)mem;
+			dumper_bo = kgd_mem->bo;
+
+			if ((uint64_t)kgd_mem->va > pdd->gpuvm_base) {
+				if (i >= args->num_of_bos) {
+					pr_err("Num of BOs changed since last helper ioctl call\n");
+					ret = -EINVAL;
+					goto err_unlock;
+				}
+
+				bo_bucket[i].bo_addr = (uint64_t)kgd_mem->va;
+				bo_bucket[i].bo_size = amdgpu_bo_size(dumper_bo);
+				bo_bucket[i].gpu_id = pdd->dev->id;
+				bo_bucket[i].bo_alloc_flags = (uint32_t)kgd_mem->alloc_flags;
+				bo_bucket[i].idr_handle = id;
+
+				if (bo_bucket[i].bo_alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
+					bo_bucket[i].bo_offset = KFD_MMAP_TYPE_DOORBELL |
+						KFD_MMAP_GPU_ID(pdd->dev->id);
+				else if (bo_bucket[i].bo_alloc_flags &
+				    KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP)
+					bo_bucket[i].bo_offset = KFD_MMAP_TYPE_MMIO |
+						KFD_MMAP_GPU_ID(pdd->dev->id);
+				else
+					bo_bucket[i].bo_offset = amdgpu_bo_mmap_offset(dumper_bo);
+
+				pr_debug("bo_size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n"
+					 "gpu_id = 0x%x alloc_flags = 0x%x idr_handle = 0x%x",
+					 bo_bucket[i].bo_size,
+					 bo_bucket[i].bo_addr,
+					 bo_bucket[i].bo_offset,
+					 bo_bucket[i].gpu_id,
+					 bo_bucket[i].bo_alloc_flags,
+					 bo_bucket[i].idr_handle);
+				i++;
+			}
+		}
+	}
+
+	ret = copy_to_user((void __user *)args->kfd_criu_bo_buckets_ptr,
+			bo_bucket,
+			(args->num_of_bos *
+			 sizeof(struct kfd_criu_bo_buckets)));
+	kvfree(bo_bucket);
+	mutex_unlock(&p->mutex);
+	return ret ? -EFAULT : 0;
+
+err_unlock:
+	mutex_unlock(&p->mutex);
+	pr_err("Dumper ioctl failed err:%d\n", ret);
+	return ret;
 }
 
 static int kfd_ioctl_criu_restorer(struct file *filep,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
