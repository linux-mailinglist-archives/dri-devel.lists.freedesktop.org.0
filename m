Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFTGK0rPrmnEIwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:46:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B57239F46
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EE410E183;
	Mon,  9 Mar 2026 13:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BVr69GD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFBB10E183;
 Mon,  9 Mar 2026 13:46:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 77C214423B;
 Mon,  9 Mar 2026 13:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF8FC4CEF7;
 Mon,  9 Mar 2026 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773064005;
 bh=w0QUYZum+m+R/ZMJD9ICvWbnwxxvrz4NQJRGvdgYc+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BVr69GD85TMcTAfG+a8utDGbnLRZpnfsgk6oAEieKIf3SbpafBvF3+irOxH5364Mf
 5pQjiP3OB9FC6sxDF6sRahqD3JxDLeM/LKZhytQKKexcd9nKBgdJPKEyw8sk8hmBqZ
 6Umeng6LJPjNhP9ijAtZ1GLP3fQirKriMZIBcjz1MV/Ly4Ym8+L+fbakf0sGYzf2HZ
 3zIBqoZorFxzO8i8L6kszr5AnLvTpWYNSPn5PmXLkOowtVs0WINaH4TFDGQhbj2jWW
 Xu+fRiMPtxXfm3CsyrGqKEUJHR4HPp+HrebcbqvJ0J7zXXW7tbIaDGtBQ28EmTK0dV
 febooG99fQKig==
Date: Mon, 9 Mar 2026 13:46:27 +0000
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
Subject: Re: [PATCH v1 11/16] mm/memory: inline unmap_page_range() into
 __zap_vma_range()
Message-ID: <737a88b8-8221-44e6-aa90-3be326bc8612@lucifer.local>
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-12-david@kernel.org>
 <a5765cac-69d6-4314-82d5-80ee363906de@lucifer.local>
 <bc5cfcc4-5e51-4da1-9ce9-ea0831bec400@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc5cfcc4-5e51-4da1-9ce9-ea0831bec400@kernel.org>
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
X-Rspamd-Queue-Id: 17B57239F46
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
	NEURAL_HAM(-0.00)[-0.957];
	RCPT_COUNT_GT_50(0.00)[74];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer.local:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 02:16:26PM +0100, David Hildenbrand (Arm) wrote:
> On 3/6/26 13:29, Lorenzo Stoakes (Oracle) wrote:
> > On Fri, Feb 27, 2026 at 09:08:42PM +0100, David Hildenbrand (Arm) wrote:
> >> Let's inline it into the single caller to reduce the number of confusing
> >> unmap/zap helpers.
> >>
> >> Get rid of the unnecessary BUG_ON().
> >>
> >> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> >
> > Small nits below, but overall LGTM so:
> >
> > Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> >
> >> ---
> >>  mm/memory.c | 32 ++++++++++++--------------------
> >>  1 file changed, 12 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/mm/memory.c b/mm/memory.c
> >> index 394b2e931974..1c0bcdfc73b7 100644
> >> --- a/mm/memory.c
> >> +++ b/mm/memory.c
> >> @@ -2056,25 +2056,6 @@ static inline unsigned long zap_p4d_range(struct mmu_gather *tlb,
> >>  	return addr;
> >>  }
> >>
> >> -static void unmap_page_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >> -		unsigned long addr, unsigned long end,
> >> -		struct zap_details *details)
> >> -{
> >> -	pgd_t *pgd;
> >> -	unsigned long next;
> >> -
> >> -	BUG_ON(addr >= end);
> >> -	tlb_start_vma(tlb, vma);
> >> -	pgd = pgd_offset(vma->vm_mm, addr);
> >> -	do {
> >> -		next = pgd_addr_end(addr, end);
> >> -		if (pgd_none_or_clear_bad(pgd))
> >> -			continue;
> >> -		next = zap_p4d_range(tlb, vma, pgd, addr, next, details);
> >> -	} while (pgd++, addr = next, addr != end);
> >> -	tlb_end_vma(tlb, vma);
> >> -}
> >> -
> >>  static void __zap_vma_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >>  		unsigned long start, unsigned long end,
> >>  		struct zap_details *details)
> >> @@ -2100,7 +2081,18 @@ static void __zap_vma_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >>  			return;
> >>  		__unmap_hugepage_range(tlb, vma, start, end, NULL, zap_flags);
> >>  	} else {
> >> -		unmap_page_range(tlb, vma, start, end, details);
> >> +		unsigned long next, cur = start;
> >
> > VERY nitty, but generally current is abbreviated to curr not cur.
> >
>
> The following might not be fully expressive (but simple to grep):
>
> $ git grep "cur_" | wc -l
> 24261
> $ git grep "curr_" | wc -l
> 9288

Lol hmm...

>
> Tells me that "cur" is rather common.
>
> > It's not a big deal, but why not addr?
>
> Good question, I can just do that. :)

Thanks!

>
> --
> Cheers,
>
> David

Cheers, Lorenzo
