Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FE1290E0C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 01:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CF66F3DA;
	Fri, 16 Oct 2020 23:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64636F3DA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 23:15:46 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id n15so4044382otl.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 16:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z/utRDTKVHmHoEv/2/0Wo96JPENEebgv5nLtf2BjNsM=;
 b=Oi+V1WJt62DGA+OLvUtpmMrFw9shQt3hUS/kNEujvoDH0S+ng6vAYPzCIgge+f3w9u
 TKWiYzRhkNSA9GoKq34ilGiHvwx6EY6aftODB89USCCvqSBrOF9Ahb1YH6AVXBZCgQig
 4DlUkffsXOsF1pIm13wAFD7dnXVaJqoYN2sqj94xan8ytJ2xtxnef5agl5SMLLqg4NgB
 QpAQQPmcmS3RUog/rS5HW2x/+33CWgbJZeTEULDKM2cMYyziRnQ50KtbeBtD/GX0MMx9
 fEvYXSp+sAAsczFNL8AvoNylNDa3YEDww1jbOh3ovT1X6SZKJrjCeHi3LzO3cklJhFnp
 KO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z/utRDTKVHmHoEv/2/0Wo96JPENEebgv5nLtf2BjNsM=;
 b=NiDI6skAcObpuWnXaOPZm2Jwk32Tl8BkcKo8jJOKQAoJDtTz4PmHnfA9bsm2JEUC0g
 f+gkm1g0Q2XjSvzbfoG8BAf4EolwukkqqErPqj+WJsRGfKk0maKwYb+Z82ePsLNu7IuG
 vwK2wjJXYtXVYOkWdy30jICcssP/fy75ulpFLRoEgAOXwaaqArm69VzwVvGhQlYKeaQI
 bClfNLMW5fnVzJ2LVaMT8EEBJ3kVdkwqVmobnoSiE+g0iDEt2Qjz29mmvI4mKbyuTEFl
 JxqV/0pvezhs9F3kRJaUbDMFqLXtQu6+8DI/U1zZIle11qCveqXypQ3laBlETN4kaIQq
 gA3A==
X-Gm-Message-State: AOAM532ZbPjJ88BVDpdWKsgx10PWkDoxeuxTTyemNWK6FiMEzR6v9geG
 lKG6ZUi2nIAlNkCiWX+GUE+OfxuxsDxDO6FLTW/EZg==
X-Google-Smtp-Source: ABdhPJx+Js3ydQFBUP7ACgCzkoV+mCC9MxMLL2meKWUMIA/Fue2cHeE5SzEFTuMIFXv2hDabWqdWiVicuLD7Dfqz5J4=
X-Received: by 2002:a05:6830:1082:: with SMTP id
 y2mr4127841oto.221.1602890146021; 
 Fri, 16 Oct 2020 16:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201003040257.62768-1-john.stultz@linaro.org>
 <20201003040257.62768-8-john.stultz@linaro.org>
 <20201008115101.4qi6wh3hhkb6krg5@DESKTOP-E1NTVVP.localdomain>
 <CALAqxLWrbgHoh=BCnuB4US77AOPMYmgGrE85WT6DYnEV-bad-A@mail.gmail.com>
In-Reply-To: <CALAqxLWrbgHoh=BCnuB4US77AOPMYmgGrE85WT6DYnEV-bad-A@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 16 Oct 2020 16:15:32 -0700
Message-ID: <CALAqxLUQkg1uDdLXoP4W7McxQUwFgsncnMxJSOE_VZ4dRRpzFg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
To: Brian Starkey <brian.starkey@arm.com>
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
Cc: nd <nd@arm.com>, Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 16, 2020 at 12:03 PM John Stultz <john.stultz@linaro.org> wrote:
> On Thu, Oct 8, 2020 at 4:51 AM Brian Starkey <brian.starkey@arm.com> wrote:
> > On Sat, Oct 03, 2020 at 04:02:57AM +0000, John Stultz wrote:
> > > @@ -426,6 +487,16 @@ static int system_heap_create(void)
> > >       if (IS_ERR(sys_heap))
> > >               return PTR_ERR(sys_heap);
> > >
> > > +     exp_info.name = "system-uncached";
> > > +     exp_info.ops = &system_uncached_heap_ops;
> > > +     exp_info.priv = NULL;
> > > +
> > > +     sys_uncached_heap = dma_heap_add(&exp_info);
> > > +     if (IS_ERR(sys_uncached_heap))
> > > +             return PTR_ERR(sys_heap);
> > > +
> >
> > In principle, there's a race here between the heap getting registered
> > to sysfs and the dma_mask getting updated.
> >
> > I don't think it would cause a problem in practice, but with the API
> > as it is, there's no way to avoid it - so I wonder if the
> > dma_heap_get_dev() accessor isn't the right API design.
>
> Hrm.  I guess to address your concern we would need split
> dma_heap_add() into something like:
>   dma_heap_create()
>   dma_heap_add()
>
> Which breaks the creation of the heap with the registering it to the
> subsystem, so some attributes can be tweaked inbetween?

Looking at this some more, this approach isn't going to work. We
create the device and then we call dma_coerce_mask_and_coherent() on
it, but as soon as the device is created it seems possible for
userland to directly access it. Again, though, as you mentioned this
isn't terribly likely in practice.

The best thing I can think of for now is to have the uncached heap's
allocate pointer initially point to a dummy function that returns
EBUSY and then after we update the dma mask then we can set it to the
real alloc.  I'll go with that for now, but let me know if you have
other suggestions.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
