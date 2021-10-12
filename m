Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2795942A291
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 12:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7E06E8E9;
	Tue, 12 Oct 2021 10:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61706E8E9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 10:44:12 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AC8DF1;
 Tue, 12 Oct 2021 12:44:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634035451;
 bh=I3o+eF6qMXWtqB1e0jLelJZ+Ll1+7ojcRN226D7ZWqY=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=vgMqgLWqtMYuAGlej861F2L/7i5YKd2/RB0a7D533FRij0STGT6ZKdAZTmeg0xRZJ
 IZyS28/hD8heIYhD8S1rUleyp8FEovrsxK4V86Abk9b3GD2g8L/EHTo1Q/kRvQZRf3
 enwaM9vfr5eS2mB6PVHBxRJNcOpBVadZKWuULQPk=
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <20210923070701.145377-6-narmstrong@baylibre.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v5 5/8] drm/omap: Add global state as a private atomic
 object
Message-ID: <2609ca32-90e8-1335-2769-14dcbcdfafde@ideasonboard.com>
Date: Tue, 12 Oct 2021 13:44:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923070701.145377-6-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 23/09/2021 10:06, Neil Armstrong wrote:
> From: Benoit Parrot <bparrot@ti.com>
> 
> Global shared resources (like hw overlays) for omapdrm are implemented
> as a part of atomic state using the drm_private_obj infrastructure
> available in the atomic core.
> 
> omap_global_state is introduced as a drm atomic private object. The two
> funcs omap_get_global_state() and omap_get_existing_global_state() are
> the two variants that will be used to access omap_global_state.
> 
> drm_mode_config_init() needs to be called earlier because it
> creates/initializes the private_obj link list maintained by the atomic
> framework. The private_obj link list has to exist prior to calling
> drm_atomic_private_obj_init(). Similarly the cleanup handler are
> reordered appropriately.

I'm not really familiar with the private object. Did you check how 
current drivers use it? These patches are 3 years old, and things might 
have changed around the private object.

> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_drv.c | 91 +++++++++++++++++++++++++++++-
>   drivers/gpu/drm/omapdrm/omap_drv.h | 21 +++++++
>   2 files changed, 109 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index b994014b22e8..c7912374d393 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -128,6 +128,82 @@ static const struct drm_mode_config_funcs omap_mode_config_funcs = {
>   	.atomic_commit = drm_atomic_helper_commit,
>   };
>   
> +/* Global/shared object state funcs */
> +
> +/*
> + * This is a helper that returns the private state currently in operation.
> + * Note that this would return the "old_state" if called in the atomic check
> + * path, and the "new_state" after the atomic swap has been done.
> + */
> +struct omap_global_state *
> +omap_get_existing_global_state(struct omap_drm_private *priv)
> +{
> +	return to_omap_global_state(priv->glob_obj.state);
> +}
> +
> +/*
> + * This acquires the modeset lock set aside for global state, creates
> + * a new duplicated private object state.
> + */
> +struct omap_global_state *__must_check
> +omap_get_global_state(struct drm_atomic_state *s)
> +{
> +	struct omap_drm_private *priv = s->dev->dev_private;
> +	struct drm_private_state *priv_state;
> +
> +	priv_state = drm_atomic_get_private_obj_state(s, &priv->glob_obj);
> +	if (IS_ERR(priv_state))
> +		return ERR_CAST(priv_state);
> +
> +	return to_omap_global_state(priv_state);
> +}
> +
> +static struct drm_private_state *
> +omap_global_duplicate_state(struct drm_private_obj *obj)
> +{
> +	struct omap_global_state *state;
> +
> +	state = kmemdup(obj->state, sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return NULL;
> +
> +	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
> +
> +	return &state->base;
> +}
> +
> +static void omap_global_destroy_state(struct drm_private_obj *obj,
> +				      struct drm_private_state *state)
> +{
> +	struct omap_global_state *omap_state = to_omap_global_state(state);
> +
> +	kfree(omap_state);
> +}
> +
> +static const struct drm_private_state_funcs omap_global_state_funcs = {
> +	.atomic_duplicate_state = omap_global_duplicate_state,
> +	.atomic_destroy_state = omap_global_destroy_state,
> +};
> +
> +static int omap_global_obj_init(struct drm_device *dev)
> +{
> +	struct omap_drm_private *priv = dev->dev_private;
> +	struct omap_global_state *state;
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	drm_atomic_private_obj_init(dev, &priv->glob_obj, &state->base,
> +				    &omap_global_state_funcs);
> +	return 0;
> +}
> +
> +static void omap_global_obj_fini(struct omap_drm_private *priv)
> +{
> +	drm_atomic_private_obj_fini(&priv->glob_obj);
> +}
> +
>   static void omap_disconnect_pipelines(struct drm_device *ddev)
>   {
>   	struct omap_drm_private *priv = ddev->dev_private;
> @@ -231,8 +307,6 @@ static int omap_modeset_init(struct drm_device *dev)
>   	if (!omapdss_stack_is_ready())
>   		return -EPROBE_DEFER;
>   
> -	drm_mode_config_init(dev);
> -
>   	ret = omap_modeset_init_properties(dev);
>   	if (ret < 0)
>   		return ret;
> @@ -583,10 +657,16 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>   
>   	omap_gem_init(ddev);
>   
> -	ret = omap_hwoverlays_init(priv);
> +	drm_mode_config_init(ddev);
> +
> +	ret = omap_global_obj_init(ddev);
>   	if (ret)
>   		goto err_gem_deinit;
>   
> +	ret = omap_hwoverlays_init(priv);
> +	if (ret)
> +		goto err_free_priv_obj;
> +
>   	ret = omap_modeset_init(ddev);
>   	if (ret) {
>   		dev_err(priv->dev, "omap_modeset_init failed: ret=%d\n", ret);
> @@ -624,7 +704,10 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>   	omap_modeset_fini(ddev);
>   err_free_overlays:
>   	omap_hwoverlays_destroy(priv);
> +err_free_priv_obj:
> +	omap_global_obj_fini(priv);
>   err_gem_deinit:
> +	drm_mode_config_cleanup(ddev);
>   	omap_gem_deinit(ddev);
>   	destroy_workqueue(priv->wq);
>   	omap_disconnect_pipelines(ddev);
> @@ -649,6 +732,8 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
>   
>   	omap_modeset_fini(ddev);
>   	omap_hwoverlays_destroy(priv);
> +	omap_global_obj_fini(priv);
> +	drm_mode_config_cleanup(ddev);
>   	omap_gem_deinit(ddev);
>   
>   	destroy_workqueue(priv->wq);
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
> index b4d9c2062723..280cdd27bc8e 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.h
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.h
> @@ -14,6 +14,7 @@
>   #include "dss/omapdss.h"
>   #include "dss/dss.h"
>   
> +#include <drm/drm_atomic.h>
>   #include <drm/drm_gem.h>
>   #include <drm/omap_drm.h>
>   
> @@ -41,6 +42,15 @@ struct omap_drm_pipeline {
>   	unsigned int alias_id;
>   };
>   
> +/*
> + * Global private object state for tracking resources that are shared across
> + * multiple kms objects (planes/crtcs/etc).
> + */
> +#define to_omap_global_state(x) container_of(x, struct omap_global_state, base)

Add empty line here.

> +struct omap_global_state {
> +	struct drm_private_state base;
> +};
> +
>   struct omap_drm_private {
>   	struct drm_device *ddev;
>   	struct device *dev;
> @@ -61,6 +71,13 @@ struct omap_drm_private {
>   	unsigned int num_ovls;
>   	struct omap_hw_overlay *overlays[8];
>   
> +	/*
> +	 * Global private object state, Do not access directly, use
> +	 * omap_global_get_state()
> +	 */
> +	struct drm_modeset_lock glob_obj_lock;

This is not used... What am I missing?

> +	struct drm_private_obj glob_obj;
> +
>   	struct drm_fb_helper *fbdev;
>   
>   	struct workqueue_struct *wq;
> @@ -88,5 +105,9 @@ struct omap_drm_private {
>   
>   
>   void omap_debugfs_init(struct drm_minor *minor);
> +struct omap_global_state *__must_check
> +omap_get_global_state(struct drm_atomic_state *s);
> +struct omap_global_state *
> +omap_get_existing_global_state(struct omap_drm_private *priv);

These could also be separated by empty lines. At least to my eyes it 
gets confusing if those declarations are not separated.

  Tomi
