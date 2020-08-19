Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA424AFB6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F856E8BE;
	Thu, 20 Aug 2020 07:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60F76E20C;
 Wed, 19 Aug 2020 10:48:28 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id c4so18644246otf.12;
 Wed, 19 Aug 2020 03:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JFCS1wWCaky01GdCrS5KhBNLCXiKvx8eu/9Q1CWY57o=;
 b=SAlnLFGsaJJ2xUQvXdp6/REunLAQzaLpmNpCPkhdMyKVNOL4zXoJc+uTpvFb1PLXQe
 nN8aQpwx9KlR0QpjA0U0Eq9qCAcvJ1BkG1Pmvfae+wF16AUCkU8W0GDQheD/o4B1VrUX
 PelVL5WwDQloIppGpod8O4LcRauK/SLT0vBKv+BhPM4L1DU+6rZBrJ0Dt0oV8Ce4u200
 wfYajuI8k/buRZ/KOQgJS9xFj6qU+vsS6Mi/Pic5cr7hyqCbNaPaM64dCQ32B92C7zpm
 twdkgIcY8FJxVqqD5N4bDX/Yu8aavznJiTYE5JD98MkyaozlEe8FkOVjNVcv9NBfu1pV
 5Fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JFCS1wWCaky01GdCrS5KhBNLCXiKvx8eu/9Q1CWY57o=;
 b=GUMsyfQqIZ6zOBzFK7tEI90Z2kg6sB+ZnmtgXa6oec6MFTjKosl8PU5j+iPtgVEU+e
 1MhoGPWPV3io3UfKeX6yDOpSQ4xFdKW0UjfC9Q7pjx4O17V6b6MHFQQHZzz1Qd5UiHyR
 vdpJTjQCHhj3h7/9lm6WC31v5CS3MiUmpsAnMlQXDfZTgIrQaC8hytl9xaxxJQPzPf/+
 dtu2+YRGHjNINXPAy2BYObcnRSS7K1pQ95UEbemHAgrrxz0i9QBu5HCWrMPKV/88NYnk
 PF9xyZZ9NKJ1RJNvqolCiGoBWbNBMUJ2vtwe7LM+GH4SB47Vqf9Sf0pRVobEXqIms4bM
 8lZA==
X-Gm-Message-State: AOAM533mAPV+h6C45DpPsLukl0sF8EjRhz4s95kdtNAaSQt6vL7yAaqW
 qZ6kmILNrZP9dUFZsW+z0vuKbGbzPEDv5De2Q3o=
X-Google-Smtp-Source: ABdhPJwYTK+IRxToH0hqhLtJ7NIIqDs8lKmtEJkzNzElCKB5MQaF3rOwIOaAYWCB8rMlfnOVuvrNcqGFlbqr+yW4gKM=
X-Received: by 2002:a9d:128c:: with SMTP id g12mr17527086otg.242.1597834108000; 
 Wed, 19 Aug 2020 03:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200817091617.28119-1-allen.cryptic@gmail.com>
 <20200817091617.28119-2-allen.cryptic@gmail.com>
 <b5508ca4-0641-7265-2939-5f03cbfab2e2@kernel.dk>
 <202008171228.29E6B3BB@keescook>
 <161b75f1-4e88-dcdf-42e8-b22504d7525c@kernel.dk>
 <202008171246.80287CDCA@keescook>
 <df645c06-c30b-eafa-4d23-826b84f2ff48@kernel.dk>
 <1597780833.3978.3.camel@HansenPartnership.com>
 <202008181309.FD3940A2D5@keescook>
In-Reply-To: <202008181309.FD3940A2D5@keescook>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 19 Aug 2020 16:18:16 +0530
Message-ID: <CAOMdWSLi-aUeKDN8Xn-X2uW_LmWsp2n=NL3dPGiUbQKm_MxcAg@mail.gmail.com>
Subject: Re: [PATCH] block: convert tasklets to use new tasklet_setup() API
To: Kees Cook <keescook@chromium.org>
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 linux-atm-general@lists.sourceforge.net, manohar.vanga@gmail.com,
 airlied@linux.ie, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>, kys@microsoft.com,
 anton.ivanov@cambridgegreys.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 maximlevitsky@gmail.com, richard@nod.at, deller@gmx.de,
 jassisinghbrar@gmail.com, 3chas3@gmail.com, intel-gfx@lists.freedesktop.org,
 Jakub Kicinski <kuba@kernel.org>, mporter@kernel.crashing.org,
 jdike@addtoit.com, oakad@yahoo.com, s.hauer@pengutronix.de,
 linux-input@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, broonie@kernel.org,
 openipmi-developer@lists.sourceforge.net, mitch@sfgoth.com,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org, martyn@welchs.me.uk,
 dmitry.torokhov@gmail.com, linux-mmc@vger.kernel.org, sre@kernel.org,
 linux-spi@vger.kernel.org, alex.bou9@gmail.com,
 Allen Pais <allen.cryptic@gmail.com>, stefanr@s5r6.in-berlin.de,
 linux-ntb@googlegroups.com, Romain Perier <romain.perier@gmail.com>,
 shawnguo@kernel.org, David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > > > > > >
> > > > > > > > In preparation for unconditionally passing the
> > > > > > > > struct tasklet_struct pointer to all tasklet
> > > > > > > > callbacks, switch to using the new tasklet_setup()
> > > > > > > > and from_tasklet() to pass the tasklet pointer explicitly.
> > > > > > >
> > > > > > > Who came up with the idea to add a macro 'from_tasklet' that
> > > > > > > is just container_of? container_of in the code would be
> > > > > > > _much_ more readable, and not leave anyone guessing wtf
> > > > > > > from_tasklet is doing.
> > > > > > >
> > > > > > > I'd fix that up now before everything else goes in...
> > > > > >
> > > > > > As I mentioned in the other thread, I think this makes things
> > > > > > much more readable. It's the same thing that the timer_struct
> > > > > > conversion did (added a container_of wrapper) to avoid the
> > > > > > ever-repeating use of typeof(), long lines, etc.
> > > > >
> > > > > But then it should use a generic name, instead of each sub-system
> > > > > using some random name that makes people look up exactly what it
> > > > > does. I'm not huge fan of the container_of() redundancy, but
> > > > > adding private variants of this doesn't seem like the best way
> > > > > forward. Let's have a generic helper that does this, and use it
> > > > > everywhere.
> > > >
> > > > I'm open to suggestions, but as things stand, these kinds of
> > > > treewide
> > >
> > > On naming? Implementation is just as it stands, from_tasklet() is
> > > totally generic which is why I objected to it. from_member()? Not
> > > great with naming... But I can see this going further and then we'll
> > > suddenly have tons of these. It's not good for readability.
> >
> > Since both threads seem to have petered out, let me suggest in
> > kernel.h:
> >
> > #define cast_out(ptr, container, member) \
> >       container_of(ptr, typeof(*container), member)
> >
> > It does what you want, the argument order is the same as container_of
> > with the only difference being you name the containing structure
> > instead of having to specify its type.
>
> I like this! Shall I send this to Linus to see if this can land in -rc2
> for use going forward?
>

Cool, I shall wait for it to be accepted and then spin out V2 with cast_out()

-- 
       - Allen
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
