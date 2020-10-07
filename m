Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3318D286A7E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 23:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7681F6E9BC;
	Wed,  7 Oct 2020 21:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACAD6E9BA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 21:50:59 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id n2so4188002oij.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 14:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dWGCIOydys/PVXDkI8D7/WYJ3+tXIlDPLmJQQeojkP4=;
 b=RYITGyTpDQrhaTy45WCQWB7S0cwfaHHh3OpiGBmEPf/5Sn9SZhBTUrfuBI5sApAVCz
 T91G4l95cIiLFkCFoy02NhuBItioeoq67OA++h3qBN6BlQdZ2cpqUetUKAyKzW4kFQ0w
 5Qtqca0SmLP0UhiDont79zDLISy/mkOvxYGHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dWGCIOydys/PVXDkI8D7/WYJ3+tXIlDPLmJQQeojkP4=;
 b=GpTSPZ8oBsxJTsy2YxzHdnATG4fF45QpNpewxjSveNlboY8S4g/ASWvMyI1j8RazTV
 uRQeBzJNMB2xbzPp9soQxf77Tq9W8+QtVGlc6oFrjjwHuT2/84PkAToMA9aqqG0acc/f
 8ehfk1Oju6uHzb4EbPCdCW6iSmebHBiQfK03PFnQHOgDh940AaVQI477TwRb4Wmasw0X
 ADHzqzkI5gWHkoh4kPMLN51rTihn0Y73ElgmCx3rrbuQ2W5zZsfODis9YN1zZTUau9pF
 +bfB5jbVWlX74OdNth8Vazh4urk1bleYGvpj8MmaD2DRDLhr723qU1heBvGi8nmVvPt5
 PAKA==
X-Gm-Message-State: AOAM533CEKrR5CKNgahT1Is5CZ6hIz54PsokyqbxhLidW49V9IoGofCZ
 wbq0E2x+rG40yO+2VqtreOL+xepysyoIl5ltf+Ft1jJRJC64YA==
X-Google-Smtp-Source: ABdhPJywVeOO6ZiDQcLcwu4Td5CgpCTJ9U8XcX1hFxhlIWItjEaKhv17whEr41y9mEAabwbRCVa0NcIfbphA+xnz5sQ=
X-Received: by 2002:aca:6083:: with SMTP id u125mr3249940oib.14.1602107459110; 
 Wed, 07 Oct 2020 14:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-2-daniel.vetter@ffwll.ch>
 <80718789-b3de-c30a-03c5-7c8cbf41f7d9@nvidia.com>
 <CAKMK7uEuwmCkpSeKxjDgHXWrE9P-TbawLoQ4dpu0nc4MYykScA@mail.gmail.com>
 <895eb064-1c8f-ecfc-0a98-1fbe40cb3161@nvidia.com>
In-Reply-To: <895eb064-1c8f-ecfc-0a98-1fbe40cb3161@nvidia.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 7 Oct 2020 23:50:47 +0200
Message-ID: <CAKMK7uFgPfwxr7ePng-f=e__10+3bipmDhF4hFACcyao63m-nA@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/exynos: Stop using frame_vector helpers
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
 linux-s390@vger.kernel.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Joonyoung Shim <jy0922.shim@samsung.com>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 7, 2020 at 11:37 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 10/7/20 2:32 PM, Daniel Vetter wrote:
> > On Wed, Oct 7, 2020 at 10:33 PM John Hubbard <jhubbard@nvidia.com> wrote:
> >>
> >> On 10/7/20 9:44 AM, Daniel Vetter wrote:
> ...
> >>> @@ -398,15 +399,11 @@ static void g2d_userptr_put_dma_addr(struct g2d_data *g2d,
> >>>        dma_unmap_sgtable(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt,
> >>>                          DMA_BIDIRECTIONAL, 0);
> >>>
> >>> -     pages = frame_vector_pages(g2d_userptr->vec);
> >>> -     if (!IS_ERR(pages)) {
> >>> -             int i;
> >>> +     for (i = 0; i < g2d_userptr->npages; i++)
> >>> +             set_page_dirty_lock(g2d_userptr->pages[i]);
> >>>
> >>> -             for (i = 0; i < frame_vector_count(g2d_userptr->vec); i++)
> >>> -                     set_page_dirty_lock(pages[i]);
> >>> -     }
> >>> -     put_vaddr_frames(g2d_userptr->vec);
> >>> -     frame_vector_destroy(g2d_userptr->vec);
> >>> +     unpin_user_pages(g2d_userptr->pages, g2d_userptr->npages);
> >>> +     kvfree(g2d_userptr->pages);
> >>
> >> You can avoid writing your own loop, and just simplify the whole thing down to
> >> two lines:
> >>
> >>          unpin_user_pages_dirty_lock(g2d_userptr->pages, g2d_userptr->npages,
> >>                                      true);
> >>          kvfree(g2d_userptr->pages);
> >
> > Oh nice, this is neat. I'll also roll it out in the habanalabs patch,
> > that has the same thing. Well almost, it only uses set_page_dirty, not
> > the _lock variant. But I have no idea whether that matters or not?
>
>
> It matters. And invariably, call sites that use set_page_dirty() instead
> of set_page_dirty_lock() were already wrong.  Which is why I never had to
> provide anything like "unpin_user_pages_dirty (not locked)".
>
> Although in habanalabs case, I just reviewed patch 3 and I think they *were*
> correctly using set_page_dirty_lock()...

Yeah I mixed that up with some other code I read, habanalabs is using
_lock. I have seen a pile of gup/pup code though that only uses
set_page_dirty. And looking around I did not really parse the comment
above set_page_dirty(). I guess just using the _lock variant shouldn't
hurt too much. I've found a comment though from the infiniband umem
notifier that it's sometimes called with the page locked, and
sometimes not, so life is complicated there. But how it avoids races I
didn't understand.
-Daniel


--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
