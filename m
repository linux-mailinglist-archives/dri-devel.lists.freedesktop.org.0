Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A665F217DB5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 05:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CD26E852;
	Wed,  8 Jul 2020 03:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B4189D40
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 03:43:42 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id h13so15377190otr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 20:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mHwnZGqBxO1eR5fw/gOLrflI6sKMZmZB5dQJW/fz1OI=;
 b=Fe+Nkt75c5SHX6EoJc25ohkfwpVvt9Shez4gGJsFcnlofCj1p4EV0/9LYeXnB7Ps5I
 GbuUp7Z9dTQ77ECCS2E3WkR/9ObL4djO5nw+5lALHOqtF+X3XwCoWSAyNqBy41djgYc+
 E36Ge2uQyBowWhOaERpqgUrExPkfmEUp60YAiYcfYIoCEJ4GxhSXJM4C44UUVdAKgptU
 BzkgjU5yxVVL/jD+u5cU4WT57KieNFDZ/83O+CbyRoYpVJ5FSBPy6+vLcAmH+5aLHsrU
 2d644BAm8cYMwpkzlShwpkcSY0FWHEBC8SU+QSuKgaTjXfzcJJnkF3rYniKnfCr8PmW8
 LRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mHwnZGqBxO1eR5fw/gOLrflI6sKMZmZB5dQJW/fz1OI=;
 b=sJsVLevBGgB+ARHtUOyjs5/btqYGn5kbyPyAnABVaWucaYikr+bZfIxF8/FnG+JlVC
 EiKfR3DjvFHcoNW7cL3x9iNxAIpWvkp5C9KaLke+ObSrL01alEU4ziSGq6fTeJXF+OhV
 QwtjTUyNCPw6hhzgwvMEqNJhQtNS49+9SbswfR/3L3CtGT6A4v8GtiFN58BzmMIM4FoM
 jDTBI9Gcocj++/yCYmO9OwM+gyHdWplROqTGBxfMKkJPeSyzkoTqzmEORJORKmRKvYFM
 OvDdUvFa7YdFNSXNwbABIiq04Za/7yDAWmKlrkdGycQ1xkC8hl/E42Woa46Siw/6DCOz
 rB7g==
X-Gm-Message-State: AOAM53044wBJqxP8vybKk1sVYagg2wQa8/511lWiBl6fbxGDXL3p9KAs
 J0gclTwy2rWWhymt4V2S1YH+PjNMzBDJsl0fomqHaA==
X-Google-Smtp-Source: ABdhPJzAu9QJrh4zqPuK1ULgvhkk3S7kmolCzNiGAneauQgVnQWUl8xkvWerju6/BQBeQKcs2e83J8fINMSb4CvYdms=
X-Received: by 2002:a9d:7303:: with SMTP id e3mr40868563otk.221.1594179821275; 
 Tue, 07 Jul 2020 20:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
 <20200414142810.GA958163@kroah.com>
 <CALAqxLX-SUhHPH6ewt-s9cEMc8DtMTgXem=JruAkLofuJf1syg@mail.gmail.com>
 <20200416102508.GA820251@kroah.com>
 <20200420082207.ui7iyg7dsnred2vv@wittgenstein>
 <CALAqxLW-txNEqW=P_9VTxvOVu_fgpjzHHDbR5BhtpYwhg1SXgw@mail.gmail.com>
 <20200421080544.GA611314@kroah.com> <20200703070403.GB2221524@kroah.com>
In-Reply-To: <20200703070403.GB2221524@kroah.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 7 Jul 2020 20:43:30 -0700
Message-ID: <CALAqxLUHT=CGNxffz+3G-bUNc2FM_TawDrymFN+S=ZiPcM9pkg@mail.gmail.com>
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Christian Brauner <christian@brauner.io>,
 Anders Pedersen <anders.pedersen@arm.com>, Laura Abbott <laura@labbott.name>,
 Joel Fernandes <joel@joelfernandes.org>,
 "Darren Hart \(VMware\)" <dvhart@infradead.org>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 Laura Abbott <labbott@redhat.com>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian.brauner@ubuntu.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 3, 2020 at 12:03 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Tue, Apr 21, 2020 at 10:05:44AM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Apr 20, 2020 at 01:03:39PM -0700, John Stultz wrote:
> > > The dmabuf heaps have been in an official kernel now for all of three
> > > weeks. So yea, we can "delete [ION] and see who even notices", but I
> > > worry that may seem a bit like contempt for the folks doing the work
> > > on transitioning over, which doesn't help getting them to participate
> > > within the community.
> >
> > But they aren't participating in the community today as no one is
> > touching the ion code.  So I fail to see how keeping a dead-end-version
> > of ion in the kernel tree really affects anyone these days.
>
> So, any thoughts here?  What's the timeline for ion being able to be
> removed that you are comfortable with?

Sorry for the slow reply.  So my earlier plan was to drop it after the next LTS?

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
