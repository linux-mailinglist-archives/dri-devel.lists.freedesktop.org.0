Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10D645024D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 11:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275E76E8DB;
	Mon, 15 Nov 2021 10:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DA76E8E2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 10:21:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91EA163222
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 10:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636971708;
 bh=ngAS50rMmpV59azjOqW2oXCBrEGHx6Ekm0yN36KEY7k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oHFZaspA4e0JT2Bappei5MG7xUfxAKnXH43mnsdk+R7rbsdvrD3kUDLGpF994Lv8o
 iEcy1Ug+arpeVBA1gxKJr+XFzRMEEncjc2K9qzGu6o1iL3o1bXVBgArPKaXh3sM1KT
 pqByKGVIvlUsnVpeQARzzgb4qc9a17HQolmIyWVeIgrGPfLon8Wq7NbhnRmyj2zeoK
 0Pg+gQgghuvRxMHQ7IajfS53HSxlou+O9e931O/rQqPebWyZ0jpnTj4gKlP7r3MKfQ
 +aPZLeOvA+8d8JqKBiRKzMCqrAk2Zb1jIIa11uVmY4fIYw/I+SHpBH5/oWpHirfE6z
 g6me8ygTpOC9g==
Received: by mail-wr1-f51.google.com with SMTP id w29so29531219wra.12
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 02:21:48 -0800 (PST)
X-Gm-Message-State: AOAM530vc6Z/EVF5BFQVmJ4ocGuYNyacMvfDjgXvoBttVjGR78Et+vzf
 DJ7HJNSWWo/y7NCDZ7afMmlvK8SmYD6oUXq0eMk=
X-Google-Smtp-Source: ABdhPJyrUjRCeMXfDabLLUXG4+a6meFiuvFYQKG804WvMbrQRiaBMGWgH0F0OdgqzdIGH+oZqJIqfFrTkkuSnIDyxB0=
X-Received: by 2002:adf:df89:: with SMTP id z9mr45196660wrl.336.1636971706955; 
 Mon, 15 Nov 2021 02:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
In-Reply-To: <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 11:21:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
Message-ID: <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
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

On Mon, Nov 15, 2021 at 10:14 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Nov 15, 2021 at 09:54:00AM +0100, Arnd Bergmann wrote:
> > @@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
> >       spin_lock_irqsave(&chan->lock, flags);
> >
> >       /*
> > -      * Abuse the slave_id to indicate that the channel is part of a video
> > -      * group.
> > +      * Abuse the peripheral_config to indicate that the channel is part
>
> Is it still an abuse, or is this now the right way to pass custom data
> to the DMA engine driver ?

It doesn't make the driver any more portable, but it's now being
more explicit about it. As far as I can tell, this is the best way
to pass data that cannot be expressed through the regular interfaces
in DT and the dmaengine API.

Ideally there would be a generic way to pass this flag, but I couldn't
figure out what this is actually doing, or whether there is a better
way. Maybe Vinod has an idea.

I'll change s/Abuse/Use/ for the moment until I get a definite answer.

> > +      * of a video group.
> >        */
> > -     if (chan->id <= ZYNQMP_DPDMA_VIDEO2)
> > -             chan->video_group = config->slave_id != 0;
> > +     pconfig = config->peripheral_config;
>
> This could be moved to the variable declaration above, up to you.

I considered that but since it doesn't fit in a normal 80-column
line, it seemed best to do it here.

> > +     if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
> > +         config->peripheral_size == sizeof(*pconfig))
>
> Silently ignoring a size mismatch isn't nice. Could we validate the size
> at the beginning of the function and return an error ?

Yes, good idea. Since this would mean a bug in another driver,
I'll add a WARN_ON() as well to make it clear which driver caused it.
This is what I have now, let me know if you have any further suggestions:

        /*
         * Use the peripheral_config to indicate that the channel is part
         * of a video group. This requires matching use of the custom
         * structure in each driver.
         */
        pconfig = config->peripheral_config;
        if (WARN_ON(config->peripheral_size != 0 &&
                    config->peripheral_size != sizeof(*pconfig)))
                return -EINVAL;

        spin_lock_irqsave(&chan->lock, flags);
        if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
            config->peripheral_size == sizeof(*pconfig))
                chan->video_group = pconfig->video_group;
        spin_unlock_irqrestore(&chan->lock, flags);

        return 0;

> With these issues addressed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks,

       Arnd
