Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A605ACB8E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 09:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D935110E1D8;
	Mon,  5 Sep 2022 07:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4573210E1D8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 07:00:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C5AE610D5;
 Mon,  5 Sep 2022 07:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7C2C4347C;
 Mon,  5 Sep 2022 07:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662361249;
 bh=sMqNChAqUECLA/JxRoCLreDX4YMFCPUAc1lHPAydczs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jQjAxvsHcmQag5VnQ24RHPh71SfFAnZs3r5os/qxcy2nP7pTiLrT8aZ2UJaioDTdX
 sGsVDpUjt9mNTJD1dW9aYcOALEb/jjWD0tvFriCDkrKnWVUJvIP7WqJglzJaMnRFS2
 TsdugTYds2kNcKwWnNS0pI0CnwAdOf4NHbUt1cf9oalUU8EmzRVxw8LgZyN8zlLoem
 ft9mOcKkFeipIujNN+nhxULQAa2YtPZlRdezV5Bx2YBixBzIBh+MMmwMIhxO5cJxzy
 zFG1mfj+u+Lub4ECQeFYAZGmVT7vE84nZY9fgIUnFx9Hoecvlb8u37uBG8v3SPolrE
 4VCPdOFkB7Pcg==
Received: by pali.im (Postfix)
 id 3D0927D7; Mon,  5 Sep 2022 09:00:46 +0200 (CEST)
Date: Mon, 5 Sep 2022 09:00:46 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v1 06/11] PCI: aardvark: switch to using
 devm_gpiod_get_optional()
Message-ID: <20220905070046.46nlhczkck2ufr4x@pali>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
User-Agent: NeoMutt/20180716
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

On Sunday 04 September 2022 23:30:58 Dmitry Torokhov wrote:
> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> device property API.
> 
> I believe that the only reason the driver, instead of the standard
> devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
> because it wanted to set up a pretty consumer name for the GPIO,

IIRC consumer name is not used at all.

The reason was to specify full name of DTS property, for easier
identification of the code. DTS property is "reset-gpios" but API
specify only "reset".

> and we now have a special API for that.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> index 4834198cc86b..4a8a4a8522cb 100644
> --- a/drivers/pci/controller/pci-aardvark.c
> +++ b/drivers/pci/controller/pci-aardvark.c
> @@ -1856,20 +1856,19 @@ static int advk_pcie_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	pcie->reset_gpio = devm_gpiod_get_from_of_node(dev, dev->of_node,
> -						       "reset-gpios", 0,
> -						       GPIOD_OUT_LOW,
> -						       "pcie1-reset");
> +	pcie->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>  	ret = PTR_ERR_OR_ZERO(pcie->reset_gpio);
>  	if (ret) {
> -		if (ret == -ENOENT) {
> -			pcie->reset_gpio = NULL;
> -		} else {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(dev, "Failed to get reset-gpio: %i\n",
> -					ret);
> -			return ret;
> -		}
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get reset-gpio: %i\n",
> +				ret);
> +		return ret;
> +	}
> +
> +	ret = gpiod_set_consumer_name(pcie->reset_gpio, "pcie1-reset");
> +	if (ret) {
> +		dev_err(dev, "Failed to set reset gpio name: %d\n", ret);
> +		return ret;
>  	}
>  
>  	ret = of_pci_get_max_link_speed(dev->of_node);
> 
> -- 
> b4 0.10.0-dev-fc921
