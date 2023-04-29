Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F896F22FA
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 06:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016FB10E235;
	Sat, 29 Apr 2023 04:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12ABB10E235
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 04:47:18 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2a8bcfbf276so4407371fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 21:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682743637; x=1685335637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LNzrDWdi6VM9nSaFvj8TSY1bq4OFfxnL8SRIrxetKL8=;
 b=Ytkeha64vHJOXZsHaLeFhfF2vsIeShyi0EECvH5IiEaGHxATZpfnDOPGkpmTrAktqI
 LroESTYFn0PDTlE9tFHkjGrsrjsidtTE+ssbYgbl4/8DTeO/5JGIWLaQEKOpfuq+WxiI
 9dGU+kEnXHdXJT42EbNeohUbSUJIkRjijmgaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682743637; x=1685335637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LNzrDWdi6VM9nSaFvj8TSY1bq4OFfxnL8SRIrxetKL8=;
 b=R9+WvENi688gSm7mcXHcJzGhFKFYU9j69O6ugZIwNHIPa48rsKWLYpRVGwBs1lXxws
 q7fFM++cCrUIBdqWpZew0dBhxSb4YC9zc1RtuowyYl59g8omdYeKa+DBcLJf0Fd2DubE
 IRAdoUTFi9jzCdKvp0soV9LEVUJQ74LrdXW2gFtQnLCR2gITN1dbp16/Qa/Hil060ClL
 IoKMg/FDzhEluMbswK+/AK6Ke3UkhkHMNhqfdWrRrQutz2N+Aoc9tU/3JeNtk+PiEm02
 04+ginlCmk+bLMjBOnB2do8+o0SVlpYY5GKytWleUtHbtE7iRkr/tfLbGcxWSaeqBfae
 gA2g==
X-Gm-Message-State: AC+VfDwkxu6KyKB4rpqNl99LTE0XEnxHgfPUcJn/h3LHJouqJ3HQynlg
 t/oLsrE2m+4c9v3/sYgouveN7vu21o68kPRRd6QV3A==
X-Google-Smtp-Source: ACHHUZ6fS55Q6QLd0RebLhorDZGil9Od+4MzKUvuMZ98P2bP2mC3MBU6kTYqXEdoDsT/e/yx84FUL76Lim+e/nzMnVE=
X-Received: by 2002:a2e:3804:0:b0:29a:8580:8140 with SMTP id
 f4-20020a2e3804000000b0029a85808140mr1852164lja.3.1682743636609; Fri, 28 Apr
 2023 21:47:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Apr 2023 21:47:16 -0700
MIME-Version: 1.0
In-Reply-To: <CAEXTbpeKe1dVHp9cauMN-9nQb35oJ-ZhdFV-8BiWzjjhWAy0Zg@mail.gmail.com>
References: <20230331091145.737305-1-treapking@chromium.org>
 <20230331091145.737305-5-treapking@chromium.org>
 <CAE-0n51E5foFWQAsA73662_5e6XP426wuUCVVmcS5UWwiYpDmw@mail.gmail.com>
 <CAEXTbpdcbB_z4ZGCGzc-cM74ECKyxekbroKCWFnhH8eR=4HmvA@mail.gmail.com>
 <CAE-0n50atfmr-bFh5XtTCm4WpSijJGSe0B5JP8ni7CCYk7Bs5A@mail.gmail.com>
 <CAE-0n51Qy-KDGHOCr4Smpebq1fCURqvJ2RJz6KAtVpv5e+DSGA@mail.gmail.com>
 <CAEXTbpeKe1dVHp9cauMN-9nQb35oJ-ZhdFV-8BiWzjjhWAy0Zg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 28 Apr 2023 21:47:15 -0700
Message-ID: <CAE-0n50bj303jou==v6eMabrZ3EL6Cq7tPJmCj9vM_B7FA8s2g@mail.gmail.com>
Subject: Re: [PATCH v15 04/10] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
To: Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Robert Foss <rfoss@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Pin-yen Lin (2023-04-20 02:10:46)
> On Thu, Apr 20, 2023 at 2:10=E2=80=AFPM Stephen Boyd <swboyd@chromium.org=
> wrote:
> >
> > Quoting Stephen Boyd (2023-04-13 17:22:46)
> > > Quoting Pin-yen Lin (2023-04-13 02:50:44)
> > > >
> > > > Actually the `mode-switch` property here is mainly because
> > > > `fwnode_typec_mux_get`[1] and `typec_mux_match`[2] only return matc=
hes
> > > > when the property is present. I am not sure what side effects would=
 be
> > > > if I remove the ID-matching condition in `typec_mux_match`, so I ad=
ded
> > > > the property here.
> > > >
> > > > Is it feasible to remove the `mode-switch` property here given the
> > > > existing implementation of the Type-C framework?
> > >
> > > Omitting the mode-switch property would require changes to the type-c
> > > framework.
> > >
> > > I'm wondering if we can have this anx driver register mode switches f=
or
> > > however many endpoints exist in the output port all the time when the
> > > aux-bus node doesn't exist. Then the type-c framework can walk from t=
he
> > > usb-c-connector to each connected node looking for a device that is b=
oth
> > > a drm_bridge and a mode-switch. When it finds that combination, it kn=
ows
> > > that the mode-switch has been found. This hinges on the idea that a
> > > device that would have the mode-switch property is a drm_bridge and
> > > would register a mode-switch with the type-c framework.
> > >
> > > It may be a little complicated though, because we would only register
> > > one drm_bridge for the input to this anx device. The type-c walking c=
ode
> > > would need to look at the graph endpoint, and find the parent device =
to
> > > see if it is a drm_bridge.
> >
> > I've been thinking more about this. I think we should only have the
> > 'mode-switch' property possible when the USB input pins (port@2) are
> > connected and the DPI input pins are connected (port@0). Probably you
> > don't have that case though?
>
> No we don't have the use case that uses the USB input pins on anx7625.
> >
> > In your case, this device should register either one or two drm_bridges
> > that connect to whatever downstream is actually muxing the 2 DP lanes
> > with the USB SS lanes onto the usb-c-connector.
>
> What do you mean by "muxing the 2 DP lanes with the USB SS lanes''? In
> our use case, the USB data lanes from both ports are connected to a
> USB hub, but the DP lanes are muxed by the crosspoint switch on
> anx7625. HPD and AUX for the external display are muxed by the EC. You
> can find the diagram at
> https://lore.kernel.org/linux-usb/YxGzk6DNAt0aCvIY@chromium.org/

