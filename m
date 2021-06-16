Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5CD3A9884
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 13:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5344B6E5AE;
	Wed, 16 Jun 2021 11:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C85D6E5B4;
 Wed, 16 Jun 2021 11:01:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlgEE7TqDqkCmBEM18wmh/KDYRDgShjSeR5d8wrKhpan0cbdyoEZa270bs4EeKebo8l1f2z2bblaksywuEPPox+YmajmJx4YLwvu9CjwcWN8EzE87fL2i1Lb1pjUEHnRqqDaqpdyDvM6HHdEPmnhJforFlrrQGkpMgIzND/AkW0dlkHw1qnUBT0MqDmbIZIRRvR3ugz7dSEaz78Ify6LXoUgAA9p8L75yG687uVEx2+0RLocgbgY0EQt78YwsFfhhSp17fOY/IPwQrgoWf0vjMWygjaSo5vXwF3lL93ZO6tChQhHlofzuKVDEXtskMvNIu+MdOMbhby1pBeQmRCXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vq6pmlt0r6VarlndLu5yDGAmcM2GmJMglRhjK5ah0Jc=;
 b=A8ucvkQT/twpDSASJXZSDVAIhgF7+4JzS+XGlkxgW/QBGbgwIGnSpz8DAK5NR2P1EVu07NFtKZUFdkKnkcr9OFLZmPTFnTyMp9vZKJdCt8rC2tvpN6x7YXvnwMlFKbt+SLhO9aVjhfbwzk0CJ6JRsfxfqJUb2M3dGh4DnfIFeU3zlu19Jd8rUBaR4UGhEBiw/yWZlzg9ocFvlTiQWtQLUnryvuqPA9vH6MVwr8VNRS4v+rCGOksXWoElvl5JR+/fPiPqV7x8tyETzrmwMaTZpPfWDX5mUysjwr3PSZxM11i9ZLVP4+C4r9xxqRz84cWPS3NKQ7epNhHttn3W18rfHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vq6pmlt0r6VarlndLu5yDGAmcM2GmJMglRhjK5ah0Jc=;
 b=Ks6KS0XKZ72uUlLqGMaAMQ1Er0U+JmS6PP7q7/UZQprcvj3uVgyyZAtbqbylZhJ6m6/qokn7A373pAdTa+v+sxkYYFyYh2pAoLYbEzNCMex4u4Q+bPFjABwjuDKcvgmL2o5Pj+Io180gfzR2jk4P+W36GOS0cC+wWyrjfPENvszBiiOocCV+Hd4bL6pNIsdmzk+32i7w3PxgLPAq5wPX2eJR497ZTEadVPEm189xXWH3NQB90iMubGSQzLIcL5bD/vtKHX+PMETy+uW7TSXNA3WWJN05jXe4z2vcX6RKkTxu+d6uNWZ/AyumiRU9yoSbBkc656tsrHCH+/d0pjGu6w==
