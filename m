Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFF91B1690
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 22:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2578923A;
	Mon, 20 Apr 2020 20:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C788923A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 20:03:50 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id m18so9258113otq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 13:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QmIL5crnJ6coQ/xisfoITs7FajvHe0i8ibpe9qH1tOw=;
 b=xuIILliRNJohVGgFgY8Ms3DxS6dM2StIfONK2qFe0AJUBtvHWTQ+PuLfZ8iVFAaLyl
 FqlWJBi359Otp3AFIB7rdOUDIzzrDAK0yNelRgxBIzrNdfPIjMaIokCtpSNpP2g4X8/V
 2X04SfMv9FkywwCay+XPYQCQmO4Lckm5nPdKUlGRnLQS1AHH2Vj3XqXkvufoH19haXXQ
 ih3EaGimgqsAXoyr7rpJC2k3/5hdLXkwT9rxvWl1xgge15HPAPQ36dA9OgkKz25jB429
 miykesCoC5NyBfgxteOC6N+LQIber5p7oZtX01rwDBFEnvh0pWgkqXfjEQvSTbmavZ+3
 LK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QmIL5crnJ6coQ/xisfoITs7FajvHe0i8ibpe9qH1tOw=;
 b=hc7VD8XZgNcwsLcNFfO/1+vR61Hl59gsKSxXYb0l3xGl1lgcxE4oU2go11ChD5a4C2
 3xe06OC9omIFVe+FZKkxdiDoZBa0v3gzkUgO5ovNEfCmmTb6vUF6kES/rhANNArkd5xD
 bwcTlm0W9Y1p/y0q2DL18Ye9MH4Ur8IFbjqxlc9dD1B+w847VsxMpi6Scnw6UQacdPh7
 dAxC3rGHSKmcTxw3B8I/gc6O2HlBmRK5vTvSyHGaQdzzrsICxqD3AUlSiztcNsBlMoTe
 /uPf+t51kE2/cREoN2qwuRpsUXcU2gBKec1MV7P1e1GDtUYQjHl+9ssf9nSLdzNKWe0v
 52WQ==
X-Gm-Message-State: AGi0Pua1zvHVFtUr27ZDaMQ8wsGbjG+buCaZvBLqp8bNsYyAH7LTyaDz
 3p4LZy8b1DQKCCkX2tjmxVB16lB1AlKKDuPMpd5zEA==
X-Google-Smtp-Source: APiQypK2nqgSukevEMOkrgEiY+Twkm4ExNtv93iL2MCVA6EiSnE9I0/kG/gRCZfwm2sf3tRai+xV044YMqqalBHAyGM=
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr10406884otc.221.1587413029451; 
 Mon, 20 Apr 2020 13:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
 <20200414142810.GA958163@kroah.com>
 <CALAqxLX-SUhHPH6ewt-s9cEMc8DtMTgXem=JruAkLofuJf1syg@mail.gmail.com>
 <20200416102508.GA820251@kroah.com>
 <20200420082207.ui7iyg7dsnred2vv@wittgenstein>
In-Reply-To: <20200420082207.ui7iyg7dsnred2vv@wittgenstein>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 20 Apr 2020 13:03:39 -0700
Message-ID: <CALAqxLW-txNEqW=P_9VTxvOVu_fgpjzHHDbR5BhtpYwhg1SXgw@mail.gmail.com>
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
To: Christian Brauner <christian.brauner@ubuntu.com>
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
Cc: driverdevel <devel@driverdev.osuosl.org>, nd <nd@arm.com>,
 Todd Kjos <tkjos@android.com>, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laura Abbott <laura@labbott.name>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Anders Pedersen <anders.pedersen@arm.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Joel Fernandes <joel@joelfernandes.org>,
 "Darren Hart \(VMware\)" <dvhart@infradead.org>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 Laura Abbott <labbott@redhat.com>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 20, 2020 at 1:22 AM Christian Brauner
<christian.brauner@ubuntu.com> wrote:
> On Thu, Apr 16, 2020 at 12:25:08PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Apr 14, 2020 at 09:41:31PM -0700, John Stultz wrote:
> > > But I do think we can mark it as deprecated and let folks know that
> > > around the end of the year it will be deleted.
> >
> > No one ever notices "depreciated" things, they only notice if the code
> > is no longer there :)
> >
> > So I'm all for just deleting it and seeing who even notices...
>
> Agreed.

I mean, I get there's not much love for ION in staging, and I too am
eager to see it go, but I also feel like in the discussions around
submitting the dmabuf heaps at talks, etc, that there was clear value
in removing ION after a short time so that folks could transition
being able to test both implementations against the same kernel so
performance regressions, etc could be worked out.

I am actively getting many requests for help for vendors who are
looking at dmabuf heaps and are starting the transition process, and
I'm trying my best to motivate them to directly work within the
community so their needed heap functionality can go upstream. But it's
going to be a process, and their first attempts aren't going to
magically land upstream.  I think being able to really compare their
implementations as they iterate and push things upstream will help in
order to be able to have upstream solutions that are also properly
functional for production usage.

The dmabuf heaps have been in an official kernel now for all of three
weeks. So yea, we can "delete [ION] and see who even notices", but I
worry that may seem a bit like contempt for the folks doing the work
on transitioning over, which doesn't help getting them to participate
within the community.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
