Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BF8A89C10
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 13:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EF310E741;
	Tue, 15 Apr 2025 11:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ooxYWGBm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411AE10E741
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 11:22:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76FBA42E80;
 Tue, 15 Apr 2025 11:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744716138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ce+IwTEn7RCz08YVwGx43PTtcD7P4z3APrNV2Hlmmdg=;
 b=ooxYWGBmWQNpY8qBkAG1tL/PsuZ2teXqEGAWxLkB3Q3noYAroVXepTsE0n9AgXge8bvwqx
 dLS9WfdG5SUS1H12jr6l7Kvoo78E8R/6KgOC/2PwJYXCe21qTcOdKVYZdJSbkC5EhR/5tp
 EPoIAvZ5tYkGdMx3+veHsLrAmxiWHK2PLifjwidYrsHDjVB2IYuQYEUf8zwoHoqt9foCiG
 Wa7vZoHKYqS1ESuAR2TI7gjef2zRTNIQlqJ0JxpiK/i8jamlO/50Zr3ip7cq0GlLcDqol3
 PE9TGkRwGELh93o5aXhOi5Ibb96VwQiXEmZGHj+dlhhim6iSGg1P7wHnK0BldQ==
Date: Tue, 15 Apr 2025 13:22:14 +0200
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
Message-ID: <20250415132214.19b1a4ff@booty>
In-Reply-To: <20250414-misty-hungry-woodlouse-dbbd64@houat>
References: <20250409-drm-bridge-alloc-doc-test-v7-0-a3ca4b97597f@bootlin.com>
 <20250409-drm-bridge-alloc-doc-test-v7-2-a3ca4b97597f@bootlin.com>
 <20250414-misty-hungry-woodlouse-dbbd64@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeffeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeljeejuddvudetffdtudelfedugfduledtueffuedufefgudegkeegtdeihedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhto
 hepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
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

thanks for the careful review.

