Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKFXKsbFqmnVWwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:17:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F06220623
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D37210ED18;
	Fri,  6 Mar 2026 12:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JE9hl+xg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC98010ED18;
 Fri,  6 Mar 2026 12:17:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 516C242A97;
 Fri,  6 Mar 2026 12:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9601AC4CEF7;
 Fri,  6 Mar 2026 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772799426;
 bh=E50Nei4wvO5acKQ5WAuR9y8yrxBw8Jw9n6m//WAfpNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JE9hl+xgT0bTGi+BM5jUSHSxJhmfXyDYuZyy882H8pwaPVW4rs91GqXsOlDdNYt5q
 M4CYD21uXiIoE80aCpIXZWa8pvS6BpzRhby5F3zlbgDBohqfN8gLvqI1ZzEKj9Sq8O
 1GA8U2yXsayzOcXwk/z9rDzRougLhaH2sFQZ/lImuHVanVDszwy6gcpcLHaEn0JF34
 5MRb84nwU6hkVV8bxr42O43gDIOYuZx7PoAczRQyQjOzRXl+pydnhhFnDCu0OWdTD3
 GeXNhxm0JknludP4ZgMHI0L5kkBWpm7KDg9wTx0PM6ikXJpjNR7e3ecgYQUbTFzh7m
 tM4T4pFHUGsng==
Date: Fri, 6 Mar 2026 12:17:03 +0000
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
Subject: Re: [PATCH v1 06/16] mm/oom_kill: factor out zapping of VMA into
 zap_vma_for_reaping()
Message-ID: <d92e21ff-50cd-485b-8f48-621e8ae1b169@lucifer.local>
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-7-david@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227200848.114019-7-david@kernel.org>
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
X-Rspamd-Queue-Id: 24F06220623
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
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

On Fri, Feb 27, 2026 at 09:08:37PM +0100, David Hildenbrand (Arm) wrote:
> Let's factor it out so we can turn unmap_page_range() into a static
> function instead, and so oom reaping has a clean interface to call.
>
> Note that hugetlb is not supported, because it would require a bunch of
> hugetlb-specific further actions (see zap_page_range_single_batched()).

Ugh gawd. Hugetlb.

>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Seems reasonable, so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  mm/internal.h |  5 +----
>  mm/memory.c   | 36 ++++++++++++++++++++++++++++++++----
>  mm/oom_kill.c | 15 +--------------
>  3 files changed, 34 insertions(+), 22 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 39ab37bb0e1d..df9190f7db0e 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -536,13 +536,10 @@ static inline void sync_with_folio_pmd_zap(struct mm_struct *mm, pmd_t *pmdp)
>  }
>
>  struct zap_details;
> -void unmap_page_range(struct mmu_gather *tlb,
> -			     struct vm_area_struct *vma,
> -			     unsigned long addr, unsigned long end,
> -			     struct zap_details *details);
>  void zap_page_range_single_batched(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, unsigned long addr,
>  		unsigned long size, struct zap_details *details);
> +int zap_vma_for_reaping(struct vm_area_struct *vma);
>  int folio_unmap_invalidate(struct address_space *mapping, struct folio *folio,
>  			   gfp_t gfp);
>
> diff --git a/mm/memory.c b/mm/memory.c
> index e4154f03feac..621f38ae1425 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2054,10 +2054,9 @@ static inline unsigned long zap_p4d_range(struct mmu_gather *tlb,
>  	return addr;
>  }
>
> -void unmap_page_range(struct mmu_gather *tlb,
> -			     struct vm_area_struct *vma,
> -			     unsigned long addr, unsigned long end,
> -			     struct zap_details *details)
> +static void unmap_page_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
> +		unsigned long addr, unsigned long end,
> +		struct zap_details *details)
>  {
>  	pgd_t *pgd;
>  	unsigned long next;
> @@ -2115,6 +2114,35 @@ static void unmap_single_vma(struct mmu_gather *tlb,
>  	}
>  }
>
> +/**
> + * zap_vma_for_reaping - zap all page table entries in the vma without blocking
> + * @vma: The vma to zap.
> + *
> + * Zap all page table entries in the vma without blocking for use by the oom
> + * killer. Hugetlb vmas are not supported.
> + *
> + * Returns: 0 on success, -EBUSY if we would have to block.
> + */
> +int zap_vma_for_reaping(struct vm_area_struct *vma)
> +{
> +	struct mmu_notifier_range range;
> +	struct mmu_gather tlb;
> +
> +	VM_WARN_ON_ONCE(is_vm_hugetlb_page(vma));
> +
> +	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
> +				vma->vm_start, vma->vm_end);
> +	tlb_gather_mmu(&tlb, vma->vm_mm);
> +	if (mmu_notifier_invalidate_range_start_nonblock(&range)) {
> +		tlb_finish_mmu(&tlb);
> +		return -EBUSY;
> +	}
> +	unmap_page_range(&tlb, vma, range.start, range.end, NULL);
> +	mmu_notifier_invalidate_range_end(&range);
> +	tlb_finish_mmu(&tlb);
> +	return 0;
> +}
> +
>  /**
>   * unmap_vmas - unmap a range of memory covered by a list of vma's
>   * @tlb: address of the caller's struct mmu_gather
> diff --git a/mm/oom_kill.c b/mm/oom_kill.c
> index 0ba56fcd10d5..54b7a8fe5136 100644
> --- a/mm/oom_kill.c
> +++ b/mm/oom_kill.c
> @@ -548,21 +548,8 @@ static bool __oom_reap_task_mm(struct mm_struct *mm)
>  		 * count elevated without a good reason.
>  		 */
>  		if (vma_is_anonymous(vma) || !(vma->vm_flags & VM_SHARED)) {
> -			struct mmu_notifier_range range;
> -			struct mmu_gather tlb;
> -
> -			mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0,
> -						mm, vma->vm_start,
> -						vma->vm_end);
> -			tlb_gather_mmu(&tlb, mm);
> -			if (mmu_notifier_invalidate_range_start_nonblock(&range)) {
> -				tlb_finish_mmu(&tlb);
> +			if (zap_vma_for_reaping(vma))
>  				ret = false;
> -				continue;
> -			}
> -			unmap_page_range(&tlb, vma, range.start, range.end, NULL);
> -			mmu_notifier_invalidate_range_end(&range);
> -			tlb_finish_mmu(&tlb);
>  		}
>  	}
>
> --
> 2.43.0
>
