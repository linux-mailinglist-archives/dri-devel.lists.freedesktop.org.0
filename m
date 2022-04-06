Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 048FC4F6501
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 18:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F2510E5E2;
	Wed,  6 Apr 2022 16:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0C310E61E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 16:27:18 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nc8Ur-0006hd-Vs; Wed, 06 Apr 2022 18:27:06 +0200
Message-ID: <628350a25aa9943bf731a24ac4db364412c6b8c7.camel@pengutronix.de>
Subject: Re: [PATCH v0 00/10] i.MX8MP HDMI support
From: Lucas Stach <l.stach@pengutronix.de>
To: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 06 Apr 2022 18:27:03 +0200
In-Reply-To: <CAJ+vNU3pxSiAX5_fmLy9ztUZ4-dvm5GHdUnucWZwWcQ539dT4w@mail.gmail.com>
References: <20220406160123.1272911-1-l.stach@pengutronix.de>
 <CAJ+vNU3pxSiAX5_fmLy9ztUZ4-dvm5GHdUnucWZwWcQ539dT4w@mail.gmail.com>
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
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Robert Foss <robert.foss@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, patchwork-lst@pengutronix.de,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tim,

Am Mittwoch, dem 06.04.2022 um 09:10 -0700 schrieb Tim Harvey:
> On Wed, Apr 6, 2022 at 9:01 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > 
> > Hi all,
> > 
> > this adds support for the HDMI output pipeline on the i.MX8MP.
> > It currently depends on the i.MX8MP HDMI power domain series [1]
> > and support for the new LCDIF [2] in the i.MX8MP. I guess the
> > implementation presented here also still has some warts that
> > require fixing and the individual patches most likely need to go
> > through different maintainer trees, so I don't expect this series
> > to be applied right away.
> > 
> > However this complete series should allow people to test it more
> > easily and provide feedback on the implementation with the full
> > picture available.
> > 
> > Compared to downstream this implementation actually allows to
> > power down the separate HDMI PHY power domain when the display
> > is inactive or no HDMI cable is connected.
> > 
> > Regards,
> > Lucas
> > 
> > [1] https://lore.kernel.org/all/20220406153402.1265474-1-l.stach@pengutronix.de/
> > [2] https://lore.kernel.org/all/20220322142853.125880-1-marex@denx.de/
> > 
> > Lucas Stach (10):
> >   drm/bridge: dw-hdmi: add low-active PHY reset
> >   dt-bindings: display: imx: add binding for i.MX8MP HDMI TX
> >   drm/imx: add bridge wrapper driver for i.MX8MP DWC HDMI
> >   dt-bindings: display: imx: add binding for i.MX8MP HDMI PVI
> >   drm/imx: add driver for HDMI TX Parallel Video Interface
> >   dt-bindings: phy: add binding for the i.MX8MP HDMI PHY
> >   phy: freescale: add Samsung HDMI PHY
> >   arm64: dts: imx8mp: add HDMI irqsteer
> >   arm64: dts: imx8mp: add HDMI display pipeline
> >   arm64: dts: imx8mp-evk: enable HDMI
> > 
> >  .../display/imx/fsl,imx8mp-hdmi-pvi.yaml      |   83 ++
> >  .../bindings/display/imx/fsl,imx8mp-hdmi.yaml |   72 ++
> >  .../bindings/phy/fsl,imx8mp-hdmi-phy.yaml     |   62 +
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   19 +
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   93 ++
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |    7 +
> >  drivers/gpu/drm/imx/Kconfig                   |    1 +
> >  drivers/gpu/drm/imx/Makefile                  |    2 +
> >  drivers/gpu/drm/imx/bridge/Kconfig            |   18 +
> >  drivers/gpu/drm/imx/bridge/Makefile           |    4 +
> >  drivers/gpu/drm/imx/bridge/imx-hdmi-pvi.c     |  209 +++
> >  drivers/gpu/drm/imx/bridge/imx-hdmi.c         |  128 ++
> >  drivers/phy/freescale/Kconfig                 |    7 +
> >  drivers/phy/freescale/Makefile                |    1 +
> >  drivers/phy/freescale/phy-fsl-samsung-hdmi.c  | 1145 +++++++++++++++++
> >  include/drm/bridge/dw_hdmi.h                  |    1 +
> >  16 files changed, 1852 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
> >  create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
> >  create mode 100644 drivers/gpu/drm/imx/bridge/Kconfig
> >  create mode 100644 drivers/gpu/drm/imx/bridge/Makefile
> >  create mode 100644 drivers/gpu/drm/imx/bridge/imx-hdmi-pvi.c
> >  create mode 100644 drivers/gpu/drm/imx/bridge/imx-hdmi.c
> >  create mode 100644 drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> > 
> > --
> > 2.30.2
> > 
> 
> Lucas,
> 
> Thanks for consolidating this - It's been difficult to try to merge
> these for testing.
> 
> I still have not been able to apply these to origin/master or
> imx/master - what are you basing off of here?

This HDMI series depends on the HDMI blk-ctrl ([1] in this cover
letter), which in turn depends on the GPCv2 i.MX8MP support series ([1]
in the HDMI blk-ctrl cover letter), which should apply cleanly or with
minimal fuzz to 5.18-rc1.

Regards,
Lucas

