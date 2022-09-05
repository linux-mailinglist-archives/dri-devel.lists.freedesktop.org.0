Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883775AD9E1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4972010E416;
	Mon,  5 Sep 2022 19:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFD310E416
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:47:35 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id c2so9295954plo.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=G9Qf5nb4X9K1i84KXH4HdM00CRNAf5tzFBdtc+b4TKE=;
 b=cWny7dbbvfDII4XkGp5mcFhDW7xnoXHh4AKp8q/idS35yLNxXCSkBzhGNbyJdfKcgw
 I98s6U9AGgEVnvf/Otkfnonv1p93zecPAa1Wxa3KSM+UL95+uWumTNi/u3z4jHg0grzX
 JtIxbBCRknabFNdt+fjzwr65uC6OsrsW5a4sEZz0NEuBTvgOr4Bn6uiqxSSkgXONv6VT
 dMkF/Ehj96BrC/2YGY47othtHiCKBlZNyPsKpaY7eBC/Q5vm7GnaEikiaZ3BvOwvpZmX
 nN/ytcT90lHjiXGbNBizBZZroVETT+W7vOuh6f97BaXqY726iRuZQ2CjSiog5B/naWka
 hITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=G9Qf5nb4X9K1i84KXH4HdM00CRNAf5tzFBdtc+b4TKE=;
 b=1KyYi7zohIItK91zanc+KNXzonU4qf7ruIMKSKJ+ivoSSf27g3yY0V3zSNT7ExfNko
 qnikj7xxUPpD4LpUNjx1sLqJRgtQRB5R31QzNZU/gqzpSwcqOMZ0GN+b6a7BX6ejCW3S
 pJxOqZbz3yeoMvZ/3tdQszTVq5WIZJ6lwJ5v1O5jeeyIwnkO9ND1yVIGjcEg8xslHuF5
 jWUgvDvgoJLWRx5uMLlxIVr6UQnA8kp83DMH0sMQBTbn4z/wk2j6l6LBWZKBABHcfqvC
 LieaCjVrc3VGnEhqDm6Wy+yZE2v+ngPoLy2PkzlhOTK7ip8LkCSyCbPns6wa1VIUAn6B
 gnrg==
X-Gm-Message-State: ACgBeo2M4vHw+sJT3xGt/GbDIftWGw/eAS96McdL1AtmRMUHXI0hdZ90
 dRXPQ6J4czcan8TwTkMcVV4=
X-Google-Smtp-Source: AA6agR4rG9EXV1E/55fesrVFOXE77lWvaBqXkzFJkUjVwNbVeqHEEiHG7UvgGt+kX2D0zKBcZVYK9g==
X-Received: by 2002:a17:90a:3c89:b0:1fa:acc2:bafe with SMTP id
 g9-20020a17090a3c8900b001faacc2bafemr21251569pjc.84.1662407254825; 
 Mon, 05 Sep 2022 12:47:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 v63-20020a622f42000000b0053e20a0333fsm27362pfv.93.2022.09.05.12.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:47:34 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:47:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using
 devm_fwnode_gpiod_get()
Message-ID: <YxZSUlCPEE9o/s4G@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
 <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
 <CAHp75VcisCTYoRp-=713YKtwi7BQyPKGiUhF4DkpfAFtvDXCiQ@mail.gmail.com>
 <c696b9bf-d0ce-1c6a-0ee3-939b180891be@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c696b9bf-d0ce-1c6a-0ee3-939b180891be@roeck-us.net>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci <linux-pci@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 05, 2022 at 08:49:58AM -0700, Guenter Roeck wrote:
> On 9/5/22 08:21, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 6:13 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > On 9/5/22 04:09, Andy Shevchenko wrote:
> > > > On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > 
> > ...
> > 
> > > > > +       count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
> > > > > +       if (count < 0 && count != -EINVAL)
> > > > > +               return count;
> > > > > +
> > > > > +       if (count > 0) {
> > > > 
> > > > > +               if (count > ARRAY_SIZE(hw_margin))
> > > > > +                       return -EINVAL;
> > > > 
> > > > Why double check? You may move it out of the (count > 0).
> >
> > > Two checks will always be needed, so I don't entirely see
> > > how that would be better.
> > 
> > But not nested. That's my point:
> > 
> > if (count > ARRAY_SIZE())
> >    return ...
> > if (count > 0)
> >    ...
> > 
> 
> The old code has either 1 or two checks if there is no error.
> Your suggested code has always two checks. I don't see how that
> is an improvement.
> 
> > > > > -       if (ret == 1)
> > > > > -               hw_margin_max = hw_margin[0];
> > > > 
> > > > > +               ret = device_property_read_u32_array(dev->parent,
> > > > > +                                                    "rohm,hw-timeout-ms",
> > > > > +                                                    hw_margin, count);
> > > > > +               if (ret < 0)
> > > > > +                       return ret;
> > > > 
> > > > So, only this needs the count > 0 check since below already has it implicitly.
> > > > 
> > > Sorry, I don't understand this comment.
> > 
> > if (count > 0) {
> >    ret = device_property_read_u32_array(...);
> >    ...
> > }
> > if (count == 1)
> >   ...
> > if (count == 2)
> >   ...
> > 
> > But here it might be better to have the nested conditionals.
> > 
> 
> We know that count is either 1 or 2 here, so strictly speaking
> 	if (count == 1) {
> 	} else {
> 	}
> would be sufficient. On the other side, that depends on ARRAY_SIZE() being
> exactly 2, so
> 	if (count == 1) {
> 	} else if (count == 2) {
> 	}
> would also make sense. Either way is fine with me. I'll leave it up
> to Dmitry to decide what he wants to do.

My goal is to drop usage of devm_gpiod_get_from_of_node(), beyond that I
do not have strong preferences either way really. It is probing code, so
performance is not critical, but I'm obviously satisfied with how the
code looks now, or I would not have sent it.

Thanks.

-- 
Dmitry
