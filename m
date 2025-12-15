Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF9CBD384
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC15310E3BE;
	Mon, 15 Dec 2025 09:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lCeLZTg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366DF10E3BE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:41:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C1FB643B3B;
 Mon, 15 Dec 2025 09:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B94C4CEF5;
 Mon, 15 Dec 2025 09:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765791696;
 bh=GqFjpeKbwehHYCQiMOCgga5Bu4WqgBffv9KfGv+EhwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lCeLZTg30SMtgvXrpCRx0jVSZyNtOaofPTfYtdRE6mnVilf6rYt//2g/QUdtLBlbm
 6yv0cgEQ2L/m0C1l6Dtav00z7rp54JYWTRzARrYfDyiB6C0VkfOr+uDA8phG4pU25H
 k+Xm6ZvRSQ+HffU5zoAChQEvB4ZtGrrP+d2YzyDFdxR+Nqyy6wNECJ8tsPVr9w/Ebn
 7SVY42J2UKLofNup0N+GdfN0WiDYDxesFdhTbOvDMlvYdq75D3952yy0qc1NKkt2g0
 BNP8Awk66fadGUltMOjoBC+d/rkX+O6bt+uD6m6tdpg2yjqzr2NTKAeJY/4wyUyCzk
 9Arq3M18EKfpA==
Date: Mon, 15 Dec 2025 10:41:32 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>,
 Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 06/26] drm/bridge: add devm_drm_of_find_bridge
Message-ID: <20251215-magnetic-stoic-okapi-d40cc1@penduick>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-6-0db98a7fe474@bootlin.com>
 <hs44z4b2dgisemuewgtvl4epjcqqilg6cy36po25pubaog4hmq@33qgl4o3hwoa>
 <DEH2CVQV21Z2.25PJBAQAKFJSG@bootlin.com>
 <20251201-thick-jasmine-oarfish-1eceb0@houat>
 <DEVKQWH8GU0D.2NWQ1U7IOIEHI@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="q7zxny2nvplgmjkn"
Content-Disposition: inline
In-Reply-To: <DEVKQWH8GU0D.2NWQ1U7IOIEHI@bootlin.com>
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


--q7zxny2nvplgmjkn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 06/26] drm/bridge: add devm_drm_of_find_bridge
MIME-Version: 1.0

On Thu, Dec 11, 2025 at 06:47:37PM +0100, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> On Mon Dec 1, 2025 at 5:51 PM CET, Maxime Ripard wrote:
> > On Mon, Nov 24, 2025 at 05:25:39PM +0100, Luca Ceresoli wrote:
> >> Hi Maxime,
> >>
> >> On Mon Nov 24, 2025 at 11:39 AM CET, Maxime Ripard wrote:
> >> > On Wed, Nov 19, 2025 at 02:05:37PM +0100, Luca Ceresoli wrote:
> >> >> Several drivers (about 20) follow the same pattern:
> >> >>
> >> >>  1. get a pointer to a bridge (typically the next bridge in the cha=
in) by
> >> >>     calling of_drm_find_bridge()
> >> >>  2. store the returned pointer in the private driver data, keep it =
until
> >> >>     driver .remove
> >> >>  3. dereference the pointer at attach time and possibly at other ti=
mes
> >> >>
> >> >> of_drm_find_bridge() is now deprecated because it does not incremen=
t the
> >> >> refcount and should be replaced with drm_of_find_bridge() +
> >> >> drm_bridge_put().
> >> >>
> >> >> However some of those drivers have a complex code flow and adding a
> >> >> drm_bridge_put() call in all the appropriate locations is error-pro=
ne,
> >> >> leads to ugly and more complex code, and can lead to errors over ti=
me with
> >> >> code flow changes.
> >> >>
> >> >> To handle all those drivers in a straightforward way, add a devm va=
riant of
> >> >> drm_of_find_bridge() that adds a devm action to invoke drm_bridge_p=
ut()
> >> >> when the said driver is removed. This allows all those drivers to p=
ut the
> >> >> reference automatically and safely with a one line change:
> >> >>
> >> >>   - priv->next_bridge =3D of_drm_find_bridge(remote_np);
> >> >>   + priv->next_bridge =3D devm_drm_of_find_bridge(dev, remote_np);
> >> >>
> >> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >> >>
> >> >> ---
> >> >>  drivers/gpu/drm/drm_bridge.c | 30 ++++++++++++++++++++++++++++++
> >> >>  include/drm/drm_bridge.h     |  5 +++++
> >> >>  2 files changed, 35 insertions(+)
> >> >>
> >> >> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bri=
dge.c
> >> >> index 09ad825f9cb8..c7baafbe5695 100644
> >> >> --- a/drivers/gpu/drm/drm_bridge.c
> >> >> +++ b/drivers/gpu/drm/drm_bridge.c
> >> >> @@ -1446,6 +1446,36 @@ struct drm_bridge *drm_of_find_bridge(struct=
 device_node *np)
