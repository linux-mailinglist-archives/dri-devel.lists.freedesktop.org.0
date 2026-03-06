Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIQyJp/DqmnTWwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:07:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CC622029D
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0C510E1C8;
	Fri,  6 Mar 2026 12:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="roeMH8Kf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B1010E1C8;
 Fri,  6 Mar 2026 12:07:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2472160127;
 Fri,  6 Mar 2026 12:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3635AC4CEF7;
 Fri,  6 Mar 2026 12:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772798875;
 bh=IJiEATCx3KH7Ih3WoWiyfikf1eOEPdfJ9CNxxKLM5Eg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=roeMH8Kftj8MRsWE1Hp/mVV1SwsBtfCWiiiXCPi7krCUZ4blCgdJGU7GHSUjbZok1
 b73rFiWJzPYENmWhMs2aF/Ex4R+V0J1o1W+enrxeRzpCIUyx6/yReiQuRarpkX8LG+
 lLQ62drq0d7kYS1tzFLC8NKIKLnFKQew0+t1HYPjU6XFudRqQeosg1NEfXqsGR+VD3
 193HJwTkEwoGPyOPSn7wL613KKTFkEp68XT5pmvDSb59G+kLrWQaIBAfxgMjWA5VLL
 Cy6eEN2sjc6AIdqSynsvJHCNfmRINyoRwDhEZU54uFvMBCB89U3pcRIfzj/49ti+/9
 2RO128kVNT5lQ==
Date: Fri, 6 Mar 2026 12:07:52 +0000
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
Subject: Re: [PATCH v1 03/16] mm/memory: inline unmap_mapping_range_vma()
 into unmap_mapping_range_tree()
Message-ID: <60b136c3-883c-41fc-ab9a-8ca5977d4456@lucifer.local>
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-4-david@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227200848.114019-4-david@kernel.org>
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
X-Rspamd-Queue-Id: 12CC622029D
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

On Fri, Feb 27, 2026 at 09:08:34PM +0100, David Hildenbrand (Arm) wrote:
> Let's remove the number of unmap-related functions that cause confusion
> by inlining unmap_mapping_range_vma() into its single caller. The end
> result looks pretty readable.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Yeah that's fine, and while I usually like having lots of smaller functions to
break up logic, I always felt when reading it that the zap logic had _too many_
so this is welcome.

LGTM, so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  mm/memory.c | 23 +++++++----------------
>  1 file changed, 7 insertions(+), 16 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 19f5f9a60995..5c47309331f5 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4221,18 +4221,6 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
>  	return wp_page_copy(vmf);
>  }
>
> -static void unmap_mapping_range_vma(struct vm_area_struct *vma,
> -		unsigned long start_addr, unsigned long end_addr,
> -		struct zap_details *details)
> -{
> -	struct mmu_gather tlb;
> -
> -	tlb_gather_mmu(&tlb, vma->vm_mm);
> -	zap_page_range_single_batched(&tlb, vma, start_addr,
> -				      end_addr - start_addr, details);
> -	tlb_finish_mmu(&tlb);
> -}
> -
>  static inline void unmap_mapping_range_tree(struct rb_root_cached *root,
>  					    pgoff_t first_index,
>  					    pgoff_t last_index,
> @@ -4240,17 +4228,20 @@ static inline void unmap_mapping_range_tree(struct rb_root_cached *root,
>  {
>  	struct vm_area_struct *vma;
>  	pgoff_t vba, vea, zba, zea;
> +	unsigned long start, size;
> +	struct mmu_gather tlb;
>
>  	vma_interval_tree_foreach(vma, root, first_index, last_index) {
>  		vba = vma->vm_pgoff;
>  		vea = vba + vma_pages(vma) - 1;
>  		zba = max(first_index, vba);
>  		zea = min(last_index, vea);
> +		start = ((zba - vba) << PAGE_SHIFT) + vma->vm_start;
> +		size = (zea - zba + 1) << PAGE_SHIFT;
>
> -		unmap_mapping_range_vma(vma,
> -			((zba - vba) << PAGE_SHIFT) + vma->vm_start,
> -			((zea - vba + 1) << PAGE_SHIFT) + vma->vm_start,
> -				details);
> +		tlb_gather_mmu(&tlb, vma->vm_mm);
> +		zap_page_range_single_batched(&tlb, vma, start, size, details);
> +		tlb_finish_mmu(&tlb);
>  	}
>  }
>
> --
> 2.43.0
>
