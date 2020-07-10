Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D8F21BC43
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 19:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62EA6ECB7;
	Fri, 10 Jul 2020 17:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E136ECB7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 17:31:28 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7C07220021;
 Fri, 10 Jul 2020 19:31:24 +0200 (CEST)
Date: Fri, 10 Jul 2020 19:31:23 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH RESEND v2 1/2] drm/bridge: dw-hdmi: Don't cleanup i2c
 adapter and ddc ptr in __dw_hdmi_probe() bailout path
Message-ID: <20200710173123.GB17565@ravnborg.org>
References: <1594260156-8316-1-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594260156-8316-1-git-send-email-victor.liu@nxp.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=hD80L64hAAAA:8 a=IpJZQVW2AAAA:8 a=P1BnusSwAAAA:8
 a=RwHePtW7AAAA:8 a=QX4gbG5DAAAA:8 a=cm27Pg_UAAAA:8 a=1XWaLZrsAAAA:8
 a=LpQP-O61AAAA:8 a=jIQo8A4GAAAA:8 a=e5mUnYsNAAAA:8 a=8AirrxEcAAAA:8
 a=Jr1cD_MkMhk6Ffk6ROkA:9 a=CjuIK1q_8ugA:10 a=IawgGOuG5U0WyFbmm1f5:22
 a=D0XLA9XvdZm18NrgonBM:22 a=FqraQwd7dyEg5dwJgZJs:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=xmb-EsYY8bH0VWELuYED:22
 a=pioyyrs4ZptJ924tMmac:22 a=Lf5xNeLK5dgiOs8hzIjU:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=ST-jHhOKWsTCqRlWije3:22
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
 Archit Taneja <architt@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Jose Abreu <joabreu@synopsys.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Dariusz Marcinkiewicz <darekm@google.com>,
 Jerome Brunet <jbrunet@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 09, 2020 at 10:02:35AM +0800, Liu Ying wrote:
> It's unnecessary to cleanup the i2c adapter and the ddc pointer in
> the bailout path of  __dw_hdmi_probe(), since the adapter is not
> added and the ddc pointer is not set.
> 
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
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, applied to drm-misc-next.

	Sam

> ---
> v1->v2:
> * Add Laurent's R-b tag.
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 6148a02..137b6eb 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3441,11 +3441,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
