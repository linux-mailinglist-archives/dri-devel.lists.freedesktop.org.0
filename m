Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 919983BDDC5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 21:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB796E591;
	Tue,  6 Jul 2021 19:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DD06E591
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 19:06:45 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id b2so442937oiy.6
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 12:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cze9q/VE+a6yI42hd67oagAB5dC7U4ivnSzhtQwqaOI=;
 b=GPHRCG+aFrGscJLP0HYtzo9kfjEmTdwAcrvk9gEqOOYE+hLUV5ZCPdqyGPm8uAyTgp
 ihQtUO4cKxZnn63A3//koJf5ll5ptPP5S9JIwueh0JMCLVDmtojHXX/w7VjJlgmppj5n
 C6nun/eDPcyweXxnOUb4dT4rP5KZ+uny5SOwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cze9q/VE+a6yI42hd67oagAB5dC7U4ivnSzhtQwqaOI=;
 b=uB7cjHlfqr48lBQUKyrbxlJ29ge+XIRV77OjpBHmOD77iWcOPj1fZLaw0crHcAOpVC
 AsdfPZcDsNp0Hb/tSwT9wF2hpSf3EXoIrIhL9Y4idMnIz24azNfYOKiX1WMTChdAtoBl
 8P/HOWH70DPYvyvAdxR2olR8LXzzhklfHGFUb2t3Xszp9P7QZUWRMOO7LbrGHK2O/Y2g
 0vuK3cjt5QK2N8idvOHkU9Hiq3whsJAKxlCWLySY1NuZ49HBfmq7GQHqY7zcbQe96obg
 ifOsYoIdeqbbsaMshFDqmdUuAeCUqZFV3N4alWkXJE7MV01XUDiX0jieB45qPjhliCBu
 Jyyw==
X-Gm-Message-State: AOAM530EwBcyVySip4k3j2epuIP4l6paNOj3p4hBiKKWwL23ThmYckiP
 JgyLOqIkCJkK5QtWZyNhjUPzJatNGwzKn96j9g483g==
X-Google-Smtp-Source: ABdhPJyInYDir1RlqJeuNxLe17GHh3QXPCOEC6Z5TVykCU4Dmlj7zioQiTtgUQGFPOxVZCRMuBlEXkq+wdnMhGM+viw=
X-Received: by 2002:aca:eb43:: with SMTP id j64mr1571660oih.101.1625598404635; 
 Tue, 06 Jul 2021 12:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <CAFCwf10_rTYL2Fy6tCRVAUCf4-6_TtcWCv5gEEkGnQ0KxqMUBg@mail.gmail.com>
 <CAKMK7uEAJZUHNLreBB839BZOfnTGNU4rCx-0k55+67Nbxtdx3A@mail.gmail.com>
 <20210706142357.GN4604@ziepe.ca>
 <CAKMK7uELNzwUe+hhVWRg=Pk5Wt_vOOX922H48Kd6dTyO2PeBbg@mail.gmail.com>
 <20210706152542.GP4604@ziepe.ca>
 <CAKMK7uH7Ar6+uAOU_Sj-mf89V9WCru+66CV5bO9h-WAAv7Mgdg@mail.gmail.com>
 <20210706162953.GQ4604@ziepe.ca>
 <CAKMK7uGXUgjyjch57J3UnC7SA3-4g87Ft7tLjj9fFkgyKkKdrg@mail.gmail.com>
 <20210706183145.GT4604@ziepe.ca>
In-Reply-To: <20210706183145.GT4604@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 6 Jul 2021 21:06:33 +0200
Message-ID: <CAKMK7uEEPmr4voCp7dL4Kws08HSzq5iOGcwWvarw-Mj7X9WReA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
To: Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Christoph Hellwig <hch@lst.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 6, 2021 at 8:31 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Tue, Jul 06, 2021 at 07:35:55PM +0200, Daniel Vetter wrote:
> > Yup. We dont care about any of the fancy pieces you build on top, nor
> > does the compiler need to be the optimizing one. Just something that's
> > good enough to drive the hw in some demons to see how it works and all
> > that. Generally that's also not that hard to reverse engineer, if
> > someone is bored enough, the real fancy stuff tends to be in how you
> > optimize the generated code. And make it fit into the higher levels
> > properly.
>
> Seems reasonable to me
>
> > And it's not just nvidia, it's pretty much everyone. Like a soc
> > company I don't want to know started collaborating with upstream and
> > the reverse-engineered mesa team on a kernel driver, seems to work
> > pretty well for current hardware.
>
> What I've seen is that this only works with customer demand. Companies
> need to hear from their customers that upstream is what is needed, and
> companies cannot properly hear that until they are at least already
> partially invested in the upstream process and have the right
> customers that are sophisticated enough to care.
>
> Embedded makes everything 10x worse because too many customers just
> don't care about upstream, you can hack your way through everything,
> and indulge in single generation thinking. Fork the whole kernel for 3
> years, EOL, no problem!

It's not entirely hopeless in embedded either. Sure there's the giant
pile of sell&forget abandonware, but there are lots of embedded things
where multi-year to multi-decade support is required. And an upstream
gfx stack beats anything the vendor has to offer on that, easily.

And on the server side it's actually pretty hard to convince customers
of the upstream driver benefits, because they don't want or can't
abandon nvidia and have just learned to accept the pain. They either
build a few abstraction layers on top (and demand the vendor support
those), or they flat out demand you support the nvidia broprietary
interfaces. And AMD has been trying to move the needle here for years,
with not that much success.

> It is the enterprise world, particularly with an opinionated company
> like RH saying NO stuck in the middle that really seems to drive
> things toward upstream.
>
> Yes, vendors can work around Red Hat's No (and NVIDIA GPU is such an
> example) but it is incredibly time consuming, expensive and becoming
> more and more difficult every year.
>
> The big point is this:
>
> > But also nvidia is never going to sell you that as the officially
> > supported thing, unless your ask comes back with enormous amounts of
> > sold hardware.
>
> I think this is at the core of Linux's success in the enterprise
> world. Big customers who care demanding open source. Any vendor, even
> nvidia will want to meet customer demands.
>
> IHMO upstream success is found by motivating the customer to demand
> and make it "easy" for the vendor to supply it.

Yup, exactly same situation here. The problem seems to be a bit that
gpu vendor stubbornness is higher than established customer demand
even, or they just don't care, and so in the last few years that
customer demand has resulted in payment to consulting shops and hiring
of engineers into reverse-engineering a full driver, instead of
customer and vendor splitting the difference and the vendor
upstreaming their stack. And that's for companies who've done it in
the past, or at least collaborated on parts like the kernel driver, so
I really have no clue why they don't just continue. We have
well-established customers who do want it all open and upstream,
across kernel and userspace pieces.

And it looks like it's going to repeat itself a few more times
unfortunately. I'm not sure when exactly the lesson will sink in.

Maybe I missed some, but looking at current render/compute drivers I
think (but not even sure on that) only drm/lima is a hobbyist project
and perhaps you want to include drm/nouveau as not paid by customers
and more something redhat does out of principle. All the others are
paid for by customers, with vendor involvement ranging from "just
helping out with the kernel driver" to "pays for pretty much all of
the development". And still apparently that's not enough demand for an
upstream driver stack.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
