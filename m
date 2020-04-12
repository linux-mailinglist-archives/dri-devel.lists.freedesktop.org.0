Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA1D1A5F60
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 18:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4837689F4F;
	Sun, 12 Apr 2020 16:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480DE89F4F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 16:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 733E2FB03;
 Sun, 12 Apr 2020 18:37:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K1CRl5mZcB7h; Sun, 12 Apr 2020 18:37:13 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 9F65440601; Sun, 12 Apr 2020 18:37:12 +0200 (CEST)
Date: Sun, 12 Apr 2020 18:37:12 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 00/21] drm: mxsfb: Add i.MX7 support
Message-ID: <20200412163712.GA4007@bogon.m.sigxcpu.org>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Mon, Mar 09, 2020 at 09:51:55PM +0200, Laurent Pinchart wrote:
> Hello,
> 
> This patch series adds i.MX7 support to the mxsfb driver. The eLCDIF
> instance found in the i.MX7 is backward-compatible with the already
> supported LCDC v4, but has extended features amongst which the most
> notable one is a second plane.
> 
> The first 9 patches (01/21 to 09/21) contain miscellaneous cleanups and
> refactoring to prepare for what is to come. Patch 10/21 starts the real
> work with removal of the DRM simple display pipeline helper, as it
> doesn't support multiple planes. The next patch (11/21) is an additional
> cleanup.
> 
> Patches 12/21 to 14/21 fix vblank handling that I found to be broken
> when testing on my device. Patch 15/21 then performs an additional small
> cleanup, and patch 16/21 starts official support for i.MX7 by mentioning
> it in Kconfig.
> 
> Patch 17/21 adds a new device model for the i.MX6SX and i.MX7 eLCDIF.
> After three additional cleanups in patches 18/21 to 20/21, patch 21/21
> finally adds support for the second plane.
> 
> The code is based on drm-misc-next and has been tested on an i.MX7D
> platform with a DPI panel.

I've tested this with an imx8mq using both the current fsl,imx28-lcdif
and fsl,imx6sx-lcdif with the nwl DSI bridge and a dsi panel and both
worked well.
Cheers,
 -- Guido

> 
> Laurent Pinchart (21):
>   drm: mxsfb: Remove fbdev leftovers
>   drm: mxsfb: Use drm_panel_bridge
>   drm: mxsfb: Use BIT() macro to define register bitfields
>   drm: mxsfb: Remove unused macros from mxsfb_regs.h
>   drm: mxsfb: Clarify format and bus width configuration
>   drm: mxsfb: Pass mxsfb_drm_private pointer to mxsfb_reset_block()
>   drm: mxsfb: Use LCDC_CTRL register name explicitly
>   drm: mxsfb: Remove register definitions from mxsfb_crtc.c
>   drm: mxsfb: Remove unneeded includes
>   drm: mxsfb: Stop using DRM simple display pipeline helper
>   drm: mxsfb: Rename mxsfb_crtc.c to mxsfb_kms.c
>   drm: mxsfb: Move vblank event arm to CRTC .atomic_flush()
>   drm: mxsfb: Don't touch AXI clock in IRQ context
>   drm: mxsfb: Enable vblank handling
>   drm: mxsfb: Remove mxsfb_devdata unused fields
>   drm: mxsfb: Add i.MX7 to the list of supported SoCs in Kconfig
>   drm: mxsfb: Update internal IP version number for i.MX6SX
>   drm: mxsfb: Drop non-OF support
>   drm: mxsfb: Turn mxsfb_set_pixel_fmt() into a void function
>   drm: mxsfb: Merge mxsfb_set_pixel_fmt() and mxsfb_set_bus_fmt()
>   drm: mxsfb: Support the alpha plane
> 
>  drivers/gpu/drm/mxsfb/Kconfig      |   4 +-
>  drivers/gpu/drm/mxsfb/Makefile     |   2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 343 -----------------
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c  | 246 ++++---------
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h  |  42 ++-
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 565 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/mxsfb/mxsfb_out.c  |  99 -----
>  drivers/gpu/drm/mxsfb/mxsfb_regs.h | 107 +++---
>  8 files changed, 730 insertions(+), 678 deletions(-)
>  delete mode 100644 drivers/gpu/drm/mxsfb/mxsfb_crtc.c
>  create mode 100644 drivers/gpu/drm/mxsfb/mxsfb_kms.c
>  delete mode 100644 drivers/gpu/drm/mxsfb/mxsfb_out.c
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
