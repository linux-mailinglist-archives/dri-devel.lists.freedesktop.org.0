Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFEB1F8903
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jun 2020 15:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD6D89E41;
	Sun, 14 Jun 2020 13:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF1289E41
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 13:47:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 580AFF9;
 Sun, 14 Jun 2020 15:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592142437;
 bh=78M8/Iqg3S3zq/AYzhpfmb4A0g++NPy6J82ruz/ctlk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AC10VTLShWRiPx1ZaBkblj33hHeMqBK2vUYAS/uOxQW9wkYL/5Dv7/ssN/BqJQu7c
 6zK9jfCUqAHe3ByXr31lHTmFQPcf2SbvwrLn08Hc2fetelZJrZ8UsLIJ3W3/eozyqo
 dEQ/mOKPq7ZIXAgBOZs33tKtudg/Pi0sWHhKSavo=
Date: Sun, 14 Jun 2020 16:46:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Aditya Pakki <pakki001@umn.edu>
Subject: Re: [PATCH] drm/bridge: fix reference count leaks due to
 pm_runtime_get_sync()
Message-ID: <20200614134655.GA5960@pendragon.ideasonboard.com>
References: <20200614024005.125578-1-pakki001@umn.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200614024005.125578-1-pakki001@umn.edu>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, wu000273@umn.edu,
 "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Aditya,

(CC'ing Rafael)

Thank you for the patch.

On Sat, Jun 13, 2020 at 09:40:05PM -0500, Aditya Pakki wrote:
> On calling pm_runtime_get_sync() the reference count of the device
> is incremented. In case of failure, decrement the
> reference count before returning the error.
> 
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>

I've seen lots of similar patches recently. Instead of mass-patching the
drivers this way, shouldn't pm_runtime_get_sync() (and similar
functions) decrease the refcount on their failure path ? That would
require patching drivers that already handle this issue, but I believe
that would cause less churn, and more importantly, avoid the issue once
and for good for new code.

> ---
>  drivers/gpu/drm/bridge/cdns-dsi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
> index 69c3892caee5..583cb8547106 100644
> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> @@ -788,8 +788,10 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
>  	u32 tmp, reg_wakeup, div;
>  	int nlanes;
>  
> -	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
> +	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0)) {
> +		pm_runtime_put(dsi->base.dev);
>  		return;
> +	}
>  
>  	mode = &bridge->encoder->crtc->state->adjusted_mode;
>  	nlanes = output->dev->lanes;
> @@ -1028,8 +1030,10 @@ static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
>  	int ret, i, tx_len, rx_len;
>  
>  	ret = pm_runtime_get_sync(host->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put(host->dev);
>  		return ret;
> +	}
>  
>  	cdns_dsi_init_link(dsi);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
