Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA93830C81
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 19:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EAF10E78A;
	Wed, 17 Jan 2024 18:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A8710E78A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 18:12:58 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-28b77ca8807so6907681a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 10:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705515118; x=1706119918;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=78wGbyaR1N/RpeDHrml7Zj+rHmeYYvmV/w0ACPzkZ2Q=;
 b=vPAwkBUjUvwv70bZtdAmYpRGJ1KvIfN+T5fUYT7aXKDmkZ0Ra+j2voHn5WLPkzPwxp
 Li3eqjUEDFSnQnyS4THh6ciPJIQBJO0jqI35DexTwaDZ9SCVz+KqrpPyXc+MHrZki92W
 LOHEx21igGajbOWdIE1dASbuTV38qVkW5i8lU+44wuD4ZkKfBd+EyvhV7ptJw4T9KdLT
 pAtsnFZBl/25u1Olo+HGKqhY/+4PdU5FuT/cG/I9v2je3k7T1JJEHsXL2giCSEBBCVH9
 2AFDY5jIFlsTrUAmYeUyX2aTIXXWkHVLkuK/TYwac9+KBzrOHXQowFlBX/qoIrU1TM3C
 i2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705515118; x=1706119918;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=78wGbyaR1N/RpeDHrml7Zj+rHmeYYvmV/w0ACPzkZ2Q=;
 b=Fhcef3tE1uigX20dOTI4Qj9yCU1bfbR16rawWr+bx4npJU5/mHnUjU6HTCKCGUld6h
 32Gix5P6BADGY9k9L8BqTAVwBtTylli0eRa8T20KvOmjYI//Lc4Ez5dldv8nKy1AbWB7
 38K2y3qHIqW/3Aciz8PjT+uZtmttzCcG4zPn7Mgj6gJlnkXZ8oZP8OHw/ScYdaPwvl1a
 ZemmfCUpT01vbBOMr89zouuuxQahTRQzJ1Gw3NJc+t+Y5ZrZDjjotL+ByuLXTiAbjHYl
 b/GbccMcXeYw5w8GfNgKLtlCSXzb2C7VCD7kqUzTH8SGkD3ufCiY028RYOqhT9F5rPu1
 QJ7g==
X-Gm-Message-State: AOJu0YyJ80FDHSRv718Wk9Ea/hyV8RDNg1eeyQPqN1KvZMH2ancK31f7
 KIVf5qORoiF/0e6zm8InfGUqnPqILQIf46gTwXgEVg==
X-Google-Smtp-Source: AGHT+IEqlpk5VBwIaxFJ3ed3SctyHMNGEmAma0Nj0WOvArfTlAIrR/Z8ubBEgvCHIcFZ3dr6Jg5yS8q7Aksd9jY=
X-Received: from tj-virt.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5683])
 (user=tjmercier job=sendgmr) by 2002:a17:90b:51c7:b0:28d:6729:c29a with SMTP
 id sf7-20020a17090b51c700b0028d6729c29amr615328pjb.2.1705515117716; Wed, 17
 Jan 2024 10:11:57 -0800 (PST)
Date: Wed, 17 Jan 2024 18:11:40 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.381.gb435a96ce8-goog
Message-ID: <20240117181141.286383-1-tjmercier@google.com>
Subject: [PATCH] dma-buf: heaps: Don't track CMA dma-buf pages under RssFile
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Sandeep Patil <sspatil@android.com>, Laura Abbott <labbott@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: android-mm@google.com, daniel@ffwll.ch, minchan@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DMA buffers allocated from the CMA dma-buf heap get counted under
RssFile for processes that map them and trigger page faults. In
addition to the incorrect accounting reported to userspace, reclaim
behavior was influenced by the MM_FILEPAGES counter until linux 6.8, but
this memory is not reclaimable. [1] Change the CMA dma-buf heap to set
VM_PFNMAP on the VMA so MM does not poke at the memory managed by this
dma-buf heap, and use vmf_insert_pfn to correct the RSS accounting.

The system dma-buf heap does not suffer from this issue since
remap_pfn_range is used during the mmap of the buffer, which also sets
VM_PFNMAP on the VMA.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/mm/vmscan.c?id=fb46e22a9e3863e08aef8815df9f17d0f4b9aede

Fixes: b61614ec318a ("dma-buf: heaps: Add CMA heap to dmabuf heaps")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index ee899f8e6721..4a63567e93ba 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -168,10 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
 	if (vmf->pgoff > buffer->pagecount)
 		return VM_FAULT_SIGBUS;
 
-	vmf->page = buffer->pages[vmf->pgoff];
-	get_page(vmf->page);
-
-	return 0;
+	return vmf_insert_pfn(vma, vmf->address, page_to_pfn(buffer->pages[vmf->pgoff]));
 }
 
 static const struct vm_operations_struct dma_heap_vm_ops = {
@@ -185,6 +182,8 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
 		return -EINVAL;
 
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+
 	vma->vm_ops = &dma_heap_vm_ops;
 	vma->vm_private_data = buffer;
 
-- 
2.43.0.381.gb435a96ce8-goog

