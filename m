Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1037B4CD417
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 13:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911F210EE3B;
	Fri,  4 Mar 2022 12:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B222010EE3B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 12:12:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6C5251C;
 Fri,  4 Mar 2022 13:12:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646395976;
 bh=0Ulm78IQ0WXBqQD9qfvvyKGf5lync0xz6SO1lXZndQQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=kcs23ykDS1LqFUxt6PZxX2YN5fQJNWZz2WZPOq9eCqnl4NCZW3wWseOD0lTQ+Wiaj
 A0dibgbN+hsKH8y0e9xg/E2ipZIKPuSv5jerXiYCaJ+Flg1nc+f/oXR2YueW0MF0/z
 xjuie+Nrd2UqVtJ8Uw+qprnCo+99KUmf8wR/BWyI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <164634476693.3683041.3124143336848085499@Monstersaurus>
References: <20220228183955.25508-1-jose.exposito89@gmail.com>
 <164609067646.2361501.15747139249939190799@Monstersaurus>
 <20220303183720.GA334969@elementary>
 <164634476693.3683041.3124143336848085499@Monstersaurus>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: switch to devm_drm_of_get_bridge
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Date: Fri, 04 Mar 2022 12:12:54 +0000
Message-ID: <164639597452.3492470.16590890112062103735@Monstersaurus>
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
Cc: linux-pwm@vger.kernel.org, jernej.skrabec@gmail.com, maxime@cerno.tech,
 jonas@kwiboo.se, airlied@linux.ie, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, robert.foss@linaro.org, andrzej.hajda@intel.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jos=C3=A9

Quoting Kieran Bingham (2022-03-03 21:59:26)
> Quoting Jos=C3=A9 Exp=C3=B3sito (2022-03-03 18:37:20)
> > On Mon, Feb 28, 2022 at 11:24:36PM +0000, Kieran Bingham wrote:
> > > Hi Jos=C3=A9
> > >=20
> > > Quoting Jos=C3=A9 Exp=C3=B3sito (2022-02-28 18:39:54)
> > > > The function "drm_of_find_panel_or_bridge" has been deprecated in
> > > > favor of "devm_drm_of_get_bridge".
> > > >=20
> > > > Switch to the new function and reduce boilerplate.
> > > >=20
> > > > Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 8 +-------
> > > >  1 file changed, 1 insertion(+), 7 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/dr=
m/bridge/ti-sn65dsi86.c
> > > > index dab8f76618f3..fb8e16ed7e90 100644
> > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > @@ -1232,15 +1232,9 @@ static int ti_sn_bridge_probe(struct auxilia=
ry_device *adev,
> > > >  {
> > > >         struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(adev->dev.pa=
rent);
> > > >         struct device_node *np =3D pdata->dev->of_node;
> > > > -       struct drm_panel *panel;
> > > >         int ret;
> > > > =20
> > > > -       ret =3D drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
> > > > -       if (ret)
> > > > -               return dev_err_probe(&adev->dev, ret,
> > > > -                                    "could not find any panel node=
\n");
> > > > -
> > > > -       pdata->next_bridge =3D devm_drm_panel_bridge_add(pdata->dev=
, panel);
> > > > +       pdata->next_bridge =3D devm_drm_of_get_bridge(pdata->dev, n=
p, 1, 0);
> > >=20
> > > Yikes, I was about to rely on this panel variable to determine if the
> > > device is a panel or a display port connector. (Well, I am relying on
> > > it, and patches are hoping to be reposted this week).
> > >=20
> > > Is there expected to be another way to identify if the next connection
> > > is a panel or a bridge?
> > >=20
> > > Regards
> >=20
> > Hi Kieran,
> >=20
> > I'm getting started in the DRM subsystem. I couldn't tell if there is a
> > good way to access the panel pointer... I didn't manage to find it, but
> > hopefully someone with more experience can point us to a solution.
> >=20
> > Since you mentioned display port, I'm not sure if in your case checking
> > "pdata->next_bridge->type" could be good enough.

Actually, it is. And I think this is actually cleaner (both here, and in
the series I'm working on).

> > Anyway, if this patch causes you problems, please go ahead and ignore i=
t.
> > I'm sure the series you are working on are more important than removing
> > a deprecated function :)
>=20
> If it's deprecated, I don't want to block it's removal. Hopefully I can
> resume my work on this tomorrow so I can check to see what I can parse.
> Thanks for the lead on the bridge type, I'm sure I've seen that around
> too so hopefully that's enough. If it is, I'll rebase my work on top of
> your patch and retest.

So - my series is now working with a bit of adaptation to run on top of
your patch, and I think the overall result is better. So:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


>=20
> --
> Kieran
>=20
>=20
> >=20
> > Best wishes,
> > Jose
