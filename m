Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0B52958B4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3896E1B3;
	Thu, 22 Oct 2020 07:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDD76E1B3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 07:00:56 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id 16so676080oix.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 00:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2r/6zOf2kRDD4tSmvaZuCPU8DwfuIowf0YjaeLwP4Nk=;
 b=et6ZBeQFHerVGVhgtgtRrYMM/XKZjx8P9HBSzQAYN1qwBLnRqWCR1692Hd2N6mG2QH
 DRodjxUs0g/udks4HbxzEysdS3iPEQ/WX4sYQzu415V2h1QQT1XnQSq/3dWFguLdKkzI
 zrJA18zci4a+rkwc8KCUbQtvVEViy3ghNPANM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2r/6zOf2kRDD4tSmvaZuCPU8DwfuIowf0YjaeLwP4Nk=;
 b=L7H+zJrsOXb6LPs1Ivrk/FsAAKI07mEoAfo+E1uM6jYfl205Ok2kdOt2zIG5EzVsDB
 KCr4lT6ovAymV2oVhcctaPVb4yomEdd+gt89f7nYmrtIT+WfQ5upDU3RurbOshxpmIuy
 e07RdIpGwxjL0JCGUNxLRbZo+3PVVRFPMbGR6Lc+o2LDD37E0WGYiftf4iRApg8DPWdV
 J+mSaSzbzMoEvk2xfVOodiOx9d83z/+HQsYNNQ70/G5X2BWzDfADwyRPz9hsJXLplCgu
 yXQxpgEhhTsJkHjF9FoojPVkaHC1PMP2BK1gP1r3nZSSA3+gskszkIWmFZd06fAwOP85
 kXjA==
X-Gm-Message-State: AOAM533LfaMWoYInCYvtGaRmITz4mJTTy6Oyz/hLFsQ+fNPFPZ9ORRFR
 bttMKAXSDBicP67ncFCmrkWeubn3vQSJML0sJIKMkg==
X-Google-Smtp-Source: ABdhPJw2FIAzZzMzBC6IGQ2084OMcZPDQegSMdZ1Ud1eEaxA84bu8yPrNPLWUQWDUUxTjx4XtxIOFs49Df+sZwbm0Kw=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr631463oig.128.1603350055185;
 Thu, 22 Oct 2020 00:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-13-daniel.vetter@ffwll.ch>
 <20201021125030.GK36674@ziepe.ca>
 <CAKMK7uEWe8CaT7zjcZ6dJAKHxtxtqzjVB35fCFviwhcnqksDfw@mail.gmail.com>
 <20201021151352.GL36674@ziepe.ca>
 <CAKMK7uGq0=ks7Zj1Et44k7x9FwE9u_ua4zANSqrLRri0v01V+Q@mail.gmail.com>
 <20201021163702.GM36674@ziepe.ca>
 <CAKMK7uEjE5sHUq0hV_bnYjPKRxYyBnty0sLre+owANGZjLJg9Q@mail.gmail.com>
 <20201021232022.GN36674@ziepe.ca>
In-Reply-To: <20201021232022.GN36674@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 22 Oct 2020 09:00:44 +0200
Message-ID: <CAKMK7uEkAK42+19KRo06XzJFuMCVriEEg0jxqXq8oAdt2ExLsQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] PCI: Obey iomem restrictions for procfs mmap
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
 Daniel Vetter <daniel.vetter@ffwll.com>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 22, 2020 at 1:20 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Oct 21, 2020 at 09:24:08PM +0200, Daniel Vetter wrote:
> > On Wed, Oct 21, 2020 at 6:37 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Wed, Oct 21, 2020 at 05:54:54PM +0200, Daniel Vetter wrote:
> > >
> > > > The trouble is that io_remap_pfn adjust vma->pgoff, so we'd need to
> > > > split that. So ideally ->mmap would never set up any ptes.
> > >
> > > /dev/mem makes pgoff == pfn so it doesn't get changed by remap.
> > >
> > > pgoff doesn't get touched for MAP_SHARED either, so there are other
> > > users that could work like this - eg anyone mmaping IO memory is
> > > probably OK.
> >
> > I was more generally thinking for io_remap_pfn_users because of the
> > mkwrite use-case we might have in fbdev emulation in drm.
>
> You have a use case for MAP_PRIVATE and io_remap_pfn_range()??

Uh no :-) But for ioremaps and keep track of which pages userspace has
touched. Problem is that there's many displays where you need to
explicitly upload the data, and in drm we have ioctl calls for that.
fbdev mmap assumes this just magically happens. So you need to keep
track of write faults, launch a delayed worker which first re-protects
all ptes and then uploads the dirty pages. And ideally we wouldn't
have to implement this everywhere just for fbdev, but could wrap it
around an existing mmap implementation by just intercepting mkwrite.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
