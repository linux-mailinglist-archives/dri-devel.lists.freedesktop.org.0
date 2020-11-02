Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B8D2A2642
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 09:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BCF6E422;
	Mon,  2 Nov 2020 08:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C206E422
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 08:39:59 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id n15so11885502otl.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 00:39:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edOywJaljR8HIGA2ZPpwBj7Ix9fGqxtdv2rXnAS0A2I=;
 b=QrAsXiPK2us2Hb3kkS7kB7mNHcXckDF1ZFIUjOFV731CTzESJyg7GSbBDxc2Tv15GD
 5YPWdi6m6Ga42c+qULWGD4RuBHCnzpVbboH+tcQJwOBfIWMwANoMLiUiiUTvAPdt2Vng
 0FTAVW8ZWBeAoZGt8l1y/FIwP6ymji0r/ov8gjp2UdNKiwr855W09CBGKazVDm9nx7LS
 PXsfQ6nTOICpm/F8cyJ+vyWeS4pUZASJJUh4Azt2V1cJTqZTf+9FhVN/G/SF+73vCmh0
 /1WUYnTJg/G472FrPYzm5QyKsv0kR3B1KS1ci7taWNxUHH68BEsyS9Sl6PgU8wlRvh8C
 gbLg==
X-Gm-Message-State: AOAM532dyoDAFHAOV8eaQ4g7MLkQM8iF5hAW+eRdVVdsxMAofmWZWrFz
 miHEFXfEihXsrAPE0U7VBIbrzPf5tU1uG6VG83A=
X-Google-Smtp-Source: ABdhPJxixL/W9coUjK0WIKR7AyvX0X5bfFMwaljlbBusyYNayvFnYK30bPFzgnwupFzPGT6nUtUDX1d2XURjFNnZMWY=
X-Received: by 2002:a9d:3b76:: with SMTP id
 z109mr11345222otb.250.1604306398694; 
 Mon, 02 Nov 2020 00:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20201101102941.2891076-1-geert@linux-m68k.org>
 <20201101112915.GB1263673@ravnborg.org> <874km91by4.fsf@igel.home>
In-Reply-To: <874km91by4.fsf@igel.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2020 09:39:47 +0100
Message-ID: <CAMuHMdUMF4R91Nt6mv9Tqz0zSaNh7AV8mghUoKL+uO-_PUH2aQ@mail.gmail.com>
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
> >> ---
> >> Untested on actual hardware, hence the RFC.
> >>
> >> v2:
> >>   - Use correct base.
> >> ---
> >>  drivers/video/fbdev/atafb.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
> >> index f253daa05d9d3872..5ecf3ec9f94cb720 100644
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

TBH, I spotted that 7 years ago, but never got to looking up and calculating
the other values...

> > I have a harder time understanding why the change of pixclock from 31041
> > to 7761 is correct. All other modes have a pixclock close to or equal
> > to 32000 - so it looks strange this one is off.

32000 ps is 31.25 MHz. Looks like these are bogus, too, and only
the VGA and Falcon video modes are correct?

> According to the Profibuch the pixclock should be about 95000.

95 ns? That's a 10.5 MHz pixel clock? Definitely too low.
The TTM195 manual says 128.85 MHz.

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
