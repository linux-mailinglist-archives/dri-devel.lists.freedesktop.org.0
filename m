Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C61A7E71F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 18:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CC610E520;
	Mon,  7 Apr 2025 16:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsXYPM6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DA110E520;
 Mon,  7 Apr 2025 16:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744044438; x=1775580438;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=d/9rF2v6gxz+aVjjloTd50bAqLAn569sdN/hKyUhniA=;
 b=XsXYPM6IUjuuabnjasAYhW2DkGkGjqiX1oebt1eJSJHcOp3cLZiHN+78
 wzfuo3D44KwKJDpWiykV+aNXpgh2m0AgHZw80UxOX15x40/mgRLNu+1oU
 KzxwHU8WXsX0NeDjGkAzPcTe2/m9/tdyjBWuE+EDTV14tGv8z5sFV1nXx
 +O2A9KBcYUOJ5KILWnXEY8CGzuxkQSoiv2FUTu2Yo3LftFZHMpZ1lzGke
 /gcXlvtVKuJSaTe4eAUBUH+Rh++1O1M2Rzu+uf1Fuj/l+bzycWGSvE5Qo
 IzJxWk5GDYlKEzIbN5p59ozlK/johH8D8w2df0exnYffUksOHMiKfxSma g==;
X-CSE-ConnectionGUID: KHwFlaWYSaafZ4P98R9/Pw==
X-CSE-MsgGUID: OwDZnmJ+RNObfgMBPf02yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45533292"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="45533292"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 09:47:13 -0700
X-CSE-ConnectionGUID: dEMeJzZ7RJaZ+YDO48bYaw==
X-CSE-MsgGUID: yioqSJnkQC+IzOwpsUAeHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="127767783"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.229])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 09:47:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Apr 2025 19:46:59 +0300 (EEST)
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?ISO-8859-15?Q?Herv=E9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 LKML <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 02/34] platform: arm64: acer-aspire1-ec: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
Message-ID: <a9000632-a6d1-d369-c317-9ee73aa645dc@linux.intel.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1316811861-1744044419=:936"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1316811861-1744044419=:936
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 7 Apr 2025, Luca Ceresoli wrote:

> This is the new API for allocating DRM bridges.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> Cc: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/arm64/acer-aspire1-ec.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platform/=
arm64/acer-aspire1-ec.c
> index 958fe1bf5f85bb69ac7962f217de9f0b40cde9a1..438532a047e68799ac53a16a4=
c813fc16be997b9 100644
> --- a/drivers/platform/arm64/acer-aspire1-ec.c
> +++ b/drivers/platform/arm64/acer-aspire1-ec.c
> @@ -452,9 +452,9 @@ static int aspire_ec_probe(struct i2c_client *client)
>  =09int ret;
>  =09u8 tmp;
> =20
> -=09ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> -=09if (!ec)
> -=09=09return -ENOMEM;
> +=09ec =3D devm_drm_bridge_alloc(dev, struct aspire_ec, bridge, &aspire_e=
c_bridge_funcs);
> +=09if (IS_ERR(ec))
> +=09=09return PTR_ERR(ec);
> =20
>  =09ec->client =3D client;
>  =09i2c_set_clientdata(client, ec);
> @@ -497,7 +497,6 @@ static int aspire_ec_probe(struct i2c_client *client)
>  =09fwnode =3D device_get_named_child_node(dev, "connector");
>  =09if (fwnode) {
>  =09=09INIT_WORK(&ec->work, aspire_ec_bridge_update_hpd_work);
> -=09=09ec->bridge.funcs =3D &aspire_ec_bridge_funcs;
>  =09=09ec->bridge.of_node =3D to_of_node(fwnode);
>  =09=09ec->bridge.ops =3D DRM_BRIDGE_OP_HPD;
>  =09=09ec->bridge.type =3D DRM_MODE_CONNECTOR_USB;

Hi Luca,

It took a while to locate where the code for the new helper is. I suggest=
=20
if you need send another version of the series directly linking to the=20
commit in the cover letter so that it won't take multiple hoops to find it=
=20
if one wants to review the code and is not having all drm trees easily at=
=20
hand. Here it is for the benefit of other pdx86 people:

https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b71=
5ea3d1ba537ef2da95eec


Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

I assume you want this to go through the drm tree where the helper already=
=20
is?

--=20
 i.

--8323328-1316811861-1744044419=:936--
