Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF67769E31
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 19:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DC310E2D3;
	Mon, 31 Jul 2023 17:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B4310E2D3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 17:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690823141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hXMQG488vI3cMLUaEwnC+ridVhu6Q8Hoz+AOs04ufnA=;
 b=CqaqrkSasjLeCykVrdWHHJG6v4v9v+V3l4q2fFQDjLhJMDZY0tfKPaFofgUf61wDfcV8h4
 heCTho7rZv4zXmlkKb1uc+czrvdel951U6NhvAFFYvQ6zGPjeUo1eGc9cTEMZRIDz1Ub5m
 HCf7jPu8M7Bg1mTCVV2bAcGFbvXRtW8=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-cEHI5hs2Nbumh1RLHJDq1g-1; Mon, 31 Jul 2023 13:05:38 -0400
X-MC-Unique: cEHI5hs2Nbumh1RLHJDq1g-1
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-79a1de8b323so121047241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 10:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690823138; x=1691427938;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hXMQG488vI3cMLUaEwnC+ridVhu6Q8Hoz+AOs04ufnA=;
 b=L19AxCAAHWrHnLivVCxkSSHbG3FH9dkbG4ov8qtvcXrVyFuGqwPnMd56Pb0iB8ulSr
 t9JWDtQ2TadRODPBm9w8GsyD32NautGEmZrrhe9MNMDGHdfh94jrqBBRpTeBeUPuP+4f
 RgUHC7EmxQe47kXKNEKIJbigWsMdhGmo+NRnFjB96sfVBDaeCjCTjNNpYCvTVySqRRu5
 RusngDPOfdKxRzpvfVB7c7m57fEBmJwUSBnKrElcO22euP10QRPj82p7i5+pjbjV9J3n
 hisgXSjmCnxMM/gPlqJZixYcefjflLZopdoGm7H9M/EHewgcyOcqKTkh4KKg/3JDrqb5
 d/PQ==
X-Gm-Message-State: ABy/qLYAnUMjV/mmOg1R2rXdNyvYxrbUzBIFT87qzhoBhWEa09e+t97E
 Jaq3fnJTS54t5Tf0LB8JKdRw8Mr2Sz0vpZ2ZQJeMp6OaLJO2IWCP2vJ2vhFv3EF5rV6DnpLSwC0
 x/ECmWNVrpNkzd5v6F+CdWsCOrpci
X-Received: by 2002:a05:6102:290b:b0:443:603c:8a8 with SMTP id
 cz11-20020a056102290b00b00443603c08a8mr2446494vsb.2.1690823137688; 
 Mon, 31 Jul 2023 10:05:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHNu6k+GxcYvTzEhfFyVUaebTVIrrRCnh3B/231hWdmMO9P1Pj68706EVlFSPTz7DGSEvHDfA==
X-Received: by 2002:a05:6102:290b:b0:443:603c:8a8 with SMTP id
 cz11-20020a056102290b00b00443603c08a8mr2446469vsb.2.1690823137344; 
 Mon, 31 Jul 2023 10:05:37 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 g9-20020ae9e109000000b00767b24f68edsm3428728qkm.62.2023.07.31.10.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:05:37 -0700 (PDT)
Date: Mon, 31 Jul 2023 13:05:34 -0400
From: Peter Xu <peterx@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZMfp3q/9osOV4wFO@x1n>
References: <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <75e3a74a-68f5-df-9a49-a0553c04320@google.com>
 <CH3PR11MB71777432A63D3FAAE7E70F22F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMLk8aMmpkK7ZCsW@x1n>
 <CH3PR11MB7177832A92B4F550BF816E0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CH3PR11MB7177832A92B4F550BF816E0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 29, 2023 at 12:08:25AM +0000, Kasireddy, Vivek wrote:
