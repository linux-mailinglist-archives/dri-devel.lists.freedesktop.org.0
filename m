Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54970A9F52E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC83210E507;
	Mon, 28 Apr 2025 16:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UyNvYQQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507DA10E1AE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745856510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RjlHZlqdBLidaHviO2ndJKZu4KjLnMsljSpmBM9kRPM=;
 b=UyNvYQQeYRoijryXqswUbs92HIwLvDg79JzsNRRZJjzU3iUsR8kVlaCvujbCEUlY29q2Hp
 7COa+v7q2snPB2lof6PNMGbVhO7fA1KCKjaMvSoy0ykoNP4/Uo2JANVtGmxxpLJOseOj8R
 mg+HvgkFVSQmvG3EUzo2vCaXtpfBPBI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-O6ZWq6HBPyGNjnHa7Xw1nQ-1; Mon, 28 Apr 2025 12:08:29 -0400
X-MC-Unique: O6ZWq6HBPyGNjnHa7Xw1nQ-1
X-Mimecast-MFC-AGG-ID: O6ZWq6HBPyGNjnHa7Xw1nQ_1745856508
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5e28d0cc0so826855985a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 09:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745856508; x=1746461308;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RjlHZlqdBLidaHviO2ndJKZu4KjLnMsljSpmBM9kRPM=;
 b=u11308oMYkBmknohwd7K+IzCMcWeH2EzOHXROE6YrtzZnyGWeb50uesXJsvcOaTYZm
 mAHq8QFSDyArgeQGs2/b0MtxooDwYy5iJvYbKC4mTAh02W2ZaaEtzEdIoDFPED29ULSx
 n7dyw3xtRSNp3tkGcEBpa+/5SW52BitLjzbmEy+jKDBlWRLaWHmUgH5RqcHxQnIBTZ3h
 GDbWU7v0JDcb0RAoD8Gv1HHurZceIVI0VKbYITxmj2c2qkQ1Bndk9xHIE7xMyipLE0Tp
 D3Rvuug4dDnQ181j+YAsiDFhfjd9vRRoLQc3NpXQMM+s7I52DXRrqmJmrof0bo7fp2PK
 M3qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSWSZdFUXj2eCLynQ9ARdGN9lKSv0arIHH+UhjKeTZlcBPSZ0oD15R9L9PbDnyZMOyWrQKkMW3dgY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxovaclx8fiJJhSZgnaFR+kJoN4DJlMkP81kAuTz4KkcEMymco0
 y9OvZbHeFGk6SxuWiWk9FLOX9YtEeki4BX26hB2E21uHTzJmOBpak3Gtt6U57E8vac0V+XCWJL0
 O/vqb0/0lt0BMKlrf9WhfW5FNCS8MnhxFix9JTZAWovEXsqv7XmRDSUAAAfT4rmtt5A==
X-Gm-Gg: ASbGncsqKfpipdqucgBwCcv/pip7e9fJVJt1aw2cYqDsGhKWNDj/2OigpSJuXe/mv1k
 b7AknU/hYuogWqyT6rHvoAHEWHxY0T+KXjD/CMCA0hMQHUfVIM7T34ggCVKGT0PGMEOJpkbu9mW
 SHPslx5rSvy1Z0o178tp5p5pgHTb2KeHe9ro02s+rVOwV8um8vb+VZflqtOC/r5/3LzvXNluVoH
 kjE5QgAxm19weee51VmVBAGD46Q/9y/aRH7hmG8d5z/BkgO+W2NcJG7IYEXHcRvQ7Nj8yGL218v
 Lcc=
X-Received: by 2002:a05:620a:10a1:b0:7c5:5768:409f with SMTP id
 af79cd13be357-7c9619fa9a7mr1645601285a.57.1745856507673; 
 Mon, 28 Apr 2025 09:08:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW5BlJDkcwxdtW1DAIlXgy/Si+TW6ulb7oYDt7LUfQf0Ngyzow9trm051yins+fPxPd9qHkw==
X-Received: by 2002:a05:620a:10a1:b0:7c5:5768:409f with SMTP id
 af79cd13be357-7c9619fa9a7mr1645595485a.57.1745856507123; 
 Mon, 28 Apr 2025 09:08:27 -0700 (PDT)
