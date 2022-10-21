Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A87960782F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 15:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C64F10E394;
	Fri, 21 Oct 2022 13:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAF010E394
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 13:18:50 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id h8so3608276lja.11
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 06:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pRkhXHMl4TQ/DqaAGRL8GCynFjjb+3hTJyL1LA0fGPI=;
 b=WgobnPDdXrxxYqHttfwgpj1q5gAY72WGanvgflFsMOySjkHmZ4ZH4p7AB0RtJyA3KR
 LAQJzEZ7NujWLO07huI2EltfmcuGTsWpKfAxegLQF6ITGT5ldA3qdzhI3F4kFUq4yVGw
 zaIz7sxHn5cE8lamSLUKUO0ZVDZZNZAIVmGSTwuP4f8oGB8ATSsPMkGX2VDO/4i5MZNi
 bPGdh+ZVAvIhLxkO1TLvj50dkUl/1NOl0SeeLJjHwicmqljgCcVMVsjgf6Lg53kjC09m
 dNUk9rCAkhIQhKjM82dlPBTIwqx7IB9jFo3fTAy7E717X6RDH/DQOgQqpIuQ5070bUD0
 Z6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRkhXHMl4TQ/DqaAGRL8GCynFjjb+3hTJyL1LA0fGPI=;
 b=iGQG/aAKfbHKq5E81jDSODXRyXmlb0Py43MvMKY6lS4Lj+0h7l7znxg9noKckMvCDP
 EEFkI76naNgGxt+Xj/VSGPyBiq38yz+gkFfvoVMn5/wjdCV7mTu23h+E8eJSzG0n7yLM
 XJvOWNI8UODIoi3d4ieRCrfqB3YqVt58ozTe37cJMcdevbuaHD/1cAJcAKtkCDagREoy
 yOW+cjHKOYCRV+NUkhUj0mOyeaj9uJNXnzrs0QVLqC2SH/WOJUoilmh5XxBRC0d9lCSH
 +X6Egoutj5whggAklFid2CvBhZECrUr29FWsqD6ZZ2IuGJBLlEdDZJONTWjvJHfglegO
 pOoA==
X-Gm-Message-State: ACrzQf0DHZDD0oinE7uZPaPS921hVcNEGxn3S9ACAG/BfFbTIxKENvqs
 8DcPd6CtAafNh77acHsBxRg=
X-Google-Smtp-Source: AMsMyM5ZI9LOvAWowEwE1BQiARts/ZjcHuWX/l3x5n+ReleYNXhDm3X/s5vQQklCiZ0l7SohVfPGEA==
X-Received: by 2002:a2e:a7d0:0:b0:26f:d241:483b with SMTP id
 x16-20020a2ea7d0000000b0026fd241483bmr6279663ljp.426.1666358328736; 
 Fri, 21 Oct 2022 06:18:48 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi
 (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
 by smtp.gmail.com with ESMTPSA id
 9-20020ac25f49000000b0049944ab6895sm3150402lfz.260.2022.10.21.06.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 06:18:47 -0700 (PDT)
Date: Fri, 21 Oct 2022 16:18:43 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v4 3/4] hwmon: lm90: simplify using devm_regulator_get_enable()
Message-ID: <a1fa4364cbb775de25478117dd22dda0742089e3.1666357434.git.mazziesaccount@gmail.com>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="M3g96xv3Iy/Ir190"
Content-Disposition: inline
In-Reply-To: <cover.1666357434.git.mazziesaccount@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--M3g96xv3Iy/Ir190
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Drop open-coded pattern: 'devm_regulator_get(), regulator_enable(),
add_action_or_reset(regulator_disable)' and use the
devm_regulator_get_enable().

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>

---
RFCv1 =3D> v2:
- No changes
---
 drivers/hwmon/lm90.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index db595f7d01f8..a3f95ba00dbf 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2663,11 +2663,6 @@ static void lm90_remove_pec(void *dev)
 	device_remove_file(dev, &dev_attr_pec);
 }
=20
-static void lm90_regulator_disable(void *regulator)
-{
-	regulator_disable(regulator);
-}
-
 static int lm90_probe_channel_from_dt(struct i2c_client *client,
 				      struct device_node *child,
 				      struct lm90_data *data)
@@ -2749,24 +2744,13 @@ static int lm90_probe(struct i2c_client *client)
 	struct device *dev =3D &client->dev;
 	struct i2c_adapter *adapter =3D client->adapter;
 	struct hwmon_channel_info *info;
-	struct regulator *regulator;
 	struct device *hwmon_dev;
 	struct lm90_data *data;
 	int err;
=20
-	regulator =3D devm_regulator_get(dev, "vcc");
-	if (IS_ERR(regulator))
-		return PTR_ERR(regulator);
-
-	err =3D regulator_enable(regulator);
-	if (err < 0) {
-		dev_err(dev, "Failed to enable regulator: %d\n", err);
-		return err;
-	}
-
-	err =3D devm_add_action_or_reset(dev, lm90_regulator_disable, regulator);
+	err =3D devm_regulator_get_enable(dev, "vcc");
 	if (err)
-		return err;
+		return dev_err_probe(dev, err, "Failed to enable regulator\n");
=20
 	data =3D devm_kzalloc(dev, sizeof(struct lm90_data), GFP_KERNEL);
 	if (!data)
--=20
2.37.3


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

--M3g96xv3Iy/Ir190
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmNSnDMACgkQeFA3/03a
ocWlJQf/f4PSr4V2vI2p2GUquvO7G7G/Ap8fvDhLsezltYKOvhysBmxyc5W6uOE7
A7UDzafqeVb2ZRqrHDe3b348v/vZ2nUN37wDIQVQiLFYeVUWJtYQY0AIt3MAYSgh
/6pYUFjsOhPk4zgrplh2O07iDM7V0h09ovKA/aQ4KtsOgKoi+zmhD7ka4YhwSoaf
4MEQG4S4pGi5/tJlHG87zH7/+LESzo1g3s2GH5bZOolQQGfahwA+hP7ztnQ/4E0R
WnPt+SydxPSAGI0A6ImdFCAemC8LkfsmDOfPbV7aVQonl/Pm+PYxKEC0auspopMv
EARJfxX8SY6Civ722e+t7twiVR0REg==
=bf9B
-----END PGP SIGNATURE-----

--M3g96xv3Iy/Ir190--
