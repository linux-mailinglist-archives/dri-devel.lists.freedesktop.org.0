Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00048C818B7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 17:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB72510E2FE;
	Mon, 24 Nov 2025 16:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="H6BLeeD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A2610E03E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 16:25:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 12C114E418A0;
 Mon, 24 Nov 2025 16:25:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D41E9606FC;
 Mon, 24 Nov 2025 16:25:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D7FCB10371D9A; Mon, 24 Nov 2025 17:25:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764001549; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tvxVBfwRxr1uHgE9OqQch3oZYv9VamLw+2k4RBpB0HE=;
 b=H6BLeeD85FYduHJ7ttHrtcGUVoXtqTVunRA/p3YhZ9fh6YrgPXn3hfeF578W58CUGNrttr
 7GIoresvYjUDzJPjezURhgswlg9F8eCrSncm99ECIORfJmqyyPba5ZdBzDb3iNaQmUD5oq
 bO8KVk9C574sNKt/ytFjdS1F7Cl5Icchr0a+2CEviXZGTd3sK6YqTwWDvW4S2d3Ufr7D0w
 +M2fgj/557uUbWfn9lvM4XzRPpIKIyyUR0wHrwBSrl9al2TNH1alAS/otyDR3oUEIh66I0
 u1nvlvT9V2ZN62D3Kp3opK/sFtPDPWzQxnMvE0ZxKpW3+PKBWPlTvD2/IkO8mw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 17:25:39 +0100
Message-Id: <DEH2CVQV21Z2.25PJBAQAKFJSG@bootlin.com>
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
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-6-0db98a7fe474@bootlin.com>
 <hs44z4b2dgisemuewgtvl4epjcqqilg6cy36po25pubaog4hmq@33qgl4o3hwoa>
In-Reply-To: <hs44z4b2dgisemuewgtvl4epjcqqilg6cy36po25pubaog4hmq@33qgl4o3hwoa>
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

On Mon Nov 24, 2025 at 11:39 AM CET, Maxime Ripard wrote:
> On Wed, Nov 19, 2025 at 02:05:37PM +0100, Luca Ceresoli wrote:
>> Several drivers (about 20) follow the same pattern:
>>
>>  1. get a pointer to a bridge (typically the next bridge in the chain) b=
y
>>     calling of_drm_find_bridge()
>>  2. store the returned pointer in the private driver data, keep it until
>>     driver .remove
>>  3. dereference the pointer at attach time and possibly at other times
>>
>> of_drm_find_bridge() is now deprecated because it does not increment the
>> refcount and should be replaced with drm_of_find_bridge() +
>> drm_bridge_put().
>>
>> However some of those drivers have a complex code flow and adding a
>> drm_bridge_put() call in all the appropriate locations is error-prone,
>> leads to ugly and more complex code, and can lead to errors over time wi=
th
>> code flow changes.
>>
>> To handle all those drivers in a straightforward way, add a devm variant=
 of
>> drm_of_find_bridge() that adds a devm action to invoke drm_bridge_put()
>> when the said driver is removed. This allows all those drivers to put th=
e
>> reference automatically and safely with a one line change:
>>
>>   - priv->next_bridge =3D of_drm_find_bridge(remote_np);
>>   + priv->next_bridge =3D devm_drm_of_find_bridge(dev, remote_np);
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>
>> ---
>>  drivers/gpu/drm/drm_bridge.c | 30 ++++++++++++++++++++++++++++++
>>  include/drm/drm_bridge.h     |  5 +++++
>>  2 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index 09ad825f9cb8..c7baafbe5695 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -1446,6 +1446,36 @@ struct drm_bridge *drm_of_find_bridge(struct devi=
ce_node *np)
>>  }
>>  EXPORT_SYMBOL(drm_of_find_bridge);
>>
>> +/**
>> + * devm_drm_of_find_bridge - find the bridge corresponding to the devic=
e
>> + *			     node in the global bridge list and add a devm
>> + *			     action to put it
>> + *
>> + * @dev: device requesting the bridge
>> + * @np: device node
>> + *
>> + * On success the returned bridge refcount is incremented, and a devm
>> + * action is added to call drm_bridge_put() when @dev is removed. So th=
e
>> + * caller does not have to put the returned bridge explicitly.
>> + *
>> + * RETURNS:
>> + * drm_bridge control struct on success, NULL on failure
>> + */
>> +struct drm_bridge *devm_drm_of_find_bridge(struct device *dev, struct d=
evice_node *np)
>> +{
>> +	struct drm_bridge *bridge =3D drm_of_find_bridge(np);
>> +
>> +	if (bridge) {
>> +		int err =3D devm_add_action_or_reset(dev, drm_bridge_put_void, bridge=
);
>> +
>> +		if (err)
>> +			return ERR_PTR(err);
>> +	}
>> +
>> +	return bridge;
>> +}
>> +EXPORT_SYMBOL(devm_drm_of_find_bridge);
>
> That's inherently unsafe though, because even if the bridge is removed
> other parts of DRM might still have a reference to it and could call
> into it.
>
> We'd then have dropped our reference to the next bridge, which could
> have been freed, and it's a use-after-free.

