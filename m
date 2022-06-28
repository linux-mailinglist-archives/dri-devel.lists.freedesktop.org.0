Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F03A55BF2F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 09:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3B311B902;
	Tue, 28 Jun 2022 07:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D0011B904
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 07:41:05 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1o65qE-0002Po-9M; Tue, 28 Jun 2022 09:40:58 +0200
Message-ID: <51d9a90725a00430ad14a3125c3b685896b0c434.camel@pengutronix.de>
Subject: Re: [PATCH] drm: bridge: dw_hdmi: only trigger hotplug event on
 real link state change
From: Lucas Stach <l.stach@pengutronix.de>
To: Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <robert.foss@linaro.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Tue, 28 Jun 2022 09:40:56 +0200
In-Reply-To: <3b1e41f3-3aa0-bf4e-685a-5dc148ac3753@baylibre.com>
References: <20220627124715.408258-1-l.stach@pengutronix.de>
 <3b1e41f3-3aa0-bf4e-685a-5dc148ac3753@baylibre.com>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, dem 28.06.2022 um 09:16 +0200 schrieb Neil Armstrong:
> Hi,
> 
> On 27/06/2022 14:47, Lucas Stach wrote:
> > There are two events that signal a real change of the link state: HPD going
> > high means the sink is newly connected or wants the source to re-read the
> > EDID, RX sense going low is a indication that the link has been disconnected.
> > 
> > Ignore the other two events that also trigger interrupts, but don't need
> > immediate attention: HPD going low does not necessarily mean the link has
> > been lost and should not trigger a immediate read of the status. RX sense
> > going high also does not require a detect cycle, as HPD going high is the
> > right point in time to read the EDID.
> > 
> > Ignoring the negative HPD edge does make the detection much more robust
> > against spurious link status changes due to EMI or marginal signal levels.
> 
> Fair enough, but it means RX Sense must be totally functional with this change.

At least in my testing the condition used in this check of RX sense on
all lanes going low is very reliable. During plugin/-out sometimes the
RX sense status of some of lanes bounces a bit, but all of them going
low is a very reliable indicator.

> 
> > 
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 13 ++++++++-----
> >   1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > index 3e1be9894ed1..24f991b5248d 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -3095,6 +3095,7 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
> >   {
> >   	struct dw_hdmi *hdmi = dev_id;
> >   	u8 intr_stat, phy_int_pol, phy_pol_mask, phy_stat;
> > +	enum drm_connector_status status = connector_status_unknown;
> >   
> >   	intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
> >   	phy_int_pol = hdmi_readb(hdmi, HDMI_PHY_POL0);
> > @@ -3133,13 +3134,15 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
> >   			cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> >   			mutex_unlock(&hdmi->cec_notifier_mutex);
> >   		}
> > -	}
> >   
> > -	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
> > -		enum drm_connector_status status = phy_int_pol & HDMI_PHY_HPD
> > -						 ? connector_status_connected
> > -						 : connector_status_disconnected;
> > +		if (phy_stat & HDMI_PHY_HPD)
> > +			status = connector_status_connected;
> > +
> > +		if (!( phy_stat & HDMI_PHY_RX_SENSE))
> > +			status = connector_status_disconnected;
> > +	}
> >   
> > +	if (status != connector_status_unknown) {
> >   		dev_dbg(hdmi->dev, "EVENT=%s\n",
> >   			status == connector_status_connected ?
> >   			"plugin" : "plugout");
> 
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> It would be nice to have this tested on another platform using the Synopsys PHY (unlike Amlogic platforms)
> like Renesas, Rockchip, Allwinner or Ingenic SoCs.

For reference, I tested this change on i.MX6 (Synopsys PHY) and i.MX8MP
(Samsung PHY).

Regards,
Lucas

