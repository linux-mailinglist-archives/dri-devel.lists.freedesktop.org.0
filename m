Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B8C412781
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 22:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD946E856;
	Mon, 20 Sep 2021 20:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418536E856
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 20:50:08 +0000 (UTC)
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mSQEe-00073i-MT; Mon, 20 Sep 2021 22:49:56 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/bridge: Move devm_drm_of_get_bridge to bridge/panel.c
Date: Mon, 20 Sep 2021 22:49:55 +0200
Message-ID: <4266046.upgBnu7FSg@diego>
In-Reply-To: <20210917180925.2602266-1-maxime@cerno.tech>
References: <20210917180925.2602266-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Hi Maxime,

Am Freitag, 17. September 2021, 20:09:25 CEST schrieb Maxime Ripard:
> By depending on devm_drm_panel_bridge_add(), devm_drm_of_get_bridge()
> introduces a circular dependency between the modules drm (where
> devm_drm_of_get_bridge() ends up) and drm_kms_helper (where
> devm_drm_panel_bridge_add() is).
>=20
> Fix this by moving devm_drm_of_get_bridge() to bridge/panel.c and thus
> drm_kms_helper.
>=20
> Fixes: 87ea95808d53 ("drm/bridge: Add a function to abstract away panels")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I started with drm-misc-next at
=2D e46ad85acd90 ("MAINTAINERS: add Andrey as the DRM GPU scheduler maintai=
ner")

with your patch on top, I end up with:

make[1]: Verzeichnis =E2=80=9E/home/devel/hstuebner/02_drm/linux/_build-arm=
64=E2=80=9C wird betreten
  GEN     Makefile
  CALL    ../scripts/atomic/check-atomics.sh
  CALL    ../scripts/checksyscalls.sh
  CC [M]  drivers/gpu/drm/bridge/panel.o
  CC [M]  drivers/gpu/drm/drm_bridge.o
  LD [M]  drivers/gpu/drm/drm.o
=2E./drivers/gpu/drm/bridge/panel.c: In function =E2=80=98devm_drm_of_get_b=
ridge=E2=80=99:
=2E./drivers/gpu/drm/bridge/panel.c:359:8: error: implicit declaration of f=
unction =E2=80=98drm_of_find_panel_or_bridge=E2=80=99 [-Werror=3Dimplicit-f=
unction-declaration]
  359 |  ret =3D drm_of_find_panel_or_bridge(np, port, endpoint,
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~

adding the following makes it compile again:
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 285a079cdef5..b32295abd9e7 100644
=2D-- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -9,6 +9,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>


I obviously also ran into the circular dependency-issue right now,
so with the above addition:

Tested-by: Heiko Stuebner <heiko@sntech.de>


Heiko

> ---
>  drivers/gpu/drm/bridge/panel.c | 36 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_bridge.c   | 34 --------------------------------
>  2 files changed, 36 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/pane=
l.c
> index c916f4b8907e..285a079cdef5 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -332,3 +332,39 @@ struct drm_connector *drm_panel_bridge_connector(str=
uct drm_bridge *bridge)
>  	return &panel_bridge->connector;
>  }
>  EXPORT_SYMBOL(drm_panel_bridge_connector);
> +
> +#ifdef CONFIG_OF
> +/**
> + * devm_drm_of_get_bridge - Return next bridge in the chain
> + * @dev: device to tie the bridge lifetime to
> + * @np: device tree node containing encoder output ports
> + * @port: port in the device tree node
> + * @endpoint: endpoint in the device tree node
> + *
> + * Given a DT node's port and endpoint number, finds the connected node
> + * and returns the associated bridge if any, or creates and returns a
> + * drm panel bridge instance if a panel is connected.
> + *
> + * Returns a pointer to the bridge if successful, or an error pointer
> + * otherwise.
> + */
> +struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> +					  struct device_node *np,
> +					  u32 port, u32 endpoint)
> +{
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	ret =3D drm_of_find_panel_or_bridge(np, port, endpoint,
> +					  &panel, &bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (panel)
> +		bridge =3D devm_drm_panel_bridge_add(dev, panel);
> +
> +	return bridge;
> +}
> +EXPORT_SYMBOL(devm_drm_of_get_bridge);
> +#endif
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 4c68733fa660..7ee29f073857 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1232,40 +1232,6 @@ struct drm_bridge *of_drm_find_bridge(struct devic=
e_node *np)
>  	return NULL;
>  }
>  EXPORT_SYMBOL(of_drm_find_bridge);
> -
> -/**
> - * devm_drm_of_get_bridge - Return next bridge in the chain
> - * @dev: device to tie the bridge lifetime to
> - * @np: device tree node containing encoder output ports
> - * @port: port in the device tree node
> - * @endpoint: endpoint in the device tree node
> - *
> - * Given a DT node's port and endpoint number, finds the connected node
> - * and returns the associated bridge if any, or creates and returns a
> - * drm panel bridge instance if a panel is connected.
> - *
> - * Returns a pointer to the bridge if successful, or an error pointer
> - * otherwise.
> - */
> -struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> -					  struct device_node *np,
> -					  u32 port, u32 endpoint)
> -{
> -	struct drm_bridge *bridge;
> -	struct drm_panel *panel;
> -	int ret;
> -
> -	ret =3D drm_of_find_panel_or_bridge(np, port, endpoint,
> -					  &panel, &bridge);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	if (panel)
> -		bridge =3D devm_drm_panel_bridge_add(dev, panel);
> -
> -	return bridge;
> -}
> -EXPORT_SYMBOL(devm_drm_of_get_bridge);
>  #endif
> =20
>  MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
>=20




