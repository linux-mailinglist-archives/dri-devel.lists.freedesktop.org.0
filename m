Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A50E84EA44
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 22:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A146F10EDFA;
	Thu,  8 Feb 2024 21:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L5BmvqcR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E011E10EDFA
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 21:21:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9718260B33;
 Thu,  8 Feb 2024 21:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289CDC433F1;
 Thu,  8 Feb 2024 21:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707427313;
 bh=oqvxtofftemHVkqCtUvTHWJMUcVkNerevyhL33rOVTg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=L5BmvqcRkgnwQazmD6GNbT/V4WhBK5Jh6gNZcDqvZtq3vD3bjm4E5j4iLEoOGBSf2
 9F9jyrrWriCDl5Wu0BAXPhkb1g056buOTe2Ztq7rnNXkEo1LQlxR/MS5DrRDwOGECL
 PzXvkI3prpHFsJQ85rgk8WagJHAGPijl/nL+cwohJK5pgSdWN4EVlzkTj2GSjD78+U
 Do4/ScbKYtsrkZ/UX5X3+BMEO6gp6SsFMVnpleSnv3fJUOOdIaypIpDthmOW76tyzt
 Evsw5NI06O+Mh6/qIrxzDT3P++ocGhgYPwbeQwHydxaTl96OS/0UKdfbCWCgOU5q38
 wcv+IJzWFU9dQ==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>, 
 Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, 
 Stefan Schmidt <stefan@datenfreihafen.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-input@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Sergey Kozlov <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, 
 Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, 
 linux-mtd@lists.infradead.org, Simon Horman <horms@kernel.org>, 
 Ronald Wahl <ronald.wahl@raritan.com>, Benson Leung <bleung@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
 chrome-platform@lists.linux.dev, Michal Simek <michal.simek@amd.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 Viresh Kumar <vireshk@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 greybus-dev@lists.linaro.org, Peter Huewe <peterhuewe@gmx.de>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 linux-integrity@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>, 
 libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Bjorn Helgaas <bhelgaas@google.com>, 
 James Clark <james.clark@arm.com>, linux-doc@vger.kernel.org
In-Reply-To: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 00/32] spi: get rid of some legacy macros
Message-Id: <170742729486.2266792.11643460714402047207.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 21:21:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
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

