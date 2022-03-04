Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E424CD839
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 16:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D0D112131;
	Fri,  4 Mar 2022 15:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920BD11212B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 15:46:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0A7C482;
 Fri,  4 Mar 2022 16:45:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646408758;
 bh=zofPT4180gIgOh+6fMg3Nf82KavRz3OWRzed2Lhjkzc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Ivij+k1Az9DejrSLv1PaAl7gYrcx5N2xI5xOEViU0L0tVwViZH2g1IT5MwU5t1uK3
 6/Z/OUUnsEvD0cYmdYZUMYoyVB9NVzuyE0cQoKep7bEnhmq7VN2uToR72Ec4LTUP5q
 MtG6gkCWwtaFtBkDeAl7PGPhrx2IEdKQGt3Y2Vdw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=VxOOhZMjVWzXHbEV_EZKRLxtuKgbko-7SUFMsj7upz0g@mail.gmail.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=XeUbw44OZ0H6hJhS3Pb7LgknVpKynHFxWpPx_qPQ6+QA@mail.gmail.com>
 <YNPDAyODcvlWtxpj@pendragon.ideasonboard.com>
 <CAD=FV=W6npK+NhethhY8ghtt7gwDHYfpX00w07nHE82anqx5aA@mail.gmail.com>
 <164563818901.4066078.3221991328451321918@Monstersaurus>
 <CAD=FV=VxOOhZMjVWzXHbEV_EZKRLxtuKgbko-7SUFMsj7upz0g@mail.gmail.com>
Subject: Re: [RFC PATCH 11/11] drm/bridge: ti-sn65dsi86: Support hotplug
 detection
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Date: Fri, 04 Mar 2022 15:45:56 +0000
Message-ID: <164640875638.4039516.894310137608889285@Monstersaurus>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Quoting Doug Anderson (2022-02-23 18:25:13)
> Hi,
>=20
> On Wed, Feb 23, 2022 at 9:43 AM Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> >
> > Hi All,
> >
> > I'm working to respin the remainder of these patches, now that I have
> > IRQ based HPD working on the SN65DSI86, and the (non-eDP) mode is used
> > for Renesas R-Car boards.
> >
> > Quoting Doug Anderson (2021-06-24 00:51:12)
> > > Hi,
> > >
> > > On Wed, Jun 23, 2021 at 4:26 PM Laurent Pinchart
> > > <laurent.pinchart@ideasonboard.com> wrote:
> > > >
> > > > > > @@ -1365,7 +1384,8 @@ static int ti_sn_bridge_probe(struct i2c_=
client *client,
> > > > > >
> > > > > >         pdata->bridge.funcs =3D &ti_sn_bridge_funcs;
> > > > > >         pdata->bridge.of_node =3D client->dev.of_node;
> > > > > > -       pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID;
> > > > > > +       pdata->bridge.ops =3D (pdata->no_hpd ? 0 : DRM_BRIDGE_O=
P_DETECT)
> > > > >
> > > > > Checking for "no_hpd" here is not the right test IIUC. You want to
> > > > > check for eDP vs. DP (AKA whether a panel is downstream of you or=
 a
> > > > > connector). Specifically if downstream of you is a panel then (I
> > > > > believe) HPD won't assert until you turn on the panel and you won=
't
> > > > > turn on the panel (which happens in pre_enable, right?) until HPD
> > > > > fires, so you've got a chicken-and-egg problem. If downstream of =
you
> > > > > is a connector, though, then by definition HPD has to just work
> > > > > without pre_enable running so then you're OK.
> > > >
> > > > Agreed. It's even more true now that your rework has landed, as in =
the
> > > > eDP case EDID is handled by the panel driver. I'll rework this.
> > > >
> > > > Should I also condition setting HPD_DISABLE to the presence of a pa=
nel
> > > > then ? I could drop of_property_read_bool() and set
> > > >
> > > >         pdata->no_hpd =3D !!panel;
> > > >
> > > > > I guess then you'd need to figure out what to do if someone wants=
 to
> > > > > use "HPD" on eDP. Do you need to put a polling loop in pre_enable
> > > > > then? Or you could just punt not support this case until someone =
needs
> > > > > it.
> > > >
> > > > I think I'll stop short of saving the world this time, yes :-) We'l=
l see
> > > > what to do when this case arises.
> > >
> > > How about as a compromise you still call of_property_read_bool() but
> > > add some type of warning in the logs if someone didn't set "no-hpd"
> > > but they have a panel?
> >
> >
> > Would a mix of the two work well?
> >
> > What about:
> >
> >         pdata->no_hpd =3D of_property_read_bool(np, "no-hpd");
> >         if (panel && !pdata->no_hpd) {
> >                 DRM_ERROR("Panels will not function with HPD. Enforcing=
 no-hpd\n");
> >                 pdata->no_hpd =3D true;
> >         }
> >
> > That leaves it still optional to DP connectors, but enforced on eDP?
>=20
> Yeah, that's fine with me. Nits would be to use "warn" instead of
> "error" since this isn't fatal and use the non-SHOUTING versions of
> the prints since the SHOUTING versions are deprecated.

Could you clarify this please? The whole driver uses DRM_ERROR style. Is
there a new debug macro somewhere?


>=20
>=20
> > > > > > +                         | DRM_BRIDGE_OP_EDID;
> > > > >
> > > > > IMO somewhere in here if HPD is being used like this you should t=
hrow
> > > > > in a call to pm_runtime_get_sync(). I guess in your solution the
> > > > > regulators (for the bridge, not the panel) and enable pin are just
> > > > > left on all the time,
> > > >
> > > > Correct, on my development board the SN65DSI86 is on all the time, I
> > > > can't control that.
> > > >
> > > > > but plausibly someone might want to build a
> > > > > system to use HPD and also have the enable pin and/or regulators
> > > > > controlled by this driver, right?
> > > >
> > > > True. DRM doesn't make this very easy, as, as far as I can tell, th=
ere's
> > > > no standard infrastructure for userspace to register an interest in=
 HPD
> > > > that could be notified to bridges. I think it should be fixable, but
> > > > it's out of scope for this series :-) Should I still add a
> > > > pm_runtime_get_sync() at probe time, or leave this to be addressed =
by
> > > > someone who will need to implement power control ?
> > >
> > > IMO if you've detected you're running in DP mode you should add the
> > > pm_runtime_get_sync() in probe to keep it powered all the time and
> > > that seems the simplest. Technically I guess that's not really
> > > required since you're polling and you could power off between polls,
> > > but then you'd have to re-init a bunch of your state each time you
> > > polled too. If you ever transitioned to using an IRQ for HPD then
> > > you'd have to keep it always powered anyway.
> >
> >
> > Hrm ... that's precisely what I've done. It's not IRQ based HPD...
> >
> > So would you like to see something like this during
> > ti_sn_bridge_probe()?
> >
> >         /* The device must remain powered up for HPD to be supported. */
> >         if (!pdata->no_hpd)
> >                 pm_runtime_get_sync(pdata->dev);
>=20
> Yeah, seems reasonable. Probably you'd want to add a devm action to put i=
t too?

Ok, looking at this now - then I should be able to get these updated
patches out.

--
Thanks.

Kieran


>=20
> -Doug
