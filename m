Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1777ABA00A
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 17:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1337810EAFE;
	Fri, 16 May 2025 15:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ic8/mJM5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A19410EAFE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 15:38:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76DEB43965;
 Fri, 16 May 2025 15:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747409913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+g3IdGvcfrmRH4F4rawwQsSgXUu5S0J2PdLVNQvNPs=;
 b=ic8/mJM5ChESit1NZjJEPl8fCMX5fTQ9Nv7DTLDz9siekasP2HvEHm/uq/oyGqiJySBvMy
 5IBHfiZHo/0v9sMM1mhKF/zB8f4Hmhtr8t5HyS3V83CFv4WVuJvRGFCsGVkw2mikxSg8Yh
 9GkgXILZqtxMfMm15eWMAVWintdVsgl2mYUxjYwyzaTgcNWD1N4c4Axb3gy72Fkv14uK9Q
 YIs28qPOMogVyCbYfxGolDdG4dWMflTrBpXC3T19jcfPWc6pTGRdHGs5yDDtZPMgQJ9IGY
 xnHir0H9pmYUhv9qkqi1qgNCGr+YBPL/JJxc/Uex8ymp0dU1bsGqUbuaD7WMxA==
Date: Fri, 16 May 2025 17:38:28 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Anusha Srivatsa
 <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, Dmitry
 Baryshkov <lumag@kernel.org>, =?UTF-8?B?SGVydsOp?= Codina
 <herve.codina@bootlin.com>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] drm/tests: bridge: add a KUnit test for
 devm_drm_bridge_alloc()
Message-ID: <20250516173828.7f1aa70c@booty>
In-Reply-To: <gqe4ov7w54qe7mmfn2ud63g2ema2wh3qvyfvcaycvnh5mts3it@ef7qxryo2ccy>
References: <20250409-drm-bridge-alloc-doc-test-v7-0-a3ca4b97597f@bootlin.com>
 <20250409-drm-bridge-alloc-doc-test-v7-2-a3ca4b97597f@bootlin.com>
 <20250414-misty-hungry-woodlouse-dbbd64@houat>
 <20250415132214.19b1a4ff@booty>
 <gqe4ov7w54qe7mmfn2ud63g2ema2wh3qvyfvcaycvnh5mts3it@ef7qxryo2ccy>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheplefhudeuffegvefhvdeuueekkeetgeehffehgeehheetvddtudettedvtefggeeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptggrthhirhgtlhhoghhsrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidri
 hhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
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

Hi Maxime,

On Thu, 15 May 2025 10:11:33 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Tue, Apr 15, 2025 at 01:22:14PM +0200, Luca Ceresoli wrote:
> > > > +/*
> > > > + * Mimick the typical struct defined by a bridge driver, which embeds a
> > > > + * bridge plus other fields.
> > > > + */
> > > > +struct dummy_drm_bridge {
> > > > +	int dummy; // ensure we test non-zero @bridge offset
> > > > +	struct drm_bridge bridge;
> > > > +};    
> > > 
> > > drm_bridge_init_priv gives you that already.  
> > 
> > On one hand, that's true. On the other hand, looking at
> > drm_bridge_init_priv I noticed it is allocating a bridge without using
> > devm_drm_bridge_alloc(). This should be converted, like all bridge
> > alloctions.
> >
> > So I think the we first need to update drm_bridge_test.c to allocate
> > the bridge using devm_drm_bridge_alloc(), along with the needed changes
> > to the kunit helpers.  
> 
> Oh, yeah, absolutely.
> 
> > One way would be allocating the entire drm_bridge_init_priv using
> > devm_drm_bridge_alloc(), but that does not look like a correct design
> > and after reading the helpers code I'm not even sure it would be doable.
> > 
> > Instead I think we need to change struct drm_bridge_init_priv
> > to embed a pointer to (a modified version of) struct dummy_drm_bridge:
> > 
> >  struct drm_bridge_init_priv {
> >          struct drm_device drm;
> >          struct drm_plane *plane;
> >          struct drm_crtc *crtc;
> >          struct drm_encoder encoder;
> > -        struct drm_bridge bridge;
> > +        struct dummy_drm_bridge *test_bridge;
> >          struct drm_connector *connector;
> >          unsigned int enable_count;
> >          unsigned int disable_count;
> >  };
> > 
> > So that devm_drm_bridge_alloc() can allocate the new test_bridge
> > dynamically:
> > 
> >  priv->test_bridge =
> >    devm_drm_bridge_alloc(..., struct dummy_drm_bridge, bridge, ...);
> > 
> > Do you think this would be the correct approach?  
> 
> It's kind of correct, but you're also correct that it's probably too
> much for those simple tests, so it might not be worth it in the end.

