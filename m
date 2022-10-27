Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B63B60F94B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 15:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D199710E5F3;
	Thu, 27 Oct 2022 13:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C856110E5F3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 13:38:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A842662315;
 Thu, 27 Oct 2022 13:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722B2C433C1;
 Thu, 27 Oct 2022 13:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666877907;
 bh=pllUkLfz45ydi2Wi6jpPnGPo9M25t+6/Kw3UeVHzGdQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XA5Ckkqd0MKG04G1je+NRuX1YlckWLju0xK3x3oUFbwBzEWP6CCfNDpPs4an9dpok
 zTBWBixFCPVT6QiWgG06RRjmUVE+7QhKtLZW6B7yG60cj4z+DP30OQiyW+scbCLjhc
 /E23kdKoDTQanhEvTGk+kVSkBlzowin0Wcf+oPMRuHMB4/tpgnkvmmiqqPZ4NF0Vcq
 p942/XBiczoyTBgTKPBfe9CjdC6F5DbIXfIVQwcdzJ4ryHBrcqdU5Jp1Lva0Po2bTn
 L/okQRXRP0jU38kGSHQZ8g9LmY5hxfULdWp2a9lD5utiwTnV0uXe3TVXFuRzmMBt6V
 TjROlYhclurRw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Richard Weinberger <richard@nod.at>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v1 00/11] Get rid of
 [devm_]gpiod_get_from_of_node() public APIs
Date: Thu, 27 Oct 2022 15:38:11 +0200
Message-Id: <166687787352.847482.10005684512699510391.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

Applied to pci/tegra, thanks!

[01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
        https://git.kernel.org/lpieralisi/pci/c/16e3f4077965

Thanks,
Lorenzo
