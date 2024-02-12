Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D99D85180F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 16:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222A210EDBB;
	Mon, 12 Feb 2024 15:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Co2aU8UO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5BE10EDD4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 15:33:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E07B860BAD;
 Mon, 12 Feb 2024 15:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD66C433F1;
 Mon, 12 Feb 2024 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707752000;
 bh=GFsfkdOmJKsuZtWQAq7OhjxHg4IKHiDCDNVd+Gd58aw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Co2aU8UOdKL4W8SUaaEqV0BTVAuiZ9niMqI5QuXmkWRQqRD+bsuUp32djuJPfJQ7M
 J0AdS/WqPhUm+WDhNwj0PIl1NFZPSx4kaz74w8AVaBO2niEWSvmitVVz0AuwMwTUcd
 8MtOvRT2s7ojnBMUpDpCQjuzEzxH0//zOgasqtDHJDU6fjIDBJFEa6lJkzge7aVnIn
 65sRlXZGfvNWKRj6hhoF+/MvmClp/yoVXWTT6Lqc/PTFBqTwhuA4fpNCA+K8uTOths
 DH2aamg+A5g3aeMmWit1ZUc4X0oSEYy8EtlcvJyPFhdziLYkgWINAXOkx2oWF2pGNL
 vlKQQFPbdC2Dw==
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
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rayyan Ansari <rayyan@ansari.sh>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Sergey Kozlov <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, 
 linux-mtd@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Simon Horman <horms@kernel.org>, Ronald Wahl <ronald.wahl@raritan.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 Max Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>, 
 Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, 
 Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, 
 Herve Codina <herve.codina@bootlin.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>, 
 libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org
In-Reply-To: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH v2 00/33] spi: get rid of some legacy macros
Message-Id: <170775198078.46149.4700126128576800564.b4-ty@kernel.org>
Date: Mon, 12 Feb 2024 15:33:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-a684c
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

On Mon, 22 Jan 2024 19:06:55 +0100, Uwe Kleine-König wrote:
> this is v2 of this patch set.
> 
> Changes since (implicit) v1, sent with Message-Id:
> cover.1705348269.git.u.kleine-koenig@pengutronix.de:
> 
>  - Rebase to v6.8-rc1
>  - Fix a build failure on sh
>  - Added the tags received in (implicit) v1.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[01/33] fpga: ice40-spi: Follow renaming of SPI "master" to "controller"
        commit: 227ab73b89d66e3064b3c2bcb5fe382b1815763d
[02/33] ieee802154: ca8210: Follow renaming of SPI "master" to "controller"
        commit: 167b78446706bb4d19f7dd93ca320aed25ae1bbd
[03/33] iio: adc: ad_sigma_delta: Follow renaming of SPI "master" to "controller"
        commit: 2780e7b716a605781dbee753ef4983d775a65427
[04/33] Input: pxspad - follow renaming of SPI "master" to "controller"
        commit: a78acec53b8524593afeed7258a442adc3450818
[05/33] Input: synaptics-rmi4 - follow renaming of SPI "master" to "controller"
        commit: 1245633c61baf159fcc1303d7f0855f49831b9c1
[06/33] media: mgb4: Follow renaming of SPI "master" to "controller"
        commit: 2c2f93fbfba7186cc081e23120f169eac3b5b62a
[07/33] media: netup_unidvb: Follow renaming of SPI "master" to "controller"
        commit: cfa13a64bd631d8f04a1c385923706fcef9a63ed
[08/33] media: usb/msi2500: Follow renaming of SPI "master" to "controller"
        commit: dd868ae646d5770f80f90dc056d06eb2e6d39c62
[09/33] media: v4l2-subdev: Follow renaming of SPI "master" to "controller"
        commit: d920b3a672b7f79cd13b341234aebd49233f836c
[10/33] misc: gehc-achc: Follow renaming of SPI "master" to "controller"
        commit: 26dcf09ee5d9ceba2c627ae3ba174a229f25638f
[11/33] mmc: mmc_spi: Follow renaming of SPI "master" to "controller"
        commit: b0a6776e53403aa380411f2a43cdefb9f00ff50a
[12/33] mtd: dataflash: Follow renaming of SPI "master" to "controller"
        commit: 44ee998db9eef84bf005c39486566a67cb018354
[14/33] net: ks8851: Follow renaming of SPI "master" to "controller"
        commit: 1cc711a72ae7fd44e90839f0c8d3226664de55a2
[15/33] net: vertexcom: mse102x: Follow renaming of SPI "master" to "controller"
        commit: 7969b98b80c0332f940c547f84650a20aab33841
[16/33] platform/chrome: cros_ec_spi: Follow renaming of SPI "master" to "controller"
        commit: 85ad0ec049a771c4910c8aebb2d0bd9ce9311fd9
[17/33] spi: bitbang: Follow renaming of SPI "master" to "controller"
        commit: 2259233110d90059187c5ba75537eb93eba8417b
[18/33] spi: cadence-quadspi: Don't emit error message on allocation error
        commit: e71011dacc3413bed4118d2c42f10736ffcd762c
[19/33] spi: cadence-quadspi: Follow renaming of SPI "master" to "controller"
        commit: 28e59d8bf1ace0ddf05f989a48d6824d75731267
[20/33] spi: cavium: Follow renaming of SPI "master" to "controller"
        commit: 1747fbdedba8b6b3fd459895ed5d57e534549884
[21/33] spi: geni-qcom: Follow renaming of SPI "master" to "controller"
        commit: 14cea92338a0776c1615994150e738ac0f5fbb2c
[22/33] spi: loopback-test: Follow renaming of SPI "master" to "controller"
        commit: 2c2310c17fac13aa7e78756d7f3780c7891f9397
[23/33] spi: slave-mt27xx: Follow renaming of SPI "master" to "controller"
        commit: 8197b136bbbe64a7cab1020a4b067020e5977d98
[24/33] spi: spidev: Follow renaming of SPI "master" to "controller"
        commit: d934cd6f0e5d0052772612db4b07df60cb9da387
[25/33] staging: fbtft: Follow renaming of SPI "master" to "controller"
        commit: bbd25d7260eeeaef89f7371cbadcd33dd7f7bff9
[26/33] staging: greybus: spi: Follow renaming of SPI "master" to "controller"
        commit: ee3c668dda3d2783b0fff4091461356fe000e4d8
[27/33] tpm_tis_spi: Follow renaming of SPI "master" to "controller"
        commit: b6af14eacc8814b0986e20507df423cebe9fd859
[28/33] usb: gadget: max3420_udc: Follow renaming of SPI "master" to "controller"
        commit: 8c716f4a3d4fcbec976247e3443d36cbc24c0512
[29/33] video: fbdev: mmp: Follow renaming of SPI "master" to "controller"
        commit: b23031e730e72ec9067b7c38c25e776c5e27e116
[30/33] wifi: libertas: Follow renaming of SPI "master" to "controller"
        commit: 30060d57cee194d6b70283f2faf787e2fdc61b6e
[31/33] spi: fsl-lib: Follow renaming of SPI "master" to "controller"
        commit: 801185efa2402dce57828930e9684884fc8d62da
[32/33] spi: Drop compat layer from renaming "master" to "controller"
        commit: 620d269f29a569ba37419cc03cf1da2d55f6252a
[33/33] Documentation: spi: Update documentation for renaming "master" to "controller"
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