Received: from BN6PR19CA0082.namprd19.prod.outlook.com (2603:10b6:404:133::20)
 by BYAPR12MB3430.namprd12.prod.outlook.com (2603:10b6:a03:ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Wed, 16 Jun
 2021 11:01:10 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:133:cafe::3d) by BN6PR19CA0082.outlook.office365.com
 (2603:10b6:404:133::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend
 Transport; Wed, 16 Jun 2021 11:01:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 11:01:10 +0000
Received: from localhost (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 11:01:09 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>
Subject: [PATCH v11 10/10] nouveau/svm: Implement atomic SVM access
Date: Wed, 16 Jun 2021 20:59:37 +1000
Message-ID: <20210616105937.23201-11-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210616105937.23201-1-apopple@nvidia.com>
References: <20210616105937.23201-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9efe428-0fc7-40ce-a343-08d930b60c88
X-MS-TrafficTypeDiagnostic: BYAPR12MB3430:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3430E1C81B5075FC7063F9DCDF0F9@BYAPR12MB3430.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:541;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m3ArvXhXnnHpY4ELSk3n4eRr+4cANVqa2h10lsH88MyKWf90teL1wfuegwlVI+eQ9vInO37RX+dzgb1qK4xEHgaE8WitXQU62KNDGMAwVQJfNXW5Bg1NbezNduuFwwqU0LGQpcQ3qYAeBm/0yRxASRDQ6dEmiOQa2hVLf6ID9HEDfAnnf7a6vYVBoc/CaxGt+v4OapgyWlDAIb3xG+CJO1icI2Ep8jGENuTMO4i+j1Y2K1z2g0XGkL3/wRC4xCWo6yiXMTPU3KL3FuGwi00AgETfwKb6EzvH46wOO4aJqcWsxUYuQX0B+SNn6qK9+whdLbbl3j9bXVOyv2S5UCCNhbh5FlHEvF/cmr4PnbdR9KihvhlfWEHkh44dkrnFnuaJZVWj3F7JX6ohnrHjwwZu4Ld+FY8Bw6gwYJY649D71LjAQnMbR3iZl3o1N9W5iodcGWIrr3fZvOGf0WY4bvcXy79jXN7E2XLNZJM6XL8MMzIv8NTLgF2Kq7wBPJIxXDuS9bHzqNmYPzk3B0RXV9bxrsfLga45AP76KvNxfBsMcTOPn8xdkG1v82OjKbpOlT6oMGzDLsuPktw1ftEKxdP4vQm3AcEXhwUz7HLCNpQnydVq+stbjnJWmyjuwYJgeFgh7xQ9iWeQU5SwKuukv2Uf3estuRL0hP/cLqvg+E4zQfwqpyr8yqZMlmlp3qvCaGNO
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(36840700001)(46966006)(83380400001)(356005)(70586007)(7636003)(6666004)(478600001)(107886003)(82310400003)(5660300002)(26005)(1076003)(36860700001)(70206006)(4326008)(47076005)(2906002)(7416002)(86362001)(36906005)(54906003)(336012)(82740400003)(16526019)(8936002)(2616005)(8676002)(186003)(426003)(6916009)(36756003)(316002)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 11:01:10.0259 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9efe428-0fc7-40ce-a343-08d930b60c88
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3430
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org, willy@infradead.org,
 hch@infradead.org, linux-mm@kvack.org, peterx@redhat.com, shakeelb@google.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, jhubbard@nvidia.com,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some NVIDIA GPUs do not support direct atomic access to system memory
via PCIe. Instead this must be emulated by granting the GPU exclusive
access to the memory. This is achieved by replacing CPU page table
entries with special swap entries that fault on userspace access.

The driver then grants the GPU permission to update the page undergoing
atomic access via the GPU page tables. When CPU access to the page is
required a CPU fault is raised which calls into the device driver via
MMU notifiers to revoke the atomic access. The original page table
entries are then restored allowing CPU access to proceed.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

---

v10:
* Added a fix from Colin King to check the return code of
  make_device_exclusive.

v9:
* Added Ben's Reviewed-By

v7:
* Removed magic values for fault access levels
* Improved readability of fault comparison code

v4:
* Check that page table entries haven't changed before mapping on the
  device
---
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 126 ++++++++++++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   6 +
 4 files changed, 123 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000c.h b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
index d6dd40f21eed..9c7ff56831c5 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if000c.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
@@ -77,6 +77,7 @@ struct nvif_vmm_pfnmap_v0 {
 #define NVIF_VMM_PFNMAP_V0_APER                           0x00000000000000f0ULL
 #define NVIF_VMM_PFNMAP_V0_HOST                           0x0000000000000000ULL
 #define NVIF_VMM_PFNMAP_V0_VRAM                           0x0000000000000010ULL
+#define NVIF_VMM_PFNMAP_V0_A				  0x0000000000000004ULL
 #define NVIF_VMM_PFNMAP_V0_W                              0x0000000000000002ULL
 #define NVIF_VMM_PFNMAP_V0_V                              0x0000000000000001ULL
 #define NVIF_VMM_PFNMAP_V0_NONE                           0x0000000000000000ULL
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index a195e48c9aee..63a4976b906b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -35,6 +35,7 @@
 #include <linux/sched/mm.h>
 #include <linux/sort.h>
 #include <linux/hmm.h>
+#include <linux/rmap.h>
 
 struct nouveau_svm {
 	struct nouveau_drm *drm;
@@ -67,6 +68,11 @@ struct nouveau_svm {
 	} buffer[1];
 };
 
+#define FAULT_ACCESS_READ 0
+#define FAULT_ACCESS_WRITE 1
+#define FAULT_ACCESS_ATOMIC 2
+#define FAULT_ACCESS_PREFETCH 3
+
 #define SVM_DBG(s,f,a...) NV_DEBUG((s)->drm, "svm: "f"\n", ##a)
 #define SVM_ERR(s,f,a...) NV_WARN((s)->drm, "svm: "f"\n", ##a)
 
@@ -411,6 +417,24 @@ nouveau_svm_fault_cancel_fault(struct nouveau_svm *svm,
 				      fault->client);
 }
 
+static int
+nouveau_svm_fault_priority(u8 fault)
+{
+	switch (fault) {
+	case FAULT_ACCESS_PREFETCH:
+		return 0;
+	case FAULT_ACCESS_READ:
+		return 1;
+	case FAULT_ACCESS_WRITE:
+		return 2;
+	case FAULT_ACCESS_ATOMIC:
+		return 3;
+	default:
+		WARN_ON_ONCE(1);
+		return -1;
+	}
+}
+
 static int
 nouveau_svm_fault_cmp(const void *a, const void *b)
 {
@@ -421,9 +445,8 @@ nouveau_svm_fault_cmp(const void *a, const void *b)
 		return ret;
 	if ((ret = (s64)fa->addr - fb->addr))
 		return ret;
-	/*XXX: atomic? */
-	return (fa->access == 0 || fa->access == 3) -
-	       (fb->access == 0 || fb->access == 3);
+	return nouveau_svm_fault_priority(fa->access) -
+		nouveau_svm_fault_priority(fb->access);
 }
 
 static void
@@ -487,6 +510,10 @@ static bool nouveau_svm_range_invalidate(struct mmu_interval_notifier *mni,
 	struct svm_notifier *sn =
 		container_of(mni, struct svm_notifier, notifier);
 
+	if (range->event == MMU_NOTIFY_EXCLUSIVE &&
+	    range->owner == sn->svmm->vmm->cli->drm->dev)
+		return true;
+
 	/*
 	 * serializes the update to mni->invalidate_seq done by caller and
 	 * prevents invalidation of the PTE from progressing while HW is being
@@ -555,6 +582,71 @@ static void nouveau_hmm_convert_pfn(struct nouveau_drm *drm,
 		args->p.phys[0] |= NVIF_VMM_PFNMAP_V0_W;
 }
 
+static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
+			       struct nouveau_drm *drm,
+			       struct nouveau_pfnmap_args *args, u32 size,
+			       struct svm_notifier *notifier)
+{
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	struct mm_struct *mm = svmm->notifier.mm;
+	struct page *page;
+	unsigned long start = args->p.addr;
+	unsigned long notifier_seq;
+	int ret = 0;
+
+	ret = mmu_interval_notifier_insert(&notifier->notifier, mm,
+					args->p.addr, args->p.size,
+					&nouveau_svm_mni_ops);
+	if (ret)
+		return ret;
+
+	while (true) {
+		if (time_after(jiffies, timeout)) {
+			ret = -EBUSY;
+			goto out;
+		}
+
+		notifier_seq = mmu_interval_read_begin(&notifier->notifier);
+		mmap_read_lock(mm);
+		ret = make_device_exclusive_range(mm, start, start + PAGE_SIZE,
+					    &page, drm->dev);
+		mmap_read_unlock(mm);
+		if (ret <= 0 || !page) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		mutex_lock(&svmm->mutex);
+		if (!mmu_interval_read_retry(&notifier->notifier,
+					     notifier_seq))
+			break;
+		mutex_unlock(&svmm->mutex);
+	}
+
+	/* Map the page on the GPU. */
+	args->p.page = 12;
+	args->p.size = PAGE_SIZE;
+	args->p.addr = start;
+	args->p.phys[0] = page_to_phys(page) |
+		NVIF_VMM_PFNMAP_V0_V |
+		NVIF_VMM_PFNMAP_V0_W |
+		NVIF_VMM_PFNMAP_V0_A |
+		NVIF_VMM_PFNMAP_V0_HOST;
+
+	svmm->vmm->vmm.object.client->super = true;
+	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
+	svmm->vmm->vmm.object.client->super = false;
+	mutex_unlock(&svmm->mutex);
+
+	unlock_page(page);
+	put_page(page);
+
+out:
+	mmu_interval_notifier_remove(&notifier->notifier);
+	return ret;
+}
+
 static int nouveau_range_fault(struct nouveau_svmm *svmm,
 			       struct nouveau_drm *drm,
 			       struct nouveau_pfnmap_args *args, u32 size,
@@ -637,7 +729,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
 	unsigned long hmm_flags;
 	u64 inst, start, limit;
 	int fi, fn;
-	int replay = 0, ret;
+	int replay = 0, atomic = 0, ret;
 
 	/* Parse available fault buffer entries into a cache, and update
 	 * the GET pointer so HW can reuse the entries.
@@ -718,12 +810,14 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		/*
 		 * Determine required permissions based on GPU fault
 		 * access flags.
-		 * XXX: atomic?
 		 */
 		switch (buffer->fault[fi]->access) {
 		case 0: /* READ. */
 			hmm_flags = HMM_PFN_REQ_FAULT;
 			break;
+		case 2: /* ATOMIC. */
+			atomic = true;
+			break;
 		case 3: /* PREFETCH. */
 			hmm_flags = 0;
 			break;
@@ -739,8 +833,14 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		}
 
 		notifier.svmm = svmm;
-		ret = nouveau_range_fault(svmm, svm->drm, &args.i,
-					sizeof(args), hmm_flags, &notifier);
+		if (atomic)
+			ret = nouveau_atomic_range_fault(svmm, svm->drm,
+							 &args.i, sizeof(args),
+							 &notifier);
+		else
+			ret = nouveau_range_fault(svmm, svm->drm, &args.i,
+						  sizeof(args), hmm_flags,
+						  &notifier);
 		mmput(mm);
 
 		limit = args.i.p.addr + args.i.p.size;
@@ -756,11 +856,15 @@ nouveau_svm_fault(struct nvif_notify *notify)
 			 */
 			if (buffer->fault[fn]->svmm != svmm ||
 			    buffer->fault[fn]->addr >= limit ||
-			    (buffer->fault[fi]->access == 0 /* READ. */ &&
+			    (buffer->fault[fi]->access == FAULT_ACCESS_READ &&
 			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_V)) ||
-			    (buffer->fault[fi]->access != 0 /* READ. */ &&
-			     buffer->fault[fi]->access != 3 /* PREFETCH. */ &&
-			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_W)))
+			    (buffer->fault[fi]->access != FAULT_ACCESS_READ &&
+			     buffer->fault[fi]->access != FAULT_ACCESS_PREFETCH &&
+			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_W)) ||
+			    (buffer->fault[fi]->access != FAULT_ACCESS_READ &&
+			     buffer->fault[fi]->access != FAULT_ACCESS_WRITE &&
+			     buffer->fault[fi]->access != FAULT_ACCESS_PREFETCH &&
+			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_A)))
 				break;
 		}
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
index a2b179568970..f6188aa9171c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -178,6 +178,7 @@ void nvkm_vmm_unmap_region(struct nvkm_vmm *, struct nvkm_vma *);
 #define NVKM_VMM_PFN_APER                                 0x00000000000000f0ULL
 #define NVKM_VMM_PFN_HOST                                 0x0000000000000000ULL
 #define NVKM_VMM_PFN_VRAM                                 0x0000000000000010ULL