> >> >>  }
> >> >>  EXPORT_SYMBOL(drm_of_find_bridge);
> >> >>
> >> >> +/**
> >> >> + * devm_drm_of_find_bridge - find the bridge corresponding to the =
device
> >> >> + *			     node in the global bridge list and add a devm
> >> >> + *			     action to put it
> >> >> + *
> >> >> + * @dev: device requesting the bridge
> >> >> + * @np: device node
> >> >> + *
> >> >> + * On success the returned bridge refcount is incremented, and a d=
evm
> >> >> + * action is added to call drm_bridge_put() when @dev is removed. =
So the
> >> >> + * caller does not have to put the returned bridge explicitly.
> >> >> + *
> >> >> + * RETURNS:
> >> >> + * drm_bridge control struct on success, NULL on failure
> >> >> + */
> >> >> +struct drm_bridge *devm_drm_of_find_bridge(struct device *dev, str=
uct device_node *np)
> >> >> +{
> >> >> +	struct drm_bridge *bridge =3D drm_of_find_bridge(np);
> >> >> +
> >> >> +	if (bridge) {
> >> >> +		int err =3D devm_add_action_or_reset(dev, drm_bridge_put_void, b=
ridge);
> >> >> +
> >> >> +		if (err)
> >> >> +			return ERR_PTR(err);
> >> >> +	}
> >> >> +
> >> >> +	return bridge;
> >> >> +}
> >> >> +EXPORT_SYMBOL(devm_drm_of_find_bridge);
> >> >
> >> > That's inherently unsafe though, because even if the bridge is remov=
ed
> >> > other parts of DRM might still have a reference to it and could call
> >> > into it.
> >> >
> >> > We'd then have dropped our reference to the next bridge, which could
> >> > have been freed, and it's a use-after-free.
> >>
> >> I think you refer to this scenario:
> >>
> >>   1. pipeline: encoder --> bridge A --> bridge B --> bridge C
> >>   2. encoder takes a reference to bridge B
> >>      using devm_drm_of_find_bridge() or other means
> >>   3. bridge B takes a next_bridge reference to bridge C
> >>      using devm_drm_of_find_bridge()
> >>   4. encoder calls (bridge B)->foo(), which in turns references
> >>      next_bridge, e.g.:
> >>
> >>        b_foo() {
> >>            bar(b->next_bridge);
> >>        }
> >>
> >> If bridges B and C are removed, bridge C can be freed but B is still
> >> allocated because the encoder holds a ref. So when step 4 happens, 'b-=
>c'
> >> would be a use-after-free (or NULL deref if b.remove cleared it, which=
 is
> >> just as bad).
> >
> > Yep.
> >
> >> If I got you correctly, then I'm a bit surprised by your comment. This
> >> series is part of the first chapter of the hotplug work, which does no=
t aim
> >> at fixing everything but rather at fixing one part: handle dynamic
> >> _allocation_ lifetime of drm_bridges by adding a refcount and
> >> drm_bridge_get/put().
> >>
> >> Chapter 2 of the work is adding drm_bridge_enter/exit/unplug() [1] and
> >> other changes in order to avoid code of drivers of removed bridges to
> >> access fields they shouldn't. So the above example at point 4 would be=
come:
> >>
> >>        b_foo() {
> >>            if (!drm_bridge_enter())
> >>                return;
> >>            bar(b->c);
> >>            drm_bridge_exit();
> >>        }
> >>
> >> And that avoids 'b->c' after bridge B is removed.
> >>
> >> Does that answer your remark?
> >
> > Not really. I wasn't really questionning your current focus, or the way
> > you laid out the current agenda or whatever.
> >
> > What I am questionning though is whether or not we want to introduce
> > something we will have to untangle soon, and even more so when we're not
> > mentioning it anywhere.
> >
> >> > It's more complicated than it sounds, because we only have access to=
 the
