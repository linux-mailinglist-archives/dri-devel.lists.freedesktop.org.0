Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 404DA43A653
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7416E218;
	Mon, 25 Oct 2021 22:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C136E218
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:10:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D2CA4A8;
 Tue, 26 Oct 2021 00:10:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1635199834;
 bh=MbNaK8CuKNjYoYTHfB2J31y1X/HByeHR2kqxdyuTS9Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sn9YIo6ojBDgbh6Ea1kePcY7Efg1LGaDfwIyt498jx8qGvvL3snOzLfImVaK90Snl
 P3dtvqdMH6x8ZJQFiVXTIdvYQ+YIpYl2EA27lKXzto/5xRXa/g/XrbR4GKGC3XW9zP
 +gTVvM4yY0VGZlJ0e4xa+1buPOOVD2hZXFfjqM0A=
Date: Tue, 26 Oct 2021 01:10:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: robert.foss@linaro.org, a.hajda@samsung.com, narmstrong@baylibre.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, jagan@amarulasolutions.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: bridge: fix unmet dependency on DRM_KMS_HELPER for
 DRM_PANEL_BRIDGE
Message-ID: <YXcrRDNylQ896ypx@pendragon.ideasonboard.com>
References: <20211025174202.32396-1-julianbraha@gmail.com>
 <YXbtt2M+I41qH2ME@pendragon.ideasonboard.com>
 <2172694.EMfidFSxsr@ubuntu-mate-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2172694.EMfidFSxsr@ubuntu-mate-laptop>
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

Hi Julian,

On Mon, Oct 25, 2021 at 02:51:47PM -0400, Julian Braha wrote:
> On Monday, October 25, 2021 1:47:35 PM EDT you wrote:
> > On Mon, Oct 25, 2021 at 01:42:02PM -0400, Julian Braha wrote:
> > > When DRM_CHIPONE_ICN6211 is selected, and DRM_KMS_HELPER is not selected,
> > > Kbuild gives the following warning:
> > > 
> > > WARNING: unmet direct dependencies detected for DRM_PANEL_BRIDGE
> > >   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && DRM_KMS_HELPER [=n]
> > >   Selected by [y]:
> > >   - DRM_CHIPONE_ICN6211 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=y]
> > > 
> > > This is because DRM_CHIPONE_ICN6211 selects DRM_PANEL_BRIDGE
> > > without depending on or selecting DRM_KMS_HELPER,
> > > despite DRM_PANEL_BRIDGE depending on DRM_KMS_HELPER.
> > > 
> > > This unmet dependency bug was detected by Kismet,
> > > a static analysis tool for Kconfig.
> > > Please advise if this is not the appropriate solution.
> > 
> > Shouldn't DRM_PANEL_BRIDGE select DRM_KMS_HELPER instead of depending on
> > it ?
> > 
> > > Fixes: ce517f18944e ("drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB bridge")
> > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > > Signed-off-by: Julian Braha <julianbraha@gmail.com>
> > > ---
> > >  drivers/gpu/drm/bridge/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > index 431b6e12a81f..a630cb8fd1c8 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -30,6 +30,7 @@ config DRM_CDNS_DSI
> > >  config DRM_CHIPONE_ICN6211
> > >  	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
> > >  	depends on OF
> > > +  select DRM_KMS_HELPER
> > >  	select DRM_MIPI_DSI
> > >  	select DRM_PANEL_BRIDGE
> > >  	help
> 
> Hi Laurent,
> 
> Either a "select" or a "depends" will resolve this issue,

Mixing "select" and "depends" usually lead to be results. DRM_KMS_HELPER
is a symbol that is mostly selected (I think there are a handful of
occurrences of "depends", which should probably be fixed).

> but most similar devices in this Kconfig file select DRM_KMS_HELPER.
> Is there something different about DRM_CHIPONE_ICN6211 that I have missed?

There isn't anything fundamentally different, but because DRM_KMS_HELPER
is meant to be selected and not depended on, I think we should fix that
for DRM_PANEL_BRIDGE, and it will fix the issue with
DRM_CHIPONE_ICN6211. The dependency on the KMS helpers come from
drm_panel_bridge.c, not from chipone-icn6211.c as far as I can tell, so
it would also be more correct.

-- 
Regards,

Laurent Pinchart
