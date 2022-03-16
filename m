Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A874DBAF6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 00:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC4A10E9DF;
	Wed, 16 Mar 2022 23:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF8210E9A6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 23:24:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6BED493;
 Thu, 17 Mar 2022 00:24:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1647473050;
 bh=FewMdmi8qEg2S9b7MWGLnLAfszTXPWwFEMPvKBys6OM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=wFX2XoKNsVfKJ9PnzNU5gr5EEIx/VnqBXfatkHwxQUWIk0vQs39KntBZbIIEcT+Fy
 ileRxcJbLsynYWYtRRa75qONDrxoKggzSm3Fclt7HWgVSRRcqkaxsmWEkTrwy68B1A
 EmF7rV00/epJR/t7+umRyqSDwv34FFjU8CoMQzcw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=UcfrWLQdCOx5dCfjvjrLzkdLDeoAROmMtqFWB_X90rwQ@mail.gmail.com>
References: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
 <20220310152227.2122960-3-kieran.bingham+renesas@ideasonboard.com>
 <CAD=FV=UcfrWLQdCOx5dCfjvjrLzkdLDeoAROmMtqFWB_X90rwQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Mar 2022 23:24:08 +0000
Message-ID: <164747304840.11309.8075169187883378445@Monstersaurus>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Quoting Doug Anderson (2022-03-10 23:10:20)
> Hi,
>=20
> On Thu, Mar 10, 2022 at 7:22 AM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> >
> > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Implement the bridge connector-related .get_edid() operation, and report
> > the related bridge capabilities and type.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> > Changes since v1:
> >
> > - The connector .get_modes() operation doesn't rely on EDID anymore,
> >   __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
> >   together
> >  - Fix on top of Sam Ravnborg's DRM_BRIDGE_STATE_OPS
> >
> > Changes since v2: [Kieran]
> >  - Only support EDID on DRM_MODE_CONNECTOR_DisplayPort modes.
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi86.c
> > index 93b54fcba8ba..d581c820e5d8 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -1135,10 +1135,24 @@ static void ti_sn_bridge_atomic_post_disable(st=
ruct drm_bridge *bridge,
> >         pm_runtime_put_sync(pdata->dev);
> >  }
> >
> > +static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> > +                                         struct drm_connector *connect=
or)
> > +{
> > +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> > +       struct edid *edid;
> > +
> > +       pm_runtime_get_sync(pdata->dev);
> > +       edid =3D drm_get_edid(connector, &pdata->aux.ddc);
> > +       pm_runtime_put_autosuspend(pdata->dev);
>=20
> I'm 99% sure that the pm_runtime calls here are not needed and can be
> removed.. The AUX transfer function handles the pm_runtime_get_sync()
> and it also does the "put" with autosuspend so that the whole EDID can
> be read without constantly powering the bridge up and down again.

Yes, digging through I agree - It does look like this may be the case.

ti_sn_aux_transfer() certainly looks like it handles the pm_runtime_
calls, and drm_get_edid() looks like it goes through there from the core
using the standard i2c interface, with nothing else expected to touch
the hw between.

So that more or less simplifies this function to just=20
	return drm_get_edid(connector, &pdata->aux.ddc);

Thanks
--
Kieran
