Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEBABA9B60
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9BF10E441;
	Mon, 29 Sep 2025 14:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ca/E6wAh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527BA10E441
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:53:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id EAF0C1A0F9D;
 Mon, 29 Sep 2025 14:53:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BFFD4606AE;
 Mon, 29 Sep 2025 14:53:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B915B102F198F; 
 Mon, 29 Sep 2025 16:53:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759157609; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3pVpwTaco7yFHAe69ZBiTvXHcvn2qIWppyNoGTqmjTQ=;
 b=ca/E6wAhdfUjViADrg2w0zrDIpOzyj9i+1rFiYXvEsOH2M68QaaZA+3+H3QHiodUZFLosf
 pWmH4K7NLln+RKv4S+dpr39P3DQVy6c5AVOHnAVM3hcytr4PfOtnjoKRJ8eCZv2Zz55By0
 C0l5ai8pg7IqUWqXQcCUb3KdIcUAVkQLwlJlXHInfvNB2TK/BLIXqj7+d+PrMLy5Pmyp8N
 LZU+xgQWrqpTBXtMYLK1a9+BvMqvCnzCXrMBQZISA1PB6yWUrnksSZT8dRTB8wBy5oamt/
 7VnR4UIL3oSEFH5jZ/O0FsKkGD5I0sy1SKItyLw6WlT4YTxyRolMQO0tKOOj6A==
Date: Mon, 29 Sep 2025 16:53:21 +0200
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
Subject: Re: [PATCH 3/7] drm/bridge: lock the encoder bridge chain mutex
 during insertion
Message-ID: <20250929165321.28b8bbcd@booty>
In-Reply-To: <20250929-enigmatic-delicate-mussel-f36b89@houat>
References: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-0-23b62c47356a@bootlin.com>
 <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-3-23b62c47356a@bootlin.com>
 <20250929-enigmatic-delicate-mussel-f36b89@houat>
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

On Mon, 29 Sep 2025 14:46:18 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Fri, Sep 26, 2025 at 05:59:44PM +0200, Luca Ceresoli wrote:
> > drm_bridge_attach() modifies the encoder bridge chain, so take a mutex
> > around such operations to allow users of the chain to protect themselves
> > from chain modifications while iterating.
> > 
> > This change does not apply to drm_bridge_detach() because:
> >  * only the drm_encoder.c calls it, not bridge drivers (unlike
> >    drm_bridge_attach())
> >  * the only drm_bridge_detach() caller is drm_encoder_cleanup() which
> >    already locks the mutex for the entire cleanup loop, thus additionally
> >    locking it here would deadlock
> >  * drm_bridge_detach() is recursively calling itself along the chain, so
> >    care would be needed to avoid deadlocks
> > Add a comment to clarify that is intended.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 630b5e6594e0affad9ba48791207c7b403da5db8..90e467cf91a134342c80d2f958b928472aaf0d8b 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -453,10 +453,12 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
> >  	bridge->dev = encoder->dev;
> >  	bridge->encoder = encoder;
> >  
> > +	drm_encoder_chain_lock(encoder);
> >  	if (previous)
> >  		list_add(&bridge->chain_node, &previous->chain_node);
> >  	else
> >  		list_add(&bridge->chain_node, &encoder->bridge_chain);
> > +	drm_encoder_chain_unlock(encoder);
> >  
> >  	if (bridge->funcs->attach) {
> >  		ret = bridge->funcs->attach(bridge, encoder, flags);
> > @@ -487,7 +489,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
> >  err_reset_bridge:
> >  	bridge->dev = NULL;
> >  	bridge->encoder = NULL;
> > +	drm_encoder_chain_lock(encoder);
> >  	list_del(&bridge->chain_node);
> > +	drm_encoder_chain_unlock(encoder);
> >  
> >  	if (ret != -EPROBE_DEFER)
> >  		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> > @@ -503,6 +507,11 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
> >  }
> >  EXPORT_SYMBOL(drm_bridge_attach);
> >  
> > +/*
> > + * Invoked by the encoder during encoder cleanup in drm_encoder_cleanup(),
> > + * so should generally *not* be called by driver code.  
> 
> Why not?

Because this is what drm_bridge_attach() says O:-)

> * drm_bridge_attach - attach the bridge to an encoder's chain
...
> * Note that bridges attached to encoders are auto-detached during encoder
> * cleanup in drm_encoder_cleanup(), so drm_bridge_attach() should generally
> * *not* be balanced with a drm_bridge_detach() in driver code.

Also, it's what the code does.

> Also, it looks entirely unrelated to the rest of the patch.

Sure, I can split it. It is also redundant given that's repeating what
drm_bridge_attach() says.

I wrote this comment for future people looking at this code. If
_attach() takes a lock and _detach() does not, it could look like a
potential mistake, and someone could spend precious hours in trying to
fix it.

Maybe replace with:

  /* Must be called with the encoder bridge chain locked */

?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
