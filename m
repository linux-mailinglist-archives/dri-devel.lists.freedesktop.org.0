Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D7A33733C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 14:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D726EC54;
	Thu, 11 Mar 2021 13:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D1D6EC53
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 13:00:25 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id 7so1782069wrz.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 05:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=laLq4w5cBBPgv4Yt32gfnqKz0NPdTJL/WYi+PW4VG4I=;
 b=Jf3SQfjZ+Vruv6zVn3xMRID8s49zUHIxA8JrzzQpkQqs+J1FYEsx92oBuuHP3715Za
 cu8wkOo2wriYktgmnmPwkXg+UpPf+jFloCahD1yngaQ+HGaijQ9dbrQZy3f5z94dY1rh
 Sy33/bnio/p/ZguVID2tjtikxdg2UKaZM+F+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=laLq4w5cBBPgv4Yt32gfnqKz0NPdTJL/WYi+PW4VG4I=;
 b=RT5sqYnKDP3gM5RnuXEfav0LwNOSH4Jb90qyj3cqpoSpE0gYZMHH0TyqupWPyot6Bx
 Z2vHvBpLawOEFPwjDvnMH4nz2qlH6dAQG6E3E7ynEjWuN++5mlX9SrKqwesz6d3bT+Qo
 VoKUnjw4+sxRkTJVOD1Bs6mZG7Be5M+BJyYaWlbOivWIJwHxD2mppBNQaNEGrVJrC9KB
 vn7+4ZwLMrr6iCr8DacWZid/GaEDFzSWAWAXQjJ0xPQdZcRJgs8Ea0wk11p4caeuSx4y
 hvHyz3FJiPvBplSmoMKWh9IR0uMYkkqlIFzfBjYlQtAjWr2F1zwszPy3T2DiwdA5KDgv
 NAsQ==
X-Gm-Message-State: AOAM532x31kT6mYyegHkPS4MEYCbbFKyOa3MV4F7sLsW43YiqKghrw2K
 mBViw0qNePT5eq6NYmhMBQxAOg==
X-Google-Smtp-Source: ABdhPJyD2MEeAgzGiLOT0tix7phgqP5M//DqDonBpa0FIMW1EahQzl21eg/o49kzQFLAqxbcG7M91w==
X-Received: by 2002:a05:6000:1363:: with SMTP id
 q3mr8627832wrz.74.1615467623597; 
 Thu, 11 Mar 2021 05:00:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k11sm3662427wmj.1.2021.03.11.05.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 05:00:22 -0800 (PST)
Date: Thu, 11 Mar 2021 14:00:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <YEoUZe8BtvQdv3TG@phenom.ffwll.local>
References: <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
 <CAKMK7uFUiJyMP0E5JUzMOx=NyMW+ZObGsaFOh409x0LOvGbnzg@mail.gmail.com>
 <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org>
 <CAKMK7uE=8+hj-MUFXHFoG_hAbz_Obi8a99+DE5_d1K+KZaG+tQ@mail.gmail.com>
 <b367b7e8-f202-4d23-d672-a5c9bc7fcec1@shipmail.org>
 <YDyuYk8x5QeX83s6@phenom.ffwll.local>
 <be8f2503-ffcb-eb58-83be-26fa0fc1837a@shipmail.org>
 <648556e6-2d99-950d-c940-706eb5a8f6cc@amd.com>
 <CAKMK7uHOe=LacUkvGC75dyWAt9TRm7ce8vgxasXOXn-6wJTVnA@mail.gmail.com>
 <9d608c61-c64c-dcde-c719-59a970144404@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d608c61-c64c-dcde-c719-59a970144404@shipmail.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 11, 2021 at 11:22:06AM +0100, Thomas Hellstr=F6m (Intel) wrote:
> =

> On 3/1/21 3:09 PM, Daniel Vetter wrote:
> > On Mon, Mar 1, 2021 at 11:17 AM Christian K=F6nig
> > <christian.koenig@amd.com> wrote:
> > > =

> > > =

> > > Am 01.03.21 um 10:21 schrieb Thomas Hellstr=F6m (Intel):
> > > > On 3/1/21 10:05 AM, Daniel Vetter wrote:
> > > > > On Mon, Mar 01, 2021 at 09:39:53AM +0100, Thomas Hellstr=F6m (Int=
el)
> > > > > wrote:
> > > > > > Hi,
> > > > > > =

