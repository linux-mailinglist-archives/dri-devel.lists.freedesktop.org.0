Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CBD73E6EF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 19:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A39210E202;
	Mon, 26 Jun 2023 17:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F61F10E202
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 17:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687801960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Wv94JG6aQ6GP1kz8c1TkrJCAi33t9D7NLMkWYyjqIM=;
 b=Q4twhZCplUkf5iyCC9nEYA/YPOBsuSv0A8nrjXqlwB3QyIHuMB+gMlGW+r8jIFFjYGljR3
 Fj4rhMCDoyotQovMHAyOqHalBSBVhzdEQ5Y8E83cAdulCW5iPxiDmIl6SaBoffT9shsDWw
 duoONILWiG5PGxF1JhI/CVCKBz34MWU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-Ft7PNZATMM2lLcxNDRp4DA-1; Mon, 26 Jun 2023 13:52:39 -0400
X-MC-Unique: Ft7PNZATMM2lLcxNDRp4DA-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4009567b05eso3549221cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 10:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687801956; x=1690393956;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Wv94JG6aQ6GP1kz8c1TkrJCAi33t9D7NLMkWYyjqIM=;
 b=BG+gp9fby1Fdvqv/z4n8Btycl2ocqBZpwu5wOvkoz9639SVjD6JwV99qtj7XxFNh02
 R8c8eJ81+c7oT2kEFMjTuosHu2LCaH1nv+Glv4IBguJGy8ScBZW9MQMk2Z7eyGCkoJe6
 xDwPGW4nw7V0b1LMsqGCvNV0BFbXoXA6L6N1txIDfqnix9eXvFE0J7Ne74d8O6GhV6Fo
 xkLtldZotzARRAYxFb02oa+7cDHhPbKDfVglZLoTDf2l/7+evvj+1BxHG6TR2804yzH8
 WavU4iZYPELe3BFEm6NhkmaAMHeJrPoJ0RofwtB5/V027tTlCycfz0QUTeTvxUadXkky
 OIYQ==
X-Gm-Message-State: AC+VfDy7boT/hjtgpOH0/VW20Jw9/Ce/V8F8y0FPO261ENI4DmA1c75u
 gcgQYfoiydFjqUkJ0vVQ5NwRTF8FCacs41u6+RmYW3WbuXuSJFPtASg+pKWv05MW4xHdCLe7oIF
 jSkGUCcHHTNloBgOgx++9pCKK3dEr
X-Received: by 2002:a05:622a:170c:b0:400:8541:1cae with SMTP id
 h12-20020a05622a170c00b0040085411caemr13937378qtk.5.1687801956086; 
 Mon, 26 Jun 2023 10:52:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4LORLmzvExRwkCpi/iITDsOfPTz73t7BF9jk8/78o64pWBB0QDV2wmNjuji4yHQ/adhZ4J0A==
X-Received: by 2002:a05:622a:170c:b0:400:8541:1cae with SMTP id
 h12-20020a05622a170c00b0040085411caemr13937370qtk.5.1687801955762; 
 Mon, 26 Jun 2023 10:52:35 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 cg13-20020a05622a408d00b003f4ed0ca698sm3325403qtb.49.2023.06.26.10.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 10:52:35 -0700 (PDT)
Date: Mon, 26 Jun 2023 13:52:34 -0400
From: Peter Xu <peterx@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Message-ID: <ZJnQYmbjWf5cOeFL@x1n>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
 <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJXJ4ULRKVN5JPyv@x1n>
 <IA0PR11MB718571BA49F71282368D8649F826A@IA0PR11MB7185.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA0PR11MB718571BA49F71282368D8649F826A@IA0PR11MB7185.namprd11.prod.outlook.com>
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
Cc: James Houghton <jthoughton@google.com>,
 Jerome Marchand <jmarchan@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Muchun Song <muchun.song@linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Hocko, Michal" <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 26, 2023 at 07:45:37AM +0000, Kasireddy, Vivek wrote:
