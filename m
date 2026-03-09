Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CS0BVr5rmliLAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:46:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7836E23CF80
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5873D10E19E;
	Mon,  9 Mar 2026 16:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LzK0cQVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579CF10E19E;
 Mon,  9 Mar 2026 16:46:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 09D5440E3A;
 Mon,  9 Mar 2026 16:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49200C2BC86;
 Mon,  9 Mar 2026 16:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773074773;
 bh=Tqx7dK7zOG7rDfy0y5qpLKhV/OEzGrhs5r7m6DAJi38=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LzK0cQVs8ML2i3sxYVbeGEnQp3w8SiK+QCVVNiljg5JvL/h1NF64fnF/LeKgIGdiK
 FOGHzG/pM6V0WQ0+b8SQ0t/UMvJOUMcusbuLVmT/L9OqD1faOj86rMgMiOHjdxvqGI
 yIQ/9OIKCWBpkH4MHWrgENng96n48RfZlIt9izmWjO4cti60m/ZwnFqRYcL5mCDTwP
 DfuORlXZKGVaEPeUO4naijPeyrfCDna/PZ7pWLYmdFjFehFa05pbi7AVJIw8tnnEyc
 ZTPJPpl/MNPND8YXYuNEC+NesxXKrtqgA8aH5SvyaoIRcGYq2BHQTMuqf6hml1zBOr
 7JQtnjx5KlFCw==
From: Puranjay Mohan <puranjay@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-kernel@vger.kernel.org
Cc: "linux-mm @ kvack . org" <linux-mm@kvack.org>, "David Hildenbrand (Arm)"
 <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato
 <pfalcato@suse.de>, David Rientjes <rientjes@google.com>, Shakeel Butt
 <shakeel.butt@linux.dev>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Alice Ryhl <aliceryhl@google.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank
 <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
 <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=
 <arve@android.com>, Todd Kjos
 <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Carlos Llamas
 <cmllamas@google.com>, Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten
 <hsweeten@visionengravers.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jason
 Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Dimitri
 Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Eric Dumazet
 <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, "David S.
 Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Miguel Ojeda
 <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 14/16] mm: rename zap_page_range_single() to
 zap_vma_range()
In-Reply-To: <20260227200848.114019-15-david@kernel.org>
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-15-david@kernel.org>
Date: Mon, 09 Mar 2026 16:46:09 +0000
Message-ID: <m2y0k1vtm6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Rspamd-Queue-Id: 7836E23CF80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kvack.org,kernel.org,linux-foundation.org,oracle.com,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	FROM_NEQ_ENVFROM(0.00)[puranjay@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> Let's rename it to make it better match our new naming scheme.
>
> While at it, polish the kerneldoc.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  arch/s390/mm/gmap_helpers.c          |  2 +-
>  drivers/android/binder/page_range.rs |  4 ++--
>  drivers/android/binder_alloc.c       |  2 +-
>  include/linux/mm.h                   |  4 ++--
>  kernel/bpf/arena.c                   |  2 +-
>  kernel/events/core.c                 |  2 +-
>  mm/madvise.c                         |  4 ++--
>  mm/memory.c                          | 14 +++++++-------
>  net/ipv4/tcp.c                       |  6 +++---
>  rust/kernel/mm/virt.rs               |  4 ++--
>  10 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/arch/s390/mm/gmap_helpers.c b/arch/s390/mm/gmap_helpers.c
> index ae2d59a19313..f8789ffcc05c 100644
> --- a/arch/s390/mm/gmap_helpers.c
> +++ b/arch/s390/mm/gmap_helpers.c
> @@ -89,7 +89,7 @@ void gmap_helper_discard(struct mm_struct *mm, unsigned long vmaddr, unsigned lo
>  		if (!vma)
>  			return;
>  		if (!is_vm_hugetlb_page(vma))
> -			zap_page_range_single(vma, vmaddr, min(end, vma->vm_end) - vmaddr);
> +			zap_vma_range(vma, vmaddr, min(end, vma->vm_end) - vmaddr);
>  		vmaddr = vma->vm_end;
>  	}
>  }
> diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
> index fdd97112ef5c..2fddd4ed8d4c 100644
> --- a/drivers/android/binder/page_range.rs
> +++ b/drivers/android/binder/page_range.rs
> @@ -130,7 +130,7 @@ pub(crate) struct ShrinkablePageRange {
>      pid: Pid,
>      /// The mm for the relevant process.
>      mm: ARef<Mm>,
> -    /// Used to synchronize calls to `vm_insert_page` and `zap_page_range_single`.
> +    /// Used to synchronize calls to `vm_insert_page` and `zap_vma_range`.
>      #[pin]
>      mm_lock: Mutex<()>,
>      /// Spinlock protecting changes to pages.
> @@ -719,7 +719,7 @@ fn drop(self: Pin<&mut Self>) {
>  
>      if let Some(vma) = mmap_read.vma_lookup(vma_addr) {
>          let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
> -        vma.zap_page_range_single(user_page_addr, PAGE_SIZE);
> +        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
>      }
>  
>      drop(mmap_read);
> diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
> index dd2046bd5cde..e4488ad86a65 100644
> --- a/drivers/android/binder_alloc.c
> +++ b/drivers/android/binder_alloc.c
> @@ -1185,7 +1185,7 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
>  	if (vma) {
>  		trace_binder_unmap_user_start(alloc, index);
>  
> -		zap_page_range_single(vma, page_addr, PAGE_SIZE);
> +		zap_vma_range(vma, page_addr, PAGE_SIZE);
>  
>  		trace_binder_unmap_user_end(alloc, index);
>  	}
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 4bd1500b9630..833bedd3f739 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2835,7 +2835,7 @@ struct page *vm_normal_page_pud(struct vm_area_struct *vma, unsigned long addr,
>  
>  void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
>  		  unsigned long size);
> -void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> +void zap_vma_range(struct vm_area_struct *vma, unsigned long address,
>  			   unsigned long size);
>  /**
>   * zap_vma - zap all page table entries in a vma
> @@ -2843,7 +2843,7 @@ void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
>   */
>  static inline void zap_vma(struct vm_area_struct *vma)
>  {
> -	zap_page_range_single(vma, vma->vm_start, vma->vm_end - vma->vm_start);
> +	zap_vma_range(vma, vma->vm_start, vma->vm_end - vma->vm_start);
>  }
>  struct mmu_notifier_range;
>  
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index c34510d83b1f..37843c6a4764 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c
> @@ -656,7 +656,7 @@ static void zap_pages(struct bpf_arena *arena, long uaddr, long page_cnt)
>  	guard(mutex)(&arena->lock);
>  	/* iterate link list under lock */
>  	list_for_each_entry(vml, &arena->vma_list, head)
> -		zap_page_range_single(vml->vma, uaddr, PAGE_SIZE * page_cnt);
> +		zap_vma_range(vml->vma, uaddr, PAGE_SIZE * page_cnt);
>  }

Acked-by: Puranjay Mohan <puranjay@kernel.org>
