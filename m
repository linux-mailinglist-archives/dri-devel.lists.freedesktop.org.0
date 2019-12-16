Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A91D120FB3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372706E822;
	Mon, 16 Dec 2019 16:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A6F6E822
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:39:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EFC2A34;
 Mon, 16 Dec 2019 17:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576514360;
 bh=Gnx12BjJXhbXX5HrSBbFBqjMFkU9sPW4RrpG1GIMN+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EXno0pQ68bVFiOgAIXAK1myg6N8BGl9PF35Kq4Ug5fgsc8/TQgIK7kxGrLsUm0DVw
 l2+8MfK/d/8qtgyf9gyHADQB+mGmEzu73gcSHfH3gmw2b6FmdUO0Lj3CO1jwYh/bJh
 tdUebmZGL8fS819AmI99Y+ZipYtLy3xiE11E5kiM=
Date: Mon, 16 Dec 2019 18:39:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH RESEND 2/4] drm: bridge: anx7688: Add anx7688 bridge
 driver support.
Message-ID: <20191216163910.GC14502@pendragon.ideasonboard.com>
References: <20191211061911.238393-1-hsinyi@chromium.org>
 <20191211061911.238393-3-hsinyi@chromium.org>
 <20191213223816.GS4860@pendragon.ideasonboard.com>
 <CAJMQK-gFn8WeokxGfAZ-akNvdEbQhPj_3Ax2sD7Ti6JcSvjF4g@mail.gmail.com>
 <CANMq1KDh=ehp0RDFRLQ5OCTibrK=Uzp2UFVLM+7AhwpVp-X=yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANMq1KDh=ehp0RDFRLQ5OCTibrK=Uzp2UFVLM+7AhwpVp-X=yQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Matthias Brugger <mbrugger@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Nicolas and Hsin-Yi,

On Mon, Dec 16, 2019 at 06:19:24PM +0800, Nicolas Boichat wrote:
> On Mon, Dec 16, 2019 at 4:46 PM Hsin-Yi Wang wrote:
> > On Sat, Dec 14, 2019 at 6:38 AM Laurent Pinchart wrote:
> > > On Wed, Dec 11, 2019 at 02:19:09PM +0800, Hsin-Yi Wang wrote:
> > > > From: Nicolas Boichat <drinkcat@chromium.org>
> > > >
> > > > ANX7688 is a HDMI to DP converter (as well as USB-C port controller),
> > > > that has an internal microcontroller.
> > > >
> > > > The only reason a Linux kernel driver is necessary is to reject
> > > > resolutions that require more bandwidth than what is available on
> > > > the DP side. DP bandwidth and lane count are reported by the bridge
> > > > via 2 registers on I2C.
> > >
> > > How about power, doesn't this chip have power supplies that potentially
> > > need to be controlled ?
> > >
> > Ideally we should add power supplies as well, but the power is
> > supplied by ec in mt8173 oak board. And we only have this board can
> > test this driver. If we add power supplies in driver we can't test it.
> 
> To clarify a bit more, this is because this chip is actually a
> TCPC+mux+HDMI=>DP converter
> (https://www.analogix.com/en/products/convertersbridges/anx7688). In
> Chromebook architecture, TCPC+mux is controlled by the EC (including
> power and other control pins), and the only reason we need a driver
> for the HDMI=>DP converter is to get the number of lanes on the DP
> side and filter out resolutions. Also, the converter is on a different
> I2C address and it could almost be considered as a separate device.
> 
> (of course we could write a kernel driver for the TCPC+mux but we'll
> leave that to others if there's ever a board that is built with the
> TCPC part connected to the AP)

Is the mux the one that is handled through a gpio-mux driver in this
series, or a different mux ? It would really, really help if you could
show a block diagram of the related hardware (including the EC), as this
is quite confusing. With every e-mail exchanged there's a bit more
information that change my understanding of the issue, I can't really
provide guidance without a full overview.

> > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/bridge/Kconfig            |   9 +
> > > >  drivers/gpu/drm/bridge/Makefile           |   1 +
> > > >  drivers/gpu/drm/bridge/analogix-anx7688.c | 202 ++++++++++++++++++++++
> > > >  3 files changed, 212 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/bridge/analogix-anx7688.c
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > > index 34362976cd6f..1f3fc6bec842 100644
> > > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > > @@ -16,6 +16,15 @@ config DRM_PANEL_BRIDGE
> > > >  menu "Display Interface Bridges"
> > > >       depends on DRM && DRM_BRIDGE
> > > >
> > > > +config DRM_ANALOGIX_ANX7688
> > > > +     tristate "Analogix ANX7688 bridge"
> > > > +     select DRM_KMS_HELPER
> > > > +     select REGMAP_I2C
> > > > +     ---help---
> > > > +       ANX7688 is a transmitter to support DisplayPort over USB-C for
> > > > +       smartphone and tablets.
> > > > +       This driver only supports the HDMI to DP component of the chip.
> > > > +
> > > >  config DRM_ANALOGIX_ANX78XX
> > > >       tristate "Analogix ANX78XX bridge"
> > > >       select DRM_KMS_HELPER
> > > > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > > > index 4934fcf5a6f8..7a1e0ec032e6 100644
> > > > --- a/drivers/gpu/drm/bridge/Makefile
> > > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > > @@ -1,4 +1,5 @@
> > > >  # SPDX-License-Identifier: GPL-2.0
> > > > +obj-$(CONFIG_DRM_ANALOGIX_ANX7688) += analogix-anx7688.o
> > > >  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
> > > >  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> > > >  obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
> > > > diff --git a/drivers/gpu/drm/bridge/analogix-anx7688.c b/drivers/gpu/drm/bridge/analogix-anx7688.c
> > > > new file mode 100644
> > > > index 000000000000..baaed48d6201
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/bridge/analogix-anx7688.c
> > > > @@ -0,0 +1,202 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * ANX7688 HDMI->DP bridge driver
> > > > + *
> > > > + * Copyright 2016 Google LLC
> > > > + */
> > > > +
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/regmap.h>
> > > > +#include <drm/drm_bridge.h>
> > > > +
> > > > +/* Register addresses */
> > > > +#define VENDOR_ID_REG 0x00
> > > > +#define DEVICE_ID_REG 0x02
> > > > +
> > > > +#define FW_VERSION_REG 0x80
> > > > +
> > > > +#define DP_BANDWIDTH_REG 0x85
> > > > +#define DP_LANE_COUNT_REG 0x86
> > >
> > > Are these registers defined by the ANX7688 hardware, or by the firmware
> > > running on the chip (and, I assume, developed by Google) ?
> > >
> > By firmware developed by ANX provided to Google.
> 
> We asked for these registers to be added to ANX FW, and this is the FW
> that is used by all elm/hana Chromebooks (I have no idea about other
> ANX customers...). We have facilities to update the ANX FW from
> coreboot/depthcharge on Chromebooks, but that does not really matter:
> the factory FW of all MP Chromebooks does provide these registers.

So the driver is specific to Chromebooks, it doesn't support all
ANX7688. Sweet :-(

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