> >> > drm_device when the bridge is attached, so later than probe.
> >> >
> >> > I wonder if we shouldn't tie the lifetime of that reference to the
> >> > lifetime of the bridge itself, and we would give up the next_bridge
> >> > reference only when we're destroyed ourselves.
> >>
> >> I'm afraid I'm not following you, sorry. Do you refer to the time betw=
een
> >> the bridge removal (driver .remove) and the last bridge put (when
> >> deallocation happens)?
> >>
> >> In that time frame the struct drm_bridge is still allocated along with=
 any
> >> next_bridge pointer it may contain, but the following bridge could have
> >> been deallocated.
> >>
> >> What do you mean by "give up the next_bridge"?
> >
> > What I was trying to say was that if we want to fix the problem you
> > illustrated about, we need to give up the reference at __drm_bridge_free
> > time. So each bridge having a reference to a bridge would need to do so
> > in its destroy hook.
> >
> > Since it's quite a common pattern, it would make sense to add a
> > next_bridge field to drm_bridge itself, so the core can do it
> > automatically in __drm_bridge_free if that pointer is !NULL.
> >
> > But...
> >
> >> > Storing a list of all the references we need to drop is going to be
> >> > intrusive though, so maybe the easiest way to do it would be to crea=
te a
> >> > next_bridge field in drm_bridge, and only drop the reference stored
> >> > there?
> >> >
> >> > And possibly tie the whole thing together using a helper?
> >> >
> >> > Anyway, I'm not sure it should be a prerequisite to this series. I w=
e do
> >> > want to go the devm_drm_of_find_bridge route however, we should at l=
east
> >> > document that it's unsafe, and add a TODO entry to clean up the mess
> >> > later on.
> >
> > ... I *really* don't consider it something you need to work on right no=
w.
> >
> >> Do you mean the drm variant is unsafe while the original
> >> (drm_of_find_bridge() in this series, might be renamed) is not? I
> >> don't see how that can happen. If the driver for bridge B were to use
> >> drm_of_find_bridge(), that driver would be responsible to
> >> drm_bridge_put(b->next_bridge) in its .remove() function or earlier.
> >> So the next_bridge pointing to bridge C would equally become subject
> >> to use-after-free.
> >
> > No, I was saying that both are equally unsafe. But we're adding a new,
> > broken, helper, and we don't mention anywhere that it is. So what I was
> > saying is mostly do we really want to introduce some more broken code
> > when we know it is. And if we do, we should be really clear about it.
> >
> >> devm does not make it worse, on the opposite it postpones the
> >> drm_bridge_put(next_bridge) as late as possible: just after
> >> b.remove().
> >
> > Which doesn't really change anything, does it? I'd expect the window
> > between the remove and final drm_bridge_put to be much wider than the
> > execution time of remove itself.
> >
> >> One final, high-level thought about the various 'next_bridge' pointers=
 that
> >> many bridge drivers have. Most of them do:
> >>
> >>  0. have a 'struct drm_bridge next_bridge *' in their private struct
> >>  1. take the next_bridge reference during probe or another startup pha=
se
> >>  2. store it in their private driver struct
> >>  3. use it to call drm_bridge_attach
> >>  4. (pending) put the reference to it in their .remove or earlier
> >>
> >> I'm wondering whether we could let the DRM bridge core do it all, by
> >> removing items 0, 1, 2 and 4, and change 3 as:
> >>
> >> -     drm_bridge_attach(encoder, me->next_bridge, &me->bridge, flags);
> >> +  drm_of_bridge_attach(encoder, &me->bridge, dev->of_node, 1, -1, fla=
gs);
> >>
> >> where dev->of_node and the following integers are the same flags passe=
d to
> >> devm_drm_of_get_bridge() and the like, i.e. the endpoint info needed to
> >> walk the DT graph and reach the next bridge.
> >>
> >> This would allow the core to take care of all locking and lifetime of =
the
> >> next bridge, and most (all?) bridges would never access any pointers t=
o the
> >> next bridge. The idea is to let the core do the right thing in a single
> >> place instead of trying to make all drivers do the right thing (and
> >> touching dozen files when needing to touch the logic).
> >>
> >> That is more a long-term ideal than something I'd do right now, but ha=
ving
> >> opinions would be very interesting.
> >
> > That was pretty much my point, yeah.
> >
> > Maxime
>=20
> Let me recap this discussion, because there are various aspects and I need
> to clarify by view on it.
>=20
> First: the problem you discuss is about drm_of_find_bridge() introduced in
> patch 1. The devm variant is just equally affected.
>=20
> You proposed adding a next_bridge field in struct drm_bridge so there is =
an
> automated, common call to drm_bridge_put() (and setting it to NULL). It
> would remove some burden on individual drivers of course, but I don't thi=
nk
> it would solve the problem. In the same scenario we are discussing
> (i.e. encoder --> bridge A --> bridge B --> bridge C, then B+C get remove=
d)
> B's next_bridge would be automatically put, but the encoder could still
> call B->foo(), which could still do B->next_bridge.

