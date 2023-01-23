Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52704677663
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 09:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79E610E312;
	Mon, 23 Jan 2023 08:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1556 seconds by postgrey-1.36 at gabe;
 Mon, 23 Jan 2023 08:39:11 UTC
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de
 [80.67.18.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F19B10E1E2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 08:39:11 +0000 (UTC)
Received: from [89.1.81.74] (helo=karo-electronics.de)
 by smtprelay02.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <LW@KARO-electronics.de>)
 id 1pJrxh-0005ss-PT; Mon, 23 Jan 2023 09:13:53 +0100
Date: Mon, 23 Jan 2023 09:13:07 +0100
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 2/2] drm: lcdif: Add i.MX93 LCDIF support
Message-ID: <20230123091307.46ace33f@karo-electronics.de>
In-Reply-To: <20230123072358.1060670-3-victor.liu@nxp.com>
References: <20230123072358.1060670-1-victor.liu@nxp.com>
 <20230123072358.1060670-3-victor.liu@nxp.com>
Organization: Ka-Ro electronics GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Df-Sender: bHdAa2Fyby1lbGVjdHJvbmljcy5kb21haW5mYWN0b3J5LWt1bmRlLmRl
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
Cc: marex@denx.de, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 23 Jan 2023 15:23:58 +0800 Liu Ying wrote:
> The LCDIF embedded in i.MX93 SoC is essentially the same to those
> in i.MX8mp SoC.  However, i.MX93 LCDIF may connect with MIPI DSI
> controller through LCDIF cross line pattern(controlled by mediamix
> blk-ctrl) or connect with LVDS display bridge(LDB) directly or a
> parallel display(also through mediamix blk-ctrl), so add multiple
> encoders(with DRM_MODE_ENCODER_NONE encoder type) support in the
> LCDIF DRM driver and find a bridge to attach the relevant encoder's
> chain when needed.  While at it, derive lcdif_crtc_state structure
> from drm_crtc_state structure to introduce bus_format and bus_flags
> states so that the next downstream bridges may use consistent bus
> format and bus flags.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c |  73 +++++++++--
>  drivers/gpu/drm/mxsfb/lcdif_drv.h |   6 +-
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 206 ++++++++++++++++++++----------
>  3 files changed, 208 insertions(+), 77 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index cc2ceb301b96..4d41f6b6eb14 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -9,13 +9,16 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> =20
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_encoder.h>
>  #include <drm/drm_fbdev_generic.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> @@ -38,21 +41,70 @@ static const struct drm_mode_config_helper_funcs lcdi=
f_mode_config_helpers =3D {
>  	.atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
>  };
> =20
> +static const struct drm_encoder_funcs lcdif_encoder_funcs =3D {
> +	.destroy =3D drm_encoder_cleanup,
> +};
> +
>  static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  {
> -	struct drm_device *drm =3D lcdif->drm;
> +	struct device *dev =3D lcdif->drm->dev;
> +	struct device_node *ep;
>  	struct drm_bridge *bridge;
>  	int ret;
> =20
> -	bridge =3D devm_drm_of_get_bridge(drm->dev, drm->dev->of_node, 0, 0);
> -	if (IS_ERR(bridge))
> -		return PTR_ERR(bridge);
> -
> -	ret =3D drm_bridge_attach(&lcdif->encoder, bridge, NULL, 0);
> -	if (ret)
> -		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
> -
> -	lcdif->bridge =3D bridge;
> +	for_each_endpoint_of_node(dev->of_node, ep) {
> +		struct device_node *remote;
> +		struct of_endpoint of_ep;
> +		struct drm_encoder *encoder;
> +
> +		remote =3D of_graph_get_remote_port_parent(ep);
> +		if (!remote || !of_device_is_available(remote)) {
'!remote ||' is redundant, since of_device_is_available already checks
for a NULL pointer.

[...]

> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lc=
dif_kms.c
> index 262bc43b1079..ba36447ed900 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
[...]
> @@ -529,6 +580,46 @@ static void lcdif_crtc_atomic_disable(struct drm_crt=
c *crtc,
>  	pm_runtime_put_sync(drm->dev);
>  }
> =20
> +static void lcdif_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct lcdif_crtc_state *state;
> +
> +	if (crtc->state)
> +		__drm_atomic_helper_crtc_destroy_state(crtc->state);
> +
> +	kfree(to_lcdif_crtc_state(crtc->state));
>
If crtc-state can be NULL at this point, this will only work as long as
'base' is the first member of the lcdif_crtc_state struct (which
currently is the case, but there is no guarantee that this will always
be this way), otherwise the if clause above is not needed.



Lothar Wa=C3=9Fmann
