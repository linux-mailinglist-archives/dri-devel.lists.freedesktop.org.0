Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC07363338F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 03:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D31910E1BA;
	Tue, 22 Nov 2022 02:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5BB10E1BA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 02:52:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26BB8890;
 Tue, 22 Nov 2022 03:52:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669085552;
 bh=JhpNgNVNgok6E1jULFfPl5D/k6Ab70suuFOFO6RXYNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HNaqosC0y1jvnJVPNO13OG+NY1A3/SJeFFDjkJr8gD0XWDgP2YTDafzxwBO92c2rr
 2Vx5Y5kIHXa3aH9B7vMArs39SJ4ACngliYE74220znHNFqc1scF5zKTuf5T6UnMgvp
 i2OComn2+gAidMWhsipaTBzu25YBtjd3i+UV8Ee8=
Date: Tue, 22 Nov 2022 04:52:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v1 3/8] clk: renesas: r8a779g0: Add display related clocks
Message-ID: <Y3w5YSqCI9GYrWTS@pendragon.ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-4-tomi.valkeinen@ideasonboard.com>
 <166869413781.50677.10862438013473651942@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166869413781.50677.10862438013473651942@Monstersaurus>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 02:08:57PM +0000, Kieran Bingham wrote:
> Quoting Tomi Valkeinen (2022-11-17 12:25:42)
> > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > 
> > Add clocks related to display which are needed to get the DSI output
> > working.
> > 
> > Extracted from Renesas BSP tree.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> >  drivers/clk/renesas/r8a779g0-cpg-mssr.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> > index c6337a408e5e..6937f1aee677 100644
> > --- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> > @@ -145,6 +145,8 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
> >         DEF_FIXED("viobusd2",   R8A779G0_CLK_VIOBUSD2,  CLK_VIO,        2, 1),
> >         DEF_FIXED("vcbus",      R8A779G0_CLK_VCBUS,     CLK_VC,         1, 1),
> >         DEF_FIXED("vcbusd2",    R8A779G0_CLK_VCBUSD2,   CLK_VC,         2, 1),
> > +       DEF_FIXED("dsiref",     R8A779G0_CLK_DSIREF,    CLK_PLL5_DIV4,  48, 1),
> > +       DEF_DIV6P1("dsiext",    R8A779G0_CLK_DSIEXT,    CLK_PLL5_DIV4,  0x884),
> >  
> >         DEF_GEN4_SDH("sd0h",    R8A779G0_CLK_SD0H,      CLK_SDSRC,         0x870),
> >         DEF_GEN4_SD("sd0",      R8A779G0_CLK_SD0,       R8A779G0_CLK_SD0H, 0x870),
> > @@ -161,6 +163,14 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
> >         DEF_MOD("avb0",         211,    R8A779G0_CLK_S0D4_HSC),
> >         DEF_MOD("avb1",         212,    R8A779G0_CLK_S0D4_HSC),
> >         DEF_MOD("avb2",         213,    R8A779G0_CLK_S0D4_HSC),
> > +
> > +       DEF_MOD("dis0",                 411,    R8A779G0_CLK_S0D3),
> 
> dsi0?
> 
> Oh - how curious - it's listed as dis0 in the datasheet.
> Ok - so this is the DU *display* not DSI ;-)
> 
> > +       DEF_MOD("dsitxlink0",           415,    R8A779G0_CLK_DSIREF),
> > +       DEF_MOD("dsitxlink1",           416,    R8A779G0_CLK_DSIREF),
> > +
> > +       DEF_MOD("fcpvd0",               508,    R8A779G0_CLK_S0D3),
> > +       DEF_MOD("fcpvd1",               509,    R8A779G0_CLK_S0D3),
> > +
> 
> checks out. I guess the fcpcs is the CSI related FCP ? Anyway, if it's
> not needed it can be ignored for now.
> 
> 
> >         DEF_MOD("hscif0",       514,    R8A779G0_CLK_SASYNCPERD1),
> >         DEF_MOD("hscif1",       515,    R8A779G0_CLK_SASYNCPERD1),
> >         DEF_MOD("hscif2",       516,    R8A779G0_CLK_SASYNCPERD1),
> > @@ -193,6 +203,10 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
> >         DEF_MOD("tmu3",         716,    R8A779G0_CLK_SASYNCPERD2),
> >         DEF_MOD("tmu4",         717,    R8A779G0_CLK_SASYNCPERD2),
> >         DEF_MOD("tpu0",         718,    R8A779G0_CLK_SASYNCPERD4),
> > +
> > +       DEF_MOD("vspd0",                830,    R8A779G0_CLK_S0D1_VIO),
> > +       DEF_MOD("vspd1",                831,    R8A779G0_CLK_S0D1_VIO),
> > +
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

I can't verify the MSTP clock parents, I assume they come from the BSP,
so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> >         DEF_MOD("wdt1:wdt0",    907,    R8A779G0_CLK_R),
> >         DEF_MOD("cmt0",         910,    R8A779G0_CLK_R),
> >         DEF_MOD("cmt1",         911,    R8A779G0_CLK_R),

-- 
Regards,

Laurent Pinchart
