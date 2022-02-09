Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6B74B07CF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 09:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6308810E745;
	Thu, 10 Feb 2022 08:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7429B10E415
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:34:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 16C49B821B1;
 Wed,  9 Feb 2022 14:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A31C340E7;
 Wed,  9 Feb 2022 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644417280;
 bh=93WKM7v5/YychVKtJOLIyN7q2nD5WbrrQq2HCEIbMmQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=paJVL2ma/xQI1G5kTxwmnxYV40yVd6zAOk4T3bBsPOR20gskmG8K7ax28vyCSx/cu
 GJ08Q8l0HASluTtO1CMEVwKINoH+YnA6iz+VEIQ7xNOYXef+j5AkR/kJVA/2T7tOk4
 N4eiWAWnLTOnT9YBMgiDXegtl8Ru/BR6+fwYEqwSZZc3PrriaokxTuKZJCkgioNz1b
 drZQFMz9EW2tPiE7O0Etq6wxP5PcE6FcMNn896QR2L8Ozq/NN4jjocf9JoHBXsXxFx
 1Cour/Zh7lN44947sN/Sjpg3SOqFz5rFUTKB1fVUYMhqwEhVGfjancFyovYkIcUfTu
 Fa3sg+IHf/UwA==
From: Mark Brown <broonie@kernel.org>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/5] spi: make remove callback a void function
Message-Id: <164441724879.1527840.5788097152300863157.b4-ty@kernel.org>
Date: Wed, 09 Feb 2022 14:34:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Feb 2022 08:10:20 +0000
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
Cc: , Andrew Lunn <andrew@lunn.ch>,
	Gwendal Grignou <gwendal@chromium.org>,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
	Claudius Heine <ch@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Nanyong Sun <sunnanyong@huawei.com>,
	Zhang Qilong <zhangqilong3@huawei.com>,
	dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Pavel Machek <pavel@ucw.cz>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	linux-clk@vger.kernel.org,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Sidong Yang <realwakka@gmail.com>, libertas-dev@lists.infradead.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jean Delvare <jdelvare@suse.com>,
	Thomas Kopp <thomas.kopp@microchip.com>,
	x-foundation.org@freedesktop.org,
	Łukasz Stelmach <l.stelmach@samsung.com>,
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
	James Schulman <james.schulman@cirrus.com>,
	linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	Nuno Sá <nuno.sa@analog.com>, Michael Walle <michael@walle.cc>,
	Noralf Trønnes <noralf@tronnes.org>, kernel@pengutronix.de,
	Jingoo Han <jingoohan1@gmail.com>, linux-mtd@lists.infradead.org,
	Vladimir Oltean <olteanv@gmail.com>, linux-wpan@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	alsa-devel@alsa-project.org, Dan Robertson <dan@dlrobertson.com>,
	Jérôme Pouiller <jerome.pouiller@silabs.com>,
	Jiri Slaby <jirislaby@kernel.org>, David Airlie <airlied@linux.ie>,
	Marco Felsch <m.felsch@pengutronix.de>,
	David Rhodes <david.rhodes@cirrus.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Solomon Peachy <pizza@shaftnet.org>, Marek Behún <kabel@kernel.org>,
	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Sam Ravnborg <sam@ravnborg.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Minghao Chi <chi.minghao@zte.com.cn>,
	Jon Hunter <jonathanh@nvidia.com>,
	dingsenjie <dingsenjie@yulong.com>, Heiko Schocher <hs@denx.de>,
	Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
	Woojung Huh <woojung.huh@microchip.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Ronald Tschalär <ronald@innovation.ch>,
	Ajay Singh <ajay.kathat@microchip.com>, linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rui Miguel Silva <rmfrfs@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
	Aditya Srivastava <yashsri421@gmail.com>,
	Torin Cooper-Bennun <torin@maxiluxsystems.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-usb@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-integrity@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-staging@lists.linux.dev,
	linux-iio@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	r.kernel.org@freedesktop.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	platform-driver-x86@vger.kernel.org,
	Wei Yongjun <weiyongjun1@huawei.com>,
	Markuss Broks <markuss.broks@gmail.com>, linux-rtc@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Guenter Roeck <groeck@google.com>, Davidlohr Bueso <dbueso@suse.de>,
	Varka Bhadram <varkabhadram@gmail.com>,
	wengjianfeng <wengjianfeng@yulong.com>, linux-input@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Jonathan Neuschäfer <j.neuschaefer@gmx.net>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Mark Gross <markgross@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andrew Morton <akpm@linu>, Stefan Mätje <stefan.maetje@esd.eu>,
	linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
	Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Guenter Roeck <linux@roeck-us.net>, patches@opensource.cirrus.com,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Kent Gustavsson <kent@minoris.se>, Matt Kline <matt@bitbashing.io>,
	Charles-Antoine Couret <charles-antoine.couret@nexvision.fr>,
	Alexander Aring <alex.aring@gmail.com>,
	Jiri Prchal <jiri.prchal@aksignal.cz>,
	Vignesh Raghavendra <vigneshr@ti.com>, Emma Anholt <emma@anholt.net>,
	Peter Zijlstra <peterz@infradead.org>, linux-fbdev@vge,
	Mark Greer <mgreer@animalcreek.com>,
	Alexandru Ardelean <ardeleanalex@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Peter Huewe <peterhuewe@gmx.de>, UNGLinuxDriver@microchip.com,
	Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
	Eric Piel <eric.piel@tremplin-utc.net>,
	Stephan Gerhold <stephan@gerhold.net>,
	Noralf Tronnes <notro@tronnes.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Xue Liu <liuxuenetmail@gmail.com>,
	David Lechner <david@lechnology.com>, Will Deacon <will@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kalle Valo <kvalo@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Harry Morris <h.morris@cascoda.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Yang Shen <shenyang39@huawei.com>, netdev@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>, Cai Huoqing <caihuoqing@baidu.com>,
	Daniel Mack <daniel@zonque.org>,
	Colin Ian King <colin.king@intel.com>, Helge Deller <deller@gmx.de>,
	Alan Ott <alan@signal11.us>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Jan 2022 18:51:56 +0100, Uwe Kleine-König wrote:
> this series goal is to change the spi remove callback's return value to void.
> After numerous patches nearly all drivers already return 0 unconditionally.
> The four first patches in this series convert the remaining three drivers to
> return 0, the final patch changes the remove prototype and converts all
> implementers.
> 
> The driver core doesn't support error handling on remove, the spi core issues
> only a very generic warning when a remove callback returns an error. If there
> is really the need for a function call that can fail, the driver can issue a
> more helpful error message. I didn't find a single driver where returning
> an error code and error handling in the spi core would have been helpful.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/5] staging: fbtft: Fix error path in fbtft_driver_module_init()
      commit: 7d8e4c98d13b6b54655140d6b6a6a17fbc9b32f1
[2/5] staging: fbtft: Deduplicate driver registration macros
      commit: c222ea5d2f3361458672d1f52c78970aa021cb61
[3/5] tpm: st33zp24: Make st33zp24_remove() a void function
      commit: 316f569df766df9a49c36c052ec6afaf19cb6933
[4/5] platform/chrome: cros_ec: Make cros_ec_unregister() return void
      commit: afb0a80e63d67e957b5d0eb4ade301aff6e13c8c
[5/5] spi: make remove callback a void function
      commit: 2cbfa2128662c6b841f68cd2fe54df199457e38a

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
