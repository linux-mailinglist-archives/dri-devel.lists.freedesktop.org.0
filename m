Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 328FC59A634
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 21:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC0010F1F3;
	Fri, 19 Aug 2022 19:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6198D10ED52
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 19:18:17 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id t5so2034539lfk.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 12:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=J9j7meaVAm+vqP6dy4QIMrPMWANh7sBEsLAJVix/pF8=;
 b=YCkvbVMEYJILHDd9aj0bVTOW+rlDJaNmoH4e9urDxJtgY5ZyI2KtQ4Ty8MGdHbAYiD
 ezIpkTuQUhi5gFRa9uzoal6sP1QOAsQgP94j7D4GNe7Y7fwDXYpmVPf5j5Qa6qPR5nWP
 9Q8iFbIyKnim9Cgf7Q08aRf/ckJIFtkcBv/YK9iBsJbXWqRoda8f6kEAipUFD9di/DsV
 w1XWklnT8etsfawiVMGzXB4Mrfb8qi+cQHoR3g6ElaUn3RL17XpGwad8R6kH1n9NK7sE
 POkr6ufCQ7qXrstprGgSkcK4tAx7wjxfDDch0RjVS3UOKJrnGrGhzwaWi1lXtnpwNxS6
 GlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=J9j7meaVAm+vqP6dy4QIMrPMWANh7sBEsLAJVix/pF8=;
 b=v7bpcAnm6tZVwVfS5HXWti6aXvmtReK1nTy/H/pONJV2pszDmmOCLt8EBzR+eGmitq
 TuI39LYbFyXFM07ufqQI8mybMO9LodutIyJ7Xca1f44YqcA4Pg976taGseYBG2PA0XTc
 GOZ8YN7W17VdYAkq3103mOvWVQO7N7uzzTBgEavBznh7pP+n3MWwseZA7nN0pSsTYips
 AskY+yV30y/+a+1bo0CfQ4DHX4VmHJxwyIpg+TiNv4sZKxoVjRA2eVrXVeVx0oT5hXbA
 xph9zTDyD/r4nCWYaDMDPRYhzMH3uOnvs5Bh/IjTNS5klDmNZ1HzfDliCd/Q0B872wQz
 d5IA==
X-Gm-Message-State: ACgBeo2WcNNOmgD0VIxc7xVgItVeP3oVkdw2NxyvGYyrIuFwq7RStw4x
 qtHAtjvB63Hen7YydIkX0alKh5Jrmjg=
X-Google-Smtp-Source: AA6agR5pAXdzRXNdKktnqNP44OTIXMqbCxtn7e2HF5YXdZ8lllMnF5gGhyW7vmAQsaqSExgX9L4CFg==
X-Received: by 2002:a05:6512:3a86:b0:48c:fa29:65e with SMTP id
 q6-20020a0565123a8600b0048cfa29065emr2727422lfu.63.1660936695667; 
 Fri, 19 Aug 2022 12:18:15 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi
 (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a056512360400b00492b7d7ee20sm738734lfs.87.2022.08.19.12.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 12:18:15 -0700 (PDT)
Date: Fri, 19 Aug 2022 22:18:10 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v3 03/14] gpu: drm: simplify drivers using
 devm_regulator_*get_enable*()
Message-ID: <3aacca7d9a0240d95dc3cf103d114b5c85392e71.1660934107.git.mazziesaccount@gmail.com>
References: <cover.1660934107.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uKWbmb48pgNIiD+I"
Content-Disposition: inline
In-Reply-To: <cover.1660934107.git.mazziesaccount@gmail.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uKWbmb48pgNIiD+I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify drivers using managed "regulator get and enable".

meson:
Use the devm_regulator_get_enable_optional(). Also drop the seemingly
unused struct member 'hdmi_supply'.

sii902x:
Simplify using devm_regulator_bulk_get_enable()

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
v2 =3D> v3:
No changes

RFCv1 =3D> v2:
- Change also sii902x to use devm_regulator_bulk_get_enable()

Please note - this is only compile-tested due to the lack of HW. Careful
review and testing is _highly_ appreciated.
---
 drivers/gpu/drm/bridge/sii902x.c      | 22 +++-------------------
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
 2 files changed, 6 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii9=
