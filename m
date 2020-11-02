Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8B52A301D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 17:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEECC6E47B;
	Mon,  2 Nov 2020 16:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09FD6E47B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 16:42:32 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id j14so2969702ots.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 08:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LkcPNNpMLX6kEqUed20/jhdzhJZXy+qPlqOir1Z4UWg=;
 b=DejrOT1ET977KzMedOZFf/nvESeZd35VW615DHzfUVNv/jtr5S39tQRR1rkXRrNQsS
 8e7QakA0NQZajazNYknFTyPn7wzCTD0MaLh6LD79vAKy5J2WjkyqZwU1hUMlTMpcVTcY
 aRcqJL/19jZSjJmXa+xeFfRoO2oW4s/0IBZV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LkcPNNpMLX6kEqUed20/jhdzhJZXy+qPlqOir1Z4UWg=;
 b=DOdjvr/rIEQoOkk3QfKAZuhlIQPOf5DRLCqGwgEbr6pbJ8eBBueE8BT8c2M5738IEC
 TKzanrFFVhfVCXhlacODkKA7IElROs6OTVsphAYBb7Cm7Ux6hqmactaEoztDpJubdE5u
 5j33IHF+h/74JW+ZW2dsYfQRfSsqiK/AJiHVTyFcfhIgln06++B0206fm+19D3r1uIrf
 coNRi26zC3jinDwGQyfFxjc3yMhlH3lO4c5PVKCuGFrqHGLvOlxFLydgVNXSPfyGdlw1
 W4NZpidWjpk2vG8jgS27PYKaHeHPQN8mtOEOytDP2auQ5H8JI1Qw87ybOBspEYowdHnV
 wp7A==
X-Gm-Message-State: AOAM530+UMn+24ee6cznP7cxedguY1TDbDx+i5moBWnhY+VVgmwHsc6c
 T3mwcV0vwQQL7vhQHuHABSM0zg7zwuSh5kj82DzVxg==
X-Google-Smtp-Source: ABdhPJw6fgeaE8WrMv6/yjTLi0nLsEgIsTJGq7lnieyfjRKsxeZQjFjVvPlXPA1vJ6n1s7o3wIRvF8cXTGM5e/OE7rM=
X-Received: by 2002:a05:6830:1647:: with SMTP id
 h7mr13325941otr.281.1604335352341; 
 Mon, 02 Nov 2020 08:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-9-daniel.vetter@ffwll.ch>
 <20201102072931.GA16419@infradead.org>
 <CAKMK7uEe5FQuukYU7RhL90ttC9XyWw6wvdQrZ2JpP0jpbYTO6g@mail.gmail.com>
 <20201102130115.GC36674@ziepe.ca>
 <CAKMK7uHeL=w7GoBaY4XrbRcpJabR9UWnP+oQ9Fg51OzL7=KxiA@mail.gmail.com>
 <20201102155256.GG36674@ziepe.ca>
In-Reply-To: <20201102155256.GG36674@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 2 Nov 2020 17:42:20 +0100
Message-ID: <CAKMK7uFqkieBAXEmoeoBfnJBXcuHaNwrsaVyPsLQaXnrJo=scg@mail.gmail.com>
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

On Mon, Nov 2, 2020 at 4:52 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Nov 02, 2020 at 02:23:58PM +0100, Daniel Vetter wrote:
> > On Mon, Nov 2, 2020 at 2:01 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Mon, Nov 02, 2020 at 01:56:10PM +0100, Daniel Vetter wrote:
> > > > On Mon, Nov 2, 2020 at 8:29 AM Christoph Hellwig <hch@infradead.org> wrote:
> > > > >
> > > > > On Fri, Oct 30, 2020 at 11:08:08AM +0100, Daniel Vetter wrote:
> > > > > > Also mark up follow_pfn as EXPORT_SYMBOL_GPL. The only safe way to use
> > > > > > that by drivers/modules is together with an mmu_notifier, and that's
> > > > > > all _GPL stuff.
> > > > >
> > > > > I also think it also needs to be renamed to explicitly break any existing
> > > > > users out of tree or int the submission queue.
> > > >
> > > > Ok I looked at the mmu notifier locking again and noticed that
> > > > mm->subscriptions has its own spinlock. Since there usually shouldn't
> > > > be a huge pile of these I think it's feasible to check for the mmu
> > > > notifier in follow_pfn. And that would stuff this gap for good. I'll
> > > > throw that on top as a final patch and see what people think.
> > >
> > > Probably the simplest is to just check mm_has_notifiers() when in
> > > lockdep or something very simple like that
> >
> > lockdep feels wrong, was locking more at CONFIG_DEBUG_VM. And since
> > generally you only have 1 mmu notifier (especially for kvm) I think we
> > can also pay the 2nd cacheline miss and actually check the right mmu
> > notifier is registered.
>
> Need to hold the lock to check that and there are two ways to register
> notifiers these days, so it feels to expensive to me.

Uh I mixed stuff up all along, struct mmu_notifier *subcription that
all the mmu notifier users use has the ->mm pointer we want right
there. That's good enough I think.

Now I'm kinda lost in kvm code trying to wire it through, but it's
looking ok-ish thus far :-)
-Daniel

> CH's 'export symbol only for kvm' really does seem the most robust way
> to handle this though.
>
> Jason



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
