Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F9F696854
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 16:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11A610E23B;
	Tue, 14 Feb 2023 15:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B46A10E23B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 15:43:13 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pRxSZ-0001Sy-7o; Tue, 14 Feb 2023 16:43:11 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pRxSS-0008FL-NN; Tue, 14 Feb 2023 16:43:04 +0100
Date: Tue, 14 Feb 2023 16:43:04 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: [PATCH v5 0/4] drm/rockchip: dw_hdmi: Add 4k@30 support
Message-ID: <20230214154304.GK10447@pengutronix.de>
References: <20230208090816.3810589-1-s.hauer@pengutronix.de>
 <43BFE269C2D3B94A+72719122-bfdd-8e99-9176-a6f5e30abfb2@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43BFE269C2D3B94A+72719122-bfdd-8e99-9176-a6f5e30abfb2@radxa.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
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
Cc: Dan Johansen <strit@manjaro.org>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 13, 2023 at 04:11:46PM +0900, FUKAUMI Naoki wrote:
> hi,
> 
> on my rk3399 boards(ROCK Pi 4B+ and ROCK 4C+), fb0 is configured as
> 1920x1080, and nothing is displayed... "no signal" on display.

I can confirm this.

First of all there is a stupid bug in my patch:

> +       if (vop->data->max_output.width && mode->hdisplay > vop->data->max_output.height)
> +               return MODE_BAD_HVALUE;

The comparison should be against the width here of course, not against
the height. Fixing this should at least allow you to display something
when a 1080p display is connected.

The other problem comes with the legacy fbdev emulation. I think failure
is pretty much expected here. The fbdev emulation happens to use the
VOPL to display a 4k picture, but the VOPL can only do up to 2560x1600
and so the mode is denied in vop_crtc_mode_valid(). Quoting Daniel Stone
on this topic:

> You've done the right thing. Userspace should detect this and try with
> alternative CRTC routing. The kernel shouldn't be trying to solve this
> problem.

Trying an alternative CRTC routing is exactly what the fbdev emulation
doesn't do. Now my "userspace" is in kernel and the kernel shouldn't try
to solve this problem. We're trapped :-/

Sascha

> 
> --
> FUKAUMI Naoki
> 
> On 2/8/23 18:08, Sascha Hauer wrote:
> > Some more small changes to this series, see changelog.
> > 
> > Sascha
> > 
> > Changes since v4:
> > - Use struct vop_reg to store resolutions
> > - Only check for valid clock rates when clock != NULL
> > 
> > Changes since v3
> > - Add patch to limit VOP resolutions to hardware capabilitie
> > 
> > Changes since v2:
> > - Use correct register values for mpll_cfg
> > - Add patch to discard modes we cannot achieve
> > 
> > Changes since v1:
> > - Allow non standard clock rates only on Synopsys phy as suggested by
> >    Robin Murphy
> > 
> > Sascha Hauer (4):
> >    drm/rockchip: vop: limit maximium resolution to hardware capabilities
> >    drm/rockchip: dw_hdmi: relax mode_valid hook
> >    drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
> >    drm/rockchip: dw_hdmi: discard modes with unachievable pixelclocks
> > 
> >   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c  | 41 ++++++++++++++++----
> >   drivers/gpu/drm/rockchip/rockchip_drm_vop.c  | 15 +++++++
> >   drivers/gpu/drm/rockchip/rockchip_drm_vop.h  |  6 +++
> >   drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  5 ---
> >   drivers/gpu/drm/rockchip/rockchip_vop_reg.c  | 18 +++++++++
> >   5 files changed, 73 insertions(+), 12 deletions(-)
> > 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
