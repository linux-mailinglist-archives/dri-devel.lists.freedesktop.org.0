Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89D96780D1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84C110E4EA;
	Mon, 23 Jan 2023 16:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 445 seconds by postgrey-1.36 at gabe;
 Mon, 23 Jan 2023 13:17:55 UTC
Received: from 7.mo552.mail-out.ovh.net (7.mo552.mail-out.ovh.net
 [188.165.59.253])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A316010E493
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 13:17:55 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.167])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 731DB2B568;
 Mon, 23 Jan 2023 13:10:17 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 23 Jan
 2023 14:10:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S0035e8cf7e5-490b-4306-97b9-26c7bcdb01f8,
 A67B952EB2D8D9A0A9F9E7F867E869D975DF4B5D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d1743abc-3d9f-cdf4-dfbe-67aac4b1b8cd@kaod.org>
Date: Mon, 23 Jan 2023 14:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 02/13] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Content-Language: en-US
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, <broonie@kernel.org>, 
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <jic23@kernel.org>, <tudor.ambarus@microchip.com>, <pratyush@kernel.org>,
 <sanju.mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>,
 <kdasu.kdev@gmail.com>, <f.fainelli@gmail.com>, <rjui@broadcom.com>,
 <sbranden@broadcom.com>, <eajames@linux.ibm.com>, <olteanv@gmail.com>,
 <han.xu@nxp.com>, <john.garry@huawei.com>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>, <narmstrong@baylibre.com>, <khilman@baylibre.com>,
 <matthias.bgg@gmail.com>, <haibo.chen@nxp.com>, <linus.walleij@linaro.org>,
 <daniel@zonque.org>, <haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>,
 <agross@kernel.org>, <bjorn.andersson@linaro.org>, <heiko@sntech.de>,
 <krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>, 
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
 <masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
 <rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <alex.aring@gmail.com>, <stefan@datenfreihafen.org>,
 <kvalo@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <skomatineni@nvidia.com>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <j.neuschaefer@gmx.net>, <vireshk@kernel.org>,
 <rmfrfs@gmail.com>, <johan@kernel.org>, <elder@kernel.org>,
 <gregkh@linuxfoundation.org>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d8c081e3-7749-496f-b92b-664d73f13c17
