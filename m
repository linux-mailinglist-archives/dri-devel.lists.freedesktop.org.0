Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C07B314A0F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 09:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A5E6EB3E;
	Tue,  9 Feb 2021 07:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4626E6EA6D;
 Tue,  9 Feb 2021 01:14:43 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6021e0d70000>; Mon, 08 Feb 2021 17:09:43 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 01:09:42 +0000
Received: from localhost (172.20.145.6) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 01:09:42 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH 7/9] nouveau/svm: Refactor nouveau_range_fault
Date: Tue, 9 Feb 2021 12:07:20 +1100
Message-ID: <20210209010722.13839-8-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209010722.13839-1-apopple@nvidia.com>
References: <20210209010722.13839-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612832983; bh=/0aXIpMNQSL0FUewLuYlelhhBUIfEJ6iMMcRUZ+kk+8=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=WF7S7iK6/QWbrW9k0bDZ2GomZQO/T/YDGZc9n//0dm9ost/4B48mXEu6WaksKERkw
 jCWu1McL+qQAAxUhZGe85iX2RnhDmETJ6L/BZR6j9TtP9JM+QJyWZ6M//A+Ijh88XO
 /+AzmUBT/FdsjyOPMK5ttSrp3TNEHVVWidorRX2noCwW14IhGpoX0cz693HQ2QqdFn
 wi3fk44sBuSeILPVG1edpKN3ghizzLPtdsqn/l6QuTQPn41YMYVBtFS3lwgDhutbYm
 OOcbZ0YV2FGxZnzFce6e2K/UjCLafBcHGOwacYZMjG+VfTCTQ7k9q4qdV3l1z0q7fr
 GHRFvlsMqL36A==
X-Mailman-Approved-At: Tue, 09 Feb 2021 07:56:28 +0000
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
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call mmu_interval_notifier_insert() as part of nouveau_range_fault().
This doesn't introduce any functional change but makes it easier for a
subsequent patch to alter the behaviour of nouveau_range_fault() to
support GPU atomic operations.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 34 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 1c3f890377d2..63332387402e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -567,18 +567,27 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	unsigned long hmm_pfns[1];
 	struct hmm_range range = {
 		.notifier = &notifier->notifier,
-		.start = notifier->notifier.interval_tree.start,
-		.end = notifier->notifier.interval_tree.last + 1,
 		.default_flags = hmm_flags,
 		.hmm_pfns = hmm_pfns,
 		.dev_private_owner = drm->dev,
 	};
-	struct mm_struct *mm = notifier->notifier.mm;
+	struct mm_struct *mm = svmm->notifier.mm;
 	int ret;
 
+	ret = mmu_interval_notifier_insert(&notifier->notifier, mm,
+					args->p.addr, args->p.size,
+					&nouveau_svm_mni_ops);
+	if (ret)
+		return ret;
+
+	range.start = notifier->notifier.interval_tree.start;
+	range.end = notifier->notifier.interval_tree.last + 1;
+
 	while (true) {
-		if (time_after(jiffies, timeout))
-			return -EBUSY;
+		if (time_after(jiffies, timeout)) {
+			ret = -EBUSY;
+			goto out;
+		}
 
 		range.notifier_seq = mmu_interval_read_begin(range.notifier);
 		mmap_read_lock(mm);
@@ -587,7 +596,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		if (ret) {
 			if (ret == -EBUSY)
 				continue;
-			return ret;
+			goto out;
 		}
 
 		mutex_lock(&svmm->mutex);
@@ -606,6 +615,9 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	svmm->vmm->vmm.object.client->super = false;
 	mutex_unlock(&svmm->mutex);
 
+out:
+	mmu_interval_notifier_remove(&notifier->notifier);
+
 	return ret;
 }
 
@@ -727,14 +739,8 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		}
 
 		notifier.svmm = svmm;
-		ret = mmu_interval_notifier_insert(&notifier.notifier, mm,
-						   args.i.p.addr, args.i.p.size,
-						   &nouveau_svm_mni_ops);
-		if (!ret) {
-			ret = nouveau_range_fault(svmm, svm->drm, &args.i,
-				sizeof(args), hmm_flags, &notifier);
-			mmu_interval_notifier_remove(&notifier.notifier);
-		}
+		ret = nouveau_range_fault(svmm, svm->drm, &args.i,
+					sizeof(args), hmm_flags, &notifier);
 		mmput(mm);
 
 		limit = args.i.p.addr + args.i.p.size;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
