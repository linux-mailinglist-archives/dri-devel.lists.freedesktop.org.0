Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E153CB8AC2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 12:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A33410E5C3;
	Fri, 12 Dec 2025 11:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="yuwqXMqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042F510E5B9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 11:10:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8A002C1935E;
 Fri, 12 Dec 2025 11:10:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 856E9606DF;
 Fri, 12 Dec 2025 11:10:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 611F2103C8CCF; Fri, 12 Dec 2025 12:10:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765537851; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/3X8EEc6tyykk9KRGnfPo/K+yhkEmQMmHDHot2+7Nas=;
 b=yuwqXMqrgaJGhhW8bQoobyjJP9RbUmzZSOWm4cjc1NLQHYr08vytCN5Jv48v32KOvwaTes
 Dx8EvJ9M6eDUjG7CmwC+rGCxWtAvkeX9YlOSk+LFtxq91OSEyiCJ3cbYUxZ50FEfrQDQH0
 ct8Ld2omr3omI4GBepXe1IfwGz5ucd2i6H2y9nrSpUYdLjJTNVLVSCSLvugbPuLwwofJZm
 27M+qiq6jiGAU5be/zCe9b3I2rvt40psINUlleRF86ehw5CPnX/bvmnm+cykxhPoyCeA7h
 Y1Jq0Hw/La5dM26LNQRxKKS9Ffx73n/WJEqRyJEf8a70Y9KMyOBXpItndJA0EA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Dec 2025 12:10:37 +0100
Message-Id: <DEW6XHD12EY4.1THDR9UMJOTAN@bootlin.com>
Subject: Re: [PATCH 06/26] drm/bridge: add devm_drm_of_find_bridge
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>, "Alexey Brodkin"
 <abrodkin@synopsys.com>, "Phong LE" <ple@baylibre.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Anitha Chrisanthus"
 <anitha.chrisanthus@intel.com>, "Edmund Dea" <edmund.j.dea@intel.com>,
 "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maxime Ripard"
 <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-6-0db98a7fe474@bootlin.com>
 <hs44z4b2dgisemuewgtvl4epjcqqilg6cy36po25pubaog4hmq@33qgl4o3hwoa>
 <DEH2CVQV21Z2.25PJBAQAKFJSG@bootlin.com>
 <20251201-thick-jasmine-oarfish-1eceb0@houat>
 <DEVKQWH8GU0D.2NWQ1U7IOIEHI@bootlin.com>
In-Reply-To: <DEVKQWH8GU0D.2NWQ1U7IOIEHI@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Maxime,

On Thu Dec 11, 2025 at 6:47 PM CET, Luca Ceresoli wrote:
> Hi Maxime,
>
> On Mon Dec 1, 2025 at 5:51 PM CET, Maxime Ripard wrote:
>> On Mon, Nov 24, 2025 at 05:25:39PM +0100, Luca Ceresoli wrote:
>>> Hi Maxime,
>>>
>>> On Mon Nov 24, 2025 at 11:39 AM CET, Maxime Ripard wrote:
>>> > On Wed, Nov 19, 2025 at 02:05:37PM +0100, Luca Ceresoli wrote:
>>> >> Several drivers (about 20) follow the same pattern:
>>> >>
>>> >>  1. get a pointer to a bridge (typically the next bridge in the chai=
n) by
>>> >>     calling of_drm_find_bridge()
>>> >>  2. store the returned pointer in the private driver data, keep it u=
ntil
>>> >>     driver .remove
>>> >>  3. dereference the pointer at attach time and possibly at other tim=
es
>>> >>
>>> >> of_drm_find_bridge() is now deprecated because it does not increment=
 the
