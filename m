Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F14894C1856
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 17:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C6C10EE33;
	Wed, 23 Feb 2022 16:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0187E10EE33
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 16:17:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82C19DD;
 Wed, 23 Feb 2022 17:17:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645633045;
 bh=atCpG2wGq1bioML62FCnIx+SdqijD2iEfIT0BMG1CJI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=dgqUuGDMg6knomkd3+jaYVmGmIQ6ndXFWYqLgI1q3F4rwIpkwuPs50/dT7BMvjCuN
 ZJ9ffkYYybbCwHrLrnCjX+T1bRVhSkZsK2CgS21n6dZ8sDL3OJpRHg/UeyhchvaXHS
 OK9gbaSFZSMPEiXjcVsaSo1RdJk6nfv+/piZHvwI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Yczy3UYpU2UMFQ6N@pendragon.ideasonboard.com>
References: <20211225063151.2110878-1-nikita.yoush@cogentembedded.com>
 <Yczy3UYpU2UMFQ6N@pendragon.ideasonboard.com>
Subject: Re: [PATCH] drm/bridge_connector: enable HPD by default if supported
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Date: Wed, 23 Feb 2022 16:17:22 +0000
Message-ID: <164563304251.4066078.10022034509552549983@Monstersaurus>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent, Nikita,

Quoting Laurent Pinchart (2021-12-29 23:44:29)
> Hi Nikita,
>=20
> Thank you for the patch.
>=20
> On Sat, Dec 25, 2021 at 09:31:51AM +0300, Nikita Yushchenko wrote:
> > Hotplug events reported by bridge drivers over drm_bridge_hpd_notify()
> > get ignored unless somebody calls drm_bridge_hpd_enable(). When the
> > connector for the bridge is bridge_connector, such a call is done from
> > drm_bridge_connector_enable_hpd().
> >=20
> > However drm_bridge_connector_enable_hpd() is never called on init paths,
> > documentation suggests that it is intended for suspend/resume paths.
>=20
> Hmmmm... I'm in two minds about this. The problem description is
> correct, but I wonder if HPD should be enabled unconditionally here, or
> if this should be left to display drivers to control.
> drivers/gpu/drm/imx/dcss/dcss-kms.c enables HPD manually at init time,
> other drivers don't.
>=20
> It feels like this should be under control of the display controller
> driver, but I can't think of a use case for not enabling HPD at init
> time. Any second opinion from anyone ?

This patch solves an issue I have where I have recently enabled HPD on
the SN65DSI86, but without this, I do not get calls to my .hpd_enable or
.hpd_disable hooks that I have added to the ti_sn_bridge_funcs.

So it needs to be enabled somewhere, and this seems reasonable to me?
It's not directly related to the display controller - as it's a factor
of the bridge?

On Falcon-V3U with HPD additions to SN65DSI86:
Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> > In result, once encoders are switched to bridge_connector,
> > bridge-detected HPD stops working.
> >=20
> > This patch adds a call to that API on init path.
> >=20
> > This fixes HDMI HPD with rcar-du + adv7513 case when adv7513 reports HPD
> > events via interrupts.
> >=20
> > Fixes: c24110a8fd09 ("drm: rcar-du: Use drm_bridge_connector_init() hel=
per")
> > Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> > ---
> >  drivers/gpu/drm/drm_bridge_connector.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/d=
rm_bridge_connector.c
> > index 791379816837..4f20137ef21d 100644
> > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > @@ -369,8 +369,10 @@ struct drm_connector *drm_bridge_connector_init(st=
ruct drm_device *drm,
> >                                   connector_type, ddc);
> >       drm_connector_helper_add(connector, &drm_bridge_connector_helper_=
funcs);
> > =20
> > -     if (bridge_connector->bridge_hpd)
> > +     if (bridge_connector->bridge_hpd) {
> >               connector->polled =3D DRM_CONNECTOR_POLL_HPD;
> > +             drm_bridge_connector_enable_hpd(connector);
> > +     }
> >       else if (bridge_connector->bridge_detect)
> >               connector->polled =3D DRM_CONNECTOR_POLL_CONNECT
> >                                 | DRM_CONNECTOR_POLL_DISCONNECT;
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
