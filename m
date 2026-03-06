Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJa8H3DJqmlWXAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:32:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7EE220AFF
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62CD10ED25;
	Fri,  6 Mar 2026 12:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T4qMHjOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E24C10ED25;
 Fri,  6 Mar 2026 12:32:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5C6FD60018;
 Fri,  6 Mar 2026 12:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77675C4CEF7;
 Fri,  6 Mar 2026 12:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772800364;
 bh=QVn8Y7AXnOu5aPCMlNbbvX0FUbONENXusGGY7trKhug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T4qMHjOgk3jgWcvjrkPPEKLsolahZSrljiWXH/PIK77OKljPOm5wuV74Xo62bGU2b
 W2MZJZyOEeSTvlWTQKvpw5ckVkmpOqUnkKU8hUrtVMu+d5hRTorZsy9a/BEQnu2MNk
 nkpwmlrF4FIcx3IYFoqiolIPYTFgWBFiAXMfD1sq6oLSmSACgNEMYXkg5K3N6Dj5og
 5jrJz2ywPJ9P8z00grks+YpbG2l3REUrSAfVA1y7lqHfuba58RIKaBs/unDG3xXkGc
 mn8Gi0kijcty5232VA10s00CPwrG4FcWsdUqqvgT+wM0NufnQahvqjPZh7U/cyIOmO
 l9QVmPUmpBsCw==
Date: Fri, 6 Mar 2026 12:32:40 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, David Rientjes <rientjes@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Alice Ryhl <aliceryhl@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Leon Romanovsky <leon@kernel.org>, Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Eric Dumazet <edumazet@google.com>, 
 Neal Cardwell <ncardwell@google.com>, "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, 
 kvm@vger.kernel.org, linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, 
 bpf@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, 
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 14/16] mm: rename zap_page_range_single() to
 zap_vma_range()
