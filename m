Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E411A4563
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 12:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132216E18F;
	Fri, 10 Apr 2020 10:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1C96E18F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 10:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 85414FB03;
 Fri, 10 Apr 2020 12:48:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bW2A5ldcPbjn; Fri, 10 Apr 2020 12:48:36 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id ECBD840601; Fri, 10 Apr 2020 12:48:35 +0200 (CEST)
Date: Fri, 10 Apr 2020 12:48:35 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v11 0/2] drm: bridge: Add NWL MIPI DSI host controller
 support
Message-ID: <20200410104835.GA22010@bogon.m.sigxcpu.org>
References: <cover.1586427783.git.agx@sigxcpu.org>
 <20200409140130.GA11188@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409140130.GA11188@ravnborg.org>
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
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>,
 Lee Jones <lee.jones@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Thu, Apr 09, 2020 at 04:01:30PM +0200, Sam Ravnborg wrote:
> Hi Guido.
> =

> On Thu, Apr 09, 2020 at 12:42:00PM +0200, Guido G=FCnther wrote:
> > This adds initial support for the NWL MIPI DSI Host controller found on=
 i.MX8
> > SoCs.
> > =

> > It adds support for the i.MX8MQ but the same IP core can also be found =
on e.g.
> > i.MX8QXP. I added the necessary hooks to support other imx8 variants bu=
t since
> > I only have imx8mq boards to test I omitted the platform data for other=
 SoCs.
> > =

> > The code is based on NXPs BSP so I added Robert Chiras as Co-authored-b=
y.
> > =

> > The most notable changes over the BSP driver are
> >  - Calculate HS mode timing from phy_configure_opts_mipi_dphy
> >  - Perform all clock setup via DT
> >  - Merge nwl-imx and nwl drivers
> >  - Add B0 silion revision quirk
> >  - become a bridge driver to hook into mxsfb / dcss
> >    imx-display-subsystem so it makes sense to make it drive a bridge fo=
r dsi as
> >    well).
> >  - Use panel_bridge to attach the panel
> >  - Use multiplex framework instead of accessing syscon directly
> > =

> > This has been tested on a Librem 5 devkit using mxsfb with Robert's pat=
ches[1]
> > and the mainline rocktech-jh057n00900 DSI panel driver on next-20200317=
 and on
> > the Librem5 with the a Mantix MLAF057WE51-X DSI panel driver (not yet m=
ainline)
> > The DCSS (submitted for mainline inclusion now too) can also act as inp=
ut
> > source.
> =

> Thanks for your persistence with this driver.
> I got ack from Laurent on IRC to apply it (not for the driver as he had
> no time to review it).
> So applied to drm-misc-next now.
> =

> I look forward for the update to support DRM_BRIDGE_ATTACH_NO_CONNECTOR
> in this driver and the corresponding display driver.

Thanks. I'll have a look at that (currently checking where the larger
mxsfb rework of Laurent is going so i can use that as a base
eventually).
Cheers,
 -- Guido
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
