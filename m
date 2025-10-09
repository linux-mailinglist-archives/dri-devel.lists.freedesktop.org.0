Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D514BBC99BC
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 16:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7DB10EA7A;
	Thu,  9 Oct 2025 14:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RppZRULH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFB310EA7A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 14:48:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A9657C035A6;
 Thu,  9 Oct 2025 14:48:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 333FB6062C;
 Thu,  9 Oct 2025 14:48:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5B9FE102F21E6; 
 Thu,  9 Oct 2025 16:48:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760021318; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2BXVPAf+Zyjz0Z65WvQt1vEXD+kLBRlZ5SJ4YbUfsYs=;
 b=RppZRULHTtjGtOvaMPzcHof8Owz1eSQfVHq0um03NJL6V6LEHhA+NXJ623g/lUDJZaRb1l
 dGrshILqhUXpOcLyyk/NtbMza0iT+cNkKL8dEltUz4jcI9uDWX59dS2FREdz9GLMzhZzCi
 XA13DALSFN+dr5oIVfdWEflaqISj3LNGOhs/8mg2t8etSEiesdeIs+nI5YSdwvGKx4TgQA
 0Myq/Hjh0vEZMvXNKbLJ8Pyb/4U8DETnITVS+A3ljmt3vscZpdCtJ/gggVZIHF9qrQssQh
 zdSR0OVWmjqq5GyfFUExBhE5x79dFFNkRRZvfx/lx/w/JkLFUH134vbVEaa6gA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 16:48:25 +0200
Message-Id: <DDDVHDWG1Y0R.3NFMCH6135JMP@bootlin.com>
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov" <lumag@kernel.org>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Maxime Ripard" <mripard@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
 <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
 <20250820131302.6a2da5ef@booty>
 <20250827-charming-arcane-stingray-cfb8b6@houat>
 <20250908154906.16693078@booty>
 <20250910-glittering-serval-of-piety-b32844@houat>
 <20250910184752.6c42f004@booty> <20250915-benign-rare-marmot-9fbb96@penduick>
 <20250915165156.35378299@booty>
 <20251007-charming-successful-foxhound-1ca192@penduick>
In-Reply-To: <20251007-charming-successful-foxhound-1ca192@penduick>
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

On Tue Oct 7, 2025 at 5:09 PM CEST, Maxime Ripard wrote:
>> > First off, why do we need to have drm_bridge_unplug and
>> > drm_bridge_remove separate?
>> >
>> > If we were to mirror drm_dev_enter and drm_dev_unplug, drm_dev_unplug
>> > calls drm_dev_unregister itself, and I can't find a reason where we
>> > might want to split the two.
>>
>> I think it could make sense and I'm definitely open to it.
>>
>> After a quick analysis I have mostly one concern. Calls
>> to drm_bridge_add() and drm_bridge_remove() are balanced in current
>> code and that's very intuitive. If drm_bridge_unplug() were to call
>> drm_bridge_remove(), that symmetry would disappear. Some drivers would
>> still need to call drm_bridge_remove() directly (e.g. the DSI host
>> drivers which _add/remove() in the DSI attach/detach callbacks), while
>> other wouldn't because drm_bridge_unplug() would do that.
>>
>> What do you think about this?
>
> Which DSI host do you have in mind there? Because it's really not what
> we document.

Most DSI host drivers (but not all). I did a classification a few months
ago (~v6.15) and found that the following drivers do the same
(drm_bridge_add in the DSI host attach callback, drm_bridge_remove in the
DSI host detach callback):

     drivers/gpu/drm/bridge/samsung-dsim.c           (see below)
     drivers/gpu/drm/vc4/vc4_dsi.c
     drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
     drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
     drivers/gpu/drm/mediatek/mtk_dsi.c
     drivers/gpu/drm/bridge/tc358768.c
     drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
     drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
     drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
     drivers/gpu/drm/adp/adp-mipi.c

while these do differently:

   - drm_bridge_add/remove() in driver probe/remove:
       drivers/gpu/drm/omapdrm/dss/dsi.c
       drivers/gpu/drm/bridge/nwl-dsi.c
   - drm_bridge_add/remove() in component_ops.bind/unbind:
       drivers/gpu/drm/mcde/mcde_dsi.c

I had sent a patch to change this in the samsung-dsim driver a while ago:
https://lore.kernel.org/lkml/20250725-drm-bridge-samsung-dsim-add-in-probe-=
v1-1-b23d29c23fbd@bootlin.com/

However your review to that patch suggested to me that you consider OK what
samsung-dsim and most other DSI host drivers currently do (but it's being
discussed in the above-linked thread, I'd say let's keep it there).

Now I am confused. Do you mean that those drivers' DSI host detach callback
should call drm_bridge_unplug(), which in turn would call
drm_bridge_remove()?

I was assuming drm_bridge_unplug() would always be called in the driver
.remove callback.

>> Another concern I initially had is about drivers whose usage of
>> drm_bridge is more complex than the average. Most simple drivers just
>> call drm_bridge_remove() in their .remove callback and that's
>> straightforward. I was suspicious about drivers such as
>> imx8qxp-pixel-combiner which instantiate multiple bridges, and whether
>> they need do all the drm_bridge_unplug()s before all the
>> drm_bridge_remove()s. However I don't think that's a real need because,
>> except for probe and removal, operations on bridges happen on a
>> per-bridge basis, so each bridge is independent from others, at least
>> for the driver I mentioned.
>
> In this particular case, they would be unplugged all at the same time,
> right? In which case, we would disable all the bridges starting from the
> one in the chain that just got removed, and then we just have to remove
> all of them.
>
> All in all, I think it's ok to somewhat break things here: all this was
> broken before.

