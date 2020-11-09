Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E932AB28C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB618954A;
	Mon,  9 Nov 2020 08:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37EB8954A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:38:28 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 79so8156847otc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 00:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mpl5z7jYy7tt5Nnzqwz9YOe8OadxKMgEiQDFvQkXiUc=;
 b=JfeMEGls0rf8nQTCg3A6Ovu3qlLhiAEqjwGDSry7USIBiRfI6j7k/yqgWzrKdoFhlj
 RvOd+83INcY+nmSRq2XbAdN0vQTJkl5IOhd/z79MnaL3GKExNprPJ2ex0til30ojVj0F
 15F9a6ZZfp8U+9DuAXjxKvjqGv4Rd8fF1R5ibnhQrouCwf5B76PCTcEB+0SXQ1DrM1cL
 ibUSLC4+m1x7svkWNDaBask0bQyxas63vmVjYvpB+YAR2UzeKNdOwdSa4x+jjTfAQQQs
 Gu+IfAYnUI0nBvLVaUHmcbswMXJXFJWKhJzQIV8LytqXRvfd2DYlAmG5JST4WUJekAgU
 2PIw==
X-Gm-Message-State: AOAM530cKQiVLMiK56HnV/byGlwbsxP20IaI6Uld+isxFGrC4zAE7yyY
 DuTA0nRS52ikam9n55EaD8ytd4gGKa2O5EYGlYQ=
X-Google-Smtp-Source: ABdhPJztzqSlL0WXA+McVa1c5WLjfnlry5X7OjJ9ynRD1lUtJ8E5/oZWsMSMvuAqBoLB9pps/iYyuiC8KGSadZDVsVM=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr8991741oti.107.1604911108098; 
 Mon, 09 Nov 2020 00:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20201101102941.2891076-1-geert@linux-m68k.org>
 <20201101112915.GB1263673@ravnborg.org> <874km91by4.fsf@igel.home>
In-Reply-To: <874km91by4.fsf@igel.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Nov 2020 09:38:16 +0100
Message-ID: <CAMuHMdWEJwd4mGUm4ycUx5dBg5Lbb3cG+X5QsJ-icwuvoLxx5w@mail.gmail.com>
Subject: Re: [PATCH/RFC v2] video: fbdev: atari: Fix TT High video mode
To: Andreas Schwab <schwab@linux-m68k.org>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andreas,

On Sun, Nov 1, 2020 at 1:47 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Nov 01 2020, Sam Ravnborg wrote:
> > On Sun, Nov 01, 2020 at 11:29:41AM +0100, Geert Uytterhoeven wrote:
> >> The horizontal resolution (640) for the TT High video mode (1280x960) is
> >> definitely bogus.  While fixing that, correct the timings to match the
> >> TTM195 service manual.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> >> --- a/drivers/video/fbdev/atafb.c
> >> +++ b/drivers/video/fbdev/atafb.c
> >> @@ -495,8 +495,8 @@ static struct fb_videomode atafb_modedb[] __initdata = {
> >>              "tt-mid", 60, 640, 480, 31041, 120, 100, 8, 16, 140, 30,
> >>              0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> >>      }, {
> >> -            /* 1280x960, 29 kHz, 60 Hz (TT high) */
> >> -            "tt-high", 57, 640, 960, 31041, 120, 100, 8, 16, 140, 30,
> >> +            /* 1280x960, 72 kHz, 72 Hz (TT high) */
> >> +            "tt-high", 57, 1280, 960, 7761, 260, 60, 36, 4, 192, 4,
> >>              0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
> >
> > Well-spotted. The change of 640 => 1280 is surely right.
> > I have a harder time understanding why the change of pixclock from 31041
> > to 7761 is correct. All other modes have a pixclock close to or equal
> > to 32000 - so it looks strange this one is off.
>
> According to the Profibuch the pixclock should be about 95000.

Please have a look at the paragraph on p. 1052, and realize that it
fails to take into account horizontal black/sync (the actual scan line
length is 1792 not 1280 pixels) (thanks, Michael!).

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
