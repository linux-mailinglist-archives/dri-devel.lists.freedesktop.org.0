Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46731295F4C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 15:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7B36E1B7;
	Thu, 22 Oct 2020 13:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF646E1B7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 13:04:26 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id t15so1409497otk.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZyNrxU7+apn6xOGNK6avkKI1+/ers9vOGia4XvYK0qo=;
 b=hFupg462AQWF/3SYEGt7TdCBz7vmVV24cGf5H3PsZJ3NHOF7ARTtk1Xj9pQ6xHZuZX
 osgTY+1RlCMoExun5CEMIKW0/Q22JFrGKszrr35SoM6z+n1XQ4DOZb0ztKWF8FqsQ0rj
 YYO9Ror43OTX+8WLAdJnTsM4HmBRXtLFYIBBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZyNrxU7+apn6xOGNK6avkKI1+/ers9vOGia4XvYK0qo=;
 b=cgzujyFPx04UvLjbWIY0j3111NMN1D1TiyrLWJvF6RwvvpLYHvKvvLawPTMnHdqNTt
 23hgeachZ3h58GgoU4KQeqIeMkkQi8q6GmqnhZbumob1s+Gc3Zo9y1Jd/R7DjuDabS3K
 E9Y+Uhh+pQGWQVUczZm8fKR2uicAvr1dPfFUx+TRpnc9vq0XqEubkwH9/2cL3f+m/RUY
 Zd3MFkQstTCxNKJKT2ahItX5cRKK/Csd/Ndj070hEU28lbPRSj7+DvPBF5yTS2Axii5C
 etRnYzY7D2wMAFtT49FktGwNeFZ8AEr3txZVZe8EaNupedyLGZEwSwxQ7jmg3/sBv87U
 KLIw==
X-Gm-Message-State: AOAM530mIgcInhmeQDqhf+hvp9Yj/vXhz9iT5sM1AO7Etv1ghmRMQpsa
 h4uHxUVSXGi3c4Q0torHcjHxMFbG052MkTjFOdq9SA==
X-Google-Smtp-Source: ABdhPJx8bjchuHtk5X5j8AOy5uSsJ+M716njPCO+bint+3P1gD9xIsXgxoepgb7cnqWbI4FroPmfqz6vrX/g4fdQHsY=
X-Received: by 2002:a05:6830:1647:: with SMTP id
 h7mr1916643otr.281.1603371865933; 
 Thu, 22 Oct 2020 06:04:25 -0700 (PDT)
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
 <CAKMK7uEkAK42+19KRo06XzJFuMCVriEEg0jxqXq8oAdt2ExLsQ@mail.gmail.com>
 <20201022114345.GO36674@ziepe.ca>
In-Reply-To: <20201022114345.GO36674@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 22 Oct 2020 15:04:14 +0200
Message-ID: <CAKMK7uHUufuyCXF5jUZG1zZ8SeaAFOi-9dA1sejc2R5fnLTJVA@mail.gmail.com>
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

On Thu, Oct 22, 2020 at 1:43 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Oct 22, 2020 at 09:00:44AM +0200, Daniel Vetter wrote:
> > On Thu, Oct 22, 2020 at 1:20 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Wed, Oct 21, 2020 at 09:24:08PM +0200, Daniel Vetter wrote:
> > > > On Wed, Oct 21, 2020 at 6:37 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > > >
> > > > > On Wed, Oct 21, 2020 at 05:54:54PM +0200, Daniel Vetter wrote:
> > > > >
> > > > > > The trouble is that io_remap_pfn adjust vma->pgoff, so we'd need to
> > > > > > split that. So ideally ->mmap would never set up any ptes.
> > > > >
> > > > > /dev/mem makes pgoff == pfn so it doesn't get changed by remap.
> > > > >
> > > > > pgoff doesn't get touched for MAP_SHARED either, so there are other
> > > > > users that could work like this - eg anyone mmaping IO memory is
> > > > > probably OK.
> > > >
> > > > I was more generally thinking for io_remap_pfn_users because of the
> > > > mkwrite use-case we might have in fbdev emulation in drm.
> > >
> > > You have a use case for MAP_PRIVATE and io_remap_pfn_range()??
> >
> > Uh no :-)
>
> So it is fine, the pgoff mangling only happens for MAP_PRIVATE

Ah right I got confused, thanks for clarifying.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
