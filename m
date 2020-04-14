Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5331A8CDE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 22:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEE6893EF;
	Tue, 14 Apr 2020 20:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4B9893EF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 20:52:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64594521;
 Tue, 14 Apr 2020 22:52:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586897530;
 bh=yu8wglok8OGTOl53X/EXGSF59yx8BKjlyryBpwdu+g0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eX7dtv0TNakDsdzDQ3BH/Un2lTDwlo7BU+ATugilaXE2BvVbaPEOuDTYiH1LzmDIm
 zrk2T1Qy/+CGgzRhsuhVjKF08IvLfYSkNdohXM/gitM7lOB1zw2S3nfDH7IHxsEmek
 VZYsFivVYMWhwIzYLp8N1QYZhkjRQi5t7LPo1xVk=
Date: Tue, 14 Apr 2020 23:51:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 5/6] drm/rcar-du: fix selection of CMM driver
Message-ID: <20200414205158.GM19819@pendragon.ideasonboard.com>
References: <20200408202711.1198966-1-arnd@arndb.de>
 <20200408202711.1198966-6-arnd@arndb.de>
 <20200414201739.GJ19819@pendragon.ideasonboard.com>
 <CAK8P3a0hd5bsezrJS3+GV2nRMui4P5yeD2Rk7wQpJsAZeOCOUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0hd5bsezrJS3+GV2nRMui4P5yeD2Rk7wQpJsAZeOCOUg@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Leon Romanovsky <leon@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Networking <netdev@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Saeed Mahameed <saeedm@mellanox.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Nicolas Pitre <nico@fluxnic.net>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Tue, Apr 14, 2020 at 10:38:27PM +0200, Arnd Bergmann wrote:
> On Tue, Apr 14, 2020 at 10:17 PM Laurent Pinchart wrote:
> > On Wed, Apr 08, 2020 at 10:27:10PM +0200, Arnd Bergmann wrote:
> > > The 'imply' statement does not seem to have an effect, as it's
> > > still possible to turn the CMM code into a loadable module
> > > in a randconfig build, leading to a link error:
> > >
> > > arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
> > > rcar_du_crtc.c:(.text+0xad4): undefined reference to `rcar_lvds_clk_enable'
> > > arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
> > > rcar_du_crtc.c:(.text+0xd7c): undefined reference to `rcar_lvds_clk_disable'
> > > arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_drv.o: in function `rcar_du_init':
> > > rcar_du_drv.c:(.init.text+0x4): undefined reference to `rcar_du_of_init'
> > > arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_encoder.o: in function `rcar_du_encoder_init':
> > >
> > > Remove the 'imply', and instead use a silent symbol that defaults
> > > to the correct setting.
> >
> > This will result in the CMM always being selected when DU is, increasing
> > the kernel size even for devices that don't need it. I believe we need a
> > better construct in Kconfig to fix this.
> 
> I had expected this to have the same meaning that we had before the
> Kconfig change: whenever the dependencies are available, turn it on,
> otherwise leave it disabled.
> 
> Can you describe what behavior you actually want instead?

Doesn't "imply" mean it gets selected by default but can be manually
disabled ?

> > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > @@ -4,7 +4,6 @@ config DRM_RCAR_DU
> > >       depends on DRM && OF
> > >       depends on ARM || ARM64
> > >       depends on ARCH_RENESAS || COMPILE_TEST
> > > -     imply DRM_RCAR_CMM
> > >       imply DRM_RCAR_LVDS
> > >       select DRM_KMS_HELPER
> > >       select DRM_KMS_CMA_HELPER
> > > @@ -15,9 +14,8 @@ config DRM_RCAR_DU
> > >         If M is selected the module will be called rcar-du-drm.
> > >
> > >  config DRM_RCAR_CMM
> > > -     tristate "R-Car DU Color Management Module (CMM) Support"
> > > +     def_tristate DRM_RCAR_DU
> > >       depends on DRM && OF
> > > -     depends on DRM_RCAR_DU
> > >       help
> 
> It would be easy enough to make this a visible 'bool' symbol and
> build it into the rcu-du-drm.ko module itself. Would that help you?

That could indeed simplify a few things. I wonder if it could introduce
a few small issues though (but likely nothing we can't fix). The two
that come to mind are the fact that the module would have two
MODULE_DESCRIPTION and MODULE_LICENSE entries (I have no idea if that
could cause breakages), and that it could make module unloading more
difficult as the CMM being used by the DU would increase the refcount on
the module. I think the latter could be worked around by manually
unbinding the DU device through sysfs before unloading the module (and I
can't say for sure that unloading the DU module is not broken today
*innocent and naive look* :-)).

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
