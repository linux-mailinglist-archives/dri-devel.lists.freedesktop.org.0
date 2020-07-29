Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 800BD232325
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 19:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308916E5AE;
	Wed, 29 Jul 2020 17:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0276E5AE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 17:09:10 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C27EC20045;
 Wed, 29 Jul 2020 19:09:08 +0200 (CEST)
Date: Wed, 29 Jul 2020 19:09:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 2/2] drm/bridge: tc358762: Add basic driver for
 Toshiba TC358762 DSI-to-DPI bridge
Message-ID: <20200729170907.GA1375231@ravnborg.org>
References: <20200729164554.114735-1-marex@denx.de>
 <20200729164554.114735-2-marex@denx.de>
 <20200729165604.GA1372716@ravnborg.org>
 <3f9702f1-062e-a43c-3297-eb5baacaa81c@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f9702f1-062e-a43c-3297-eb5baacaa81c@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=nZwYH4Z7KE73ytJNG8gA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek.

On Wed, Jul 29, 2020 at 07:02:51PM +0200, Marek Vasut wrote:
> On 7/29/20 6:56 PM, Sam Ravnborg wrote:
> [...]
> >> +static int tc358762_probe(struct mipi_dsi_device *dsi)
> >> +{
> >> +	struct device *dev = &dsi->dev;
> >> +	struct tc358762 *ctx;
> >> +	int ret;
> >> +
> >> +	ctx = devm_kzalloc(dev, sizeof(struct tc358762), GFP_KERNEL);
> >> +	if (!ctx)
> >> +		return -ENOMEM;
> >> +
> >> +	mipi_dsi_set_drvdata(dsi, ctx);
> > I cannot see why this is needed. If not used then delete it.
> > With the above addressed:
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > Let me know if I shall apply - but we have to wait until binding is
> > reviewed. And preferably one extra set of eyes on this driver.
> 
> [...]
> 
> >> +static int tc358762_remove(struct mipi_dsi_device *dsi)
> >> +{
> >> +	struct tc358762 *ctx = mipi_dsi_get_drvdata(dsi);
> >> +
> >> +	mipi_dsi_detach(dsi);
> >> +	drm_bridge_remove(&ctx->bridge);
> 
> Because it's used here in the remove callback.

Thanks - missed that.
So consider the point addressed by enlightning me.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
