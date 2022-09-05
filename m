Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAF65AD58E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 16:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6486010E3D0;
	Mon,  5 Sep 2022 14:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD7410E3D0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 14:55:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDF49B8119E;
 Mon,  5 Sep 2022 14:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55311C433D6;
 Mon,  5 Sep 2022 14:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662389702;
 bh=KP3EocuoUIX0AopCG1aLZXX8OYIQkU7XDQRdtjESgfQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FdxBqiI3p6ZeO4T+XjgQ9CZ/qt69KGDmMaAKKfHX9rJZ8Jk2TFPVgg1SqnsdqhkRa
 WdDaWxcTHblfVGvoG78rdGhCY73SymRtwQ5E/O1+kJIRSFwSWC0iH+WVUYcuf4J/9I
 kQ4DrYany8AlhFZ13jcgU8XtxHsAoxcrTSwCZVrc48ljSqB9o/UKBtoojYJQze+tiV
 fvGYoDbk0jy7TuqUrjjHekuf1hzLJkMS/QgninQfO1rY7Se8Wee7G0k3IhatOzVCte
 WkV36G3IYztJIvQ66OoflpORRaQbBmetX5gw4GgXfwKRTNy74S54TTBmoN34wl7/kT
 uSzb6UrdEavlg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Daniel Vetter <daniel@ffwll.ch>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Marc Zyngier <maz@kernel.org>, Krzysztof Wilczyński <kw@linux.com>,
 Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@kernel.org>, Pali Rohár <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
Subject: Re: (subset) [PATCH v1 00/11] Get rid of
 [devm_]gpiod_get_from_of_node() public APIs
Message-Id: <166238969501.661295.8416403465203041511.b4-ty@kernel.org>
Date: Mon, 05 Sep 2022 15:54:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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
Cc: linux-watchdog@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 4 Sep 2022 23:30:52 -0700, Dmitry Torokhov wrote:
> I would like to stop exporting OF-specific [devm_]gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit. We can do that by switching drivers
> to use generic fwnode API ([devm_]fwnode_gpiod_get()). By doing so we open
> the door to augmenting device tree and ACPI information through secondary
> software properties (once we teach gpiolib how to handle those).
> 
> I hope that relevant maintainers will take patches through their trees and
> then we could merge the last one some time after -rc1.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[08/11] regulator: bd71815: switch to using devm_fwnode_gpiod_get()
        commit: 97c9278ec624a0d5d7c56aa20e16afc8aaa96557
[09/11] regulator: bd9576: switch to using devm_fwnode_gpiod_get()
        commit: 587bfe3f7a270f0a4076e624d318292324bdead8

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
