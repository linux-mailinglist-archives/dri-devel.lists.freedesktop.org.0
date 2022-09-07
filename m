Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9025AF996
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 04:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3F410E025;
	Wed,  7 Sep 2022 02:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3B310E012
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 02:01:02 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id v5so13050701plo.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 19:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=YaCijregOqOjgcZeIED7JVmldRewR4dEphbJlxDQblY=;
 b=S9pRunUxPC7r0e1w9yj0o8783wojVpjNhKP8jsT71wWMuWPsfUFzdJz0TJMPpqTsPB
 M+Ae8ANyYrV4Sep3x0VbDc+EnMue4OoEN8RpFTpOjPkluJnGT2cqlVh1JYNiO5h/tDGK
 RGVJLwVuP7GISwNRAdT5OiqdenVIGFNKEJzKBNq2q1BXIKHlp8tWKx0fxbOK8GA6DZwQ
 TZfa9JbPfMPcxWCYQlbaTpn5opve5VlejEuuBRLWTpxblG8WQDMhb5np+dyWJJ6kAEEW
 rXWcB3V4lQHvMssIFHI0kdZjP9pomfXdXnH1i/sJC8kJC91PlHbGOcBl6u1/CPq1k3ff
 5tAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=YaCijregOqOjgcZeIED7JVmldRewR4dEphbJlxDQblY=;
 b=J3QFf2t33Eufp+qLUTITsjFbrgwkuDoaJlujexL2bCL5yFkmV0x3LsTlbixibggpF2
 t06a2R9O4B/JRwEBviZFJJnvgPttkQDbjBpUrBj4ZZJPmqiGNU37rUJDdPizUlHzLbX6
 PG1uhNeUCt4PhbDLuggNVv6QkFeg7lpYpwTdY8/FzxX18qpi1ME9fzMGBFls8lvzoOGp
 xVZgHxj42B/7hGKL0D7I3yJ2MyZnWwth/alhACLndyJSCpEaPl2W1rnVeYp+Kgj1V9wE
 zl9y+EWmXGHtSNHfOkyN0RYADJkc6v14wmEmrc2YwiorSGLIB9pbsyCBF7Amo7RbuRUa
 jfnw==
X-Gm-Message-State: ACgBeo065RpdIu7Fx7k3lR9xj8IPK+NVbsmGXsdsAITKcAq6bngVQNzb
 6Uf1F1gRi0HcenwO5DvJzAY=
X-Google-Smtp-Source: AA6agR4W7OfcLFzEOrvTrf5AWbvTtcvq1nW6dbnnaSOnulUmzjwEL9HxLO3xrl5g0PyDmCwuPzMlMg==
X-Received: by 2002:a17:90b:3ec7:b0:1fa:cdc1:f66 with SMTP id
 rm7-20020a17090b3ec700b001facdc10f66mr28531683pjb.167.1662516062292; 
 Tue, 06 Sep 2022 19:01:02 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:abc4:5d24:5a73:a96b])
 by smtp.gmail.com with ESMTPSA id
 a206-20020a621ad7000000b00537d74f58cbsm2322985pfa.69.2022.09.06.19.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 19:01:01 -0700 (PDT)
Date: Tue, 6 Sep 2022 19:00:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using
 devm_fwnode_gpiod_get()
Message-ID: <Yxf7WTFG7xEh2Gv6@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
 <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
 <CAHp75VcisCTYoRp-=713YKtwi7BQyPKGiUhF4DkpfAFtvDXCiQ@mail.gmail.com>
 <c696b9bf-d0ce-1c6a-0ee3-939b180891be@roeck-us.net>
 <YxZSUlCPEE9o/s4G@google.com>
 <73749107-35aa-0720-1a30-02a90c0540fa@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73749107-35aa-0720-1a30-02a90c0540fa@roeck-us.net>
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

On Mon, Sep 05, 2022 at 03:09:05PM -0700, Guenter Roeck wrote:
> On 9/5/22 12:47, Dmitry Torokhov wrote:
> [ ... ]
> > > We know that count is either 1 or 2 here, so strictly speaking
> > > 	if (count == 1) {
> > > 	} else {
> > > 	}
> > > would be sufficient. On the other side, that depends on ARRAY_SIZE() being
> > > exactly 2, so
> > > 	if (count == 1) {
> > > 	} else if (count == 2) {
> > > 	}
> > > would also make sense. Either way is fine with me. I'll leave it up
> > > to Dmitry to decide what he wants to do.
> > 
> > My goal is to drop usage of devm_gpiod_get_from_of_node(), beyond that I
> > do not have strong preferences either way really. It is probing code, so
> > performance is not critical, but I'm obviously satisfied with how the
> > code looks now, or I would not have sent it.
> > 
> 
> Good point.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter, individual patches are going through maintainer's trees, will
you take this one?

Thanks.

-- 
Dmitry
