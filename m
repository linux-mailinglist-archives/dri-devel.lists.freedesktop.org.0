Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77799ADF65B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 20:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B72110E904;
	Wed, 18 Jun 2025 18:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 53A3310E1D8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:44:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE30412FC;
 Tue, 17 Jun 2025 23:44:34 -0700 (PDT)
Received: from [10.163.35.185] (unknown [10.163.35.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE1D23F66E;
 Tue, 17 Jun 2025 23:44:52 -0700 (PDT)
Message-ID: <99b9f7c8-62e0-4500-b4f1-0efdb73bf502@arm.com>
Date: Wed, 18 Jun 2025 12:14:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: Don't crash when allocating a folio if there
 are no resv
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Cc: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com,
 Steve Sistare <steven.sistare@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250618052840.1036164-1-vivek.kasireddy@intel.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250618052840.1036164-1-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 18 Jun 2025 18:55:50 +0000
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



On 18/06/25 10:58 AM, Vivek Kasireddy wrote:
> There are cases when we try to pin a folio but discover that it has
> not been faulted-in. So, we try to allocate it in memfd_alloc_folio()
> but there is a chance that we might encounter a fatal crash/failure
> (VM_BUG_ON(!h->resv_huge_pages) in alloc_hugetlb_folio_reserve()) if
> there are no active reservations at that instant. This issue was
> reported by syzbot:
> 
> kernel BUG at mm/hugetlb.c:2403!
> Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
> CPU: 0 UID: 0 PID: 5315 Comm: syz.0.0 Not tainted
> 6.13.0-rc5-syzkaller-00161-g63676eefb7a0 #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> RIP: 0010:alloc_hugetlb_folio_reserve+0xbc/0xc0 mm/hugetlb.c:2403
> Code: 1f eb 05 e8 56 18 a0 ff 48 c7 c7 40 56 61 8e e8 ba 21 cc 09 4c 89
> f0 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc e8 35 18 a0 ff 90 <0f> 0b 66
> 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f
> RSP: 0018:ffffc9000d3d77f8 EFLAGS: 00010087
> RAX: ffffffff81ff6beb RBX: 0000000000000000 RCX: 0000000000100000
> RDX: ffffc9000e51a000 RSI: 00000000000003ec RDI: 00000000000003ed
> RBP: 1ffffffff34810d9 R08: ffffffff81ff6ba3 R09: 1ffffd4000093005
> R10: dffffc0000000000 R11: fffff94000093006 R12: dffffc0000000000
> R13: dffffc0000000000 R14: ffffea0000498000 R15: ffffffff9a4086c8
> FS:  00007f77ac12e6c0(0000) GS:ffff88801fc00000(0000)
> knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f77ab54b170 CR3: 0000000040b70000 CR4: 0000000000352ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  memfd_alloc_folio+0x1bd/0x370 mm/memfd.c:88
>  memfd_pin_folios+0xf10/0x1570 mm/gup.c:3750
>  udmabuf_pin_folios drivers/dma-buf/udmabuf.c:346 [inline]
>  udmabuf_create+0x70e/0x10c0 drivers/dma-buf/udmabuf.c:443
>  udmabuf_ioctl_create drivers/dma-buf/udmabuf.c:495 [inline]
>  udmabuf_ioctl+0x301/0x4e0 drivers/dma-buf/udmabuf.c:526
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:906 [inline]
>  __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Therefore, prevent the above crash by replacing the VM_BUG_ON()
> with WARN_ON_ONCE() as there is no need to crash the system in
> this situation and instead we could just warn and fail the
> allocation.

Why there are no reserved huge pages in such situations and also how
likely this might happen ? Is it recoverable ?

> 
> Fixes: 26a8ea80929c ("mm/hugetlb: fix memfd_pin_folios resv_huge_pages leak")
> Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=a504cb5bae4fe117ba94
> Cc: Steve Sistare <steven.sistare@oracle.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  mm/hugetlb.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 8746ed2fec13..f74c54ecf955 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2340,12 +2340,15 @@ struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
>  	struct folio *folio;
>  
>  	spin_lock_irq(&hugetlb_lock);
> +	if (WARN_ON_ONCE(!h->resv_huge_pages)) {
> +		spin_unlock_irq(&hugetlb_lock);
> +		return NULL;
> +	}
> +
>  	folio = dequeue_hugetlb_folio_nodemask(h, gfp_mask, preferred_nid,
>  					       nmask);
> -	if (folio) {
> -		VM_BUG_ON(!h->resv_huge_pages);
> +	if (folio)
>  		h->resv_huge_pages--;
> -	}
>  
>  	spin_unlock_irq(&hugetlb_lock);
>  	return folio;