>>> >> refcount and should be replaced with drm_of_find_bridge() +
>>> >> drm_bridge_put().
>>> >>
>>> >> However some of those drivers have a complex code flow and adding a
>>> >> drm_bridge_put() call in all the appropriate locations is error-pron=
e,
>>> >> leads to ugly and more complex code, and can lead to errors over tim=
e with
>>> >> code flow changes.
>>> >>
>>> >> To handle all those drivers in a straightforward way, add a devm var=
iant of
>>> >> drm_of_find_bridge() that adds a devm action to invoke drm_bridge_pu=
t()
>>> >> when the said driver is removed. This allows all those drivers to pu=
t the
>>> >> reference automatically and safely with a one line change:
>>> >>
>>> >>   - priv->next_bridge =3D of_drm_find_bridge(remote_np);
>>> >>   + priv->next_bridge =3D devm_drm_of_find_bridge(dev, remote_np);
>>> >>
>>> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>> >>
>>> >> ---
>>> >>  drivers/gpu/drm/drm_bridge.c | 30 ++++++++++++++++++++++++++++++
>>> >>  include/drm/drm_bridge.h     |  5 +++++
>>> >>  2 files changed, 35 insertions(+)
>>> >>
>>> >> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_brid=
ge.c
>>> >> index 09ad825f9cb8..c7baafbe5695 100644
>>> >> --- a/drivers/gpu/drm/drm_bridge.c
>>> >> +++ b/drivers/gpu/drm/drm_bridge.c
>>> >> @@ -1446,6 +1446,36 @@ struct drm_bridge *drm_of_find_bridge(struct =
device_node *np)
>>> >>  }
>>> >>  EXPORT_SYMBOL(drm_of_find_bridge);
>>> >>
>>> >> +/**
>>> >> + * devm_drm_of_find_bridge - find the bridge corresponding to the d=
evice
>>> >> + *			     node in the global bridge list and add a devm
>>> >> + *			     action to put it
>>> >> + *
>>> >> + * @dev: device requesting the bridge
>>> >> + * @np: device node
>>> >> + *
>>> >> + * On success the returned bridge refcount is incremented, and a de=
vm
>>> >> + * action is added to call drm_bridge_put() when @dev is removed. S=
o the
>>> >> + * caller does not have to put the returned bridge explicitly.
>>> >> + *
>>> >> + * RETURNS:
>>> >> + * drm_bridge control struct on success, NULL on failure
>>> >> + */
>>> >> +struct drm_bridge *devm_drm_of_find_bridge(struct device *dev, stru=
ct device_node *np)
>>> >> +{
>>> >> +	struct drm_bridge *bridge =3D drm_of_find_bridge(np);
>>> >> +
>>> >> +	if (bridge) {
>>> >> +		int err =3D devm_add_action_or_reset(dev, drm_bridge_put_void, br=
idge);
>>> >> +
>>> >> +		if (err)
>>> >> +			return ERR_PTR(err);
>>> >> +	}
>>> >> +
>>> >> +	return bridge;
>>> >> +}
>>> >> +EXPORT_SYMBOL(devm_drm_of_find_bridge);
>>> >
>>> > That's inherently unsafe though, because even if the bridge is remove=
d
>>> > other parts of DRM might still have a reference to it and could call
>>> > into it.
>>> >
>>> > We'd then have dropped our reference to the next bridge, which could
>>> > have been freed, and it's a use-after-free.
>>>
>>> I think you refer to this scenario:
>>>
>>>   1. pipeline: encoder --> bridge A --> bridge B --> bridge C
>>>   2. encoder takes a reference to bridge B
>>>      using devm_drm_of_find_bridge() or other means
>>>   3. bridge B takes a next_bridge reference to bridge C
>>>      using devm_drm_of_find_bridge()
>>>   4. encoder calls (bridge B)->foo(), which in turns references
>>>      next_bridge, e.g.:
>>>
>>>        b_foo() {
>>>            bar(b->next_bridge);
>>>        }
>>>
>>> If bridges B and C are removed, bridge C can be freed but B is still
>>> allocated because the encoder holds a ref. So when step 4 happens, 'b->=
c'
>>> would be a use-after-free (or NULL deref if b.remove cleared it, which =
is
>>> just as bad).
>>
>> Yep.
>>
>>> If I got you correctly, then I'm a bit surprised by your comment. This
>>> series is part of the first chapter of the hotplug work, which does not=
 aim