Received: from x1.local ([85.131.185.92]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c958e9f111sm636846285a.93.2025.04.28.09.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 09:08:26 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:08:22 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to
 pfnmap_track() + pfnmap_untrack()
Message-ID: <aA-n9hvSX9JLsRM-@x1.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com>
 <aAvvQ1h9bg11hiqI@x1.local>
 <bbadf008-9ffc-4628-9809-2d8cf104a424@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bbadf008-9ffc-4628-9809-2d8cf104a424@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oeu2A276x34S1SV7KykwfHHxf29o6_Oj_gphby-LLkU_1745856508
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

On Fri, Apr 25, 2025 at 10:36:55PM +0200, David Hildenbrand wrote:
> On 25.04.25 22:23, Peter Xu wrote:
> > On Fri, Apr 25, 2025 at 10:17:09AM +0200, David Hildenbrand wrote:
> > > Let's use our new interface. In remap_pfn_range(), we'll now decide
> > > whether we have to track (full VMA covered) or only sanitize the pgprot
> > > (partial VMA covered).
> > > 
> > > Remember what we have to untrack by linking it from the VMA. When
> > > duplicating VMAs (e.g., splitting, mremap, fork), we'll handle it similar
> > > to anon VMA names, and use a kref to share the tracking.
> > > 
> > > Once the last VMA un-refs our tracking data, we'll do the untracking,
> > > which simplifies things a lot and should sort our various issues we saw
> > > recently, for example, when partially unmapping/zapping a tracked VMA.
> > > 
> > > This change implies that we'll keep tracking the original PFN range even
> > > after splitting + partially unmapping it: not too bad, because it was
> > > not working reliably before. The only thing that kind-of worked before
> > > was shrinking such a mapping using mremap(): we managed to adjust the
> > > reservation in a hacky way, now we won't adjust the reservation but
> > > leave it around until all involved VMAs are gone.
> > > 
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > ---
> > >   include/linux/mm_inline.h |  2 +
> > >   include/linux/mm_types.h  | 11 ++++++
> > >   kernel/fork.c             | 54 ++++++++++++++++++++++++--
> > >   mm/memory.c               | 81 +++++++++++++++++++++++++++++++--------
> > >   mm/mremap.c               |  4 --
> > >   5 files changed, 128 insertions(+), 24 deletions(-)
> > > 
> > > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > > index f9157a0c42a5c..89b518ff097e6 100644
> > > --- a/include/linux/mm_inline.h
> > > +++ b/include/linux/mm_inline.h
> > > @@ -447,6 +447,8 @@ static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
> > >   #endif  /* CONFIG_ANON_VMA_NAME */
> > > +void pfnmap_track_ctx_release(struct kref *ref);
> > > +
> > >   static inline void init_tlb_flush_pending(struct mm_struct *mm)
> > >   {
> > >   	atomic_set(&mm->tlb_flush_pending, 0);
> > > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > > index 56d07edd01f91..91124761cfda8 100644
> > > --- a/include/linux/mm_types.h
> > > +++ b/include/linux/mm_types.h
> > > @@ -764,6 +764,14 @@ struct vma_numab_state {
> > >   	int prev_scan_seq;
> > >   };
> > > +#ifdef __HAVE_PFNMAP_TRACKING
> > > +struct pfnmap_track_ctx {
> > > +	struct kref kref;
> > > +	unsigned long pfn;
> > > +	unsigned long size;
> > > +};
> > > +#endif
> > > +
> > >   /*
> > >    * This struct describes a virtual memory area. There is one of these
> > >    * per VM-area/task. A VM area is any part of the process virtual memory
> > > @@ -877,6 +885,9 @@ struct vm_area_struct {
> > >   	struct anon_vma_name *anon_name;
> > >   #endif
> > >   	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> > > +#ifdef __HAVE_PFNMAP_TRACKING
> > > +	struct pfnmap_track_ctx *pfnmap_track_ctx;
> > > +#endif
> > 
> > So this was originally the small concern (or is it small?) that this will
> > grow every vma on x86, am I right?
> 
> Yeah, and last time I looked into this, it would have grown it such that it would
> require a bigger slab. Right now:

Probably due to what config you have.  E.g., when I'm looking mine it's
much bigger and already consuming 256B, but it's because I enabled more
things (userfaultfd, lockdep, etc.).

> 
> Before this change:
> 
> struct vm_area_struct {
> 	union {
> 		struct {
> 			long unsigned int vm_start;      /*     0     8 */
> 			long unsigned int vm_end;        /*     8     8 */
> 		};                                       /*     0    16 */
> 		freeptr_t          vm_freeptr;           /*     0     8 */
> 	};                                               /*     0    16 */
> 	struct mm_struct *         vm_mm;                /*    16     8 */
> 	pgprot_t                   vm_page_prot;         /*    24     8 */
> 	union {
> 		const vm_flags_t   vm_flags;             /*    32     8 */
> 		vm_flags_t         __vm_flags;           /*    32     8 */
> 	};                                               /*    32     8 */
> 	unsigned int               vm_lock_seq;          /*    40     4 */
> 
> 	/* XXX 4 bytes hole, try to pack */
> 
> 	struct list_head           anon_vma_chain;       /*    48    16 */
> 	/* --- cacheline 1 boundary (64 bytes) --- */
> 	struct anon_vma *          anon_vma;             /*    64     8 */
> 	const struct vm_operations_struct  * vm_ops;     /*    72     8 */
> 	long unsigned int          vm_pgoff;             /*    80     8 */
> 	struct file *              vm_file;              /*    88     8 */
> 	void *                     vm_private_data;      /*    96     8 */
> 	atomic_long_t              swap_readahead_info;  /*   104     8 */
> 	struct mempolicy *         vm_policy;            /*   112     8 */
> 	struct vma_numab_state *   numab_state;          /*   120     8 */
> 	/* --- cacheline 2 boundary (128 bytes) --- */
> 	refcount_t                 vm_refcnt __attribute__((__aligned__(64))); /*   128     4 */
> 
> 	/* XXX 4 bytes hole, try to pack */
> 
> 	struct {
> 		struct rb_node     rb __attribute__((__aligned__(8))); /*   136    24 */
> 		long unsigned int  rb_subtree_last;      /*   160     8 */
> 	} __attribute__((__aligned__(8))) shared __attribute__((__aligned__(8)));        /*   136    32 */
> 	struct anon_vma_name *     anon_name;            /*   168     8 */
> 	struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     0 */
> 
> 	/* size: 192, cachelines: 3, members: 18 */
> 	/* sum members: 168, holes: 2, sum holes: 8 */
> 	/* padding: 16 */
> 	/* forced alignments: 2, forced holes: 1, sum forced holes: 4 */
> } __attribute__((__aligned__(64)));
> 
> After this change:
> 
> struct vm_area_struct {
> 	union {
> 		struct {
> 			long unsigned int vm_start;      /*     0     8 */
> 			long unsigned int vm_end;        /*     8     8 */
> 		};                                       /*     0    16 */
> 		freeptr_t          vm_freeptr;           /*     0     8 */
> 	};                                               /*     0    16 */
> 	struct mm_struct *         vm_mm;                /*    16     8 */
> 	pgprot_t                   vm_page_prot;         /*    24     8 */
> 	union {
> 		const vm_flags_t   vm_flags;             /*    32     8 */
> 		vm_flags_t         __vm_flags;           /*    32     8 */
> 	};                                               /*    32     8 */
> 	unsigned int               vm_lock_seq;          /*    40     4 */
> 
> 	/* XXX 4 bytes hole, try to pack */
> 
> 	struct list_head           anon_vma_chain;       /*    48    16 */
> 	/* --- cacheline 1 boundary (64 bytes) --- */
> 	struct anon_vma *          anon_vma;             /*    64     8 */
> 	const struct vm_operations_struct  * vm_ops;     /*    72     8 */
> 	long unsigned int          vm_pgoff;             /*    80     8 */
> 	struct file *              vm_file;              /*    88     8 */
> 	void *                     vm_private_data;      /*    96     8 */
> 	atomic_long_t              swap_readahead_info;  /*   104     8 */
> 	struct mempolicy *         vm_policy;            /*   112     8 */
> 	struct vma_numab_state *   numab_state;          /*   120     8 */
> 	/* --- cacheline 2 boundary (128 bytes) --- */
> 	refcount_t                 vm_refcnt __attribute__((__aligned__(64))); /*   128     4 */
> 
> 	/* XXX 4 bytes hole, try to pack */
> 
> 	struct {
> 		struct rb_node     rb __attribute__((__aligned__(8))); /*   136    24 */
> 		long unsigned int  rb_subtree_last;      /*   160     8 */
> 	} __attribute__((__aligned__(8))) shared __attribute__((__aligned__(8)));        /*   136    32 */
> 	struct anon_vma_name *     anon_name;            /*   168     8 */
> 	struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     0 */
> 	struct pfnmap_track_ctx *  pfnmap_track_ctx;     /*   176     8 */
> 
> 	/* size: 192, cachelines: 3, members: 19 */
> 	/* sum members: 176, holes: 2, sum holes: 8 */
> 	/* padding: 8 */
> 	/* forced alignments: 2, forced holes: 1, sum forced holes: 4 */
> } __attribute__((__aligned__(64)));
> 
> Observe that we allocate 192 bytes with or without pfnmap_track_ctx. (IIRC,
> slab sizes are ... 128, 192, 256, 512, ...)

True. I just double checked, vm_area_cachep has SLAB_HWCACHE_ALIGN set, I
think it means it's working like that on x86_64 at least indeed.  So looks
like the new field at least isn't an immediate concern.

Thanks,

-- 
Peter Xu

