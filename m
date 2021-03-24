Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868383473E6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 09:47:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F493897EE;
	Wed, 24 Mar 2021 08:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2DB897EE
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:47:17 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id e1so223207uaa.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 01:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FX4YhcRrTtOWfNjjlu3aaCWI7W5SveqcMlD13s6eqt4=;
 b=Ntt4SMPQymZfscZTvD2i7ScS0x9fnWiodtrpdnh32ZiuREFghZ2XnNIkr76yyMJQdY
 XraqiJzETa0hLNLerINEKvy+aljAQ0oTDjrggMqv3oSVzX2V+XTq8UfPKgMrDu+nbC1/
 AUBewkzWMROlhuY00oalR4TgDr2ikf3vx6hNtX+JvmUyYdp5QUfpRRbl0Sz62XJHouOJ
 pCA9Mw6yXE0EO+/9uPw8I3o0HXEsCV7rumipdeDktlT3/O+f2qzv4WmduzNUgt/jOdL0
 J0z1c2BSIbUtSVWoHz3M/Uj4LNaJDTCv9kRLC2WzD9Puc9FgxViOXvghdQFXYM44i2Ge
 OMyg==
X-Gm-Message-State: AOAM5302C0115FdvgugXcU7l/48R5HxxyOaHzms+1azfo1xcA1ImvHAb
 3PdYobj+06xSUCHwXsOfgm66SwuFz95w3A66Nqo=
X-Google-Smtp-Source: ABdhPJzP29xmBlDCp4PFhnPQFJUSoC4K4pGWei3p2zPlq3uAtPKdMIyVbFffA1UwuYpP1Imr6vLGx3hKMvY6yrJqsTQ=
X-Received: by 2002:ab0:6954:: with SMTP id c20mr895926uas.106.1616575636198; 
 Wed, 24 Mar 2021 01:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=UDd9LC-sMEk0hn10roeM+Cz6VNekcZomkQXLhfw0-4wA@mail.gmail.com>
In-Reply-To: <CAD=FV=UDd9LC-sMEk0hn10roeM+Cz6VNekcZomkQXLhfw0-4wA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Mar 2021 09:47:05 +0100
Message-ID: <CAMuHMdXarCH4rP56HA5hxZ5heyotMD+_KraHu5r35baOe=MHug@mail.gmail.com>
Subject: Re: [RFC PATCH 04/11] drm/bridge: ti-sn65dsi86: Use bitmask to store
 valid rates
To: Doug Anderson <dianders@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Tue, Mar 23, 2021 at 10:10 PM Doug Anderson <dianders@chromium.org> wrote:
> On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> >
> > The valid rates are stored in an array of 8 booleans. Replace it with a
> > bitmask to save space.
>
> I'm curious: do you have evidence that this does anything useful? I
> guess you're expecting it to save .text space, right? Stack usage and
> execution time differences should be irrelevant--it's not in a
> critical section and the difference should be tiny anyway. As far as
> .text segment goes, it's not obvious to me that the compiler will use
> fewer instructions to manipulate bits compared to booleans.
>
> Doing a super simple "ls -ah" on vmlinux (unstripped):
>
> Before: 224820232 bytes
> After: 224820376 bytes
>
> ...so your change made it _bigger_.   OK, so running "strip
> --strip-debug" on those:
>
> Before: 26599464 bytes
> After: 26599464 bytes

I've been surprised by the counter-intuitive impact of similar changes
before, too.  The result may also differ a lot between arm32 or arm64.

> ...so exactly the same. I tried finding some evidence using "readelf -ah":
>
> Before:
>   [ 2] .text             PROGBITS         ffffffc010010000  00020000
>        0000000000b03508  0000000000000000 WAX       0     0     65536
>   [ 3] .rodata           PROGBITS         ffffffc010b20000  00b30000
>        00000000002e84b3  0000000000000000 WAMS       0     0     4096
>
> After:
>   [ 2] .text             PROGBITS         ffffffc010010000  00020000
>        0000000000b03508  0000000000000000 WAX       0     0     65536
>   [ 3] .rodata           PROGBITS         ffffffc010b20000  00b30000
>        00000000002e84b3  0000000000000000 WAMS       0     0     4096
>
> Maybe you have some evidence showing an improvement? Ah, OK. I
> disassembled ti_sn_bridge_enable() and your patch saves 12 bytes, but
> I guess maybe alignment washes it out in reality...

Yes, arm64 is bad w.r.t. this.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
