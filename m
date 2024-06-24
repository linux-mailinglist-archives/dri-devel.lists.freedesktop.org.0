Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70823914951
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 14:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C504989E33;
	Mon, 24 Jun 2024 12:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="arYu22GZ";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mdeBpSI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C153310E245
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 12:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719230637; x=1750766637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L9SqzLwnyFw9O0cjx7JztMLALTgKK8TJgRcvzOsBlc4=;
 b=arYu22GZ3/CKDTA2tPV68FXEc1hoIqUndvKtIY5PQgY0fGygdVT4yRFm
 OP429xVKOVs46an5wu6jO6S7hFXrrTCUj7xAVXdGmeE+WI362etVClgYf
 eMe3d8uytjfcgFQQXOq6g26k+JVbmXorTPslJGKlknjim9vCXj6yk5Ria
 pk1V90FrZ3x2w8+EQaH7pJN9mzIqDXATnvT6jPvATasdcSbQJTTpwfTB6
 MrmbGOF8YbQzuW53sSp0CboRnRuTblUfjsTsBJf65EQRVDklFQ29JhZdx
 jW3tZvJXwVjUISmHPauMXpHqPZZJOUCxONU0lJt9N0dv0N4JU+KUzbnZ1 g==;
X-CSE-ConnectionGUID: wQQx9fCJQuOjIKyWO8lLWg==
X-CSE-MsgGUID: u8AO9FrxSwu0gfX69Lyb5w==
X-IronPort-AV: E=Sophos;i="6.08,261,1712613600"; d="scan'208";a="37551712"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 24 Jun 2024 14:03:54 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8BF321613E2; Mon, 24 Jun 2024 14:03:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719230630;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=L9SqzLwnyFw9O0cjx7JztMLALTgKK8TJgRcvzOsBlc4=;
 b=mdeBpSI1im/et4LdsYakQtiNV5Hmhe7AIWj3a8UOVyfwzq/CSYIVrShsm0THfmCaiLLMpg
 bxg3emTDk1j0NzhXYbf8TbJebJwWgHbDvxsjVsbCLGXrtuuXDnrkB4PxTEEAc+HuIIAoPk
 jITczRzAcaP50gID6yObJOi5dvEjm4LfvoBJ8yQhmvlpab7VZx8Z0FWKyCAJd5U6BYFJ3w
 5SYA9P1ENOx/mpjY/I4R5Ror3okGbW/PgWv5uPs6iXaiPL9iNK9OGfUZdCbVVTlCVBSQiv
 S7UbNtFLCPSV24V1DKkASssGaMvNE++FcuUFk9Y0i95S8th+Xu0ieHjg7OcgCw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/lcdif: switch to DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Mon, 24 Jun 2024 14:03:52 +0200
Message-ID: <1984704.yKVeVyVuyW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAA8EJppQtiDxZjLMk6VB0X_4VSuC8cNhPOMd8on2uQ3xo92vSg@mail.gmail.com>
References: <20240624-mxc-lcdif-bridge-attach-v1-1-37e8c5d5d934@linaro.org>
 <859620673.0ifERbkFSE@steina-w>
 <CAA8EJppQtiDxZjLMk6VB0X_4VSuC8cNhPOMd8on2uQ3xo92vSg@mail.gmail.com>
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

Hi Dmitry,

