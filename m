Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF4120C6EF
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 10:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856236E1F2;
	Sun, 28 Jun 2020 08:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A56A6E1F2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 08:15:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4B5D4FB;
 Sun, 28 Jun 2020 10:15:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593332122;
 bh=sh0RggDsKmrfTB0YKVOydS4uXtS2gKdlcDk2gSToPlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=srFzktyqSN465QKXohi4o0TJpW3NM5J6Pos52Rw0NlWRBqeyVzG80OMlR7Qa3LYJj
 RZuYtGgD3Pw2ThHt4/S17qEUF6xmFvKGQr6aK0hFwhQ3mQeGoCnzACKkZX0dApLuhy
 zbP6IVlaERHsXojBn23bGihSJOFqm0r0svluCpm0=
Date: Sun, 28 Jun 2020 11:15:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 1/2] drm/bridge: dw-hdmi: Don't cleanup i2c adapter and
 ddc ptr in __dw_hdmi_probe() bailout path
Message-ID: <20200628081519.GE6954@pendragon.ideasonboard.com>
References: <1592298292-17634-1-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592298292-17634-1-git-send-email-victor.liu@nxp.com>
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
Cc: joabreu@synopsys.com, jernej.skrabec@siol.net, darekm@google.com,
 jonas@kwiboo.se, airlied@linux.ie, narmstrong@baylibre.com,
 architt@codeaurora.org, dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 boris.brezillon@collabora.com, linux-imx@nxp.com, cychiang@chromium.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

Thank you for the patch.

On Tue, Jun 16, 2020 at 05:04:51PM +0800, Liu Ying wrote:
> It's unnecessary to cleanup the i2c adapter and the ddc pointer in
> the bailout path of  __dw_hdmi_probe(), since the adapter is not
> added and the ddc pointer is not set.

Indeed. The code doesn't hurt, but is unnecessary.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Fixes: a23d6265f033 (drm: bridge: dw-hdmi: Extract PHY interrupt setup to a function)
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> Cc: Dariusz Marcinkiewicz <darekm@google.com>
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: Jose Abreu <joabreu@synopsys.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 30681398c..da84a91 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3358,11 +3358,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  	return hdmi;
>  
>  err_iahb:
> -	if (hdmi->i2c) {
> -		i2c_del_adapter(&hdmi->i2c->adap);
> -		hdmi->ddc = NULL;
> -	}
> -
>  	clk_disable_unprepare(hdmi->iahb_clk);
>  	if (hdmi->cec_clk)
>  		clk_disable_unprepare(hdmi->cec_clk);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