>>> at fixing everything but rather at fixing one part: handle dynamic
>>> _allocation_ lifetime of drm_bridges by adding a refcount and
>>> drm_bridge_get/put().
>>>
>>> Chapter 2 of the work is adding drm_bridge_enter/exit/unplug() [1] and
>>> other changes in order to avoid code of drivers of removed bridges to
>>> access fields they shouldn't. So the above example at point 4 would bec=
ome:
>>>
>>>        b_foo() {
>>>            if (!drm_bridge_enter())
>>>                return;
>>>            bar(b->c);
>>>            drm_bridge_exit();
>>>        }
>>>
>>> And that avoids 'b->c' after bridge B is removed.
>>>
>>> Does that answer your remark?
>>
>> Not really. I wasn't really questionning your current focus, or the way
>> you laid out the current agenda or whatever.
>>
>> What I am questionning though is whether or not we want to introduce
>> something we will have to untangle soon, and even more so when we're not
>> mentioning it anywhere.
>>
>>> > It's more complicated than it sounds, because we only have access to =
the
>>> > drm_device when the bridge is attached, so later than probe.
>>> >
>>> > I wonder if we shouldn't tie the lifetime of that reference to the
>>> > lifetime of the bridge itself, and we would give up the next_bridge
>>> > reference only when we're destroyed ourselves.
>>>
>>> I'm afraid I'm not following you, sorry. Do you refer to the time betwe=
en
>>> the bridge removal (driver .remove) and the last bridge put (when
>>> deallocation happens)?
>>>
>>> In that time frame the struct drm_bridge is still allocated along with =
any
>>> next_bridge pointer it may contain, but the following bridge could have
>>> been deallocated.
>>>
>>> What do you mean by "give up the next_bridge"?
>>
>> What I was trying to say was that if we want to fix the problem you
>> illustrated about, we need to give up the reference at __drm_bridge_free
>> time. So each bridge having a reference to a bridge would need to do so
>> in its destroy hook.
>>
>> Since it's quite a common pattern, it would make sense to add a
>> next_bridge field to drm_bridge itself, so the core can do it
>> automatically in __drm_bridge_free if that pointer is !NULL.
>>
>> But...
>>
>>> > Storing a list of all the references we need to drop is going to be
>>> > intrusive though, so maybe the easiest way to do it would be to creat=
e a
>>> > next_bridge field in drm_bridge, and only drop the reference stored
>>> > there?
>>> >
>>> > And possibly tie the whole thing together using a helper?
>>> >
>>> > Anyway, I'm not sure it should be a prerequisite to this series. I we=
 do
>>> > want to go the devm_drm_of_find_bridge route however, we should at le=
ast
>>> > document that it's unsafe, and add a TODO entry to clean up the mess
>>> > later on.
>>
>> ... I *really* don't consider it something you need to work on right now=
.
>>
>>> Do you mean the drm variant is unsafe while the original
>>> (drm_of_find_bridge() in this series, might be renamed) is not? I
>>> don't see how that can happen. If the driver for bridge B were to use
>>> drm_of_find_bridge(), that driver would be responsible to
>>> drm_bridge_put(b->next_bridge) in its .remove() function or earlier.
>>> So the next_bridge pointing to bridge C would equally become subject
>>> to use-after-free.
>>
>> No, I was saying that both are equally unsafe. But we're adding a new,
>> broken, helper, and we don't mention anywhere that it is. So what I was
>> saying is mostly do we really want to introduce some more broken code
>> when we know it is. And if we do, we should be really clear about it.
>>
>>> devm does not make it worse, on the opposite it postpones the
>>> drm_bridge_put(next_bridge) as late as possible: just after
>>> b.remove().
>>
>> Which doesn't really change anything, does it? I'd expect the window
>> between the remove and final drm_bridge_put to be much wider than the
>> execution time of remove itself.
>>
>>> One final, high-level thought about the various 'next_bridge' pointers =
that
>>> many bridge drivers have. Most of them do:
>>>
>>>  0. have a 'struct drm_bridge next_bridge *' in their private struct
>>>  1. take the next_bridge reference during probe or another startup phas=
e
>>>  2. store it in their private driver struct
>>>  3. use it to call drm_bridge_attach
>>>  4. (pending) put the reference to it in their .remove or earlier
>>>
>>> I'm wondering whether we could let the DRM bridge core do it all, by
>>> removing items 0, 1, 2 and 4, and change 3 as:
>>>
>>> -     drm_bridge_attach(encoder, me->next_bridge, &me->bridge, flags);
>>> +  drm_of_bridge_attach(encoder, &me->bridge, dev->of_node, 1, -1, flag=
s);
>>>
>>> where dev->of_node and the following integers are the same flags passed=
 to
>>> devm_drm_of_get_bridge() and the like, i.e. the endpoint info needed to
>>> walk the DT graph and reach the next bridge.
>>>
>>> This would allow the core to take care of all locking and lifetime of t=
he
>>> next bridge, and most (all?) bridges would never access any pointers to=
 the
