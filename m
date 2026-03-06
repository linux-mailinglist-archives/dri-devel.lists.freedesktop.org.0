Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLTcGx7JqmlWXAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:31:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03458220AA1
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EF310ED23;
	Fri,  6 Mar 2026 12:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LvR/7HPf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22EC10ED23;
 Fri,  6 Mar 2026 12:31:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 45BED60018;
 Fri,  6 Mar 2026 12:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF81C2BC86;
 Fri,  6 Mar 2026 12:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772800282;
 bh=LAJ3eHMG09TcFhgWs2EdIeu79xlpIcUA+/nV0cLjx24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LvR/7HPf6wcbcyYRLsw0NDSdEUL1xaUkAW3JmG67UyRk8nOpjrEr2b2NGZY1Rm0QK
 rmjZWXs/kgIZrKXYtCLoe2wOfAeqwFjFcPcvt+uoLGfKG/Qo+cZY/KlECky/nu7yfe
 VWWd7vd2jX7axW3zB4eXySNQkQ60kLA1VNARXlEtx0PgK1qc1mJkOGYLZPeIU1jkWi
 k2zaxtrQMGavqzpX3B010TqicSFWti+U38spA0MblbRmX/eAooWrBcs3e2lHItMiNa
 oY8qJI8Dwm7XxpAxiijBNODF9u6hWMWr4FWbAtfufjRBYMdKm2jnZp6E+SB/W5VYzM
 3FhaTnLG18eEQ==
Date: Fri, 6 Mar 2026 12:31:18 +0000
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
Subject: Re: [PATCH v1 13/16] mm: rename zap_page_range_single_batched() to
 zap_vma_range_batched()
Message-ID: <c63bd1e9-52b0-42a3-a568-bfb0ac0afd5b@lucifer.local>
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-14-david@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227200848.114019-14-david@kernel.org>
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
X-Rspamd-Queue-Id: 03458220AA1
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer.local:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 09:08:44PM +0100, David Hildenbrand (Arm) wrote:
> Let's make the naming more consistent with our new naming scheme.
>
> While at it, polish the kerneldoc a bit.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM, so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  mm/internal.h |  2 +-
>  mm/madvise.c  |  5 ++---
>  mm/memory.c   | 23 +++++++++++++----------
>  3 files changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index df9190f7db0e..15a1b3f0a6d1 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -536,7 +536,7 @@ static inline void sync_with_folio_pmd_zap(struct mm_struct *mm, pmd_t *pmdp)
>  }
>
>  struct zap_details;
> -void zap_page_range_single_batched(struct mmu_gather *tlb,
> +void zap_vma_range_batched(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, unsigned long addr,
>  		unsigned long size, struct zap_details *details);
>  int zap_vma_for_reaping(struct vm_area_struct *vma);
> diff --git a/mm/madvise.c b/mm/madvise.c
> index b51f216934f3..fb5fcdff2b66 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -855,9 +855,8 @@ static long madvise_dontneed_single_vma(struct madvise_behavior *madv_behavior)
>  		.reclaim_pt = true,
>  	};
>
> -	zap_page_range_single_batched(
> -			madv_behavior->tlb, madv_behavior->vma, range->start,
> -			range->end - range->start, &details);
> +	zap_vma_range_batched(madv_behavior->tlb, madv_behavior->vma,
> +			      range->start, range->end - range->start, &details);
>  	return 0;
>  }
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 1c0bcdfc73b7..e611e9af4e85 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2167,17 +2167,20 @@ void unmap_vmas(struct mmu_gather *tlb, struct unmap_desc *unmap)
>  }
>
>  /**
> - * zap_page_range_single_batched - remove user pages in a given range
> + * zap_vma_range_batched - zap page table entries in a vma range
>   * @tlb: pointer to the caller's struct mmu_gather
> - * @vma: vm_area_struct holding the applicable pages
> - * @address: starting address of pages to remove
> - * @size: number of bytes to remove
> - * @details: details of shared cache invalidation
> + * @vma: the vma covering the range to zap
> + * @address: starting address of the range to zap
> + * @size: number of bytes to zap
> + * @details: details specifying zapping behavior
> + *
> + * @tlb must not be NULL. The provided address range must be fully
> + * contained within @vma. If @vma is for hugetlb, @tlb is flushed and
> + * re-initialized by this function.
>   *
> - * @tlb shouldn't be NULL.  The range must fit into one VMA.  If @vma is for
> - * hugetlb, @tlb is flushed and re-initialized by this function.
> + * If @details is NULL, this function will zap all page table entries.
>   */
> -void zap_page_range_single_batched(struct mmu_gather *tlb,
> +void zap_vma_range_batched(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, unsigned long address,
>  		unsigned long size, struct zap_details *details)
>  {
> @@ -2225,7 +2228,7 @@ void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
>  	struct mmu_gather tlb;
>
>  	tlb_gather_mmu(&tlb, vma->vm_mm);
> -	zap_page_range_single_batched(&tlb, vma, address, size, NULL);
> +	zap_vma_range_batched(&tlb, vma, address, size, NULL);
>  	tlb_finish_mmu(&tlb);
>  }
>
> @@ -4251,7 +4254,7 @@ static inline void unmap_mapping_range_tree(struct rb_root_cached *root,
>  		size = (end_idx - start_idx) << PAGE_SHIFT;
>
>  		tlb_gather_mmu(&tlb, vma->vm_mm);
> -		zap_page_range_single_batched(&tlb, vma, start, size, details);
> +		zap_vma_range_batched(&tlb, vma, start, size, details);
>  		tlb_finish_mmu(&tlb);
>  	}
>  }
> --
> 2.43.0
>