> Hi Peter,
> 
> > > > > > > > I'm not at all familiar with the udmabuf use case but that sounds
> > > > > > > > brittle and effectively makes this notifier udmabuf specific right?
> > > > > > > Oh, Qemu uses the udmabuf driver to provide Host Graphics
> > > > components
> > > > > > > (such as Spice, Gstreamer, UI, etc) zero-copy access to Guest created
> > > > > > > buffers. In other words, from a core mm standpoint, udmabuf just
> > > > > > > collects a bunch of pages (associated with buffers) scattered inside
> > > > > > > the memfd (Guest ram backed by shmem or hugetlbfs) and wraps
> > > > > > > them in a dmabuf fd. And, since we provide zero-copy access, we
> > > > > > > use DMA fences to ensure that the components on the Host and
> > > > > > > Guest do not access the buffer simultaneously.
> > > > > >
> > > > > > So why do you need to track updates proactively like this?
> > > > > As David noted in the earlier series, if Qemu punches a hole in its
> > memfd
> > > > > that goes through pages that are registered against a udmabuf fd, then
> > > > > udmabuf needs to update its list with new pages when the hole gets
> > > > > filled after (guest) writes. Otherwise, we'd run into the coherency
> > > > > problem (between udmabuf and memfd) as demonstrated in the
> > selftest
> > > > > (patch #3 in this series).
> > > >
> > > > Wouldn't this all be very much better if Qemu stopped punching holes
> > there?
> > > I think holes can be punched anywhere in the memfd for various reasons.
> > Some
> > 
> > I just start to read this thread, even haven't finished all of them.. but
> > so far I'm not sure whether this is right at all..
> > 
> > udmabuf is a file, it means it should follow the file semantics. Mmu
> Right, it is a file but a special type of file given that it is a dmabuf. So, AFAIK,
> operations such as truncate, FALLOC_FL_PUNCH_HOLE, etc cannot be done
> on it. And, in our use-case, since udmabuf driver is sharing (or exporting) its
> buffer (via the fd), consumers (or importers) of the dmabuf fd are expected
> to only read from it.
> 
> > notifier is per-mm, otoh.
> > 
> > Imagine for some reason QEMU mapped the guest pages twice, udmabuf is
> > created with vma1, so udmabuf registers the mm changes over vma1 only.
> Udmabufs are created with pages obtained from the mapping using offsets
> provided by Qemu. 
> 
> > 
> > However the shmem/hugetlb page cache can be populated in either vma1, or
> > vma2.  It means when populating on vma2 udmabuf won't get update notify
> > at
> > all, udmabuf pages can still be obsolete.  Same thing to when multi-process
> In this (unlikely) scenario you described above,

IMHO it's very legal for qemu to do that, we won't want this to break so
easily and silently simply because qemu mapped it twice.  I would hope
it'll not be myself to debug something like that. :)

I actually personally have a tree that does exactly that:

https://github.com/xzpeter/qemu/commit/62050626d6e511d022953165cc0f604bf90c5324

But that's definitely not in main line.. it shouldn't need special
attention, either.  Just want to say that it can always happen for various
reasons especially in an relatively involved software piece like QEMU.

> I think we could still find all the
> VMAs (and ranges) where the guest buffer pages are mapped (and register
> for PTE updates) using Qemu's mm_struct. The below code can be modified
> to create a list of VMAs where the guest buffer pages are mapped.
> static struct vm_area_struct *find_guest_ram_vma(struct udmabuf *ubuf,
>                                                  struct mm_struct *vmm_mm)
> {
>         struct vm_area_struct *vma = NULL;
>         MA_STATE(mas, &vmm_mm->mm_mt, 0, 0);
>         unsigned long addr;
>         pgoff_t pg;
> 
>         mas_set(&mas, 0);
>         mmap_read_lock(vmm_mm);
>         mas_for_each(&mas, vma, ULONG_MAX) {
>                 for (pg = 0; pg < ubuf->pagecount; pg++) {
>                         addr = page_address_in_vma(ubuf->pages[pg], vma);
>                         if (addr == -EFAULT)
>                                 break;
>                 }
>                 if (addr != -EFAULT)
>                         break;
>         }
>         mmap_read_unlock(vmm_mm);
> 
>         return vma;
> }

This is hackish to me, and not working when across mm (multi-proc qemu).

> 
> > QEMU is used, where we can have vma1 in QEMU while vma2 in the other
> > process like vhost-user.
> > 
> > I think the trick here is we tried to "hide" the fact that these are
> > actually normal file pages, but we're doing PFNMAP on them... then we want
> > the file features back, like hole punching..
> > 
> > If we used normal file operations, everything will just work fine; TRUNCATE
> > will unmap the host mapped frame buffers when needed, and when
> > accessed
> > it'll fault on demand from the page cache.  We seem to be trying to
> > reinvent "truncation" for pfnmap but mmu notifier doesn't sound right to
> > this at least..
> If we can figure out the VMA ranges where the guest buffer pages are mapped,
> we should be able to register mmu notifiers for those ranges right?

In general, sorry to say that, but, mmu notifiers still do not sound like
the right approach here.

> 
> > 
> > > of the use-cases where this would be done were identified by David. Here
> > is what
> > > he said in an earlier discussion:
> > > "There are *probably* more issues on the QEMU side when udmabuf is
> > paired
> > > with things like MADV_DONTNEED/FALLOC_FL_PUNCH_HOLE used for
> > > virtio-balloon, virtio-mem, postcopy live migration, ... for example, in"
> > 
> > Now after seething this, I'm truly wondering whether we can still simply
> > use the file semantics we already have (for either shmem/hugetlb/...), or
> > is it a must we need to use a single fd to represent all?
> > 
> > Say, can we just use a tuple (fd, page_array) rather than the udmabuf
> > itself to do host zero-copy mapping?  the page_array can be e.g. a list of
> That (tuple) is essentially what we are doing (with udmabuf) but in a
> standardized way that follows convention using the dmabuf buffer sharing
> framework that all the importers (other drivers and userspace components)
> know and understand.
> 
> > file offsets that points to the pages (rather than pinning the pages using
> If we are using the dmabuf framework, the pages must be pinned when the
> importers map them.

Oh so the pages are for DMAs from hardwares, rather than accessed by the
host programs?

I really have merely zero knowledge from that aspect, sorry.  If so I don't
know how truncation can work with that, while keeping the page coherent.

Hugh asked why not QEMU just doesn't do that truncation, I'll then ask the
same.  Probably virtio-mem will not be able to work. I think postcopy will
not be affected - postcopy only drops pages at very early stage of dest
QEMU, not after VM started there, so either not affected or maybe there's
chance it'll work.

IIUC it's then the same as VFIO attached then we try to blow some pages
away from anything like virtio-balloon - AFAIR qemu just explicitly don't
allow that to happen.  See vfio_ram_block_discard_disable().

> 
> > FOLL_GET).  The good thing is then the fd can be the guest memory file
> > itself.  With that, we can mmap() over the shmem/hugetlb in whatever vma
> > and whatever process.  Truncation (and actually everything... e.g. page
> > migration, swapping, ... which will be disabled if we use PFNMAP pins) will
> > just all start to work, afaiu.
> IIUC, we'd not be able to use the fd of the guest memory file because the
> dmabuf fds are expected to have constant size that reflects the size of the
> buffer that is being shared. I just don't think it'd be feasible given all the
> other restrictions:
> https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html?highlight=dma_buf#userspace-interface-notes

Yeah I also don't know well on the dmabuf APIs, but I think if the page
must be pinned for real world DMA then it's already another story to me..
what I said on the [guest_mem_fd, offset_array] tuple idea could only (if
still possible..) work if the udmabuf access is only from the processor
side, never from the device.

Thanks,

-- 
Peter Xu

