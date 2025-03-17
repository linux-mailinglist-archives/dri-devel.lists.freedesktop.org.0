Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580D1A65486
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 15:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8429110E420;
	Mon, 17 Mar 2025 14:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DhsqW4O5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9079210E41F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:56:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3826A44506;
 Mon, 17 Mar 2025 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742223396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JGjlD+25ZYp6Q0sXslSJnQKxDiIMOCrG9dG5z8czd8I=;
 b=DhsqW4O5BbANASpxQ+2/vWUHSOJ8GXuJSEII9XHEX9wlU6VzkzzCv+m6KjnS3qBqTLwTuj
 P0SmUqDUlHc7cm4mfw0RsbjJtqWtnZ064vPHqEPggpsJ9RIjQazf81uEorR4xeHM7dUigB
 3oWz70/+v+kFfAtLtQUaSpkik2ftSBMf955XWPhCe1WzGkR9IXacbkdmmMFZa1MB5eN/mE
 s+PiJnx+pjR5qI1P9pf1xbZJADlLGAalKbJkvokld/4VgaUQRiOOKGdDHWKAe/csf6spWd
 ypr+gF1LgMKooTGpg+/wHkJ1cL92FK7kqLAv6toK8jTc2yG6iN2ijDztpWLEDQ==
Date: Mon, 17 Mar 2025 15:56:30 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Marek Vasut <marex@denx.de>, Stefan Agner
 <stefan@agner.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 02/11] drm/bridge: add support for refcounting
Message-ID: <20250317155630.020881e2@booty>
In-Reply-To: <20250314-amorphous-congenial-woodlouse-f50bde@houat>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
 <20250314-drm-bridge-refcount-v7-2-152571f8c694@bootlin.com>
 <20250314-amorphous-congenial-woodlouse-f50bde@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrr
 hhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
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

thanks for the very prompt feedback!

On Fri, 14 Mar 2025 19:04:40 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Fri, Mar 14, 2025 at 11:31:15AM +0100, Luca Ceresoli wrote:
> > DRM bridges are currently considered as a fixed element of a DRM card, and
> > thus their lifetime is assumed to extend for as long as the card
> > exists. New use cases, such as hot-pluggable hardware with video bridges,
> > require DRM bridges to be added to and removed from a DRM card without
> > tearing the card down. This is possible for connectors already (used by DP
> > MST), it is now needed for DRM bridges as well.
> > 
> > As a first preliminary step, make bridges reference-counted to allow a
> > struct drm_bridge (along with the private driver structure embedding it) to
> > stay allocated even after the driver has been removed, until the last
> > reference is put.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > Changes in v7:
> >  - export drm_bridge_put_void
> >  - struct drm_bridge: use container pointer instead of container_offset
> >  - remove drm_bridge_is_refcounted()
> >  - remove all DRM_DEBUG()s
> >  - drm_bridge_get/put: accept NULL pointer and return the bridge pointer to
> >    allow pass-through calls
> >  - extract to separate patches:
> >     - the addition of drm_bridge_alloc
> >     - the addition of drm_bridge_get/put() to drm_bridge_add/remove()
> >     - the addition of drm_bridge_get/put() to drm_bridge_attach/detach()
> >  - fix a typo, slightly improve kerneldoc
> > 
> > Changes in v6:
> >  - use drm_warn, not WARN_ON (Jani Nikula)
> >  - Add devm_drm_bridge_alloc() to replace drm_bridge_init() (similar to
> >    drmm_encoder_alloc)
> >  - Remove .destroy func: deallocation is done via the struct offset
> >    computed by the devm_drm_bridge_alloc() macro
> >  - use fixed free callback, as the same callback is used in all cases
> >    anyway (remove free_cb, add bool is_refcounted)
> >  - add drm_bridge_get/put() to drm_bridge_attach/detach() (add the bridge
> >    to a list)
> >  - make some DRM_DEBUG() strings more informative
> > 
> > This patch was added in v5.
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 33 +++++++++++++++-
> >  include/drm/drm_bridge.h     | 91 ++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 123 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 96df717b2caeb41d45346ded576eaeb2806fd051..2ba0dac9bfc2dfd709d5e2457d69067c7324972c 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -199,23 +199,54 @@
> >  static DEFINE_MUTEX(bridge_lock);
> >  static LIST_HEAD(bridge_list);
> >  
> > +void __drm_bridge_free(struct kref *kref)
> > +{
> > +	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
> > +
> > +	kfree(bridge->container);
> > +}
> > +EXPORT_SYMBOL(__drm_bridge_free);
> > +
> > +/**
> > + * drm_bridge_put_void - wrapper to drm_bridge_put() taking a void pointer
> > + *
> > + * @data: pointer to @struct drm_bridge, cast to a void pointer
> > + *
> > + * Wrapper of drm_bridge_put() to be used when a function taking a void
> > + * pointer is needed, for example as a devm action.
> > + */
> > +void drm_bridge_put_void(void *data)
> > +{
> > +	struct drm_bridge *bridge = (struct drm_bridge *)data;
> > +
> > +	drm_bridge_put(bridge);
> > +}
> > +EXPORT_SYMBOL(drm_bridge_put_void);
> > +
> >  void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
> >  			      const struct drm_bridge_funcs *funcs)
> >  {
> >  	void *container;
> >  	struct drm_bridge *bridge;
> > +	int err;
> >  
> >  	if (!funcs) {
> >  		dev_warn(dev, "Missing funcs pointer\n");
> >  		return ERR_PTR(-EINVAL);
> >  	}
> >  
> > -	container = devm_kzalloc(dev, size, GFP_KERNEL);
> > +	container = kzalloc(size, GFP_KERNEL);
> >  	if (!container)
> >  		return ERR_PTR(-ENOMEM);
> >  
> >  	bridge = container + offset;
> > +	bridge->container = container;
> >  	bridge->funcs = funcs;
> > +	kref_init(&bridge->refcount);
> > +
> > +	err = devm_add_action_or_reset(dev, drm_bridge_put_void, bridge);
> > +	if (err)
> > +		return ERR_PTR(err);
> >  
> >  	return container;
> >  }
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index dae463b30542d586a595b67f7bdf5a5e898e9572..5c1e2b9cafb12eb429d1f5d3ef312e6cf9b54f47 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -840,6 +840,17 @@ struct drm_bridge {
> >  	const struct drm_bridge_timings *timings;
> >  	/** @funcs: control functions */
> >  	const struct drm_bridge_funcs *funcs;
> > +
> > +	/**
> > +	 * @container: Pointer to the private driver struct embedding this
> > +	 * @struct drm_bridge.
> > +	 */
> > +	void *container;  
> 
> newline here
> 
> > +	/**
> > +	 * @refcount: reference count of users referencing this bridge.
> > +	 */
> > +	struct kref refcount;
> > +
> >  	/** @driver_private: pointer to the bridge driver's internal context */
> >  	void *driver_private;
> >  	/** @ops: bitmask of operations supported by the bridge */
> > @@ -941,6 +952,82 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
> >  	return container_of(priv, struct drm_bridge, base);
> >  }
> >  
> > +void __drm_bridge_free(struct kref *kref);
> > +
> > +/**
> > + * drm_bridge_get - Acquire a bridge reference
> > + * @bridge: DRM bridge
> > + *
> > + * This function increments the bridge's refcount.
> > + *
> > + * Returns:
> > + * Pointer to @bridge.
> > + */
> > +static inline struct drm_bridge *drm_bridge_get(struct drm_bridge *bridge)
> > +{
> > +	if (!bridge)
> > +		return bridge;
> > +
> > +	kref_get(&bridge->refcount);
> > +
> > +	return bridge;
> > +}
> > +
> > +/**
> > + * drm_bridge_put - Release a bridge reference
> > + * @bridge: DRM bridge
> > + *
> > + * This function decrements the bridge's reference count and frees the
> > + * object if the reference count drops to zero.
> > + *
> > + * See also drm_bridge_put_and_clear() which is more handy in many cases.
> > + *
> > + * Returns:
> > + * Pointer to @bridge.
> > + */
> > +static inline struct drm_bridge *drm_bridge_put(struct drm_bridge *bridge)
> > +{
> > +	if (!bridge)
> > +		return bridge;
> > +
> > +	kref_put(&bridge->refcount, __drm_bridge_free);
> > +
> > +	return bridge;
> > +}  
> 
> I'm not sure we discussed it already, but why do you need to put both
> drm_bridge_get and drm_bridge_put into the header, and thus export
> __drm_bridge_free?
> 
> I'd expect both to be in drm_bridge.c?

