Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D68545048A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 13:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655426E0D6;
	Mon, 15 Nov 2021 12:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAB66E0D6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 12:38:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D0E76137B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 12:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636979905;
 bh=0vPaiFLUq2SXWicOiHJ0dTL68j+HqvYqhdUUZpm4Lbg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I+1x2XZxjf0LcgW3lMmbiJPZ71Bi+3kqOGuAZRKXN1JfNBFrZaiB21OzI8/74f0h0
 Qq9j3mNJNww5Ebh37UUU7T73Uy/xgxrT9Cch7mYImOv2H/bbOmofM9xkajEGTkGGUU
 hGAI73KgAeiXM888w+zysyYQTZ4yYyjDXcXqXXwQJ8IyYB0pf/b0pqA/XCjqw9IpRl
 yCWpvb6UA7WovNrxde2iEzHRITt42AWtZE7nvXGbJMW3vN4eAR3DyqEs1DZrNZzLk2
 tuMyHLag1K86+X0psZqBhLcvq1czh8i8zV/S46+iyDlDN0sbFnwCD3e9XH7d1GqYQT
 IxYpNW3g9oKFg==
Received: by mail-wm1-f47.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so14934100wmb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 04:38:25 -0800 (PST)
X-Gm-Message-State: AOAM532qIsd0BbGFA9WrkBrMLhcrkhPJ751Jh78JB8VBjJyy8zuICLJI
 3gYFtaFYapL2s5hrEg4KrmPjFP87QSp0XkycEMc=
X-Google-Smtp-Source: ABdhPJwFTprJJd11s9duELVend6oLQx+lemeU4w9vOaJiXxZUrLq0sghW72KOFAqYJMNV8KCFht4GWVIPZFIhNgyYas=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr58047076wmi.173.1636979903584; 
 Mon, 15 Nov 2021 04:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
 <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
 <YZJJVA/92KYH8hQL@pendragon.ideasonboard.com>
In-Reply-To: <YZJJVA/92KYH8hQL@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 13:38:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a27rPBVbU-PrYR0BE4KV2DyJk7FoXaeDS=FU1=_RSwoQQ@mail.gmail.com>
Message-ID: <CAK8P3a27rPBVbU-PrYR0BE4KV2DyJk7FoXaeDS=FU1=_RSwoQQ@mail.gmail.com>
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

On Mon, Nov 15, 2021 at 12:49 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Nov 15, 2021 at 11:21:30AM +0100, Arnd Bergmann wrote:
> > On Mon, Nov 15, 2021 at 10:14 AM Laurent Pinchart wrote:
> > > On Mon, Nov 15, 2021 at 09:54:00AM +0100, Arnd Bergmann wrote:
> > > > @@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
> > > >       spin_lock_irqsave(&chan->lock, flags);
> > > >
> > > >       /*
> > > > -      * Abuse the slave_id to indicate that the channel is part of a video
> > > > -      * group.
> > > > +      * Abuse the peripheral_config to indicate that the channel is part
> > >
> > > Is it still an abuse, or is this now the right way to pass custom data
> > > to the DMA engine driver ?
> >
> > It doesn't make the driver any more portable, but it's now being
> > more explicit about it. As far as I can tell, this is the best way
> > to pass data that cannot be expressed through the regular interfaces
> > in DT and the dmaengine API.
> >
> > Ideally there would be a generic way to pass this flag, but I couldn't
> > figure out what this is actually doing, or whether there is a better
> > way. Maybe Vinod has an idea.
>
> I don't think we need a generic API in this case. The DMA engine is
> specific to the display device, I don't foresee a need to mix-n-match.


Right. I wonder if there is even a point in using the dmaengine API
in that case, I think for other single-purpose drivers we tend to just
integrate the functionality in the client driver. No point changing this
now of course, but it does feel odd.

From my earlier reading of the driver, my impression was that this
is just a memory-to-memory device, so it could be used that way
as well, but does need a flag when working on the video memory.
I couldn't quite make sense of that though.

> >         /*
> >          * Use the peripheral_config to indicate that the channel is part
> >          * of a video group. This requires matching use of the custom
> >          * structure in each driver.
> >          */
> >         pconfig = config->peripheral_config;
> >         if (WARN_ON(config->peripheral_size != 0 &&
> >                     config->peripheral_size != sizeof(*pconfig)))
> >                 return -EINVAL;
>
> How about
>
>         if (WARN_ON(config->peripheral_config &&
>                     config->peripheral_size != sizeof(*pconfig)))
>
> >
> >         spin_lock_irqsave(&chan->lock, flags);
> >         if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
> >             config->peripheral_size == sizeof(*pconfig))
>
> And here you can test pconfig != NULL.

Good idea. Changed now, using 'if (pconfig)' without the '!= NULL'
in both expressions.

        Arnd
