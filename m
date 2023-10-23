Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A9D7D2C5F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 10:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3624A10E173;
	Mon, 23 Oct 2023 08:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4E810E171;
 Mon, 23 Oct 2023 08:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1698048858; x=1729584858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DJIoa1RTdkD1fSp9jZLaNJ/hvLsWUoMLsm3c5R90P60=;
 b=eGSpmkGzO9PFVeozpRj/50Xr3ZwB9ZALnkK3/qJfAQd2exqwWR4n75uy
 cFvEUgdPMXjFmyH2MAMp4bhdSs951/UMy94Z2fhEKlCQCPvZrxq8PFsfa
 ut54NwJuv2jJ+13T7JBCqWk/iCvUZi6SUQSczrVljuScHiWKEHZtCmiQ/
 PvD7DI99ICHcXB3rP2uSpkhF+a08dHgDVUvC7rjea99D3nToc8tIjcIvf
 H6Tyw76DYFLlesqRdkdIvwj0diGzqgHC4QDwR/Mxy7lH5L2yHfd6+fmF9
 0ncG/k46/El8NbKxEeMcVbXcB7BLg+Wvl+6axgaeju6ggsU9fb4xp6caK g==;
X-IronPort-AV: E=Sophos;i="6.03,244,1694728800"; d="scan'208";a="33594481"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 23 Oct 2023 10:14:16 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9B66028007F;
 Mon, 23 Oct 2023 10:14:15 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
Date: Mon, 23 Oct 2023 10:14:18 +0200
Message-ID: <3266380.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAA8EJpofiawC5z3jw1-TsxS+ZWz4QobCby3kScDDdk9Z-74mgQ@mail.gmail.com>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
 <1871104.tdWV9SEqCh@steina-w>
 <CAA8EJpofiawC5z3jw1-TsxS+ZWz4QobCby3kScDDdk9Z-74mgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Maxime Ripard <mripard@kernel.org>, Marek Vasut <marex@denx.de>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-arm-msm@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, 23. Oktober 2023, 09:34:42 CEST schrieb Dmitry Baryshkov:
> On Mon, 23 Oct 2023 at 09:52, Alexander Stein
>=20
> <alexander.stein@ew.tq-group.com> wrote:
> > Hi Dmitry,
> >=20
> > Am Sonntag, 22. Oktober 2023, 12:49:41 CEST schrieb Dmitry Baryshkov:
> > > On Thu, 19 Oct 2023 at 14:42, Alexander Stein
> > >=20
> > > <alexander.stein@ew.tq-group.com> wrote:
> > > > Hi,
> > > >=20
> > > > Am Donnerstag, 19. Oktober 2023, 13:19:51 CEST schrieb Dmitry=20
Baryshkov:
> > > > > On Thu, 19 Oct 2023 at 12:26, Maxime Ripard <mripard@kernel.org>=
=20
wrote:
> > > > > > On Mon, Oct 16, 2023 at 07:53:48PM +0300, Dmitry Baryshkov wrot=
e:
> > > > > > > The MIPI DSI links do not fully fall into the DRM callbacks
> > > > > > > model.
> > > > > >=20
> > > > > > Explaining why would help
> > > > >=20
> > > > > A kind of explanation comes afterwards, but probably I should cha=
nge
> > > > > the order of the phrases and expand it:
> > > > >=20
> > > > > The atomic_pre_enable / atomic_enable and correspondingly
> > > > > atomic_disable / atomic_post_disable expect that the bridge links
> > > > > follow a simple paradigm: either it is off, or it is on and
> > > > > streaming
> > > > > video. Thus, it is fine to just enable the link at the enable tim=
e,
> > > > > doing some preparations during the pre_enable.
> > > > >=20
> > > > > But then it causes several issues with DSI. First, some of the DSI
> > > > > bridges and most of the DSI panels would like to send commands ov=
er
> > > > > the DSI link to setup the device. Next, some of the DSI hosts have
> > > > > limitations on sending the commands. The proverbial sunxi DSI host
> > > > > can
> > > > > not send DSI commands after the video stream has started. Thus mo=
st
> > > > > of
> > > > > the panels have opted to send all DSI commands from pre_enable (or
> > > > > prepare) callback (before the video stream has started).
> > > > >=20
> > > > > However this leaves no good place for the DSI host to power up the
> > > > > DSI
> > > > > link. By default the host's pre_enable callback is called after t=
he
> > > > > DSI bridge's pre_enable. For quite some time we were powering up =
the
> > > > > DSI link from mode_set. This doesn't look fully correct. And also=
 we
> > > > > got into the issue with ps8640 bridge, which requires for the DSI
> > > > > link
> > > > > to be quiet / unpowered at the bridge's reset time.
> > > >=20
> > > > There are also bridges (e.g. tc358767) which require DSI-LP11 upon
> > > > bridge
> > > > reset. And additionally this DSI-(e)DP bridge requires LP11 while
> > > > accessing
> > > > DP-AUX channel, e.g. reading EDID. So bridges need at least some
> > > > control
> > > > over DSI line state.
> > >=20
> > > For sending commands in LP11 it is typical to toggle the
> > > MIPI_DSI_MODE_LPM flag, for example see panel-=3Djdi-lt070me05000.c or
> > > some other drives. It might be a good idea to make that more explicit.
> > > All suggestions here would be appreciated.
> >=20
> > The biggest difference between that display and the tc358767 bridge is
> > that
> > the display uses DSI commands, while the bridge is using i2c transfer to
> > issue DP-AUX commands. There is no host_transfer [1] which would enable
> > LP-11. It seems this DSI-DP bridge requires LP-11/HS on DSI lanes all
> > times. This contradicts current Linux behaviour.
>=20
> I see. I took a quick glance at the driver. Does the device mark AUX
> as busy when there is a HS transfer?
> Because otherwise it might be pretty hard to synchronise DP-AUX
> transfers with the DSI link state. We might need to add an API for
> this, if the DSI hosts actually can signal the blanking / DSI LP.

I don't see that a synchronization would be required. AUX should be=20
independent from DSI transfers. ASFAICS the bridge internals just requires =
DSI=20
lines to be LP-00 or HS for AUX channel to be functioning.

>=20
> Side note: the driver needs some care. It doesn't support the aux-bus
> bindings for eDP panels, it doesn't support other bridges on top of DP
> connectors (but there can be e..g. dp-connector device).

I don't think that this is necessary as you add an optional endpoint to por=
t2=20
which will then add an eDP display panel bridge. This should then handle au=
x-
bus bindings.

Best regards,
Alexander

> > Best regards,
> > Alexander
> >=20
> > [1]
> > https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#mipi-ds=
i-> > bridge-operation


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


