Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1CF4F7A5A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B8910E4AD;
	Thu,  7 Apr 2022 08:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED93B10E4AD
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:51:07 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ncNqz-0004iY-2X; Thu, 07 Apr 2022 10:50:57 +0200
Message-ID: <245623b25bfc6de8ef76bcbbbce5a2d8fbad7b74.camel@pengutronix.de>
Subject: Re: [PATCH v0 01/10] drm/bridge: dw-hdmi: add low-active PHY reset
From: Lucas Stach <l.stach@pengutronix.de>
To: Neil Armstrong <narmstrong@baylibre.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, NXP Linux
 Team <linux-imx@nxp.com>
Date: Thu, 07 Apr 2022 10:50:55 +0200
In-Reply-To: <b3abd199-0acb-a2d3-bd53-aa26182aa0c9@baylibre.com>
References: <20220406160123.1272911-1-l.stach@pengutronix.de>
 <20220406160123.1272911-2-l.stach@pengutronix.de>
 <b3abd199-0acb-a2d3-bd53-aa26182aa0c9@baylibre.com>
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
 Robert Foss <robert.foss@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-phy@lists.infradead.org,
 patchwork-lst@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

Am Donnerstag, dem 07.04.2022 um 10:30 +0200 schrieb Neil Armstrong:
> Hi Lucas,
> 
> On 06/04/2022 18:01, Lucas Stach wrote:
> > Allow vendor PHY implementations to reset PHYs with different polarity
> > than the current Gen2 reset.
> > 
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 7 +++++++
> >   include/drm/bridge/dw_hdmi.h              | 1 +
> >   2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > index 4befc104d220..7600f26aab27 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -1365,6 +1365,13 @@ void dw_hdmi_phy_reset(struct dw_hdmi *hdmi)
> >   }
> >   EXPORT_SYMBOL_GPL(dw_hdmi_phy_reset);
> >   
> > +void dw_hdmi_phy_reset_active_low(struct dw_hdmi *hdmi)
> > +{
> > +	hdmi_writeb(hdmi, 0, HDMI_MC_PHYRSTZ);
> > +	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_PHYRSTZ, HDMI_MC_PHYRSTZ);
> > +}
> > +EXPORT_SYMBOL_GPL(dw_hdmi_phy_reset_active_low);
> > +
> >   void dw_hdmi_phy_i2c_set_addr(struct dw_hdmi *hdmi, u8 address)
> >   {
> >   	hdmi_phy_test_clear(hdmi, 1);
> > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> > index 2a1f85f9a8a3..9b3d52a1e62a 100644
> > --- a/include/drm/bridge/dw_hdmi.h
> > +++ b/include/drm/bridge/dw_hdmi.h
> > @@ -190,6 +190,7 @@ void dw_hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
> >   void dw_hdmi_phy_gen2_pddq(struct dw_hdmi *hdmi, u8 enable);
> >   void dw_hdmi_phy_gen2_txpwron(struct dw_hdmi *hdmi, u8 enable);
> >   void dw_hdmi_phy_reset(struct dw_hdmi *hdmi);
> > +void dw_hdmi_phy_reset_active_low(struct dw_hdmi *hdmi);
> >   
> >   enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
> >   					       void *data);
> 
> This has already been submitted at https://lore.kernel.org/r/800262112191a720639ba321be18f0926d4e1d2a.1649230434.git.Sandor.yu@nxp.com

Thanks for the pointer, seems I missed this series. I'll switch to this
function instead.

Regards,
Lucas


