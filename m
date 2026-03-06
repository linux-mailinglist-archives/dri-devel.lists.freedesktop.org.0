Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADDBHS/LqmlWXAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:40:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D34BC220CC6
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A29110E196;
	Fri,  6 Mar 2026 12:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="teU+WZvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5511410E196;
 Fri,  6 Mar 2026 12:40:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 466E2444A2;
 Fri,  6 Mar 2026 12:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E997C4CEF7;
 Fri,  6 Mar 2026 12:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772800810;
 bh=momqQiCPeBiESmsNjbCQuXjIElnPD5t8ixlqkLdaUNY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=teU+WZvcr3Vfjfj4PS79KVLwqpyqTY1ONa1PtwIvjXtMon6hdWoFyi7tYSgQVQlA7
 7WqNZXjH072FsKlQxHwMb1xYD4ogJ/HhRqFMhvz7mUpomd6qDRF1LsEb2Nx0xCA20F
 Q306mWNpenrHSDponyi32Ye/+ALDPg+T87ZCaJf9rHbmPLs7TEcXwfiNFZJ08Qk58i
 YudRyMnPxWInwwAAt3CqHvwKRQrMAo7VQbC5DvtngGuMvZuxZUii1u78G4eRDQ1D/r
 cgHhuLioq6MaNE+pd+1wCN6iTybUQcrEBmRwhDJWiYLDD7kyNQioEEvs3ECG9KmNxt
 q/+pMMPgggcHw==
Date: Fri, 6 Mar 2026 12:40:07 +0000
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
Subject: Re: [PATCH v1 08/16] mm/memory: move adjusting of address range to
 unmap_vmas()
Message-ID: <6858ccdd-5065-4396-81c9-489bf2d43c9e@lucifer.local>
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-9-david@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227200848.114019-9-david@kernel.org>
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
X-Rspamd-Queue-Id: D34BC220CC6
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer.local:mid]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 09:08:39PM +0100, David Hildenbrand (Arm) wrote:
> __zap_vma_range() has two callers, whereby
> zap_page_range_single_batched() documents that the range must fit into
> the VMA range.
>
> So move adjusting the range to unmap_vmas() where it is actually
> required and add a safety check in __zap_vma_range() instead. In
> unmap_vmas(), we'd never expect to have empty ranges (otherwise, why
> have the vma in there in the first place).
>
> __zap_vma_range() will no longer be called with start == end, so
> cleanup the function a bit. While at it, simplify the overly long
> comment to its core message.
>
> We will no longer call uprobe_munmap() for start == end, which actually
> seems to be the right thing to do.
>
> Note that hugetlb_zap_begin()->...->adjust_range_if_pmd_sharing_possible()
> cannot result in the range exceeding the vma range.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM, So:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  mm/memory.c | 58 +++++++++++++++++++++--------------------------------
>  1 file changed, 23 insertions(+), 35 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index f0aaec57a66b..fdcd2abf29c2 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2073,44 +2073,28 @@ static void unmap_page_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  	tlb_end_vma(tlb, vma);
>  }
>
> -
> -static void __zap_vma_range(struct mmu_gather *tlb,
> -		struct vm_area_struct *vma, unsigned long start_addr,
> -		unsigned long end_addr, struct zap_details *details)
> +static void __zap_vma_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
> +		unsigned long start, unsigned long end,
> +		struct zap_details *details)
>  {
> -	unsigned long start = max(vma->vm_start, start_addr);
> -	unsigned long end;
> -
> -	if (start >= vma->vm_end)
> -		return;
> -	end = min(vma->vm_end, end_addr);
> -	if (end <= vma->vm_start)
> -		return;
> +	VM_WARN_ON_ONCE(start >= end || !range_in_vma(vma, start, end));
>
>  	if (vma->vm_file)
>  		uprobe_munmap(vma, start, end);
>
> -	if (start != end) {
> -		if (unlikely(is_vm_hugetlb_page(vma))) {
> -			/*
> -			 * It is undesirable to test vma->vm_file as it
> -			 * should be non-null for valid hugetlb area.
> -			 * However, vm_file will be NULL in the error
> -			 * cleanup path of mmap_region. When
> -			 * hugetlbfs ->mmap method fails,
> -			 * mmap_region() nullifies vma->vm_file
> -			 * before calling this function to clean up.
> -			 * Since no pte has actually been setup, it is
> -			 * safe to do nothing in this case.
> -			 */
> -			if (vma->vm_file) {
> -				zap_flags_t zap_flags = details ?
> -				    details->zap_flags : 0;
> -				__unmap_hugepage_range(tlb, vma, start, end,
> -							     NULL, zap_flags);
> -			}
> -		} else
> -			unmap_page_range(tlb, vma, start, end, details);
> +	if (unlikely(is_vm_hugetlb_page(vma))) {
> +		zap_flags_t zap_flags = details ? details->zap_flags : 0;
> +
> +		/*
> +		 * vm_file will be NULL when we fail early while instantiating
> +		 * a new mapping. In this case, no pages were mapped yet and
> +		 * there is nothing to do.
> +		 */
> +		if (!vma->vm_file)
> +			return;
> +		__unmap_hugepage_range(tlb, vma, start, end, NULL, zap_flags);
> +	} else {
> +		unmap_page_range(tlb, vma, start, end, details);
>  	}
>  }
>
> @@ -2174,8 +2158,9 @@ void unmap_vmas(struct mmu_gather *tlb, struct unmap_desc *unmap)
>  				unmap->vma_start, unmap->vma_end);
>  	mmu_notifier_invalidate_range_start(&range);
>  	do {
> -		unsigned long start = unmap->vma_start;
> -		unsigned long end = unmap->vma_end;
> +		unsigned long start = max(vma->vm_start, unmap->vma_start);
> +		unsigned long end = min(vma->vm_end, unmap->vma_end);
> +
>  		hugetlb_zap_begin(vma, &start, &end);
>  		__zap_vma_range(tlb, vma, start, end, &details);
>  		hugetlb_zap_end(vma, &details);
> @@ -2204,6 +2189,9 @@ void zap_page_range_single_batched(struct mmu_gather *tlb,
>
>  	VM_WARN_ON_ONCE(!tlb || tlb->mm != vma->vm_mm);
>
> +	if (unlikely(!size))
> +		return;
> +
>  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
>  				address, end);
>  	hugetlb_zap_begin(vma, &range.start, &range.end);
> --
> 2.43.0
>
