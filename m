Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693E825E08C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 19:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766056EB20;
	Fri,  4 Sep 2020 17:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511486EB20
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 17:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 40D12FB04;
 Fri,  4 Sep 2020 19:08:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jLj9SpQdZr4N; Fri,  4 Sep 2020 19:08:02 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 1891C45B81; Fri,  4 Sep 2020 19:08:02 +0200 (CEST)
Date: Fri, 4 Sep 2020 19:08:02 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: "Robert Chiras (OSS)" <robert.chiras@oss.nxp.com>
Subject: Re: [PATCH 0/5] Add new features to nwl-dsi driver
Message-ID: <20200904170802.GD755526@bogon.m.sigxcpu.org>
References: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-imx@nxp.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,
On Fri, Aug 28, 2020 at 02:13:27PM +0300, Robert Chiras (OSS) wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> =

> This patch-set adds the new following features to the nwl-dsi bridge driv=
er:
> =

> 1. Control Video PLL from nwl-dsi driver
> =

> Add support for the Video PLL into the nwl-dsi driver, in order
> to better control it's rate, depending on the requested video mode.
> Controlling the Video PLL from nwl-dsi is usefull, since it both drives t=
he DC
> pixel-clock and DPHY phy_ref clock.
> On i.MX8MQ, the DC can be either DCSS or LCDIF.
> =

> 2. Add new property to nwl-dsi: clock-drop-level
> =

> This new property is usefull in order to use DSI panels with the nwl-dsi
> driver which require a higher overhead to the pixel-clock.
> For example, the Raydium RM67191 DSI Panel works with 132M pixel-clock,
> but it needs an overhead in order to work properly. So, the actual pixel-=
clock
> fed into the DSI DPI interface needs to be lower than the one used ad DSI=
 output.
> This new property addresses this matter.
> =

> 3. Add support to handle both inputs for nwl-dsi: DCSS and LCDIF

Thanks. I've tested the drop-clock-level part with mxsfb on a Librem 5
devkit and it removes the slight flickering we've seen before (and which
could be worked around by reducing the input pixel clock so 1 and 3 are

Tested-by: Guido G=FCnther <agx@sigxcpu.org>

I've have added some comments to the individual patches and try to get
around to check out the DCSS part too.
Cheers,
 -- Guido

> =

> Laurentiu Palcu (1):
>   drm/bridge: nwl-dsi: add support for DCSS
> =

> Robert Chiras (4):
>   drm/bridge: nwl-dsi: Add support for video_pll
>   dt-bindings: display/bridge: nwl-dsi: Document video_pll clock
>   drm/bridge: nwl-dsi: Add support for clock-drop-level
>   dt-bindings: display/bridge: nwl-dsi: Document fsl,clock-drop-level
>     property
> =

>  .../bindings/display/bridge/nwl-dsi.yaml           |   7 +
>  drivers/gpu/drm/bridge/nwl-dsi.c                   | 338 +++++++++++++++=
+++++-
>  2 files changed, 336 insertions(+), 9 deletions(-)
> =

> -- =

> 2.7.4
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
