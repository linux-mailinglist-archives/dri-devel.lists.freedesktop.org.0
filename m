Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CD6A9D679
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 02:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BF510E9D6;
	Fri, 25 Apr 2025 23:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HEh3M4aZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E96310E195
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 23:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745625586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wtOnWyGTfN8q6JuJ/l3fPnGL2JnyGgt9o0A4bTemOx0=;
 b=HEh3M4aZ+ecXJA4rnI9Sja+TB478u6ssVFyyJW5zKqJBGwlfJhACvP9Vo+L9D4Svr4wgc+
 YKzogpaaKMcx7qqiNPtJjdqvs+F3Kdimi5VeSNj1HIbVmclkWs78oYCjCrulRyLRcKBVaz
 mAZk7Qm0cyn7owzNMGsqGgF5s25x8ps=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-c_x-rLxmNaejOgi71Dx4hg-1; Fri, 25 Apr 2025 19:59:44 -0400
X-MC-Unique: c_x-rLxmNaejOgi71Dx4hg-1
X-Mimecast-MFC-AGG-ID: c_x-rLxmNaejOgi71Dx4hg_1745625584
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6eb2480028cso47214416d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 16:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745625584; x=1746230384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wtOnWyGTfN8q6JuJ/l3fPnGL2JnyGgt9o0A4bTemOx0=;
 b=bwbWdsU5f6aGc7IiOE1xeLHRtb4BWEUaJLdwuQ5VzD4EzyVArJxUGhgrhEcT62AGqd
 pn7ZOFYa5OG5F21EasRwqAKqkHgglKDRVhuS/KU0GpQbrRxH05jd6D9ofiPjaM+wJEM5
 yBDJaLGmb1o3/BJ2zi/Wb4avsI1HhfN3XIfIW7TO0984UF41SPTenpv2uT9nCltjWrsm
 3fed/f5WbE8XDcNh8PJs1U2o49/wLlZCwqC0xt3Qcq2tZkHJo3iyL5VVVUr11ilFQTVI
 bpHGU2fDT9Ii6sc1YE84GPmOaIfIyCEGO4jSuAQ48zj9M2ya1TeMiEpaPZDXPRVybSeO
 392w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ3xMs2Gmm39ck1Zof/g/5z6McAzrsKDfPwXDHe+0Y2ry/idWvh3FyWtTL0CQKonQOPtM4H6AI/6o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYSgpO9Vu4SQ9B9Rmu/TcCy3qHjOZ0ldPrnN+szJEKBf2aFsc0
 3cG6NnuUgAkpi59LyIV7m+SKrwOb0NS0GnTy8/PqAToWB4BA0Fdl1/Dh/7BE8CXEhlnpVjpBINp
 w6trA9/vwxGT33Gy26PYS4b3WBtuSrmuZWiNs3pPdXe5jFfyK7nMEHGbRhiJQHmFTHA==
X-Gm-Gg: ASbGnctsKqw4iDPCPqdPAPBhSGYvVSytUzFot6anuo41KJycyJGinUzC/neyihGp8fN
 7jQSZWjiuVMdiVwAMmDbu6Zha5G8gtEnNK14sakutfryhgBt729m8KKyF75DsOH27j+arTKCBD4
 RWGUuV6K70C82GO+vq2xnBdCpbuo6DjoHUKGf7yeezhUYNhhMXneiTzoOdkjzN+JfQTSSc8A2ti
 EEVcR5EJ/rchQTasrfLVFxMKt2zZTVVe6EotrNzuwN8NC1UtUl4Vb55SrwdVk6usQzMDZcMsp/G
 UeE=
X-Received: by 2002:a05:6214:194a:b0:6e6:5e15:d94f with SMTP id
 6a1803df08f44-6f4d1f19b77mr24255846d6.27.1745625584240; 
 Fri, 25 Apr 2025 16:59:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdbVSllJ4RZlkwtB3mta0Vz7At0z8Ar6VLV/trW+nwFTJ9jQ0vWTbFnH+eKnFdhDis/h0FdA==
X-Received: by 2002:a05:6214:194a:b0:6e6:5e15:d94f with SMTP id
 6a1803df08f44-6f4d1f19b77mr24255296d6.27.1745625583759; 
 Fri, 25 Apr 2025 16:59:43 -0700 (PDT)
