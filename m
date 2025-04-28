Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2AEA9F588
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF4210E608;
	Mon, 28 Apr 2025 16:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YZMkwWQx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCCA10E606
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 16:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745857283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ICKzzB8taBJD0eGbxcxv8f4DsFK3m+kwUBskNGBQM7I=;
 b=YZMkwWQxt3Pa5FOlsOiO6LS3/qOaNylynowN2Zl2/h/jbE1cNwB8k8pGyothvl6INSJasD
 ynvUb6z+qNYBF4niC4urmdt+0mR4C3LmBx2G0TbF+6fixCaal9YGcPJBA0AzHfqEVZhF3i
 VpK+IPOpnyvIPH7OYMlFZrMPG624b2w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-RNPezKB-No6mjdqg_WCy_g-1; Mon, 28 Apr 2025 12:21:22 -0400
X-MC-Unique: RNPezKB-No6mjdqg_WCy_g-1
X-Mimecast-MFC-AGG-ID: RNPezKB-No6mjdqg_WCy_g_1745857281
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e913e1cf4aso144679416d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 09:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745857281; x=1746462081;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ICKzzB8taBJD0eGbxcxv8f4DsFK3m+kwUBskNGBQM7I=;
 b=HMsxJdx7pITWtJjQwZcJoZhkhEkK4P61XQReSHSSUeXZMHcHB2RhMtAr4jaiN7C7jz
 Y8PMxIbEQrLJTJLLzuLJTZsFm6vx+gQy+AmFqmA5LK3zOyL+/u+GD8z+C7tpXhiFwSRo
 MuofNI8WsQCcR4+RtXmiFdGZr3aMkg92cf1/efuXozOb3BchcRgVAi0yh3gT9Hq3cQ9r
 YBqcsnlUxRJk+jy/AkQQ/zTNPnDcaoCuDqk2yq8qK6fQuDXhVC67OF2mClN0Ro9ZqYzO
 UDwdlDmyw8LONAw7EhPmziluGBnGxFe0heMbYdr9wHoVNs9s/yjrMsJTtyWQREVfpesr
 QdSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk65AD97WTbxCkpT03kiLREMtqRI/MxNMi2/zq3OVxgOv5YVlwtzvkrjs7ZHVf9S8SRx59VK7upZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpdyRa0LBE4/uq2nS1gErUKY6w1uBi4x2GV2IShjaAQ5yR9lCf
 5riNa1kC3BqOR51B/INWeZwXP2LuPzjuA0QwezygYwwy69HobNn0s7N/LBw7M4KTvI8qLe/bAN3
 qKKAJrfE3NCuCVVAo+ylzf8EV5D6HKyprS45amac1xCcTcsfL/MMnPW260elvr89XUg==
X-Gm-Gg: ASbGncuMzrv1VZTDPdVSiO7GgbaQ5OqFPdZL2ZpfECRyRyHmLKgFZUklVaJ/o2TIk7m
 oE/anL0fr48z+bWGxFw2oGlF8TtFeHkKBtUAe3umYrO//bYzh1KcOg1Xpqm+USo5yZbMnb2y7Mq
 XRxg2Ho7uWy785vaREa7047Luoqs0PpONZsy7Xb/IhpXygzOjWSFT8uax6VPv8PjXk8w6vbvJm6
 hZaBc6Mcgt0rz0HPT/gy7ny3JgTG0FnJwaJ20HeX3CecFf900zS9eNb5lXibKZ9JHEyeRMMPIKf
 4kU=
X-Received: by 2002:a05:620a:19a3:b0:7c5:7a03:8467 with SMTP id
 af79cd13be357-7c9668d1d61mr1640816385a.55.1745857281509; 
 Mon, 28 Apr 2025 09:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQz1zkMFXlMEPUAS7D8yAHGiL/XnLPod9B0w30kVOxZ+K3YH+CRaciRSMW1T3Yxr1P4D1AmQ==
X-Received: by 2002:a05:620a:19a3:b0:7c5:7a03:8467 with SMTP id
 af79cd13be357-7c9668d1d61mr1640808385a.55.1745857280905; 
 Mon, 28 Apr 2025 09:21:20 -0700 (PDT)
