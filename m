Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50058293E5F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 16:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7556ECD3;
	Tue, 20 Oct 2020 14:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8E66ECA8;
 Tue, 20 Oct 2020 14:13:29 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i1so2354563wro.1;
 Tue, 20 Oct 2020 07:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lPduyuxLbnNllpgP2V2Es26ID1Kul6jDVcjp8m/z5tY=;
 b=QcseFjYifB/nVwGx8PCygt1Vws+vwLnAZoZnY7eb+iBfLZPjf+93MuL4oIrSF3TqfC
 t69uXmycEpmZ8Azg+sKG9GWz/Am2OTJu/qeKLFSlY9WSSG1cfk2uOPA9NiCPb4DQMqYl
 6fapEZnNZXGx8L+uJXYUcMlF5Hyeqsy9sMoB1D8noPcM7CejcLlnPih2gDvfpZPepWwl
 7vpQT6YplrXfqnr3EkcipvsyhOeZjoxjrC3zt6VHeuH+YO6rdtoy9c8ozGhzw158resj
 12A2r+FvK90i6Alpn0wYzxLn7zMstl6o+V1AyDsy0DMZwitTVKQxEBQdxNMC7jqOspGy
 2hAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lPduyuxLbnNllpgP2V2Es26ID1Kul6jDVcjp8m/z5tY=;
 b=nM0dzZKBv/Y398RjbcaeO7a4/MNbFD9L+CsxQ8OAjujY2syhO+n/yHwrMHB+1P45Io
 glGsyJ7m4+JSJO5yKevLe+HBmm0BS4OcbGdK7xlSsmzCdPsuTMjZlzilB33mtdSRn5Eq
 bWMzpiXEC9HWeq7TayGugoA+/2RLUgVtd+DZjaCoYks0Xhg9us/dFQjUxEY3XlTRf8U6
 n9txLxvtOMxekcHcKfNqJY4AFth0uKEee4MP4VKLwcLkBxjCLA6oUjpXcVvZXnXa02O8
 43f9RGcciiqVHmyh/3jyhlHsdc1xDwUxmVr3HsI9iKq+Lj7Tb1BiRc2G5SCBnp9cPvJM
 Z7ZA==
X-Gm-Message-State: AOAM530Axa2j2JPgcNgZs9Um0O+fqZ6PiKuZG+Tr9Dou6dEpeGra0ONV
 fAc6+HoToXoHz1OCbbCTVZuRMHkD8YrfM/wo0Uo=
X-Google-Smtp-Source: ABdhPJwiIFJyn3Q5AIFqYLZqNCyx2EQe+Sgocwvo1SpEVzuITf+JiH5ahXbfSyscCtrJiTVAeTVSlYpIvlkgFI7GjVc=
X-Received: by 2002:a5d:640d:: with SMTP id z13mr3657378wru.28.1603203208025; 
 Tue, 20 Oct 2020 07:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-8-robdclark@gmail.com>
 <20201012143555.GA438822@phenom.ffwll.local>
 <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7>
 <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
In-Reply-To: <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 Oct 2020 07:13:16 -0700
Message-ID: <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, "Menon, Nishanth" <nm@ti.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 20, 2020 at 4:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 20-10-20, 12:56, Daniel Vetter wrote:
> > Yeah that's bad practice. Generally you shouldn't need to hold locks
> > in setup/teardown code, since there's no other thread which can
> > possible hold a reference to anything your touching anymore. Ofc
> > excluding quickly grabbing/dropping a lock to insert/remove objects
> > into lists and stuff.
> >
> > The other reason is that especially with anything related to sysfs or
> > debugfs, the locking dependencies you're pulling in are enormous: vfs
> > locks pull in mm locks (due to mmap) and at that point there's pretty
> > much nothing left you're allowed to hold while acquiring such a lock.
> > For simple drivers this is no issue, but for fancy drivers (like gpu
> > drivers) which need to interact with core mm) this means your
> > subsystem is a major pain to use.
> >
> > Usually the correct fix is to only hold your subsystem locks in
> > setup/teardown when absolutely required, and fix any data
> > inconsistency issues by reordering your setup/teardown code: When you
> > register as the last step and unregister as the first step, there's no
> > need for any additional locking. And hence no need to call debugfs
> > functions while holding your subsystem locks.
> >
> > The catch phrase I use for this is "don't solve object lifetime issues
> > with locking". Instead use refcounting and careful ordering in
> > setup/teardown code.
>
> This is exactly what I have done in the OPP core, the locks were taken
> only when really necessary, though as we have seen now I have missed
> that at a single place and that should be fixed as well. Will do that,
> thanks.

I do have an easy enough way to repro the issue, so if you have a
patch I can certainly test it.

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
