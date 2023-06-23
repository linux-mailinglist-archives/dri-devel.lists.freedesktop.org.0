Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDF473BE16
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0352D10E697;
	Fri, 23 Jun 2023 17:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC1310E697
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 17:52:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E53D838;
 Fri, 23 Jun 2023 19:51:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687542712;
 bh=6rT+n6mijf4+BiTWtjg5ainxi9bp14qGHZoBtspMrmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OPb5chPnpf4jYQBzGlpPUlVg8zmUuRTOqy7IqqaVgYGXk6H2vkvu8AROWnGE7zvim
 dABdk2AhBa6Y7SSL3O2GwIZTvyRLerqVGBVYqUgr+5DPXY0HMRPTWBZUW2mMVDQKxZ
 SNXQTYNOtAGP/wfDxBfmWdRXjvkyQGGT9e37Hh+8=
Date: Fri, 23 Jun 2023 20:52:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 06/39] drm: renesas: shmobile: Add support for Runtime PM
Message-ID: <20230623175227.GP2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <742b3351c1aed1f546ac2dcc1de15e0d04cc24d4.1687423204.git.geert+renesas@glider.be>
 <20230623150742.GK2112@pendragon.ideasonboard.com>
 <20230623151109.GL2112@pendragon.ideasonboard.com>
 <CAMuHMdWn-V5b61t7SDDEW_fUt09Y=EVPdXCmAiht0c4uD67siA@mail.gmail.com>
 <20230623153425.GQ2112@pendragon.ideasonboard.com>
 <CAMuHMdU-2kfL1ysgriVg_2_y85YXr0v49mHuYxLJJGyLGr7V=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU-2kfL1ysgriVg_2_y85YXr0v49mHuYxLJJGyLGr7V=w@mail.gmail.com>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Fri, Jun 23, 2023 at 07:41:36PM +0200, Geert Uytterhoeven wrote:
> On Fri, Jun 23, 2023 at 5:34 PM Laurent Pinchart wrote:
> > On Fri, Jun 23, 2023 at 05:22:45PM +0200, Geert Uytterhoeven wrote:
> > > On Fri, Jun 23, 2023 at 5:11 PM Laurent Pinchart wrote:
> > > > On Fri, Jun 23, 2023 at 06:07:44PM +0300, Laurent Pinchart wrote:
> > > > > On Thu, Jun 22, 2023 at 11:21:18AM +0200, Geert Uytterhoeven wrote:
> > > > > > The SH-Mobile LCD Controller is part of a PM Domain on all relevant SoCs
> > > > > > (clock domain on all, power domain on some).  Hence it may not be
> > > > > > sufficient to manage the LCDC module clock explicitly (e.g. if the
> > > > > > selected clock source differs from SHMOB_DRM_CLK_BUS).
> > > > > >
> > > > > > Fix this by using Runtime PM instead.
> > > > > >
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > ---
> > > > > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 11 ++++++++++-
> > > > > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  5 +++++
> > > > > >  2 files changed, 15 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > > > > index fbfd906844da490c..84dbf35025d7be63 100644
> > > > > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > > > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > > > > @@ -9,6 +9,7 @@
> > > > > >
> > > > > >  #include <linux/backlight.h>
> > > > > >  #include <linux/clk.h>
> > > > > > +#include <linux/pm_runtime.h>
> > > > > >
> > > > > >  #include <drm/drm_crtc.h>
> > > > > >  #include <drm/drm_crtc_helper.h>
> > > > > > @@ -170,10 +171,16 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
> > > > > >     if (WARN_ON(format == NULL))
> > > > > >             return;
> > > > > >
> > > > > > +   ret = pm_runtime_resume_and_get(sdev->dev);
> > > > > > +   if (ret)
> > > > > > +           return;
> > > > > > +
> > > > > >     /* Enable clocks before accessing the hardware. */
> > > > > >     ret = shmob_drm_clk_on(sdev);
> > > > >
> > > > > This would be best located in the runtime PM resume handler. Same for
> > > > > disabling clocks in the runtime PM suspend handler.
> > > >
> > > > The driver should then depend on CONFIG_PM. There's no indirect
> > > > dependency through CONFIG_DRM as far as I can tell, but there's one
> > > > through ARCH_SHMOBILE. This then got me puzzled, as ARCH_SHMOBILE is
> > > > defined in arch/sh/Kconfig, and this driver depends on ARM. Am I missing
> > > > something ?
> > >
> > > Vommit 4bd65789ba847f39 ("drm: shmobile: Make DRM_SHMOBILE visible on
> > > Renesas SoC platforms") in drm-next:
> > >
> > > -       depends on DRM && ARM
> > > -       depends on ARCH_SHMOBILE || COMPILE_TEST
> > > +       depends on DRM
> > > +       depends on ARCH_RENESAS || ARCH_SHMOBILE || COMPILE_TEST
> >
> > That's better indeed :-)
> >
> > A dependency on CONFIG_PM is still needed as ARCH_RENESAS doesn't depend
> > on it.
> 
> ARCH_RMOBILE selects PM, so PM will be enabled on affected platforms.

Which also means that you will never test compilation without CONFIG_PM,
while bots will. There's a risk of introducing compilation warnings.

-- 
Regards,

Laurent Pinchart