Am Montag, 24. Juni 2024, 13:49:03 CEST schrieb Dmitry Baryshkov:
> On Mon, 24 Jun 2024 at 14:32, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >
> > Hi,
> >
> > Am Montag, 24. Juni 2024, 12:31:46 CEST schrieb Dmitry Baryshkov:
> > > Existing in-kernel device trees use LCDIF with the dsim + adv7533, ds=
im
> > > + tc358762 or with ldb + panel_bridge. All these combinations support
> > > using DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment.
> > >
> > > Change lcdif driver to use this flag when attaching the bridge and
> > > create drm_bridge_connector afterwards.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > > Note: compile-tested only.
> >
> > I gave it a try, but it doesn't work. Despite DSI output it also breaks
> > HDMI output, where I at least some error messages:
> > [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32c0=
0000/hdmi@32fd8000 to encoder None-37: -22
> > [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32c0=
0000/display-bridge@32fc4000 to encoder None-37: -22
> > imx-lcdif 32fc6000.display-controller: error -EINVAL: Failed to attach =
bridge for endpoint0
> > imx-lcdif 32fc6000.display-controller: error -EINVAL: Cannot connect br=
idge
> > imx-lcdif 32fc6000.display-controller: probe with driver imx-lcdif fail=
ed with error -22
>=20
> Could you please try it with the following change:
>=20
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 13bc570c5473..c87d3e55c00d 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -94,6 +94,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device =
*pdev)
>         plat_data->phy_name =3D "SAMSUNG HDMI TX PHY";
>         plat_data->priv_data =3D hdmi;
>         plat_data->phy_force_vendor =3D true;
> +       plat_data->output_port =3D 1;
>=20
>         hdmi->dw_hdmi =3D dw_hdmi_probe(pdev, plat_data);
>         if (IS_ERR(hdmi->dw_hdmi))

Okay, this does fix the HDMI probe errors. Nevertheless I get the errors:
[   13.429313] [drm] Initialized imx-lcdif 1.0.0 for 32e80000.display-contr=
oller on minor 1
[   13.439116] imx-lcdif 32e80000.display-controller: [drm] Cannot find any=
 crtc or sizes
[   13.448168] imx-lcdif 32e80000.display-controller: [drm] Cannot find any=
 crtc or sizes
[   15.519737] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.display-contr=
oller on minor 2
[   15.675672] imx-lcdif 32fc6000.display-controller: [drm] Cannot find any=
 crtc or sizes

just from the lcdif patch for both HDMI and DP.

Best regards,
Alexander

>=20
> >
> > Best regards,
> > Alexander
> >
> > > ---
> > >  drivers/gpu/drm/mxsfb/lcdif_drv.c | 14 +++++++++++++-
> > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsf=
b/lcdif_drv.c
> > > index 0f895b8a99d6..1d5508449995 100644
> > > --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > > +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > > @@ -16,6 +16,7 @@
> > >
> > >  #include <drm/drm_atomic_helper.h>
> > >  #include <drm/drm_bridge.h>
> > > +#include <drm/drm_bridge_connector.h>
> > >  #include <drm/drm_drv.h>
> > >  #include <drm/drm_encoder.h>
> > >  #include <drm/drm_fbdev_dma.h>
> > > @@ -48,6 +49,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_pri=
vate *lcdif)
> > >  {
> > >       struct device *dev =3D lcdif->drm->dev;
> > >       struct device_node *ep;
> > > +     struct drm_connector *connector;
> > >       struct drm_bridge *bridge;
> > >       int ret;
> > >
> > > @@ -96,13 +98,23 @@ static int lcdif_attach_bridge(struct lcdif_drm_p=
rivate *lcdif)
> > >                       return ret;
> > >               }
> > >
> > > -             ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
> > > +             ret =3D drm_bridge_attach(encoder, bridge, NULL, DRM_BR=
IDGE_ATTACH_NO_CONNECTOR);
> > >               if (ret) {
> > >                       of_node_put(ep);
> > >                       return dev_err_probe(dev, ret,
> > >                                            "Failed to attach bridge f=
or endpoint%u\n",
> > >                                            of_ep.id);
> > >               }
> > > +
> > > +             connector =3D drm_bridge_connector_init(lcdif->drm, enc=
oder);
> > > +             if (IS_ERR(connector)) {
> > > +                     ret =3D PTR_ERR(connector);
> > > +                     of_node_put(ep);
> > > +
> > > +                     return dev_err_probe(dev, ret,
> > > +                                          "Failed to create bridge c=
onnector for endpoint%u\n",
> > > +                                          of_ep.id);
> > > +             }
> > >       }
> > >
> > >       return 0;
> > >
> > > ---
> > > base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
> > > change-id: 20240624-mxc-lcdif-bridge-attach-60368807b2f9
> > >
> > > Best regards,
> > >
> >
> >
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/
> >
> >
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


