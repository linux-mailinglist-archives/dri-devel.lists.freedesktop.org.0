Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CD2773D63
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 18:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D88910E1AA;
	Tue,  8 Aug 2023 16:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD9D10E1AA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 16:17:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3177675d6dfso749325f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Aug 2023 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1691511442; x=1692116242;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xVnuqY1pi/3wEwJ5zen4asyUB1kEiQwuQ5lKJazadzM=;
 b=KVgQDsCihSbJCDqVjOK7Y+bZEVuxVm0T/t2qQhrqJXgMXcGdAGin1Le1UG7hek9mJL
 NdT5UISXEICDjiStuGuwufUp4x6UZUSKFh1CoHT4TAviZiP8EJymQXzpQvGImc9mVGra
 KFTlQdIB0C/rDuDZpNCkLWtndCIWFEmngz3Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691511442; x=1692116242;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xVnuqY1pi/3wEwJ5zen4asyUB1kEiQwuQ5lKJazadzM=;
 b=f88iA0OF6DO2zbh6z0VlZuPaelneshIOi88ZDlkzhWHxE14/Ee1u1RjRnqUb3K0J1W
 AlstBumxjU6lP7uj3lLcVEUkNgRKB5uf5Pj6p4iAZwRP7nmOFMrhqeSD9f4G8l1OCAnS
 pCSnfMCCaHz8osIxPaNSYoPRNiwujwrV+R0C+XQ2KffvCJEFB2skqrEuEks/CwRchLIV
 s8rUbkvWQjy26K4iZalLgOsv6rjvo2Kr9mmfLKrvxyY8L3q3U+Lq2tVxQ87W0aLR5io3
 Y61mYtWxXhwPo0wCsuIRQ/tspq0YvU6IiVX0WDWAXXp8OFUGbB4/T4WD4qJO0Blzt8Gg
 H5lg==
X-Gm-Message-State: ABy/qLZVe4l3P6g2VInBCE5PfNIN04hVwbGN/1Huh8ugiaH7V8LE2/iu
 6d6+fn4nY6Dh0MCxYeJJrjxt0/ky/3MrU+K+EGw=
X-Google-Smtp-Source: APBJJlG10QPLrt9DvmMnETHAGzBCHONf7kRZXLM0tF9zaaM94aofb+Yin+QyoTbyDUPxyfUxC9Mx9A==
X-Received: by 2002:a5d:63ce:0:b0:316:f32c:b156 with SMTP id
 c14-20020a5d63ce000000b00316f32cb156mr23304750wrw.6.1691511441896; 
 Tue, 08 Aug 2023 09:17:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a5d6e85000000b003141f96ed36sm14202258wrz.0.2023.08.08.09.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 09:17:21 -0700 (PDT)
Date: Tue, 8 Aug 2023 18:17:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Message-ID: <ZNJqj8ZqCei3uvx+@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 James Houghton <jthoughton@google.com>,
 Jerome Marchand <jmarchan@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Muchun Song <muchun.song@linux.dev>, Michal Hocko <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
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
 Jerome Marchand <jmarchan@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Muchun Song <muchun.song@linux.dev>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 22, 2023 at 10:25:17AM +0200, David Hildenbrand wrote:
> On 22.06.23 09:27, Vivek Kasireddy wrote:
> > The first patch ensures that the mappings needed for handling mmap
> > operation would be managed by using the pfn instead of struct page.
> > The second patch restores support for mapping hugetlb pages where
> > subpages of a hugepage are not directly used anymore (main reason
> > for revert) and instead the hugetlb pages and the relevant offsets
> > are used to populate the scatterlist for dma-buf export and for
> > mmap operation.
> > 
> > Testcase: default_hugepagesz=2M hugepagesz=2M hugepages=2500 options
> > were passed to the Host kernel and Qemu was launched with these
> > relevant options: qemu-system-x86_64 -m 4096m....
> > -device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
> > -display gtk,gl=on
> > -object memory-backend-memfd,hugetlb=on,id=mem1,size=4096M
> > -machine memory-backend=mem1
> > 
> > Replacing -display gtk,gl=on with -display gtk,gl=off above would
> > exercise the mmap handler.
> > 
> 
> While I think the VM_PFNMAP approach is much better and should fix that
> issue at hand, I thought more about missing memlock support and realized
> that we might have to fix something else. SO I'm going to raise the issue
> here.
> 
> I think udmabuf chose the wrong interface to do what it's doing, that makes
> it harder to fix it eventually.
> 
> Instead of accepting a range in a memfd, it should just have accepted a user
> space address range and then used pin_user_pages(FOLL_WRITE|FOLL_LONGTERM)
> to longterm-pin the pages "officially".
> 
> So what's the issue? Udma effectively pins pages longterm ("possibly
> forever") simply by grabbing a reference on them. These pages might easily
> reside in ZONE_MOVABLE or in MIGRATE_CMA pageblocks.
> 
> So what udmabuf does is break memory hotunplug and CMA, because it turns
> pages that have to remain movable unmovable.
> 
> In the pin_user_pages(FOLL_LONGTERM) case we make sure to migrate these
> pages. See mm/gup.c:check_and_migrate_movable_pages() and especially
> folio_is_longterm_pinnable(). We'd probably have to implement something
> similar for udmabuf, where we detect such unpinnable pages and migrate them.
> 
> 
> For example, pairing udmabuf with vfio (which pins pages using
> pin_user_pages(FOLL_LONGTERM)) in QEMU will most probably not work in all
> cases: if udmabuf longterm pinned the pages "the wrong way", vfio will fail
> to migrate them during FOLL_LONGTERM and consequently fail pin_user_pages().
> As long as udmabuf holds a reference on these pages, that will never
> succeed.

Uh this is no good and I totally missed this, because the very first
version of udmabuf used pin_user_pages(FOLL_LONGTERM). I think what we
need here as first fix is a shmem_pin_mapping_page_longterm that does all
the equivalent of pin_user_pages(FOLL_LONGTERM), and use it in udmabuf.
From a quick look the folio conversions that already landed should help
there.

It might also be good if we convert all the gpu driver users of
shmem_read_mapping_page over to that new shmem_pin_mapping_page_longterm,
just for safety. gpu drivers use a private shmem file and adjust the gfp
mask to clear GFP_MOVEABLE, so the biggest issues shouldn't be possible.
But pin(LONGTERM) compared to just getting a page ref has gained quite a
few other differences in the past years, and it would be good to be
consistent I think.

Anything else than longterm pins wont work for udmabuf, because the
locking between struct page/gup.c/mmu_notifier and dma_buf is rather
fundamentally (and by design due to gpu driver requirements) incompatible
with dma_buf locking rules.
 
> There are *probably* more issues on the QEMU side when udmabuf is paired
> with things like MADV_DONTNEED/FALLOC_FL_PUNCH_HOLE used for virtio-balloon,
> virtio-mem, postcopy live migration, ... for example, in the vfio/vdpa case
> we make sure that we disallow most of these, because otherwise there can be
> an accidental "disconnect" between the pages mapped into the VM (guest view)
> and the pages mapped into the IOMMU (device view), for example, after a
> reboot.

I think once we have the proper longterm pinning for udmabuf we need to
look into what coherency issues are left, and how to best fix them.
udmabuf already requires that the memfd is size sealed to avoid some
issues, we might need to require more. Or on the other side, perhaps
reject or quietly ignore some of the hole punching for longterm pinned
pages, to maintain coherency.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