> > > > > > On 3/1/21 9:28 AM, Daniel Vetter wrote:
> > > > > > > On Sat, Feb 27, 2021 at 9:06 AM Thomas Hellstr=F6m (Intel)
> > > > > > > <thomas_os@shipmail.org> wrote:
> > > > > > > > On 2/26/21 2:28 PM, Daniel Vetter wrote:
> > > > > > > > > So I think it stops gup. But I haven't verified at all. W=
ould be
> > > > > > > > > good
> > > > > > > > > if Christian can check this with some direct io to a buff=
er in
> > > > > > > > > system
> > > > > > > > > memory.
> > > > > > > > Hmm,
> > > > > > > > =

> > > > > > > > Docs (again vm_normal_page() say)
> > > > > > > > =

> > > > > > > >      * VM_MIXEDMAP mappings can likewise contain memory wit=
h or
> > > > > > > > without "struct
> > > > > > > >      * page" backing, however the difference is that _all_ =
pages
> > > > > > > > with a struct
> > > > > > > >      * page (that is, those where pfn_valid is true) are re=
fcounted
> > > > > > > > and
> > > > > > > > considered
> > > > > > > >      * normal pages by the VM. The disadvantage is that pag=
es are
> > > > > > > > refcounted
> > > > > > > >      * (which can be slower and simply not an option for so=
me PFNMAP
> > > > > > > > users). The
> > > > > > > >      * advantage is that we don't have to follow the strict
> > > > > > > > linearity rule of
> > > > > > > >      * PFNMAP mappings in order to support COWable mappings.
> > > > > > > > =

> > > > > > > > but it's true __vm_insert_mixed() ends up in the insert_pfn=
()
> > > > > > > > path, so
> > > > > > > > the above isn't really true, which makes me wonder if and i=
n that
> > > > > > > > case
> > > > > > > > why there could any longer ever be a significant performance
> > > > > > > > difference
> > > > > > > > between MIXEDMAP and PFNMAP.
> > > > > > > Yeah it's definitely confusing. I guess I'll hack up a patch =
and see
> > > > > > > what sticks.
> > > > > > > =

> > > > > > > > BTW regarding the TTM hugeptes, I don't think we ever lande=
d that
> > > > > > > > devmap
> > > > > > > > hack, so they are (for the non-gup case) relying on
> > > > > > > > vma_is_special_huge(). For the gup case, I think the bug is=
 still
> > > > > > > > there.
> > > > > > > Maybe there's another devmap hack, but the ttm_vm_insert func=
tions do
> > > > > > > use PFN_DEV and all that. And I think that stops gup_fast fro=
m trying
> > > > > > > to find the underlying page.
> > > > > > > -Daniel
> > > > > > Hmm perhaps it might, but I don't think so. The fix I tried out=
 was
> > > > > > to set
> > > > > > =

> > > > > > PFN_DEV | PFN_MAP for huge PTEs which causes pfn_devmap() to be
> > > > > > true, and
> > > > > > then
> > > > > > =

> > > > > > follow_devmap_pmd()->get_dev_pagemap() which returns NULL and
> > > > > > gup_fast()
> > > > > > backs off,
> > > > > > =

> > > > > > in the end that would mean setting in stone that "if there is a=
 huge
> > > > > > devmap
> > > > > > page table entry for which we haven't registered any devmap str=
uct
> > > > > > pages
> > > > > > (get_dev_pagemap returns NULL), we should treat that as a "spec=
ial"
> > > > > > huge
> > > > > > page table entry".
> > > > > > =

> > > > > >   From what I can tell, all code calling get_dev_pagemap() alre=
ady
> > > > > > does that,
> > > > > > it's just a question of getting it accepted and formalizing it.
> > > > > Oh I thought that's already how it works, since I didn't spot any=
thing
> > > > > else that would block gup_fast from falling over. I guess really =
would
> > > > > need some testcases to make sure direct i/o (that's the easiest t=
o test)
> > > > > fails like we expect.
> > > > Yeah, IIRC the "| PFN_MAP" is the missing piece for TTM huge ptes.
> > > > Otherwise pmd_devmap() will not return true and since there is no
> > > > pmd_special() things break.
> > > Is that maybe the issue we have seen with amdgpu and huge pages?
> > Yeah, essentially when you have a hugepte inserted by ttm, and it
> > happens to point at system memory, then gup will work on that. And
> > create all kinds of havoc.
> > =

> > > Apart from that I'm lost guys, that devmap and gup stuff is not
> > > something I have a good knowledge of apart from a one mile high view.
> > I'm not really better, hence would be good to do a testcase and see.
> > This should provoke it:
> > - allocate nicely aligned bo in system memory
> > - mmap, again nicely aligned to 2M
> > - do some direct io from a filesystem into that mmap, that should trigg=
er gup
> > - before the gup completes free the mmap and bo so that ttm recycles
> > the pages, which should trip up on the elevated refcount. If you wait
> > until the direct io is completely, then I think nothing bad can be
> > observed.
> > =

