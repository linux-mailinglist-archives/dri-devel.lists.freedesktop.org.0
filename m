Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE0618B05B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 10:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B518967F;
	Thu, 19 Mar 2020 09:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7E38967F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 09:36:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 307A6A53;
 Thu, 19 Mar 2020 10:36:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1584610573;
 bh=AnVm0U95mBRPwzszk6fETyq9Wz+3DamBRwuo691TFqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W6ATkFDzEz8ECgZ/lpIzS9AcvS7FoKvkYe2zj5ljY9r3WHf2+9gpgLBkpz+Cesn7w
 XyEidQz1eufl4akXTBlD9hHvC3J+FfbLBxfhgVOGKhjGh5uz+az/HWsIajkXH8xvYE
 XWRLX0c48bqNEA+39GHdMiW/tXKyyXWJpjOuPiTw=
Date: Thu, 19 Mar 2020 11:36:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 00/21] drm: mxsfb: Add i.MX7 support
Message-ID: <20200319093607.GC4869@pendragon.ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Gentle ping.

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

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
