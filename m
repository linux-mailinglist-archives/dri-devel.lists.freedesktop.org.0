Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D93CF557
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 09:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7162E6E231;
	Tue, 20 Jul 2021 07:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334CD6E231
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 07:33:23 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id d2so7784501uan.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 00:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lcwwIKXkcen+cASiKX8dxRt5ZT8ziwWwN38CXX7LydU=;
 b=qiWzjsXnc9ONn2F1Ps0nlNGb4/JGI152Am4H1MM1AifH+GG9Wo4yCmIRuyAXbgUvog
 j0eDg9EeR/jcWCgdUZKNXekrAIHED5Eg1/T0fwsoz/QxKXYbaTVBWUS0wuzogVgIUB7E
 TkF2TaZ1SVyJ5m3UFe54mW6HkcN3QSMobGgy/ujPM5KQCnaTHZqaiux1XqR+BgzU0MDA
 AycWdTFWRzWC3YVLHql8A0uIy7BEPd3zopK7Av7R4tKshayzcQZkPYCcMGkLpp9ZQ3FM
 MlqBxOuI9a1gnbK9TeICEZOa9hCbIe2gEy3/mT1QPMa5CCFhh74g4qmVo8CcDctQgy0X
 St0g==
X-Gm-Message-State: AOAM533GfC6nclYCuTL2wXTZlyAu7iDovptKsuikrtEKLYUrsfsiWIwj
 EQFbsXKROk6spMf/7VIp5LkQXNqmA+qWAbzMTLk=
X-Google-Smtp-Source: ABdhPJwPDX91aff2YPV7tV6BcHro69P/gJKxmT+erTLAbtVlBy5/BOX9Kb3TXYB1oJJEukohKoWiib/KNNVZ8lXCc/c=
X-Received: by 2002:ab0:6710:: with SMTP id q16mr6956039uam.106.1626766402335; 
 Tue, 20 Jul 2021 00:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210714145804.2530727-1-geert@linux-m68k.org>
 <YPXRMXQxCW+Agaz8@ravnborg.org>
In-Reply-To: <YPXRMXQxCW+Agaz8@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jul 2021 09:33:11 +0200
Message-ID: <CAMuHMdXK5X5Zawgp=SivGQSvOi=p_PwarYUR4QikGuB+f_d6YQ@mail.gmail.com>
Subject: Re: [PATCH resend 0/5] video: fbdev: ssd1307fb: Optimizations and
 improvements
To: Sam Ravnborg <sam@ravnborg.org>
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
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Mon, Jul 19, 2021 at 9:23 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Jul 14, 2021 at 04:57:59PM +0200, Geert Uytterhoeven wrote:
> > This patch series optimizes console operations on ssd1307fb, after the
> > customary fixes and cleanups.
> >
> > Currently, each screen update triggers an I2C transfer of all screen
> > data, up to 1 KiB of data for a 128x64 display, which takes at least 20
> > ms in Fast mode.  While many displays are smaller, and thus require less
> > data to be transferred, 20 ms is still an optimistic value, as the
> > actual data transfer may be much slower, especially on bitbanged I2C
> > drivers.  After this series, the amount of data transfer is reduced, as
> > fillrect, copyarea, and imageblit only update the rectangle that
> > changed.
> >
> > This has been tested on an Adafruit FeatherWing OLED with an SSD1306
> > controller and a 128x32 OLED, connected to an OrangeCrab ECP5 FPGA board
> > running a 64 MHz VexRiscv RISC-V softcore, where it reduced the CPU
> > usage for blinking the cursor from more than 70% to ca. 10%.
> >
> > Thanks for your comments!
> >
> > Geert Uytterhoeven (5):
> >   video: fbdev: ssd1307fb: Propagate errors via
> >     ssd1307fb_update_display()
> >   video: fbdev: ssd1307fb: Simplify ssd1307fb_update_display()
> >   video: fbdev: ssd1307fb: Extract ssd1307fb_set_address_range()
> >   video: fbdev: ssd1307fb: Optimize screen updates
> >   video: fbdev: ssd1307fb: Cache address ranges
>
> A few comments left for a couple of patches.
> The remaining patches are:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thank you!

> Do you have commit rights to drm-misc-next?

No I have not (and I don't think I should).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
