Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9852630D4D1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354B26E9E8;
	Wed,  3 Feb 2021 08:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7166E9C1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 00:31:39 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id v13so5753560qtq.18
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 16:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=5KtTzd9k+c9bS2Y/wk34+i/vvyNbysJG7UZJv8N2Wp4=;
 b=oNXRZrunpy+nJxCNVG2DVespyvOU6v+/PBcSm/lmaxwIlZyPY+Y+aGI83iN/QE12TQ
 /9B5j+GzglaY+R0ZfttfhxpqWqSdb8Mhk5fb+2BB6mUU3pAKYZ4YkOotTy5PPFko52Yw
 DjiUxnZm5/e875fNSMeJZUpfPmcgyFUAHmh7OGgzKQMnmFkSDTyR+23aDUO7XbQpLyJ/
 ODLwOmX6057PVKLp4hTX/hoK0O+U8lfiVVL2hxkockdBfgWJvRtI34i+fdKn9nJsjv6I
 DrqX9S8rzdrQ6xlTKqKv6sGUpn32curAQw3IMOe9YcnA/sGJg2xlAFdtgblXQs264SLf
 TFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=5KtTzd9k+c9bS2Y/wk34+i/vvyNbysJG7UZJv8N2Wp4=;
 b=aiMKcfiMa7Qzv34kr/ER18m9BJttckzGKJvRRMQZTlRLAcISAaS0aXTKBCyG1zyeV0
 J5tBFQBaPhojLjw9yjsncvdQQ8/Z75C4mkxTXKnAhs8x8o6OWbbXv8+CccKv67QfMlb2
 gyouXkrhC8cIanoM9T5eTw7O9cyfPyqYBhqeS8oQv//hrUG69k7zZY7htzkmyQZALBk5
 8AnzK52WRinNEaKBq8sqBbJvRlbBdpVOnRM2RAsqsooTWqQPPUiXE+0TeCUtx0YfLKo+
 /RbpQTXL7qs7JV15KG0Cx2t+/XTPhFvYQCbA6Io+mxrqcP1kEU3z/o7Zxt4pUO9RjN+p
 azIw==
X-Gm-Message-State: AOAM531ttCl8dQgnoaK/xXs+MBy9pOme2NFE4+QeUmFkQo2iT9blKgD9
 7sfBwOsvZCr8rrH0fYvX3kPL+MxTluI=
X-Google-Smtp-Source: ABdhPJwlIrpFiCM10hcfIL1xRHkC2ka4Rp5OqMsb623obcfa1dzEsxG62HhtetSAvxKOVvEOcxKdtwB6Ytc=
X-Received: from surenb1.mtv.corp.google.com
 ([2620:15c:211:200:9194:cd6:1ec:3e2d])
 (user=surenb job=sendgmr) by 2002:a0c:8365:: with SMTP id
 j92mr418503qva.19.1612312297983; 
 Tue, 02 Feb 2021 16:31:37 -0800 (PST)
Date: Tue,  2 Feb 2021 16:31:34 -0800
In-Reply-To: <20210203003134.2422308-1-surenb@google.com>
Message-Id: <20210203003134.2422308-2-surenb@google.com>
Mime-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 2/2] dma-buf: heaps: Map system heap pages as managed by
 linux vm
From: Suren Baghdasaryan <surenb@google.com>
To: sumit.semwal@linaro.org
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, orjan.eide@arm.com, sspatil@google.com,
 linux-mm@kvack.org, kernel-team@android.com, jajones@nvidia.com,
 surenb@google.com, linux-kernel@vger.kernel.org, lmark@codeaurora.org,
 christian.koenig@amd.com, hch@infradead.org, minchan@kernel.org,
 dri-devel@lists.freedesktop.org, cgoldswo@codeaurora.org, hridya@google.com,
 akpm@linux-foundation.org, labbott@redhat.com, robin.murphy@arm.com,
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
Replace remap_pfn_range with vm_insert_page, following Laura's suggestion
in [1]. This would allow correct PSS calculation for dmabufs.

[1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
[2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
(sorry, could not find lore links for these discussions)

Suggested-by: Laura Abbott <labbott@kernel.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
v1 posted at: https://lore.kernel.org/patchwork/patch/1372409/

changes in v2:
- removed VM_PFNMAP clearing part of the patch, per Minchan and Christoph
- created prerequisite patch to replace BUG_ON with WARN_ON_ONCE, per Christoph

 drivers/dma-buf/heaps/system_heap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 17e0e9a68baf..4983f18cc2ce 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -203,8 +203,7 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
 		struct page *page = sg_page_iter_page(&piter);
 
-		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
-				      vma->vm_page_prot);
+		ret = vm_insert_page(vma, addr, page);
 		if (ret)
 			return ret;
 		addr += PAGE_SIZE;
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
