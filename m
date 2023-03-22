Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C246C4D31
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E51810E139;
	Wed, 22 Mar 2023 14:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9323C10E139
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:12:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F367118E;
 Wed, 22 Mar 2023 15:12:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1679494368;
 bh=88STxbmTABTxETL9/vEcf/srguNOQ0Th+PpdA0xD54k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sZVpqef+IbPAIAKXsdkPd+cVkRgxGqQOONeMCCUkwdqDkGDAneQQvteaNh5QA5Lfc
 jemAJwxcR6m/AcrbjS03z+HG35s0Yj9v7tLqTt00cIFteE/E3NvanIyBIfcYVDS6ni
 5diBzhbCRYPfYI5RDikWHOga0mY5JWTdrqlkCFno=
Date: Wed, 22 Mar 2023 16:12:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v1] drm/bridge: lt8912b: return EPROBE_DEFER if bridge is
 not found
Message-ID: <20230322141255.GN20234@pendragon.ideasonboard.com>
References: <20230322140309.95936-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230322140309.95936-1-francesco@dolcini.it>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Matheus Castello <matheus.castello@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Francesco,

Thank you for the patch.

On Wed, Mar 22, 2023 at 03:03:09PM +0100, Francesco Dolcini wrote:
> From: Matheus Castello <matheus.castello@toradex.com>
> 
> Returns EPROBE_DEFER when of_drm_find_bridge() fails, this is consistent
> with what all the other DRM bridge drivers are doing and this is
> required since the bridge might not be there when the driver is probed
> and this should not be a fatal failure.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
> Signed-off-by: Matheus Castello <matheus.castello@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> index 2019a8167d69..fec02e47cfdb 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -676,8 +676,8 @@ static int lt8912_parse_dt(struct lt8912 *lt)
>  
>  	lt->hdmi_port = of_drm_find_bridge(port_node);
>  	if (!lt->hdmi_port) {
> -		dev_err(lt->dev, "%s: Failed to get hdmi port\n", __func__);
> -		ret = -ENODEV;
> +		dev_dbg(lt->dev, "%s: Failed to get hdmi port\n", __func__);

Please use dev_err_probe(). Apart from that, the patch looks fine to me.

> +		ret = -EPROBE_DEFER;
>  		goto err_free_host_node;
>  	}
>  

-- 
Regards,

Laurent Pinchart
