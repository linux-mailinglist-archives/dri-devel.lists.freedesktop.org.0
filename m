Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B8B4E5B19
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 23:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5D989021;
	Wed, 23 Mar 2022 22:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F5489021
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 22:11:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61EDC9DE;
 Wed, 23 Mar 2022 23:11:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1648073487;
 bh=Cu9CS4EcUA66RrE2+hvm21/iwXWcI2SNQFBnwa7VelA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=uduwI57/WGxWM6rcFpc626bfNvb2SR3SMatQIGW1ipk/Y8xEd+K6E01T46HcdhFiM
 1V1NJQz2j18mbjdGYmWLd4CBPAWIBsGjLdDjKAC8jLHIad4Gofq9YF6N3aAWdW4Ijp
 pMC9Lw+frXy8hsuRmAMc5qazgKOdiUiw+xWzziJU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=WmkYg33qsXS4znQ8K2H0xVhJfZoPC+HjKt-rPhZ_R4KA@mail.gmail.com>
References: <20220317131250.1481275-1-kieran.bingham+renesas@ideasonboard.com>
 <20220317131250.1481275-4-kieran.bingham+renesas@ideasonboard.com>
 <CAD=FV=WmkYg33qsXS4znQ8K2H0xVhJfZoPC+HjKt-rPhZ_R4KA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/bridge: ti-sn65dsi86: Support hotplug detection
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Mar 2022 22:11:25 +0000
Message-ID: <164807348512.1092274.4092058426102648400@Monstersaurus>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Doug Anderson (2022-03-23 21:47:17)
> Hi,
>=20
> On Thu, Mar 17, 2022 at 6:13 AM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> >
> > @@ -1241,9 +1350,32 @@ static int ti_sn_bridge_probe(struct auxiliary_d=
evice *adev,
> >         pdata->bridge.type =3D pdata->next_bridge->type =3D=3D DRM_MODE=
_CONNECTOR_DisplayPort
> >                            ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_=
CONNECTOR_eDP;
> >
> > -       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> > +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort) {
> >                 pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID;
> >
> > +               if (!pdata->no_hpd)
> > +                       pdata->bridge.ops |=3D DRM_BRIDGE_OP_DETECT;
> > +       }
> > +
> > +       if (!pdata->no_hpd && pdata->irq > 0) {
> > +               ret =3D devm_request_threaded_irq(pdata->dev, pdata->ir=
q, NULL,
> > +                                               ti_sn65dsi86_irq_handle=
r,
> > +                                               IRQF_ONESHOT, "sn65dsi8=
6-irq",
> > +                                               pdata);
> > +               if (ret)
> > +                       return dev_err_probe(pdata->dev, ret,
> > +                                            "Failed to register DP int=
errupt\n");
> > +
> > +               /* Enable IRQ based HPD */
> > +               pdata->bridge.ops |=3D DRM_BRIDGE_OP_HPD;
> > +
> > +               /*
> > +                * Keep the IRQ disabled initially. It will only be ena=
bled when
> > +                * requested through ti_sn_bridge_hpd_enable().
> > +                */
> > +               disable_irq(pdata->irq);
>=20
> Instead, I think you should use `IRQF_NO_AUTOEN` which makes sure that
> no matter what the state of the hardware is your IRQ won't fire
> "early". ...and, of course, it saves a line of code. ;-)
>=20
> Other than that this looks nice to me now so feel free to add my

Aha, thanks, - didn't realise I could do that. I'll remove the
disable_irq, and move the coment above devm_request_threaded_irq, it
still makes sense there with the flag.

I believe I've got the format handling solved on the NO_CONNECTOR patch
from Rob/Sam, so I'm just waiting for some spare cycles to get back and
clean up - and repost the whole of this work as a new series,
incorporating Sam, Rob and Laurent's work with this on top.

--
Kieran


> Reviewed-by tag after the above is fixed.
>=20
> -Doug
