Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B84F560BFA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 23:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62E410E158;
	Wed, 29 Jun 2022 21:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2132 seconds by postgrey-1.36 at gabe;
 Wed, 29 Jun 2022 21:55:59 UTC
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EEF10E158
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 21:55:59 +0000 (UTC)
Received: from [37.161.29.0] (port=43545 helo=[192.168.131.30])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <luca@lucaceresoli.net>) id 1o6f6m-000BzC-Qd;
 Wed, 29 Jun 2022 23:20:25 +0200
Message-ID: <d682fb60-c254-f89e-5d6d-cdf7aa752939@lucaceresoli.net>
Date: Wed, 29 Jun 2022 23:20:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-staging@lists.linux.dev, kasan-dev@googlegroups.com,
 linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, acpi4asus-user@lists.sourceforge.net,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, openipmi-developer@lists.sourceforge.net,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com,
 linux-usb@vger.kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

[keeping only individuals and lists in Cc to avoid bounces]

On 28/06/22 16:03, Uwe Kleine-K=C3=B6nig wrote:
> From: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
>=20
> The value returned by an i2c driver's remove function is mostly ignored=
=2E
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
>=20
> So change the prototype of the remove function to return no value. This=

> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared t=
o
> return 0 before.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

For versaclock:

> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock=
5.c
> index e7be3e54b9be..657493ecce4c 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -1138,7 +1138,7 @@ static int vc5_probe(struct i2c_client *client)
>  	return ret;
>  }
> =20
> -static int vc5_remove(struct i2c_client *client)
> +static void vc5_remove(struct i2c_client *client)
>  {
>  	struct vc5_driver_data *vc5 =3D i2c_get_clientdata(client);
> =20
> @@ -1146,8 +1146,6 @@ static int vc5_remove(struct i2c_client *client)
> =20
>  	if (vc5->chip_info->flags & VC5_HAS_INTERNAL_XTAL)
>  		clk_unregister_fixed_rate(vc5->pin_xin);
> -
> -	return 0;
>  }
> =20
>  static int __maybe_unused vc5_suspend(struct device *dev)

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--=20
Luca
