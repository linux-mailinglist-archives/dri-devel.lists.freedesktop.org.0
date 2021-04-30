Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F4F36F7C2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 11:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736386F501;
	Fri, 30 Apr 2021 09:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 321 seconds by postgrey-1.36 at gabe;
 Fri, 30 Apr 2021 09:23:19 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416CF6F501
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 09:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 40E37FB03;
 Fri, 30 Apr 2021 11:17:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNeG7bnrk71z; Fri, 30 Apr 2021 11:17:53 +0200 (CEST)
Date: Fri, 30 Apr 2021 11:17:52 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 0/3] drm/bridge: nwl-dsi: Get MIPI DSI controller and
 PHY ready in ->mode_set()
Message-ID: <YIvLQLEjWjCFVmXI@bogon.m.sigxcpu.org>
References: <1619170003-4817-1-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1619170003-4817-1-git-send-email-victor.liu@nxp.com>
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 robert.chiras@nxp.com, linux-imx@nxp.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,
On Fri, Apr 23, 2021 at 05:26:40PM +0800, Liu Ying wrote:
> Hi,
> =

> This series aims to make the nwl-dsi bridge be able to connect with
> more MIPI DSI panels.  Some MIPI DSI panel drivers like 'raydium,rm68200'
> send MIPI_DCS_SET_DISPLAY_ON commands in panel_funcs->prepare(), which
> requires the MIPI DSI controller and PHY to be ready beforehand.
> However, the existing nwl-dsi driver gets the MIPI DSI controller and
> PHY ready in bridge_funcs->pre_enable(), which happens after the
> panel_funcs->prepare().  So, this series shifts the bridge operation
> ealier from bridge_funcs->pre_enable() to bridge_funcs->mode_set().
> =

> Patch 3/3 does the essential bridge operation shift.
> =

> Patch 1/3 and 2/3 are split from the original single patch in v2 and
> are needed by patch 3/3.  This split-up helps clarify changes better.
> The split-up is done in this way:
> =

> 1) Patch 1/3 forces a full modeset when crtc_state->active is changed to
>    be true(which implies only connector's DPMS is brought out of "Off"
>    status, though not necessarily).  This makes sure ->mode_set() and
>    ->atomic_disable() will be called in pairs.
> 2) Patch 2/3 removes a check on unchanged HS clock rate from ->mode_set(),
>    to make sure MIPI DSI controller and PHY are brought up and taken down
>    in pairs.
> 3) Patch 3/3 shifts the bridge operation as the last step.

Looks good to me and tested on imx8mq Librem 5 Devkit with

https://lore.kernel.org/linux-arm-kernel/cover.1617968250.git.agx@sigxcpu.o=
rg/

on top so

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>
Tested-by: Guido G=FCnther <agx@sigxcpu.org>

Cheers,
 -- Guido

> =

> =

> v2->v3:
> * Split the single patch in v2 into 3 patches. (Neil)
> =

> v1->v2:
> * Fix a typo in commit message - s/unchange/unchanged/
> =

> =

> Liu Ying (3):
>   drm/bridge: nwl-dsi: Force a full modeset when crtc_state->active is
>     changed to be true
>   drm/bridge: nwl-dsi: Remove a check on unchanged HS clock rate from
>     ->mode_set()
>   drm/bridge: nwl-dsi: Get MIPI DSI controller and PHY ready in
>     ->mode_set()
> =

>  drivers/gpu/drm/bridge/nwl-dsi.c | 86 +++++++++++++++++---------------
>  1 file changed, 46 insertions(+), 40 deletions(-)
> =

> -- =

> 2.25.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
