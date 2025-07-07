Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15CCAFB090
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 11:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FE010E32A;
	Mon,  7 Jul 2025 09:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mBG3URH1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEB010E32A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 09:59:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0881143AE7;
 Mon,  7 Jul 2025 09:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751882356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aIuFlXWrcDzU9uPaQKpuqpy2rjs9RFnhUBtYgzbA9Uw=;
 b=mBG3URH1EKrJK/9byvkOGEmzsn5QyyDPOXTERmFclarapjywrB5Ah/7q0/VWSw891BpwKx
 +WNhSstAtb7CxvRolX4NhkLoD9a/2uSR9bqPPYbAzoWbauQh8VSe4H1H+MbrTEyZqK1O/G
 aB7gyHekMQ4lpJMEjLm9b891iOEF2t347myivgB/xdfAvJTxf2cl5FcrwAezoadPE4ZuXA
 lkLxaoL1olalS+IE4775uYeMfrtHbTmYU9mIEO/r+e8pmCTLrh41gi0ko8Zn/btNUyipKK
 0zm2Z3OBL6X5F+UVmOIuwHsNwN5oc4ObAM3f8WW5Fc3/ZOmt/+vR3JtxocCPZg==
Date: Mon, 7 Jul 2025 11:58:53 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Inki Dae
 <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 00/32] drm/mipi-dsi: avoid DSI host drivers to have
 pointers to DSI devices
Message-ID: <20250707115853.128f2e6f@booty>
In-Reply-To: <20250707-strange-warm-bear-cb4ee8@houat>
References: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
 <20250707-strange-warm-bear-cb4ee8@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefudehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvgeejjeevhefhiefgffethfdtieffheefvedtgeekteejffdtvedugeeihfdvkeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeekjedruddvtddrvddukedrvddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekjedruddvtddrvddukedrvddtjedphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghir
 hhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
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

On Mon, 7 Jul 2025 08:16:49 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi Luca,
>=20
> On Wed, Jun 25, 2025 at 06:45:04PM +0200, Luca Ceresoli wrote:
> > This series is the first attempt at avoiding DSI host drivers to have
> > pointers to DSI devices (struct mipi_dsi_device), as discussed during t=
he
> > Linux Plumbers Conference 2024 with Maxime and Dmitry.
> >=20
> > It is working, but I consider this a draft in order to discuss and
> > challenge the proposed approach.
> >=20
> > Overall work
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > This is part of the work towards removal of bridges from a still existi=
ng
> > DRM pipeline without use-after-free. The grand plan as discussed in [1].
> > Here's the work breakdown (=E2=9E=9C marks the current series):
> >=20
> >  1. =E2=80=A6 add refcounting to DRM bridges (struct drm_bridge)
> >     (based on devm_drm_bridge_alloc() [0])
> >     A. =E2=9C=94 add new alloc API and refcounting (in v6.16-rc1)
> >     B. =E2=9C=94 convert all bridge drivers to new API (now in drm-misc=
-next)
> >     C. =E2=9C=94 kunit tests (now in drm-misc-next)
> >     D. =E2=80=A6 add get/put to drm_bridge_add/remove() + attach/detach=
()
> >          and warn on old allocation pattern (under review)
> >     E. =E2=80=A6 add get/put on drm_bridge accessors
> >        1. =E2=80=A6 drm_bridge_chain_get_first_bridge() + add a cleanup=
 action
