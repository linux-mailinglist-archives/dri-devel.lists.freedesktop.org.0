Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658BE946007
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 17:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B758410E14F;
	Fri,  2 Aug 2024 15:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gObzvQ1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7027910E14F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 15:15:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49AAB524;
 Fri,  2 Aug 2024 17:14:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1722611664;
 bh=rAH5/XPCOhHvXYdgxMqnlYxkFA4/F1u3PyiITqGn7mg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gObzvQ1rTzDEpAbNraoo1A+U5YkfuK52mMwslDn0zc1s2LcgIsW7urHEXafHCLQu2
 WCnWvd4nOnWg5GmFY2WpZmcajRxY+cNizT4W4sVxiC/9XrtRYzFR+F5ZBIh3N51wkQ
 /X0GXExz6RMOA0zmY6zl9JZ+MHjFKC32cuxfidHg=
Date: Fri, 2 Aug 2024 18:14:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] gpu: drm: use for_each_endpoint_of_node()
Message-ID: <20240802151452.GJ18732@pendragon.ideasonboard.com>
References: <87jzh3lnts.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87jzh3lnts.wl-kuninori.morimoto.gx@renesas.com>
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

Tomi, could you please push this through drm-misc ?

On Tue, Jul 30, 2024 at 12:34:40AM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/base.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
> index 050ca7eafac58..5f8002f6bb7a5 100644
> --- a/drivers/gpu/drm/omapdrm/dss/base.c
> +++ b/drivers/gpu/drm/omapdrm/dss/base.c
> @@ -242,8 +242,7 @@ static void omapdss_walk_device(struct device *dev, struct device_node *node,
>  
>  	of_node_put(n);
>  
> -	n = NULL;
> -	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
> +	for_each_endpoint_of_node(node, n) {
>  		struct device_node *pn = of_graph_get_remote_port_parent(n);
>  
>  		if (!pn)

-- 
Regards,

Laurent Pinchart