I mean that you must have some sort of orientation switch hardware that
takes the 2 DP lanes and the 2 USB SuperSpeed "lanes" or "pairs" and
puts them all onto a usb-c-connector. The usb-c-connector node can't be
connected directly to the anx7625 in your diagram because there must be
some sort of "flipper" that does the orientation control. Otherwise the
usb-c-connector wouldn't work if the user flipped the cable. Probably
this is some TCPC or redriver controlled by the EC.

>
> > If that is the EC for
> > ChromeOS, then the EC should have a binding that accepts some number of
> > input ports for DP. The EC would act as a drm_bridge, or in this case
> > probably two bridges, and also as two type-c switches for each
> > drm_bridge corresponding to the usb-c-connector nodes. When DP is on th=
e
> > cable, the type-c switch/mux would signal to the drm_bridge that the
> > display is 'connected' via DRM_BRIDGE_OP_DETECT and struct
> > drm_bridge_funcs::detect(). Then the drm_bridge in this anx part would
> > implement struct drm_bridge_funcs::atomic_enable() and configure the
> > crosspoint switch the right way depending on the reg property of the
> > output node in port@1.
>
> So there will be two drm bridges that act as the downstreams for
> anx7625, and we find the downstream with connector_status_connected to
> configure the crosspoint switch? How do we support that kind of
> topology given that the drm bridge chain is currently a list? Are you
> suggesting making the bridge topology to a tree, or maintaining the
> two downstreams inside the anx7625 driver and not attaching them to
> the bridge chain?

Good point. I'm suggesting to make the drm bridge chain into a tree. We
need to teach drm_bridge core about a mux, and have some logic to
navigate atomically switching from one output to another. I was talking
with dianders@ and he was suggesting to use bridge attach/detach for
this. I'm not sure that will work though because that hook is only
called when the encoder is attached to the bridge.

It may also turn out that this helps with DP multi-stream transport
(MST). As far as I can recall DP MST doesn't mesh well with drm_bridge
designs because it wants to operate on a drm_connector and
drm_bridge_connector_init() wants to make only one drm_connector for a
chain of bridges. If you squint, the anx7625 could be an MST "branch"
that only supports one drm_connector being enabled at a time. Maybe that
is what we should do here, make drm_bridge support creating more than
one drm_connector and when there is a mux in the tree it walks both
sides and runs a callback similar to struct
drm_dp_mst_topology_cbs::add_connector() to tell the encoder that
there's another possible drm_connector here.

>
> Also, if we still register mode switches on the two downstream
> bridges, why do you prefer that over the original approach that
> register switches in the anx7625 driver?

I prefer to not have a mode-switch property here for a couple reasons:

 1. The binding is usb type-c specific, and in the case of the IT6505
 part there is nothing that indicates this is a usb type-c piece of
 hardware. The IT6505 is simply a display bridge. The anx7625 part
 actually does accept usb signals though, but that isn't being used or
 described here. That's where my disclaimer about mode-switch making
 sense applies when the usb input is used.

 2. Putting mode-switch into the graph endpoint nodes is awkward. It is
 a device property, and graph nodes are not devices. Some patches in
 this series have to work around this fact and special case the graph
 walking logic to treat the graph itself as a place to look for the
 property.

 3. The mode-switch property probably isn't necessary at all. The DT
 reviewers have been asking why it is needed. The EC driver that
 registers the usb-c-connectors can be the mode-switch and the
 orientation-switch. And in reality, it _is_ both. The DP signals and
 the USB signals go to the TCPC/redriver that is controlled by the EC
 and the EC is the device that's doing the mode switching to push DP and
 USB through the TCPC/redriver out on the right pins of the
 usb-c-connector.

I guess another way to think about it is that the DP signal coming out
of the anx7625 part is not "usb type-c" at all, unless the USB signal is
coming out on the other side of the crosspoint switch and all four lanes
are wired to some usb-c-connector or redriver. Similarly, the situation
could look like trogdor, where DP is produced by the DP PHY in the SoC
and goes through an analog mux to steer DP to one or the other TCPC
that's wired to the usb-c-connector. There isn't any driver to control
that mux, but if there was it would be a gpio controlled mux that would
be a drm_bridge, because there isn't anything type-c about this
hardware.

And finally, I can see a possibility where the IT6505 is actually wired
to two different dp-connector ports. In that situation, there is no
type-c involvement, but we would still want to expose that to userspace
as two drm_connectors where only one encoder can be attached to them. If
we did that with drm_bridge, then anyone could make these sorts of
chains with muxes and it would present a sane userspace interface.
