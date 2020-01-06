Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353A61313DD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 15:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA936E2BD;
	Mon,  6 Jan 2020 14:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06AB89D60
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 14:40:33 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0FEDA28EC45;
 Mon,  6 Jan 2020 14:40:30 +0000 (GMT)
Date: Mon, 6 Jan 2020 15:40:26 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v6 2/4] drm/bridge: Patch atomic hooks to take a
 drm_bridge_state
Message-ID: <20200106154026.366f039e@collabora.com>
In-Reply-To: <20200106143409.32321-3-narmstrong@baylibre.com>
References: <20200106143409.32321-1-narmstrong@baylibre.com>
 <20200106143409.32321-3-narmstrong@baylibre.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, devicetree@vger.kernel.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  6 Jan 2020 15:34:07 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 8ffa4fbbdeb3..b8b22dc55bdb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -590,8 +590,9 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>  }
>  
>  static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
> -				    struct drm_atomic_state *state)
> +				    struct drm_bridge_state *old_bridge_state)
>  {
> +	struct drm_atomic_state *state = old_bridge_state->base.state;
>  	struct drm_connector *connector;
>  	struct drm_crtc *crtc;
>  
> @@ -603,7 +604,7 @@ static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>  }
>  
>  static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
> -				     struct drm_atomic_state *state)
> +				     struct drm_bridge_state *state)

Just a nit: maybe you should name that one old_bridge_state for
consistency.

>  {
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>  
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