...

> If we want to bring some consistency, we will have to
> reduce what bridges are allowed to do. Let's figure out something that
> works for all reasonable cases (straightforward, component framework,
> DSI device, DSI host, and DSI device on another bus), and the hacky
> drivers will move eventually.

I agree with the principle in the quoted lines. But I'm not sure exactly
which "something that works for all reasonable cases" you are suggesting:
moving drm_bridge_remove() inside drm_bridge_unplug()?

> That's pretty easy to solve with a documentation update :)
>
> We can just further restrict the order in which

Oops, unfinished sentence?

>> > > static void sn65dsi83_atomic_disable()
>> > > {
>> > > 	if (!drm_bridge_enter(bridge, &idx))
>> > > 		return;
>> > >
>> > > 	/* These 3 lines will be replaced by devm_release_action() */
>> > > 	ctx->disable_resources_needed =3D false;
>> > > 	sn65dsi83_monitor_stop(ctx);
>> > > 	regulator_disable(ctx->vcc);
>> > >
>> > > 	drm_bridge_exit(idx);
>> > > }
>> > >
>> > > Here the xyz_disable() in my pseudocode is the sn65dsi83_monitor_sto=
p()
>> > > + regulator_disable().
>> > >
>> > > If sn65dsi83_remove() and sn65dsi83_atomic_disable() were to happen
>> > > concurrently, this sequence of events could happen:
>> > >
>> > > 1. atomic_disable:  drm_bridge_enter() -> OK, can go
>> > > 2. remove:          drm_bridge_remove()
>> > > 3. remove:          sn65dsi83_monitor_stop()
>> > > 4. remove:          regulator_disable()
>> > > 5. remove:          drm_bridge_unplug() -- too late to stop atomic_d=
isable
>> >
>> > drm_dev_unplug would also get delayed until drm_dev_exit is called,
>> > mitigating your issue here.
>>
>> I don't think I got what you mean. With the above code the regulator
>> would still be subject to an en/disable imbalance.
>
> My point was that drm_bridge_remove wouldn't be allowed to execute until
> after atomic_disable has called drm_bridge_exit. So we wouldn't have the
> sequence of events you described. atomic_disable would disable the
> bridge, and then drm_bridge_remove wouln't have anything to disable
> anymore by the time it runs.

Ah, I think you was reasoning about the case with drm_bridge_remove()
called by drm_bridge_unplug(). If that's the case, yes, that's probably
right, e.g. with this drm_bridge_unplug() implementation:

void drm_bridge_unplug(struct drm_bridge *bridge)
{
	bridge->unplugged =3D true;

	synchronize_srcu(&drm_bridge_unplug_srcu);

	drm_bridge_remove();
}

Oh, wow, this looks suspiciourly similar to drm_dev_unplug(). ;)

>> However I realized the problem does not exist when using devres,
>> because devres itself takes care of executing each release function only
>> once, by means of a spinlock.
>>
>> I think using devres actually solves my concerns about removal during
>> atomic[_post]_disable, but also for the atomic[_pre]_enable and other
>> call paths. Also, I think it makes the question of which goes first
>> (drm_bridge_unplug() or _remove()) way less relevant.
>>
>> The concern is probably still valid for drivers which don't use devres.
>> However the concern is irrelevant until there is a need for a bridge to
>> become hot-pluggable. At that point a driver needs to either move to
>> devres or take other actions to avoid incurring in the same issue.
>
> I disagree with that statement. We never considered !devres as outdated,
> and thus we need to support both. Especially if it's about races we know
> about in a code path we might never run.

I didn't mean that, sorry if I was not clear.

I was meaning: for drivers which don't care about supporting hotplug, this
whole discussion is quite irrelevant. Those which will need to support
hotplug will have to ensure to release device resources exactly once, and
can do that either using devres or by other means.

>> > Another thing that just crossed my mind is why we don't call
>> > atomic_disable when we're tearing down the bridge too. We're doing it
>> > for the main DRM devices, it would make sense to me to disable the
>> > encoder -> bridge -> connector (and possibly CRTC) chain if we remove =
a
>> > bridge automatically.
>>
>> Uh, interesting idea.
>>
>> Do you mean something like:
>>
>> void drm_bridge_unplug(struct drm_bridge *bridge)
>> {
>>     bridge->unplugged =3D true;
>>     synchronize_srcu(&drm_bridge_unplug_srcu);
>>
>>     drm_bridge_remove(bridge); // as per discussion above
>>
>>     drm_atomic_helper_shutdown(bridge->dev);
>> }
>>
>> ?
>>
>> I'm not sure which is the right call to tear down the pipeline though.
>
> No, the shutdown needs to happen before marking the bridge unplugged,
> otherwise you'll never run the disable callbacks.

OK.

> And we probably shouldn't disable the whole device, just everything from
> the CRTC that feeds the bridge.

OK, I'll need to figure out how todo that exactly. If you have hints, that
would be great.

Anyway I think it's better to do this in steps: first introduce
drm_bridge_unplug() as discussed, and at a later step augment it to disable
the involved pipeline components on bridge removal. Sounds good?

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