On Mon, 14 Apr 2025 17:49:16 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi,
> 
> On Wed, Apr 09, 2025 at 04:50:35PM +0200, Luca Ceresoli wrote:
> > Add a basic KUnit test for the newly introduced drm_bridge_alloc().
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > Changed in v7:
> >  - rebase on current drm-misc-next, which now has a drm_bridge_test.c file
> >  - cleanup commit message
> > 
> > Changed in v6:
> >  - update to new devm_drm_bridge_alloc() API
> >  - remove drm_test_drm_bridge_put test, not straightforward to write with
> >    the new API and the current notification mechanism
> >  - do not allocate a drm_device: a bridge is allocated without one
> >  - rename some identifiers for easier code reading
> > 
> > This patch was added in v5.
> > ---
> >  drivers/gpu/drm/tests/drm_bridge_test.c | 60 +++++++++++++++++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
> > index ff88ec2e911c9cc9a718483f09d4c764f45f991a..87fb64744b67f0780457a546aba77ba945a0ce67 100644
> > --- a/drivers/gpu/drm/tests/drm_bridge_test.c
> > +++ b/drivers/gpu/drm/tests/drm_bridge_test.c
> > @@ -8,6 +8,7 @@
> >  #include <drm/drm_bridge_helper.h>
> >  #include <drm/drm_kunit_helpers.h>
> >  
> > +#include <kunit/device.h>
> >  #include <kunit/test.h>
> >  
> >  struct drm_bridge_init_priv {
> > @@ -407,11 +408,70 @@ static struct kunit_suite drm_bridge_helper_reset_crtc_test_suite = {
> >  	.test_cases = drm_bridge_helper_reset_crtc_tests,
> >  };
> >  
> > +struct drm_bridge_alloc_test_ctx {
> > +	struct device *dev;
> > +};  
> 
> You don't need a struct there then, you can just pass the device pointer.

Indeed!

> > +/*
> > + * Mimick the typical struct defined by a bridge driver, which embeds a
> > + * bridge plus other fields.
> > + */
> > +struct dummy_drm_bridge {
> > +	int dummy; // ensure we test non-zero @bridge offset
> > +	struct drm_bridge bridge;
> > +};  
> 
> drm_bridge_init_priv gives you that already.

On one hand, that's true. On the other hand, looking at
drm_bridge_init_priv I noticed it is allocating a bridge without using
devm_drm_bridge_alloc(). This should be converted, like all bridge
alloctions.

So I think the we first need to update drm_bridge_test.c to allocate
the bridge using devm_drm_bridge_alloc(), along with the needed changes
to the kunit helpers.

One way would be allocating the entire drm_bridge_init_priv using
devm_drm_bridge_alloc(), but that does not look like a correct design
and after reading the helpers code I'm not even sure it would be doable.

Instead I think we need to change struct drm_bridge_init_priv
to embed a pointer to (a modified version of) struct dummy_drm_bridge:

 struct drm_bridge_init_priv {
         struct drm_device drm;
         struct drm_plane *plane;
         struct drm_crtc *crtc;
         struct drm_encoder encoder;
-        struct drm_bridge bridge;
+        struct dummy_drm_bridge *test_bridge;
         struct drm_connector *connector;
         unsigned int enable_count;
         unsigned int disable_count;
 };

So that devm_drm_bridge_alloc() can allocate the new test_bridge
dynamically:

 priv->test_bridge =
   devm_drm_bridge_alloc(..., struct dummy_drm_bridge, bridge, ...);

Do you think this would be the correct approach?

> > +static const struct drm_bridge_funcs drm_bridge_dummy_funcs = {
> > +};
> > +
> > +static int drm_test_bridge_alloc_init(struct kunit *test)
> > +{
> > +	struct drm_bridge_alloc_test_ctx *ctx;
> > +
> > +	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> > +
> > +	ctx->dev = kunit_device_register(test, "drm-bridge-dev");
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->dev);
> > +
> > +	test->priv = ctx;
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Test that the allocation and initialization of a bridge works as
> > + * expected and doesn't report any error.
> > + */
> > +static void drm_test_drm_bridge_alloc(struct kunit *test)
> > +{
> > +	struct drm_bridge_alloc_test_ctx *ctx = test->priv;
> > +	struct dummy_drm_bridge *dummy;
> > +
> > +	dummy = devm_drm_bridge_alloc(ctx->dev, struct dummy_drm_bridge, bridge,
> > +				      &drm_bridge_dummy_funcs);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy);  
> 
> Why did you need the dummy value in dummy_drm_bridge if you're not using
> it?

To ensure we test non-zero @bridge offset. Say there is a bug in the
pointer math, e.g. 'bridge = container - offset' instead of 'bridge =
container + offset'. That would not be caught if @bridge is the first
field in the struct.

Does this look like a good reason to keep it?

> We'd need a couple more tests, in particular some to make sure the
> bridge pointer is properly cleaned up when the device goes away, but not
> when we have called drm_bridge_get pointer on it, etc.

It would surely be useful, and there was one in the initial patch I
sent ([0], search for "destroyed"). Then I removed it because the code
changed, there is no callback anymore, so no place where this can be
tested.

I'd be glad to re-add such a check but I don't see how it could be
implemented in a clean, non-invasive way.

The only way that comes to mind is be that the kunit test does not call
drm_bridge_put() but rather a kunit-specific reimplementation that
passes a reimplementation of __drm_bridge_free() which does the
accounting. Quick draft (note the added "_test" infix):

struct dummy_drm_bridge {
        struct drm_bridge_init_priv *test_priv;
        struct drm_bridge bridge;
};

// reimplemented version of __drm_bridge_free
static void __drm_test_bridge_free(struct kref *kref)
{
        struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
	struct dummy_drm_bridge *dummy = bridge->container;
	
	dummy->text_priv->destroyed = true;
        kfree(bridge->container);
}

// reimplemented version of drm_bridge_put
void drm_test_bridge_put(struct drm_bridge *bridge)
{
        if (bridge)
                kref_put(&bridge->refcount, __drm_test_bridge_free);
}

My concern with this idea is that it is not testing the actual
drm_bridge.c code, but a different implementation. Even more, if the
functions in drm_bridge.c will change, the ones in drm_bridge_test.c
might be forgotten, thus we'd end up in testing code that is different
from the code actually used.

Another way would be adding an optional .destroy a callback in struct
drm_bridge_funcs that is called in __drm_bridge_free(), and only the
kunit test code implements it. Maybe looks cleaner, but it would be
invasive on code that all bridges use. We had discussed a different
idea of .destroy callback in the past, for different reasons, and it
was not solving the problem we had in that case. So kunit would be the
only user for the foreseeable future.

You opinion about these ideas? Can you suggest a better way to implement
such a test, that is clean and not needing to change drm_bridge_put()
and related functions?

Luca

[0] https://lore.kernel.org/all/20241231-hotplug-drm-bridge-v5-5-173065a1ece1@bootlin.com/

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
