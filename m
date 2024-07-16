Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691AF933271
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9888310E2CB;
	Tue, 16 Jul 2024 19:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A74A10E2CB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 19:51:00 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:810b:4340:4ee9:4685:ff:fe12:5967])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 773101E81;
 Tue, 16 Jul 2024 21:50:58 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jul 2024 21:50:58 +0200
Message-Id: <D2R83VFPUWE3.3MBX3LQOCDFWA@kernel.org>
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Initialize bridge on
 attach
Cc: "Adam Ford" <aford173@gmail.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, "Frieder Schrempf"
 <frieder.schrempf@kontron.de>, "Inki Dae" <inki.dae@samsung.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Lucas Stach"
 <l.stach@pengutronix.de>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, <kernel@dh-electronics.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Marek Vasut" <marex@denx.de>, "Alexander Stein"
 <alexander.stein@ew.tq-group.com>, <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.16.0
References: <20240625122824.148163-1-marex@denx.de>
 <4603431.cEBGB3zze1@steina-w>
 <f90aa303-f18b-4cca-bb7a-f94f74dfee36@denx.de>
 <D29SIGP58O7E.3AJ5VRGQ4I1VN@kernel.org>
 <1867bfd6-ad00-46a7-8bad-4a4441d9854c@denx.de>
 <D2NDK85U87AZ.2IL0CPIN04OEL@kernel.org>
 <bb151c91-128a-4734-b1a5-a91a1dea5e30@denx.de>
In-Reply-To: <bb151c91-128a-4734-b1a5-a91a1dea5e30@denx.de>
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

> >>>> Thank you for testing and keeping up with this. I will wait for more
> >>>> feedback if there is any (Frieder? Lucas? Michael?). If there are no
> >>>> objections, then I can merge it in a week or two ?
> >>>
> >>> I'll try to use your approach on the tc358775. Hopefully, I'll find
> >>> some time this week.
> >>
> >> So ... I wonder ... shall I apply these patches or not ?
> >=20
> > As mentioned on IRC, I tried it to port it for the mediatek DSI
> > host, but I gave up and got doubts that this is the way to go. I
> > think this is too invasive (in a sense that it changes behavior)
>
> I would argue it makes the behavior well defined. If that breaks some=20
> drivers that depended on the undefined behavior before, those should be=
=20
> fixed too.

Then this behavior should be documented (and accepted) in the
corresponding section:
https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation

This will help DSI host driver developers and we can point all the
host DSI driver maintainers to that document along with the proper
implementation :)

> > and not that easy to implement on other drivers.
>
> How so ? At least the DSIM and STM32 DW DSI host can switch lanes to=20
> LP11 state. Is the mediatek host not capable of that ?

The controller is certainly capable to do that. But the changes
seems pretty invasive to me and I fear some fallout. Although it's
basically just one line for the DSIM, you seem to be moving the init
of the DSIM to an earlier point(?). I'm no expert with all the DRM
stuff, so I might be wrong here.

> > Given that this requirement is far more common across DSI bridges,
> > I'd favor a more general solution which isn't a workaround.
>
> I think we only had a look at the TI DSI83 / ICN6211 / Toshiba TC358767=
=20
> bridges, but we did not look at many panels, did we ? Do panels require=
=20
> lanes in non-LP11 state on start up ?

I'm not talking about panels, just bridges. It's not just one bridge
with a weird behavior but most bridges.

> Was there any progress on the generic LP11 solution, I think you did=20
> mention something was in progress ? How would that even look like ?

I had a new callback implemented:
https://lore.kernel.org/r/20240506-tc358775-fix-powerup-v1-1-545dcf00b8dd@k=
ernel.org/

Not sure if that's any better though.

-michael
