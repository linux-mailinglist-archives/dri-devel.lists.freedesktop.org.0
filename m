Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686AD68D73C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 13:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A82610E4F7;
	Tue,  7 Feb 2023 12:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05CF10E4F7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 12:51:12 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pPNRG-0004jP-SF; Tue, 07 Feb 2023 13:51:10 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pPNRD-000822-79; Tue, 07 Feb 2023 13:51:07 +0100
Date: Tue, 7 Feb 2023 13:51:07 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v4 4/4] drm/rockchip: dw_hdmi: discard modes with
 unachievable pixelclocks
Message-ID: <20230207125107.GG10447@pengutronix.de>
References: <20230207084452.1069656-1-s.hauer@pengutronix.de>
 <20230207084452.1069656-5-s.hauer@pengutronix.de>
 <0bec1f06-9fad-60ad-19eb-3d54135031f7@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bec1f06-9fad-60ad-19eb-3d54135031f7@kwiboo.se>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Dan Johansen <strit@manjaro.org>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 07, 2023 at 11:01:26AM +0000, Jonas Karlman wrote:
> Hi Sascha,
> 
> On 2023-02-07 09:44, Sascha Hauer wrote:
> > The Rockchip PLL drivers are currently table based and support only
> > the most common pixelclocks. Discard all modes we cannot achieve
> > at all. Normally the desired pixelclocks have an exact match in the
> > PLL driver, nevertheless allow for a 0.1% error just in case.
> > 
> > Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> > Tested-by: Michael Riesch <michael.riesch@wolfvision.net>
> > Tested-by: Dan Johansen <strit@manjaro.org>
> > Link: https://lore.kernel.org/r/20230118132213.2911418-4-s.hauer@pengutronix.de
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> > index feba6b9becd6c..725952811752b 100644
> > --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> > @@ -256,10 +256,14 @@ dw_hdmi_rockchip_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
> >  {
> >  	struct rockchip_hdmi *hdmi = data;
> >  	const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
> > -	int pclk = mode->clock * 1000;
> > +	int rpclk, pclk = mode->clock * 1000;
> >  	bool exact_match = hdmi->plat_data->phy_force_vendor;
> >  	int i;
> >  
> > +	rpclk = clk_round_rate(hdmi->ref_clk, pclk);
> > +	if (abs(rpclk - pclk) > pclk / 1000)
> > +		return MODE_NOCLOCK;
> 
> The ref_clk is optional and rk3228/rk3328 dts do not supply a ref or vpll clock.

That's a bit unfortunate as we can't do this check then on these SoCs.

The clock is likely actually there in the system and maybe even in the
clock driver, just not wired up to the HDMI. I don't know which one it
is though, so I am afraid there's not much I can do about it other than
just skipping the check when the clock is not there.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
