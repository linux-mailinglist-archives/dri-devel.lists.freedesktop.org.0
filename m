Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A1B73BCA8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 18:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8F710E675;
	Fri, 23 Jun 2023 16:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CCA10E675
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687538149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GtfnmDQrMWsv5Kv1rNTjvgLNiyDvetKnkxLSfe/rbwI=;
 b=DfIIR9WSRtorhBd83H93XFBW7m63o47vvNnSHV8j3Mgk9xhmZ7Db3fNOAMbTUi1J4pxDtf
 6Glc//B6mUz/uB+t8nSKtDUEOiGNidbbyPOx65s0XLpMX9ypOMi2pwawBiapn+G0wNteA0
 OiSwvtahpE/ktrqUAc0A0lH3TNRZHCo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-i4f9RdToN_-oPxQLh10-jQ-1; Fri, 23 Jun 2023 12:35:47 -0400
X-MC-Unique: i4f9RdToN_-oPxQLh10-jQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3ff1fec3500so1686351cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 09:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687538147; x=1690130147;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GtfnmDQrMWsv5Kv1rNTjvgLNiyDvetKnkxLSfe/rbwI=;
 b=R1bqsb25GKPHiQvG7QGgIZoplK+mrv7jT7NfuvTASXmE1MI5qhG4rYtoKbNLgXDUgo
 Md4lHjnoKahvm3i2pJs5fjdaulTEw1da9/KbHblFFU0EK9dry6E1+s5NPQqebdwUuV2Q
 j97n/k1A5PmVvfKqdMyxEE6LZZv4UFkWedidK5vIDWSvtX/wK99w0xYoZV5l+7SugpEr
 Ux+q9IyJtDixszyM9kGTKfTWbPl6BLyAREuyljtKD7ESlltCf7GW6V958HHImsLQLXQW
 Uvmreak1/tox6fcVLnGcGhEebCcv2HmvY334IABW7xwQJKIh5HY1Z6ahg1aeGd8+PyHo
 8erg==
X-Gm-Message-State: AC+VfDxGG2/w3maZm0ai7PXYTjcyGq3XEZ7KHJ2fCsMpQeCOi/kL6suJ
 RWAKRD+aWRFzdiJOsCXwd9I9Io4Y4BdYAwndQMXStAhmSdoU/kQmuvYBQZc+5eaKimuRG+4xMGW
 +QqCKXrw0RAm1RhWcft7pEcobCIoF
X-Received: by 2002:a05:622a:1a20:b0:400:8036:6f05 with SMTP id
 f32-20020a05622a1a2000b0040080366f05mr5683437qtb.2.1687538147079; 
 Fri, 23 Jun 2023 09:35:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5DjQPmEKIJ8oJyPsEjwZviyJdCjcATb54MenUsXY2Hc/ayfGWYxfzoq6G9FTUvC6VgSzJsKQ==
X-Received: by 2002:a05:622a:1a20:b0:400:8036:6f05 with SMTP id
 f32-20020a05622a1a2000b0040080366f05mr5683408qtb.2.1687538146773; 
 Fri, 23 Jun 2023 09:35:46 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 g27-20020ac8775b000000b003f9ad6acba4sm5012927qtu.79.2023.06.23.09.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 09:35:46 -0700 (PDT)
Date: Fri, 23 Jun 2023 12:35:45 -0400
From: Peter Xu <peterx@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Message-ID: <ZJXJ4ULRKVN5JPyv@x1n>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
 <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
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

