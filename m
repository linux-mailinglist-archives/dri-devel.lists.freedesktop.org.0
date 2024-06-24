Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6813F9145DE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B18910E3BF;
	Mon, 24 Jun 2024 09:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="NvP0Q6ML";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="pQoNv+FQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465DA10E3BF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719219975; x=1750755975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PV9cgDGdm1iZPitG/1fCnSIM0ghSA67gNt00Mf+f720=;
 b=NvP0Q6MLFej2Vqb8p1EvlrHOsZgOWOPPPfHjXYlCwNqFDM+i6ZZ7BXu3
 cEAd2uhcWmBHrtW6GWHuJLr1dGrDrDCddztdyHst59DpMFQObTdcWhSsA
 6szhT4XdeDPvdObvkLROA7b8XHYmoZXbFI907wUk9zcyA0yS5P+M47RBF
 IqucGwT6EVO+75zQATovnqJ17rT6QmWVNT2tRLxJl7/bfS/qVh/6HoX+X
 /oS35R9kIdcZKJSgDnrzfrVA5ZGfcytm/B2LMEhhPAKsoM5EAEU4LkSP6
 euoCPsHrLkfvqSCVYS10tNMvrI5C9wdxghHcHPNaKMwI1KjZsQjUOkfum A==;
X-CSE-ConnectionGUID: PhaleV4LSMCD4KTsZCKlzA==
X-CSE-MsgGUID: wIpBVC1sQ/Ctfx0wsNDv4g==
X-IronPort-AV: E=Sophos;i="6.08,261,1712613600"; d="scan'208";a="37547180"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 24 Jun 2024 11:06:13 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E118316FB42; Mon, 24 Jun 2024 11:06:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719219969;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PV9cgDGdm1iZPitG/1fCnSIM0ghSA67gNt00Mf+f720=;
 b=pQoNv+FQAbw5fmFdHIRATkp3AIvjSyNSNV+RovIDySSmcl+Er9oGX8cU6oV3t72z3xsEJm
 NbRhW+NWvmzLBnnEVtgxJRUoGFbNAYKQ6jd3ReMBENtKjyXVaezCUHLfaQkHMxh8QEIJGB
 7enAgVwJPJjw6kHlFPEvGij551QwAkkTdlWwvBDKNvon8FsZHO4AFD1eZU7foU/j/jFzAO
 GbaFoHTZfjRbquXANZX3DGaKbtWkr+tzB/6Oexe0iJANT3EgL0/C1mxnJ9Q47c1U48x4ps
 UM3RiFgFBVGCX3ECJPiZI0g7ZxcqsJiG3Bk4q0/NYxyT1/ziITpzovdkjH/cAw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@dh-electronics.com, Marek Vasut <marex@denx.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v3 4/6] drm/bridge: tc358767: Disable
 MIPI_DSI_CLOCK_NON_CONTINUOUS
Date: Mon, 24 Jun 2024 11:06:13 +0200
Message-ID: <9299383.CDJkKcVGEf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <5794906.DvuYhMxLoT@steina-w>
References: <20240623143846.12603-1-marex@denx.de>
 <20240623143846.12603-4-marex@denx.de> <5794906.DvuYhMxLoT@steina-w>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Am Montag, 24. Juni 2024, 09:45:13 CEST schrieb Alexander Stein:
> Hi,
>=20
> Am Sonntag, 23. Juni 2024, 16:38:36 CEST schrieb Marek Vasut:
> > The MIPI_DSI_CLOCK_NON_CONTINUOUS causes visible artifacts in high
> > resolution modes, disable it. Namely, in DSI->DP mode 1920x1200 24
> > bpp 59.95 Hz, with DSI bus at maximum 1 Gbps per lane setting, the
> > image contains jittering empty lines.
> >=20
> > Signed-off-by: Marek Vasut <marex@denx.de>
>=20
> I can't see these artifacts in 1920x1200 24bpp, but still looks good to me
> Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

I have to retract that. After checking for those mentioned artifacts
I noticed that the DP output was running without any issues.
There is something more going on here. Reverting this patch there wasn't
a single output problem.
This changes actually breaks my DSI connection randomly.
Sometimes it works, sometimes not. I also noticed that there wasn't even
a single DP link training failure, so I assume the DSI clock somehow
affected the internal state machine which even affected DP link training.
Until we know what's going on, NAK form me.

Best regards,
Alexander
> > ---
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > Cc: Robert Foss <rfoss@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: kernel@dh-electronics.com
> > ---
> > V2: No change
> > V3: No change
> > ---
> >  drivers/gpu/drm/bridge/tc358767.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge=
/tc358767.c
> > index c4e2455ad95e4..a48454fe2f634 100644
> > --- a/drivers/gpu/drm/bridge/tc358767.c
> > +++ b/drivers/gpu/drm/bridge/tc358767.c
> > @@ -2303,7 +2303,7 @@ static int tc_mipi_dsi_host_attach(struct tc_data=
 *tc)
> >  	dsi->lanes =3D dsi_lanes;
> >  	dsi->format =3D MIPI_DSI_FMT_RGB888;
> >  	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > -			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
> > +			  MIPI_DSI_MODE_LPM;
> > =20
> >  	ret =3D devm_mipi_dsi_attach(dev, dsi);
> >  	if (ret < 0) {
> >=20
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


