Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B785D353A70
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 02:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24306E0D0;
	Mon,  5 Apr 2021 00:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1492B6E0D0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Apr 2021 00:52:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD8D6D40;
 Mon,  5 Apr 2021 02:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617583966;
 bh=wbI2nBwmAeFOJY2HsKm+NsmwYZnvettHnz5e/Tm2TCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=maWZ3fHqT/x7iF7+ZMY6EKMSwFmCRcS2oDiUwbLzirxKl3wc+MG8YcJVP5r9oR1bX
 rEB7iZi3OqwC9BRs24dg5bTGed8M2YHMtNqejKcgXWyYXHuZzHHDdMOvM4+yaoaqr8
 LNimm2tHRrsFbYwWtTbzBq8H/172O2KiHvUVdVWY=
Date: Mon, 5 Apr 2021 03:52:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 04/12] drm/bridge: ti-sn65dsi86: Reorder remove()
Message-ID: <YGpfMa2HW2vLDfh5@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.4.Ifcf1deaa372eba7eeb4f8eb516c5d15b77a657a9@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.4.Ifcf1deaa372eba7eeb4f8eb516c5d15b77a657a9@changeid>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:38PM -0700, Douglas Anderson wrote:
> Let's make the remove() function strictly the reverse of the probe()
> function so it's easier to reason about.
> 
> This patch was created by code inspection and should move us closer to
> a proper remove.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Changes in v3:
> - Removed "NOTES" from commit message.
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 76f43af6735d..c006678c9921 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1315,20 +1315,21 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
>  	if (!pdata)
>  		return -EINVAL;
>  
> -	kfree(pdata->edid);
> -	ti_sn_debugfs_remove(pdata);
> -
> -	of_node_put(pdata->host_node);
> -
> -	pm_runtime_disable(pdata->dev);
> -
>  	if (pdata->dsi) {
>  		mipi_dsi_detach(pdata->dsi);
>  		mipi_dsi_device_unregister(pdata->dsi);
>  	}
>  
> +	kfree(pdata->edid);
> +
> +	ti_sn_debugfs_remove(pdata);
> +
>  	drm_bridge_remove(&pdata->bridge);
>  
> +	pm_runtime_disable(pdata->dev);
> +
> +	of_node_put(pdata->host_node);
> +
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
