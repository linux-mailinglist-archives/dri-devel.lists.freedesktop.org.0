Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C41CE28F5D9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 17:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57746ED65;
	Thu, 15 Oct 2020 15:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23546ED65
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 15:29:17 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id c10so805133oon.6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 08:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LJwfZvZzZbL3U3dsefi4j72Jm0TppMPnsxaVcVl6iT0=;
 b=jiwyZuJU82zqfM3xXQZkNpewO6fCkqA7igabDZ79l9dEml7MlNt9/W6KspOKdTFMBv
 l0ZZKLNyCyInH/bWkyXoNA3+A+JhbIMgDBR1thG0QOHKB4hsUrxgAlsNauv981ymHMte
 aG33qVap5atzCP8H/NRFqSDXso79lnD2nYDfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LJwfZvZzZbL3U3dsefi4j72Jm0TppMPnsxaVcVl6iT0=;
 b=nG9NtOE4UI3OlZRYuI7BoL56IA3n/Iq7YtYCNdPRRoF1xbohdE/bI//bQiXsAW2psB
 13zwlBu9NYj1nR7JUw4oY9eMUIpB7Efo4wZ8eG9hqjScIXwICJxUCL2ToLalZgXAm9MF
 cn0fEt5oXuDKe3fjX6IG5v+R/qX6c7qQad2ZH2zFfmFGhzN3QJqH6CNWt4A2np+KArNK
 HI01zA8tleB36lODxLmgd93ZEZHpwZYtIaZP9wcClYguQ+LaiNSs4MtNC0R73U53TFp+
 WITDRvlq51QHDcI1RdVVaBC+7+VDwwrAmakhuDEJXw6i1+PaFeRTrk5XuC0LiTZBvqAk
 oSTw==
X-Gm-Message-State: AOAM5325SC7jkkTxbaDDLvUuYsly9uRzCHWuK30i12S7w9H2EPDSZYrj
 SKwuvHFBZ5bUwxaL/v/UapX3UXH/sJVo7orZD4OtXQ==
X-Google-Smtp-Source: ABdhPJwHGqKFcBCVEj4Z9lD8mpPIRoQJxs6gS7mqbJLVOqKjzGL3o2Yivo5QSuS7JTOQT9EJ/KzY1r55eHOicMya4wY=
X-Received: by 2002:a4a:e1d7:: with SMTP id n23mr2788554oot.85.1602775756786; 
 Thu, 15 Oct 2020 08:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-15-daniel.vetter@ffwll.ch>
 <20201009123109.GO5177@ziepe.ca>
 <CAKMK7uFpPP-Q0jC0vM7vYPEcg0m4NzTw+Ld=swdTF3BgMX5Qug@mail.gmail.com>
 <20201009143209.GS5177@ziepe.ca>
 <CAPcyv4j54O8ac6WB3LEeNud2r11V26gA0PRKK9bhyEMF67AXtQ@mail.gmail.com>
 <20201015000939.GD6763@ziepe.ca>
In-Reply-To: <20201015000939.GD6763@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 15 Oct 2020 17:29:05 +0200
Message-ID: <CAKMK7uGeVzbe3=FR=a5MEfzDsrog6D4+Bkiaj8FrVeOLu3-9Mw@mail.gmail.com>
Subject: Re: [PATCH v2 14/17] resource: Move devmem revoke code to resource
 framework
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 15, 2020 at 2:09 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Oct 09, 2020 at 11:28:54AM -0700, Dan Williams wrote:
> > On Fri, Oct 9, 2020 at 7:32 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Fri, Oct 09, 2020 at 04:24:45PM +0200, Daniel Vetter wrote:
> > > > On Fri, Oct 9, 2020 at 2:31 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > > >
> > > > > On Fri, Oct 09, 2020 at 09:59:31AM +0200, Daniel Vetter wrote:
> > > > >
> > > > > > +struct address_space *iomem_get_mapping(void)
> > > > > > +{
> > > > > > +     return iomem_inode->i_mapping;
> > > > >
> > > > > This should pair an acquire with the release below
> > > > >
> > > > > > +     /*
> > > > > > +      * Publish /dev/mem initialized.
> > > > > > +      * Pairs with smp_load_acquire() in revoke_iomem().
> > > > > > +      */
> > > > > > +     smp_store_release(&iomem_inode, inode);
> > > > >
> > > > > However, this seems abnormal, initcalls rarely do this kind of stuff
> > > > > with global data..
> > > > >
> > > > > The kernel crashes if this fs_initcall is raced with
> > > > > iomem_get_mapping() due to the unconditional dereference, so I think
> > > > > it can be safely switched to a simple assignment.
> > > >
> > > > Ah yes I checked this all, but forgot to correctly annotate the
> > > > iomem_get_mapping access. For reference, see b34e7e298d7a ("/dev/mem:
> > > > Add missing memory barriers for devmem_inode").
> > >
> > > Oh yikes, so revoke_iomem can run concurrently during early boot,
> > > tricky.
> >
> > It runs early because request_mem_region() can run before fs_initcall.
> > Rather than add an unnecessary lock just arrange for the revoke to be
> > skipped before the inode is initialized. The expectation is that any
> > early resource reservations will block future userspace mapping
> > attempts.
>
> Actually, on this point a simple WRITE_ONCE/READ_ONCE pairing is OK,
> Paul once explained that the pointer chase on the READ_ONCE side is
> required to be like an acquire - this is why rcu_dereference is just
> READ_ONCE

Hm so WRITE_ONCE doesn't have any barriers, and we'd need that for
updating the pointer. That would leave things rather inconsistent, so
I think I'll just leave it as-is for symmetry reasons. None of this
code matters for performance anyway, so micro-optimizing barriers
seems a bit silly.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