Message-ID: <eb247018-b64b-4dba-97ca-9ce8c1b0186c@lucifer.local>
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-15-david@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227200848.114019-15-david@kernel.org>
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
X-Rspamd-Queue-Id: CD7EE220AFF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,kernel.org,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[74];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lucifer.local:mid]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 09:08:45PM +0100, David Hildenbrand (Arm) wrote:
> Let's rename it to make it better match our new naming scheme.
>
> While at it, polish the kerneldoc.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM, again obviously assuming the rustfmt stuff is sorted :>), so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

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
>
>  static void arena_free_pages(struct bpf_arena *arena, long uaddr, long page_cnt, bool sleepable)
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index c94c56c94104..5ee02817c3bc 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -7215,7 +7215,7 @@ static int map_range(struct perf_buffer *rb, struct vm_area_struct *vma)
>  #ifdef CONFIG_MMU
>  	/* Clear any partial mappings on error. */
>  	if (err)
> -		zap_page_range_single(vma, vma->vm_start, nr_pages * PAGE_SIZE);
> +		zap_vma_range(vma, vma->vm_start, nr_pages * PAGE_SIZE);
>  #endif
>
>  	return err;
> diff --git a/mm/madvise.c b/mm/madvise.c
> index fb5fcdff2b66..6e66f56ff1a6 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -832,7 +832,7 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior)
>   * Application no longer needs these pages.  If the pages are dirty,
>   * it's OK to just throw them away.  The app will be more careful about
>   * data it wants to keep.  Be sure to free swap resources too.  The
> - * zap_page_range_single call sets things up for shrink_active_list to actually
> + * zap_vma_range call sets things up for shrink_active_list to actually
>   * free these pages later if no one else has touched them in the meantime,
>   * although we could add these pages to a global reuse list for
>   * shrink_active_list to pick up before reclaiming other pages.
> @@ -1191,7 +1191,7 @@ static long madvise_guard_install(struct madvise_behavior *madv_behavior)
>  		 * OK some of the range have non-guard pages mapped, zap
>  		 * them. This leaves existing guard pages in place.
>  		 */
> -		zap_page_range_single(vma, range->start, range->end - range->start);
> +		zap_vma_range(vma, range->start, range->end - range->start);
>  	}
>
>  	/*
> diff --git a/mm/memory.c b/mm/memory.c
> index e611e9af4e85..dd737b6d28c0 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2215,14 +2215,14 @@ void zap_vma_range_batched(struct mmu_gather *tlb,
>  }
>
>  /**
> - * zap_page_range_single - remove user pages in a given range
> - * @vma: vm_area_struct holding the applicable pages
> - * @address: starting address of pages to zap
> + * zap_vma_range - zap all page table entries in a vma range
> + * @vma: the vma covering the range to zap
> + * @address: starting address of the range to zap
>   * @size: number of bytes to zap
>   *
> - * The range must fit into one VMA.
> + * The provided address range must be fully contained within @vma.
>   */
> -void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> +void zap_vma_range(struct vm_area_struct *vma, unsigned long address,
>  		unsigned long size)
>  {
>  	struct mmu_gather tlb;
> @@ -2250,7 +2250,7 @@ void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
>  	    		!(vma->vm_flags & VM_PFNMAP))
>  		return;
>
> -	zap_page_range_single(vma, address, size);
> +	zap_vma_range(vma, address, size);
>  }
>  EXPORT_SYMBOL_GPL(zap_vma_ptes);
>
> @@ -3018,7 +3018,7 @@ static int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long add
>  	 * maintain page reference counts, and callers may free
>  	 * pages due to the error. So zap it early.
>  	 */
> -	zap_page_range_single(vma, addr, size);
> +	zap_vma_range(vma, addr, size);
>  	return error;
>  }
>
> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index befcde27dee7..cb4477ef1529 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -2104,7 +2104,7 @@ static int tcp_zerocopy_vm_insert_batch_error(struct vm_area_struct *vma,
>  		maybe_zap_len = total_bytes_to_map -  /* All bytes to map */
>  				*length + /* Mapped or pending */
>  				(pages_remaining * PAGE_SIZE); /* Failed map. */
> -		zap_page_range_single(vma, *address, maybe_zap_len);
> +		zap_vma_range(vma, *address, maybe_zap_len);
>  		err = 0;
>  	}
>
> @@ -2112,7 +2112,7 @@ static int tcp_zerocopy_vm_insert_batch_error(struct vm_area_struct *vma,
>  		unsigned long leftover_pages = pages_remaining;
>  		int bytes_mapped;
>
> -		/* We called zap_page_range_single, try to reinsert. */
> +		/* We called zap_vma_range, try to reinsert. */
>  		err = vm_insert_pages(vma, *address,
>  				      pending_pages,
>  				      &pages_remaining);
> @@ -2269,7 +2269,7 @@ static int tcp_zerocopy_receive(struct sock *sk,
>  	total_bytes_to_map = avail_len & ~(PAGE_SIZE - 1);
>  	if (total_bytes_to_map) {
>  		if (!(zc->flags & TCP_RECEIVE_ZEROCOPY_FLAG_TLB_CLEAN_HINT))
> -			zap_page_range_single(vma, address, total_bytes_to_map);
> +			zap_vma_range(vma, address, total_bytes_to_map);
>  		zc->length = total_bytes_to_map;
>  		zc->recv_skip_hint = 0;
>  	} else {
> diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
> index b8e59e4420f3..04b3cc925d67 100644
> --- a/rust/kernel/mm/virt.rs
> +++ b/rust/kernel/mm/virt.rs
> @@ -113,7 +113,7 @@ pub fn end(&self) -> usize {
>      /// kernel goes further in freeing unused page tables, but for the purposes of this operation
>      /// we must only assume that the leaf level is cleared.
>      #[inline]
> -    pub fn zap_page_range_single(&self, address: usize, size: usize) {
> +    pub fn zap_vma_range(&self, address: usize, size: usize) {
>          let (end, did_overflow) = address.overflowing_add(size);
>          if did_overflow || address < self.start() || self.end() < end {
>              // TODO: call WARN_ONCE once Rust version of it is added
> @@ -124,7 +124,7 @@ pub fn zap_page_range_single(&self, address: usize, size: usize) {
>          // sufficient for this method call. This method has no requirements on the vma flags. The
>          // address range is checked to be within the vma.
>          unsafe {
> -            bindings::zap_page_range_single(self.as_ptr(), address, size)
> +            bindings::zap_vma_range(self.as_ptr(), address, size)
>          };
>      }
>
> --
> 2.43.0
>