> >        2. =E2=80=A6 drm_bridge_chain_get_last_bridge()
> >        3. drm_bridge_get_prev_bridge()
> >        4. drm_bridge_get_next_bridge()
> >        5. drm_for_each_bridge_in_chain()
> >        6. drm_bridge_connector_init
> >        7. of_drm_find_bridge
> >        8. drm_of_find_panel_or_bridge, *_of_get_bridge
> >     F. debugfs improvements
> >  2. handle gracefully atomic updates during bridge removal
> >  3. =E2=9E=9C avoid DSI host drivers to have dangling pointers to DSI d=
evices
> >       (this series)
> >  4. finish the hotplug bridge work, removing the "always-disconnected"
> >     connector, moving code to the core and potentially removing the
> >     hotplug-bridge itself (this needs to be clarified as points 1-3 are
> >     developed)
> >=20
> > [0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc=
1e629b715ea3d1ba537ef2da95eec
> > [1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2=
c9c3058@bootlin.com/t/#u
> >=20
> > Motivation
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > The motivation for this series is that with hot-pluggable hardware a DSI
> > device can be disconnected from the DSI host at runtime, and later on
> > reconnected, potentially with a different model having different bus
> > parameters.
> >=20
> > DSI host drivers currently receive a struct mipi_dsi_device pointer in =
the
> > attach callback and some store it permanently for later access to the b=
ur
> > format data (lanes, channel, pixel format etc). The stored pointer can
> > become dangling if the device is removed, leading to a use-after-free.
> >=20
> > Currently the data exchange between DSI host and device happens primari=
ly
> > by two means:
> >=20
> >  * the device requests attach, detach and message transfer to the host =
by
> >    calling mipi_dsi_attach/detach/transfer which in turn call the callb=
acks
> >    in struct mipi_dsi_host_ops
> >     - for this to work, struct mipi_dsi_device has a pointer to the hos=
t:
> >       this is OK because the goal is supporting hotplug of the "remote"
> >       part of the DRM pipeline
> >  * the host accesses directly the fields of struct mipi_dsi_device, to
> >    which it receives a pointer in the .attach and .detach callbacks
> >=20
> > The second bullet is the problematic one, which we want to remove.
> >=20
> > Strategy
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > I devised two possible strategies to address it:
> >=20
> >  1. change the host ops to not pass a struct mipi_dsi_device, but inste=
ad
> >     to pass only a copy of the needed information (bus format mainly), =
so
> >     the host driver does never access any info from the device
> >    =20
> >  2. let the host get info from the device as needed, but without having=
 a
> >     pointer to it; this is be based on:
> >      - storing a __private mipi_dsi_device pointer in struct mipi_dsi_h=
ost
> >      - adding getters to the DSI core for the host to query the needed
> >        info, e.g. drm_mipi_dsi_host_get_device_lanes(host) (the getters
> >        would be allowed to dereference the device pointer)
> >=20
> > This series implements strategy 1. It does so by adding a .attach_new h=
ost
> > op, which does not take a mipi_dsi_device pointer, and converting most =
host
> > drivers to it. Once all drivers are converted, the old op can be remove=
d,
> > and .attach_new renamed to .attach. =20
>=20
> I don't recall discussing this particular aspect at Plumbers, so sorry
> if we're coming back to the same discussion we had.
>=20
> I'm not necessarily opposed to changing the MIPI-DSI bus API, but I
> don't think changing the semantics to remove the fact that a particular
> device is connected or not is a good idea.
>=20
> I would have expected to have bus driver (maybe) take a device pointer
> at attach, and drop it at detach.
>=20
> Then, when we detect the hotplug of a DSI device, we detach it from its
> parent, and we're done.
>=20
> What prevents us from using that approach?

I probably should have done a recap of the whole discussion, so let me
do it now.

It all starts with one fact: a DSI device can be disconnected and then
a different one connected later on, having a different DSI bus format
(lanes, channel, mode flags, whatever). A detach/attach sequence would
handle that, but only in the simple case when there is a host/device
pair. Let's how consider this topology:
                                                     =20
                =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90                 =20
                =E2=94=82    DSI bridge    =E2=94=82                 =20
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=90  A  =E2=94=82                  =E2=94=82  B  =E2=
=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
=E2=94=82 DSI host=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BA=E2=
=94=82device        host=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=
=BA=E2=94=82DSI device =E2=94=82
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=98     =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98     =E2=94=94=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=98
                                                     =20
Here link A is always connected, link B is hot-pluggable. When the tail
device is removed and a different one plugged, a detach/attach sequence
can update the bus format on the DSI bridge, but then the DSI bridge
cannot update the format on the first host without faking a
detach/attach that does not map a real event.

The above topology is probably not common, but it is exactly what the
hotplug-bridge introduces [0]. Whether the hotplug-bridge will have to
eventually exist or not to support hotplug is still to be defined, but
regardless there is another problematic aspect.

The second problematic aspect is that several DSI host drivers will not
even drm_bridge_add() until they have an attached DSI device. One such
example is samsung-dsim, which calls drm_bridge_add()
in samsung_dsim_host_attach(). When such a driver implements the first
DSI host, the DSI bridge must register a DSI device before the DRM card
can be instantiated. See the lengthy comment before
hotplug_bridge_dsi_attach() in [0] for more gory details, but the
outcome is that the hotplug-bridge needs to attach a DSI device with
a fake format once initially just to let the DRM card probe, and the
detach and reattach with the correct format once an actual DSI device
is connected at the tail.

[0] https://lore.kernel.org/all/20240917-hotplug-drm-bridge-v4-4-bc4dfee61b=
e6@bootlin.com/

The above would be improved if the DSI host API provided a way to
notify to the host about a bus format change, which is however not
present currently.

The naive solution would be adding a new DSI host op:

 struct mipi_dsi_host_ops {
 	int (*attach)(struct mipi_dsi_host *host,
 		      struct mipi_dsi_device *dsi);
 	int (*detach)(struct mipi_dsi_host *host,
 		      struct mipi_dsi_device *dsi);
+	int (*bus_fmt_changed)(struct mipi_dsi_host *host,
+ 		      struct mipi_dsi_device *dsi);
 	ssize_t (*transfer)(struct mipi_dsi_host *host,
 			    const struct mipi_dsi_msg *msg);
 };

This would allow reduce the current sequence:
 1. attach with dummy format (no tail device yet)
 2. fake detach
 3. attach

with:
 1. attach with dummy format (no tail device yet)
 2. update format

Adding such a new op would be part of chapter 4 of this work, being it
quite useless without hotplug.

However while reasoning about this I noticed the DSI host drivers peek
into the struct mipi_dsi_device fields to read the format, so there is
no sort of isolation between host and device. Introducing a struct to
contain all the format fields looked like a good improvement in terms
of code organization.

Yet another aspect is that several host drivers keep a pointer to the
device, and thus in case of format change in the DSI device they might
be reading different fields at different moments, ending up with an
inconsistent format.

The above considerations, which are all partially overlapped, led me to
the idea of introducing a struct to exchange a DSI bus format, to be
exchanged as a whole ("atomically") between host and device. What's
your opinion about introducing such a struct?

The second aspect of this series is not passing pointers, and that's
the core topic you questioned. I realize it is not strictly necessary
to reach the various goals discussed in this e-mail. The work I'm doing
on the drm_bridge struct is actually a way to store a pointer while
avoiding use-after-free, so that can obviously be done for a simpler
scenario such as DSI host-device. However I thought not passing a
pointer would be a more radical solution: if a driver receives no
pointer, then it cannot by mistake keep it stored when it shouldn't,
maybe in a rare case within a complex driver where it is hard to spot.

I'll be OK to change the approach and keep the pointer passed in the
attach/detach ops, if that is the best option. However I'd like to have
your opinion about the above topics before working towards that
direction, and ensure I fully grasp the usefulness of keeping the
pointer.

Post scriptum. The very initial issue that led to all this discussion
when writing the hotplug-bridge driver is that the samsung-dsim driver
will not drm_bridge_add() until a DSI device does .attach to it. Again,
see the comments before hotplug_bridge_dsi_attach() in [0] for details.
However by re-examining the driver for the N-th time now from a new
POV, I _think_ this is not correct and potentially easy to solve. But this =
leads to one fundamental question:


--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
