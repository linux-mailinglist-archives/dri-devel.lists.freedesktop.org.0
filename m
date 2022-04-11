Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB384FBBEC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 14:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A6C10E157;
	Mon, 11 Apr 2022 12:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B9310E116
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 12:20:37 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ndt1s-0004DP-Bg; Mon, 11 Apr 2022 14:20:24 +0200
Message-ID: <f2fc68f6c2034546009c96658da0e63f191978d1.camel@pengutronix.de>
Subject: Re: [PATCH v0 07/10] phy: freescale: add Samsung HDMI PHY
From: Lucas Stach <l.stach@pengutronix.de>
To: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 11 Apr 2022 14:20:22 +0200
In-Reply-To: <20220411115922.luv2gyutdecvsxa3@houat>
References: <20220406160123.1272911-1-l.stach@pengutronix.de>
 <20220406160123.1272911-8-l.stach@pengutronix.de>
 <20220411115922.luv2gyutdecvsxa3@houat>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, patchwork-lst@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Am Montag, dem 11.04.2022 um 13:59 +0200 schrieb Maxime Ripard:
> Hi Lucas,
> 
> On Wed, Apr 06, 2022 at 06:01:20PM +0200, Lucas Stach wrote:
> > +static unsigned long phy_clk_recalc_rate(struct clk_hw *hw,
> > +					 unsigned long parent_rate)
> > +{
> > +	struct fsl_samsung_hdmi_phy *phy = to_fsl_samsung_hdmi_phy(hw);
> > +
> > +	if (!phy->cur_cfg)
> > +		return 0;
> > +
> > +	return phy->cur_cfg->clk_rate;
> > +}
> 
> This means that the clock will return 0 at initialization, which will
> throw the rate accounting in the CCF off.
> 
> Returning 0 here isn't valid. Surely that phy has a default
> configuration at boot that you could use to initialize a rate?
> 
> See https://lore.kernel.org/linux-clk/20220408091037.2041955-1-maxime@cerno.tech/

Thanks for the hint. I don't know the full history of this and surely I
can use the register reset defaults to initialize the clock rate, but
it still seems odd. A powered down clock generator, like the PLL in
this PHY, is not actually putting out a clock at any rate, so 0 for the
rate seems natural, so it's kind of a bad pitfall if the CCF can't deal
with that.

Regards,
Lucas

