Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E65D4D5AC5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 06:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C993210E3A9;
	Fri, 11 Mar 2022 05:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E1410E3A9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 05:47:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FE6F488;
 Fri, 11 Mar 2022 06:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646977645;
 bh=oockvR1LA+v9n302HI7aC2gMooUZaYtMOy6sArIIR2I=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=DHFCOygtdIWYDOa312BgpS/tKmOtVfjrUwPBlAjBDNa8Dku1KLiq4c2nL217+FDpI
 asDffEq0T0LvXow4y7D/ESM6SMGACt2+ghp5a59VfUYhFyPu0MUiTka6sY5IdhzjfT
 ttCRAF4JC0ihIbgIoE9i9m/u0UI+icDdw5BB2YaY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=UqTh-FLDyXvH=ED-4cbJ6ggDLsTGqhTeqNMsKDphbzYA@mail.gmail.com>
References: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
 <20220310152227.2122960-4-kieran.bingham+renesas@ideasonboard.com>
 <CAD=FV=UqTh-FLDyXvH=ED-4cbJ6ggDLsTGqhTeqNMsKDphbzYA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: ti-sn65dsi86: Support hotplug detection
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Date: Fri, 11 Mar 2022 05:47:22 +0000
Message-ID: <164697764297.2392702.10094603553189733655@Monstersaurus>
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

Quoting Doug Anderson (2022-03-10 23:10:12)
> Hi,
>=20
> On Thu, Mar 10, 2022 at 7:22 AM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> >
> > @@ -1135,6 +1161,36 @@ static void ti_sn_bridge_atomic_post_disable(str=
uct drm_bridge *bridge,
> >         pm_runtime_put_sync(pdata->dev);
> >  }
> >
> > +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge=
 *bridge)
> > +{
> > +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> > +       int val;
> > +
> > +       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
>=20
> Don't you need a pm_runtime_get_sync() before this and a
> put_autosuspend() after? The "detect" will be used in the yes-HPD but
> no-IRQ case, right? In that case there's nobody holding the pm_runtime
> reference.

Hrm ... I'll have to dig on this a bit. The polling is done by the DRM
core, so indeed I suspect it could be done outside of a context that
holds the pm runtime reference.

Equally a get and put on the reference doesn't hurt even if it's already
taken, so perhaps it's best to add it, but I'll try to confirm it's
requirement first.


> Also, a nit that it'd be great if you error checked the regmap_read().
> I know this driver isn't very good about it, but it's probably
> something to get better. i2c transactions can fail. I guess another
> alternative would be to init "val" to 0...

It's a good point indeed. If we can't read the device we should return
disconnected.

>=20
>=20
> > +       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> > +                                        : connector_status_disconnecte=
d;
> > +}
> > +
> > +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
> > +{
> > +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> > +
> > +       /* The device must remain active for HPD to function */
> > +       pm_runtime_get_sync(pdata->dev);
> > +       regmap_write(pdata->regmap, SN_IRQ_HPD_REG,
> > +                    IRQ_HPD_EN | IRQ_HPD_INSERTION_EN |
> > +                    IRQ_HPD_REMOVAL_EN | IRQ_HPD_REPLUG_EN);
> > +}
> > +
> > +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> > +{
> > +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> > +
> > +       regmap_write(pdata->regmap, SN_IRQ_HPD_REG, 0);
> > +       pm_runtime_put_autosuspend(pdata->dev);
>=20
> Before doing the pm_runtime_put_autosuspend() it feels like you should
> ensure that the interrupt has finished. Otherwise we could be midway
> through processing an interrupt and the pm_runtime reference could go
> away, right? Maybe we just disable the irq which I think will wait for
> anything outstanding to finish?

Should the IRQ handler also call pm_runtime_get/put then?

> > @@ -1223,6 +1282,34 @@ static int ti_sn_bridge_parse_dsi_host(struct ti=
_sn65dsi86 *pdata)
> >         return 0;
> >  }
> >
> > +static irqreturn_t ti_sn65dsi86_irq_handler(int irq, void *arg)
> > +{
> > +       struct ti_sn65dsi86 *pdata =3D arg;
> > +       int ret;
> > +       unsigned int hpd;
> > +
> > +       ret =3D regmap_read(pdata->regmap, SN_IRQ_HPD_STATUS_REG, &hpd);
> > +       if (ret || !hpd)
> > +               return IRQ_NONE;
> > +
> > +       if (hpd & IRQ_HPD_INSERTION_STATUS)
> > +               drm_bridge_hpd_notify(&pdata->bridge, connector_status_=
connected);
> > +
> > +       if (hpd & IRQ_HPD_REMOVAL_STATUS)
> > +               drm_bridge_hpd_notify(&pdata->bridge, connector_status_=
disconnected);
> > +
> > +       /* When replugged, ensure we trigger a detect to update the dis=
play */
> > +       if (hpd & IRQ_HPD_REPLUG_STATUS)
> > +               drm_bridge_hpd_notify(&pdata->bridge, connector_status_=
disconnected);
>=20
> How does the ordering work here if _both_ insertion and removal are
> asserted? Is that somehow not possible? Should this be "else if" type
> statements then, or give a warn if more than one bit is set, or ... ?

As I understand it, that would trigger a REPLUG IRQ. However this is one
part I quite disliked about the drm_bridge_hpd_notify. The values here
are not taken as the hardware state anyway. A call to drm_bridge_hpd_notify=
 will=20
trigger a call on the detect function so a further read will occur to
determine the current state using the same function as is used with
polling.

The IRQ handler only cuts out the polling as far as I see.


> > +       /* reset the status registers */
> > +       regmap_write(pdata->regmap, SN_IRQ_HPD_STATUS_REG,
> > +                    IRQ_HPD_STATUS | IRQ_HPD_INSERTION_STATUS |
> > +                    IRQ_HPD_REMOVAL_STATUS | IRQ_HPD_REPLUG_STATUS);
>=20
> IMO this regmap_write() belongs right after the read and should be
> based on what you read--you shouldn't just clear all of them. AKA:
>=20
> a) Read to see what interrupt are asserted.
> b) Ack the interrupts that you saw asserted.
> c) Process the interrupts that you saw asserted.
>=20
> If you process before acking then you can miss interrupts (in other
> words if you do "a" then "c" then "b" then you can miss interrupts
> that come in after "b" but before "c".

Agreed, I'll respin.

> > @@ -1247,9 +1342,29 @@ static int ti_sn_bridge_probe(struct auxiliary_d=
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
> > +               dev_err(pdata->dev, "registering IRQ %d\n", pdata->irq);
> > +
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
> > +               regmap_write(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN);
>=20
> Why not put the above regmap_write() in the ti_sn_bridge_hpd_enable() cal=
l?

I assumed the IRQ handler may get used by other non-HPD events. Which is
also why it was originally registered in the main probe(). HPD is just
one feature of the interrupts. Of course it's only used for HPD now
though. I guess I could have solved the bridge dependency by splitting
the IRQ handler to have a dedicated HPD handler function which would
return if the bridge wasn't initialised, but went with the deferred
registration of the handler.

I can move this and then leave it to anyone else implementing further
IRQ features to refactor if needed.

>=20
> -Doug
