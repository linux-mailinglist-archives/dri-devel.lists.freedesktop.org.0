Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A848828EDEC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 09:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00896EC32;
	Thu, 15 Oct 2020 07:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EFF6EC32
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 07:52:57 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id l85so2132658oih.10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 00:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dhgu0dLDhdQohJO0sNuXaA2MoyXlGux/K8QZDPyJw6s=;
 b=NQD+qENEedFTKTlCD6h9DOFh4k6HLUd6xx7kkg5MeHaBwzG9gVFDzGcXE0xF2GmrJD
 dLMqZcDoQnkhUjU4yMSE+zE4g//7Vq4+UQwWv9N7H2FoDKlMxRcCLi7ps+MFAHdaZ3wK
 m9vmqDW1HLA7Gqj0yGcpzsjCUkgy10konM9bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dhgu0dLDhdQohJO0sNuXaA2MoyXlGux/K8QZDPyJw6s=;
 b=JZkSvhvlFLhnsttSFQ8zM70KObMbhKI0sFNIMBXbMIewvPdp1Fn7uxnS8jM5/uOc10
 eQa4QxYkcz76DbDH25dXYJHEpIJz6CvBSJ5jVWOQSc/ciRMF4zENXjcyRniyZblyW7k+
 JQbFoM/LHGTEjBeXn6kolxH4GdgomZYGooHOGJExSThXxLuEJVEKsb2nXw1CZob74MD2
 DsDNrU4S61wKrx5u/6eq3k6DXM65yiywkU8dquhl4CD1nywiKV49N1HBeK9QZe6t+Min
 QceXbKpuRg2fZHp4zijhEoef9pRrNJLsBCJL2ddrUPiIgCKzH8xuwjik9dFz3GXQO6VA
 bNjQ==
X-Gm-Message-State: AOAM531gvMFS6T5VjveYNb7CppAhJTU0L9/GfmCFgV3dRbqb5rtDppy0
 +cluAZPRJgPyXkZGm6GflDozkOZR5eTbDD8+BR/q7Q==
X-Google-Smtp-Source: ABdhPJwzY298KqMl0piyY6WC1v3Jsl2LfZBMZXpCc0fBF/BMSEZT1UgqTE6Ob3TXXLbgq4lcb2cTsJzeh8/K8Jd2l54=
X-Received: by 2002:aca:6083:: with SMTP id u125mr1369147oib.14.1602748376570; 
 Thu, 15 Oct 2020 00:52:56 -0700 (PDT)
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
Date: Thu, 15 Oct 2020 09:52:45 +0200
Message-ID: <CAKMK7uGu8yWRAGZX-dz-sXHsGufXKm003J5zuQr2AwNMG4+DUw@mail.gmail.com>
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

Indeed this changed with the sm_read_barrier_depends() removal a year
ago. Before that READ_ONCE and rcu_dereference where not actually the
same. I guess I'll throw a patch on top to switch that over too.
-Daniel




--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
