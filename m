Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F18617B2D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 11:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E628010E268;
	Thu,  3 Nov 2022 10:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B70A10E268
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 10:59:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DDE4589;
 Thu,  3 Nov 2022 11:59:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1667473147;
 bh=fsK27h8kbSA/i0+lhbJgLA1FCVaIX2x7inLddU1g7Bs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=k3TMnj4WfTAH8YFeBcA6f2is+yng+J1K2iBlUpXeNs2HKa+uQpx8OvT/nbh0elHmA
 wxBcRZT/F2D9h1wQbgd+CcmjiZVr3+z83eoFCqhbEYUZNLaf8r+MKrwf8JJNW3aNhT
 HQiqPUB2qyAnAzClPBYfLd2VNpLff/aHTD15ew20=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a68a24a0-eda3-8711-21c1-334289eca0d3@infradead.org>
References: <20221018181828.19528-1-rdunlap@infradead.org>
 <a68a24a0-eda3-8711-21c1-334289eca0d3@infradead.org>
Subject: Re: [PATCH] drm: rcar_du: DRM_RCAR_DU optionally depends on
 RCAR_MIPI_DSI
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date: Thu, 03 Nov 2022 10:59:04 +0000
Message-ID: <166747314442.3962897.9754510086268412956@Monstersaurus>
User-Agent: alot/0.10
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

Quoting Randy Dunlap (2022-11-03 06:06:45)
> ping. I have verified (on linux-next-20221103) that this is still needed.
> Thanks.
>=20
> On 10/18/22 11:18, Randy Dunlap wrote:
> > When CONFIG_DRM_RCAR_DU=3Dy and CONFIG_DRM_RCAR_MIPI_DSI=3Dm, calls
> > from the builtin driver to the mipi driver fail due to linker
> > errors.
> > Since the RCAR_MIPI_DSI driver is not always required, fix the
> > build error by making DRM_RCAR_DU optionally depend on the
> > RCAR_MIPI_DSI Kconfig symbol. This prevents the problematic
> > kconfig combination without requiring that RCAR_MIPI_DSI always
> > be enabled.
> >=20
> > aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `=
rcar_du_crtc_atomic_enable':
> > rcar_du_crtc.c:(.text+0x3a18): undefined reference to `rcar_mipi_dsi_pc=
lk_enable'
> > aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `=
rcar_du_crtc_atomic_disable':
> > rcar_du_crtc.c:(.text+0x47cc): undefined reference to `rcar_mipi_dsi_pc=
lk_disable'
> >=20
> > Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Cc: LUU HOAI <hoai.luu.ub@renesas.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig |    1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff -- a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kco=
nfig
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -4,6 +4,7 @@ config DRM_RCAR_DU
> >       depends on DRM && OF
> >       depends on ARM || ARM64
> >       depends on ARCH_RENESAS || COMPILE_TEST
> > +     depends on DRM_RCAR_MIPI_DSI || DRM_RCAR_MIPI_DSI=3Dn

Please forgive my ignorance, but I don't understand how this works.
Could you explain what this is doing please?

I know you've explained above that it fixes it to optionally depend on
DRM_RCAR_MIPI_DSI ... but it's not making sense to me.

To me - this is saying we depend on DRM_RCAR_MIPI_DSI being enabled, or
not being enabled ... ? Which is like saying if (0 || 1) ?

I'm guessing I'm missing something obvious :-S

--
Kieran


> >       select DRM_KMS_HELPER
> >       select DRM_GEM_DMA_HELPER
> >       select VIDEOMODE_HELPERS
>=20
> --=20
> ~Randy
