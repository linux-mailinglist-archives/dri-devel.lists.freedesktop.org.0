Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5E1224B15
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jul 2020 13:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF2F6E1ED;
	Sat, 18 Jul 2020 11:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C79E6E1ED
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 11:57:41 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3118820024;
 Sat, 18 Jul 2020 13:57:36 +0200 (CEST)
Date: Sat, 18 Jul 2020 13:57:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v6 2/4] drm/imx: Add initial support for DCSS on iMX8MQ
Message-ID: <20200718115734.GA2989793@ravnborg.org>
References: <20200717144132.2206-1-laurentiu.palcu@oss.nxp.com>
 <20200717144132.2206-3-laurentiu.palcu@oss.nxp.com>
 <20200717194849.GA2369507@ravnborg.org>
 <20200718110525.GA2827@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200718110525.GA2827@bogon.m.sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=8AirrxEcAAAA:8 a=G7IPBT3ptBQ8pCyINA0A:9
 a=wPNLvfGTeEIA:10 a=ST-jHhOKWsTCqRlWije3:22
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
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 lukas@mntmn.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 18, 2020 at 01:05:25PM +0200, Guido G=FCnther wrote:
> Hi,
> On Fri, Jul 17, 2020 at 09:48:49PM +0200, Sam Ravnborg wrote:
> > Hi Laurentiu.
> > =

> > On Fri, Jul 17, 2020 at 05:41:27PM +0300, Laurentiu Palcu wrote:
> > > From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > > =

> > > This adds initial support for iMX8MQ's Display Controller Subsystem (=
DCSS).
> > > Some of its capabilities include:
> > >  * 4K@60fps;
> > >  * HDR10;
> > >  * one graphics and 2 video pipelines;
> > >  * on-the-fly decompression of compressed video and graphics;
> > > =

> > > The reference manual can be found here:
> > > https://www.nxp.com/webapp/Download?colCode=3DIMX8MDQLQRM
> > > =

> > > The current patch adds only basic functionality: one primary plane for
> > > graphics, linear, tiled and super-tiled buffers support (no graphics
> > > decompression yet), no HDR10 and no video planes.
> > > =

> > > Video planes support and HDR10 will be added in subsequent patches on=
ce
> > > per-plane de-gamma/CSC/gamma support is in.
> > > =

> > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > > Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> > > ---
> > =

> > ....
> >         return drm_bridge_attach(encoder, bridge, NULL, 0);
> > ....
> > =

> > The above code-snippet tells that the display-driver rely on the bridge
> > to create the connector.
> > Could this by any chance be updated to the new way where the display
> > driver creates the connector - and thus passing DRM_BRIDGE_ATTACH_NO_CO=
NNECTOR
> > as the flags argument?
> > =

> > What bridges would be relevant?
> > To check that the reelvant bridges are already ported.
> =

> I think that's mostly NWL atm since MHDP isn't mainline yet. Can you
> recommend a bridge driver to look at that does this right?

Hi Guido.

The following is from my notes:

bridge/adv7511                         done
bridge/simple-bridge                   done
bridge/synopsys/dw-hdmi                done
bridge/display-connector.c             done
bridge/lvds-codec                      done
bridge/cdns-dsi                        done
bridge/panel.c                         done
bridge/parade-ps8640                   done
bridge/sil-sii8620                     done
bridge/synopsys/dw-mipi-dsi            done
bridge/tc358768                        done
bridge/thc63lvd1024                    done
bridge/ti-tfp410                       done

This is a list of bridge drivers which are converted and in
drm-misc-next now.
I have a patch set that converts some more but they needs a bit more
polishing before they are done.

Laurent has written about is in a very comprehensive way several times.
The short variant is that we needed to support chained bridges where
the individual bridges implemented the functions required by the
connector - and creating the connector was pushed back to the display
driver.
So the bridges now announce their support of for example hot-plug detect
and reading edid. Then the connector, created by the display driver, can
use the operations exported by the bridge drivers.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
