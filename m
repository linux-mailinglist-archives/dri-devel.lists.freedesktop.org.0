Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D86F67931E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 09:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279EB10E62F;
	Tue, 24 Jan 2023 08:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 7441 seconds by postgrey-1.36 at gabe;
 Mon, 23 Jan 2023 16:25:39 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CE910E1CF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:25:39 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30NELWXp089410;
 Mon, 23 Jan 2023 08:21:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1674483692;
 bh=BlwQD0ARUqblb48RoEOI25OrVzMPGwg0R8vqptzkpJg=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=FvdWBlHevL+XhAXaPy6/J5HISPF/VxUYp4ghd1OWL43dNVfYvXx7g2ekBT5wQUebb
 Z/07W4YvJKF6TF7RTc4RvQAKzkBGhqILEYF+bDhNVaut9uibJTMsoi4PzBJtGFNdxQ
 U3G4OdSkYHOE3bCY4gA0ok7R5fHJd+5EAWcvuU0g=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30NELW7M048257
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 23 Jan 2023 08:21:32 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 23
 Jan 2023 08:21:31 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 23 Jan 2023 08:21:31 -0600
Received: from [10.250.234.171] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30NEKpI9018755;
 Mon, 23 Jan 2023 08:20:53 -0600
Message-ID: <90084f5f-6e9d-7b17-5487-3b4b01bd5e7d@ti.com>
Date: Mon, 23 Jan 2023 19:50:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 02/13] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Content-Language: en-US
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, <broonie@kernel.org>, 
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
 <pratyush@kernel.org>, <sanju.mehta@amd.com>,
 <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>, <kdasu.kdev@gmail.com>,
 <f.fainelli@gmail.com>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
 <eajames@linux.ibm.com>, <olteanv@gmail.com>, <han.xu@nxp.com>,
 <john.garry@huawei.com>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>, <narmstrong@baylibre.com>,
 <khilman@baylibre.com>, <matthias.bgg@gmail.com>, <haibo.chen@nxp.com>,
 <linus.walleij@linaro.org>, <daniel@zonque.org>,
 <haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>,
 <agross@kernel.org>, <bjorn.andersson@linaro.org>, <heiko@sntech.de>,
 <krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
 <masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
 <rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <alex.aring@gmail.com>,
 <stefan@datenfreihafen.org>, <kvalo@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <skomatineni@nvidia.com>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <j.neuschaefer@gmx.net>,
 <vireshk@kernel.org>, <rmfrfs@gmail.com>, <johan@kernel.org>,
 <elder@kernel.org>, <gregkh@linuxfoundation.org>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
From: Dhruva Gole <d-gole@ti.com>
In-Reply-To: <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 24 Jan 2023 08:30:12 +0000
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
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 konrad.dybcio@somainline.org, dri-devel@lists.freedesktop.org,
 tali.perry1@gmail.com, ldewangan@nvidia.com, linux-mtd@lists.infradead.org,
 alim.akhtar@samsung.com, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, git@amd.com, linux-samsung-soc@vger.kernel.org,
 benjaminfair@google.com, yogeshgaur.83@gmail.com, openbmc@lists.ozlabs.org,
 linux-staging@lists.linux.dev, yuenn@google.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-imx@nxp.com, amitrkcian2002@gmail.com, Michael.Hennerich@analog.com,
 martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org,
 radu_nicolae.pirea@upb.ro, greybus-dev@lists.linaro.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 avifishman70@gmail.com, venture@google.com, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com,
 fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, andrew@aj.id.au,
 michael@walle.cc, palmer@dabbelt.com, kernel@pengutronix.de,
 netdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Amit,

On 20/01/23 00:23, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpiod
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.
>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
> [...]
>  drivers/spi/spi-cadence-quadspi.c |  5 +++--
>  drivers/spi/spi-cadence-xspi.c    |  4 ++--
>  drivers/spi/spi-cadence.c         |  4 ++--
[...]

For SPI Cadence QSPI,
Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

