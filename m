Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E0062BEDB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 14:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3155410E0F1;
	Wed, 16 Nov 2022 13:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACD710E0F1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 13:03:36 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id x21so21721887ljg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 05:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JylTANdU+MtnPx7R0U874tZZVITnr1u0HsmnJdn+AyY=;
 b=dddiZF0v13cgng46+PJjInrIBo9snGjnjymRxUgzSF5VH+mZyJpMByeuvXl39iuyx0
 Sn0EQqR55++pjD8hUrzNh4wGNbWqNnGuEqgbeRRXl5fxjqkgjiqpO5aixY9VjPzoFozy
 lbQX1J7/29ZWMBKx077j+lV0hhXfoXf+rPlWbFfgxeY1qu97wwQyyLs1srQxY+/oTAAb
 Rt6LK5WSuTBp6LIYHbUcX17WxDH/jGBLtTKjx+A2gf2K5qEbmQObSGdTbbUYnNoQMbJH
 LfoTrG4KGwY0fNBCnMkgHCK7EZrrMflSZjjffIA63qjvXNDJ1LVNeNXmjLO5lUKFJE/Z
 mIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JylTANdU+MtnPx7R0U874tZZVITnr1u0HsmnJdn+AyY=;
 b=XPVXXl2v9VRPFOiy47m2gdKxWGqC2iNDFCy8dfoaBXJfqT8Zfh9V1766J7qXaQKgvG
 5sU4WJ8VcFWfyJq1QUFLOs/cuar1IqdnuyqaV7B+9PnyIVkdzcvjhxDXadLMNeI6ZHna
 vE1m3TUKhEXYkT2Ljm0fFYklcAmSuYTKe56m6JJ5AbHsVWsgNPRJr1iFW8Dr4EI9kseE
 0vZJ2Fxrs10AqfBvOFCkDcxjygD4HsYoWIW3kAt4TbgnPCKLZJ1vq+UPOa7C2JdwH6GB
 oXHgVQYjdruG9FlPQNHSX4h2oSaiOoXPevakY5zMuNP+UBQXdkjXV3b5Q4Z9yia0Tnut
 UBVg==
X-Gm-Message-State: ANoB5pnocKR65DvtJjCpVj3V5pfEbrwpw65KQ6RsAPgql1aZNz7qgkBG
 GYy+pog5CUygN7o3aUlua6w=
X-Google-Smtp-Source: AA0mqf6mYKQrD6tlA/nhsWmrS1ZVB5HKZrDM2mPsOQi7w/xcQPkxYVW0O+bEEcsE9+moP5hOhsdRXA==
X-Received: by 2002:a2e:b8c5:0:b0:277:8144:2eb6 with SMTP id
 s5-20020a2eb8c5000000b0027781442eb6mr8247830ljp.45.1668603814464; 
 Wed, 16 Nov 2022 05:03:34 -0800 (PST)
Received: from dc75zzyyyyyyyyyyyyydt-3.rev.dnainternet.fi
 (dc75zzyyyyyyyyyyyyydt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::7])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05651c130500b002773a9b5898sm3010709lja.138.2022.11.16.05.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 05:03:33 -0800 (PST)
Date: Wed, 16 Nov 2022 15:03:28 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Subject: [PATCH RESEND v4 1/2] gpu: drm: sii902x: Use
 devm_regulator_bulk_get_enable()
Message-ID: <3f0ffbc27e6bcc208d32eb3bb94979a8ab28265f.1668602942.git.mazziesaccount@gmail.com>
References: <cover.1668602942.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H8Zp8DcY3BmnSL3A"
Content-Disposition: inline
In-Reply-To: <cover.1668602942.git.mazziesaccount@gmail.com>
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


--H8Zp8DcY3BmnSL3A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify using devm_regulator_bulk_get_enable()

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Robert Foss <robert.foss@linaro.org>

---
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

--H8Zp8DcY3BmnSL3A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmN036AACgkQeFA3/03a
ocXx+gf/R0FFQkTof0Kn1lEIOifj8AuiQC+lnzWdr/M00lMpi/T+lCTVWLPD5Qr4
vcnYVHfbiPLL4ajrCYQ3NSBm4e1Bmo/hcj1csa/hpLFPNKGF6PNrKdPKdnXx2DMp
x8MXeJa6oaNRRvsIBBTuwE27ebDLyazHpJbYGjUrhoOi9+BjqazSkTLH0Zt7eE8m
9ja26ku3Xrpz2Wl0yyu+q50YipsXuXM3c0cKkQLyMdWQ5lRK+cmzQ/00xYB86Dg7
6AkxaGtvNSIaYE9ERzRIyJ+QP0A4QGoHhcDXCXsaPEGgUAoI0LbDfAgYVbrNpjOP
FQsZyKqrFeeKWHRvmbaTLjBiPwBjVw==
=niLH
-----END PGP SIGNATURE-----

--H8Zp8DcY3BmnSL3A--