02x.c
index 7ab38d734ad6..162f9c87eeb2 100644
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
@@ -1122,27 +1122,13 @@ static int sii902x_probe(struct i2c_client *client,
=20
 	mutex_init(&sii902x->mutex);
=20
-	sii902x->supplies[0].supply =3D "iovcc";
-	sii902x->supplies[1].supply =3D "cvcc12";
-	ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(sii902x->supplies),
-				      sii902x->supplies);
-	if (ret < 0)
-		return ret;
-
-	ret =3D regulator_bulk_enable(ARRAY_SIZE(sii902x->supplies),
-				    sii902x->supplies);
+	ret =3D devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(supplies), supplie=
s);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "Failed to enable supplies");
 		return ret;
 	}
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
 static int sii902x_remove(struct i2c_client *client)
@@ -1152,8 +1138,6 @@ static int sii902x_remove(struct i2c_client *client)
=20
 	i2c_mux_del_adapters(sii902x->i2cmux);
 	drm_bridge_remove(&sii902x->bridge);
-	regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
-			       sii902x->supplies);
=20
 	return 0;
 }
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/=
meson_dw_hdmi.c
index 5cd2b2ebbbd3..7642f740272b 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -140,7 +140,6 @@ struct meson_dw_hdmi {
 	struct reset_control *hdmitx_apb;
 	struct reset_control *hdmitx_ctrl;
 	struct reset_control *hdmitx_phy;
-	struct regulator *hdmi_supply;
 	u32 irq_stat;
 	struct dw_hdmi *hdmi;
 	struct drm_bridge *bridge;
@@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *m=
eson_dw_hdmi)
=20
 }
=20
-static void meson_disable_regulator(void *data)
-{
-	regulator_disable(data);
-}
-
 static void meson_disable_clk(void *data)
 {
 	clk_disable_unprepare(data);
@@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, stru=
ct device *master,
 	meson_dw_hdmi->data =3D match;
 	dw_plat_data =3D &meson_dw_hdmi->dw_plat_data;
=20
-	meson_dw_hdmi->hdmi_supply =3D devm_regulator_get_optional(dev, "hdmi");
-	if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
-		if (PTR_ERR(meson_dw_hdmi->hdmi_supply) =3D=3D -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		meson_dw_hdmi->hdmi_supply =3D NULL;
-	} else {
-		ret =3D regulator_enable(meson_dw_hdmi->hdmi_supply);
-		if (ret)
-			return ret;
-		ret =3D devm_add_action_or_reset(dev, meson_disable_regulator,
-					       meson_dw_hdmi->hdmi_supply);
-		if (ret)
-			return ret;
-	}
+	ret =3D devm_regulator_get_enable_optional(dev, "hdmi");
+	if (ret !=3D -ENODEV)
+		return ret;
=20
 	meson_dw_hdmi->hdmitx_apb =3D devm_reset_control_get_exclusive(dev,
 						"hdmitx_apb");
--=20
2.37.1


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

--uKWbmb48pgNIiD+I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmL/4fIACgkQeFA3/03a
ocWuBwf+Kq0reW1WZbOU6f9nkvnlfsW9rosrMD8+RLXxTRhbL4l4yGCS2p2x29/u
3OD+Bx9ueraabFuNPcKu1w9QNczK+XwXChv5Kpz1OJtFUxfIunA+g8/6r4bOeWUk
+PcMuVkTM2Mh4v5waroS5GxgLYnHL8HpvU91NoDMcd6MrGFCOT/xTMICBkrzmcJk
lCg4Ap3ZX2Eb2d/dQ3+xuKUmy3IETnfCY8boUZoRLxqakhD7jRvyn3FaPHNdDnEh
/TK7bWYV0sVum54+k/2/3o09mAV6eRvt6f2cpJ1wxsDSZV0xdqROD+S3I1vat7s2
BLi6N0T4uzNilm+gIHc6tPHCi42xzw==
=Nhhc
-----END PGP SIGNATURE-----

--uKWbmb48pgNIiD+I--
