Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD1435671B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 10:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E616E8DC;
	Wed,  7 Apr 2021 08:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B530E6E8DC;
 Wed,  7 Apr 2021 08:43:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHA60iqxlZMylqNijw8B+qk0TnF1ExVm/lMBjmNhSIh+SbgkszY8hTcpVHEyG48vtuNZczPyGev7z+5meFS8GUHDfcICPLmsrDXFT9Jc8SrKqJu63mw9xBzTgKvrv6P/prTmLIwY7S9mk5NzgivQplCm8s5wMNCvPzOV6qRPwfKLn9Y/9MLLzyYk5Xsq/bKhN7pslhr+3ykUPqHVq3VghSdhDsGBUhvG5ygjSlTc0mbddA337pj0K9Xhm9prggDBf4uZjSKJ1jzkehHy8bhuNgifzMJe8TykJS4WNI8QaKyMbNwivDm16oiHacAMLOmhz3pA+CkA9FeIHhRXXSJgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+FhVapwSn77mzCPj1dMMC/+xy+lBIzGdijBZNMgWL0=;
 b=gtSh4w5br1ixWd26VlC02RErpLhuFPco/omxyrtSuxya3qWvRD5BIFT7dyifQ3BqapMSmJ0uzqVd7TGHXOtSRxgyaTWaXkYBOMgbEcKiLaPaeM25PSg1IPXjT7/X6Nmpb0AZbeCeDbqX4zePdMFLPvvvkxZufBkZCnmEm6cHcuaOfp16mXlclJn/KIvraxUU6TIXIdwPQyLmc1R2uvEGmeqgXDzbm9yVnHox9SsW5DALQKQTNaXgBYnFlVnrzGbDkcITxJhGmzro0KX2V4XcJKPUOJ3w6C8NY9qHsxmceAZdjI6mimM/z2qMUf4xGILQG45KRKPsUOMqZN1CSZK0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+FhVapwSn77mzCPj1dMMC/+xy+lBIzGdijBZNMgWL0=;
 b=VMzoKt5gbLIalOGPKRxGahjjlSxEmFJFLbOigG6rVITAR4wAB1DGGJ3pBhHJAY4rY1WKiBCvsg0OZLbGY+9H3vvo5SYCFOJBH/xEuIerNeCE+o5/Hfnc9d07jsjegQKFt0h0nOJYCOLYQA4qbU7QaN8EKbVBznSaHjrIlnfgjN5qcwUD6+LUT9Znsv5s9fb0vnzR7c9NXhsgrHn/HPWvbPCSPqlJoUvFh2woTvXm8eJgFLHxy0mClaE847GtFpoC0Oe+x3X1NpUx+gS/G20FA6nHr3aI2XFV4el3vLv2SDcGZ+vGB4L9KKOIdJyTbKO0LwvGKVuUHRQooYfkP4oxOg==
Received: from BN0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:408:e6::8)
 by DM6PR12MB3066.namprd12.prod.outlook.com (2603:10b6:5:11a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Wed, 7 Apr
 2021 08:43:21 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::7b) by BN0PR03CA0003.outlook.office365.com
 (2603:10b6:408:e6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Wed, 7 Apr 2021 08:43:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 08:43:20 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Apr
 2021 08:43:19 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v8 8/8] nouveau/svm: Implement atomic SVM access
Date: Wed, 7 Apr 2021 18:42:38 +1000
Message-ID: <20210407084238.20443-9-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407084238.20443-1-apopple@nvidia.com>
References: <20210407084238.20443-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9995c607-3bb4-4a1c-2521-08d8f9a132dc
X-MS-TrafficTypeDiagnostic: DM6PR12MB3066:
X-Microsoft-Antispam-PRVS: <DM6PR12MB306652A7C32C36462C46CFA7DF759@DM6PR12MB3066.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:541;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7ldtU99J1m+xznj+lctWvdk68Xnrc3rogGiVZnWtRj7GbCw5EiwsHo5ZAQHJIb30lyzNCX/LTmwEaHN8ilI4sCq6ulxOGE3G99iUaxtn8Xq8wLZvvhZ5NFlNxXZsAXIy7p8G/ddif5IPsSKZbQQiOtbeGUelSVSKIkcunrzLV/XyfWDkVf/Ng4wLJk7oOPkKp24A9W5kXrvUkd7LWc9Gx8JqPVyrrSWByd6iH3CLEEkzaeOUcP6Ko5ElL5ndYxi6nxU+Ygq+3T++NHHPH9NJZ2tTi64Xh/OmSdYNQxs54D+nDDQyETealXWAHEFct0W9BF8QwHMj2firtkcF4K3ju1/WKlE0FWZSMtTWDFMIPyeiXOkPrqXwyB+LbiPoPE/wWqpsRtPDDNNg3iuaDZpkN8b3US6swi5cJTZzb1Up9a+bzmB5F8/YpzqUFAFYM6Jxbnsx7pRPLMVYHhRHk1fGWtlBnQ7tOtbzXgszrKyVNB/rSSARTTpfTYSbiNJVAzKgJyB2mt0DDQRFfY+z75X32/9bXm4ti++se2HQIk2YxY6kT5m6quA3KBZ1QieNU26ixyYS0eoygcebkNJtNmrHsWWKxom9r730CPufailkC1HJqs3KcXyP9vA6b+qTCmzaAH8ZU/mjyHkPMeNsPAwHPzmT9Gokxsccx1hTA66Bf7SdrCjis1wHDdgSrkDGVvnp
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(7416002)(6666004)(2906002)(83380400001)(70206006)(70586007)(110136005)(54906003)(356005)(82740400003)(47076005)(82310400003)(7636003)(86362001)(8936002)(36860700001)(26005)(316002)(16526019)(186003)(36906005)(5660300002)(478600001)(8676002)(1076003)(336012)(426003)(4326008)(2616005)(36756003)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 08:43:20.8765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9995c607-3bb4-4a1c-2521-08d8f9a132dc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3066
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 bsingharora@gmail.com, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, jglisse@redhat.com, willy@infradead.org, jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

---

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
index a195e48c9aee..81526d65b4e2 100644
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
+		make_device_exclusive_range(mm, start, start + PAGE_SIZE,
+					    &page, drm->dev);
+		mmap_read_unlock(mm);
+		if (!page) {
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
