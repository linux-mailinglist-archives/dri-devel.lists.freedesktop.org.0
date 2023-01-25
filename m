Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EEE67BE1A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 22:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4901910E895;
	Wed, 25 Jan 2023 21:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5AC10E102
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 17:00:14 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-501c3a414acso207958877b3.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 09:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L4MXGiF0uBNS4YdEO04YxfSu/PH3d6GEYxinGGkJ0l0=;
 b=W2wM+2B23DX4UFGjrNjz2QhZIRJJ0rJbNeAj16MEZr1nVm+y2drgVLMWhYKM+RXZwl
 LyA9Ln6ru3ELYSr9r7So/z16X90Zls60BXzg/QzJqLOLV/j0Tixqf16TWNyXZGnACB9E
 QkGJl1ScGfsTp7c4ttit0pgHNn4ey7S424sXU9dWBD5cTrLynb/1YBuhhrezEYSZhLSi
 3eb09az3BMlgAYXh3d2+5Q7sC0FqvrC0NX040NYjkqv/h2gdKBNO3YpN4EQOf23xtORi
 NxWfmFe951E1Au7ZDRJqODWALmTWnaVbj7QqRA33jeb/AA79tsFrFPyzpW0c4v2lui2R
 IvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L4MXGiF0uBNS4YdEO04YxfSu/PH3d6GEYxinGGkJ0l0=;
 b=ukQqvX4oUHYKX3e/RCofrrc//ROE4qqeHjNt3ps+zYhbEBchuEVJuE54uz3UTFQqbR
 WSyXOcp/ZUU3echSN8FQqAU7HAODbtnJ9+SXsA/yqsJK6t4WA4K0fPfjDlfjbJQVL4rv
 tb8MUkg+ep/X0CwtwnhuQ4p7koQTC1FR5p2gUf0pIQFtmXjkYIW/gQYFfempsLQie0Mk
 Hco51Qv7VYOYuDwKGuitFd+BrlN+UFVlN+j7iQn2d2g9l53SL2de3j0VYkyjX8B7mKOt
 ffqu2XTkIG/U/v/lfP+ET4mCLLdpIqLvr4sPemxUiXMUHsQX1+ZKNg72M1eUjW+KdKyu
 U1Pg==
X-Gm-Message-State: AFqh2kq2FmWE/ESV3iYh2P+JqNmIGLhb+QHHOllYeUGaowH4OC8CYFF2
 4Nsgs5WDQClGjXyOyw3S+RVrC/fCBtOpwIo6k0ULzw==
X-Google-Smtp-Source: AMrXdXv6WFpwQ2RivVVjLGZIQcqOZe35ABaf7/kGtBR6QRxHke62z7D7Nf0zd78A9HxP1avFtZlnWBmbm7RD5GZUdQA=
X-Received: by 2002:a0d:c0c7:0:b0:502:30d7:5fff with SMTP id
 b190-20020a0dc0c7000000b0050230d75fffmr2052050ywd.347.1674666013171; Wed, 25
 Jan 2023 09:00:13 -0800 (PST)
MIME-Version: 1.0
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-6-surenb@google.com>
 <Y9D5hjcprLI92VKf@dhcp22.suse.cz>
In-Reply-To: <Y9D5hjcprLI92VKf@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 25 Jan 2023 09:00:00 -0800
Message-ID: <CAJuCfpHHPB=VE7Q=hoxVj7GBF18rpSQ-O-5+S3EPxOB5rHOrDg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] mm: introduce mod_vm_flags_nolock and use it in
 untrack_pfn
