Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A89C73CFCD
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 11:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50A410E155;
	Sun, 25 Jun 2023 09:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF1410E155
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 09:51:53 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1a9db19d663so2305518fac.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 02:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687686712; x=1690278712;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=290Ekn0ODsVNn0aKIx+AgyiRc2lDIGBbbnI/1Hia+80=;
 b=LOreZASmxemQLA5cOE5xrQ1dovPn/FIix2UBEWF9jFYKi3belc6ilTzLpmJhI9SLsh
 4lPY92CeZD8/ddCleRKdbv+hAdGjPiZYeBd1aHP8z/NePyiMLTA+didZ1LaWP8Ec3TsB
 1QgCEJafhN6tJLMCjsaZvGLmTVonosA+gsY25tvdSLd3jTYcYUreSb2JtLlmaDAhB0s+
 UIAm3I1kXN4xJ6VVKO/z+GwkEp3FwzGOGqc4YKF4C3m6GcMwq0L/NmCAdfkHpuGrD9kb
 Pmj/WJVf8N5HB+3G0ydouWyli9Qw5q9om6tfAiIxSgbZiHR7TcbXJk6Ssheme7frtu47
 pjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687686712; x=1690278712;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=290Ekn0ODsVNn0aKIx+AgyiRc2lDIGBbbnI/1Hia+80=;
 b=jD+55PMgYKnX2sa3Cn510KwNeSpC9D9sZ6TdoRoPOxSD4oVYA8IPQAYo4trIpX9drL
 AWFlcdN2wKMJ9UimTqvJmoye58gEjmwPQV7xIclBbfug5wRJ6XNrm9A0mtMD/k/Nv9ct
 GK3DMcUd8gPeSGmdZ0TDejKDwilY3UinnXgbn0Rhw+RQy4t9YvnT1Y7vjso28TgI4yHW
 IyzjtxvhEs95qUxbB2BiHaxatkUJofye0e4iDAqYGeLyuVhX7USzyVqFYES72xQN2dpw
 VNIfrAz+N8jp6MejydW21oHG2165dxnVhIriVM3E8+patJeLitKSWW1t3BdGkZqYCcZ8
 iUAA==
X-Gm-Message-State: AC+VfDwIBO8kGw4I5fbQpqC2fXHeumWAb+WBKACGQCa0YXvpNton+p8L
 64guqsQl+MR2sEzsZaEkRQQ=
X-Google-Smtp-Source: ACHHUZ6NvZ6deZEkzNA7OTQrNaI6xMtMV5rHEjfwutqVjl7yhdM0DAartFUwXr6OCSM/LqQ2N/eoRw==
X-Received: by 2002:a05:6870:7347:b0:1a3:74e:7863 with SMTP id
 r7-20020a056870734700b001a3074e7863mr20840637oal.4.1687686712188; 
 Sun, 25 Jun 2023 02:51:52 -0700 (PDT)
Received: from sumitra.com ([59.89.167.84]) by smtp.gmail.com with ESMTPSA id
 14-20020a630b0e000000b0054fb537ca5dsm2190850pgl.92.2023.06.25.02.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jun 2023 02:51:51 -0700 (PDT)
Date: Sun, 25 Jun 2023 02:51:43 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH] drm/gma500: Replace kmap{,_atomic}() with page_address()
Message-ID: <20230625095143.GB436009@sumitra.com>
References: <20230620180148.GA419134@sumitra.com>
 <2565983.Lt9SDvczpP@suse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2565983.Lt9SDvczpP@suse>
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
Cc: Sumitra Sharma <sumitraartsy@gmail.com>, Deepak R Varma <drv@mailo.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zhao Liu <zhao1.liu@linux.intel.com>, Ira Weiny <ira.weiny@intel.com>,
 zhao1.liu@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 21, 2023 at 12:31:40AM +0200, Fabio M. De Francesco wrote:
