Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 206AE63D1B7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3890110E438;
	Wed, 30 Nov 2022 09:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF05310E43D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 09:22:44 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g12so26000689lfh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 01:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gGvCkJhsGrDGRU0up7It8RIrU+VkoFlEUPGl7kmXIeY=;
 b=k5W5TLxgDf03r77V1DcSG6YijxnMLnxYltQfx+OsR20+7qR3PeKhho0lzcFr5Fi2ti
 p+fivdkeVMxwYNqIWmTeFAWpbyq3K6H+QJoBmPRpFpt/weblVJPopeqMjfjGN8kQIR7a
 vY8FfqpoOJdHmQFglX9SFgUyX+GI7G3Hgazc1dtpq35cEnho9aAl6r06naUDxamMZU0l
 Q0Rk7KuCcrDVZSw1gV36clFKsvP/LSigKy3jX6Gk1IUPw58pbCJwALGAeIz71BJ2L1Qe
 dpnT8RlL4aQWxhtXj7tZ/eHlRvO0TB8jLEhu4QoJjL4c9phbDoib8ndFpxd+strTPEea
 LPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gGvCkJhsGrDGRU0up7It8RIrU+VkoFlEUPGl7kmXIeY=;
 b=upTOQwMS0qPB2Bs9+axdclvt42vSzOHFnHOjgXl0vEXjUcDN8E736MQNrPbJIDya4F
 0dd7OnHW9qg5bBbVyAK/8S3+q5J8fU76GwlSMeOD69exCLunqKzyQ2QGWPSYGa6UDa58
 Cv5oV19owBGfZ8Ee0upWrF5y4uHK1ZE3cANPhFX3TRqV4lSyaEPqR1UzKZnDh33k9Cv1
 2S2VYHhQ+AgLfjSMWvp6LTq6XQpuRhQq6HSYLgQB8SnF7N2yH/gmZ1gEEb80blU6xULw
 Fvkq9u6Wszr7hXmz/wS7bb40rkhZIAnqK9K2OJRRYICjYVXuMoYkSMjt2Xwpitl/7M0o
 496g==
X-Gm-Message-State: ANoB5plsZGCO22TuxUQxR158Xw0D7wQuO4JAMdH08BLrEnht0Sv5fog/
 cOpk8mHzoGdlFoApJWxh8sDyjkp5T5g=
X-Google-Smtp-Source: AA0mqf4yUCD0eY3oDTEWgWnd0jkf0QxzE3/0IccZ6qurtSOamh1gTq4uw3/MtvUj9lsXUcCx73SzPg==
X-Received: by 2002:a05:6512:13a5:b0:4ad:70f0:c7c with SMTP id
 p37-20020a05651213a500b004ad70f00c7cmr18753760lfa.190.1669800162970; 
 Wed, 30 Nov 2022 01:22:42 -0800 (PST)
Received: from dc75zzyyyyyyyyyyyyygt-3.rev.dnainternet.fi
 (dc75zzyyyyyyyyyyyyygt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::b])
 by smtp.gmail.com with ESMTPSA id
 6-20020ac25f06000000b00498fbec3f8asm186189lfq.129.2022.11.30.01.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 01:22:42 -0800 (PST)
Date: Wed, 30 Nov 2022 11:22:37 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Subject: [PATCH RESEND2 v4 1/2] drm/bridge: sii902x: Use
 devm_regulator_bulk_get_enable()
Message-ID: <e6153c7beb2076b9ea13082b2024ec3296bc08bc.1669799805.git.mazziesaccount@gmail.com>
References: <cover.1669799805.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kYoVLQBN7jlVRhX/"
Content-Disposition: inline
In-Reply-To: <cover.1669799805.git.mazziesaccount@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kYoVLQBN7jlVRhX/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify using devm_regulator_bulk_get_enable()

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Robert Foss <robert.foss@linaro.org>

---
v4 resend 2:
Resending unchanged code  with commit title prefix adjusted as suggested
by Robert

I am doing a clean-up for my local git and encountered this one.
Respinning as it seems this one fell through the cracks.
---
 drivers/gpu/drm/bridge/sii902x.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii9=
02x.c
index 878fb7d3732b..f6e8b401069b 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -171,7 +171,6 @@ struct sii902x {
 	struct drm_connector connector;
 	struct gpio_desc *reset_gpio;
 	struct i2c_mux_core *i2cmux;
-	struct regulator_bulk_data supplies[2];
 	bool sink_is_hdmi;
 	/*
 	 * Mutex protects audio and video functions from interfering
@@ -1072,6 +1071,7 @@ static int sii902x_probe(struct i2c_client *client,
 	struct device *dev =3D &client->dev;
 	struct device_node *endpoint;
 	struct sii902x *sii902x;
+	static const char * const supplies[] =3D {"iovcc", "cvcc12"};
 	int ret;
=20
 	ret =3D i2c_check_functionality(client->adapter,
@@ -1122,27 +1122,11 @@ static int sii902x_probe(struct i2c_client *client,
=20
 	mutex_init(&sii902x->mutex);
=20
-	sii902x->supplies[0].supply =3D "iovcc";
-	sii902x->supplies[1].supply =3D "cvcc12";
-	ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(sii902x->supplies),
-				      sii902x->supplies);
+	ret =3D devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(supplies), supplie=
s);
 	if (ret < 0)
-		return ret;
-
-	ret =3D regulator_bulk_enable(ARRAY_SIZE(sii902x->supplies),
-				    sii902x->supplies);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "Failed to enable supplies");
-		return ret;
-	}
+		return dev_err_probe(dev, ret, "Failed to enable supplies");
=20
-	ret =3D sii902x_init(sii902x);
-	if (ret < 0) {
-		regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
-				       sii902x->supplies);
-	}
-
-	return ret;
+	return sii902x_init(sii902x);
 }
=20
 static void sii902x_remove(struct i2c_client *client)
@@ -1152,8 +1136,6 @@ static void sii902x_remove(struct i2c_client *client)
=20
 	i2c_mux_del_adapters(sii902x->i2cmux);
 	drm_bridge_remove(&sii902x->bridge);
-	regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
-			       sii902x->supplies);
 }
=20
 static const struct of_device_id sii902x_dt_ids[] =3D {
--=20
2.38.1


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--kYoVLQBN7jlVRhX/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmOHIN0ACgkQeFA3/03a
ocXt3Af+NBbbybBiC/fT+7c3dEowQsdOb3b3yvhY2tN/4V4tTz6es4KCLfCsSDEy
H/BBqUFHCJ2ocgaOAybbpFKjBdm/K7vjoZWJo7EGvNPaY1BxETbcE+PdadGHTlsJ
TumNxh/jE4yAwIjGHQXum1XHL14LFhkSQiOPNo7uE/9xsSPtKMhWXTffoKum4oJ4
vN12chwj3UUBfgtlhATNHyCwkB8+2WY708tp4yL9lEQ9aU+s0euqdb5+vtBojghd
fuwOFipon6SJ1u5iwAUFvYZZezecr+JBEtiUgVXKEamW9ALaxdCoZKD16/Kgoqmn
X7Gxe3riJJ71fmvVZDSrHkOjsfclXQ==
=umTN
-----END PGP SIGNATURE-----

--kYoVLQBN7jlVRhX/--
