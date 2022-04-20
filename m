Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CDA5089BE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 15:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E6310E4E8;
	Wed, 20 Apr 2022 13:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA75F10E4E8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:48:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA153B81ED5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D91C385A8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650462517;
 bh=r5gIACVwFwXfu+L0SjHY63rmQTmlBYIcuCScaOsuAjk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E8Em2MQWztm+C2EmlV1FQe3I0FTSV2DiJcyK2iihaFQo51NM0DFE/rYOIE+wyx1wp
 /VWN0/71ZwssYkNVh129T8UpZm6AUkLIGuMiY6fzJStQ7ZZZzsLu+YfHMjswZ9W7YM
 mjdK3DJxHlIkGZPSUsh/8dFkbBcT5Jm8E77pDoGNiEZG4/4EPstw+51gVak16za2ga
 dhu7kZkcOynk9SMtnhYtXUgL6zQdymwzczZfSDpnrDpvJEhYxBXYfvKUUxyNISj4vp
 /lSN3yrqnyEcDKHRIhkxeNkjouxpUUs1/5w5lM+l5Iw8Csip1eFb3F0IQ3ctyogPeM
 5m+eazxPFDoqg==
Received: by mail-wr1-f53.google.com with SMTP id x18so2396543wrc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 06:48:37 -0700 (PDT)
X-Gm-Message-State: AOAM532pj0rF6WAphHpkNTXwVovP7GaCyCmh7rwvpFU5WKlzN5CSbXyi
 XH7XFb/u8m4bACRVPGy7BC39fut7xfWrO1HMSsA=
X-Google-Smtp-Source: ABdhPJwSpIclw+ZwqVR57edT/aQRpFn5BaY64Phs17aAgIE6n54XF3PED3yv14Fv9AL2uDPz7qCh2GbTzsHglUZV1DA=
X-Received: by 2002:a5d:6389:0:b0:207:a7d8:2b64 with SMTP id
 p9-20020a5d6389000000b00207a7d82b64mr15595597wru.12.1650462515957; Wed, 20
 Apr 2022 06:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-41-arnd@kernel.org>
 <20220420134305.fq7pc3fsz5fxkryj@mercury.elektranox.org>
In-Reply-To: <20220420134305.fq7pc3fsz5fxkryj@mercury.elektranox.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 20 Apr 2022 15:48:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Mv-gUoc3hpqvCa1tzvEEwHN6wXDxmy8K5rN8sULQnMw@mail.gmail.com>
Message-ID: <CAK8P3a2Mv-gUoc3hpqvCa1tzvEEwHN6wXDxmy8K5rN8sULQnMw@mail.gmail.com>
Subject: Re: [PATCH 40/48] ARM: pxa: tosa: use gpio lookup for battery
To: Sebastian Reichel <sre@kernel.org>
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
 Sergey Lapin <slapin@ossfans.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 3:43 PM Sebastian Reichel <sre@kernel.org> wrote:
> > @@ -15,11 +15,16 @@
> >  #include <linux/gpio.h>
>
> This should be <linux/gpio/consumer.h> now.
>
Fixed now, thanks!

     Arnd
