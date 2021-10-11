Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BFD4294DE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 18:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434D46E903;
	Mon, 11 Oct 2021 16:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0DD6E903
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 16:56:09 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 16fc776d-2ab4-11ec-ac3c-0050568cd888;
 Mon, 11 Oct 2021 16:55:50 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id BA48B194B88;
 Mon, 11 Oct 2021 18:55:49 +0200 (CEST)
Date: Mon, 11 Oct 2021 18:56:00 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Ondrej Jirman <megous@megous.com>, Lucas Stach <l.stach@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/5] mxsfb/nwl/panels: media bus format fixes
Message-ID: <YWRsoHTd/EFMv5TY@ravnborg.org>
References: <cover.1633959458.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1633959458.git.agx@sigxcpu.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guido,

On Mon, Oct 11, 2021 at 03:41:22PM +0200, Guido Günther wrote:
> commit b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest bridge if
> present") added bus format probing to mxsfb this exposed several issues in the
> display stack as used on the Librem 5:
> 
> The nwl bridge and the panels didn't bother to set any media bus formats and in
> that case mxsfb would not pick a reasonable default. This series aims to fix
> this.
> 
> This series includes the patch from
> https://lore.kernel.org/dri-devel/YVLYh%2FSgBritG%2FRJ@qwark.sigxcpu.org/
> with a `dev_warn` added.
> 
> The patches are against 5.15-rc3. I've marked a single patch with a 'fixes'
> which is enough to unbreak the display stack in 5.15.
> 
> All patches of this series can be applied independently.
> 
> Changes from v1:
> - Review comment by Marek Vasut
>   https://lore.kernel.org/dri-devel/67e6056a-6157-795d-908d-d65cc803c03d@denx.de/
>   Improve warning message
> - Move mxsfb patches to the end of the queue and the actual nwl fix to the
>   front.
> 
> Changes from v2:
> - Review comments by Lucas Stach
>   https://lore.kernel.org/dri-devel/cover.1633332399.git.agx@sigxcpu.org/T/#m961c22bf2a437a16b29214913d6f0d523fbe88e2
>   Drop fixes tag from mxsfb driver and tweak commit message
> - Add Reviewed-by from Lucas
>   https://lore.kernel.org/dri-devel/cover.1633332399.git.agx@sigxcpu.org/T/#m9f3337a673ae1adbb1f0152a48270b0e1104b0c1
>   https://lore.kernel.org/dri-devel/cover.1633332399.git.agx@sigxcpu.org/T/#m5706d5b93cb6879b6bb4a1810b88800fe4180f74
>   https://lore.kernel.org/dri-devel/cover.1633332399.git.agx@sigxcpu.org/T/#m961c22bf2a437a16b29214913d6f0d523fbe88e2
> - Add Reviewd-by from Rober Foss
>   https://lore.kernel.org/dri-devel/CAG3jFyteqcPNZqrFsggCrnpDfsGGQvibfHBezW+1Hcf3-z91QQ@mail.gmail.com/
> 
> 
> 
> Guido Günther (5):
>   drm/bridge: nwl-dsi: Add atomic_get_input_bus_fmts
>   drm/panel: mantix: Add media bus format
>   drm/panel: st7703: Add media bus format
>   drm: mxsfb: Print failed bus format in hex
>   drm: mxsfb: Set fallback bus format when the bridge doesn't provide
>     one

Full series are:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
