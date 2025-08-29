Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A04AB3C350
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 21:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA3310EC47;
	Fri, 29 Aug 2025 19:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uPYEnPUU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB7010EC59
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 19:51:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 93AD540BAC;
 Fri, 29 Aug 2025 19:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346BBC4CEF0;
 Fri, 29 Aug 2025 19:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756497082;
 bh=iE1fOPe+H/DOT9l+qqw7zhT3aTQ0dSMmo1kdS8d+f20=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uPYEnPUUg4/LuQVFtqhOOS0tGS/0OVJpM+KchdKwqnpfkH0/J3whjo1E0NBxW4gpi
 uJDXfPT2+7W9SvWuvKxITtr+9wgDa0PLPjlOlPveFqy+zGxeJXRW3bmLtv6e6tXZkm
 Lt0jKmNEbrsoJG57fd3KAzrHhMHII+VJCvAN8o9yIncXsE2LjVvdVRlbplw8VmHBsq
 nEieoqr4Hd58x1XnW+1xWPl9IbBCsaBFlrOtBOQRsS5iKDBvoMcj7GYIAOBvWu/48K
 9ZUoI9CDe2TXQXinfy+0J0W3S8zuoPtSs1TE+Ci/Y2CLPC2Ymd1DL36wGlg46kmRHz
 JZChNYlMpZoRQ==
Date: Fri, 29 Aug 2025 14:51:19 -0500
From: Rob Herring <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Michael Turquette <mturquette@baylibre.com>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 00/37] arm64: Add initial device trees for Apple M2
 Pro/Max/Ultra devices
Message-ID: <20250829195119.GA1206685-robh@kernel.org>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 28, 2025 at 04:01:19PM +0200, Janne Grunau wrote:
> This series adds device trees for Apple's M2 Pro, Max and Ultra based
> devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
> follow design of the t600x family so copy the structure of SoC *.dtsi
> files.
> 
> t6020 is a cut-down version of t6021, so the former just includes the
> latter and disables the missing bits.
> 
> t6022 is two connected t6021 dies. The implementation seems to use
> t6021 and disables blocks based on whether it is useful to carry
> multiple instances. The disabled blocks are mostly on the second die.
> MMIO addresses on the second die have a constant offset. The interrupt
> controller is multi-die aware. This setup can be represented in the
> device tree with two top level "soc" nodes. The MMIO offset is applied
> via "ranges" and devices are included with preprocessor macros to make
> the node labels unique and to specify the die number for the interrupt
> definition.
> 
> The devices itself are very similar to their M1 Pro, M1 Max and M1 Ultra
> counterparts. The existing device templates are SoC agnostic so the new
> devices can reuse them and include their t602{0,1,2}.dtsi file. The
> minor differences in pinctrl and gpio numbers can be easily adjusted.
> 
> With the t602x SoC family Apple introduced two new devices:
> 
> The M2 Pro Mac mini is similar to the larger M1 and M2 Max Mac Studio. The
> missing SDHCI card reader and two front USB3.1 type-c ports and their
> internal USB hub can be easily deleted.
> 
> The M2 Ultra Mac Pro (tower and rack-mount cases) differs from all other
> devices but may share some bits with the M2 Ultra Mac Studio. The PCIe
> implementation on the M2 Ultra in the Mac Pro differs slightly. Apple
> calls the PCIe controller "apcie-ge" in their device tree. The
> implementation seems to be mostly compatible with the base t6020 PCIe
> controller. The main difference is that there is only a single port with
> with 8 or 16 PCIe Gen4 lanes. These ports connect to a Microchip
> Switchtec PCIe switch with 100 lanes to which all internal PCIe devices
> and PCIe slots connect too.
> 
> This series does not include PCIe support for the Mac Pro for two
> reasons:
> - the linux switchtec driver fails to probe and the downstream PCIe
>   connections come up as PCIe Gen1
> - some of the internal devices require PERST# and power control to come
>   up. Since the device are connected via the PCIe switch the PCIe
>   controller can not do this. The PCI slot pwrctrl can be utilized for
>   power control but misses integration with PERST# as proposed in [1].
> 
> This series depends on "[PATCH v2 0/5] Apple device tree sync from
> downstream kernel" [2] due to the reuse of the t600x device templates
> (patch dependencies and DT compilation) and 4 page table level support
> in apple-dart and io-pgtable-dart [3] since the dart instances report
> 42-bit IAS (IOMMU device attach fails without the series).
> 
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatibles anymore [1]. Instead either the first
> compatible SoC or t8103 is used as fallback compatible supported by the
> drivers. t8103 is used as default since most drivers and bindings were
> initially written for M1 based devices.

An issue here is any OS without the compatibles added to the drivers 
won't work. Does that matter here? Soon as you need any new drivers or 
significant driver changes it won't. The compatible additions could be 
backported to stable. They aren't really any different than new PCI IDs 
which get backported.

Rob
