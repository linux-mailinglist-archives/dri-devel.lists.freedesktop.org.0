Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90782A21C79
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B6410E035;
	Wed, 29 Jan 2025 11:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hP3ltSKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7FC10E035
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:51:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F4294427C;
 Wed, 29 Jan 2025 11:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738151511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/dtdtAqW4QEmrAdXfRHJqeqI55Av04tfH1TTwtge4Q=;
 b=hP3ltSKAWYzIflmKjO+mNQ5s1A/kE5qfNlSiukluqHAzQ7UVRBEmfUxQnyP3DCP0HflJAg
 JM+VWTLdar6gVgvAsQJpm8pzckCrcaZmUW9h6+pLAyMMd6tyV5og2W8M2dsPyX7bjsg9RZ
 8GrHlCQqMvc1qpUvpTVlnz3pyabn/cvu/sBTADGjWs2dBxcLExzPcoSC4rMQOqFs/6SIno
 Mds/5iucfRjmcXfZYjvVRN7N16EICapKeQ0nQuqyGq0Lqybta3SeDWTQrKfgBarrykGCW0
 zBmwvXxpOQbTCcWCiZnDrbsY3zkHWp+hjBhlf3cVvEK9BftnZujKh+1vvV0YAg==
Date: Wed, 29 Jan 2025 12:51:46 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Simona Vetter
 <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, Paul
 Kocialkowski <contact@paulk.fr>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
Message-ID: <20250129125146.22981c9f@booty>
In-Reply-To: <ksxomce6vddld7vikzyjd55babho63vj6ej5vrsiwfp2tid6yu@xfpagqpata4v>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
 <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
 <20250102130149.5784c09b@booty> <20250110115819.55bc887b@booty>
 <20250116113236.39ba876a@booty>
 <20250116-brave-feathered-dormouse-8ea4cf@houat>
 <20250121122729.41c8f2b1@booty>
 <ksxomce6vddld7vikzyjd55babho63vj6ej5vrsiwfp2tid6yu@xfpagqpata4v>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemiegtgedvmeehjedvsgemvdekgeehmegtsgguugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemiegtgedvmeehjedvsgemvdekgeehmegtsgguugdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehlihhnrghrohdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhp
 dhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhg
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

Hello Maxime,

thanks for the continued feedback.

On Tue, 28 Jan 2025 16:09:53 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> To be clear, I'm not sure it's worth renaming drm_bridge to something
> else, and I certainly don't consider it is a prerequisite to this
> series.

Sure, I agree.

> > > > For hotplugging we cannot use drmm and devm and instead we use get/put,
> > > > to let the "next bridge" disappear with the previous one still present.
> > > > So the trivial idea is to add a drm_of_get_bridge(), similar to
> > > > {drmm,devm_drm}_of_get_bridge() except it uses plain
> > > > drm_panel_bridge_add() instead of devm/drmm variants. But then the
> > > > caller (which is the panel consumer) will have to dispose of the struct
> > > > drm_bridge pointer by calling:
> > > > 
> > > >  - drm_bridge_put() in case a)
> > > >  - drm_panel_bridge_remove in case b)
> > > > 
> > > > And that's the problem I need to solve.    
> > > 
> > > I'm not sure the problem is limited to panel_bridge. Your question is
> > > essentially: how do I make sure a driver-specific init is properly freed
> > > at drm_bridge_put time. This was done so far mostly at bridge remove
> > > time, but we obviously can't do that anymore.
> > > 
> > > But we'd have the same issue if, say, we needed to remove a workqueue
> > > from a driver.
> > > 
> > > I think we need a destroy() hook for bridges, just like we have for
> > > connectors for example that would deal with calling
> > > drm_panel_bridge_remove() if necessary, or any other driver-specific
> > > sequence.  
> > 
> > The .destroy hook looked appealing at first, however as I tried to
> > apply the idea to bridges I'm not sure it matches. Here's why.
> > 
> > The normal (and sane) flow for a bridge is:
> > 
> >  A) probe
> >     1. allocate private struct embedding struct drm_bridge
> >        (I have an _alloc() variant ready for v5 to improve this as you proposed)
> >     2. get resources, initialize struct fields
> >     3. drm_bridge_add(): publish bridge into global bridge_list
> > 
> > Now the bridge can be found and pointers taken and used.  
> 
> We agree so far.

Good :-)

> > And on hardware removal, in reverse order:
> >  
> >  B) remove (hardware is hot-unplugged)
> >     3. unpublish bridge
> >     2. release resources, cleanup
> >     1. kfree private struct  
> 
> I think the sequence would rather be something like:
> 
> B') remove
>   3. unpublish bridge
>   2. release device resources
>   1. release reference
> 
> C') last put
>   2. release KMS resources
>   1. kfree private struct

Just to ensure we are on the same page: patch 3 is already implementing
this model except for C'2.

Well, in reality it even implements a .destroy callback at C'2, even
though it was not meant for the usage you have in mind and it's
scheduled for removal in v6 -- even though as I said I'm OK in
re-adding it if it is useful.

Mainly I'm not sure I understand for which ultimate goal you propose to
postpone releasing KMS resources to C'.

Is it (1) because we _want_ to postpone releasing KMS resources? In this
case I don't know the use case, so if you have a practical example it
would probably help a lot.

