Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FE8230DB3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 17:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EACD6E34C;
	Tue, 28 Jul 2020 15:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550BC6E34D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:26:11 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id E2ED15C4F4A;
 Tue, 28 Jul 2020 17:26:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1595949969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HR06nJRqceHmVOCmkdeEilZ1V76RxVNPjlPgAkS6kjs=;
 b=ZfxrkOeuGPIF7IQQc8eO90YOdgNEUBhg9haqZg0kU/3WdyDmbk46lMz/PWWuH+wIRRZdP/
 FKKmmSqVGzwl2915OHQLr7aXBNkoHL0GJQnGG8qb33gPA8EvlJ4LJ+d9l2WdAlcuZzBEC5
 UnLQpUV3ZnDuUdsLNBixQ3aXb0acUvg=
MIME-Version: 1.0
Date: Tue, 28 Jul 2020 17:26:09 +0200
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 00/22] drm: mxsfb: Add i.MX7 support
In-Reply-To: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
References: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <b7890695c974b93fcb03dcfe5fd62e6a@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, kernel@pengutronix.de, robert.chiras@nxp.com,
 leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-07-27 04:06, Laurent Pinchart wrote:
> Hello,
> 
> This patch series adds i.MX7 support to the mxsfb driver. The eLCDIF
> instance found in the i.MX7 is backward-compatible with the already
> supported LCDC v4, but has extended features amongst which the most
> notable one is a second plane.
> 
> The first 10 patches (01/22 to 10/22) contain miscellaneous cleanups and
> refactoring to prepare for what is to come. Patch 11/22 starts the real
> work with removal of the DRM simple display pipeline helper, as it
> doesn't support multiple planes. The next patch (12/22) is an additional
> cleanup.
> 
> Patches 13/22 to 15/22 fix vblank handling that I found to be broken
> when testing on my device. Patch 16/22 then performs an additional small
> cleanup, and patch 17/22 starts official support for i.MX7 by mentioning
> it in Kconfig.
> 
> Patch 18/22 adds a new device model for the i.MX6SX and i.MX7 eLCDIF.
> After three additional cleanups in patches 19/22 to 21/22, patch 22/22
> finally adds support for the second plane.
> 
> The second plane suffers from an issue whose root cause hasn't been
> found, which results in the first 64 bytes of the first line to contain
> data of unknown origin. Help from NXP to diagnose this issue would be
> useful and appreciated.
> 
> Compared to v3, the series has been rebased on the latest drm-misc,
> without any other modifications.
> 
> The code is based on drm-misc-next and has been tested on an i.MX7D
> platform with a DPI panel.

Applied the series to drm-misc-next! Thanks Laurent!

--
Stefan

> 
> Laurent Pinchart (22):
>   drm: mxsfb: Remove fbdev leftovers
>   drm: mxsfb: Use drm_panel_bridge
>   drm: mxsfb: Use BIT() macro to define register bitfields
>   drm: mxsfb: Remove unused macros from mxsfb_regs.h
>   drm: mxsfb: Clarify format and bus width configuration
>   drm: mxsfb: Pass mxsfb_drm_private pointer to mxsfb_reset_block()
>   drm: mxsfb: Use LCDC_CTRL register name explicitly
>   drm: mxsfb: Remove register definitions from mxsfb_crtc.c
>   drm: mxsfb: Remove unneeded includes
>   drm: mxsfb: Rename mxsfb_crtc.c to mxsfb_kms.c
>   drm: mxsfb: Stop using DRM simple display pipeline helper
>   drm: mxsfb: Move vblank event arm to CRTC .atomic_flush()
>   drm: mxsfb: Don't touch AXI clock in IRQ context
>   drm: mxsfb: Enable vblank handling
>   drm: mxsfb: Remove mxsfb_devdata unused fields
>   drm: mxsfb: Add i.MX7 and i.MX8M to the list of supported SoCs in
>     Kconfig
>   drm: mxsfb: Update internal IP version number for i.MX6SX
>   drm: mxsfb: Drop non-OF support
>   drm: mxsfb: Turn mxsfb_set_pixel_fmt() into a void function
>   drm: mxsfb: Merge mxsfb_set_pixel_fmt() and mxsfb_set_bus_fmt()
>   drm: mxsfb: Remove unnecessary spaces after tab
>   drm: mxsfb: Support the alpha plane
> 
>  drivers/gpu/drm/mxsfb/Kconfig      |   8 +-
>  drivers/gpu/drm/mxsfb/Makefile     |   2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 343 -----------------
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c  | 254 ++++---------
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h  |  42 ++-
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 571 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/mxsfb/mxsfb_out.c  |  99 -----
>  drivers/gpu/drm/mxsfb/mxsfb_regs.h | 103 +++---
>  8 files changed, 739 insertions(+), 683 deletions(-)
>  delete mode 100644 drivers/gpu/drm/mxsfb/mxsfb_crtc.c
>  create mode 100644 drivers/gpu/drm/mxsfb/mxsfb_kms.c
>  delete mode 100644 drivers/gpu/drm/mxsfb/mxsfb_out.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
