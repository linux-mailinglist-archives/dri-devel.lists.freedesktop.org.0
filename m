Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F463F4A97
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 14:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD4489C86;
	Mon, 23 Aug 2021 12:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA3889C86
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 12:25:44 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id s19so10936755vsl.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 05:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qXtDlW7T88wjzL8Tweiy71uHxWixjnOanz5gbQbCE/Q=;
 b=IZlG1wR0Q648ejUzUSvSnUkgZ8HcVK0Ciqji6hNkrK1s2qlx+TaqLx3g/Qo8EXdQIn
 9nbhaED4QvJjTz7nPcYRswPlRhuzKUh09f+DUVDl5vXNvcLNuGjKF6mnswAyP4B96uDO
 ff46dXC3OEhmSnuD5TL6+LKcShJxWia80K5aTbD14z/yO1At/TQO7YeEcDl3Y7TngeE7
 M9XNObdIEK6XlNLEPD2fLmZGgUbn0oaL3cnkMgqMpsqFQ3/TSxt9sxxLavqQ3xvpTWGQ
 mKqzJb0Nx+qoCQ3jHC8kheG846/ofU5jq7TGVQdzrhDVD5O/pQsWONjMPxCuYKwd5r5D
 Or6g==
X-Gm-Message-State: AOAM531f/N24zt9DE79Iv3lfALNj53/+6D/G3tMEPGGZa1Rjpp+LTpqs
 /pXmzR207C1IKnkSTVZHEpyJrfbsU5x0ZZxy3CY=
X-Google-Smtp-Source: ABdhPJznZ+PmuT3gxAgdgrA8kXhuOMnutxvhv88zLvTlR66PqFd1lACaQ9rSF7u0b53nzxL3qVPfHiShIXiesAN96PA=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr23287378vsl.9.1629721543349; 
 Mon, 23 Aug 2021 05:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210822003604.6235-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210822003604.6235-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Aug 2021 14:25:32 +0200
Message-ID: <CAMuHMdWSqSb37srBG0XB-vX5ERmjDBia07k_-s2Zg=bUsQCSyA@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Don't create encoder for unconnected LVDS
 outputs
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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

On Sun, Aug 22, 2021 at 2:36 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> On R-Car D3 and E3, the LVDS encoders provide the pixel clock to the DU,
> even when LVDS outputs are not used. For this reason, the rcar-lvds
> driver probes successfully on those platforms even if no further bridge
> or panel is connected to the LVDS output, in order to provide the
> rcar_lvds_clk_enable() and rcar_lvds_clk_disable() functions to the DU
> driver.
>
> If an LVDS output isn't connected, trying to create a DRM connector for
> the output will fail. Fix this by skipping connector creation in that
> case, and also skip creation of the DRM encoder as there's no point in
> an encoder without a connector.
>
> Fixes: e9e056949c92 ("drm: rcar-du: lvds: Convert to DRM panel bridge helper")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>

Can you please change that to
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
?

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks, the scary warning on Ebisu-4D is gone, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Disclaimer: there are no displays connected to my Ebisu-4D.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
