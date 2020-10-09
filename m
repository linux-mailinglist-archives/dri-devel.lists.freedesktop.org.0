Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7482890CA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 20:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761866ED7E;
	Fri,  9 Oct 2020 18:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDC56ED7E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 18:29:07 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id v19so10339429edx.9
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 11:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oVIvf//qjy+hkVJdi59awFrM6IZJ9JvpO2cbPx+MdNs=;
 b=iLTsuWlJpjQ9lEPve4/i/wPKY7/WDc/EpLX4/nS4Vs7XATh36CjNusW0cAwcZzYVKB
 zc2lO4Dz7JRsbYqzp49bDWt7Nj2zjd+nQ3ChgcqgyusxmNzv8xBi0X9an51ub82xSMED
 ypIlohpfnHirbuqkE/mXCCbfP8pd5KhfDsovroGKCzUs8q45yo4Fd6/w1fPvA40p9Zsk
 Fhj1k3kJxsDCiab+2o7o95nm9iELSt9Olz0BwNfHJpYbcdvZw4q4VKPfH3rzH+ZSLvin
 8ENlmZNYLWdWLsvLquEHYWK2U/S9AfZj3u8X6XmfQJoqlt/05+soeGykQWGSaZLnN0RZ
 i9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oVIvf//qjy+hkVJdi59awFrM6IZJ9JvpO2cbPx+MdNs=;
 b=InOUPonb9UrOxJqyEeb7RAxvyHgUozM/erISDACP1te1jQIYborHsBo6IjAbeZk05/
 8I9VyovYn++678eS1cV3FWl918l49FWtW9DX2ogxfHHHtS3PXyEHxyIL+HozEsgaoSla
 cwIkg0D3MMdA4O9nrpLZoKAr+AywNsKY1GS920B4tqyrWs0+edCUK8VQahhjLD/pCtEf
 I0CohO+FG4lP6jevNEMkvpZ33nGF6TbRtLUQ9ZjsJqw2gKSdo03LzHxZs6ePGKb2O+IW
 lAcV3GeDJ7I3YahCbRQhf7CD2VruYeafCmXXmFW+KbnhOwDHJFPVmLOeZ1fh3n7iBOxo
 eWsA==
X-Gm-Message-State: AOAM5317gg7WNYL8L0OcMtpoVE6MWY2XZjed5Q6rGP0G7FqNxBu+GVDB
 SZ/nSNk8hEmgTtwZh8GlB2GhEkHWp8c0aBkOgREyOw==
X-Google-Smtp-Source: ABdhPJzWk7BhJg0T57QGadQcytTP33YarvnD8YMhqI7SBWAAOvIcMevxnSHZgp/bJXzdV8lpWps/qAzI6LdBImluO+E=
X-Received: by 2002:a50:d0d0:: with SMTP id g16mr559132edf.18.1602268145655;
 Fri, 09 Oct 2020 11:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-15-daniel.vetter@ffwll.ch>
 <20201009123109.GO5177@ziepe.ca>
 <CAKMK7uFpPP-Q0jC0vM7vYPEcg0m4NzTw+Ld=swdTF3BgMX5Qug@mail.gmail.com>
 <20201009143209.GS5177@ziepe.ca>
In-Reply-To: <20201009143209.GS5177@ziepe.ca>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 9 Oct 2020 11:28:54 -0700
Message-ID: <CAPcyv4j54O8ac6WB3LEeNud2r11V26gA0PRKK9bhyEMF67AXtQ@mail.gmail.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Hildenbrand <david@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 9, 2020 at 7:32 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Oct 09, 2020 at 04:24:45PM +0200, Daniel Vetter wrote:
> > On Fri, Oct 9, 2020 at 2:31 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Fri, Oct 09, 2020 at 09:59:31AM +0200, Daniel Vetter wrote:
> > >
> > > > +struct address_space *iomem_get_mapping(void)
> > > > +{
> > > > +     return iomem_inode->i_mapping;
> > >
> > > This should pair an acquire with the release below
> > >
> > > > +     /*
> > > > +      * Publish /dev/mem initialized.
> > > > +      * Pairs with smp_load_acquire() in revoke_iomem().
> > > > +      */
> > > > +     smp_store_release(&iomem_inode, inode);
> > >
> > > However, this seems abnormal, initcalls rarely do this kind of stuff
> > > with global data..
> > >
> > > The kernel crashes if this fs_initcall is raced with
> > > iomem_get_mapping() due to the unconditional dereference, so I think
> > > it can be safely switched to a simple assignment.
> >
> > Ah yes I checked this all, but forgot to correctly annotate the
> > iomem_get_mapping access. For reference, see b34e7e298d7a ("/dev/mem:
> > Add missing memory barriers for devmem_inode").
>
> Oh yikes, so revoke_iomem can run concurrently during early boot,
> tricky.

It runs early because request_mem_region() can run before fs_initcall.
Rather than add an unnecessary lock just arrange for the revoke to be
skipped before the inode is initialized. The expectation is that any
early resource reservations will block future userspace mapping
attempts.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