> > Ofc if your amdgpu+hugepte issue is something else, then maybe we have
> > another issue.
> > =

> > Also usual caveat: I'm not an mm hacker either, so might be completely =
wrong.
> > -Daniel
> =

> So I did the following quick experiment on vmwgfx, and it turns out that
> with it,
> fast gup never succeeds. Without the "| PFN_MAP", it typically succeeds
> =

> I should probably craft an RFC formalizing this.

Yeah I think that would be good. Maybe even more formalized if we also
switch over to VM_PFNMAP, since afaiui these pte flags here only stop the
fast gup path. And slow gup can still peak through VM_MIXEDMAP. Or
something like that.

Otoh your description of when it only sometimes succeeds would indicate my
understanding of VM_PFNMAP vs VM_MIXEDMAP is wrong here.

Christian, what's your take?
-Daniel

> =

> /Thomas
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 6dc96cf66744..72b6fb17c984 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -195,6 +195,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fau=
lt
> *vmf,
> =A0=A0=A0=A0=A0=A0=A0 pfn_t pfnt;
> =A0=A0=A0=A0=A0=A0=A0 struct ttm_tt *ttm =3D bo->ttm;
> =A0=A0=A0=A0=A0=A0=A0 bool write =3D vmf->flags & FAULT_FLAG_WRITE;
> +=A0=A0=A0=A0=A0=A0 struct dev_pagemap *pagemap;
> =

> =A0=A0=A0=A0=A0=A0=A0 /* Fault should not cross bo boundary. */
> =A0=A0=A0=A0=A0=A0=A0 page_offset &=3D ~(fault_page_size - 1);
> @@ -210,6 +211,17 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fa=
ult
> *vmf,
> =A0=A0=A0=A0=A0=A0=A0 if ((pfn & (fault_page_size - 1)) !=3D 0)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out_fallback;
> =

> +=A0=A0=A0=A0=A0=A0 /*
> +=A0=A0=A0=A0=A0=A0=A0 * Huge entries must be special, that is marking th=
em as devmap
> +=A0=A0=A0=A0=A0=A0=A0 * with no backing device map range. If there is a =
backing
> +=A0=A0=A0=A0=A0=A0=A0 * range, Don't insert a huge entry.
> +=A0=A0=A0=A0=A0=A0=A0 */
> +=A0=A0=A0=A0=A0=A0 pagemap =3D get_dev_pagemap(pfn, NULL);
> +=A0=A0=A0=A0=A0=A0 if (pagemap) {
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 put_dev_pagemap(pagemap);
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out_fallback;
> +=A0=A0=A0=A0=A0=A0 }
> +
> =A0=A0=A0=A0=A0=A0=A0 /* Check that memory is contiguous. */
> =A0=A0=A0=A0=A0=A0=A0 if (!bo->mem.bus.is_iomem) {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 for (i =3D 1; i < fault_pag=
e_size; ++i) {
> @@ -223,7 +235,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fau=
lt
> *vmf,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> =A0=A0=A0=A0=A0=A0=A0 }
> =

> -=A0=A0=A0=A0=A0=A0 pfnt =3D __pfn_to_pfn_t(pfn, PFN_DEV);
> +=A0=A0=A0=A0=A0=A0 pfnt =3D __pfn_to_pfn_t(pfn, PFN_DEV | PFN_MAP);
> =A0=A0=A0=A0=A0=A0=A0 if (fault_page_size =3D=3D (HPAGE_PMD_SIZE >> PAGE_=
SHIFT))
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D vmf_insert_pfn_pmd_=
prot(vmf, pfnt, pgprot, write);
> =A0#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> @@ -236,6 +248,21 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fa=
ult
> *vmf,
> =A0=A0=A0=A0=A0=A0=A0 if (ret !=3D VM_FAULT_NOPAGE)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out_fallback;
> =

> +#if 1
> +=A0=A0=A0=A0=A0=A0 {
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int npages;
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct page *page;
> +
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 npages =3D get_user_pages_fas=
t_only(vmf->address, 1, 0,
> &page);
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (npages =3D=3D 1) {
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DRM_W=
ARN("Fast gup succeeded. Bad.\n");
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 put_p=
age(page);
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 } else {
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DRM_I=
NFO("Fast gup failed. Good.\n");
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> +=A0=A0=A0=A0=A0=A0 }
> +#endif
> +
> =A0=A0=A0=A0=A0=A0=A0 return VM_FAULT_NOPAGE;
> =A0out_fallback:
> =A0=A0=A0=A0=A0=A0=A0 count_vm_event(THP_FAULT_FALLBACK);
> =

> =

> =

> =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
