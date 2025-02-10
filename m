Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7E2A2FE24
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 00:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9C310E20B;
	Mon, 10 Feb 2025 23:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ywk5yFm7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2B410E20B;
 Mon, 10 Feb 2025 23:05:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B134B5C54A5;
 Mon, 10 Feb 2025 23:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB13C4CED1;
 Mon, 10 Feb 2025 23:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1739228717;
 bh=a+20u3F0olFhn2ger6QyJLQ5lx1Ke3LUoxDGzvt6t8E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ywk5yFm7ctuCPKJQ9+BCPXUz/RzUhWb19Ww4mTtphZcClJDthieFzci4pzmtFsB2I
 Yp0xaownlpeRYsr5jbwGmNoxuPqSzXm8ItDVb71qJ3LuODj6XFApcFUVl6eL6hlFDA
 RkQ1jhvczfJ6AIkjUhJS3bVUC+B1AyLXWs+uA/LA=
Date: Mon, 10 Feb 2025 15:05:15 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, damon@lists.linux.dev, =?ISO-8859-1?Q?J?=
 =?ISO-8859-1?Q?=E9r=F4me?= Glisse <jglisse@redhat.com>, Jonathan Corbet
 <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>, Lyude Paul
 <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Masami Hiramatsu
 <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, SeongJae Park <sj@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, Pasha
 Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Barry Song <v-songbaohua@oppo.com>
Subject: Re: [PATCH v2 00/17] mm: fixes for device-exclusive entries (hmm)
Message-Id: <20250210150515.c71078f212ff4661eafc15bf@linux-foundation.org>
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Feb 2025 20:37:42 +0100 David Hildenbrand <david@redhat.com> wrote:

> Against mm-hotfixes-stable for now.
> 
> Discussing the PageTail() call in make_device_exclusive_range() with
> Willy, I recently discovered [1] that device-exclusive handling does
> not properly work with THP, making the hmm-tests selftests fail if THPs
> are enabled on the system.
> 
> Looking into more details, I found that hugetlb is not properly fenced,
> and I realized that something that was bugging me for longer -- how
> device-exclusive entries interact with mapcounts -- completely breaks
> migration/swapout/split/hwpoison handling of these folios while they have
> device-exclusive PTEs.
> 
> The program below can be used to allocate 1 GiB worth of pages and
> making them device-exclusive on a kernel with CONFIG_TEST_HMM.
> 
> Once they are device-exclusive, these folios cannot get swapped out
> (proc$pid/smaps_rollup will always indicate 1 GiB RSS no matter how
> much one forces memory reclaim), and when having a memory block onlined
> to ZONE_MOVABLE, trying to offline it will loop forever and complain about
> failed migration of a page that should be movable.
> 
> # echo offline > /sys/devices/system/memory/memory136/state
> # echo online_movable > /sys/devices/system/memory/memory136/state
> # ./hmm-swap &
> ... wait until everything is device-exclusive
> # echo offline > /sys/devices/system/memory/memory136/state
> [  285.193431][T14882] page: refcount:2 mapcount:0 mapping:0000000000000000
>   index:0x7f20671f7 pfn:0x442b6a
> [  285.196618][T14882] memcg:ffff888179298000
> [  285.198085][T14882] anon flags: 0x5fff0000002091c(referenced|uptodate|
>   dirty|active|owner_2|swapbacked|node=1|zone=3|lastcpupid=0x7ff)
> [  285.201734][T14882] raw: ...
> [  285.204464][T14882] raw: ...
> [  285.207196][T14882] page dumped because: migration failure
> [  285.209072][T14882] page_owner tracks the page as allocated
> [  285.210915][T14882] page last allocated via order 0, migratetype
>   Movable, gfp_mask 0x140dca(GFP_HIGHUSER_MOVABLE|__GFP_COMP|__GFP_ZERO),
>   id 14926, tgid 14926 (hmm-swap), ts 254506295376, free_ts 227402023774
> [  285.216765][T14882]  post_alloc_hook+0x197/0x1b0
> [  285.218874][T14882]  get_page_from_freelist+0x76e/0x3280
> [  285.220864][T14882]  __alloc_frozen_pages_noprof+0x38e/0x2740
> [  285.223302][T14882]  alloc_pages_mpol+0x1fc/0x540
> [  285.225130][T14882]  folio_alloc_mpol_noprof+0x36/0x340
> [  285.227222][T14882]  vma_alloc_folio_noprof+0xee/0x1a0
> [  285.229074][T14882]  __handle_mm_fault+0x2b38/0x56a0
> [  285.230822][T14882]  handle_mm_fault+0x368/0x9f0
> ...
> 
> This series fixes all issues I found so far.

Cool.

Barry, could you please redo your series "mm: batched unmap lazyfree
large folios during reclamation" on top of this (on top of mm-unstable,
ideally).
