Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5C883AFF3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 18:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EDF10F7B1;
	Wed, 24 Jan 2024 17:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0366A10F7B1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 17:31:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 443BB61DE4;
 Wed, 24 Jan 2024 17:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2D0C433C7;
 Wed, 24 Jan 2024 17:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1706117457;
 bh=NNDXRpvhIGTKBi9slZ/qWQEGn6Uj559Gpw2fxZO2A8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TE8sMbvfIUEPS7l+FWWrLd9ucrffQrWpUeULzzDGbHOZntLPKHC9u7ekCFztLhU3U
 g9c/BN8CkGH0i32zPynRDSS6j46gbVDA6ioIe6yR345V3vEOlOOOrQK63M5gAF7wrU
 bDTC1oJaRecQ9F29HgZfYDFNvnxiLNzNXD19CPf8=
Date: Wed, 24 Jan 2024 09:30:56 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 00/33] spi: get rid of some legacy macros
Message-ID: <2024012439-machinist-amazingly-2d2c@gregkh>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
 <2024012417-prissy-sworn-bc55@gregkh>
 <c1e38a30-5075-4d01-af24-ac684e77cf29@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1e38a30-5075-4d01-af24-ac684e77cf29@sirena.org.uk>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Ronald Wahl <ronald.wahl@raritan.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>, libertas-dev@lists.infradead.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Alex Elder <elder@kernel.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, kernel@pengutronix.de, linux-media@vger.kernel.org,
 linux-wpan@vger.kernel.org,
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 linux-doc@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>,
 Max Filippov <jcmvbkbc@gmail.com>, Eric Dumazet <edumazet@google.com>,
 James Clark <james.clark@arm.com>, Guenter Roeck <groeck@chromium.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 chrome-platform@lists.linux.dev,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Viresh Kumar <vireshk@kernel.org>, Helge Deller <deller@gmx.de>,
 Wu Hao <hao.wu@intel.com>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, greybus-dev@lists.linaro.org,
 Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 "David S. Miller" <davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>,
 Simon Horman <horms@kernel.org>, linux-integrity@vger.kernel.org,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>, linux-iio@vger.kernel.org,
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, linux-staging@lists.linux.dev,
 Yang Yingliang <yangyingliang@huawei.com>, Paolo Abeni <pabeni@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-input@vger.kernel.org,
 Moritz Fischer <mdf@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benson Leung <bleung@chromium.org>, Rayyan Ansari <rayyan@ansari.sh>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>, Xu Yilun <yilun.xu@intel.com>,
 Alexander Aring <alex.aring@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Peter Huewe <peterhuewe@gmx.de>, Sergey Kozlov <serjk@netup.ru>,
 Richard Weinberger <richard@nod.at>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 linux-mediatek@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 05:22:00PM +0000, Mark Brown wrote:
> On Wed, Jan 24, 2024 at 09:13:49AM -0800, Greg Kroah-Hartman wrote:
> > On Mon, Jan 22, 2024 at 07:06:55PM +0100, Uwe Kleine-König wrote:
> 
> > > Note that Jonathan Cameron has already applied patch 3 to his tree, it
> > > didn't appear in a public tree though yet. I still included it here to
> > > make the kernel build bots happy.
> 
> > Are we supposed to take the individual changes in our different
> > subsystem trees, or do you want them all to go through the spi tree?
> 
> Given that the final patch removes the legacy interfaces I'm expecting
> to take them via SPI.

Great, thanks, I'll go ack the subsystem patches that are relevent for
me.

greg k-h
