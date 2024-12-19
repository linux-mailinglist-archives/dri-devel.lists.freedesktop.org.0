Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288049F7CEB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 15:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5202210E4AF;
	Thu, 19 Dec 2024 14:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nvlg5Aw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 171886 seconds by postgrey-1.36 at gabe;
 Thu, 19 Dec 2024 14:17:11 UTC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E56E10E4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 14:17:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11562FF808;
 Thu, 19 Dec 2024 14:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734617829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GglbGN6Kwf5dC66RSjZgh983RBWc4jPBP3HEAkL3LOo=;
 b=nvlg5Aw2pAMQOWV20OwViOPXy7TQAanSHixwhYvKNue74HOk7PCm5DfRou80HLAoWmw3Ai
 VQfYSkfrp3vme8WYnzP7FEAwc59WH42tucx6UKXf0uMHDh1GSubQ5MsdQy95mjnqFxInD0
 edvhF5Fd0grZdELFaHMp5B6DzTpD4IKlibcwIt9yttgVa0eWGQZvILbLIgipIBkfIS8Jse
 UqgktgZkBVbAR1h9Ty6+/pHndtlpXu1DDGrdGSkJrUTP9u5i9D3d91DK3iCw1TTgbG5lmV
 6EtNiF9A5eK4KKKdQtpskSysPBIDu3lkSaRsKPgytIfIkLkJdDUF0bWIkvVtaQ==
Date: Thu, 19 Dec 2024 15:17:05 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut
 <marex@denx.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Louis Chauvet
 <louis.chauvet@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 3/3] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20241219151705.5c950f24@bootlin.com>
In-Reply-To: <20241219-unnatural-terrestrial-aardwark-d1da17@houat>
References: <20241217143216.658461-1-herve.codina@bootlin.com>
 <20241217143216.658461-4-herve.codina@bootlin.com>
 <20241217-tangible-nostalgic-salamander-27edaa@houat>
 <20241218092407.559a204e@bootlin.com>
 <20241218-armored-fearless-dugong-ccd72d@houat>
 <20241218173728.5a7690fe@bootlin.com>
 <20241219-unnatural-terrestrial-aardwark-d1da17@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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

On Thu, 19 Dec 2024 15:01:39 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Wed, Dec 18, 2024 at 05:37:28PM +0100, Herve Codina wrote:
> > Hi Maxime,
> > 
> > On Wed, 18 Dec 2024 16:54:02 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > > > > +static int sn65dsi83_reset_drm_output(struct sn65dsi83 *sn65dsi83)
> > > > > > +{
> > > > > > +	struct drm_atomic_state *state = ERR_PTR(-EINVAL);
> > > > > > +	struct drm_device *dev = sn65dsi83->bridge.dev;
> > > > > > +	struct drm_modeset_acquire_ctx ctx;
> > > > > > +	struct drm_connector *connector;
> > > > > > +	int err;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Reset components available from the encoder to the connector.
> > > > > > +	 * To do that, we disable then re-enable the connector linked to the
> > > > > > +	 * encoder.
> > > > > > +	 *
> > > > > > +	 * This way, drm core will reconfigure each components. In our case,
> > > > > > +	 * this will force the previous component to go back in LP11 mode and
> > > > > > +	 * so allow the reconfiguration of SN64DSI83 bridge.
> > > > > > +	 *
> > > > > > +	 * Keep the lock during the whole operation to be atomic.
> > > > > > +	 */
> > > > > > +
> > > > > > +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> > > > > > +
> > > > > > +	state = drm_atomic_helper_duplicate_state(dev, &ctx);
> > > > > > +	if (IS_ERR(state)) {
> > > > > > +		err = PTR_ERR(state);
> > > > > > +		goto unlock;
> > > > > > +	}
> > > > > > +
> > > > > > +	connector = drm_atomic_get_old_connector_for_encoder(state,
> > > > > > +							     sn65dsi83->bridge.encoder);
> > > > > > +	if (!connector) {
> > > > > > +		err = -EINVAL;
> > > > > > +		goto unlock;
> > > > > > +	}
> > > > > > +
> > > > > > +	err = drm_atomic_helper_disable_connector(connector, &ctx);
> > > > > > +	if (err < 0)
> > > > > > +		goto unlock;
> > > > > > +
> > > > > > +	/* Restore original state to re-enable the connector */
> > > > > > +	err = drm_atomic_helper_commit_duplicated_state(state, &ctx);
> > > > > > +
> > > > > > +unlock:
> > > > > > +	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
> > > > > > +	if (!IS_ERR(state))
> > > > > > +		drm_atomic_state_put(state);
> > > > > > +	return err;
> > > > > > +}      
> > > > > 
> > > > > In the previous version, we advised to create a generic helper similar
> > > > > to vc4 and i915 reset_pipe() and and intel_modeset_commit_pipes().
> > > > > 
> > > > > It looks like you chose a different path. Can you expand why?
> > > > >     
> > > > 
> > > > I didn't choose a different path.
> > > > I created the drm_atomic_helper_disable_connector(). Maybe it is not enough.    
> > > 
> > > It's not that it's not enough, it's that you're not doing the same
> > > thing, see below.
> > >   
> > > > I can move (copy/paste) sn65dsi83_reset_drm_output() to a new helper:
> > > >   int drm_atomic_helper_disable_output(struct drm_encoder *encoder)
> > > > 
> > > > Is it what you expect?
> > > > 
> > > > Also, are operations done in current sn65dsi83_reset_drm_output() correct
> > > > in order to reset the output? It works on my system but what is your
> > > > feedback on operations performed.    
> > > 
> > > You don't need any of that. Both the reset_pipe() and
> > > intel_modeset_commit_pipes() functions will flag the connectors as
> > > updated in the commit, and the core will consider that it needs to
> > > disable / enable the encoders and bridges below that CRTC.
> > > 
> > > See
> > > https://elixir.bootlin.com/linux/v6.12.5/source/drivers/gpu/drm/drm_atomic_helper.c#L1155
> > > https://elixir.bootlin.com/linux/v6.12.5/source/drivers/gpu/drm/drm_atomic_helper.c#L1476
> > > 
> > > So you really only need to convert any of these two functions into a
> > > helper, and it does exactly what you need.
> > >   
> > 
> > I see but if I set crtc_state->connectors_changed = true; as it is done in
> > reset_pipe(), in my understanding, all outputs will be reset.  
> 
> Not all outputs, all active outputs connected to that CRTC. If you have
> only one encoder connected to that CRTC, which is pretty typical on ARM
> platforms, it's equivalent to what you're asking for.
> 
> And we should probably shut down the CRTC (and thus all active outputs)
> anyway. Some encoders and bridges have internal FIFOs/state machines
> that need to be enabled disabled at specific points during the
> initialization, and the CRTC is a part of that.
> 

Ok, I will convert vc4 reset_pipe() to an atomic helper and use that one.

Thanks for your feedback and explanation.

Best regards,
Hervé
