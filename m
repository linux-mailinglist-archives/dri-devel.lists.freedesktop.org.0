Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA642A2B67
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111186E524;
	Mon,  2 Nov 2020 13:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DE86E524
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 13:24:09 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id m143so5278198oig.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 05:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JGM5iJVe1/YS3RI7Ox6P0c/NeEFHo7I8woI64ttdcHw=;
 b=Redsc76//XOqhmrR47LrRhhRKZfVgrPgcKjaj3flUUV05IMeYYgYI96W5nS3FoZvN7
 n0yN3r95mirzqxFiZdIGicTdRpE+APj1YYPKDXlNxKd2lAM4+mMT2WniX47hjE9Yln3I
 Y2p0Ua++jSUdgHYquFbAF5VAHeKUIvWvGxWx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JGM5iJVe1/YS3RI7Ox6P0c/NeEFHo7I8woI64ttdcHw=;
 b=n7OS9jmFklQegKpv5XPzdX06gUHax6UknUP+G780jhbVatIQPcX2fgL3XJ66Fv6fZd
 G7ElAPj77xoQUbtci5JEDNx6KKof1A0dvhloj2lZHmdSROkcNXYJn0byCXac6Kl61zdu
 GYn3n5sUeRMYLk940MSUBxb04vVGpzMXH8H0+nfeT/iKcQpnMMcuhA7LSGRj6GQVaEiF
 pSoaA/5wTISuDRDTYFtJldsS62eNCJiCfVFfX9dJfRgbxdPTIJj1RB3FATS4cZEYutMY
 vpunpkCaFZQm93PPnaEpz34HeYGTNeEdxKJKBDWqnEFPKP1qjc0696o4RjKuJkXZ/Cbf
 y6oQ==
X-Gm-Message-State: AOAM5334RYppWAXxXviYsmRNqYA7cRiX0W7CIAPSs+RRzLdaUKFZEEKU
 c/PunFJoxPspjdj3+MgOYVDmioQ8gs6nyy0iHgMQLqHBZbS7fQ==
X-Google-Smtp-Source: ABdhPJz6z2w7hj9FcAzqiJvVAZYDEwQ1hz51TSyVs1UuhBMkzKJELH0Nji35ZsSbH8nvJRYlHjcaT+TvGc3KsVWMNe0=
X-Received: by 2002:aca:b141:: with SMTP id a62mr9289032oif.101.1604323449305; 
 Mon, 02 Nov 2020 05:24:09 -0800 (PST)
MIME-Version: 1.0
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-9-daniel.vetter@ffwll.ch>
 <20201102072931.GA16419@infradead.org>
 <CAKMK7uEe5FQuukYU7RhL90ttC9XyWw6wvdQrZ2JpP0jpbYTO6g@mail.gmail.com>
 <20201102130115.GC36674@ziepe.ca>
In-Reply-To: <20201102130115.GC36674@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 2 Nov 2020 14:23:58 +0100
Message-ID: <CAKMK7uHeL=w7GoBaY4XrbRcpJabR9UWnP+oQ9Fg51OzL7=KxiA@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] mm: Add unsafe_follow_pfn
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 KVM list <kvm@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Linux MM <linux-mm@kvack.org>,
 J??r??me Glisse <jglisse@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 2, 2020 at 2:01 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Nov 02, 2020 at 01:56:10PM +0100, Daniel Vetter wrote:
> > On Mon, Nov 2, 2020 at 8:29 AM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > On Fri, Oct 30, 2020 at 11:08:08AM +0100, Daniel Vetter wrote:
> > > > Also mark up follow_pfn as EXPORT_SYMBOL_GPL. The only safe way to use
> > > > that by drivers/modules is together with an mmu_notifier, and that's
> > > > all _GPL stuff.
> > >
> > > I also think it also needs to be renamed to explicitly break any existing
> > > users out of tree or int the submission queue.
> >
> > Ok I looked at the mmu notifier locking again and noticed that
> > mm->subscriptions has its own spinlock. Since there usually shouldn't
> > be a huge pile of these I think it's feasible to check for the mmu
> > notifier in follow_pfn. And that would stuff this gap for good. I'll
> > throw that on top as a final patch and see what people think.
>
> Probably the simplest is to just check mm_has_notifiers() when in
> lockdep or something very simple like that

lockdep feels wrong, was locking more at CONFIG_DEBUG_VM. And since
generally you only have 1 mmu notifier (especially for kvm) I think we
can also pay the 2nd cacheline miss and actually check the right mmu
notifier is registered.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