+#define NVKM_VMM_PFN_A					  0x0000000000000004ULL
 #define NVKM_VMM_PFN_W                                    0x0000000000000002ULL
 #define NVKM_VMM_PFN_V                                    0x0000000000000001ULL
 #define NVKM_VMM_PFN_NONE                                 0x0000000000000000ULL
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index 236db5570771..f02abd9cb4dd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -88,6 +88,9 @@ gp100_vmm_pgt_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 		if (!(*map->pfn & NVKM_VMM_PFN_W))
 			data |= BIT_ULL(6); /* RO. */
 
+		if (!(*map->pfn & NVKM_VMM_PFN_A))
+			data |= BIT_ULL(7); /* Atomic disable. */
+
 		if (!(*map->pfn & NVKM_VMM_PFN_VRAM)) {
 			addr = *map->pfn >> NVKM_VMM_PFN_ADDR_SHIFT;
 			addr = dma_map_page(dev, pfn_to_page(addr), 0,
@@ -322,6 +325,9 @@ gp100_vmm_pd0_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 		if (!(*map->pfn & NVKM_VMM_PFN_W))
 			data |= BIT_ULL(6); /* RO. */
 
+		if (!(*map->pfn & NVKM_VMM_PFN_A))
+			data |= BIT_ULL(7); /* Atomic disable. */
+
 		if (!(*map->pfn & NVKM_VMM_PFN_VRAM)) {
 			addr = *map->pfn >> NVKM_VMM_PFN_ADDR_SHIFT;
 			addr = dma_map_page(dev, pfn_to_page(addr), 0,
-- 
2.20.1

