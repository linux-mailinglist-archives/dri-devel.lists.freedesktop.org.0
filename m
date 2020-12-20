Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 698E72DF660
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 19:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FBE6E081;
	Sun, 20 Dec 2020 18:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C862C6E081
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 18:05:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4821231A;
 Sun, 20 Dec 2020 19:05:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608487523;
 bh=/uCR53dI7SjM/vnAu1lmZpL/cHj+oSniBKFwC/k9qDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ofpM1sqZ6h/3Bd1eikMmQ5s7IytPGwZVTd+i9mNcX9hnMTpmgqZUq7lmKNJrNhtlN
 Di7fiqwyPxBX5gibcm/s/rZXp+ZqahhF0QPvId1+pIo87jUGYQRBoNuN0NUida6ecz
 6rXPHBvq6LpTLW8iQXox9gSMwyBalc8AGM1VPS+s=
Date: Sun, 20 Dec 2020 20:05:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xu Wang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] drm: bridge: dw-hdmi: Remove redundant null check before
 clk_disable_unprepare
Message-ID: <X9+SWwALw+qcEEps@pendragon.ideasonboard.com>
References: <20201127092332.50879-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127092332.50879-1-vulab@iscas.ac.cn>
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 boris.brezillon@collabora.com, victor.liu@nxp.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xu Wang,

Thank you for the patch.

On Fri, Nov 27, 2020 at 09:23:32AM +0000, Xu Wang wrote:
> Because clk_disable_unprepare() already checked NULL clock parameter,
> so the additional check is unnecessary, just remove them.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 0c79a9ba48bb..dda4fa9a1a08 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3440,8 +3440,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  
>  err_iahb:
>  	clk_disable_unprepare(hdmi->iahb_clk);
> -	if (hdmi->cec_clk)
> -		clk_disable_unprepare(hdmi->cec_clk);
> +	clk_disable_unprepare(hdmi->cec_clk);
>  err_isfr:
>  	clk_disable_unprepare(hdmi->isfr_clk);
>  err_res:
> @@ -3465,8 +3464,7 @@ void dw_hdmi_remove(struct dw_hdmi *hdmi)
>  
>  	clk_disable_unprepare(hdmi->iahb_clk);
>  	clk_disable_unprepare(hdmi->isfr_clk);
> -	if (hdmi->cec_clk)
> -		clk_disable_unprepare(hdmi->cec_clk);
> +	clk_disable_unprepare(hdmi->cec_clk);
>  
>  	if (hdmi->i2c)
>  		i2c_del_adapter(&hdmi->i2c->adap);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