I don't think we had discussed this before. There is no strong reason,
just a few small ones, and one is related to the DRM_DEBUG() calls that
I have removed from this series, so it's fine to move back
drm_bridge_get/put() in the .c file, and make __drm_bridge_free()
private again.

> > +/**
> > + * drm_bridge_put_and_clear - Given a bridge pointer, clear the pointer
> > + *                            then put the bridge
> > + *
> > + * @bridge_pp: pointer to pointer to a struct drm_bridge
> > + *
> > + * Helper to put a DRM bridge (whose pointer is passed), but only after
> > + * setting its pointer to NULL. Useful for drivers having struct drm_bridge
> > + * pointers they need to dispose of, without leaving a use-after-free
> > + * window where the pointed bridge might have been freed while still
> > + * holding a pointer to it.
> > + *
> > + * For example a driver having this private struct::
> > + *
> > + *     struct my_bridge {
> > + *         struct drm_bridge *remote_bridge;
> > + *         ...
> > + *     };
> > + *
> > + * can dispose of remote_bridge using::
> > + *
> > + *     drm_bridge_put_and_clear(&my_bridge->remote_bridge);
> > + */
> > +static inline void drm_bridge_put_and_clear(struct drm_bridge **bridge_pp)
> > +{
> > +	struct drm_bridge *bridge = *bridge_pp;
> > +
> > +	*bridge_pp = NULL;
> > +	drm_bridge_put(bridge);
> > +}  
> 
> I'm not convinced we need that one for now, and it doesn't look like
> there's a user for it in your series, so I'd rather introduce it once we
> actually need it.

Indeed, that's a leftover I missed when extracting this series for the
branch with the entire work. I'm definitely removing it in the next
iteration.

> >  void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
> >  			      const struct drm_bridge_funcs *funcs);
> >  
> > @@ -951,6 +1038,10 @@ void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
> >   * @member: the name of the &drm_bridge within @type
> >   * @funcs: callbacks for this bridge
> >   *
> > + * The returned refcount is initialized to 1.  
> 
> I'm confused, there's no returned refcount here? Or did you mean the
> returned bridge refcount?

Indeed, good catch!

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
