Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22047307EF2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7536EA29;
	Thu, 28 Jan 2021 19:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02A86E901
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 08:38:20 +0000 (UTC)
Received: by mail-qv1-xf49.google.com with SMTP id h13so3241927qvs.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 00:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=5FeqogviNew+o0VUZFdW9/7nJCLDRVT518/ol39sXus=;
 b=feBp+DyLNzzD8X0Ce+CXsFWPnXv2fHlzLphroxefIAqmT+JpM/kjRlXM0jYBO49OB0
 aMbLpNbmmnzAi/9UeA27rngoE2YSbQbINyQmGOFdRSu2UFqfJfcUTP9rtzwGZ0L9HHw1
 SLgaBIz5JXj7JZm7XM2mrrlUWog1w7vMp3s/b7pJWhtCPqMKtE2nJL/jRLrXPTPbn31z
 NRBRmnHuYUqXhpQd+fV4beEmz8wBrUtAqV/TWS+n4934YebWuxgTEbyF/6L/nmSyr4IJ
 9noMeixTlrdTmBRDYfZr6AQTZ/a3enLlsVIh9lINb2G/9c4Eh6AqXwaIRNl65hidPi1T
 Q6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=5FeqogviNew+o0VUZFdW9/7nJCLDRVT518/ol39sXus=;
 b=c95bmBztOcwOoK0YK8IX4Tu/WT8q4zBxQwgQjISM5gD+HND4RtoEJ9iAZSTPJPCpO9
 I0nN/WSpC94YjPVrJkl8xcPxeLbujmNcF9WukfvM+fE9WJZhSolVqlH9mzGjsMZJCAly
 goY5RbM0+lieTT2dL4hipruldtTi/ewUsIETZ0ZlVoylvdHFSrm+T961oRm6RA+OHyJs
 r+qRraVb5nb5jsK/ICa35D5HUnzu2P5JmkY9AkHiIceVDUcZxKfoVDcSkZFiLevyBJ8n
 QVCyul21bGeLa7CFELNXlxibrfgQ5SYoLeBXvBdLfyBFjtjc55Z2ZNjwSw3i5Kxv3PHh
 7xDg==
X-Gm-Message-State: AOAM533PEip4hdgxpyXrfnumm3JoxM5RYAY6/0slFerIFNkv/RM830fs
 AtfW2qmSA/93059SxFuxrXf6cpZAqVk=
X-Google-Smtp-Source: ABdhPJxf8gcn/0Ccf1D2y+uKA7hjFIYYcMpDgFIBoM7I4ge4xPQw0/SKpxYwLJkEQuwnNCB8GYEYaWvd2vQ=
X-Received: from surenb1.mtv.corp.google.com
 ([2620:15c:211:200:f693:9fff:fef4:2055])
 (user=surenb job=sendgmr) by 2002:ad4:4d4c:: with SMTP id
 m12mr14286593qvm.6.1611823099629; 
 Thu, 28 Jan 2021 00:38:19 -0800 (PST)
Date: Thu, 28 Jan 2021 00:38:17 -0800
Message-Id: <20210128083817.314315-1-surenb@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH 1/1] dma-buf: heaps: Map system heap pages as managed by linux
 vm
From: Suren Baghdasaryan <surenb@google.com>
To: sumit.semwal@linaro.org
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
Cc: sspatil@google.com, cgoldswo@codeaurora.org, kernel-team@android.com,
 jajones@nvidia.com, surenb@google.com, linux-kernel@vger.kernel.org,
 lmark@codeaurora.org, linaro-mm-sig@lists.linaro.org, minchan@kernel.org,
 dri-devel@lists.freedesktop.org, hridya@google.com, orjan.eide@arm.com,
 labbott@redhat.com, robin.murphy@arm.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently system heap maps its buffers with VM_PFNMAP flag using
remap_pfn_range. This results in such buffers not being accounted
for in PSS calculations because vm treats this memory as having no
page structs. Without page structs there are no counters representing
how many processes are mapping a page and therefore PSS calculation
is impossible.
Historically, ION driver used to map its buffers as VM_PFNMAP areas
due to memory carveouts that did not have page structs [1]. That
is not the case anymore and it seems there was desire to move away
from remap_pfn_range [2].
Dmabuf system heap design inherits this ION behavior and maps its
pages using remap_pfn_range even though allocated pages are backed
by page structs.
Clear VM_IO and VM_PFNMAP flags when mapping memory allocated by the
system heap and replace remap_pfn_range with vm_insert_page, following
Laura's suggestion in [1]. This would allow correct PSS calculation
for dmabufs.

[1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
[2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
(sorry, could not find lore links for these discussions)

Suggested-by: Laura Abbott <labbott@kernel.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 drivers/dma-buf/heaps/system_heap.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 17e0e9a68baf..0e92e42b2251 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -200,11 +200,13 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	struct sg_page_iter piter;
 	int ret;
 
+	/* All pages are backed by a "struct page" */
+	vma->vm_flags &= ~VM_PFNMAP;
+
 	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
 		struct page *page = sg_page_iter_page(&piter);
 
-		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
-				      vma->vm_page_prot);
+		ret = vm_insert_page(vma, addr, page);
 		if (ret)
 			return ret;
 		addr += PAGE_SIZE;
-- 
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