>>> next bridge. The idea is to let the core do the right thing in a single
>>> place instead of trying to make all drivers do the right thing (and
>>> touching dozen files when needing to touch the logic).
>>>
>>> That is more a long-term ideal than something I'd do right now, but hav=
ing
>>> opinions would be very interesting.
>>
>> That was pretty much my point, yeah.
>>
>> Maxime
>
> Let me recap this discussion, because there are various aspects and I nee=
d
> to clarify by view on it.
>
> First: the problem you discuss is about drm_of_find_bridge() introduced i=
n
> patch 1. The devm variant is just equally affected.
>
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

Ah, I realied I'm wrong here. Your proposal is to put the reference at
__drm_bridge_free time, not a release time. So yes, it would work. At least
for the simple cases, where there's only the next_bridge pointer stored.

> Additionally, as a matter of fact there are currently drivers storing
> bridge pointers. The next_bridge is the most common case. Code using
> drm_bridge_connector_init() for example can store up to eight of them, bu=
t
> individual drivers are the hardest to hunt for.
>
> I can see these (potential) tools to handle this (not mutually exclusive)=
:
>
>  1. remove drm_bridge pointers pointing to other bridges
>  2. check whether a bridge (say B) still exists before any dereference
>     to B->another_bridge: that's drm_bridge_enter/exit()
>  3. let owners of bridge pointers be notified when a bridge is unplugged,
>     so they can actively put their reference and clear their pointer
>
> For item 1, I think the drm_of_bridge_attach() idea quoted above would
> work, at least for the simple cases where bridge drivers use the
> next_bridge only for attach. A next_bridge pointer in struct drm_bridge i=
s
> not even needed in that case, the pointer would be computed from OF when
> needed and not stored. I can do an experiment and send a first series, do
> you think it would be useful?

I had a look and, while the implementation should be simple, only a few
drivers could benefit right now. The majority fall into one of these
categories:

 * drivers using drm_of_find_panel_or_bridge() or *_of_get_bridge()
   (maybe 60-80% of all drivers, those will have to wait for the panel
   improvements)
 * drivers using the next_bridge pointer for more than just attach
 * drivers doing more complicated stuff

I think your "put next_bridge in __drm_bridge_free" idea would fit well the
2nd category and perhaps also the 1st one. For the 3rd category we'd need
something different, e.g. a per-driver .destroy callback.

So, while your idea would work, it would avoid use-after-free but not
prevent calls into a bridge code after the bridge is removed, which is, in
the best case, useless. I still think we should aim at avoiding the
dereferences to even happen, so my 3 ideas above still look to me important
to evaluate.

> For item 2, I still think it would just work for cases not (or not yet)
> covered by item 1. Given the same example as above:
>
>         b_foo() {
>             if (!drm_bridge_enter())
>                 return;
>             bar(b->c);
>             drm_bridge_exit();
>         }
>
> drm_bridge_enter() will prevent doing anything on b->whatever, including
> any stale pointers. The idea is "I, bridge B, have been unplugged, my
> resources are not reliably usable, keep out!". No?
>
> However item 2 won't prevent the caller from keeping the pointer for a lo=
ng
> time, especially if b_foo() is a void function so it cannot return anythi=
ng
> saying "I was unplugged, I'm no longer theree". And that's where item 3
> (notifiers) might come in useful: upon receiving a bridge removal
> notification any driver or other code is in a position to actively put it=
s
> reference to the bridge and clear its pointer. I had proposed something i=
n
> [0], which can likely be improved, but it is useful in my current draft
> solution.
>
> I'd like to know your opinions about the above points, so we can
> progressively clarify the path forward.
>
> PS: I just realized about a fourth option: a revocable [1] (thanks Lauren=
t
> who pointed me to it). That's basically a wrapper around a pointer that
> allows to guard from accessing it when the pointed object is gone. To me =
it
> looks somewhat equivalent to drm_bridge_enter/exit() but with very
> different APIs. I still haven't looked at the details.
>
> [0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-12-9d6f2c=
9c3058@bootlin.com/
> [1] https://lore.kernel.org/lkml/20251016054204.1523139-2-tzungbi@kernel.=
org/#t

Luca


--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