Moreover, for the panel bridge specifically, it would mean postponing
the destruction of the struct panel_bridge, which however has a pointer
to the panel. But the panel is probably hot-unplugged at the same time
as the previous removable bridge(s), we'd have a time window between B'
and C' where there is a pointer to a freed struct panel. We'd need to
ensure that pointer is cleared at B'2, even though it is a "KMS
resource" and not a "device resource".

Or is it (2) because there are cases where we don't know how else we
could release the KMS resources? AFAIK all bridge drivers are able to
release everything in their remove function (B'2) with the exception of
the panel bridge, so this sounds like a workaround for just one user
that apparently we all agree should be improved on its own anyway.

Note I'm not strongly against (2), if it simplifies the path towards
dynamic bridge lifetime by postponing the panel bridge rework. I just
need to understand the plan.

Another question is what is a device resource and what is a KMS
resource. What's the boolean expression to classify a
resource in one or the other family? For example, in your example
quoted above ("But we'd have the same issue if, say, we needed to
remove a workqueue from a driver"), is the workqueue a KMS resource?

I need to understand your idea if I want to implement it.

> > Some drivers do real stuff in B2, so it is important that B3 happens
> > before B2, isn't it? We don't want other drivers to find and use a
> > bridge that is being dismantled, or afterwards.  
> 
> Yeah, B3/B'3 should definitely happen first.
> 
> > B3 should normally happen by removing the bridge from the global
> > bridge_list, or other bridges might find it. However setting the "gone"
> > bool and teaching of_drm_find_bridge() & Co to skip bridges with
> > gone==true would allow to postpone the actual removal, if needed.
> > 
> > With that said, with hotplugging there will be two distinct events:
> > 
> >  * hardware removal
> >  * last ref is put
> > 
> > The second event could happen way later than the first one. During the
> > time frame between the two events we need the bridge to be unpublished
> > and the bridge resources to be already released, as the hardware is
> > gone. We cannot do this at the last put, it's too late.
> > 
> > So I think the only sane sequence is:
> > 
> >  * on hardware removal:
> >      B3) unpublish bridge (drm_bridge_remove() or just set gone flag)
> >      B2) free resources, deinit whatever needed
> >  * when last ref is put
> >      B1) kfree (likely via devm)  
> 
> No, devm will have destroyed it in B'2. We need to destroy it in the
> cleanup hook of kref_put

devm will have destroyed what? Sorry I'm not following.

If you mean "it" == "the private struct", then no, this is not the
case. drm_bridge_init in patch 3 does not kfree the private struct but
instead registers a devm action to call drm_bridge_put. Then, at the
last put, drm_bridge_free() will actually kfree the private struct.

In this v5, kree()ing the private struct at the last put is done via
a callback. In my work towards v6 the principle is the same but I have
reworked it all, implementing a devm_drm_bridge_alloc() macro as you
suggested (BTW that was a great improvement, thanks) and removing the
.destroy callback as it was not needed.

In case it helps, here's a preview of my v6, with some added comments to
support this discussion:

/* Internal function (for refcounted bridges) */
void __drm_bridge_free(struct kref *kref)
{
        struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
        void *container = ((void*)bridge) - bridge->container_offset;

        DRM_DEBUG("bridge=%p, container=%p FREE\n", bridge, container);

        kfree(container);
}
EXPORT_SYMBOL(__drm_bridge_free);

static inline void drm_bridge_put(struct drm_bridge *bridge)
{
        if (!drm_bridge_is_refcounted(bridge))
                return;

        DRM_DEBUG("bridge=%p PUT\n", bridge);

        kref_put(&bridge->refcount, __drm_bridge_free);
}

static void drm_bridge_put_void(void *data)
{
        struct drm_bridge *bridge = (struct drm_bridge *)data;

        drm_bridge_put(bridge);
}

// fold this into __devm_drm_bridge_alloc() or keep for consistency
// with drm_encoder.c?
static int __devm_drm_bridge_init(struct device *dev, struct drm_bridge *bridge,
                                  size_t offset, const struct drm_bridge_funcs *funcs)
{
        int err;

        bridge->container_offset = offset;
        kref_init(&bridge->refcount);
        bridge->is_refcounted = 1;

        err = devm_add_action_or_reset(dev, drm_bridge_put_void, bridge); // <== devm just puts one ref, does not kfree
        if (err)
                return err;

        bridge->funcs = funcs;

        return 0;
}

void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
                              const struct drm_bridge_funcs *funcs)
{
        void *container;
        struct drm_bridge *bridge;
        int ret;

        if (!funcs) {
                dev_warn(dev, "Missing funcs pointer\n");
                return ERR_PTR(-EINVAL);
        }

        container = kzalloc(size, GFP_KERNEL);     // <== NOT allocating with devm
        if (!container)
                return ERR_PTR(-ENOMEM);

        bridge = container + offset;

        ret = __devm_drm_bridge_init(dev, bridge, offset, funcs);
        if (ret)
                return ERR_PTR(ret);

        DRM_DEBUG("bridge=%p, container=%p, funcs=%ps ALLOC\n", bridge, container, funcs);

        return container;
}
EXPORT_SYMBOL(__devm_drm_bridge_alloc);

#define devm_drm_bridge_alloc(dev, type, member, funcs) \
        ((type *)__devm_drm_bridge_alloc(dev, sizeof(type), \
                                         offsetof(type, member), funcs))

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