> Hi Peter,
> 
> > 
> > On Fri, Jun 23, 2023 at 06:13:02AM +0000, Kasireddy, Vivek wrote:
> > > Hi David,
> > >
> > > > > The first patch ensures that the mappings needed for handling mmap
> > > > > operation would be managed by using the pfn instead of struct page.
> > > > > The second patch restores support for mapping hugetlb pages where
> > > > > subpages of a hugepage are not directly used anymore (main reason
> > > > > for revert) and instead the hugetlb pages and the relevant offsets
> > > > > are used to populate the scatterlist for dma-buf export and for
> > > > > mmap operation.
> > > > >
> > > > > Testcase: default_hugepagesz=2M hugepagesz=2M hugepages=2500
> > > > options
> > > > > were passed to the Host kernel and Qemu was launched with these
> > > > > relevant options: qemu-system-x86_64 -m 4096m....
> > > > > -device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
> > > > > -display gtk,gl=on
> > > > > -object memory-backend-memfd,hugetlb=on,id=mem1,size=4096M
> > > > > -machine memory-backend=mem1
> > > > >
> > > > > Replacing -display gtk,gl=on with -display gtk,gl=off above would
> > > > > exercise the mmap handler.
> > > > >
> > > >
> > > > While I think the VM_PFNMAP approach is much better and should fix
> > that
> > > > issue at hand, I thought more about missing memlock support and
> > realized
> > > > that we might have to fix something else. SO I'm going to raise the
> > > > issue here.
> > > >
> > > > I think udmabuf chose the wrong interface to do what it's doing, that
> > > > makes it harder to fix it eventually.
> > > >
> > > > Instead of accepting a range in a memfd, it should just have accepted a
> > > > user space address range and then used
> > > > pin_user_pages(FOLL_WRITE|FOLL_LONGTERM) to longterm-pin the
> > pages
> > > > "officially".
> > > Udmabuf indeed started off by using user space address range and GUP
> > but
> > > the dma-buf subsystem maintainer had concerns with that approach in v2.
> > > It also had support for mlock in that version. Here is v2 and the relevant
> > > conversation:
> > > https://patchwork.freedesktop.org/patch/210992/?series=39879&rev=2
> > >
> > > >
> > > > So what's the issue? Udma effectively pins pages longterm ("possibly
> > > > forever") simply by grabbing a reference on them. These pages might
> > > > easily reside in ZONE_MOVABLE or in MIGRATE_CMA pageblocks.
> > > >
> > > > So what udmabuf does is break memory hotunplug and CMA, because it
> > > > turns
> > > > pages that have to remain movable unmovable.
> > > >
> > > > In the pin_user_pages(FOLL_LONGTERM) case we make sure to migrate
> > > > these
> > > > pages. See mm/gup.c:check_and_migrate_movable_pages() and
> > especially
> > > > folio_is_longterm_pinnable(). We'd probably have to implement
> > something
> > > > similar for udmabuf, where we detect such unpinnable pages and
> > migrate
> > > > them.
> > > The pages udmabuf pins are only those associated with Guest (GPU
> > driver/virtio-gpu)
> > > resources (or buffers allocated and pinned from shmem via drm GEM).
> > Some
> > > resources are short-lived, and some are long-lived and whenever a
> > resource
> > > gets destroyed, the pages are unpinned. And, not all resources have their
> > pages
> > > pinned. The resource that is pinned for the longest duration is the FB and
> > that's
> > > because it is updated every ~16ms (assuming 1920x1080@60) by the Guest
> > > GPU driver. We can certainly pin/unpin the FB after it is accessed on the
> > Host
> > > as a workaround, but I guess that may not be very efficient given the
> > amount
> > > of churn it would create.
> > >
> > > Also, as far as migration or S3/S4 is concerned, my understanding is that all
> > > the Guest resources are destroyed and recreated again. So, wouldn't
> > something
> > > similar happen during memory hotunplug?
> > >
> > > >
> > > >
> > > > For example, pairing udmabuf with vfio (which pins pages using
> > > > pin_user_pages(FOLL_LONGTERM)) in QEMU will most probably not work
> > in
> > > > all cases: if udmabuf longterm pinned the pages "the wrong way", vfio
> > > > will fail to migrate them during FOLL_LONGTERM and consequently fail
> > > > pin_user_pages(). As long as udmabuf holds a reference on these pages,
> > > > that will never succeed.
> > > Dma-buf rules (for exporters) indicate that the pages only need to be
> > pinned
> > > during the map_attachment phase (and until unmap attachment happens).
> > > In other words, only when the sg_table is created by udmabuf. I guess one
> > > option would be to not hold any references during UDMABUF_CREATE and
> > > only grab references to the pages (as and when it gets used) during this
> > step.
> > > Would this help?
> > 
> > IIUC the refcount is needed, otherwise I don't see what to protect the page
> > from being freed and even reused elsewhere before map_attachment().
> > 
> > It seems the previous concern on using gup was majorly fork(), if this is it:
> > 
> > https://patchwork.freedesktop.org/patch/210992/?series=39879&rev=2#co
> > mment_414213
> > 
> > Could it also be guarded by just making sure the pages are MAP_SHARED
> > when
> > creating the udmabuf, if fork() is a requirement of the feature?
> > 
> > I had a feeling that the userspace still needs to always do the right thing
> > to make it work, even using pure PFN mappings.
> > 
> > For instance, what if the userapp just punchs a hole in the shmem/hugetlbfs
> > file after creating the udmabuf (I see that F_SEAL_SHRINK is required, but
> > at least not F_SEAL_WRITE with current impl), and fault a new page into the
> > page cache?
> IIUC, Qemu creates and owns the memfd that is associated with Guest memory.
> And if it punches a hole in its own memfd that goes through Guest pinned pages 
> associated with buffers/resources, then I think the proper way to fix this is to
> somehow notify the Guest driver (virtio-gpu in this case) that the backing store
> of the affected resources is no longer valid and that the resources need to be
> destroyed and re-created again.
> 
> Having said that, one option I could think of is to probably install a mmu_notifier
> associated with the relevant pages in udmabuf and once we get notified about
> any invalidation event concerning any of the pages, we'd fail any subsequent
> attempt to access these pages and propagate the error across the stack. 

Sounds right, maybe it needs to go back to the old GUP solution, though, as
mmu notifiers are also mm-based not fd-based. Or to be explicit, I think
it'll be pin_user_pages(FOLL_LONGTERM) with the new API.  It'll also solve
the movable pages issue on pinning.

> 
> However, it feels like udmabuf is not the right place to handle this issue because
> there are very limited options for taking proper corrective action if Qemu decides
> to punch a hole in Guest memory that takes out pages that are pinned.

I'm not familiar with the use case that much, but IMHO it's fine if the
driver relies on proper behaviors of userapp to work.

IIUC the worst case here is the udmabuf holds some pages that are not the
pages of the guest mem anymore, but it only happens on misbehaved
userspace, then it looks all fine as long as they can at least be properly
released when releasing the udmabuf.  It'll be better if the udmabuf can
fail hard when detecting this, but IMHO even that can be optional depending
on the need, while any corrective action will be even one step further.

Thanks,

-- 
Peter Xu

