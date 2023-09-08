Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCE07983EA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 10:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2248E10E072;
	Fri,  8 Sep 2023 08:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30E310E072
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 08:20:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qeWjR-00053g-8L; Fri, 08 Sep 2023 10:20:49 +0200
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mtr@pengutronix.de>)
 id 1qeWjN-004q5L-09; Fri, 08 Sep 2023 10:20:45 +0200
Received: from mtr by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qeWjM-003FNe-MO; Fri, 08 Sep 2023 10:20:44 +0200
Date: Fri, 8 Sep 2023 10:20:44 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Maxim Schwalm <maxim.schwalm@gmail.com>
Subject: Re: [PATCH 5/5] drm/bridge: samsung-dsim: calculate porches in Hz
Message-ID: <20230908082044.GA767994@pengutronix.de>
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-5-b39716db6b7a@pengutronix.de>
 <53ee3d14-05f4-981f-26d2-ef9ef6b3a61b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <53ee3d14-05f4-981f-26d2-ef9ef6b3a61b@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, kernel@pengutronix.de,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 04 Sep 2023 16:28:37 +0200, Maxim Schwalm wrote:
> On 28.08.23 17:59, Michael Tretter wrote:
> > Calculating the byte_clk in kHz is imprecise for a hs_clock of 55687500
> > Hz, which may be used with a pixel clock of 74.25 MHz with mode
> > 1920x1080-30.
> > 
> > Fix the calculation by using HZ instead of kHZ.
> > 
> > This requires to change the type to u64 to prevent overflows of the
> > integer type.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > index 459be953be55..eb7aca2b9ab7 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -973,10 +973,12 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
> >  	u32 reg;
> >  
> >  	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > -		int byte_clk_khz = dsi->hs_clock / 1000 / 8;
> > -		int hfp = DIV_ROUND_UP((m->hsync_start - m->hdisplay) * byte_clk_khz, m->clock);
> > -		int hbp = DIV_ROUND_UP((m->htotal - m->hsync_end) * byte_clk_khz, m->clock);
> > -		int hsa = DIV_ROUND_UP((m->hsync_end - m->hsync_start) * byte_clk_khz, m->clock);
> > +		u64 byte_clk = dsi->hs_clock / 8;
> > +		u64 pix_clk = m->clock * 1000;
> > +
> > +		int hfp = DIV64_U64_ROUND_UP((m->hsync_start - m->hdisplay) * byte_clk, pix_clk);
> > +		int hbp = DIV64_U64_ROUND_UP((m->htotal - m->hsync_end) * byte_clk, pix_clk);
> > +		int hsa = DIV64_U64_ROUND_UP((m->hsync_end - m->hsync_start) * byte_clk, pix_clk);
> 
> Wouldn't it make sense to use the videomode structure here?

That would introduce a dependency on VIDEOMODE_HELPERS to avoid four explicit
calculations of the pixel clock in Hz and the porches in pixels. I don't think
that's really worth it.

Michael

> 
> >  
> >  		/* remove packet overhead when possible */
> >  		hfp = max(hfp - 6, 0);
> > 
> 
> Best regards,
> Maxim
> 
