Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E747828B1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 14:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CFB10E169;
	Mon, 21 Aug 2023 12:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5022510E169
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 12:12:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BED626D5;
 Mon, 21 Aug 2023 14:11:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692619891;
 bh=wQ56MmYc4s3k/U5yMVZgSxazW0HtmwTXQNoLH5iCaCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KEeNqNqE7S43KBNGEFF7cgotD5k5tevDKZwmWDhM0B9ByEpD/2Ep8IBZpl2AXInYA
 pXv64BZwx4vVu7N+pyBFZsQMfbk2+o9AxOYsr9UcfJPZnWSMgQIA++jNd8jZaiPnIY
 l4cM8JHTlEjVmMUAN/aRCSb9q+eENfiOIKG05YL8=
Date: Mon, 21 Aug 2023 15:12:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] drm: bridge: it66121: Extend match support for OF tables
Message-ID: <20230821121254.GC10135@pendragon.ideasonboard.com>
References: <20230813080520.65813-1-biju.das.jz@bp.renesas.com>
 <20230813172715.GA19398@pendragon.ideasonboard.com>
 <OS0PR01MB592291F889F1BE13981169D78617A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592291F889F1BE13981169D78617A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Mon, Aug 14, 2023 at 09:06:46AM +0000, Biju Das wrote:
> Hi Laurent Pinchart,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH] drm: bridge: it66121: Extend match support for OF
> > tables
> > 
> > Hi Biju,
> > 
> > Thank you for the patch.
> > 
> > On Sun, Aug 13, 2023 at 09:05:20AM +0100, Biju Das wrote:
> > > The driver has OF match table, still it uses ID lookup table for
> > > retrieving match data. Replace ID look up with i2c_get_match_data()
> > > for retrieving OF/ACPI/I2C match data by adding similar match data for
> > > OF table.
> > 
> > Could you please explain in the commit message *why* this is desired ?
> 
> Currently the driver is working on the assumption that a
> I2C device registered via OF will always match a legacy
> I2C device ID. The correct approach is to have an
> OF device ID table using of_device_match_data()/device_match_data()/
> I2c_get_match_data() if the devices are registered via OF.
> 
> Basically, it is fixing
> 
> Fixes: 9a9f4a01bdae ("drm: bridge: it66121: Move VID/PID to new it66121_chip_info structure")
> 
> But i2c_get_match_data() is recently introduced.

Thanks for the explanation. Could you record this in the commit message
(if not done already) ?

It would be really nice if we could drop the i2c_device_id...

> Maybe one patch with fixes tag using of_device_get_match_data and
> ID lookup for retrieving match data from OF/I2C tables
> 
> and another patch to simplify using i2c_get_match_data() by replacing
> of_device_get_match_data and ID lookup.

I'm fine with a single patch.

> > > While at it, drop unused local varibale id from probe().
> > 
> > I'd drop this sentence, that's not a "while at it" change but an integral
> > part of this patch.
> 
> Agreed.
> 
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  This patch is only compile tested.
> > > ---
> > >  drivers/gpu/drm/bridge/ite-it66121.c | 17 ++++++++---------
> > >  1 file changed, 8 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ite-it66121.c
> > > b/drivers/gpu/drm/bridge/ite-it66121.c
> > > index 466641c77fe9..a80246ef4ffe 100644
> > > --- a/drivers/gpu/drm/bridge/ite-it66121.c
> > > +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> > > @@ -1501,7 +1501,6 @@ static const char * const it66121_supplies[] = {
> > >
> > >  static int it66121_probe(struct i2c_client *client)  {
> > > -	const struct i2c_device_id *id = i2c_client_get_device_id(client);
> > >  	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
> > >  	struct device_node *ep;
> > >  	int ret;
> > > @@ -1523,7 +1522,7 @@ static int it66121_probe(struct i2c_client
> > > *client)
> > >
> > >  	ctx->dev = dev;
> > >  	ctx->client = client;
> > > -	ctx->info = (const struct it66121_chip_info *) id->driver_data;
> > > +	ctx->info = i2c_get_match_data(client);
> > >
> > >  	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
> > >  	of_node_put(ep);
> > > @@ -1609,13 +1608,6 @@ static void it66121_remove(struct i2c_client *client)
> > >  	mutex_destroy(&ctx->lock);
> > >  }
> > >
> > > -static const struct of_device_id it66121_dt_match[] = {
> > > -	{ .compatible = "ite,it66121" },
> > > -	{ .compatible = "ite,it6610" },
> > > -	{ }
> > > -};
> > > -MODULE_DEVICE_TABLE(of, it66121_dt_match);
> > > -
> > >  static const struct it66121_chip_info it66121_chip_info = {
> > >  	.id = ID_IT66121,
> > >  	.vid = 0x4954,
> > > @@ -1628,6 +1620,13 @@ static const struct it66121_chip_info it6610_chip_info = {
> > >  	.pid = 0x0611,
> > >  };
> > >
> > > +static const struct of_device_id it66121_dt_match[] = {
> > > +	{ .compatible = "ite,it66121", &it66121_chip_info },
> > > +	{ .compatible = "ite,it6610", &it6610_chip_info },
> > > +	{ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, it66121_dt_match);
> > > +
> > >  static const struct i2c_device_id it66121_id[] = {
> > >  	{ "it66121", (kernel_ulong_t) &it66121_chip_info },
> > >  	{ "it6610", (kernel_ulong_t) &it6610_chip_info },

-- 
Regards,

Laurent Pinchart
