Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252BD5ADB94
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 00:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A3B10E442;
	Mon,  5 Sep 2022 22:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F1D10E442
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 22:54:58 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so13212837pjq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 15:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=QRQkxIGFI3OF3amcRlbkZf4vgkek6ggFXyd9zidvB8c=;
 b=gsorC9ciDElqLq5gq0tq73oj5nMDX/AJm+EMEt5M9j7Nw6OucD0+TVGBzuQn+rrtls
 0loRnw7UzHrgMM28KIGVLo7qn/bZoumg2qTw3CfDMDdQmf0bgbzpShi+kGjU7raGyx6P
 sToiGUYujxqPyCybICNsYdfYAa2jOurTif72VImXpZhCttvifys7wIqhFIW1PJR8dY03
 UzvU99z5GubsoABcuAk5rbAMv44acUIXmY5P0ep133FiqLgOHtVg+wzuulxPweHG+ula
 IzdWZ5ta3aGiqrNbwgZATXaEEWNGQRgzb+HrP6NXzuvsc0zd1wPa546sY9tkILtVErqR
 hUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=QRQkxIGFI3OF3amcRlbkZf4vgkek6ggFXyd9zidvB8c=;
 b=rx75UUnAHc4jN32cV5kDQnJ94s2gllMudOlub8nnMG07zaDhSZnRoh7LRzp44iyqXI
 mDxR1pMzgktFSxToUWuNkntto/8FDez/yqJMek/uSavCZYUWR0VUcqEKvDI6YBIfDkxj
 CiK5j9r3djOtUJyNEbU8+7AhanbvVMbqIhEsCDGC3TiyP4ze/SilGR3W/iF9s4a4cDfn
 gRJtAiusKxPeRtYGh44TvQbDzK0Ey0Uks5EeM1IxYLchJMFldFwKF5sJkS4niKP6rxNR
 vPJvCnW+225Kd9ZIUwX+LxHPqWsMwGJvmZzHJigFRw9u1/boR0/9dLH5PlnPw0Gxanvp
 K4pw==
X-Gm-Message-State: ACgBeo0Z6dRvZdouZMrE06OQOdi4PqvPJ4wkG8sSTq3XV0WcKIdO2km3
 t+XIrYn72boZZL/BoLESJ/w=
X-Google-Smtp-Source: AA6agR6BVwijybUmJvKefzrwHZ9dDsULsMfqVmOf8/ecx+Q6qQipxqieCoJRYSCXP05TF0ANy6CnCA==
X-Received: by 2002:a17:902:be03:b0:175:6397:9425 with SMTP id
 r3-20020a170902be0300b0017563979425mr21493671pls.26.1662418498231; 
 Mon, 05 Sep 2022 15:54:58 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a630e15000000b0042c2def703asm6833366pgl.22.2022.09.05.15.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 15:54:57 -0700 (PDT)
Date: Mon, 5 Sep 2022 15:54:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v1 06/11] PCI: aardvark: switch to using
 devm_gpiod_get_optional()
Message-ID: <YxZ+PSDRYZnVKfFO@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
 <20220905070046.46nlhczkck2ufr4x@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220905070046.46nlhczkck2ufr4x@pali>
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

On Mon, Sep 05, 2022 at 09:00:46AM +0200, Pali Rohár wrote:
> On Sunday 04 September 2022 23:30:58 Dmitry Torokhov wrote:
> > I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> > so that gpiolib can be cleaned a bit, so let's switch to the generic
> > device property API.
> > 
> > I believe that the only reason the driver, instead of the standard
> > devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
> > because it wanted to set up a pretty consumer name for the GPIO,
> 
> IIRC consumer name is not used at all.
> 
> The reason was to specify full name of DTS property, for easier
> identification of the code. DTS property is "reset-gpios" but API
> specify only "reset".

I see. Do you want me to reset the patch with updated desctiption as to
the reason devm_gpiod_get_from_of_node() was used?

> 
> > and we now have a special API for that.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> > index 4834198cc86b..4a8a4a8522cb 100644
> > --- a/drivers/pci/controller/pci-aardvark.c
> > +++ b/drivers/pci/controller/pci-aardvark.c
> > @@ -1856,20 +1856,19 @@ static int advk_pcie_probe(struct platform_device *pdev)
> >  		return ret;
> >  	}
> >  
> > -	pcie->reset_gpio = devm_gpiod_get_from_of_node(dev, dev->of_node,
> > -						       "reset-gpios", 0,
> > -						       GPIOD_OUT_LOW,
> > -						       "pcie1-reset");
> > +	pcie->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> >  	ret = PTR_ERR_OR_ZERO(pcie->reset_gpio);
> >  	if (ret) {
> > -		if (ret == -ENOENT) {
> > -			pcie->reset_gpio = NULL;
> > -		} else {
> > -			if (ret != -EPROBE_DEFER)
> > -				dev_err(dev, "Failed to get reset-gpio: %i\n",
> > -					ret);
> > -			return ret;
> > -		}
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(dev, "Failed to get reset-gpio: %i\n",
> > +				ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = gpiod_set_consumer_name(pcie->reset_gpio, "pcie1-reset");
> > +	if (ret) {
> > +		dev_err(dev, "Failed to set reset gpio name: %d\n", ret);
> > +		return ret;
> >  	}
> >  
> >  	ret = of_pci_get_max_link_speed(dev->of_node);
> > 
> > -- 
> > b4 0.10.0-dev-fc921

Thanks.

-- 
Dmitry
