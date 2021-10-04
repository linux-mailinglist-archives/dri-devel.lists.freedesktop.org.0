Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C00FD4214FB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 19:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945C06EA6F;
	Mon,  4 Oct 2021 17:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BB66EA6F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 17:14:46 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id 188so20552693vsv.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 10:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SBkLa/4MTN2AV7Ayi5b9WkAAkgh6llV494VW2u23y8M=;
 b=6/YDITnw3l4XrYmNQr+YE8fqxBVviA3e9ccNY1955XK9JceCgerbPu8W26ylvzsiJA
 z1fOjXp7kR6JBzFVc4eEBle18NrZbvFfSqrNhazE69UOmQK1LtyXJGMiTQkj0TwefyQ+
 S9Fod9ODmeribzH7Uvit1ePPqQHPDNHEvTIYPYKMlQN98RGuYuBogSU74lDsVSOOZVCs
 eirDEUQOrKVGA1UZDhqupLmgTKKSUv0zYOwFPVqVGwpyDPVCyg2jdZ1hihxUG6GFZiDT
 BAYEV2f44p84fjZz/BgAf89o/+nSOFDmnXITbmGXNgrV8wjrq6dON1c/OzrNFxvq9QTu
 ehRQ==
X-Gm-Message-State: AOAM532QH8BkO/Yuxw7G5QsNylpeNOF4/1eWk691/sMmdNfQE33aWqlY
 QPl2BH71gg23a4+Q1qVI25wfCGYqn1egPYghYUA=
X-Google-Smtp-Source: ABdhPJzAKXaRAKp8VeLwihf2bO6s9nPybnMNdkmRdoDft3Mi8PGfDtP6R7h0/ORYrFJkE1nuoq5c2ZdYEpvBhstP0DQ=
X-Received: by 2002:a67:ac04:: with SMTP id v4mr5352188vse.50.1633367683989;
 Mon, 04 Oct 2021 10:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
In-Reply-To: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Oct 2021 19:14:32 +0200
Message-ID: <CAMuHMdUsoBO2hjd0tAecAjnwCUbp=d8i8vaUFDT6Yn3emw2s9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Fix crash with zero/invalid EDID
To: Douglas Anderson <dianders@chromium.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, oliver.sang@intel.com, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Douglas,

On Mon, Oct 4, 2021 at 6:22 PM Douglas Anderson <dianders@chromium.org> wrote:
> In the commit bac9c2948224 ("drm/edid: Break out reading block 0 of
> the EDID") I broke out reading the base block of the EDID to its own
> function. Unfortunately, when I did that I messed up the handling when
> drm_edid_is_zero() indicated that we had an EDID that was all 0x00 or
> when we went through 4 loops and didn't get a valid EDID. Specifically
> I needed to pass the broken EDID to connector_bad_edid() but now I was
> passing an error-pointer.
>
> Let's re-jigger things so we can pass the bad EDID in properly.
>
> Fixes: bac9c2948224 ("drm/edid: Break out reading block 0 of the EDID")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

The crash is was seeing is gone, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
