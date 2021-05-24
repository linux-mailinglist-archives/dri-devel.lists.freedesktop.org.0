Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FA638F56B
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 00:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D206E2B6;
	Mon, 24 May 2021 22:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C966E096;
 Mon, 24 May 2021 22:11:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57B986109F;
 Mon, 24 May 2021 22:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1621894318;
 bh=9PyMNewsGq6ERDLxr4di8vSjGgfZV7Y7rZTjz/iLdIw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PBIRE9lNbG85SmL9IJ3O9MVl8G5MDhwYM3GLmzbY1P926o7iNhKuihUVyN2KyNYHM
 K1OjEYugDHTXljqnHNK970F1XJyzKax8xTENy1gnYj2uMypI18IEJlW0M8V+cTyNd6
 2JMaQS5YyV2rUuewMxhxtpeT8m45NqOWvmPrPIvg=
Date: Mon, 24 May 2021 15:11:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Message-Id: <20210524151157.2dc5d2bb510ff86dc449bf0c@linux-foundation.org>
In-Reply-To: <20210524132725.12697-8-apopple@nvidia.com>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-8-apopple@nvidia.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 jhubbard@nvidia.com, bsingharora@gmail.com, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, nouveau@lists.freedesktop.org, peterx@redhat.com,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 May 2021 23:27:22 +1000 Alistair Popple <apopple@nvidia.com> wrote:

> Some devices require exclusive write access to shared virtual
> memory (SVM) ranges to perform atomic operations on that memory. This
> requires CPU page tables to be updated to deny access whilst atomic
> operations are occurring.
> 
> In order to do this introduce a new swap entry
> type (SWP_DEVICE_EXCLUSIVE). When a SVM range needs to be marked for
> exclusive access by a device all page table mappings for the particular
> range are replaced with device exclusive swap entries. This causes any
> CPU access to the page to result in a fault.
> 
> Faults are resovled by replacing the faulting entry with the original
> mapping. This results in MMU notifiers being called which a driver uses
> to update access permissions such as revoking atomic access. After
> notifiers have been called the device will no longer have exclusive
> access to the region.
> 
> Walking of the page tables to find the target pages is handled by
> get_user_pages() rather than a direct page table walk. A direct page
> table walk similar to what migrate_vma_collect()/unmap() does could also
> have been utilised. However this resulted in more code similar in
> functionality to what get_user_pages() provides as page faulting is
> required to make the PTEs present and to break COW.
> 
> ...
>
>  Documentation/vm/hmm.rst     |  17 ++++
>  include/linux/mmu_notifier.h |   6 ++
>  include/linux/rmap.h         |   4 +
>  include/linux/swap.h         |   7 +-
>  include/linux/swapops.h      |  44 ++++++++-
>  mm/hmm.c                     |   5 +
>  mm/memory.c                  | 128 +++++++++++++++++++++++-
>  mm/mprotect.c                |   8 ++
>  mm/page_vma_mapped.c         |   9 +-
>  mm/rmap.c                    | 186 +++++++++++++++++++++++++++++++++++
>  10 files changed, 405 insertions(+), 9 deletions(-)
> 

This is quite a lot of code added to core MM for a single driver.

Is there any expectation that other drivers will use this code?

Is there a way of reducing the impact (code size, at least) for systems
which don't need this code?

How beneficial is this code to nouveau users?  I see that it permits a
part of OpenCL to be implemented, but how useful/important is this in
the real world?

Thanks.
