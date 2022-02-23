Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1067F4C1937
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 18:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4AD10F22B;
	Wed, 23 Feb 2022 17:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773F410F22B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 17:02:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99654DD;
 Wed, 23 Feb 2022 18:02:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645635756;
 bh=SvlZHJRiZswjknEFYhFrfKWl4f8Xti/yiyOf1LPWSMk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=PDUabE6HxtUCdOf5fNx+COIvK7IA9sWQZwerh/XD51hOKfLqOO/irzLdJ7hUsFGvP
 5eZlKUn2b7ejHGcY3o658fGcZzq3h/Mk+k1/r/IRYzdFKQAFYmH7GwsrEqHvo6unxd
 fU1uG7d6MkuVVyQJ/htGIk0mUSbUPYQuWopMz15E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YhZf+Fs2AP+btuJj@pendragon.ideasonboard.com>
References: <20211225063151.2110878-1-nikita.yoush@cogentembedded.com>
 <Yczy3UYpU2UMFQ6N@pendragon.ideasonboard.com>
 <164563304251.4066078.10022034509552549983@Monstersaurus>
 <YhZf+Fs2AP+btuJj@pendragon.ideasonboard.com>
Subject: Re: [PATCH] drm/bridge_connector: enable HPD by default if supported
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Wed, 23 Feb 2022 17:02:33 +0000
Message-ID: <164563575394.4066078.17104997030535169083@Monstersaurus>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2022-02-23 16:25:28)
> Hello,
>=20
> On Wed, Feb 23, 2022 at 04:17:22PM +0000, Kieran Bingham wrote:
> > Quoting Laurent Pinchart (2021-12-29 23:44:29)
> > > On Sat, Dec 25, 2021 at 09:31:51AM +0300, Nikita Yushchenko wrote:
> > > > Hotplug events reported by bridge drivers over drm_bridge_hpd_notif=
y()
> > > > get ignored unless somebody calls drm_bridge_hpd_enable(). When the
> > > > connector for the bridge is bridge_connector, such a call is done f=
rom
> > > > drm_bridge_connector_enable_hpd().
> > > >=20
> > > > However drm_bridge_connector_enable_hpd() is never called on init p=
aths,
> > > > documentation suggests that it is intended for suspend/resume paths.
> > >=20
> > > Hmmmm... I'm in two minds about this. The problem description is
> > > correct, but I wonder if HPD should be enabled unconditionally here, =
or
> > > if this should be left to display drivers to control.
> > > drivers/gpu/drm/imx/dcss/dcss-kms.c enables HPD manually at init time,
> > > other drivers don't.
> > >=20
> > > It feels like this should be under control of the display controller
> > > driver, but I can't think of a use case for not enabling HPD at init
> > > time. Any second opinion from anyone ?
> >=20
> > This patch solves an issue I have where I have recently enabled HPD on
> > the SN65DSI86, but without this, I do not get calls to my .hpd_enable or
> > .hpd_disable hooks that I have added to the ti_sn_bridge_funcs.
> >=20
> > So it needs to be enabled somewhere, and this seems reasonable to me?
> > It's not directly related to the display controller - as it's a factor
> > of the bridge?
> >=20
> > On Falcon-V3U with HPD additions to SN65DSI86:
> > Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> If you think this is right, then
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I do, and at the very least it works for me, and fixes Nikita's issue so
to me that's enough for:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> > > > In result, once encoders are switched to bridge_connector,
> > > > bridge-detected HPD stops working.
> > > >=20
> > > > This patch adds a call to that API on init path.
> > > >=20
> > > > This fixes HDMI HPD with rcar-du + adv7513 case when adv7513 report=
s HPD
> > > > events via interrupts.
> > > >=20
> > > > Fixes: c24110a8fd09 ("drm: rcar-du: Use drm_bridge_connector_init()=
 helper")
> > > > Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_bridge_connector.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/d=
rm/drm_bridge_connector.c
> > > > index 791379816837..4f20137ef21d 100644
> > > > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > > > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > > > @@ -369,8 +369,10 @@ struct drm_connector *drm_bridge_connector_ini=
t(struct drm_device *drm,
> > > >                                   connector_type, ddc);
> > > >       drm_connector_helper_add(connector, &drm_bridge_connector_hel=
per_funcs);
> > > > =20
> > > > -     if (bridge_connector->bridge_hpd)
> > > > +     if (bridge_connector->bridge_hpd) {
> > > >               connector->polled =3D DRM_CONNECTOR_POLL_HPD;
> > > > +             drm_bridge_connector_enable_hpd(connector);
> > > > +     }
> > > >       else if (bridge_connector->bridge_detect)
> > > >               connector->polled =3D DRM_CONNECTOR_POLL_CONNECT
> > > >                                 | DRM_CONNECTOR_POLL_DISCONNECT;
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