X-Ovh-Tracer-Id: 9743537793859029808
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddukedgfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghmihhtrdhkuhhmrghrqdhmrghhrghprghtrhgrsegrmhgurdgtohhmpdhkohhnrhgrugdrugihsggtihhosehsohhmrghinhhlihhnvgdrohhrghdphihoghgvshhhghgruhhrrdekfeesghhmrghilhdrtghomhdpsggvnhhjrghmihhnfhgrihhrsehgohhoghhlvgdrtghomhdphihuvghnnhesghhoohhglhgvrdgtohhmpdhvvghnthhurhgvsehgohhoghhlvgdrtghomhdpthgrlhhirdhpvghrrhihudesghhmrghilhdrtghomhdpthhmrghimhhonhejjeesghhmrghilhdrtg
 homhdprghvihhfihhshhhmrghnjedtsehgmhgrihhlrdgtohhmpdhmrghrthhinhdrsghluhhmvghnshhtihhnghhlsehgohhoghhlvghmrghilhdrtghomhdplhhinhhugidqihhmgiesnhigphdrtghomhdpfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdgrlhhimhdrrghkhhhtrghrsehsrghmshhunhhgrdgtohhmpdhkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdgstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdgtlhgruhguihhurdgsvgiinhgvrgesmhhitghrohgthhhiphdrtghomhdprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgrughupghnihgtohhlrggvrdhpihhrvggrsehuphgsrdhrohdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdpghhithesrghmugdrtghomhdpghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhfrghntggvrhdrlhgrnhgtvghrsehgmhgrihhlrdgtohhmpdhluggvfigrnhhgrghnsehnvhhiughirgdrtghomhdpmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhlihhnuhigqdgrshhpvggvuge
 slhhishhtshdrohiilhgrsghsrdhorhhgpdhgrhgvhigsuhhsqdguvghvsehlihhsthhsrdhlihhnrghrohdrohhrghdpughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhmihgthhgrvghlseifrghllhgvrdgttgdplhhinhhugidqihhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdpofhitghhrggvlhdrjfgvnhhnvghrihgthhesrghnrghlohhgrdgtohhmpdhlrghrshesmhgvthgrfhhoohdruggvpdhlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdifihhrvghlvghsshesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhisggvrhhtrghsqdguvghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdifphgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdhtvghgrhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvpdhlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdplhhinhhugidqshgrmhhsuhhn
 ghdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqrhhotghktghhihhpsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdplhhinhhugidqrghmlhhoghhitgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdplhhinhhugidqrhhpihdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgpdgvlhguvghrsehkvghrnhgvlhdrohhrghdplhhinhhugidqshhtrghgihhngheslhhishhtshdrlhhinhhugidruggvvhdpjhhohhgrnheskhgvrhhnvghlrdhorhhgpdhvihhrvghshhhksehkvghrnhgvlhdrohhrghdphhgrohhjihgrnhdriihhuhgrnhhgsehgmhgrihhlrdgtohhmpdgurghnihgvlhesiihonhhquhgvrdhorhhgpdhlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdphhgrihgsohdrtghhvghnsehngihprdgtohhmpdhmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdpshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhjohhhnhdrghgrr
 hhrhieshhhurgifvghirdgtohhmpdhhrghnrdiguhesnhigphdrtghomhdpohhlthgvrghnvhesghhmrghilhdrtghomhdpvggrjhgrmhgvsheslhhinhhugidrihgsmhdrtghomhdprhhosggvrhhtrdhjrghriihmihhksehfrhgvvgdrfhhrpdhssghrrghnuggvnhessghrohgruggtohhmrdgtohhmpdhfrdhfrghinhgvlhhlihesghhmrghilhdrtghomhdpkhgurghsuhdrkhguvghvsehgmhgrihhlrdgtohhmpdgthhhinhdqthhinhhgpghkuhhosegrshhpvggvughtvggthhdrtghomhdpshgrnhhjuhdrmhgvhhhtrgesrghmugdrtghomhdpphhrrghthihushhhsehkvghrnhgvlhdrohhrghdpthhuughorhdrrghmsggrrhhushesmhhitghrohgthhhiphdrtghomhdpjhhitgdvfeeskhgvrhhnvghlrdhorhhgpdhvihhgnhgvshhhrhesthhirdgtohhmpdhrihgthhgrrhgusehnohgurdgrthdpmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrjhhuihessghrohgruggtohhmrdgtohhmpdgrghhrohhssheskhgvrhhnvghlrdhorhhgpdgsjhhorhhnrdgrnhguvghrshhsohhnsehlihhnrghrohdrohhrghdphhgvihhkohesshhnthgvtghhrdguvgdpjhdrnhgvuhhstghhrggvfhgvrhesghhmgidrnhgvthdptghhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhsuhhmihhtrdhsvghmfigrlheslhhinhgrrhhordhorhhgpdhskh
 homhgrthhinhgvnhhisehnvhhiughirgdrtghomhdpjhhonhgrthhhrghnhhesnhhvihguihgrrdgtohhmpdhthhhivghrrhihrdhrvgguihhnghesghhmrghilhdrtghomhdpkhhvrghloheskhgvrhhnvghlrdhorhhgpdhsthgvfhgrnhesuggrthgvnhhfrhgvihhhrghfvghnrdhorhhgpdgrlhgvgidrrghrihhnghesghhmrghilhdrtghomhdpphgrsggvnhhisehrvgguhhgrthdrtghomhdpkhhusggrsehkvghrnhgvlhdrohhrghdpvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdpuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdplhdrshhtvghlmhgrtghhsehsrghmshhunhhgrdgtohhmpdhmihhnghhosehrvgguhhgrthdrtghomhdprhhoshhtvgguthesghhoohgumhhishdrohhrghdpjhgrshifihhnuggvrhdrshhinhhghheslhhinhgrrhhordhorhhgpdhmrghsrghhihhsrgdrkhhojhhimhgrsehlihhnrghrohdrohhrghdpshgrmhhuvghlsehshhholhhlrghnugdrohhrghdpjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdifvghnshestghsihgvrdhorhhgpdgrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdpmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprghnughisegvthgviihirghnrdhorhhgpdhkrhiihihsiihtohhfrdhkohiilhhofihskhhisehlihhnrghrohdrohhrghdprhhmfhhrfhhssehgmhgrihhlrdgtohhmpdg
 rmhhithhrkhgtihgrnhdvtddtvdesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
