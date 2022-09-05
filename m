Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5410B5ADBD5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 01:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B738C10E4F3;
	Mon,  5 Sep 2022 23:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A08510E4F5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 23:18:50 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id 9so6401108plj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 16:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=/jqGrlOkEmBNjfkgs8nQW3ROS8ZrNR4/ALxdUn5IrPk=;
 b=ilcjNtA9e+sPl0lsYgQkDwLCllTb2CiNUB5lHZ6JeNqUXFPhLppke4bm+tXK6piFK1
 OXX3EAUgJSmDrfpfXWx/gxfIHEm2Ll5i3Co8kZmFkD+xJ+3h2g4/t3iiwcCHTb2nJzBQ
 lbOD/k+fLbzcC8HBgysilDjSnQ1ZbXkHWL+70V9Wt9ed7HVcmNaLtsVWn3S7QudoyNrm
 Tq2TeNuUosg71GwV6fxG+rz0aEcyELSi2RShJByRv/vyFIdszNuT6j8i8+cZEV+vX59E
 NXtPK9gzYwxXVVePAldhDwWgJuboRZn5lOgdBc1/dRtrt2Cv4uHi9z8kuWuYzv1zT79p
 tLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=/jqGrlOkEmBNjfkgs8nQW3ROS8ZrNR4/ALxdUn5IrPk=;
 b=ADBLAgDJINNsgn44h+tGs5iwrgb9B/CxT77q27F2LDgHmd/hCwqBrY7IQn7tYWr1ut
 Nap9BnDG27pQjUw9pNTvnWfN4gzrNMDzW3KyqPITUCk/N7pjYeCWyCx84MCs18RIeHWx
 gdIsWKizVQetsCv5SqBR8CdCQTFaNR//qfKA9uFMv+6Vw9v97XZwu99KUS7Plo2sDfld
 45ms83YssLqvQeV8aP+x/01eUO27dDPVw6f45qW0FuPoZImv9O+Kjgfn0SLaDgVgdUjW
 Ii4oeqEwuXRKLdGMxnqzv3L8QsV9gER4eMDUlbQk/dfAn2EN84klYRRKIGfN7HSNx1KL
 QTsw==
X-Gm-Message-State: ACgBeo3gY0XfexPps5fEVtERj2bkWH/xefhJCJ+8AdL+upYPdXLZ45KE
 AKsn0lWmqm25yklNnnAYQ7c=
X-Google-Smtp-Source: AA6agR7SONkgr8pjyY4NZ8VXkSKoPY330/BgoAO00Ts+AQQkwdonx5V0WIHgyPBEPyBYuNfJLCJm0Q==
X-Received: by 2002:a17:903:186:b0:176:6615:cb8d with SMTP id
 z6-20020a170903018600b001766615cb8dmr19721305plg.135.1662419929430; 
 Mon, 05 Sep 2022 16:18:49 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
 by smtp.gmail.com with ESMTPSA id
 5-20020a17090a190500b001fe444b2245sm7375447pjg.25.2022.09.05.16.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 16:18:48 -0700 (PDT)
Date: Mon, 5 Sep 2022 16:18:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v1 06/11] PCI: aardvark: switch to using
 devm_gpiod_get_optional()
Message-ID: <YxaD1Luja4T/osP5@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
 <20220905070046.46nlhczkck2ufr4x@pali>
 <YxZ+PSDRYZnVKfFO@google.com>
 <20220905231010.ojl4i4ph27qtebiy@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220905231010.ojl4i4ph27qtebiy@pali>
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
 linux-pci@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-watchdog@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 01:10:10AM +0200, Pali Rohár wrote:
> On Monday 05 September 2022 15:54:53 Dmitry Torokhov wrote:
> > On Mon, Sep 05, 2022 at 09:00:46AM +0200, Pali Rohár wrote:
> > > On Sunday 04 September 2022 23:30:58 Dmitry Torokhov wrote:
> > > > I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> > > > so that gpiolib can be cleaned a bit, so let's switch to the generic
> > > > device property API.
> > > > 
> > > > I believe that the only reason the driver, instead of the standard
> > > > devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
> > > > because it wanted to set up a pretty consumer name for the GPIO,
> > > 
> > > IIRC consumer name is not used at all.
> > > 
> > > The reason was to specify full name of DTS property, for easier
> > > identification of the code. DTS property is "reset-gpios" but API
> > > specify only "reset".
> > 
> > I see. Do you want me to reset the patch with updated desctiption as to
> > the reason devm_gpiod_get_from_of_node() was used?
> 
> I think it is fine. So add my:
> 
> Acked-by: Pali Rohár <pali@kernel.org>
> 
> Anyway as another improvement for future I would suggest some API
> function with _optional_ logic, so it could be used for more PCIe

I think we need to see how many are attaching reset lines to subnodes.
If there are multiple then I agree we could add _optional. So far I see:

dtor@dtor-ws:~/kernel/linux-next (gpiod_get_from_of_node-remove)$ git grep '"reset"' -- drivers/pci/controller/
drivers/pci/controller/cadence/pci-j721e.c:             gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
drivers/pci/controller/dwc/pci-keystone.c:      gpiod = devm_gpiod_get_optional(dev, "reset",
drivers/pci/controller/dwc/pci-meson.c: mp->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
drivers/pci/controller/dwc/pcie-dw-rockchip.c:  rockchip->rst_gpio = devm_gpiod_get_optional(&pdev->dev, "reset",
drivers/pci/controller/dwc/pcie-fu740.c:        afp->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
drivers/pci/controller/dwc/pcie-intel-gw.c:     pcie->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
drivers/pci/controller/dwc/pcie-keembay.c:      pcie->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
drivers/pci/controller/dwc/pcie-qcom-ep.c:      pcie_ep->reset = devm_gpiod_get(dev, "reset", GPIOD_IN);
drivers/pci/controller/dwc/pcie-tegra194.c:     pcie->pex_rst_gpiod = devm_gpiod_get(pcie->dev, "reset", GPIOD_IN);
drivers/pci/controller/pci-aardvark.c:  pcie->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
drivers/pci/controller/pci-tegra.c:                                                    "reset",
drivers/pci/controller/pcie-apple.c:                                   "reset", 0, GPIOD_OUT_LOW, "PERST#");
drivers/pci/controller/pcie-mt7621.c:   port->gpio_rst = devm_gpiod_get_index_optional(dev, "reset", slot,

So majority have reset lines attached to the "main" node and thus can use
devm_gpiod_get_optional().

Thanks.

-- 
Dmitry
