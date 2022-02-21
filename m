Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F184BD78D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 09:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CE210FC6C;
	Mon, 21 Feb 2022 08:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3783510E719
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 08:29:13 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 42A7F1F4334A;
 Mon, 21 Feb 2022 08:29:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645432151;
 bh=WgoXngn3A+b78IQV6TPt47tWpAp6TiyyCgvUpO8Pd8w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VIB4BDJdLn+i57So/S2qiiGBmXMk/MhIRz8ucQ48N8pgOk5WjcinbGsYk16LdZtsW
 RtgRt5RKpIa+c3BFjShmfez0lr1h3ZGH64/4iNE3xYS+qt21G1pOwxtWNeS0bvlb+r
 OmPflG31QFiK4f5JknDmEMAzLuwG20u6nd3w/L9+WTSIgmNKpBMzgHcn5d/tJFlglg
 Spy4T0mPbnu9HNvlGG2osx6WRXg6e3Cc4K/MhpudB5ghOkrUpUYLDePXgwwFRrWpg3
 JXr1mnfBnTAwCoQfzpoY7zG3xpgtiEj7P5Y9OKtpW7frjDCeqOQaxMsbQjVPeVQb/3
 jaYGLCyWO/WdQ==
Date: Mon, 21 Feb 2022 09:29:08 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Subject: Re: [PATCH V2] drm/imx: parallel-display: Remove bus flags check in
 imx_pd_bridge_atomic_check()
Message-ID: <20220221092908.6d8d18c5@collabora.com>
In-Reply-To: <e00e00585b9945e396bdc3bbd8f30f7e@dh-electronics.com>
References: <20220201113643.4638-1-cniedermaier@dh-electronics.com>
 <36f517300a15b2460a02512ef3c5814ad0ed2290.camel@gmail.com>
 <e00e00585b9945e396bdc3bbd8f30f7e@dh-electronics.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: "Marek MV. Vasut" <marex@denx.de>, Max Krummenacher <max.oss.09@gmail.com>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Christoph,

On Sat, 19 Feb 2022 09:28:44 +0000
Christoph Niedermaier <cniedermaier@dh-electronics.com> wrote:

> From: Max Krummenacher [mailto:max.oss.09@gmail.com]
> Sent: Wednesday, February 9, 2022 10:38 AM
> >> If display timings were read from the devicetree using
> >> of_get_display_timing() and pixelclk-active is defined
> >> there, the flag DISPLAY_FLAGS_SYNC_POSEDGE/NEGEDGE is
> >> automatically generated. Through the function
> >> drm_bus_flags_from_videomode() e.g. called in the
> >> panel-simple driver this flag got into the bus flags,
> >> but then in imx_pd_bridge_atomic_check() the bus flag
> >> check failed and will not initialize the display. The
> >> original commit fe141cedc433 does not explain why this
> >> check was introduced. So remove the bus flags check,
> >> because it stops the initialization of the display with
> >> valid bus flags.
> >>
> >> Fixes: fe141cedc433 ("drm/imx: pd: Use bus format/flags provided by the bridge when available")
> >> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> >> Cc: Marek Vasut <marex@denx.de>
> >> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> >> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> >> Cc: David Airlie <airlied@linux.ie>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: Shawn Guo <shawnguo@kernel.org>
> >> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> >> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> >> Cc: Fabio Estevam <festevam@gmail.com>
> >> Cc: NXP Linux Team <linux-imx@nxp.com>
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> To: dri-devel@lists.freedesktop.org
> >> ---
> >> V2: - Add Boris to the Cc list
> >> ---
> >>  drivers/gpu/drm/imx/parallel-display.c | 8 --------
> >>  1 file changed, 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
> >> index a8aba0141ce7..06cb1a59b9bc 100644
> >> --- a/drivers/gpu/drm/imx/parallel-display.c
> >> +++ b/drivers/gpu/drm/imx/parallel-display.c
> >> @@ -217,14 +217,6 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
> >>       if (!imx_pd_format_supported(bus_fmt))
> >>               return -EINVAL;
> >>
> >> -     if (bus_flags &
> >> -         ~(DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_DE_HIGH |
> >> -           DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> >> -           DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)) {
> >> -             dev_warn(imxpd->dev, "invalid bus_flags (%x)\n", bus_flags);
> >> -             return -EINVAL;
> >> -     }
> >> -
> >>       bridge_state->output_bus_cfg.flags = bus_flags;
> >>       bridge_state->input_bus_cfg.flags = bus_flags;
> >>       imx_crtc_state->bus_flags = bus_flags;  
> > 
> > Tested on a Colibri iMX6DL with a panel-dpi based panel.
> > 
> > Tested-by: Max Krummenacher <max.krummenacher@toradex.com>  
> 
> I still ask myself why this bus flag check is in the code.
> Is there a reason not to remove that?

The reasoning was that DE_{LOW,HIGH} and
FLAG_PIXDATA_DRIVE_{POS,NEG}EDGE were the only bus_flags taken into
account by the crtc logic, so anything else is simply ignored. This was
definitely wrong since the driver supports at least one of the VSYNC
polarity (perhaps both if there's a way to configure it that's not
hooked-up yet).

So I guess figuring out the default VSYNC polarity and accepting the
according DISPLAY_FLAGS_SYNC_XXXEDGE flag is what makes most sense here.

Regards,

Boris
