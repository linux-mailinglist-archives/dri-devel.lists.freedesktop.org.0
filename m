Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B26E82A1D48
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 11:31:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3017E6E08C;
	Sun,  1 Nov 2020 10:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6956E08C
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 10:31:01 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id n11so9865640ota.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 02:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cMohUdqA3mHu1aHkJyF+q3c+LPomnH+bJbyOS5Pjj34=;
 b=PXdr311jw4o1TK1cA/6mrlvkDVtMBlyy1XYbMpIt3vJC7ClXj7DZJYo+vKllfO49H/
 YgcjzcGc1VpCnfRMFbloI4quCQ5ndPF+idmxEJoWrUJWkpgS76TUc1DHlMSxRDqofJvd
 l2sKUL2WW0wKA2NYOf2SZx1Y6sFEl/LXBFDeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cMohUdqA3mHu1aHkJyF+q3c+LPomnH+bJbyOS5Pjj34=;
 b=YGLVK/ThlRGZb+oChvayh6Yc9orHkv4qFdqIdn3g8/kak+/Wly+eMSQXsf6ko01NQo
 0fbBKsFxDJ1AFBWmYZzK7g0tnI+qVZFtLquUeydz1M0/Soo9fRtY6YkAUmAy/Re188pP
 mEDagnHcyloIcjURt9OBvCIB4LCp5egVnvYkvHYnzTrp3qcVo2vH/P6RRhNPeF5bwY7x
 4vzvKTqOcDRqwPiAIwZxAlbJZotNg5QAnIqhC8J3BXfXb5tlDOGjxIF+tkTvUnKsumIS
 rlaneqzg6LbMF8N6qt6l1Q/+oMsTItn0MFEjLv0JB9JyT+N4OGPp93Q2ZT2NFZhaKHUv
 2Myg==
X-Gm-Message-State: AOAM532p7aSwvW17XilLZ5R9iAijCf/vxyRdM13DtNYWxm8uoAIplZ05
 HF508D26VrGkT6BnzilW8k6cQLxLZwYcQ65lVYuw2A==
X-Google-Smtp-Source: ABdhPJxxfl/j7Y56O7SvvjDInbgd1Huz0SnDjNzTDNqX3oHxJ8qJKEvsr7nAV6GfCrUUP0r8bqY++IYBOL0aDpBKvjo=
X-Received: by 2002:a05:6830:1647:: with SMTP id
 h7mr8739299otr.281.1604226660644; 
 Sun, 01 Nov 2020 02:31:00 -0800 (PST)
MIME-Version: 1.0
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-6-daniel.vetter@ffwll.ch>
 <446b2d5b-a1a1-a408-f884-f17a04b72c18@nvidia.com>
 <CAKMK7uGDW2f0oOvwgryCHxQFHyh3Tsk6ENsMGmtZ-EnH57tMSA@mail.gmail.com>
 <1f7cf690-35e2-c56f-6d3f-94400633edd2@nvidia.com>
In-Reply-To: <1f7cf690-35e2-c56f-6d3f-94400633edd2@nvidia.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sun, 1 Nov 2020 11:30:49 +0100
Message-ID: <CAKMK7uFYDSqnNp_xpohzCEidw_iLufNSoX4v55sNZj-nwTckSg@mail.gmail.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
To: John Hubbard <jhubbard@nvidia.com>
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
Cc: =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Pawel Osciak <pawel@osciak.com>, KVM list <kvm@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux MM <linux-mm@kvack.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 1, 2020 at 6:22 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 10/31/20 7:45 AM, Daniel Vetter wrote:
> > On Sat, Oct 31, 2020 at 3:55 AM John Hubbard <jhubbard@nvidia.com> wrote:
> >> On 10/30/20 3:08 AM, Daniel Vetter wrote:
> ...
> >> By removing this check from this location, and changing from
> >> pin_user_pages_locked() to pin_user_pages_fast(), I *think* we end up
> >> losing the check entirely. Is that intended? If so it could use a comment
> >> somewhere to explain why.
> >
> > Yeah this wasn't intentional. I think I needed to drop the _locked
> > version to prep for FOLL_LONGTERM, and figured _fast is always better.
> > But I didn't realize that _fast doesn't have the vma checks, gup.c got
> > me a bit confused.
>
> Actually, I thought that the change to _fast was a very nice touch, btw.
>
> >
> > I'll remedy this in all the patches where this applies (because a
> > VM_IO | VM_PFNMAP can point at struct page backed memory, and that
> > exact use-case is what we want to stop with the unsafe_follow_pfn work
> > since it wreaks things like cma or security).
> >
> > Aside: I do wonder whether the lack for that check isn't a problem.
> > VM_IO | VM_PFNMAP generally means driver managed, which means the
> > driver isn't going to consult the page pin count or anything like that
> > (at least not necessarily) when revoking or moving that memory, since
> > we're assuming it's totally under driver control. So if pup_fast can
> > get into such a mapping, we might have a problem.
> > -Daniel
> >
>
> Yes. I don't know why that check is missing from the _fast path.
> Probably just an oversight, seeing as how it's in the slow path. Maybe
> the appropriate response here is to add a separate patch that adds the
> check.
>
> I wonder if I'm overlooking something, but it certainly seems correct to
> do that.

You'll need the mmap_sem to get at the vma to be able to do this
check. If you add that to _fast, you made it as fast as the slow one.
Plus there's _fast_only due to locking recurion issues in fast-paths
(I assume, I didn't check all the callers).

I'm just wondering whether we have a bug somewhere with device
drivers. For CMA regions we always check in try_grab_page, but for dax
I'm not seeing where the checks in the _fast fastpaths are, and that
all still leaves random device driver mappings behind which aren't
backed by CMA but still point to something with a struct page behind
it. I'm probably just missing something, but no idea what.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
