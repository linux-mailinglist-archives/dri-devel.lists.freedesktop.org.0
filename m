Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06868668FA3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 08:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B69C10E0CB;
	Fri, 13 Jan 2023 07:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF6410E0CB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 07:55:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-5-15-nat.elisa-mobile.fi
 [85.76.5.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DBD14D4;
 Fri, 13 Jan 2023 08:55:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673596505;
 bh=vRdyiqF+PpWa7HcHfhCtuslDgXVXt8V4AOIdljF1BQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MplxUnHw8ErIF7LyxmuN/+OcdYTL+KHEXJob0ft2ezOhqAVYE3m8P/x5TGmDxunAX
 hNGSu2Rfv8w4h3WiaTzkK6SyygY+7vdn0jtGh9flpoxnn8uBnWmrnoDsTJWb5wUuXu
 ajDTUWUaMexyxBvmwaL7WwO3/s2maPmjOdQvt9qo=
Date: Fri, 13 Jan 2023 09:55:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/22] gpu/drm: remove the shmobile drm driver
Message-ID: <Y8EOWGVmwEElKGE4@pendragon.ideasonboard.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-2-hch@lst.de>
 <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 09:46:49AM +0200, Laurent Pinchart wrote:
> Hi Christoph,
> 
> Thank you for the patch.
> 
> On Fri, Jan 13, 2023 at 07:23:18AM +0100, Christoph Hellwig wrote:
> > This driver depends on ARM && ARCH_SHMOBILE, but ARCH_SHMOBILE can only be
> > set for each/sh, making the driver dead code except for the COMPILE_TEST
> > case.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> No objection from me.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

To expand a little bit on this, ARCH_SHMOBILE used to be set for the
ARM-based shmobile SoCs too, until

commit 08e735233ea29b17bfec8e4cb302e799d9f920b8
Author: Geert Uytterhoeven <geert+renesas@glider.be>
Date:   Tue Aug 28 17:10:10 2018 +0200

    ARM: shmobile: Remove the ARCH_SHMOBILE Kconfig symbol

    All drivers for Renesas ARM SoCs have gained proper ARCH_RENESAS
    platform dependencies.  Hence finish the conversion from ARCH_SHMOBILE
    to ARCH_RENESAS for Renesas 32-bit ARM SoCs, as started by commit
    9b5ba0df4ea4f940 ("ARM: shmobile: Introduce ARCH_RENESAS").

    Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Acked-by: Arnd Bergmann <arnd@arndb.de>
    Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

merged in v4.20. The DRM shmobile driver's Kconfig entry wasn't updated,
making it dead code indeed.

I haven't tested this driver in ages, hence my lack of objection, but
someone may want to keep it for the pre-R-Car ARM SoCs.

Also, I just noticed that you forgot to update the MAINTAINERS file in
this patch to drop the drivers/gpu/drm/shmobile/ entry.

> > ---
> >  drivers/gpu/drm/Kconfig                       |   2 -
> >  drivers/gpu/drm/Makefile                      |   1 -
> >  drivers/gpu/drm/shmobile/Kconfig              |  12 -
> >  drivers/gpu/drm/shmobile/Makefile             |   8 -
> >  .../gpu/drm/shmobile/shmob_drm_backlight.c    |  82 ---
> >  .../gpu/drm/shmobile/shmob_drm_backlight.h    |  19 -
> >  drivers/gpu/drm/shmobile/shmob_drm_crtc.c     | 683 ------------------
> >  drivers/gpu/drm/shmobile/shmob_drm_crtc.h     |  55 --
> >  drivers/gpu/drm/shmobile/shmob_drm_drv.c      | 303 --------
> >  drivers/gpu/drm/shmobile/shmob_drm_drv.h      |  42 --
> >  drivers/gpu/drm/shmobile/shmob_drm_kms.c      | 150 ----
> >  drivers/gpu/drm/shmobile/shmob_drm_kms.h      |  29 -
> >  drivers/gpu/drm/shmobile/shmob_drm_plane.c    | 261 -------
> >  drivers/gpu/drm/shmobile/shmob_drm_plane.h    |  19 -
> >  drivers/gpu/drm/shmobile/shmob_drm_regs.h     | 310 --------
> >  15 files changed, 1976 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/shmobile/Kconfig
> >  delete mode 100644 drivers/gpu/drm/shmobile/Makefile
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_backlight.c
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_backlight.h
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_crtc.h
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_drv.c
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_drv.h
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_kms.c
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_kms.h
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_plane.c
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_plane.h
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_regs.h

-- 
Regards,

Laurent Pinchart
