Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC964AA245
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 22:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB7910E77C;
	Fri,  4 Feb 2022 21:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717A310E7A0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 21:26:52 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 4eb75eee-8601-11ec-b20b-0050568c148b;
 Fri, 04 Feb 2022 21:27:51 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 92C35194B45;
 Fri,  4 Feb 2022 22:26:50 +0100 (CET)
Date: Fri, 4 Feb 2022 22:26:48 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Subject: Re: [PATCH] drm/panel: simple: Assign data from panel_dpi_probe()
 correctly
Message-ID: <Yf2aGFBHuWr6tyXy@ravnborg.org>
References: <20220201110153.3479-1-cniedermaier@dh-electronics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201110153.3479-1-cniedermaier@dh-electronics.com>
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 01, 2022 at 12:01:53PM +0100, Christoph Niedermaier wrote:
> In the function panel_simple_probe() the pointer panel->desc is
> assigned to the passed pointer desc. If function panel_dpi_probe()
> is called panel->desc will be updated, but further on only desc
> will be evaluated. So update the desc pointer to be able to use
> the data from the function panel_dpi_probe().
> 
> Fixes: 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support")
> 
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> To: dri-devel@lists.freedesktop.org

Thanks for fixing this
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9e46db5e359c..3c08f9827acf 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -588,6 +588,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  		err = panel_dpi_probe(dev, panel);
>  		if (err)
>  			goto free_ddc;
> +		desc = panel->desc;
>  	} else {
>  		if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
>  			panel_simple_parse_panel_timing_node(dev, panel, &dt);
> -- 
> 2.11.0