On Wed, 07 Feb 2024 19:40:14 +0100, Uwe Kleine-König wrote:
> Changes since v2
> (https://lore.kernel.org/linux-spi/cover.1705944943.git.u.kleine-koenig@pengutronix.de):
> 
>  - Drop patch "mtd: rawnand: fsl_elbc: Let .probe retry if local bus is
>    missing" which doesn't belong into this series.
>  - Fix a build failure noticed by the kernel build bot in
>    drivers/spi/spi-au1550.c. (I failed to catch this because this driver
>    is mips only, but not enabled in a mips allmodconfig. That's a bit
>    unfortunate, but not easily fixable.)
>  - Add the Reviewed-by: and Acked-by: tags I received for v2.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[01/32] fpga: ice40-spi: Follow renaming of SPI "master" to "controller"
        commit: 227ab73b89d66e3064b3c2bcb5fe382b1815763d
[02/32] ieee802154: ca8210: Follow renaming of SPI "master" to "controller"
        commit: 167b78446706bb4d19f7dd93ca320aed25ae1bbd
[03/32] iio: adc: ad_sigma_delta: Follow renaming of SPI "master" to "controller"
        commit: 2780e7b716a605781dbee753ef4983d775a65427
[04/32] Input: pxspad - follow renaming of SPI "master" to "controller"
        commit: a78acec53b8524593afeed7258a442adc3450818
[05/32] Input: synaptics-rmi4 - follow renaming of SPI "master" to "controller"
        commit: 1245633c61baf159fcc1303d7f0855f49831b9c1
[06/32] media: mgb4: Follow renaming of SPI "master" to "controller"
        commit: 2c2f93fbfba7186cc081e23120f169eac3b5b62a
[07/32] media: netup_unidvb: Follow renaming of SPI "master" to "controller"
        commit: cfa13a64bd631d8f04a1c385923706fcef9a63ed
[08/32] media: usb/msi2500: Follow renaming of SPI "master" to "controller"
        commit: dd868ae646d5770f80f90dc056d06eb2e6d39c62
[09/32] media: v4l2-subdev: Follow renaming of SPI "master" to "controller"
        commit: d920b3a672b7f79cd13b341234aebd49233f836c
[10/32] misc: gehc-achc: Follow renaming of SPI "master" to "controller"
        commit: 26dcf09ee5d9ceba2c627ae3ba174a229f25638f
[11/32] mmc: mmc_spi: Follow renaming of SPI "master" to "controller"
        commit: b0a6776e53403aa380411f2a43cdefb9f00ff50a
[12/32] mtd: dataflash: Follow renaming of SPI "master" to "controller"
        commit: 44ee998db9eef84bf005c39486566a67cb018354
[13/32] net: ks8851: Follow renaming of SPI "master" to "controller"
        commit: 1cc711a72ae7fd44e90839f0c8d3226664de55a2
[14/32] net: vertexcom: mse102x: Follow renaming of SPI "master" to "controller"
        commit: 7969b98b80c0332f940c547f84650a20aab33841
[15/32] platform/chrome: cros_ec_spi: Follow renaming of SPI "master" to "controller"
        commit: 85ad0ec049a771c4910c8aebb2d0bd9ce9311fd9
[16/32] spi: bitbang: Follow renaming of SPI "master" to "controller"
        commit: 2259233110d90059187c5ba75537eb93eba8417b
[17/32] spi: cadence-quadspi: Don't emit error message on allocation error
        commit: e71011dacc3413bed4118d2c42f10736ffcd762c
[18/32] spi: cadence-quadspi: Follow renaming of SPI "master" to "controller"
        commit: 28e59d8bf1ace0ddf05f989a48d6824d75731267
[19/32] spi: cavium: Follow renaming of SPI "master" to "controller"
        commit: 1747fbdedba8b6b3fd459895ed5d57e534549884
[20/32] spi: geni-qcom: Follow renaming of SPI "master" to "controller"
        commit: 14cea92338a0776c1615994150e738ac0f5fbb2c
[21/32] spi: loopback-test: Follow renaming of SPI "master" to "controller"
        commit: 2c2310c17fac13aa7e78756d7f3780c7891f9397
[22/32] spi: slave-mt27xx: Follow renaming of SPI "master" to "controller"
        commit: 8197b136bbbe64a7cab1020a4b067020e5977d98
[23/32] spi: spidev: Follow renaming of SPI "master" to "controller"
        commit: d934cd6f0e5d0052772612db4b07df60cb9da387
[24/32] staging: fbtft: Follow renaming of SPI "master" to "controller"
        commit: bbd25d7260eeeaef89f7371cbadcd33dd7f7bff9
[25/32] staging: greybus: spi: Follow renaming of SPI "master" to "controller"
        commit: ee3c668dda3d2783b0fff4091461356fe000e4d8
[26/32] tpm_tis_spi: Follow renaming of SPI "master" to "controller"
        commit: b6af14eacc8814b0986e20507df423cebe9fd859
[27/32] usb: gadget: max3420_udc: Follow renaming of SPI "master" to "controller"
        commit: 8c716f4a3d4fcbec976247e3443d36cbc24c0512
[28/32] video: fbdev: mmp: Follow renaming of SPI "master" to "controller"
        commit: b23031e730e72ec9067b7c38c25e776c5e27e116
[29/32] wifi: libertas: Follow renaming of SPI "master" to "controller"
        commit: 30060d57cee194d6b70283f2faf787e2fdc61b6e
[30/32] spi: fsl-lib: Follow renaming of SPI "master" to "controller"
        commit: 801185efa2402dce57828930e9684884fc8d62da
[31/32] spi: Drop compat layer from renaming "master" to "controller"
        commit: 620d269f29a569ba37419cc03cf1da2d55f6252a
[32/32] Documentation: spi: Update documentation for renaming "master" to "controller"
        commit: 76b31eb4c2da3ddb3195cc14f6aad24908adf524

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

