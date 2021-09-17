Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6027F40F92A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 15:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601856E831;
	Fri, 17 Sep 2021 13:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx22.baidu.com [220.181.50.185])
 by gabe.freedesktop.org (Postfix) with ESMTP id 511316E831
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 13:30:42 +0000 (UTC)
Received: from BJHW-Mail-Ex05.internal.baidu.com (unknown [10.127.64.15])
 by Forcepoint Email with ESMTPS id 2D2B3EC7E04959AB8786;
 Fri, 17 Sep 2021 21:30:40 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex05.internal.baidu.com (10.127.64.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 17 Sep 2021 21:30:40 +0800
Received: from localhost (172.31.63.8) by BJHW-MAIL-EX27.internal.baidu.com
 (10.127.64.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 17
 Sep 2021 21:30:39 +0800
Date: Fri, 17 Sep 2021 21:30:39 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
CC: Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] video: backlight: Make use of the helper function
 dev_err_probe()
Message-ID: <20210917133039.GA18102@LAPTOP-UKSR4ENP.internal.baidu.com>
References: <20210917125324.18031-1-caihuoqing@baidu.com>
 <20210917131529.3oc7xeb4xpvgq5og@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917131529.3oc7xeb4xpvgq5og@maple.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex15.internal.baidu.com (10.127.64.38) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex05_2021-09-17 21:30:40:199
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

On 17 9月 21 14:15:29, Daniel Thompson wrote:
> On Fri, Sep 17, 2021 at 08:53:23PM +0800, Cai Huoqing wrote:
> > When possible use dev_err_probe help to properly deal with the
> > PROBE_DEFER error, the benefit is that DEFER issue will be logged
> > in the devices_deferred debugfs file.
> > Using dev_err_probe() can reduce code size, and the error value
> > gets printed.
> > 
> > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> > ---
> > v1->v2: backlight patches are handled in one
> 
> This appears to leave a lot of backlight drivers with the same code
> pattern that are not updated. As my last e-mail, please can you explain
> why you selected these drivers and no others?
Thanks for you feedback.

I Just
grep devm_regulator_get/devm_gpiod_get -C 3|grep "dev_err(" -C 3

That help to find them,
and fix them one by one manually.
> 
> I would expect this type of change to be made with the assistance of a
> script to automatically help you identify and change the code patterns
> you are targetting. This would allow you to update all the backlight
> drivers at once.
Nice idea. I'll try.
Cai
> 
> 
> Daniel.
> 
> 
> >  drivers/video/backlight/bd6107.c      | 16 +++++--------
> >  drivers/video/backlight/l4f00242t03.c | 34 ++++++++++-----------------
> >  2 files changed, 19 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight/bd6107.c
> > index 515184fbe33a..e21b793302a2 100644
> > --- a/drivers/video/backlight/bd6107.c
> > +++ b/drivers/video/backlight/bd6107.c
> > @@ -120,7 +120,6 @@ static int bd6107_probe(struct i2c_client *client,
> >  	struct backlight_device *backlight;
> >  	struct backlight_properties props;
> >  	struct bd6107 *bd;
> > -	int ret;
> >  
> >  	if (pdata == NULL) {
> >  		dev_err(&client->dev, "No platform data\n");
> > @@ -148,11 +147,9 @@ static int bd6107_probe(struct i2c_client *client,
> >  	 * the reset.
> >  	 */
> >  	bd->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
> > -	if (IS_ERR(bd->reset)) {
> > -		dev_err(&client->dev, "unable to request reset GPIO\n");
> > -		ret = PTR_ERR(bd->reset);
> > -		return ret;
> > -	}
> > +	if (IS_ERR(bd->reset))
> > +		return dev_err_probe(&client->dev, PTR_ERR(bd->reset),
> > +				     "unable to request reset GPIO\n");
> >  
> >  	memset(&props, 0, sizeof(props));
> >  	props.type = BACKLIGHT_RAW;
> > @@ -164,10 +161,9 @@ static int bd6107_probe(struct i2c_client *client,
> >  					      dev_name(&client->dev),
> >  					      &bd->client->dev, bd,
> >  					      &bd6107_backlight_ops, &props);
> > -	if (IS_ERR(backlight)) {
> > -		dev_err(&client->dev, "failed to register backlight\n");
> > -		return PTR_ERR(backlight);
> > -	}
> > +	if (IS_ERR(backlight))
> > +		return dev_err_probe(&client->dev, PTR_ERR(backlight),
> > +				     "failed to register backlight\n");
> >  
> >  	backlight_update_status(backlight);
> >  	i2c_set_clientdata(client, backlight);
> > diff --git a/drivers/video/backlight/l4f00242t03.c b/drivers/video/backlight/l4f00242t03.c
> > index 46f97d1c3d21..8d81d4dec3c6 100644
> > --- a/drivers/video/backlight/l4f00242t03.c
> > +++ b/drivers/video/backlight/l4f00242t03.c
> > @@ -179,37 +179,29 @@ static int l4f00242t03_probe(struct spi_device *spi)
> >  	priv->spi = spi;
> >  
> >  	priv->reset = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HIGH);
> > -	if (IS_ERR(priv->reset)) {
> > -		dev_err(&spi->dev,
> > -			"Unable to get the lcd l4f00242t03 reset gpio.\n");
> > -		return PTR_ERR(priv->reset);
> > -	}
> > +	if (IS_ERR(priv->reset))
> > +		return dev_err_probe(&spi->dev, PTR_ERR(priv->reset),
> > +				     "Unable to get the lcd l4f00242t03 reset gpio.\n");
> >  	gpiod_set_consumer_name(priv->reset, "lcd l4f00242t03 reset");
> >  
> >  	priv->enable = devm_gpiod_get(&spi->dev, "enable", GPIOD_OUT_LOW);
> > -	if (IS_ERR(priv->enable)) {
> > -		dev_err(&spi->dev,
> > -			"Unable to get the lcd l4f00242t03 data en gpio.\n");
> > -		return PTR_ERR(priv->enable);
> > -	}
> > +	if (IS_ERR(priv->enable))
> > +		return dev_err_probe(&spi->dev, PTR_ERR(priv->enable),
> > +				     "Unable to get the lcd l4f00242t03 data en gpio.\n");
> >  	gpiod_set_consumer_name(priv->enable, "lcd l4f00242t03 data enable");
> >  
> >  	priv->io_reg = devm_regulator_get(&spi->dev, "vdd");
> > -	if (IS_ERR(priv->io_reg)) {
> > -		dev_err(&spi->dev, "%s: Unable to get the IO regulator\n",
> > -		       __func__);
> > -		return PTR_ERR(priv->io_reg);
> > -	}
> > +	if (IS_ERR(priv->io_reg))
> > +		return dev_err_probe(&spi->dev, PTR_ERR(priv->io_reg),
> > +				     "%s: Unable to get the IO regulator\n", __func__);
> >  
> >  	priv->core_reg = devm_regulator_get(&spi->dev, "vcore");
> > -	if (IS_ERR(priv->core_reg)) {
> > -		dev_err(&spi->dev, "%s: Unable to get the core regulator\n",
> > -		       __func__);
> > -		return PTR_ERR(priv->core_reg);
> > -	}
> > +	if (IS_ERR(priv->core_reg))
> > +		return dev_err_probe(&spi->dev, PTR_ERR(priv->core_reg),
> > +				     "%s: Unable to get the core regulator\n", __func__);
> >  
> >  	priv->ld = devm_lcd_device_register(&spi->dev, "l4f00242t03", &spi->dev,
> > -					priv, &l4f_ops);
> > +					    priv, &l4f_ops);
> >  	if (IS_ERR(priv->ld))
> >  		return PTR_ERR(priv->ld);
> >  
> > -- 
> > 2.25.1
> > 
