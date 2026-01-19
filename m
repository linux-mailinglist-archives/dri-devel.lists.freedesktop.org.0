Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C76D3B09C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B998810E4C0;
	Mon, 19 Jan 2026 16:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.b="xsd3E0BZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 460 seconds by postgrey-1.36 at gabe;
 Mon, 19 Jan 2026 16:25:46 UTC
Received: from aposti.net (aposti.net [185.119.170.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6264D10E4C0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 16:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1768839484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=k4X+3MxTIM2J3Uj4oCRGgpWqMnxz7Kec2PjoqB87Hqw=;
 b=xsd3E0BZAWb17gWY4f60/+X4jmvsNmTSyvDDfD/TZ3KeDc8KycXhkiMY9GSu4eloiYf9Jy
 VNcdQgnRKNicvZJXYdPI503fmJOJbqH6HWyKjbIwwdA0LXan2fpMox8h0lLqdnRC7Ca5Xd
 zj0DxPFD0oxNm9JgqQfbkPUZwkyN/Ko=
Message-ID: <7fbe01023b190e7ddefefa53bb7653117b3dcaf3.camel@crapouillou.net>
Subject: Re: [PATCH v3 09/15] drm/ingenic: Switch private_obj initialization
 to atomic_create_state
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org
Date: Mon, 19 Jan 2026 17:18:01 +0100
In-Reply-To: <20260119-drm-private-obj-reset-v3-9-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
 <20260119-drm-private-obj-reset-v3-9-b931abe3a5e3@redhat.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Le lundi 19 janvier 2026 =C3=A0 13:50 +0100, Maxime Ripard a =C3=A9crit=C2=
=A0:
> The ingenic driver relies on two drm_private_objs, that are
> initialized
> by allocating and initializing a state, and then passing it to
> drm_private_obj_init.
>=20
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation,
> let's
> migrate this instance to the new pattern.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Thought I had ack'd it before, apparently I didn't.

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

>=20
> ---
>=20
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: linux-mips@vger.kernel.org
> ---
> =C2=A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 28 +++++++++++++++++---=
-
> -------
> =C2=A0drivers/gpu/drm/ingenic/ingenic-ipu.c=C2=A0=C2=A0=C2=A0=C2=A0 | 28 =
++++++++++++++++-----
> -------
> =C2=A02 files changed, 33 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index
> d3213fbf22be14b177fc1b7100c5b721d5f17924..862691991ed2770d30342bf531e
> 828e34bd7080a 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -952,10 +952,24 @@ static void ingenic_drm_destroy_state(struct
> drm_private_obj *obj,
> =C2=A0	struct ingenic_drm_private_state *priv_state =3D
> to_ingenic_drm_priv_state(state);
> =C2=A0
> =C2=A0	kfree(priv_state);
> =C2=A0}
> =C2=A0
> +static struct drm_private_state *
> +ingenic_drm_create_state(struct drm_private_obj *obj)
> +{
> +	struct ingenic_drm_private_state *priv_state;
> +
> +	priv_state =3D kzalloc(sizeof(*priv_state), GFP_KERNEL);
> +	if (!priv_state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_private_obj_create_state(obj,
> &priv_state->base);
> +
> +	return &priv_state->base;
> +}
> +
> =C2=A0DEFINE_DRM_GEM_DMA_FOPS(ingenic_drm_fops);
> =C2=A0
> =C2=A0static const struct drm_driver ingenic_drm_driver_data =3D {
> =C2=A0	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM |
> DRIVER_ATOMIC,
> =C2=A0	.name			=3D "ingenic-drm",
> @@ -1032,10 +1046,11 @@ static const struct drm_mode_config_funcs
> ingenic_drm_mode_config_funcs =3D {
> =C2=A0static struct drm_mode_config_helper_funcs
> ingenic_drm_mode_config_helpers =3D {
> =C2=A0	.atomic_commit_tail =3D drm_atomic_helper_commit_tail,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct drm_private_state_funcs
> ingenic_drm_private_state_funcs =3D {
> +	.atomic_create_state =3D ingenic_drm_create_state,
> =C2=A0	.atomic_duplicate_state =3D ingenic_drm_duplicate_state,
> =C2=A0	.atomic_destroy_state =3D ingenic_drm_destroy_state,
> =C2=A0};
> =C2=A0
> =C2=A0static void ingenic_drm_unbind_all(void *d)
> @@ -1085,11 +1100,10 @@ static void
> ingenic_drm_atomic_private_obj_fini(struct drm_device *drm, void *pr
> =C2=A0}
> =C2=A0
> =C2=A0static int ingenic_drm_bind(struct device *dev, bool has_components=
)
> =C2=A0{
> =C2=A0	struct platform_device *pdev =3D to_platform_device(dev);
> -	struct ingenic_drm_private_state *private_state;
> =C2=A0	const struct jz_soc_info *soc_info;
> =C2=A0	struct ingenic_drm *priv;
> =C2=A0	struct clk *parent_clk;
> =C2=A0	struct drm_plane *primary;
> =C2=A0	struct drm_bridge *bridge;
> @@ -1385,23 +1399,17 @@ static int ingenic_drm_bind(struct device
> *dev, bool has_components)
> =C2=A0	if (ret) {
> =C2=A0		dev_err(dev, "Unable to register clock notifier\n");
> =C2=A0		goto err_devclk_disable;
> =C2=A0	}
> =C2=A0
> -	private_state =3D kzalloc(sizeof(*private_state), GFP_KERNEL);
> -	if (!private_state) {
> -		ret =3D -ENOMEM;
> -		goto err_clk_notifier_unregister;
> -	}
> -
> -	drm_atomic_private_obj_init(drm, &priv->private_obj,
> &private_state->base,
> +	drm_atomic_private_obj_init(drm, &priv->private_obj, NULL,
> =C2=A0				=C2=A0=C2=A0=C2=A0
> &ingenic_drm_private_state_funcs);
> =C2=A0
> =C2=A0	ret =3D drmm_add_action_or_reset(drm,
> ingenic_drm_atomic_private_obj_fini,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &priv->private_obj);
> =C2=A0	if (ret)
> -		goto err_private_state_free;
> +		goto err_clk_notifier_unregister;
> =C2=A0
> =C2=A0	ret =3D drm_dev_register(drm, 0);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(dev, "Failed to register DRM driver\n");
> =C2=A0		goto err_clk_notifier_unregister;
> @@ -1409,12 +1417,10 @@ static int ingenic_drm_bind(struct device
> *dev, bool has_components)
> =C2=A0
> =C2=A0	drm_client_setup(drm, NULL);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> -err_private_state_free:
> -	kfree(private_state);
> =C2=A0err_clk_notifier_unregister:
> =C2=A0	clk_notifier_unregister(parent_clk, &priv->clock_nb);
> =C2=A0err_devclk_disable:
> =C2=A0	if (priv->lcd_clk)
> =C2=A0		clk_disable_unprepare(priv->lcd_clk);
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index
> 32638a713241abbd4eaed09f0aaec2b790650cc9..253a1ce30997308547b61339468
> d52e6875785d3 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -748,11 +748,26 @@ static void ingenic_ipu_destroy_state(struct
> drm_private_obj *obj,
> =C2=A0	struct ingenic_ipu_private_state *priv_state =3D
> to_ingenic_ipu_priv_state(state);
> =C2=A0
> =C2=A0	kfree(priv_state);
> =C2=A0}
> =C2=A0
> +static struct drm_private_state *
> +ingenic_ipu_create_state(struct drm_private_obj *obj)
> +{
> +	struct ingenic_ipu_private_state *priv_state;
> +
> +	priv_state =3D kzalloc(sizeof(*priv_state), GFP_KERNEL);
> +	if (!priv_state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_private_obj_create_state(obj,
> &priv_state->base);
> +
> +	return &priv_state->base;
> +}
> +
> =C2=A0static const struct drm_private_state_funcs
> ingenic_ipu_private_state_funcs =3D {
> +	.atomic_create_state =3D ingenic_ipu_create_state,
> =C2=A0	.atomic_duplicate_state =3D ingenic_ipu_duplicate_state,
> =C2=A0	.atomic_destroy_state =3D ingenic_ipu_destroy_state,
> =C2=A0};
> =C2=A0
> =C2=A0static irqreturn_t ingenic_ipu_irq_handler(int irq, void *arg)
> @@ -791,11 +806,10 @@ static const struct regmap_config
> ingenic_ipu_regmap_config =3D {
> =C2=A0};
> =C2=A0
> =C2=A0static int ingenic_ipu_bind(struct device *dev, struct device
> *master, void *d)
> =C2=A0{
> =C2=A0	struct platform_device *pdev =3D to_platform_device(dev);
> -	struct ingenic_ipu_private_state *private_state;
> =C2=A0	const struct soc_info *soc_info;
> =C2=A0	struct drm_device *drm =3D d;
> =C2=A0	struct drm_plane *plane;
> =C2=A0	struct ingenic_ipu *ipu;
> =C2=A0	void __iomem *base;
> @@ -885,24 +899,14 @@ static int ingenic_ipu_bind(struct device *dev,
> struct device *master, void *d)
> =C2=A0	if (err) {
> =C2=A0		dev_err(dev, "Unable to prepare clock\n");
> =C2=A0		return err;
> =C2=A0	}
> =C2=A0
> -	private_state =3D kzalloc(sizeof(*private_state), GFP_KERNEL);
> -	if (!private_state) {
> -		err =3D -ENOMEM;
> -		goto err_clk_unprepare;
> -	}
> -
> -	drm_atomic_private_obj_init(drm, &ipu->private_obj,
> &private_state->base,
> +	drm_atomic_private_obj_init(drm, &ipu->private_obj, NULL,
> =C2=A0				=C2=A0=C2=A0=C2=A0
> &ingenic_ipu_private_state_funcs);
> =C2=A0
> =C2=A0	return 0;
> -
> -err_clk_unprepare:
> -	clk_unprepare(ipu->clk);
> -	return err;
> =C2=A0}
> =C2=A0
> =C2=A0static void ingenic_ipu_unbind(struct device *dev,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *master, void=
 *d)
> =C2=A0{
