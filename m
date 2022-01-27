Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A46649E037
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA16910EEAB;
	Thu, 27 Jan 2022 11:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87A210EEAB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 11:06:04 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nD2bL-0002DW-0e; Thu, 27 Jan 2022 12:06:03 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nD2bK-0006qj-BK; Thu, 27 Jan 2022 12:06:02 +0100
Date: Thu, 27 Jan 2022 12:06:02 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 09/27] drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
Message-ID: <20220127110602.GL23490@pengutronix.de>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-10-s.hauer@pengutronix.de>
 <CAD=FV=VCWW4c3iqfzezU5=KKVFNP+EhPGTBZ7uZdQ=bSCJHQVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=VCWW4c3iqfzezU5=KKVFNP+EhPGTBZ7uZdQ=bSCJHQVA@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:01:27 up 47 days, 19:47, 83 users,  load average: 0.69, 0.35, 0.27
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <kernel@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Yakir Yang <ykk@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 07:42:48AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jan 26, 2022 at 6:58 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > Jitter was improved by lowering the MPLL bandwidth to account for high
> > frequency noise in the rk3288 PLL.  In each case MPLL bandwidth was
> > lowered only enough to get us a comfortable margin.  We believe that
> > lowering the bandwidth like this is safe given sufficient testing.
> >
> > Changes since v3:
> > - new patch
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> > (am from https://patchwork.kernel.org/patch/9223301/)
> 
> Probably remove the "am from" line? It's not standard in upstream and
> that link doesn't seem to go anywhere anymore...
> 
> 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++--------------
> >  1 file changed, 2 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> > index c44eb4d2e2d5..77f82a4fd027 100644
> > --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> > @@ -176,20 +176,8 @@ static const struct dw_hdmi_mpll_config rockchip_mpll_cfg[] = {
> >  static const struct dw_hdmi_curr_ctrl rockchip_cur_ctr[] = {
> >         /*      pixelclk    bpp8    bpp10   bpp12 */
> >         {
> > -               40000000,  { 0x0018, 0x0018, 0x0018 },
> > -       }, {
> > -               65000000,  { 0x0028, 0x0028, 0x0028 },
> > -       }, {
> > -               66000000,  { 0x0038, 0x0038, 0x0038 },
> > -       }, {
> > -               74250000,  { 0x0028, 0x0038, 0x0038 },
> > -       }, {
> > -               83500000,  { 0x0028, 0x0038, 0x0038 },
> > -       }, {
> > -               146250000, { 0x0038, 0x0038, 0x0038 },
> > -       }, {
> > -               148500000, { 0x0000, 0x0038, 0x0038 },
> > -       }, {
> > +               600000000, { 0x0000, 0x0000, 0x0000 },
> > +       },  {
> 
> This is what we did for rk3288. I can't personally vouch for the
> effects on other SoCs.

Fair enough. Rockchip has this patch in their downstream Kernel, so I am
confident it works on SoCs newer as the rk3288 as well. I don't know how
much they care about the older SoCs, but it seems there is only the
rk3228 that is older than the rk3288 that is supported by this driver.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