I think you refer to this scenario:

  1. pipeline: encoder --> bridge A --> bridge B --> bridge C
  2. encoder takes a reference to bridge B
     using devm_drm_of_find_bridge() or other means
  3. bridge B takes a next_bridge reference to bridge C
     using devm_drm_of_find_bridge()
  4. encoder calls (bridge B)->foo(), which in turns references
     next_bridge, e.g.:

       b_foo() {
           bar(b->next_bridge);
       }

If bridges B and C are removed, bridge C can be freed but B is still
allocated because the encoder holds a ref. So when step 4 happens, 'b->c'
would be a use-after-free (or NULL deref if b.remove cleared it, which is
just as bad).

If I got you correctly, then I'm a bit surprised by your comment. This
series is part of the first chapter of the hotplug work, which does not aim
at fixing everything but rather at fixing one part: handle dynamic
_allocation_ lifetime of drm_bridges by adding a refcount and
drm_bridge_get/put().

Chapter 2 of the work is adding drm_bridge_enter/exit/unplug() [1] and
other changes in order to avoid code of drivers of removed bridges to
access fields they shouldn't. So the above example at point 4 would become:

       b_foo() {
           if (!drm_bridge_enter())
               return;
           bar(b->c);
           drm_bridge_exit();
       }

And that avoids 'b->c' after bridge B is removed.

Does that answer your remark?

> It's more complicated than it sounds, because we only have access to the
> drm_device when the bridge is attached, so later than probe.
>
> I wonder if we shouldn't tie the lifetime of that reference to the
> lifetime of the bridge itself, and we would give up the next_bridge
> reference only when we're destroyed ourselves.

I'm afraid I'm not following you, sorry. Do you refer to the time between
the bridge removal (driver .remove) and the last bridge put (when
deallocation happens)?

In that time frame the struct drm_bridge is still allocated along with any
next_bridge pointer it may contain, but the following bridge could have
been deallocated.

What do you mean by "give up the next_bridge"?

> Storing a list of all the references we need to drop is going to be
> intrusive though, so maybe the easiest way to do it would be to create a
> next_bridge field in drm_bridge, and only drop the reference stored
> there?
>
> And possibly tie the whole thing together using a helper?
>
> Anyway, I'm not sure it should be a prerequisite to this series. I we do
> want to go the devm_drm_of_find_bridge route however, we should at least
> document that it's unsafe, and add a TODO entry to clean up the mess
> later on.

Do you mean the drm variant is unsafe while the original
(drm_of_find_bridge() in this series, might be renamed) is not? I don't see
how that can happen.  If the driver for bridge B were to use
drm_of_find_bridge(), that driver would be responsible to
drm_bridge_put(b->next_bridge) in its .remove() function or earlier. So the
next_bridge pointing to bridge C would equally become subject to
use-after-free. devm does not make it worse, on the opposite it postpones
the drm_bridge_put(next_bridge) as late as possible: just after b.remove().

One final, high-level thought about the various 'next_bridge' pointers that
many bridge drivers have. Most of them do:

 0. have a 'struct drm_bridge next_bridge *' in their private struct
 1. take the next_bridge reference during probe or another startup phase
 2. store it in their private driver struct
 3. use it to call drm_bridge_attach
 4. (pending) put the reference to it in their .remove or earlier

I'm wondering whether we could let the DRM bridge core do it all, by
removing items 0, 1, 2 and 4, and change 3 as:

-     drm_bridge_attach(encoder, me->next_bridge, &me->bridge, flags);
+  drm_of_bridge_attach(encoder, &me->bridge, dev->of_node, 1, -1, flags);

where dev->of_node and the following integers are the same flags passed to
devm_drm_of_get_bridge() and the like, i.e. the endpoint info needed to
walk the DT graph and reach the next bridge.

This would allow the core to take care of all locking and lifetime of the
next bridge, and most (all?) bridges would never access any pointers to the
next bridge. The idea is to let the core do the right thing in a single
place instead of trying to make all drivers do the right thing (and
touching dozen files when needing to touch the logic).

That is more a long-term ideal than something I'd do right now, but having
opinions would be very interesting.

[1] https://lore.kernel.org/lkml/20251112-drm-bridge-atomic-vs-remove-v3-0-=
85db717ce094@bootlin.com/

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
