Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0394B5B06
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 21:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B594B10E2D7;
	Mon, 14 Feb 2022 20:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C3110E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 20:37:24 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z14so11865437lfu.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 12:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wAGH315FsgjXdEGosIxU9yIWVg26bgKxObDK7qxcQ9o=;
 b=EU778RaLDa/8FhJux3O09PvW3/LCZKPXp2DEFIoy3E0/73tubhMvN6FLWVL/0bcIJW
 kmCnl5Rc6b20E+xTOO/KCGrPDECOpDCo/nXmeIOuENhZ10zOy0IF3Ph387b1C8fJzq5D
 +WjvseaeLKZ8mgXil65+h1q2t7pc8gvHirSGUwM9w31eIQ4CFgJL4tlDfb98dwjLGGaI
 oKjbNkxktCSCXTv4prlhEbo9s9sT7DZTHxj6OpsP3QwYf4mqyLx0SJJnVML5/95sQgyb
 lYEW9dTjF6nZxRSHVkN/BN9o2g2BHt5B8QNM0gL8UjDYHW8ypcP+fBvoFUxYojQxDjSt
 GgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wAGH315FsgjXdEGosIxU9yIWVg26bgKxObDK7qxcQ9o=;
 b=CYYPuwyZTWMzLzsKZ8J0Lqi+aCTMHvalHNVnhDDVwnR4AJCA6v+kPn09bwIhHhXJe9
 /7d1A1z8cqpgRh/pe00J4m/Bpu/c5soBJDXxAepg7sFBZ3bLcYG97k5b27qAqmwNm4yo
 xex6bZwrFuxa5huW+8DJaIo1e540bhT154gznpw5ZN4G261SBEbJVhVl0baSMq1aO8p4
 F56IS2/OkMaDiSiMxhSK4TcHY4j+gNBg8nfTuYeKCa5xCmjXRqJbnUG6bGWJV9tbDC/N
 pvqz/MLIMtnsh0QuQyvYK/q93Rb2Bp1OB9/g5wayI6ExDSkJvzW8BY/uAn2LLLk7orza
 URYg==
X-Gm-Message-State: AOAM533tf6nTNUgZ4F39Q7SHwqhDjwJRbjUqviHpb+z3AjOZ8/G7isz0
 4RKKVUpOHfZyTkNqIXpm4tP4aJgN4Q0AXQXCFNhOmQ==
X-Google-Smtp-Source: ABdhPJybrY+AtUQHWjp3j2rvRJhBPEQOOF5VWwSAKp+0WfViYgyz3tPMp/imOig+wlvQ20J5Rfsw3M7JV5CsRYOdaJU=
X-Received: by 2002:a05:6512:4012:: with SMTP id
 br18mr536955lfb.533.1644871042491; 
 Mon, 14 Feb 2022 12:37:22 -0800 (PST)
MIME-Version: 1.0
References: <20220211161831.3493782-1-tjmercier@google.com>
 <20220211161831.3493782-7-tjmercier@google.com> <Ygdfe3XSvN8iFuUc@kroah.com>
 <CAHRSSEwoJ67Sr_=gtSaP91cbpjJjZdOo57cfAhv3r-ye0da7PA@mail.gmail.com>
 <CAJuCfpHf=Ewm0e9kguY3MEGVHU_cyviVXByi0oQtq7kTtOOD=A@mail.gmail.com>
 <CAHRSSEzsn-EVKXTRfmpbPR9u0wNpdvdZoX64Tm_mB1DQMRSUPQ@mail.gmail.com>
In-Reply-To: <CAHRSSEzsn-EVKXTRfmpbPR9u0wNpdvdZoX64Tm_mB1DQMRSUPQ@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 14 Feb 2022 12:37:11 -0800
Message-ID: <CALAqxLVeLsv9ESCL2EoZQ8-tRgp0V+tmdYbkyakFetf=ewTH+A@mail.gmail.com>
Subject: Re: [RFC v2 6/6] android: binder: Add a buffer flag to relinquish
 ownership of fds
To: Todd Kjos <tkjos@google.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kenny.Ho@amd.com,
 Jonathan Corbet <corbet@lwn.net>, Suren Baghdasaryan <surenb@google.com>,
 Laura Abbott <labbott@redhat.com>, linux-media <linux-media@vger.kernel.org>,
 Todd Kjos <tkjos@android.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Tejun Heo <tj@kernel.org>, cgroups mailinglist <cgroups@vger.kernel.org>,
 Martijn Coenen <maco@android.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 12:19 PM Todd Kjos <tkjos@google.com> wrote:
> On Mon, Feb 14, 2022 at 11:29 AM Suren Baghdasaryan <surenb@google.com> wrote:
> > On Mon, Feb 14, 2022 at 10:33 AM Todd Kjos <tkjos@google.com> wrote:
> > >
> > > Since we are creating a new gpu cgroup abstraction, couldn't this
> > > "transfer" be done in userspace by the target instead of in the kernel
> > > driver? Then this patch would reduce to just a flag on the buffer
> > > object.
> >
> > Are you suggesting to have a userspace accessible cgroup interface for
> > transferring buffer charges and the target process to use that
> > interface for requesting the buffer to be charged to its cgroup?
>
> Well, I'm asking why we need to do these cgroup-ish actions in the
> kernel when it seems more natural to do it in userspace.
>

In case its useful, some additional context from some of the Linux
Plumber's discussions last fall:

Daniel Stone outlines some concerns with the cgroup userland handling
for accounting:
  https://youtu.be/3OqllZONTiQ?t=3430

And the binder ownership transfer bit was suggested here by Daniel Vetter:
  https://youtu.be/3OqllZONTiQ?t=3730

thanks
-john