X-Mailman-Approved-At: Mon, 23 Jan 2023 16:04:33 +0000
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

On 1/19/23 19:53, Amit Kumar Mahapatra wrote:
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 873ff2cf72c9..b7a9ec550ba1 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -296,7 +296,7 @@ static const struct aspeed_spi_data ast2400_spi_data;
>   static int do_aspeed_spi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>   {
>   	struct aspeed_spi *aspi = spi_controller_get_devdata(mem->spi->master);
> -	struct aspeed_spi_chip *chip = &aspi->chips[mem->spi->chip_select];
> +	struct aspeed_spi_chip *chip = &aspi->chips[spi_get_chipselect(mem->spi, 0)];
>   	u32 addr_mode, addr_mode_backup;
>   	u32 ctl_val;
>   	int ret = 0;
> @@ -377,7 +377,8 @@ static const char *aspeed_spi_get_name(struct spi_mem *mem)
>   	struct aspeed_spi *aspi = spi_controller_get_devdata(mem->spi->master);
>   	struct device *dev = aspi->dev;
>   
> -	return devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev), mem->spi->chip_select);
> +	return devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev),
> +			      spi_get_chipselect(mem->spi, 0));
>   }
>   
>   struct aspeed_spi_window {
> @@ -553,7 +554,7 @@ static int aspeed_spi_do_calibration(struct aspeed_spi_chip *chip);
>   static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
>   {
>   	struct aspeed_spi *aspi = spi_controller_get_devdata(desc->mem->spi->master);
> -	struct aspeed_spi_chip *chip = &aspi->chips[desc->mem->spi->chip_select];
> +	struct aspeed_spi_chip *chip = &aspi->chips[spi_get_chipselect(desc->mem->spi, 0)];
>   	struct spi_mem_op *op = &desc->info.op_tmpl;
>   	u32 ctl_val;
>   	int ret = 0;
> @@ -620,7 +621,7 @@ static ssize_t aspeed_spi_dirmap_read(struct spi_mem_dirmap_desc *desc,
>   				      u64 offset, size_t len, void *buf)
>   {
>   	struct aspeed_spi *aspi = spi_controller_get_devdata(desc->mem->spi->master);
> -	struct aspeed_spi_chip *chip = &aspi->chips[desc->mem->spi->chip_select];
> +	struct aspeed_spi_chip *chip = &aspi->chips[spi_get_chipselect(desc->mem->spi, 0)];
>   
>   	/* Switch to USER command mode if mapping window is too small */
>   	if (chip->ahb_window_size < offset + len) {
> @@ -670,7 +671,7 @@ static int aspeed_spi_setup(struct spi_device *spi)
>   {
>   	struct aspeed_spi *aspi = spi_controller_get_devdata(spi->master);
>   	const struct aspeed_spi_data *data = aspi->data;
> -	unsigned int cs = spi->chip_select;
> +	unsigned int cs = spi_get_chipselect(spi, 0);
>   	struct aspeed_spi_chip *chip = &aspi->chips[cs];
>   
>   	chip->aspi = aspi;
> @@ -697,7 +698,7 @@ static int aspeed_spi_setup(struct spi_device *spi)
>   static void aspeed_spi_cleanup(struct spi_device *spi)
>   {
>   	struct aspeed_spi *aspi = spi_controller_get_devdata(spi->master);
> -	unsigned int cs = spi->chip_select;
> +	unsigned int cs = spi_get_chipselect(spi, 0);
>   
>   	aspeed_spi_chip_enable(aspi, cs, false);
>   

For the Aspeed driver,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
