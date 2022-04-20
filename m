Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722BE509054
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 21:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E240510E2AC;
	Wed, 20 Apr 2022 19:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AB110E2AC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 19:21:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5454D6158D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 19:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F94C385AA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 19:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650482464;
 bh=+PgOfT87QXZRKpM2v9ZNowWskAsreLZEe6RAZERVuxs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LWkg8+P3Xly8sjIxoqjEgUnQ8BqoLngtqGiQEPZggl4dkK1DiOpgHHwSwn56ifoYf
 0jYMBC2y9oudEQNk98zILpE9CQilgE7tkJqFfirwGiPaSzGz60rXyG7LagSrWPhQem
 gbXXIArHrbaEUbVwFKFsMGfZw+kiVhQTkNWJBmFatyWcBtF+i4qgINtXXuldo7Vx0G
 RpToCuYAP6mrwt+aiH/IjOOBsTv71f5Oi3+i5AJ3tiOTaMEh/815Em+H9EnYveGtMX
 wgIyjIS3nQS3pxspnrQ1f27FpB7+Y6rOGSmBE7zDDiBd809M2ZhAxpsXP8A+8SQw2R
 w9+fnlrAhUS+g==
Received: by mail-wr1-f51.google.com with SMTP id k22so3616955wrd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 12:21:04 -0700 (PDT)
X-Gm-Message-State: AOAM533mcBEeVsMUGtoKAL3tDOy/8BgKk9qobqk+5NnELlaYSQhwQzLo
 SvXZm/sHWnRcGwLwrJRs6Y5MZEM3j0ViSsWpRhY=
X-Google-Smtp-Source: ABdhPJznf39uJYDI3N62QzlkS6buptTPqwk86KhjNzbLbHyB/jaRCmYyra2UZ9f1wUtI0joZyTmyxGE4xOIYt2PeYqA=
X-Received: by 2002:a5d:64a3:0:b0:20a:7931:5b84 with SMTP id
 m3-20020a5d64a3000000b0020a79315b84mr17397786wrp.407.1650482462896; Wed, 20
 Apr 2022 12:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-27-arnd@kernel.org>
 <20220420134615.GA1947@darkstar.musicnaut.iki.fi>
In-Reply-To: <20220420134615.GA1947@darkstar.musicnaut.iki.fi>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 20 Apr 2022 21:20:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a00DgKYdzTZFiBfKDF_zwaJjL6Duw8aOOJ-gVkz4L1ZwQ@mail.gmail.com>
Message-ID: <CAK8P3a00DgKYdzTZFiBfKDF_zwaJjL6Duw8aOOJ-gVkz4L1ZwQ@mail.gmail.com>
Subject: Re: [PATCH 26/41] ARM: omap1: relocate static I/O mapping
To: Aaro Koskinen <aaro.koskinen@iki.fi>
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
 Tony Lindgren <tony@atomide.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 3:46 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
>
> Hi,
>
> On Tue, Apr 19, 2022 at 03:37:08PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The address range 0xfee00000-0xfeffffff is used for PCI and
> > PCMCIA I/O port mappings, but OMAP1 has its static mappings
> > there as well.
> >
> > Move the OMAP1 addresses a little higher to avoid crashing
> > at boot.
>
> This has the same problem I reported in 2019, with earlyprintk the
> system no longer boots:
>
>         https://marc.info/?t=156530014200005&r=1&w=2
>
> Tested on OSK and SX1/qemu.

Thanks a lot for testing!

I managed to get to the bottom of this after just a few hours, and
it turned out to be a simple math error on my end, as I got
the alignment wrong, the offset has to be 0x00f00000
instead of 0x00fb0000 be section aligned. I made sure the
kernel boots up (to the point of missing a rootfs) and uploaded
the fixed branch.

      Arnd
