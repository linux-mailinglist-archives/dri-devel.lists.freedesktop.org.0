Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9325340F679
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 13:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1B26EC21;
	Fri, 17 Sep 2021 11:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx22.baidu.com [220.181.50.185])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2602A6EC21
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 11:05:31 +0000 (UTC)
Received: from BJHW-Mail-Ex01.internal.baidu.com (unknown [10.127.64.11])
 by Forcepoint Email with ESMTPS id 1DED18C13044D790BFA3;
 Fri, 17 Sep 2021 19:05:29 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex01.internal.baidu.com (10.127.64.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 17 Sep 2021 19:05:28 +0800
Received: from localhost (172.31.63.8) by BJHW-MAIL-EX27.internal.baidu.com
 (10.127.64.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 17
 Sep 2021 19:05:28 +0800
Date: Fri, 17 Sep 2021 19:05:28 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
CC: Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] backlight: bd6107: Make use of the helper function
 dev_err_probe()
Message-ID: <20210917110528.GA17963@LAPTOP-UKSR4ENP.internal.baidu.com>
References: <20210917031308.17623-1-caihuoqing@baidu.com>
 <20210917091729.elpngrzpvmp43wns@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917091729.elpngrzpvmp43wns@maple.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex12.internal.baidu.com (10.127.64.35) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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

Hi
Thanks for your feedback.
On 17 9月 21 10:17:29, Daniel Thompson wrote:
> On Fri, Sep 17, 2021 at 11:13:06AM +0800, Cai Huoqing wrote:
> > When possible use dev_err_probe help to properly deal with the
> > PROBE_DEFER error, the benefit is that DEFER issue will be logged
> > in the devices_deferred debugfs file.
> > Using dev_err_probe() can reduce code size, and the error value
> > gets printed.
> > 
> > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> 
> Change seems OK but does this really need to be done one file at a time?
> I'd prefer to see all of backlight handled in one go (given the scope of
> this change if applied across the kernel it needs automatic tooling
> anyway).
Only two related patches for backlight.
I try to keep one patch for a subdriver, sometimes different
subdriver owner need to mark reviwed independently.

Thanks,
Cai
> 
> Daniel.
> 
> 
> > ---
> >  drivers/video/backlight/bd6107.c | 16 ++++++----------
> >  1 file changed, 6 insertions(+), 10 deletions(-)
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
> > -- 
> > 2.25.1
> > 
