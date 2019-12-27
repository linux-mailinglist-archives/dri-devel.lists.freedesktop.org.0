Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C623B12B50C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 15:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E59A89255;
	Fri, 27 Dec 2019 14:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB1489255
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 14:03:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B782B289B90;
 Fri, 27 Dec 2019 14:03:18 +0000 (GMT)
Date: Fri, 27 Dec 2019 15:03:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/bridge: Fix Exynos DSI after making bridge chain a
 double-linked list
Message-ID: <20191227150315.0ab22599@collabora.com>
In-Reply-To: <20191227142313.5032ff0f@collabora.com>
References: <CGME20191227110216eucas1p17cbf91afa905852d3c0b1efeec0f6f8d@eucas1p1.samsung.com>
 <20191227110135.4961-1-m.szyprowski@samsung.com>
 <20191227130004.69d7dcad@collabora.com>
 <20191227142313.5032ff0f@collabora.com>
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

On Fri, 27 Dec 2019 14:23:13 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Fri, 27 Dec 2019 13:00:04 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > On Fri, 27 Dec 2019 12:01:35 +0100
> > Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >   
> > > Exynos DSI DRM driver uses private calls to out bridge to force certain
> > > order of operations during init/exit sequences. This no longer works after
> > > conversion of bridge chain to a double-linked list. To fix the regression
> > > call bridge related operations manually instead of the generic
> > > drm_bridge_chain_*() operations.    
> > 
> > I think it'd be worth explaining what the problem is (infinite loop
> > caused by list_for_each_entry() use when the bridge is no longer part
> > of the chain attached to the encoder).
> >   
> > > 
> > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")    
> > 
> > We also need to fix that in VC4.
> >   
> > > ---
> > > This patch is a result of the following discussion:
> > > https://www.spinics.net/lists/dri-devel/msg239256.html
> > > ---
> > >  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 21 ++++++++++++---------
> > >  1 file changed, 12 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > index 3955f84dc893..f5905c239a86 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > @@ -255,7 +255,6 @@ struct exynos_dsi {
> > >  	struct mipi_dsi_host dsi_host;
> > >  	struct drm_connector connector;
> > >  	struct drm_panel *panel;
> > > -	struct list_head bridge_chain;
> > >  	struct drm_bridge *out_bridge;
> > >  	struct device *dev;
> > >  
> > > @@ -1391,7 +1390,8 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
> > >  		if (ret < 0)
> > >  			goto err_put_sync;
> > >  	} else {
> > > -		drm_bridge_chain_pre_enable(dsi->out_bridge);
> > > +		if (dsi->out_bridge->funcs->pre_enable)
> > > +			dsi->out_bridge->funcs->pre_enable(dsi->out_bridge);    
> > 
> > Okay, so you're calling ->{pre_enable,enable,disable,post_disable}() on
> > the first bridge element which only works if the chain contains one
> > bridge (see below). Maybe you should keep exynos_dsi.bridge_chain and
> > create custom helpers to iterate over chain elements instead of calling
> > those hooks only on out_bridge.  
> 
> The following diff should fix the problem while keeping the solution
> generic enough to support chains containing more than one bridge.
> 
> --->8---  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 3955f84dc893..c861b640fc59 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1378,6 +1378,7 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
>  static void exynos_dsi_enable(struct drm_encoder *encoder)
>  {
>         struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> +       struct drm_bridge *iter;
>         int ret;
>  
>         if (dsi->state & DSIM_STATE_ENABLED)
> @@ -1391,7 +1392,11 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>                 if (ret < 0)
>                         goto err_put_sync;
>         } else {
> -               drm_bridge_chain_pre_enable(dsi->out_bridge);
> +               list_for_each_entry_reverse(iter, &encoder->bridge_chain,

						     ^&dsi->bridge_chain

And the same applies to all list_for_each() calls in this patch.

> +                                           chain_node) {
> +                       if (iter->funcs->pre_enable)
> +                               iter->funcs->pre_enable(iter);
> +               }
>         }
>  
>         exynos_dsi_set_display_mode(dsi);
> @@ -1402,7 +1407,10 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>                 if (ret < 0)
>                         goto err_display_disable;
>         } else {
> -               drm_bridge_chain_enable(dsi->out_bridge);
> +               list_for_each_entry(iter, &encoder->bridge_chain, chain_node) {
> +                       if (iter->funcs->enable)
> +                               iter->funcs->enable(iter);
> +               }
>         }
>  
>         dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
> @@ -1420,6 +1428,7 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>  static void exynos_dsi_disable(struct drm_encoder *encoder)
>  {
>         struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> +       struct drm_bridge *iter;
>  
>         if (!(dsi->state & DSIM_STATE_ENABLED))
>                 return;
> @@ -1427,10 +1436,20 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
>         dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>  
>         drm_panel_disable(dsi->panel);
> -       drm_bridge_chain_disable(dsi->out_bridge);
> +
> +       list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> +               if (iter->funcs->disable)
> +                       iter->funcs->disable(iter);
> +       }
> +
>         exynos_dsi_set_display_enable(dsi, false);
>         drm_panel_unprepare(dsi->panel);
> -       drm_bridge_chain_post_disable(dsi->out_bridge);
> +
> +       list_for_each_entry(iter, &encoder->bridge_chain, chain_node) {
> +               if (iter->funcs->post_disable)
> +                       iter->funcs->post_disable(iter);
> +       }
> +
>         dsi->state &= ~DSIM_STATE_ENABLED;
>         pm_runtime_put_sync(dsi->dev);
>  }
> @@ -1523,7 +1542,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>         if (out_bridge) {
>                 drm_bridge_attach(encoder, out_bridge, NULL);
>                 dsi->out_bridge = out_bridge;
> -               list_splice(&encoder->bridge_chain, &dsi->bridge_chain);
> +               list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
>         } else {
>                 int ret = exynos_dsi_create_connector(encoder);
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
