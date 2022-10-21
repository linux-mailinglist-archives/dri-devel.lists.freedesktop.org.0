Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA5E60782A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 15:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C5F10E1D5;
	Fri, 21 Oct 2022 13:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B55710E1D5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 13:18:31 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id be13so5058504lfb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 06:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qI3A82j8OlKFN8/s3EGSbVRexJ10lYyCFaVb3RuN9Is=;
 b=EddB7/l5OXNdqlNUaGLu6aYnT5u8eGmGUOD2LYBqpyC6BKfPYZSYjogyqbQOlfXZZy
 LHTBXr9JUt6OuGdzhxu2SG3s5TacFmpQaIT2wnAsCqshT3K20Nz1wmhTvB9GJS4sniFw
 MxRcFTStp17cAXYvqFLjHmGbs8xL3sMUNhmIvnhfkDhZFVzcM5glxRRHXkgtIBJ6oAh8
 UBDaGKp5DR2lqAnNbXK8Pcvnj2UP9k+BXMrycOGj30rNUmyjnz4tESR3q16OAi/4KVe4
 B12c7lBrRPym7hKeHuI0FRXMOqSt7vyf2OGG5bbr0//KRXUEPOrAH9V2OeDs+00yCoX+
 lJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qI3A82j8OlKFN8/s3EGSbVRexJ10lYyCFaVb3RuN9Is=;
 b=tleSDWAnspRpuZ5lEMpfH1Ia0mnuwTliy46GeE9O9I90phAEG9pnhEAVBRYF/qwifv
 XxDWNAUxerQp4EtqCfPACe5nRgLWARRxltCY9KTASrCp8NXkfiqgRbT+5oerOOnagNRi
 hY4qfP3BEfTikIhGYj9RVqrtj9B7qQgKW2wGu+PufEooWsq/Mi06aTmD36pXEKNla+yU
 Iq+i9vOBFfoqs9bgHCl+lbZICnVOqnT4JvhYdLkuM8Ruk/paIocJ0pdmyafzZFvoGvJv
 7gY8kNJXQMPRdbGhuRTOxdZgLk8/Qzqvtz0FFHKpNvPh9+i+KYn+eZi7vI6KjHfBV1uU
 wLAA==
X-Gm-Message-State: ACrzQf0kyQ21gn93C3JSg/vMETHd0rq6Y3p9AcniAzrPRiTqwhYZOMr8
 78VFi3Wigwa/94V/Zv8VYxY=
X-Google-Smtp-Source: AMsMyM6YSuN5NBVb/th5/FcRZVreCEibK29TtTjbtKUF0vDw9NIOEje3N82DjgRRlHan4QPs87ovyg==
X-Received: by 2002:a05:6512:681:b0:489:d509:e076 with SMTP id
 t1-20020a056512068100b00489d509e076mr7399577lfe.618.1666358309446; 
 Fri, 21 Oct 2022 06:18:29 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi
 (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a2e9e85000000b0026dfdcbccdasm3400209ljk.14.2022.10.21.06.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 06:18:28 -0700 (PDT)
Date: Fri, 21 Oct 2022 16:18:23 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v4 2/4] gpu: drm: sii902x: Use devm_regulator_bulk_get_enable()
Message-ID: <1ed8351c2cb4911fcda21b97f7a7b089e955c301.1666357434.git.mazziesaccount@gmail.com>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mjr/nbyrnmvxde/A"
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


--mjr/nbyrnmvxde/A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify using devm_regulator_bulk_get_enable()

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>

---
v3 =3D> v4:
- split to own patch.
- return directly the value returned by the dev_err_probe()

Please note - this is only compile-tested due to the lack of HW. Careful
review and testing is _highly_ appreciated
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

--mjr/nbyrnmvxde/A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmNSnB8ACgkQeFA3/03a
ocUDfggAwKt9Ya9r0X3AXcX1fUi7GC5MIGKAUxnLcID+Q8yzcf5iCxnP+rmB6lgw
Oyx0mq9GsUyWpR/AaB17Rtw8A28oYmynvou5eQXYTPqKJMGFfIT7VRN7b2BwUmAt
s72ErgCEK9Q5wIxmSQrE7Tmp6WriowO1/HZ2hWRNeUfZSAt9QVihx3+BHjCseHHN
TXqJM33sry0k87UqeCGazD1ehyECP3NMXIRs7MRNg6sKyfaMw9ymX9V0bopopTt+
cvprEtfNJdQz64zxem1udfQaB1n6xgy09akBsVJrDx8K5mcTLJMG5fmBzAQrsd43
4UVu/8SxAtiOs2G686etDqbpBZEG9Q==
=hFfm
-----END PGP SIGNATURE-----

--mjr/nbyrnmvxde/A--
