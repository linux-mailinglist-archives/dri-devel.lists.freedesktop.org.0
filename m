Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF3B855E84
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8489210E09D;
	Thu, 15 Feb 2024 09:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="JLXpfUqB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F5610E09D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1707990720; x=1739526720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lvs7VbiXdxxZXVSqr5EMeEWcoUjErLKiRSGgSfJI70w=;
 b=JLXpfUqBmTzgMWLx9e56AEFKR7JHStqbZync/fu/bSglDqgtcqjCPuVN
 jM9ynjssPolJHkoILygYqkyft2sC2/Q0sApfVk3XXSLGh6aKrjQgzH9L6
 hftUd82aqt2xczd3L80I+GcLE0jIch+x4ZinoIdoFuNoN8ntPDqu+IRWq
 zYhEAC//DrGO49gXJXlinuCzJRDM9w/8Ra7UPaEvCfiovkWoK5Inf1LFh
 UH6EScUbBjuOVXOm9Z8SuOPpQeSjBqDnymTO3fyAtckrUiHI2alT2sEpa
 HuuNmNwnwubDZ9MleDpxPp8lqqgnxRe//tHWkqIji4HWBiO+Ow1uMlIM1 w==;
X-IronPort-AV: E=Sophos;i="6.06,161,1705359600"; d="scan'208";a="35420632"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 15 Feb 2024 10:51:58 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 12C39280075;
 Thu, 15 Feb 2024 10:51:58 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm: bridge: dw_hdmi: Set DRM bridge type
Date: Thu, 15 Feb 2024 10:52:00 +0100
Message-ID: <10420418.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <392efc30-be36-419a-8cda-00d4256097c4@linaro.org>
References: <20240108152514.533414-1-alexander.stein@ew.tq-group.com>
 <392efc30-be36-419a-8cda-00d4256097c4@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Hi everyone,

Am Montag, 8. Januar 2024, 18:00:58 CET schrieb Neil Armstrong:
> On 08/01/2024 16:25, Alexander Stein wrote:
> > The bridge type was set to default (Unknown). Set proper bridge type.
> > With this fixed, debugfs output imx8mp looks proper.
> > $ cat /sys/kernel/debug/dri/1/encoder-0/bridges
> > bridge[0]: imx_hdmi_pvi_bridge_funcs [imx8mp_hdmi_pvi]
> >=20
> >          type: [0] Unknown
> >          OF:
> >          /soc@0/bus@32c00000/display-bridge@32fc4000:fsl,imx8mp-hdmi-pvi
> >          ops: [0x0]
> >=20
> > bridge[1]: dw_hdmi_bridge_funcs [dw_hdmi]
> >=20
> >          type: [11] HDMI-A
> >          OF: /soc@0/bus@32c00000/hdmi@32fd8000:fsl,imx8mp-hdmi
> >          ops: [0x7] detect edid hpd
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > For the record, the output before is:
> > $ cat /sys/kernel/debug/dri/1/encoder-0/bridges
> > bridge[0]: imx_hdmi_pvi_bridge_funcs [imx8mp_hdmi_pvi]
> >=20
> >          type: [0] Unknown
> >          OF:
> >          /soc@0/bus@32c00000/display-bridge@32fc4000:fsl,imx8mp-hdmi-pvi
> >          ops: [0x0]
> >=20
> > bridge[1]: dw_hdmi_bridge_funcs [dw_hdmi]
> >=20
> >          type: [0] Unknown
> >          OF: /soc@0/bus@32c00000/hdmi@32fd8000:fsl,imx8mp-hdmi
> >          ops: [0x7] detect edid hpd
> >  =20
> >   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c index
> > aca5bb0866f88..455bc15d90cc1 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -3541,6 +3541,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_dev=
ice
> > *pdev,>=20
> >   	hdmi->bridge.interlace_allowed =3D true;
> >   	hdmi->bridge.ddc =3D hdmi->ddc;
> >   	hdmi->bridge.of_node =3D pdev->dev.of_node;
> >=20
> > +	hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
> >=20
> >   	memset(&pdevinfo, 0, sizeof(pdevinfo));
> >   	pdevinfo.parent =3D dev;
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Any additional feedback?

Thanks,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