To: Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 25 Jan 2023 21:21:46 +0000
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
Cc: michel@lespinasse.org, nvdimm@lists.linux.dev, leewalsh@google.com,
 dri-devel@lists.freedesktop.org, perex@perex.cz, jglisse@google.com,
 arjunroy@google.com, m.szyprowski@samsung.com, linux-arch@vger.kernel.org,
 qianweili@huawei.com, linux-samsung-soc@vger.kernel.org,
 aneesh.kumar@linux.ibm.com, chenhuacai@kernel.org, kasan-dev@googlegroups.com,
 linux-acpi@vger.kernel.org, rientjes@google.com,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org, minchan@google.com,
 robert.jarzmik@free.fr, linux-um@lists.infradead.org,
 etnaviv@lists.freedesktop.org, npiggin@gmail.com, alex.williamson@redhat.com,
 viro@zeniv.linux.org.uk, luto@kernel.org, gthelen@google.com,
 tglx@linutronix.de, ldufour@linux.ibm.com, linux-sgx@vger.kernel.org,
 martin.petersen@oracle.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-media@vger.kernel.org,
 freedreno@lists.freedesktop.org, joelaf@google.com, linux-aio@kvack.org,
 linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, david@redhat.com,
 dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org,
 edumazet@google.com, target-devel@vger.kernel.org, punit.agrawal@bytedance.com,
 linux-s390@vger.kernel.org, dave@stgolabs.net, deller@gmx.de, hughd@google.com,
 andrii@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, linux-graphics-maintainer@vmware.com,
 kernel-team@android.com, jayalk@intworks.biz, soheil@google.com,
 selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org, shakeelb@google.com,
 haojian.zhuang@gmail.com, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, tytso@mit.edu, nico@fluxnic.net,
 muchun.song@linux.dev, hjc@rock-chips.com, mcoquelin.stm32@gmail.com,
 tatashin@google.com, mike.kravetz@oracle.com, songliubraving@fb.com,
 jasowang@redhat.com, alsa-devel@alsa-project.org, peterx@redhat.com,
 linux-tegra@vger.kernel.org, kraxel@redhat.com, will@kernel.org,
 dmaengine@vger.kernel.org, bhe@redhat.com, miklos@szeredi.hu,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, willy@infradead.org,
 gurua@google.com, dgilbert@interlog.com, xiang@kernel.org, pabeni@redhat.com,
 jejb@linux.ibm.com, quic_abhinavk@quicinc.com, bp@alien8.de,
 mchehab@kernel.org, linux-ext4@vger.kernel.org, tomba@kernel.org,
 hughlynch@google.com, sre@kernel.org, tfiga@chromium.org,
 linux-xfs@vger.kernel.org, zhangfei.gao@linaro.org, wangzhou1@hisilicon.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 davem@davemloft.net, kvm@vger.kernel.org, mst@redhat.com, peterz@infradead.org,
 bigeasy@linutronix.de, alexandre.torgue@foss.st.com, dhowells@redhat.com,
 linux-mm@kvack.org, ray.huang@amd.com, adilger.kernel@dilger.ca,
 kuba@kernel.org, sparclinux@vger.kernel.org, anton.ivanov@cambridgegreys.com,
 herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, richard@nod.at,
 x86@kernel.org, vkoul@kernel.org, mingo@redhat.com, axelrasmussen@google.com,
 intel-gfx@lists.freedesktop.org, paulmck@kernel.org, jannh@google.com,
 chao@kernel.org, liam.howlett@oracle.com, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, vbabka@suse.cz,
 dimitri.sivanich@hpe.com, amd-gfx@lists.freedesktop.org, posk@google.com,
 lstoakes@gmail.com, peterjung1337@gmail.com, yoshfuji@linux-ipv6.org,
 linuxppc-dev@lists.ozlabs.org, dsahern@kernel.org, kent.overstreet@linux.dev,
 kexec@lists.infradead.org, tiwai@suse.com, krzysztof.kozlowski@linaro.org,
 tzimmermann@suse.de, hannes@cmpxchg.org, dmitry.baryshkov@linaro.org,
 johannes@sipsolutions.net, mgorman@techsingularity.net,
 linux-accelerators@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 1:42 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Wed 25-01-23 00:38:50, Suren Baghdasaryan wrote:
> > In cases when VMA flags are modified after VMA was isolated and mmap_lock
> > was downgraded, flags modifications would result in an assertion because
> > mmap write lock is not held.
> > Introduce mod_vm_flags_nolock to be used in such situation.
> > Pass a hint to untrack_pfn to conditionally use mod_vm_flags_nolock for
> > flags modification and to avoid assertion.
>
> The changelog nor the documentation of mod_vm_flags_nolock
> really explain when it is safe to use it. This is really important for
> future potential users.

True. I'll add clarification in the comments and in the changelog. Thanks!