Received: from x1.local ([85.131.185.92]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c958e9fdaesm639851585a.95.2025.04.28.09.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 09:21:20 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:21:16 -0400
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
Message-ID: <aA-q_PrThAw5v1PF@x1.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-3-david@redhat.com>
 <aAvjJOmvm5GsZ-JN@x1.local>
 <78f88303-6b00-42cf-8977-bf7541fa45a9@redhat.com>
 <aAwh6n058Hh490io@x1.local>
 <75998f7c-93d2-4b98-bb53-8d858b2c108e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <75998f7c-93d2-4b98-bb53-8d858b2c108e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BVf94Eryltudry-YyxqifQ_-gfLT6ZECwiZvv9YhzdE_1745857281
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

On Mon, Apr 28, 2025 at 04:58:46PM +0200, David Hildenbrand wrote:
> 
> > > What it does on PAT (only implementation so far ...) is looking up the
> > > memory type to select the caching mode that can be use.
> > > 
> > > "sanitize" was IMHO a good fit, because we must make sure that we don't use
> > > the wrong caching mode.
> > > 
> > > update/setup/... don't make that quite clear. Any other suggestions?
> > 
> > I'm very poor on naming.. :( So far anything seems slightly better than
> > sanitize to me, as the word "sanitize" is actually also used in memtype.c
> > for other purpose.. see sanitize_phys().
> 
> Sure, one can sanitize a lot of things. Here it's the cachemode/pgrpot, in
> the other functions it's an address.
> 
> Likely we should just call it pfnmap_X_cachemode()/
> 
> Set/update don't really fit for X in case pfnmap_X_cachemode() is a NOP.
> 
> pfnmap_setup_cachemode() ? Hm.

Sounds good here.

> 
> > 
> > > 
> > > > 
> > > > > + * @pfn: the start of the pfn range
> > > > > + * @size: the size of the pfn range
> > > > > + * @prot: the pgprot to sanitize
> > > > > + *
> > > > > + * Sanitize the given pgprot for a pfn range, for example, adjusting the
> > > > > + * cachemode.
> > > > > + *
> > > > > + * This function cannot fail for a single page, but can fail for multiple
> > > > > + * pages.
> > > > > + *
> > > > > + * Returns 0 on success and -EINVAL on error.
> > > > > + */
> > > > > +int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size,
> > > > > +		pgprot_t *prot);
> > > > >    extern int track_pfn_copy(struct vm_area_struct *dst_vma,
> > > > >    		struct vm_area_struct *src_vma, unsigned long *pfn);
> > > > >    extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
> > > > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > > > index fdcf0a6049b9f..b8ae5e1493315 100644
> > > > > --- a/mm/huge_memory.c
> > > > > +++ b/mm/huge_memory.c
> > > > > @@ -1455,7 +1455,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
> > > > >    			return VM_FAULT_OOM;
> > > > >    	}
> > > > > -	track_pfn_insert(vma, &pgprot, pfn);
> > > > > +	if (pfnmap_sanitize_pgprot(pfn_t_to_pfn(pfn), PAGE_SIZE, &pgprot))
> > > > > +		return VM_FAULT_FALLBACK;
> > > > 
> > > > Would "pgtable" leak if it fails?  If it's PAGE_SIZE, IIUC it won't ever
> > > > trigger, though.
> > > > 
> > > > Maybe we could have a "void pfnmap_sanitize_pgprot_pfn(&pgprot, pfn)" to
> > > > replace track_pfn_insert() and never fail?  Dropping vma ref is definitely
> > > > a win already in all cases.
> > > 
> > > It could be a simple wrapper around pfnmap_sanitize_pgprot(), yes. That's
> > > certainly helpful for the single-page case.
> > > 
> > > Regarding never failing here: we should check the whole range. We have to
> > > make sure that none of the pages has a memory type / caching mode that is
> > > incompatible with what we setup.
> > 
> > Would it happen in real world?
> > > IIUC per-vma registration needs to happen first, which checks for
> memtype
> > conflicts in the first place, or reserve_pfn_range() could already have
> > failed.
> > > Here it's the fault path looking up the memtype, so I would expect it is
> > guaranteed all pfns under the same vma is following the verified (and same)
> > memtype?
> 
> The whole point of track_pfn_insert() is that it is used when we *don't* use
> reserve_pfn_range()->track_pfn_remap(), no?
> 
> track_pfn_remap() would check the whole range that gets mapped, so
> track_pfn_insert() user must similarly check the whole range that gets
> mapped.
> 
> Note that even track_pfn_insert() is already pretty clear on the intended
> usage: "called when a _new_ single pfn is established"

We need to define "new" then..  But I agree it's not crystal clear at
least.  I think I just wasn't the first to assume it was reserved, see this
(especially, the "Expectation" part..):

commit 5180da410db6369d1f95c9014da1c9bc33fb043e
Author: Suresh Siddha <suresh.b.siddha@intel.com>
Date:   Mon Oct 8 16:28:29 2012 -0700

    x86, pat: separate the pfn attribute tracking for remap_pfn_range and vm_insert_pfn
    
    With PAT enabled, vm_insert_pfn() looks up the existing pfn memory
    attribute and uses it.  Expectation is that the driver reserves the
    memory attributes for the pfn before calling vm_insert_pfn().

-- 
Peter Xu

