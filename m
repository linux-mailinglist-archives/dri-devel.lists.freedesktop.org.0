Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F37ED765E5A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B81110E611;
	Thu, 27 Jul 2023 21:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFE710E611
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 21:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690494198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MJJwHwtXNnxbSlT+8MqC4Bb1EN+dfWWfKfM43w5YNrs=;
 b=jSM36QHNYG0odQXLeq2UxfpSRDRZNKetBEzRyLaPy6uuddmvU4niN7U/TZacTePy9gZndW
 fYTh/VL7yYRCE9zpcfUlK6erMmVPypUwyrUs6G8BN3BuOrIr0t7ajckpwDmIHMkyhZFRIS
 PZbEuq2KhqnYS1RWDjcwR3AL79UW/xg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-WDR3lPQgNnaH1IEU9SJn2w-1; Thu, 27 Jul 2023 17:43:16 -0400
X-MC-Unique: WDR3lPQgNnaH1IEU9SJn2w-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-63c9463c116so3308936d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690494196; x=1691098996;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJJwHwtXNnxbSlT+8MqC4Bb1EN+dfWWfKfM43w5YNrs=;
 b=AfxftAFgvgcL41VAalYLxMmeSOBaX0rqes6GBQYdNu1uKYeCDCGQUhYNmGsgRYrKin
 LAFl3x7HizMXqeUX8R+B0pfsqgmDypcpMaYnmD5t84UDJxZWmgLX4Ely92PRAwYmNbvi
 D79pVinuuMLLHuT8Y1cJcwymPvkELWxKHIO+64mvFBlaSYTtgqCUS+niMcmhp40W/Sym
 RVIsbjCTuHJvp0r2+SZfe3tiJE+wdRX2JscoeZML2HYWq2zEXP1MaCsrO9RAvCCGFlU2
 5jbBk9/HdiZT+t60GpzQE1939SwedGcTiTDOcQmJEWSCnpQRQqphkmW6CJVtqBeFn4E6
 5HmQ==
X-Gm-Message-State: ABy/qLYnycxLgFs/lSwTlRxZYnmXsv3efNEfigSSQPJ4rWovLpbsVF5C
 OQxBSBcfnGD+9OAQ8t6NziZ1EEYk+dE3sHLz+usCAInWmn8meC2Xr4nhy8f96JRIqsdWPnPO+1i
 tT9Hjly7kNf5K3xw3rnLXVnqLY7ak
X-Received: by 2002:a05:6214:4011:b0:63c:f5fd:d30f with SMTP id
 kd17-20020a056214401100b0063cf5fdd30fmr801656qvb.1.1690494195826; 
 Thu, 27 Jul 2023 14:43:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEgrGhLY9tc/heWbKgbRSzR9pLyQzuZ3sSVWAPPUKkETb1sJp3OQ1uEXpyPHbNa/xZi03x+zw==
X-Received: by 2002:a05:6214:4011:b0:63c:f5fd:d30f with SMTP id
 kd17-20020a056214401100b0063cf5fdd30fmr801640qvb.1.1690494195470; 
 Thu, 27 Jul 2023 14:43:15 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 l26-20020a0c979a000000b0063d2a70dff5sm720739qvd.72.2023.07.27.14.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 14:43:15 -0700 (PDT)
Date: Thu, 27 Jul 2023 17:43:13 -0400
From: Peter Xu <peterx@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZMLk8aMmpkK7ZCsW@x1n>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <75e3a74a-68f5-df-9a49-a0553c04320@google.com>
 <CH3PR11MB71777432A63D3FAAE7E70F22F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CH3PR11MB71777432A63D3FAAE7E70F22F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
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

Hi, Vivek,

On Tue, Jul 25, 2023 at 10:24:21PM +0000, Kasireddy, Vivek wrote:
> Hi Hugh,
> 
> > 
> > On Mon, 24 Jul 2023, Kasireddy, Vivek wrote:
> > > Hi Jason,
> > > > On Mon, Jul 24, 2023 at 07:54:38AM +0000, Kasireddy, Vivek wrote:
> > > >
> > > > > > I'm not at all familiar with the udmabuf use case but that sounds
> > > > > > brittle and effectively makes this notifier udmabuf specific right?
> > > > > Oh, Qemu uses the udmabuf driver to provide Host Graphics
> > components
> > > > > (such as Spice, Gstreamer, UI, etc) zero-copy access to Guest created
> > > > > buffers. In other words, from a core mm standpoint, udmabuf just
> > > > > collects a bunch of pages (associated with buffers) scattered inside
> > > > > the memfd (Guest ram backed by shmem or hugetlbfs) and wraps
> > > > > them in a dmabuf fd. And, since we provide zero-copy access, we
> > > > > use DMA fences to ensure that the components on the Host and
> > > > > Guest do not access the buffer simultaneously.
> > > >
> > > > So why do you need to track updates proactively like this?
> > > As David noted in the earlier series, if Qemu punches a hole in its memfd
> > > that goes through pages that are registered against a udmabuf fd, then
> > > udmabuf needs to update its list with new pages when the hole gets
> > > filled after (guest) writes. Otherwise, we'd run into the coherency
> > > problem (between udmabuf and memfd) as demonstrated in the selftest
> > > (patch #3 in this series).
> > 
> > Wouldn't this all be very much better if Qemu stopped punching holes there?
> I think holes can be punched anywhere in the memfd for various reasons. Some

I just start to read this thread, even haven't finished all of them.. but
so far I'm not sure whether this is right at all..

udmabuf is a file, it means it should follow the file semantics. mmu
notifier is per-mm, otoh.

Imagine for some reason QEMU mapped the guest pages twice, udmabuf is
created with vma1, so udmabuf registers the mm changes over vma1 only.

However the shmem/hugetlb page cache can be populated in either vma1, or
vma2.  It means when populating on vma2 udmabuf won't get update notify at
all, udmabuf pages can still be obsolete.  Same thing to when multi-process
QEMU is used, where we can have vma1 in QEMU while vma2 in the other
process like vhost-user.

I think the trick here is we tried to "hide" the fact that these are
actually normal file pages, but we're doing PFNMAP on them... then we want
the file features back, like hole punching..

If we used normal file operations, everything will just work fine; TRUNCATE
will unmap the host mapped frame buffers when needed, and when accessed
it'll fault on demand from the page cache.  We seem to be trying to
reinvent "truncation" for pfnmap but mmu notifier doesn't sound right to
this at least..

> of the use-cases where this would be done were identified by David. Here is what
> he said in an earlier discussion:
> "There are *probably* more issues on the QEMU side when udmabuf is paired 
> with things like MADV_DONTNEED/FALLOC_FL_PUNCH_HOLE used for 
> virtio-balloon, virtio-mem, postcopy live migration, ... for example, in"

Now after seething this, I'm truly wondering whether we can still simply
use the file semantics we already have (for either shmem/hugetlb/...), or
is it a must we need to use a single fd to represent all?

Say, can we just use a tuple (fd, page_array) rather than the udmabuf
itself to do host zero-copy mapping?  the page_array can be e.g. a list of
file offsets that points to the pages (rather than pinning the pages using
FOLL_GET).  The good thing is then the fd can be the guest memory file
itself.  With that, we can mmap() over the shmem/hugetlb in whatever vma
and whatever process.  Truncation (and actually everything... e.g. page
migration, swapping, ... which will be disabled if we use PFNMAP pins) will
just all start to work, afaiu.

Thanks,

-- 
Peter Xu

