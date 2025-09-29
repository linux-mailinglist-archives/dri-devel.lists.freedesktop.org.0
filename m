Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD876BA9A91
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D42C10E440;
	Mon, 29 Sep 2025 14:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="A2OqiCWC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D927B10E440
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:45:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 87B341A103B;
 Mon, 29 Sep 2025 14:45:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 50B4F606AE;
 Mon, 29 Sep 2025 14:45:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 86C04102F16F4; 
 Mon, 29 Sep 2025 16:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759157132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sv40xoD8F63+OvfApANa19h3Zoz9850uC86hUS961NU=;
 b=A2OqiCWCIZuuHZLJyIJxkDLo/tafCSLpI9vpnVcG08uP9O5WDG41gCkXi3N6s4PyVQJPvx
 M34+XXFlFqx7G3HpH+PUdjcviAFoii4WGmBjXIOKqfGiLT+dfCppkgPIO0U42vZbGvRwc2
 N948wfNDAQulJ5OKTDAkZ1JfKQ6IxSXkpnVHCyH09giHqHu4us3UtiEr+8lbLJcKPsZVz+
 iCNiW2KHtutJUgDUvPcNW3oh70kwkTf2YeyXM+xclmYEJjA0IFYr0BNMDAw96kCHRCkpq6
 qqBSQu9Qtr21wGHMFj6tGaFh4JnxyGQ3VlTZignRcPvXbVo7Z58s5rJSGWmvuA==
Date: Mon, 29 Sep 2025 16:45:26 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] drm/encoder: add mutex to protect the bridge chain
Message-ID: <20250929164526.08aa8118@booty>
In-Reply-To: <20250929-strange-earthworm-of-research-d2bbab@houat>
References: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-0-23b62c47356a@bootlin.com>
 <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-1-23b62c47356a@bootlin.com>
 <20250929-strange-earthworm-of-research-d2bbab@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 29 Sep 2025 14:43:46 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Fri, Sep 26, 2025 at 05:59:42PM +0200, Luca Ceresoli wrote:
> > The per-encoder bridge chain is currently assumed to be static once it is
> > fully initialized. Work is in progress to add hot-pluggable bridges,
> > breaking that assumption.
> > 
> > With bridge removal, the encoder chain can change without notice, removing
> > tail bridges. This can be problematic while iterating over the chain.
> > 
> > Add a mutex to be taken whenever looping or changing the encoder chain.
> > 
> > Also add two APIs to lock/unlock the mutex without the need to manipulate
> > internal struct drm_encoder fields.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/gpu/drm/drm_encoder.c |  2 ++
> >  include/drm/drm_encoder.h     | 18 ++++++++++++++++++
> >  2 files changed, 20 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> > index 8f2bc6a28482229fd0b030a1958f87753ad7885f..3261f142baea30c516499d23dbf8d0acf5952cd6 100644
> > --- a/drivers/gpu/drm/drm_encoder.c
> > +++ b/drivers/gpu/drm/drm_encoder.c
> > @@ -129,6 +129,7 @@ static int __drm_encoder_init(struct drm_device *dev,
> >  	}
> >  
> >  	INIT_LIST_HEAD(&encoder->bridge_chain);
> > +	mutex_init(&encoder->bridge_chain_mutex);
> >  	list_add_tail(&encoder->head, &dev->mode_config.encoder_list);
> >  	encoder->index = dev->mode_config.num_encoder++;
> >  
> > @@ -202,6 +203,7 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
> >  	kfree(encoder->name);
> >  	list_del(&encoder->head);
> >  	dev->mode_config.num_encoder--;
> > +	mutex_destroy(&encoder->bridge_chain_mutex);
> >  
> >  	memset(encoder, 0, sizeof(*encoder));
> >  }
> > diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> > index 977a9381c8ba943b4d3e021635ea14856df8a17d..6c962de640a345bfbb18308c83076628547c9ab9 100644
> > --- a/include/drm/drm_encoder.h
> > +++ b/include/drm/drm_encoder.h
> > @@ -25,6 +25,7 @@
> >  
> >  #include <linux/list.h>
> >  #include <linux/ctype.h>
> > +#include <linux/mutex.h>
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_mode.h>
> >  #include <drm/drm_mode_object.h>
> > @@ -189,6 +190,9 @@ struct drm_encoder {
> >  	 */
> >  	struct list_head bridge_chain;
> >  
> > +	/** @bridge_chain_mutex: protect bridge_chain from changes while iterating */
> > +	struct mutex bridge_chain_mutex;
> > +
> >  	const struct drm_encoder_funcs *funcs;
> >  	const struct drm_encoder_helper_funcs *helper_private;
> >  
> > @@ -319,6 +323,20 @@ static inline struct drm_encoder *drm_encoder_find(struct drm_device *dev,
> >  	return mo ? obj_to_encoder(mo) : NULL;
> >  }
> >  
> > +static inline struct drm_encoder *drm_encoder_chain_lock(struct drm_encoder *encoder)
> > +{
> > +	if (!WARN_ON_ONCE(!encoder))
> > +		mutex_lock(&encoder->bridge_chain_mutex);
> > +
> > +	return encoder;
> > +}
> > +
> > +static inline void drm_encoder_chain_unlock(struct drm_encoder *encoder)
> > +{
> > +	if (!WARN_ON_ONCE(!encoder))
> > +		mutex_unlock(&encoder->bridge_chain_mutex);
> > +}
> > +  
> 
> Please provide documentation for these two functions.

Ah, sure, here is a draft:

/**
 * drm_encoder_chain_lock - lock the encoder bridge chain
 * @encoder: encoder whose bridge chain must be locked
 *
 * Locks the mutex protecting the bridge chain from concurrent access.
 * To be called by code modifying ot iterating over the bridge chain to
 * prevent the list from changing while iterating over it.
 * Call drm_encoder_chain_unlock() to unlock the mutex.
 *
 * Returns:
 * Pointer to @encoder. Useful to lock the chain and then operate on the
 * in the same statement, e.g.
 * list_first_entry(&drm_encoder_chain_lock(encoder)->bridge_chain)
 */
static inline struct drm_encoder *drm_encoder_chain_lock(struct drm_encoder *encoder)
{
	if (!WARN_ON_ONCE(!encoder))
		mutex_lock(&encoder->bridge_chain_mutex);

	return encoder;
}

/**
 * drm_encoder_chain_unlock - unlock the encoder bridge chain
 * @encoder: encoder whose bridge chain must be unlocked
 *
 * Unlocks the mutex protecting the bridge chain from concurrent access,
 * matching drm_encoder_chain_lock().
 */
static inline void drm_encoder_chain_unlock(struct drm_encoder *encoder)
{
	if (!WARN_ON_ONCE(!encoder))
		mutex_unlock(&encoder->bridge_chain_mutex);
}

> In particular, why
> do we need to return the encoder pointer?

It allows to lock the encoder chain and then dereference the pointer,
similar to what drm_bridge_get() does. of_node_get(), which I used as a
model for these functions, does the same.

This one in particular is used in patch 4 to write the new scoped
macros. Locking the encoder chain and then dereferencing the encoder
would be very awkward in a macro if drm_encoder_chain_lock() didn't
return the encoder.

Luca
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