Received: from x1.local ([85.131.185.92]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47e9efdad60sm32399051cf.28.2025.04.25.16.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 16:59:42 -0700 (PDT)
Date: Fri, 25 Apr 2025 19:59:38 -0400
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
Subject: Re: [PATCH v1 02/11] mm: convert track_pfn_insert() to
 pfnmap_sanitize_pgprot()
Message-ID: <aAwh6n058Hh490io@x1.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-3-david@redhat.com>
 <aAvjJOmvm5GsZ-JN@x1.local>
 <78f88303-6b00-42cf-8977-bf7541fa45a9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <78f88303-6b00-42cf-8977-bf7541fa45a9@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kkFTeO5FB5ikO8_Fqlkx8nN96NSoAque1W2R234y11Y_1745625584
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

On Fri, Apr 25, 2025 at 09:48:50PM +0200, David Hildenbrand wrote:
> On 25.04.25 21:31, Peter Xu wrote:
> > On Fri, Apr 25, 2025 at 10:17:06AM +0200, David Hildenbrand wrote:
> > > ... by factoring it out from track_pfn_remap().
> > > 
> > > For PMDs/PUDs, actually check the full range, and trigger a fallback
> > > if we run into this "different memory types / cachemodes" scenario.
> > 
> > The current patch looks like to still pass PAGE_SIZE into the new helper at
> > all track_pfn_insert() call sites, so it seems this comment does not 100%
> > match with the code?  Or I may have misread somewhere.
> 
> No, you're right, while reshuffling the patches I forgot to add the actual
> PMD/PUD size.
> 
> > 
> > Maybe it's still easier to keep the single-pfn lookup to never fail..  more
> > below.
> > 
> 
> [...]
> 
> > >   /*
> > > @@ -1556,8 +1553,23 @@ static inline void untrack_pfn_clear(struct vm_area_struct *vma)
> > >   extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
> > >   			   unsigned long pfn, unsigned long addr,
> > >   			   unsigned long size);
> > > -extern void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
> > > -			     pfn_t pfn);
> > > +
> > > +/**
> > > + * pfnmap_sanitize_pgprot - sanitize the pgprot for a pfn range
> > 
> > Nit: s/sanitize/update|setup|.../?
> > 
> > But maybe you have good reason to use sanitize.  No strong opinions.
> 
> What it does on PAT (only implementation so far ...) is looking up the
> memory type to select the caching mode that can be use.
> 
> "sanitize" was IMHO a good fit, because we must make sure that we don't use
> the wrong caching mode.
> 
> update/setup/... don't make that quite clear. Any other suggestions?

I'm very poor on naming.. :( So far anything seems slightly better than
sanitize to me, as the word "sanitize" is actually also used in memtype.c
for other purpose.. see sanitize_phys().

> 
> > 
> > > + * @pfn: the start of the pfn range
> > > + * @size: the size of the pfn range
> > > + * @prot: the pgprot to sanitize
> > > + *
> > > + * Sanitize the given pgprot for a pfn range, for example, adjusting the
> > > + * cachemode.
> > > + *
> > > + * This function cannot fail for a single page, but can fail for multiple
> > > + * pages.
> > > + *
> > > + * Returns 0 on success and -EINVAL on error.
> > > + */
> > > +int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size,
> > > +		pgprot_t *prot);
> > >   extern int track_pfn_copy(struct vm_area_struct *dst_vma,
> > >   		struct vm_area_struct *src_vma, unsigned long *pfn);
> > >   extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
> > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > index fdcf0a6049b9f..b8ae5e1493315 100644
> > > --- a/mm/huge_memory.c
> > > +++ b/mm/huge_memory.c
> > > @@ -1455,7 +1455,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
> > >   			return VM_FAULT_OOM;
> > >   	}
> > > -	track_pfn_insert(vma, &pgprot, pfn);
> > > +	if (pfnmap_sanitize_pgprot(pfn_t_to_pfn(pfn), PAGE_SIZE, &pgprot))
> > > +		return VM_FAULT_FALLBACK;
> > 
> > Would "pgtable" leak if it fails?  If it's PAGE_SIZE, IIUC it won't ever
> > trigger, though.
> > 
> > Maybe we could have a "void pfnmap_sanitize_pgprot_pfn(&pgprot, pfn)" to
> > replace track_pfn_insert() and never fail?  Dropping vma ref is definitely
> > a win already in all cases.
> 
> It could be a simple wrapper around pfnmap_sanitize_pgprot(), yes. That's
> certainly helpful for the single-page case.
> 
> Regarding never failing here: we should check the whole range. We have to
> make sure that none of the pages has a memory type / caching mode that is
> incompatible with what we setup.

Would it happen in real world?

IIUC per-vma registration needs to happen first, which checks for memtype
conflicts in the first place, or reserve_pfn_range() could already have
failed.

Here it's the fault path looking up the memtype, so I would expect it is
guaranteed all pfns under the same vma is following the verified (and same)
memtype?

Thanks,

-- 
Peter Xu

