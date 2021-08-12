Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4593EA89D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 18:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9A76E431;
	Thu, 12 Aug 2021 16:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56F46E42E;
 Thu, 12 Aug 2021 16:38:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C3CDEE;
 Thu, 12 Aug 2021 18:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628786293;
 bh=2HDiXmTVesTJn2obN8uBGSFdC4syfvKgLkKFdsDgOKo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=puV6Kf/6AJ2scLFu4qMQ2d+mfA204YlSDCbWAmn8poa09dEvnJ8lGnNY3+wYYmTq0
 mjdTK5E96KG1RMn5RB3E9vIBx1q8lMlNTcOccX94NU8gRIX9sxN/pF3OOolupR+TCq
 mguCI5QfF3sm2W1wfyBPZF7pAG3vr+Tbm4dQTT6Y=
Date: Thu, 12 Aug 2021 19:38:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Avoid creating multiple
 connectors
Message-ID: <YRVOca+VBeejHCdZ@pendragon.ideasonboard.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210811235253.924867-2-robdclark@gmail.com>
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

Hi Rob,

Thank you for the patch.

On Wed, Aug 11, 2021 at 04:52:47PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> If we created our own connector because the driver does not support the
> NO_CONNECTOR flag, we don't want the downstream bridge to *also* create
> a connector.  And if this driver did pass the NO_CONNECTOR flag (and we
> supported that mode) this would change nothing.
> 
> Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Makes complete sense.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 9bf889302bcc..5d3b30b2f547 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -736,6 +736,9 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  	}
>  	pdata->dsi = dsi;
>  
> +	/* We never want the next bridge to *also* create a connector: */
> +	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> +
>  	/* Attach the next bridge */
>  	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
>  				&pdata->bridge, flags);

-- 
Regards,

Laurent Pinchart
