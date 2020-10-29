Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6DF29E781
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 10:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066676E0A2;
	Thu, 29 Oct 2020 09:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAA26E0A2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 09:38:27 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id j21so1669124ota.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 02:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Egb29gKTqFSxWvJdyyI+gXsFyuWERrGbUzIe36GvMh0=;
 b=WN/T3qojfZLOiwWrcArWiy5sVDza4QAlNXW9uwA8epIyHde70y+LwP9IzcHYl+6ykJ
 TAk8UrMTzmau/HOuQondzD4ErZSwoLwV9gqj9wxMlA+Nc7EpAQq6Kw0NuRKGuGv3z2Q3
 wXk6V662Zo5+uF5oqJou8URYRaL/kPvUOFj5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Egb29gKTqFSxWvJdyyI+gXsFyuWERrGbUzIe36GvMh0=;
 b=buEwem7b7rgfWXY7GPCkBt6MrVyg0cBZas9CS8CcN1pihL8sCKTAuEDB7uOLGBeyuY
 OUsADd3KlPaAUAoh84mUA9s4K6LAB7WCu3F20xbJypzL00k6VYDibr1WTcoHBskQlv9b
 4FeQV40TfNlGRugw2pZ1iFp7Pu8oLFGmoyvyr30Bb5ZFaKZ0mCC47IJekF8Z0I1K9gIl
 6BUBlAxbiKTqe6iT1Ea04EzxDohuQZDCVgOp/a52Xc5829P1GWl8rmUA4lbU39kx+xH2
 RSNKcn6HSBp11PDzCAHObqGk09afaWa4EJInFn4vN9T6Ima9zpWOnAz1rW37IgAPlfMu
 3FjQ==
X-Gm-Message-State: AOAM531QlB31jf3P6SwyZc6Ok0CBH/pGKFe7DQXx/cMsTL10CiA3giV+
 bKGXMq/wDyn51MGIyYAuMjdMu/TVxY9pU8k15FSF2w==
X-Google-Smtp-Source: ABdhPJx7W4rK7T8Tetk1+e1/J1/olWsPDBEjgbzX/L+3bK6RKH7lBWpMwtzMdyCSKSKNvm+bdKwtPXqJrc1sPDUR5+Q=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id
 f28mr2715883ote.188.1603964307018; 
 Thu, 29 Oct 2020 02:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
 <20201029085749.GB25658@infradead.org>
 <CAKMK7uEV7sQ48w1Dd=WCY1r6LrY+aEq3ASnouOebQoo=Zr=CTQ@mail.gmail.com>
 <20201029092800.GA494@infradead.org>
In-Reply-To: <20201029092800.GA494@infradead.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 29 Oct 2020 10:38:16 +0100
Message-ID: <CAKMK7uG=R2372bVTK1Zh+P7uRd2QJSw5EgcJ6JJwVtNyJ7SJtQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] follow_pfn and other iomap races
To: Christoph Hellwig <hch@infradead.org>
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
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 10:28 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Oct 29, 2020 at 10:25:16AM +0100, Daniel Vetter wrote:
> > On Thu, Oct 29, 2020 at 9:57 AM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > Maybe I'm missing something, but shouldn't follow_pfn be unexported
> > > at the end of the series?
> >
> > kvm is a legit user and modular afaict. But since you can't use this
> > without an mmu_notifier anyway (or digging around in pagetable
> > locking), maybe it should be EXPORT_SYMBOL_GPL now at least?
>
> I think it should then take the notifier as an argument even if it isn't
> diretly used as a safety check, and get a new name describing it.

Hm so Jason and me discussed this, but e.g. the s390 is safe with with
just the pagetable locks. So we'd need two versions.

The more practical problem is that I haven't found a reasonable way to
check that a passed in mmu_notifier is registered against the mm we're
working on, and without that check it feels a bit silly. But if you
see how to do that I think we can do an EXPORT_SYMBOL_GPL follow_pfn
which takes the notifier, and an __follow_pfn for s390 and similar
internal code which isn't exported.

> EXPORT_SYMBOL_GPL is probably ok for now, but I'm drafting a new
> EXPORT_SYMBOL_FOR_MODULE() which will export symbols that can only be
> used by one specific module, with kvm being a prime user due to all
> the odd exports it requires that aren't really the kernel interface by
> any normal means.

Hm yeah that's another one. There's also some virt stuff that's
currently on unsafe_follow_pfn and needs to be switched over, and I
think that would also need an mmu notifier of some sorts to close the
gaps.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
