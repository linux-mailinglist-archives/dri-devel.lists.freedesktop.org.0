Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A843628257
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 15:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C0D10E0B9;
	Mon, 14 Nov 2022 14:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7787410E0B9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 14:22:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-14-120-nat.elisa-mobile.fi
 [85.76.14.120])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C71B891;
 Mon, 14 Nov 2022 15:21:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668435720;
 bh=SMAsmGyNjlzB2rGB48lJe5Ga9dyyQWQkCCcRhaIG5Rg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vr2RCer81YcIx8hXLBEVDPR2r8R2YcyuLaXwUwLumpsLEpZBMfXOsZPZhpQq7hISB
 YURpwKln5S4iXKREPh1JmmkuDixwJu68MkceLRTtMz7kfTPK/mBl46RyOgowMDhdf9
 o+PGhjvpYNn7AW6H1tYnuhnlxoU464jKzhh17a8Q=
Date: Mon, 14 Nov 2022 16:21:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm: rcar-du: Fix Kconfig dependency between RCAR_DU and
 RCAR_MIPI_DSI
Message-ID: <Y3JO9NmEpS19Rt3D@pendragon.ideasonboard.com>
References: <20221001220342.5828-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWeZBzFM2Q8sLEqe_DfD74a1K+5qcPHADZnPfrQYqVXrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWeZBzFM2Q8sLEqe_DfD74a1K+5qcPHADZnPfrQYqVXrg@mail.gmail.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Mon, Nov 14, 2022 at 10:05:58AM +0100, Geert Uytterhoeven wrote:
> On Sun, Oct 2, 2022 at 12:06 AM Laurent Pinchart wrote:
> > When the R-Car MIPI DSI driver was added, it was a standalone encoder
> > driver without any dependency to or from the R-Car DU driver. Commit
> > 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence") then
> > added a direct call from the DU driver to the MIPI DSI driver, without
> > updating Kconfig to take the new dependency into account. Fix it the
> > same way that the LVDS encoder is handled.
> >
> > Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch, which is now commit a830a15678593948
> ("drm: rcar-du: Fix Kconfig dependency between RCAR_DU
> and RCAR_MIPI_DSI") in v6.1-rc5.
> 
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -44,12 +44,17 @@ config DRM_RCAR_LVDS
> >         select OF_FLATTREE
> >         select OF_OVERLAY
> >
> > +config DRM_RCAR_USE_MIPI_DSI
> > +       bool "R-Car DU MIPI DSI Encoder Support"
> > +       depends on DRM_BRIDGE && OF
> > +       default DRM_RCAR_DU
> 
> This means this driver is now enabled by default on systems that do not
> have the MIPI DSI Encoder (e.g. R-Car Gen2), and that we should probably
> disable it explicitly in shmobile_defconfig.  Is that intentional?

I don't think so, no. Would you like to send a patch ? If so, it should
enable the option in relevant defconfig files.

> > +       help
> > +         Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> > +
> >  config DRM_RCAR_MIPI_DSI
> > -       tristate "R-Car DU MIPI DSI Encoder Support"
> > -       depends on DRM && DRM_BRIDGE && OF
> > +       def_tristate DRM_RCAR_DU
> > +       depends on DRM_RCAR_USE_MIPI_DSI
> >         select DRM_MIPI_DSI
> > -       help
> > -         Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> >
> >  config DRM_RCAR_VSP
> >         bool "R-Car DU VSP Compositor Support" if ARM

-- 
Regards,

Laurent Pinchart
