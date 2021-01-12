Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727D22F2A43
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885A76E123;
	Tue, 12 Jan 2021 08:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E3F6E123
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:47:08 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id q25so1563409oij.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D79yAvxFkBso3i6vK6yIO4bEcxdNj8cx5BWEVmuRDLo=;
 b=RDRtSM9wHCQ+HrFWfk1FfBDsD/Q7QXFzOQS4txuMgdaEfJ9aG+XZj0Bf8DO2Brrt+f
 ECxMmtNqRTwj2ycQrLumTtd8uKs57RzcaArHOdIe0WYWOr3RVjRNXnUuZv7QdOzIB/bE
 YM0lWR03yWPjyLY+YqaV7+UPB+nGM/2PWRs7I3lWflIzmNwWilQFXlei6lhS+DxGcmte
 vrgLy2Efqmi5xkF4+5X5b8OIQ/576PpL/Bis8GmwnFd5iam4x6yzNhailorYQXouzdRS
 8LFpEZIBLue2vleYS5vULe09r46hx2e19AkdujZeeAZ/TjaMNQe4tA1K5t1VOdiL+zCv
 /F0g==
X-Gm-Message-State: AOAM531z/Yubg1lA0v8HnyghSdhNbUcNVsdibgamnKSZKc3x7jjq4e5q
 fce21vPQFrc46xRJsd4sbZYShrA+l3fwXrC1ajs=
X-Google-Smtp-Source: ABdhPJwpEXUQy50oYlHo5BtbF9034MvmIwzn2LxzbtoY0yQ++MTL5s0bBXWpwFRvz+Lqlo3gwrddRJosW6EMo6hPB/4=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr1719601oia.148.1610441227636; 
 Tue, 12 Jan 2021 00:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20210111125702.360745-1-geert+renesas@glider.be>
 <X/0nmQ/XBpj6PJAh@pendragon.ideasonboard.com>
In-Reply-To: <X/0nmQ/XBpj6PJAh@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Jan 2021 09:46:56 +0100
Message-ID: <CAMuHMdVaJgHv0kRSLaFfPzD5hiJKQCg30D=7SAv0cPwR9j5DZw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: Avoid potential multiplication
 overflow on 32-bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Tue, Jan 12, 2021 at 5:38 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jan 11, 2021 at 01:57:02PM +0100, Geert Uytterhoeven wrote:
> > As nwl_dsi.lanes is u32, and NSEC_PER_SEC is 1000000000L, the second
> > multiplication in
> >
> >     dsi->lanes * 8 * NSEC_PER_SEC
> >
> > will overflow on a 32-bit platform.  Fix this by making the constant
> > unsigned long long, forcing 64-bit arithmetic.
> >
> > While iMX8 is arm64, this driver is currently used on 64-bit platforms
> > only, where long is 64-bit, so this cannot happen.  But the issue may
> > start to happen when the driver is reused for a 32-bit SoC, or when code
> > is copied for a new driver.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> > +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> > @@ -195,7 +195,7 @@ static u32 ps2bc(struct nwl_dsi *dsi, unsigned long long ps)
> >       u32 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> >
> >       return DIV64_U64_ROUND_UP(ps * dsi->mode.clock * bpp,
> > -                               dsi->lanes * 8 * NSEC_PER_SEC);
> > +                               dsi->lanes * 8ULL * NSEC_PER_SEC);
>
> I wonder if we could get rid of a whole class of bugs by turning
> NSEC_PER_SEC into a ULL, but I suppose there are valid cases where a
> 32-bit integer is enough.

Indeed, and 64-bit arithmetic is more expensive on 32-bit platforms.
I considered that change, but doing so would require updates all over
the place (e.g. printing a value derived from NSEC_PER_SEC, divisions
 that need to be changed to do_div or div_u64(), ...)

Note that the selftests already use such a definition.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> How did you come across this by the way ?

https://lore.kernel.org/linux-renesas-soc/CAMuHMdXQvPY_mYicjPKjDSCwdO_rP-9PJOvqD0J6=S3Opr1ycg@mail.gmail.com/
and of course I grepped for similar use patterns...

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
