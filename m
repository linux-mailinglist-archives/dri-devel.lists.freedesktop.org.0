Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F100A429823
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 22:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AA36E95B;
	Mon, 11 Oct 2021 20:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BB96E95B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 20:29:35 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id ea1c7aa4-2ad1-11ec-9c3f-0050568c148b;
 Mon, 11 Oct 2021 20:29:20 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id CD5E4194B69;
 Mon, 11 Oct 2021 22:29:19 +0200 (CEST)
Date: Mon, 11 Oct 2021 22:29:30 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi83: Add vcc supply regulator
 support
Message-ID: <YWSeqpTq2XSCzU0U@ravnborg.org>
References: <20211006074713.1094396-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006074713.1094396-1-alexander.stein@ew.tq-group.com>
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

Hi Alexander,

On Wed, Oct 06, 2021 at 09:47:11AM +0200, Alexander Stein wrote:
> VCC needs to be enabled before releasing the enable GPIO.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index a32f70bc68ea..5fab0fabcd15 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -33,6 +33,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> @@ -143,6 +144,7 @@ struct sn65dsi83 {
>  	struct mipi_dsi_device		*dsi;
>  	struct drm_bridge		*panel_bridge;
>  	struct gpio_desc		*enable_gpio;
> +	struct regulator		*vcc;
>  	int				dsi_lanes;
>  	bool				lvds_dual_link;
>  	bool				lvds_dual_link_even_odd_swap;
> @@ -647,6 +649,12 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
>  
>  	ctx->panel_bridge = panel_bridge;
>  
> +	ctx->vcc = devm_regulator_get(dev, "vcc");
In the binding the vcc regulator is required, but devm_regulator_get()
will create a dummy regulator if not found. Maybe this is on purpose and
all is good.

	Sam