I mean, yes, that's what we have drm_bridge_enter and _exit for.
B->next_bridge would still be valid, but we also still would have a
reference to C so I'm not sure what the big deal is?

> Additionally, as a matter of fact there are currently drivers storing
> bridge pointers. The next_bridge is the most common case. Code using
> drm_bridge_connector_init() for example can store up to eight of them, but
> individual drivers are the hardest to hunt for.

That's fine, we can have a custom destroy hook for those.

> I can see these (potential) tools to handle this (not mutually exclusive):
>=20
>  1. remove drm_bridge pointers pointing to other bridges
>  2. check whether a bridge (say B) still exists before any dereference
>     to B->another_bridge: that's drm_bridge_enter/exit()
>  3. let owners of bridge pointers be notified when a bridge is unplugged,
>     so they can actively put their reference and clear their pointer
>=20
> For item 1, I think the drm_of_bridge_attach() idea quoted above would
> work, at least for the simple cases where bridge drivers use the
> next_bridge only for attach. A next_bridge pointer in struct drm_bridge is
> not even needed in that case, the pointer would be computed from OF when
> needed and not stored. I can do an experiment and send a first series, do
> you think it would be useful?
>=20
> For item 2, I still think it would just work for cases not (or not yet)
> covered by item 1. Given the same example as above:
>=20
>         b_foo() {
>             if (!drm_bridge_enter())
>                 return;
>             bar(b->c);
>             drm_bridge_exit();
>         }
>=20
> drm_bridge_enter() will prevent doing anything on b->whatever, including
> any stale pointers. The idea is "I, bridge B, have been unplugged, my
> resources are not reliably usable, keep out!". No?

Yes.

> However item 2 won't prevent the caller from keeping the pointer for a lo=
ng
> time, especially if b_foo() is a void function so it cannot return anythi=
ng
> saying "I was unplugged, I'm no longer theree".

Indeed.

> And that's where item 3 (notifiers) might come in useful: upon
> receiving a bridge removal notification any driver or other code is in
> a position to actively put its reference to the bridge and clear its
> pointer. I had proposed something in [0], which can likely be
> improved, but it is useful in my current draft solution.
>=20
> I'd like to know your opinions about the above points, so we can
> progressively clarify the path forward.

I largely agree with everything you said, but that wasn't my point at
the beginning of the discussion though. My point was that you're giving
away the reference too soon with devm_drm_of_find_bridge (or by doing it
in remove).

> PS: I just realized about a fourth option: a revocable [1] (thanks Laurent
> who pointed me to it). That's basically a wrapper around a pointer that
> allows to guard from accessing it when the pointed object is gone. To me =
it
> looks somewhat equivalent to drm_bridge_enter/exit() but with very
> different APIs. I still haven't looked at the details.

Yeah, a revocable pointer would work too. It will be a pain to implement
in C though.

Maxime

--q7zxny2nvplgmjkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaT/XzAAKCRAnX84Zoj2+
dgU5AYCQnXiDBShmtaxgPVbAk2v3TTOA9/0pliYs5Sg9kGt7P2fH6rIV2LpOjfZF
Z7WW0+4Bf1NrQFLW4bIFEL8tjpmH6MUGS+2+5zoxDsBaNIF+yY9VHRDCHLVtdJE+
FTtYP2JZJQ==
=/vkp
-----END PGP SIGNATURE-----

--q7zxny2nvplgmjkn--