> On martedì 20 giugno 2023 20:01:48 CEST Sumitra Sharma wrote:
> > Remove unnecessary calls to kmap{,_atomic}() when acquiring
> > pages using GFP_DMA32.
> > 
> > The GFP_DMA32 uses the DMA32 zone to satisfy the allocation
> > requests. Therefore, pages allocated with GFP_DMA32 cannot
> > come from Highmem.
> > 
> > Avoid using calls to kmap_local_page() / kunmap_local() and
> > kmap() / kunmap() in the psb_mmu_alloc_pd function. Instead,
> > utilize page_address().
> > 
> > Remove the usage of kmap_atomic() / kunmap_atomic() in the
> > psb_mmu_alloc_pt function. Use page_address() instead.
> > 
> > Substitute kmap_atomic(pt->p) / kunmap_atomic(pt->v) calls
> > in the psb_mmu_pt_alloc_map_lock() and psb_mmu_pt_unmap_unlock()
> > functions with page_address(pt->p). This is possible as
> > pt = psb_mmu_alloc_pt(pd) allocates a page using
> > pt->p = alloc_page(GFP_DMA32).
> 
> Sumitra,
> 
> I'm sorry because this patch cannot acked with this commit message.
> 
> This commit message is missing two _really_ important information. Therefore, 
> it is not acked. Please check again what I write below and either add the 
> missing information or change the code accordingly...
> 
> You should assure everybody that the code between the old kmap_atomic() / 
> kunmap_atomic() doesn't depend either on implicit pagefault_disable() or 
> preempt_disable() calls or both. 
> 
> Please read again the section of the Highmem's documentation regarding 
> kmap_atomic() at https://docs.kernel.org/mm/highmem.html
> 
> In particular take care to read and understand what "[] the code between calls 
> to kmap_atomic() and kunmap_atomic() may implicitly depend on the side effects 
> of atomic mappings, i.e. disabling page faults or preemption, or both. In that 
> case, explicit calls to pagefault_disable() or preempt_disable() or both must 
> be made in conjunction with the use of kmap_local_page().".
> 
> Please study carefully also the following patch from Zhao, suggested by Ira 
> and reviewed by Ira and I: "[PATCH v2 3/9] drm/i915: Use kmap_local_page() in 
> gem/i915_gem_shmem.c". It's not yet reached upstream so you need to find it in 
> lore.kernel.org at https://lore.kernel.org/lkml/20230329073220.3982460-4-zhao1.liu@linux.intel.com/
> 
> Please note that, in turn, that patch also contains a link to a patch from Ira 
> who too had to disable faults (https://lore.kernel.org/all/
> 20220813220034.806698-1-ira.weiny@intel.com)
> 
> I haven't yet looked at your code. If any sections do depend on those implicit 
> disables, you should act accordingly and add one or both of the above-
> mentioned calls, even in cases where you get rid of local mappings.
> 
> Instead if the sections don't depend on the mentioned side effects, you should 
> write something like what I wrote in "[PATCH] NFS: Convert kmap_atomic() to 
> kmap_local_folio()" that you can find at https://lore.kernel.org/lkml/
> 20230503172411.3356-1-fmdefrancesco@gmail.com/ or, by by using "git show 
> 4b71e2416ec4".
> 
> Thanks for working on this,
> 
> Fabio 
> 


Hi Fabio,

Thank you for notifying the mistakes I made in this patch. I am directly
working on the changes.

Regards
Sumitra



> > 
> > Suggested-by: Ira Weiny <ira.weiny@intel.com>
> > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > ---
> >  drivers/gpu/drm/gma500/mmu.c | 17 +++++------------
> >  1 file changed, 5 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/gma500/mmu.c b/drivers/gpu/drm/gma500/mmu.c
> > index a70b01ccdf70..59aa5661e56a 100644
> > --- a/drivers/gpu/drm/gma500/mmu.c
> > +++ b/drivers/gpu/drm/gma500/mmu.c
> > @@ -184,20 +184,15 @@ struct psb_mmu_pd *psb_mmu_alloc_pd(struct
> > psb_mmu_driver *driver, pd->invalid_pte = 0;
> >  	}
> > 
> > -	v = kmap_local_page(pd->dummy_pt);
> > +	v = page_address(pd->dummy_pt);
> >  	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
> >  		v[i] = pd->invalid_pte;
> > 
> > -	kunmap_local(v);
> > -
> > -	v = kmap_local_page(pd->p);
> > +	v = page_address(pd->p);
> >  	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
> >  		v[i] = pd->invalid_pde;
> > 
> > -	kunmap_local(v);
> > -
> > -	clear_page(kmap(pd->dummy_page));
> > -	kunmap(pd->dummy_page);
> > +	clear_page(page_address(pd->dummy_page));
> > 
> >  	pd->tables = vmalloc_user(sizeof(struct psb_mmu_pt *) * 1024);
> >  	if (!pd->tables)
> > @@ -279,7 +274,7 @@ static struct psb_mmu_pt *psb_mmu_alloc_pt(struct
> > psb_mmu_pd *pd)
> > 
> >  	spin_lock(lock);
> > 
> > -	v = kmap_atomic(pt->p);
> > +	v = page_address(pt->p);
> >  	clf = (uint8_t *) v;
> >  	ptes = (uint32_t *) v;
> >  	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
> > @@ -293,7 +288,6 @@ static struct psb_mmu_pt *psb_mmu_alloc_pt(struct
> > psb_mmu_pd *pd) }
> >  		mb();
> >  	}
> > -	kunmap_atomic(v);
> >  	spin_unlock(lock);
> > 
> >  	pt->count = 0;
> > @@ -339,7 +333,7 @@ static struct psb_mmu_pt 
> *psb_mmu_pt_alloc_map_lock(struct
> > psb_mmu_pd *pd, atomic_set(&pd->driver->needs_tlbflush, 1);
> >  		}
> >  	}
> > -	pt->v = kmap_atomic(pt->p);
> > +	pt->v = page_address(pt->p);
> >  	return pt;
> >  }
> > 
> > @@ -365,7 +359,6 @@ static void psb_mmu_pt_unmap_unlock(struct psb_mmu_pt 
> *pt)
> > struct psb_mmu_pd *pd = pt->pd;
> >  	uint32_t *v;
> > 
> > -	kunmap_atomic(pt->v);
> >  	if (pt->count == 0) {
> >  		v = kmap_atomic(pd->p);
> >  		v[pt->index] = pd->invalid_pde;
> > --
> > 2.25.1
> 
> 
> 
> 
