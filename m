Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2B441AB45
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 10:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEF789CA8;
	Tue, 28 Sep 2021 08:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434DC89CA8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 08:56:10 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id t186so8150924vkd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 01:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m1SPxBXviVX+IXuXEsuQBsXdtNvtJMC8mWkf4HXlhYI=;
 b=h5dTYj2z15MBpz4SgqJdEcnoN+eiugLaAFAGe+GoiQ8KgBugumrkQ7blj0/MYRVjiM
 lqqPevyndTFyIFhZhtNjB84ejMKLpliUp4U4iTpqfBwdP0Nb8+K/xvKcz9RHNlzpBDcG
 TBd/mXhnbN1pnGs2OB86f5oLa1gKhYA+3PCx49AF0XWmwxqRKMxbvH0R53GbB2jGsDmV
 yzbAuAWGi934tisZeda4GTRDJutDHK+mZ01pniIvcct3i/hWejpehhG2b/U9Et3eFzEN
 cUpg+A3J5t29hQUXVaHQ7ur3ZLeBxazmBTNqUUrIIpc7wwYzSdhnYmeOuYYRswOQ/4ld
 kx9Q==
X-Gm-Message-State: AOAM530ZK7GF/fsEN7ndOEhptz/JQk9smRFMMKeQk7glAVeF8AYQni+d
 ldp6WAR76K59rYkQhJloB8kiNSXKa/prdjDlS3o=
X-Google-Smtp-Source: ABdhPJy+pindMxBWVfaLcKOdBKp/zvSFAEW3vww4iRWQPHAR7B+Og0y4TRu4t/Zeus+2ltvVleJSy9AemEXcjC6o324=
X-Received: by 2002:a1f:230c:: with SMTP id j12mr3610861vkj.11.1632819369174; 
 Tue, 28 Sep 2021 01:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210822003604.6235-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWSqSb37srBG0XB-vX5ERmjDBia07k_-s2Zg=bUsQCSyA@mail.gmail.com>
 <YSO2h40mJN17FGvd@pendragon.ideasonboard.com>
In-Reply-To: <YSO2h40mJN17FGvd@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Sep 2021 10:55:57 +0200
Message-ID: <CAMuHMdW6Y4rhcH4EfjnzkPvWhm2ok=7E_3Cswe=5bnozGzpmGA@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Don't create encoder for unconnected LVDS
 outputs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Aug 23, 2021 at 4:54 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Aug 23, 2021 at 02:25:32PM +0200, Geert Uytterhoeven wrote:
> > On Sun, Aug 22, 2021 at 2:36 AM Laurent Pinchart wrote:
> > > On R-Car D3 and E3, the LVDS encoders provide the pixel clock to the DU,
> > > even when LVDS outputs are not used. For this reason, the rcar-lvds
> > > driver probes successfully on those platforms even if no further bridge
> > > or panel is connected to the LVDS output, in order to provide the
> > > rcar_lvds_clk_enable() and rcar_lvds_clk_disable() functions to the DU
> > > driver.
> > >
> > > If an LVDS output isn't connected, trying to create a DRM connector for
> > > the output will fail. Fix this by skipping connector creation in that
> > > case, and also skip creation of the DRM encoder as there's no point in
> > > an encoder without a connector.
> > >
> > > Fixes: e9e056949c92 ("drm: rcar-du: lvds: Convert to DRM panel bridge helper")
> > > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > Can you please change that to
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ?
>
> Sure thing.

Thanks!

> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Thanks, the scary warning on Ebisu-4D is gone, so
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Disclaimer: there are no displays connected to my Ebisu-4D.
>
> That's the best way to ensure the absence of display issues. It works
> great for camera testing too, if you also remove networking and storage
> :-)

Any chance this fix can make it upstream?
The fix was created before the issue entered upstream in v5.15-rc1.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
