Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B24505B5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 14:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DBE6E0E6;
	Mon, 15 Nov 2021 13:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1006E0E6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 13:40:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 533DC63236
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 13:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636983617;
 bh=wWcBwOu3cL9+U+zjsSAWtUQyMjCz3CDgA4mV4eUmQEI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q4vpjH0uJaOnwWSUMmOGk4RBT6eS8WH2rt9ntVsxRfGOv9U1AcRtQ11fRaF90BIV8
 sqeJ0HBpuF+KPmzxxWjlJGgSJ1OjqCnX5IF3kDB9UyaLteVQzEs63BelRJSGp/MN27
 rl3mqKgow43UyjRBZHGLKQ4QfjwptO5RKrADCb33Z2mbHzpBKSuGr6uGe5kRDEdiBG
 HHrLzrj7SUybGgQXnJJsO7yrqVHV48pmOVUw23xSRWxB7Me79U0ZJtPK4hVpkgoTGX
 utmi82G0Uxv9J6Q2ftbl+jiVLtnlcx62LHYmA20iHfeUpWAVrLzRRvgSwCTpk4pzn6
 ofL6tkRYcgMKA==
Received: by mail-wr1-f47.google.com with SMTP id s13so30845515wrb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 05:40:17 -0800 (PST)
X-Gm-Message-State: AOAM531dwQoo1dJ1OgKd+VDZKlQL61m3md8RYBmvv0hoeXkq3t0mcxmC
 lcihX40lZSknhk5/77g0g8lLhlU3lIjCDa/CTDQ=
X-Google-Smtp-Source: ABdhPJydx+lGNyCCL10Ss+u6AlrY7F7Dh3irA5L/rafXQwz2EG7YLwST7GsA7bIvQOTqpVGT64n5uQbouKk1WaS2cho=
X-Received: by 2002:adf:f088:: with SMTP id n8mr7443019wro.411.1636983615679; 
 Mon, 15 Nov 2021 05:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
 <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
 <YZJJVA/92KYH8hQL@pendragon.ideasonboard.com>
 <CAK8P3a27rPBVbU-PrYR0BE4KV2DyJk7FoXaeDS=FU1=_RSwoQQ@mail.gmail.com>
 <YZJbLol1llm+puDT@pendragon.ideasonboard.com>
In-Reply-To: <YZJbLol1llm+puDT@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 14:39:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a16s6dwvb-7REjF-pmnKod2qQRq+mta-g8pDXbQpGQvHA@mail.gmail.com>
Message-ID: <CAK8P3a16s6dwvb-7REjF-pmnKod2qQRq+mta-g8pDXbQpGQvHA@mail.gmail.com>
Subject: Re: [PATCH 08/11] dmaengine: xilinx_dpdma: stop using slave_id field
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-staging@lists.linux.dev,
 Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, dmaengine@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, Jaroslav Kysela <perex@perex.cz>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 2:05 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Nov 15, 2021 at 01:38:07PM +0100, Arnd Bergmann wrote:
> > On Mon, Nov 15, 2021 at 12:49 PM Laurent Pinchart wrote:
> >
> > Right. I wonder if there is even a point in using the dmaengine API
> > in that case, I think for other single-purpose drivers we tend to just
> > integrate the functionality in the client driver. No point changing this
> > now of course, but it does feel odd.
>
> I agree, and that's what I would have done as well, if it wasn't for the
> fact that the DMA engine also supports a second client for audio. This
> isn't supported in upstream yet. We could still have created an ad-hoc
> solution, possibly based on the components framework, but the DMA engine
> subsystem wasn't a bad fit.

Ah, makes sense. In this case, I guess the data could have been
part of the DMA specifier after all, in a second cell after the
channel number.

        Arnd
