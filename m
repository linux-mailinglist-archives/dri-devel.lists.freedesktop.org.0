Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688CA3CFCB4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 16:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DACB89C9A;
	Tue, 20 Jul 2021 14:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B35899BB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 14:53:41 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 a17-20020a9d3e110000b02904ce97efee36so9993080otd.7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 07:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j09lu3sICtnVWYbFQVf04X58J7J9DzrYfN54qh1JeP8=;
 b=ImwZmUTbQ1ngxEuIoZFjF/bP/zahZJ+7NJ9/6qY4DJQB/hYLzUuloIM75qHIeXH6dV
 Q6AOIDxTD7W9bj6TOp1x4KTmlk0CDYTUrLVPn/k8bkZR9FDj0tjR9d+g/WuRjiF65llR
 nEuw6sCuWe9aKfWNnjgUEPREI/MT4WRg85yTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j09lu3sICtnVWYbFQVf04X58J7J9DzrYfN54qh1JeP8=;
 b=VNOxND0AC2GfWo04Rto3nQbUpqiuJ6FfuVGfBpn1JBmu+uhYK8RKxV/RN+mG/X8pvZ
 aArDQBE3f+Pcjv64HzuXnGtAp2YSUIyukoF9hSNaV6zQ3isf/G+rG2+7SK1jR0NTrA4P
 oek78KLODwqvGFUoK3atejuVbIeYELOnpZRZdVJRq7v5XU0RUZLElsd3C5lj74hN0Vla
 kQ1JcwKFR5W7oRQ+i6Ncz1n33Zb48A7iI+Cz6A+mgEqvH0d0bCjTpRZ6ny8fdzUJH60g
 UHLI5ycDDbgWGQRvR6NMB3XULlgspsqRBUylXQ3E2wHeHqARn76dV5g0E4hiBO52pc8w
 N8xw==
X-Gm-Message-State: AOAM531YIjAr/Vg+LLkTEszve+sugFLEkk0JHyYsxVoOU32+JF+5LPcS
 0ZPIQqJscGazu9YV6OAZii6rUL7hBFmqTdIZykRwKQ==
X-Google-Smtp-Source: ABdhPJzl9J0lkEu4CIIjY+U4b76K2eGMh6WUo5jGAXXEoYBh2685zCiCh40ygbBUtWz6N55Q1gllGQQLiVPua84eQ6A=
X-Received: by 2002:a05:6830:2802:: with SMTP id
 w2mr21307426otu.303.1626792820912; 
 Tue, 20 Jul 2021 07:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210714145804.2530727-1-geert@linux-m68k.org>
 <YO8CT+Hcw1wfhnH5@ravnborg.org>
 <CAMuHMdVjXhTE2x8mRrinmh9CCrdXQr+BYPfP-peaZ4AsLwsaaA@mail.gmail.com>
In-Reply-To: <CAMuHMdVjXhTE2x8mRrinmh9CCrdXQr+BYPfP-peaZ4AsLwsaaA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 20 Jul 2021 16:53:29 +0200
Message-ID: <CAKMK7uGpmQ3=OB52RYFgJoH7FWwhgx1t-TcSwpwjHPMWcyRd0w@mail.gmail.com>
Subject: Re: [PATCH resend 0/5] video: fbdev: ssd1307fb: Optimizations and
 improvements
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 8:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Sam,
>
> On Wed, Jul 14, 2021 at 5:27 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > On Wed, Jul 14, 2021 at 04:57:59PM +0200, Geert Uytterhoeven wrote:
> > > This patch series optimizes console operations on ssd1307fb, after the
> > > customary fixes and cleanups.
> >
> > What is required to to have a drm driver that could do the same?
>
> Add monochrome support to DRM?

I think the bits that are missing for that are
- wiring up the conversion from R* formats to their fbdev counterparts
in the emulation helper (if you want to support userspace sending the
native format directly through fbdev

Everything else is there and we have drivers doing this, e.g.
drm/tiny/repaper.c.
-Daniel

>
> > Note: I will take a look at the patches a bit later.
>
> TIA!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
