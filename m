Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED8B607827
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 15:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2097D10E369;
	Fri, 21 Oct 2022 13:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCC210E369
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 13:18:10 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bu25so5096017lfb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 06:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ihyfIhpnzq65oKa3RDOB7v3ysoQ+yvmg3Y0WFsPd1bw=;
 b=I9NeRnvmBddsliQwQ2JpFRY+yBhvSinkJq/RCwn5uMf4MgZObYFZAv/iOK3QP8HDji
 9FhiOcX3yboLmgid/jqKyVngYBvuPvf5BkzKMNFWrL8KQT1Tl6iFXObUupxvMPyj6ipV
 hTwvZClXLoQOmaru2RChDi02M5YSHTfFduAL2+4oTQGWTpzWlEA43DlIrC6Xrq73NH5O
 7Zs1g3PN9W+9D9GL2WBG90EoQeCFaYYsg3kjewxiPQUlMaz2PZmj+0fcCPZO2Un+43ag
 2qgx1yDok3Bs6op5lq+uaO6uVmesvlIp5o4EQAeDUAca5dg6zkwSVqXiapNee7MfkIoj
 SUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ihyfIhpnzq65oKa3RDOB7v3ysoQ+yvmg3Y0WFsPd1bw=;
 b=Dmr7ehFAzt16yoWb/p/LCsEOKW1ReEgQme4eSZpFOfbkLT0fhu02lITNdgkXqVreXm
 RsmCX59ppTpPrSQ8ybpCB1aA7go+ZYwlseCbqoCTFvWlznUY6Z4NLFpPWsi6BCHQkOvm
 IdFZH1gE5cVY1nAOhir/OtmsfbNSumVJkZGqv3Hki/+Vxunu8Di3hs6kl55HLiY9C+vW
 5vnOb+vTErwcWjzDmWCdymXWdKcLQsex8ZrnFIalLH0hW1pRzGKFf9ybVfOpgmrFoNI5
 95ob4HAJhEX/8Lm0uv5cDWZOBcRbMrQsYjTXXMeTRcrRnKkpnJwG9XQQ2GrZYHXjmvsZ
 NHFw==
X-Gm-Message-State: ACrzQf2YCEeEULY7Q3TOY9fK2ul4SJfg29yjEKYJZSYGulFMBS39/pzx
 PCzNRJmiqerEt5qO1Iz30rE=
X-Google-Smtp-Source: AMsMyM5r/E/MTpA6dpEKyj/vPwlJ3EnRAGRQWeDHieNWdktxJ3gFXIx6Cn2GnJ4y5gYcXpejtbqXhg==
X-Received: by 2002:a05:6512:3085:b0:4a2:7d80:d4b4 with SMTP id
 z5-20020a056512308500b004a27d80d4b4mr7150541lfd.534.1666358288796; 
 Fri, 21 Oct 2022 06:18:08 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi
 (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a056512200d00b00494747ba5f7sm2210665lfb.272.2022.10.21.06.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 06:18:07 -0700 (PDT)
Date: Fri, 21 Oct 2022 16:18:01 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v4 1/4] gpu: drm: meson: Use devm_regulator_*get_enable*()
Message-ID: <c14058c4b7018556a78455ffef484a7ebe4d8ea2.1666357434.git.mazziesaccount@gmail.com>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I73xNqd38oT7/msC"
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


--I73xNqd38oT7/msC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify using the devm_regulator_get_enable_optional(). Also drop the
seemingly unused struct member 'hdmi_supply'.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
v3 =3D> v4:
- split meson part to own patch

RFCv1 =3D> v2:
- Change also sii902x to use devm_regulator_bulk_get_enable()

Please note - this is only compile-tested due to the lack of HW. Careful
review and testing is _highly_ appreciated.
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

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

--I73xNqd38oT7/msC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmNSnAkACgkQeFA3/03a
ocVRkQgAmAp5C+Mg1nONvKcJHcITidnpA5Ktq6dm9OB4A11/VOy5Y8vZKLKVXldv
ejqrFYrMUa//jhZlfwE1dFQbnKn+XXFd06QurEX/mGMBncGU6+i97cXjCF6EYPEH
H75CW6UyXgbz0rJ2tZ/OZCcwYDG9eqHbpgaFY1EGeznu7QkGwV+M4pREhesDo+nm
mXIsmGEztzGu2TMM+TI8mrWodczDnF66iTQRHDQy0t12jnrrCB3uemE4wjpyZCJP
ftoZuJbu0T4lhagXnftz1H7ymW7/qFeCxr85CCCHndF19IUBs3YuWXaRQ1YoaKkJ
olB+Ubu0zJfGizSC/oJqDwtKUthyeA==
=ECH6
-----END PGP SIGNATURE-----

--I73xNqd38oT7/msC--
