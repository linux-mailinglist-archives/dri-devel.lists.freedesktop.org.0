Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5894C43BD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 12:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0D710E959;
	Fri, 25 Feb 2022 11:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AD210E957
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 11:37:47 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nNYuv-0007w3-I2; Fri, 25 Feb 2022 12:37:45 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nNYur-0003KO-LI; Fri, 25 Feb 2022 12:37:41 +0100
Date: Fri, 25 Feb 2022 12:37:41 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 10/24] drm/rockchip: dw_hdmi: Add support for hclk
Message-ID: <20220225113741.GD19585@pengutronix.de>
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-11-s.hauer@pengutronix.de>
 <47ddcaf3-4544-2b7c-a2f6-1f6346907f33@gmail.com>
 <20220225104924.GC19585@pengutronix.de>
 <78207d97-b5a1-9792-8ec9-11fcf2e00370@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78207d97-b5a1-9792-8ec9-11fcf2e00370@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:34:14 up 76 days, 20:19, 89 users,  load average: 0.27, 0.21, 0.17
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 25, 2022 at 02:10:55PM +0300, Dmitry Osipenko wrote:
> 25.02.2022 13:49, Sascha Hauer пишет:
> > On Fri, Feb 25, 2022 at 01:26:14PM +0300, Dmitry Osipenko wrote:
> >> 25.02.2022 10:51, Sascha Hauer пишет:
> >>> The rk3568 HDMI has an additional clock that needs to be enabled for the
> >>> HDMI controller to work. The purpose of that clock is not clear. It is
> >>> named "hclk" in the downstream driver, so use the same name.
> >>>
> >>> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> >>> ---
> >>>
> >>> Notes:
> >>>     Changes since v5:
> >>>     - Use devm_clk_get_optional rather than devm_clk_get
> >>>
> >>>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++++++++++++++++
> >>>  1 file changed, 16 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> >>> index fe4f9556239ac..c6c00e8779ab5 100644
> >>> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> >>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> >>> @@ -76,6 +76,7 @@ struct rockchip_hdmi {
> >>>  	const struct rockchip_hdmi_chip_data *chip_data;
> >>>  	struct clk *ref_clk;
> >>>  	struct clk *grf_clk;
> >>> +	struct clk *hclk_clk;
> >>>  	struct dw_hdmi *hdmi;
> >>>  	struct regulator *avdd_0v9;
> >>>  	struct regulator *avdd_1v8;
> >>> @@ -229,6 +230,14 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
> >>>  		return PTR_ERR(hdmi->grf_clk);
> >>>  	}
> >>>  
> >>> +	hdmi->hclk_clk = devm_clk_get_optional(hdmi->dev, "hclk");
> >>> +	if (PTR_ERR(hdmi->hclk_clk) == -EPROBE_DEFER) {
> >>
> >> Have you tried to investigate the hclk? I'm still thinking that's not
> >> only HDMI that needs this clock and then the hardware description
> >> doesn't look correct.
> > 
> > I am still not sure what you mean. Yes, it's not only the HDMI that
> > needs this clock. The VOP2 needs it as well and the driver handles that.
> 
> I'm curious whether DSI/DP also need that clock to be enabled. If they
> do, then you aren't modeling h/w properly AFAICS.

Indeed I can confirm that DSI and DP need that clock enabled for
register access as well. Do you think these devices should be under an
additional bus layer in the device tree which drives the clock? Or
should HCLK_VOP be enabled as part of the RK3568_PD_VO power domain?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