I haven't found any better ways, so I implemented the idea sketched
above. It will be in v8.

> > > > +static const struct drm_bridge_funcs drm_bridge_dummy_funcs = {
> > > > +};
> > > > +
> > > > +static int drm_test_bridge_alloc_init(struct kunit *test)
> > > > +{
> > > > +	struct drm_bridge_alloc_test_ctx *ctx;
> > > > +
> > > > +	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> > > > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> > > > +
> > > > +	ctx->dev = kunit_device_register(test, "drm-bridge-dev");
> > > > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->dev);
> > > > +
> > > > +	test->priv = ctx;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +/*
> > > > + * Test that the allocation and initialization of a bridge works as
> > > > + * expected and doesn't report any error.
> > > > + */
> > > > +static void drm_test_drm_bridge_alloc(struct kunit *test)
> > > > +{
> > > > +	struct drm_bridge_alloc_test_ctx *ctx = test->priv;
> > > > +	struct dummy_drm_bridge *dummy;
> > > > +
> > > > +	dummy = devm_drm_bridge_alloc(ctx->dev, struct dummy_drm_bridge, bridge,
> > > > +				      &drm_bridge_dummy_funcs);
> > > > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy);    
> > > 
> > > Why did you need the dummy value in dummy_drm_bridge if you're not using
> > > it?  
> > 
> > To ensure we test non-zero @bridge offset. Say there is a bug in the
> > pointer math, e.g. 'bridge = container - offset' instead of 'bridge =
> > container + offset'. That would not be caught if @bridge is the first
> > field in the struct.
> > 
> > Does this look like a good reason to keep it?  
> 
> Ack, but please document it with a comment

There is one already:

struct dummy_drm_bridge {
	int dummy; // ensure we test non-zero @bridge offset
	struct drm_bridge bridge;
};    

but the v8 code will be different because of the conversion to
devm_drm_bdirge_alloc(), and anyway I extended the comment.

> > Another way would be adding an optional .destroy a callback in struct
> > drm_bridge_funcs that is called in __drm_bridge_free(), and only the
> > kunit test code implements it. Maybe looks cleaner, but it would be
> > invasive on code that all bridges use. We had discussed a different
> > idea of .destroy callback in the past, for different reasons, and it
> > was not solving the problem we had in that case. So kunit would be the
> > only user for the foreseeable future.  
> 
> Sorry, we've had many conversations about all that work so I can't
> recall (or find) what your objections or concerns (or mine, maybe?) were
> about thing topic. It looks totally reasonable to me, and consistent
> with all the other DRM entities.

That was a long story and I also don't remember all the details,
however here's a summary of what I can recollect:

 1. initially I proposed a .destroy called in *drm_bridge_free(), i.e.
    upon the last put [1]
     * it was used to ask the bridge driver to kfree() the driver struct
       that embeds the drm_bridge; that was not a good design, putting
       deallocation duties on each driver's shoulders
     * it was made unnecessary by devm_drm_bridge_alloc(), which moved
       the entire kfree into __drm_bridge_free() itself, based on the 
       .container pointer
 2. we re-discussed it as a way to handle the panel_bridge, but in that
    case it would have been called by drm_bridge_remove() IIRC [2]
     * you said it was not a good solution (and I agree) and that a much
       wider rework would be needed for panels, eventually including the
       panel_bridge
     * then Anusha sent the patches to start the panel rework

So now we are discussing adding .destroy again, and in
__drm_bridge_free(), as it was at step 1, but for a different reason.

[1] https://lore.kernel.org/all/20241231-hotplug-drm-bridge-v5-3-173065a1ece1@bootlin.com/
[2] https://oftc.catirclogs.org/dri-devel/2025-02-14#

> I'm also not entirely sure how invasive it would be? Add that callback,
> check if it's set and if it is, call it from __drm_bridge_free(), and
> you're pretty much done, right?

No much added code indeed. My concern is about the fact that the
callback would be used only by kunit test and not "real code". It is
possibly worth doing anyway, so I wrote something for v8 and we'll see
how it looks.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