>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  arch/x86/mm/pat/memtype.c | 10 +++++++---
> >  include/linux/mm.h        | 12 +++++++++---
> >  include/linux/pgtable.h   |  5 +++--
> >  mm/memory.c               | 13 +++++++------
> >  mm/memremap.c             |  4 ++--
> >  mm/mmap.c                 | 16 ++++++++++------
> >  6 files changed, 38 insertions(+), 22 deletions(-)
> >
> > diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> > index ae9645c900fa..d8adc0b42cf2 100644
> > --- a/arch/x86/mm/pat/memtype.c
> > +++ b/arch/x86/mm/pat/memtype.c
> > @@ -1046,7 +1046,7 @@ void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot, pfn_t pfn)
> >   * can be for the entire vma (in which case pfn, size are zero).
> >   */
> >  void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
> > -              unsigned long size)
> > +              unsigned long size, bool mm_wr_locked)
> >  {
> >       resource_size_t paddr;
> >       unsigned long prot;
> > @@ -1065,8 +1065,12 @@ void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
> >               size = vma->vm_end - vma->vm_start;
> >       }
> >       free_pfn_range(paddr, size);
> > -     if (vma)
> > -             clear_vm_flags(vma, VM_PAT);
> > +     if (vma) {
> > +             if (mm_wr_locked)
> > +                     clear_vm_flags(vma, VM_PAT);
> > +             else
> > +                     mod_vm_flags_nolock(vma, 0, VM_PAT);
> > +     }
> >  }
> >
> >  /*
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 55335edd1373..48d49930c411 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -656,12 +656,18 @@ static inline void clear_vm_flags(struct vm_area_struct *vma,
> >       vma->vm_flags &= ~flags;
> >  }
> >
> > +static inline void mod_vm_flags_nolock(struct vm_area_struct *vma,
> > +                                    unsigned long set, unsigned long clear)
> > +{
> > +     vma->vm_flags |= set;
> > +     vma->vm_flags &= ~clear;
> > +}
> > +
> >  static inline void mod_vm_flags(struct vm_area_struct *vma,
> >                               unsigned long set, unsigned long clear)
> >  {
> >       mmap_assert_write_locked(vma->vm_mm);
> > -     vma->vm_flags |= set;
> > -     vma->vm_flags &= ~clear;
> > +     mod_vm_flags_nolock(vma, set, clear);
> >  }
> >
> >  static inline void vma_set_anonymous(struct vm_area_struct *vma)
> > @@ -2087,7 +2093,7 @@ static inline void zap_vma_pages(struct vm_area_struct *vma)
> >  }
> >  void unmap_vmas(struct mmu_gather *tlb, struct maple_tree *mt,
> >               struct vm_area_struct *start_vma, unsigned long start,
> > -             unsigned long end);
> > +             unsigned long end, bool mm_wr_locked);
> >
> >  struct mmu_notifier_range;
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 5fd45454c073..c63cd44777ec 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -1185,7 +1185,8 @@ static inline int track_pfn_copy(struct vm_area_struct *vma)
> >   * can be for the entire vma (in which case pfn, size are zero).
> >   */
> >  static inline void untrack_pfn(struct vm_area_struct *vma,
> > -                            unsigned long pfn, unsigned long size)
> > +                            unsigned long pfn, unsigned long size,
> > +                            bool mm_wr_locked)
> >  {
> >  }
> >
> > @@ -1203,7 +1204,7 @@ extern void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
> >                            pfn_t pfn);
> >  extern int track_pfn_copy(struct vm_area_struct *vma);
> >  extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
> > -                     unsigned long size);
> > +                     unsigned long size, bool mm_wr_locked);
> >  extern void untrack_pfn_moved(struct vm_area_struct *vma);
> >  #endif
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index d6902065e558..5b11b50e2c4a 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -1613,7 +1613,7 @@ void unmap_page_range(struct mmu_gather *tlb,
> >  static void unmap_single_vma(struct mmu_gather *tlb,
> >               struct vm_area_struct *vma, unsigned long start_addr,
> >               unsigned long end_addr,
> > -             struct zap_details *details)
> > +             struct zap_details *details, bool mm_wr_locked)
> >  {
> >       unsigned long start = max(vma->vm_start, start_addr);
> >       unsigned long end;
> > @@ -1628,7 +1628,7 @@ static void unmap_single_vma(struct mmu_gather *tlb,
> >               uprobe_munmap(vma, start, end);
> >
> >       if (unlikely(vma->vm_flags & VM_PFNMAP))
> > -             untrack_pfn(vma, 0, 0);
> > +             untrack_pfn(vma, 0, 0, mm_wr_locked);
> >
> >       if (start != end) {
> >               if (unlikely(is_vm_hugetlb_page(vma))) {
> > @@ -1675,7 +1675,7 @@ static void unmap_single_vma(struct mmu_gather *tlb,
> >   */
> >  void unmap_vmas(struct mmu_gather *tlb, struct maple_tree *mt,
> >               struct vm_area_struct *vma, unsigned long start_addr,
> > -             unsigned long end_addr)
> > +             unsigned long end_addr, bool mm_wr_locked)
> >  {
> >       struct mmu_notifier_range range;
> >       struct zap_details details = {
> > @@ -1689,7 +1689,8 @@ void unmap_vmas(struct mmu_gather *tlb, struct maple_tree *mt,
> >                               start_addr, end_addr);
> >       mmu_notifier_invalidate_range_start(&range);
> >       do {
> > -             unmap_single_vma(tlb, vma, start_addr, end_addr, &details);
> > +             unmap_single_vma(tlb, vma, start_addr, end_addr, &details,
> > +                              mm_wr_locked);
> >       } while ((vma = mas_find(&mas, end_addr - 1)) != NULL);
> >       mmu_notifier_invalidate_range_end(&range);
> >  }
> > @@ -1723,7 +1724,7 @@ void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> >        * unmap 'address-end' not 'range.start-range.end' as range
> >        * could have been expanded for hugetlb pmd sharing.
> >        */
> > -     unmap_single_vma(&tlb, vma, address, end, details);
> > +     unmap_single_vma(&tlb, vma, address, end, details, false);
> >       mmu_notifier_invalidate_range_end(&range);
> >       tlb_finish_mmu(&tlb);
> >  }
> > @@ -2492,7 +2493,7 @@ int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
> >
> >       err = remap_pfn_range_notrack(vma, addr, pfn, size, prot);
> >       if (err)
> > -             untrack_pfn(vma, pfn, PAGE_ALIGN(size));
> > +             untrack_pfn(vma, pfn, PAGE_ALIGN(size), true);
> >       return err;
> >  }
> >  EXPORT_SYMBOL(remap_pfn_range);
> > diff --git a/mm/memremap.c b/mm/memremap.c
> > index 08cbf54fe037..2f88f43d4a01 100644
> > --- a/mm/memremap.c
> > +++ b/mm/memremap.c
> > @@ -129,7 +129,7 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
> >       }
> >       mem_hotplug_done();
> >
> > -     untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range));
> > +     untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
> >       pgmap_array_delete(range);
> >  }
> >
> > @@ -276,7 +276,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
> >       if (!is_private)
> >               kasan_remove_zero_shadow(__va(range->start), range_len(range));
> >  err_kasan:
> > -     untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range));
> > +     untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
> >  err_pfn_remap:
> >       pgmap_array_delete(range);
> >       return error;
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 2c6e9072e6a8..69d440997648 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -78,7 +78,7 @@ core_param(ignore_rlimit_data, ignore_rlimit_data, bool, 0644);
> >  static void unmap_region(struct mm_struct *mm, struct maple_tree *mt,
> >               struct vm_area_struct *vma, struct vm_area_struct *prev,
> >               struct vm_area_struct *next, unsigned long start,
> > -             unsigned long end);
> > +             unsigned long end, bool mm_wr_locked);
> >
> >  static pgprot_t vm_pgprot_modify(pgprot_t oldprot, unsigned long vm_flags)
> >  {
> > @@ -2136,14 +2136,14 @@ static inline void remove_mt(struct mm_struct *mm, struct ma_state *mas)
> >  static void unmap_region(struct mm_struct *mm, struct maple_tree *mt,
> >               struct vm_area_struct *vma, struct vm_area_struct *prev,
> >               struct vm_area_struct *next,
> > -             unsigned long start, unsigned long end)
> > +             unsigned long start, unsigned long end, bool mm_wr_locked)
> >  {
> >       struct mmu_gather tlb;
> >
> >       lru_add_drain();
> >       tlb_gather_mmu(&tlb, mm);
> >       update_hiwater_rss(mm);
> > -     unmap_vmas(&tlb, mt, vma, start, end);
> > +     unmap_vmas(&tlb, mt, vma, start, end, mm_wr_locked);
> >       free_pgtables(&tlb, mt, vma, prev ? prev->vm_end : FIRST_USER_ADDRESS,
> >                                next ? next->vm_start : USER_PGTABLES_CEILING);
> >       tlb_finish_mmu(&tlb);
> > @@ -2391,7 +2391,11 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >                       mmap_write_downgrade(mm);
> >       }
> >
> > -     unmap_region(mm, &mt_detach, vma, prev, next, start, end);
> > +     /*
> > +      * We can free page tables without write-locking mmap_lock because VMAs
> > +      * were isolated before we downgraded mmap_lock.
> > +      */
> > +     unmap_region(mm, &mt_detach, vma, prev, next, start, end, !downgrade);
> >       /* Statistics and freeing VMAs */
> >       mas_set(&mas_detach, start);
> >       remove_mt(mm, &mas_detach);
> > @@ -2704,7 +2708,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
> >
> >               /* Undo any partial mapping done by a device driver. */
> >               unmap_region(mm, &mm->mm_mt, vma, prev, next, vma->vm_start,
> > -                          vma->vm_end);
> > +                          vma->vm_end, true);
> >       }
> >       if (file && (vm_flags & VM_SHARED))
> >               mapping_unmap_writable(file->f_mapping);
> > @@ -3031,7 +3035,7 @@ void exit_mmap(struct mm_struct *mm)
> >       tlb_gather_mmu_fullmm(&tlb, mm);
> >       /* update_hiwater_rss(mm) here? but nobody should be looking */
> >       /* Use ULONG_MAX here to ensure all VMAs in the mm are unmapped */
> > -     unmap_vmas(&tlb, &mm->mm_mt, vma, 0, ULONG_MAX);
> > +     unmap_vmas(&tlb, &mm->mm_mt, vma, 0, ULONG_MAX, false);
> >       mmap_read_unlock(mm);
> >
> >       /*
> > --
> > 2.39.1
>
> --
> Michal Hocko
> SUSE Labs
