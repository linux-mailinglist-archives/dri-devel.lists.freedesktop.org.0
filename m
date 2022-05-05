Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F7751C32C
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 17:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EEF10E476;
	Thu,  5 May 2022 14:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB71510E4C3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 14:59:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F06BB82D82
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 14:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE05AC385AE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 14:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651762793;
 bh=IhPlTG/RSP+SotNFea7Fr39MZz0OjsoIPseiihaGxkc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XJlLANSBhBQidSLyIN3yrDU4IPbB/XHn0sC/EiuYCYow1pSZuwUL9RL7kUdqha4a5
 TcZwUvlSFBjq9APojye7LJhrzoz3yJ1Ko0vn9bx+hzpMIKK1bpwEinzLoso9szamoU
 kt+btKxs0bHl5LryHinLhmeOqshoLiof4tF0E/+fz0OqXBqxiiNxRhqua3QhXT1gQ9
 FZipVJ1eZuG5o8dbsSJoiqjohKH/oez5kM37x1L64XAIvA0K2/0Rnw6ymC8BCVOm/J
 AVlpwubLtD+RPAMcU/M895m2znx/K5SL30vRlO5ThZta1c3MM+UqdWVtRQXT105Row
 Q/EgykBswo6Gg==
Received: by mail-wr1-f51.google.com with SMTP id i5so6462709wrc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 07:59:53 -0700 (PDT)
X-Gm-Message-State: AOAM530MFJn7E/MivfMjg34fWfINFxANaUPYpZvouHPr87Q51YjXrVOF
 ElEyoMVi2ZpMD/ObiLNvgwEeUlSUOHkAeIXBwDc=
X-Google-Smtp-Source: ABdhPJyKl/lyubFIqlgFQkig5zNAs/zvVqV8InTOhcfpAoriY4j8URNODYiLewygje3f2WDNulvuU9Rfg/N1L0FjaiU=
X-Received: by 2002:a05:6000:707:b0:20c:4fd8:1d61 with SMTP id
 bs7-20020a056000070700b0020c4fd81d61mr21866057wrb.407.1651762791921; Thu, 05
 May 2022 07:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-19-arnd@kernel.org>
 <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
 <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
 <CACRpkdZNryYkidvdKuT57RM3fz6_X+3oOzF5xaOZd+TyScfUsw@mail.gmail.com>
 <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
 <CACRpkdaNRX0RDYJd_uaGo5jtiXu_qGHmEDGniaCmR=TZvcHH8A@mail.gmail.com>
 <YnPhna5h1+kQGFLa@sirena.org.uk>
In-Reply-To: <YnPhna5h1+kQGFLa@sirena.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 5 May 2022 16:59:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2cYUYMKSMo3VOLVTO0=LWc0sHf72Eph8t_es9axo_eeA@mail.gmail.com>
Message-ID: <CAK8P3a2cYUYMKSMo3VOLVTO0=LWc0sHf72Eph8t_es9axo_eeA@mail.gmail.com>
Subject: Re: [PATCH 18/48] ARM: pxa: hx4700: use gpio descriptors for audio
To: Mark Brown <broonie@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Tomas Cech <sleep_walker@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Michael Turquette <mturquette@baylibre.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 5, 2022 at 4:39 PM Mark Brown <broonie@kernel.org> wrote:
> On Thu, May 05, 2022 at 04:33:06PM +0200, Linus Walleij wrote:
> > On Thu, May 5, 2022 at 8:04 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> > > /* Headphones jack detection DAPM pin */
> > > static struct snd_soc_jack_pin hs_jack_pin[] = {
> > >         {
> > >                 .pin    = "Headphone Jack",
> > >                 .mask   = SND_JACK_HEADPHONE,
> > >         },
> > >         {
> > >                 .pin    = "Speaker",
> > >                 /* disable speaker when hp jack is inserted */
> > >                 .mask   = SND_JACK_HEADPHONE,
> > >                 .invert = 1,
> > >         },
>
> > Hm some ASoC thingie. No idea what that is, but I suppose another
> > place where a subsystem for legacy reasons try to do the gpiolib
> > inversion on it's own accord. That one isn't flagged as active low in the
> > descriptor so it's fine I guess.
>
> It's saying that when the headphone is inserted the headphone output
> should be enabled and the speaker output should be disabled, and vice
> versa.

Ok, that sounds like I should remove the flag here if I declare the
GPIO line as GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH, right?

         Arnd
