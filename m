Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C87847BF0C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 12:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7CD10FF6E;
	Tue, 21 Dec 2021 11:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0180010FF76
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 11:39:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DE7C881;
 Tue, 21 Dec 2021 12:39:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1640086794;
 bh=+zx35ApipIwzpR2JUnKwmUzBhBtFhQVEcaXKQzBURZE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=qpbqBbV7mLRQ/LTYmZele+Jiaf5hSp3Mjt98byY3LnEv0TrgoJfVoe4yiWvmhYTut
 ADnJaF5u8mSofPrJltGtoh9cxgvJnHT5CBO5oAAXf75f66TDvGMHBA15r8uFX2uQiN
 iLxxCKcscRsF/K+f5hUMHVyAnwiPOhnai3Kb+3cY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <210c1e7c333b42702ac0c3ba0da639e82327d035.camel@foss.st.com>
References: <20211218182804.208906-1-antonio.borneo@foss.st.com>
 <164001209406.2512616.469307346369770543@Monstersaurus>
 <210c1e7c333b42702ac0c3ba0da639e82327d035.camel@foss.st.com>
Subject: Re: [PATCH] drm: adv7511: override i2c address of cec before
 accessing it
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org
Date: Tue, 21 Dec 2021 11:39:51 +0000
Message-ID: <164008679146.2512616.5965783147922289011@Monstersaurus>
User-Agent: alot/0.10
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
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Antonio Borneo (2021-12-20 15:53:12)
> On Mon, 2021-12-20 at 14:54 +0000, Kieran Bingham wrote:
> > Hi Antonio,
> >=20
> > Quoting Antonio Borneo (2021-12-18 18:28:04)
> > > Commit 680532c50bca ("drm: adv7511: Add support for
> > > i2c_new_secondary_device") allows a device tree node to override
> > > the default addresses of the secondary i2c devices. This is useful
> > > for solving address conflicts on the i2c bus.
> > >=20
> > > In adv7511_init_cec_regmap() the new i2c address of cec device is
> > > read from device tree and immediately accessed, well before it is
> > > written in the proper register to override the default address.
> > > This can cause an i2c error during probe and a consequent probe
> > > failure.
> >=20
> > Ouch, it does seem that way. I guess no one has used the CEC for
> > quite
> > some time, as it must have been like this for a while?
>=20
> Using the default i2c address for cec works without problem; apparently
> everyone is happy with such default. The issue appears only when you
> have to override the default cec address.
> The commit 680532c50bca landed in v4.18.

Ok, phew - so the 'normal' case still worked. That makes sense.

Sorry for getting it wrong, and I hope it didn't take too long to find
and fix. I'm sure we'll see it percolate down the stable trees once
integrated.

--
Kieran

> > > Once the new i2c address is read from the device tree, override
> > > the default address before any attempt to access the cec.
> >=20
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> Thanks!
> Antonio
>=20
> > > Tested with adv7533 and stm32mp157f.
> > >=20
> > > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> > > Fixes: 680532c50bca ("drm: adv7511: Add support for
> > > i2c_new_secondary_device")
> > > ---
> > > To: Andrzej Hajda <a.hajda@samsung.com>
> > > To: Neil Armstrong <narmstrong@baylibre.com>
> > > To: Robert Foss <robert.foss@linaro.org>
> > > To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > To: Jonas Karlman <jonas@kwiboo.se>
> > > To: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > To: David Airlie <airlied@linux.ie>
> > > To: Daniel Vetter <daniel@ffwll.ch>
> > > To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > To: dri-devel@lists.freedesktop.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: linux-stm32@st-md-mailman.stormreply.com
> > > ---
> > > =C2=A0drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 7 ++++---
> > > =C2=A01 file changed, 4 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > index 76555ae64e9c..629e05286fd9 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > @@ -1048,6 +1048,10 @@ static int adv7511_init_cec_regmap(struct
> > > adv7511 *adv)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > ADV7511_CEC_I2C_ADDR_DEFAULT);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(adv->i2c_cec))
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(adv->i2c_cec);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_write(adv->regmap, ADV75=
11_REG_CEC_I2C_ADDR,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adv->i2c_cec->addr << 1);
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_set_clientdata(adv->i2=
c_cec, adv);
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adv->regmap_cec =3D devm_r=
egmap_init_i2c(adv->i2c_cec,
> > > @@ -1252,9 +1256,6 @@ static int adv7511_probe(struct i2c_client
> > > *i2c, const struct i2c_device_id *id)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 goto err_i2c_unregister_packet;
> > > =C2=A0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_write(adv7511->regmap, A=
DV7511_REG_CEC_I2C_ADDR,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adv7511->i2c_cec->addr << =
1);
> > > -
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INIT_WORK(&adv7511->hpd_wo=
rk, adv7511_hpd_work);
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (i2c->irq) {
> > >=20
> > > base-commit: fc74881c28d314b10efac016ef49df4ff40b8b97
> > > --=20
> > > 2.34.1
> > >=20
>
