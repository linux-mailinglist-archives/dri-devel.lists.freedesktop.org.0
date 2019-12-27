Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 327CD12B466
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 13:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2845389803;
	Fri, 27 Dec 2019 12:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1C389E5A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 12:00:09 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6A14E28A693;
 Fri, 27 Dec 2019 12:00:07 +0000 (GMT)
Date: Fri, 27 Dec 2019 13:00:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/bridge: Fix Exynos DSI after making bridge chain a
 double-linked list
Message-ID: <20191227130004.69d7dcad@collabora.com>
In-Reply-To: <20191227110135.4961-1-m.szyprowski@samsung.com>
References: <CGME20191227110216eucas1p17cbf91afa905852d3c0b1efeec0f6f8d@eucas1p1.samsung.com>
 <20191227110135.4961-1-m.szyprowski@samsung.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Dec 2019 12:01:35 +0100
Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> Exynos DSI DRM driver uses private calls to out bridge to force certain
> order of operations during init/exit sequences. This no longer works after
> conversion of bridge chain to a double-linked list. To fix the regression
> call bridge related operations manually instead of the generic
> drm_bridge_chain_*() operations.

I think it'd be worth explaining what the problem is (infinite loop
caused by list_for_each_entry() use when the bridge is no longer part
of the chain attached to the encoder).

> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")

We also need to fix that in VC4.

> ---
> This patch is a result of the following discussion:
> https://www.spinics.net/lists/dri-devel/msg239256.html
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 3955f84dc893..f5905c239a86 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -255,7 +255,6 @@ struct exynos_dsi {
>  	struct mipi_dsi_host dsi_host;
>  	struct drm_connector connector;
>  	struct drm_panel *panel;
> -	struct list_head bridge_chain;
>  	struct drm_bridge *out_bridge;
>  	struct device *dev;
>  
> @@ -1391,7 +1390,8 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>  		if (ret < 0)
>  			goto err_put_sync;
>  	} else {
> -		drm_bridge_chain_pre_enable(dsi->out_bridge);
> +		if (dsi->out_bridge->funcs->pre_enable)
> +			dsi->out_bridge->funcs->pre_enable(dsi->out_bridge);

Okay, so you're calling ->{pre_enable,enable,disable,post_disable}() on
the first bridge element which only works if the chain contains one
bridge (see below). Maybe you should keep exynos_dsi.bridge_chain and
create custom helpers to iterate over chain elements instead of calling
those hooks only on out_bridge.

>  	}
>  
>  	exynos_dsi_set_display_mode(dsi);
> @@ -1402,7 +1402,8 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>  		if (ret < 0)
>  			goto err_display_disable;
>  	} else {
> -		drm_bridge_chain_enable(dsi->out_bridge);
> +		if (dsi->out_bridge->funcs->enable)
> +			dsi->out_bridge->funcs->enable(dsi->out_bridge);
>  	}
>  
>  	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
> @@ -1427,10 +1428,12 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
>  	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>  
>  	drm_panel_disable(dsi->panel);
> -	drm_bridge_chain_disable(dsi->out_bridge);
> +	if (dsi->out_bridge->funcs->disable)
> +		dsi->out_bridge->funcs->disable(dsi->out_bridge);
>  	exynos_dsi_set_display_enable(dsi, false);
>  	drm_panel_unprepare(dsi->panel);
> -	drm_bridge_chain_post_disable(dsi->out_bridge);
> +	if (dsi->out_bridge->funcs->post_disable)
> +		dsi->out_bridge->funcs->post_disable(dsi->out_bridge);
>  	dsi->state &= ~DSIM_STATE_ENABLED;
>  	pm_runtime_put_sync(dsi->dev);
>  }
> @@ -1521,9 +1524,11 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>  
>  	out_bridge  = of_drm_find_bridge(device->dev.of_node);
>  	if (out_bridge) {
> -		drm_bridge_attach(encoder, out_bridge, NULL);
> +		out_bridge->dev = drm;
> +		out_bridge->encoder = encoder;
> +		if (out_bridge->funcs->attach)
> +			out_bridge->funcs->attach(out_bridge);

If you don't want to keep the dsi_exynos.bridge_chain field, you should
probably still use drm_bridge_attach() here and manually reset
encoder->bridge_chain after checking it only contains a single element.
Something like:

		drm_bridge_attach(encoder, out_bridge, NULL);

		/*
		 * FIXME: we need to control the enable/disable
		 * sequence to make sure the DSI host controller is
		 * ready to send DSI commands before the
		 * bridge->pre_enable()/panel->prepare() hooks are
		 * called (those hooks are allowed to send DSI
		 * commands). The only way to do that right now is to
		 * reset the bridge chain so that the core thinks it's
		 * empty and turns drm_bridge_chain_xxx() calls into
		 * NOPs. This only works if the chain contains only one
		 * bridge, otherwise we'd be skipping bridge->xxx()
		 * calls on other bridges which is wrong.
		 */
		WARN_ON(!list_is_singular(&encoder->bridge_chain));
		INIT_LIST_HEAD(&encoder->bridge_chain);

Calling ->attach() directly might lead to an invalid pointer
dereference if out_bridge tries to attach to another bridge
(out_bridge->bridge_node is uninitialized if you don't call
drm_bridge_attach()).

>  		dsi->out_bridge = out_bridge;
> -		list_splice(&encoder->bridge_chain, &dsi->bridge_chain);
>  	} else {
>  		int ret = exynos_dsi_create_connector(encoder);
>  
> @@ -1589,7 +1594,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>  		if (dsi->out_bridge->funcs->detach)
>  			dsi->out_bridge->funcs->detach(dsi->out_bridge);
>  		dsi->out_bridge = NULL;
> -		INIT_LIST_HEAD(&dsi->bridge_chain);
>  	}
>  
>  	if (drm->mode_config.poll_enabled)
> @@ -1737,7 +1741,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>  	init_completion(&dsi->completed);
>  	spin_lock_init(&dsi->transfer_lock);
>  	INIT_LIST_HEAD(&dsi->transfer_list);
> -	INIT_LIST_HEAD(&dsi->bridge_chain);
>  
>  	dsi->dsi_host.ops = &exynos_dsi_ops;
>  	dsi->dsi_host.dev = dev;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