On Fri, Jun 23, 2023 at 06:13:02AM +0000, Kasireddy, Vivek wrote:
> Hi David,
> 
> > > The first patch ensures that the mappings needed for handling mmap
> > > operation would be managed by using the pfn instead of struct page.
> > > The second patch restores support for mapping hugetlb pages where
> > > subpages of a hugepage are not directly used anymore (main reason
> > > for revert) and instead the hugetlb pages and the relevant offsets
> > > are used to populate the scatterlist for dma-buf export and for
> > > mmap operation.
> > >
> > > Testcase: default_hugepagesz=2M hugepagesz=2M hugepages=2500
> > options
> > > were passed to the Host kernel and Qemu was launched with these
> > > relevant options: qemu-system-x86_64 -m 4096m....
> > > -device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
> > > -display gtk,gl=on
> > > -object memory-backend-memfd,hugetlb=on,id=mem1,size=4096M
> > > -machine memory-backend=mem1
> > >
> > > Replacing -display gtk,gl=on with -display gtk,gl=off above would
> > > exercise the mmap handler.
> > >
> > 
> > While I think the VM_PFNMAP approach is much better and should fix that
> > issue at hand, I thought more about missing memlock support and realized
> > that we might have to fix something else. SO I'm going to raise the
> > issue here.
> > 
> > I think udmabuf chose the wrong interface to do what it's doing, that
> > makes it harder to fix it eventually.
> > 
> > Instead of accepting a range in a memfd, it should just have accepted a
> > user space address range and then used
> > pin_user_pages(FOLL_WRITE|FOLL_LONGTERM) to longterm-pin the pages
> > "officially".
> Udmabuf indeed started off by using user space address range and GUP but
> the dma-buf subsystem maintainer had concerns with that approach in v2.
> It also had support for mlock in that version. Here is v2 and the relevant
> conversation:
> https://patchwork.freedesktop.org/patch/210992/?series=39879&rev=2
> 
> > 
> > So what's the issue? Udma effectively pins pages longterm ("possibly
> > forever") simply by grabbing a reference on them. These pages might
> > easily reside in ZONE_MOVABLE or in MIGRATE_CMA pageblocks.
> > 
> > So what udmabuf does is break memory hotunplug and CMA, because it
> > turns
> > pages that have to remain movable unmovable.
> > 
> > In the pin_user_pages(FOLL_LONGTERM) case we make sure to migrate
> > these
> > pages. See mm/gup.c:check_and_migrate_movable_pages() and especially
> > folio_is_longterm_pinnable(). We'd probably have to implement something
> > similar for udmabuf, where we detect such unpinnable pages and migrate
> > them.
> The pages udmabuf pins are only those associated with Guest (GPU driver/virtio-gpu)
> resources (or buffers allocated and pinned from shmem via drm GEM). Some
> resources are short-lived, and some are long-lived and whenever a resource
> gets destroyed, the pages are unpinned. And, not all resources have their pages
> pinned. The resource that is pinned for the longest duration is the FB and that's
> because it is updated every ~16ms (assuming 1920x1080@60) by the Guest
> GPU driver. We can certainly pin/unpin the FB after it is accessed on the Host
> as a workaround, but I guess that may not be very efficient given the amount
> of churn it would create.
> 
> Also, as far as migration or S3/S4 is concerned, my understanding is that all
> the Guest resources are destroyed and recreated again. So, wouldn't something
> similar happen during memory hotunplug?
> 
> > 
> > 
> > For example, pairing udmabuf with vfio (which pins pages using
> > pin_user_pages(FOLL_LONGTERM)) in QEMU will most probably not work in
> > all cases: if udmabuf longterm pinned the pages "the wrong way", vfio
> > will fail to migrate them during FOLL_LONGTERM and consequently fail
> > pin_user_pages(). As long as udmabuf holds a reference on these pages,
> > that will never succeed.
> Dma-buf rules (for exporters) indicate that the pages only need to be pinned
> during the map_attachment phase (and until unmap attachment happens).
> In other words, only when the sg_table is created by udmabuf. I guess one
> option would be to not hold any references during UDMABUF_CREATE and
> only grab references to the pages (as and when it gets used) during this step.
> Would this help?

IIUC the refcount is needed, otherwise I don't see what to protect the page
from being freed and even reused elsewhere before map_attachment().

It seems the previous concern on using gup was majorly fork(), if this is it:

https://patchwork.freedesktop.org/patch/210992/?series=39879&rev=2#comment_414213

Could it also be guarded by just making sure the pages are MAP_SHARED when
creating the udmabuf, if fork() is a requirement of the feature?

I had a feeling that the userspace still needs to always do the right thing
to make it work, even using pure PFN mappings.

For instance, what if the userapp just punchs a hole in the shmem/hugetlbfs
file after creating the udmabuf (I see that F_SEAL_SHRINK is required, but
at least not F_SEAL_WRITE with current impl), and fault a new page into the
page cache?

Thanks,

> 
> > 
> > 
> > There are *probably* more issues on the QEMU side when udmabuf is
> > paired
> > with things like MADV_DONTNEED/FALLOC_FL_PUNCH_HOLE used for
> > virtio-balloon, virtio-mem, postcopy live migration, ... for example, in
> > the vfio/vdpa case we make sure that we disallow most of these, because
> > otherwise there can be an accidental "disconnect" between the pages
> > mapped into the VM (guest view) and the pages mapped into the IOMMU
> > (device view), for example, after a reboot.
> Ok; I am not sure if I can figure out if there is any acceptable way to address
> these issues but given the current constraints associated with udmabuf, what
> do you suggest is the most reasonable way to deal with these problems you
> have identified?
> 
> Thanks,
> Vivek
> 
> > 
> > --
> > Cheers,
> > 
> > David / dhildenb
> 

-- 
Peter Xu

