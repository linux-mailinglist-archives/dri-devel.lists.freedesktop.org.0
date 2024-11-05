Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26239BC7C3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 09:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E603E10E002;
	Tue,  5 Nov 2024 08:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="W3XftrgP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF27410E002
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 08:15:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7156C1BF203;
 Tue,  5 Nov 2024 08:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730794506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ca33zuGwKc/TbJFgjCMVbMBjtlcpXKFtBS6UyUFQZLk=;
 b=W3XftrgP6+DRXeawkAxWFeub2HOvaBi4/cqGthwJk/k0H7dhRZOxkWzoTt2Tf8U/AejxG7
 D9HHEp/3Cy3p2gavw77i4D2i+vGhZkRm9NxwFI9kZpseCPI7ZG5ZESBZ+TteCYlGZyOfJ8
 X0JJwxB5l0qRA2apYixLCQKoPKGSrEdbSM9TeRN8mDMverce6WERW2If7AIwx9Jw+mWwDF
 mpsiIFA6XqjtJfb9akTcFFlbA5/C5XJxLibt3QnTKZ7oGonVgma2JufoLU0Wc5EvJfjjBR
 DZW3PUujGAyCrY9shulkPZHBoNfMMeELax/kQme0AZqz/LirUdUVNig+1gm7nA==
Date: Tue, 5 Nov 2024 09:15:03 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut
 <marex@denx.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20241105091503.48f69586@bootlin.com>
In-Reply-To: <20241028140913.GG6081@pendragon.ideasonboard.com>
References: <20241024095539.1637280-1-herve.codina@bootlin.com>
 <20241024095539.1637280-3-herve.codina@bootlin.com>
 <20241027162350.GA15853@pendragon.ideasonboard.com>
 <20241028091331.6f67e29e@bootlin.com>
 <20241028112857.GF24052@pendragon.ideasonboard.com>
 <20241028-nebulous-yellow-dragon-2cfb5f@houat>
 <20241028132858.GE6081@pendragon.ideasonboard.com>
 <20241028-great-charming-flounder-23fc9b@houat>
 <20241028140913.GG6081@pendragon.ideasonboard.com>
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

Hi Maxime, Laurent,

On Mon, 28 Oct 2024 16:09:13 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> On Mon, Oct 28, 2024 at 02:55:47PM +0100, Maxime Ripard wrote:
> > On Mon, Oct 28, 2024 at 03:28:58PM +0200, Laurent Pinchart wrote:  
> > > On Mon, Oct 28, 2024 at 01:21:45PM +0100, Maxime Ripard wrote:  
> > > > On Mon, Oct 28, 2024 at 01:28:57PM +0200, Laurent Pinchart wrote:  
> > > > > On Mon, Oct 28, 2024 at 09:13:31AM +0100, Herve Codina wrote:  
> > > > > > On Sun, 27 Oct 2024 18:23:50 +0200 Laurent Pinchart wrote:
> > > > > > 
> > > > > > [...]  
> > > > > > > > +static int sn65dsi83_reset_pipeline(struct sn65dsi83 *sn65dsi83)
> > > > > > > > +{
> > > > > > > > +	struct drm_device *dev = sn65dsi83->bridge.dev;
> > > > > > > > +	struct drm_modeset_acquire_ctx ctx;
> > > > > > > > +	struct drm_atomic_state *state;
> > > > > > > > +	int err;
> > > > > > > > +
> > > > > > > > +	/* Use operation done in drm_atomic_helper_suspend() followed by
> > > > > > > > +	 * operation done in drm_atomic_helper_resume() but without releasing
> > > > > > > > +	 * the lock between suspend()/resume()
> > > > > > > > +	 */
> > > > > > > > +
> > > > > > > > +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> > > > > > > > +
> > > > > > > > +	state = drm_atomic_helper_duplicate_state(dev, &ctx);
> > > > > > > > +	if (IS_ERR(state)) {
> > > > > > > > +		err = PTR_ERR(state);
> > > > > > > > +		goto unlock;
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > > +	err = drm_atomic_helper_disable_all(dev, &ctx);
> > > > > > > > +	if (err < 0)
> > > > > > > > +		goto unlock;
> > > > > > > > +
> > > > > > > > +	drm_mode_config_reset(dev);
> > > > > > > > +
> > > > > > > > +	err = drm_atomic_helper_commit_duplicated_state(state, &ctx);    
> > > > > > > 
> > > > > > > Committing a full atomic state from a bridge driver in an asynchronous
> > > > > > > way seems quite uncharted territory, and it worries me. It's also a very
> > > > > > > heavyweight, you disable all outputs here, instead of focussing on the
> > > > > > > output connected to the bridge. Can you either implement something more
> > > > > > > local, resetting the bridge only, or create a core helper to handle this
> > > > > > > kind of situation, on a per-output basis ?  
> > > > > > 
> > > > > > A full restart of the bridge (power off/on) is needed and so we need to
> > > > > > redo the initialization sequence. This initialization sequence has to be
> > > > > > done with the DSI data lanes (bridge inputs) driven in LP11 state and so
> > > > > > without any video stream. Only focussing on bridge outputs will not be
> > > > > > sufficient. That's why I brought the pipeline down and restarted it.  
> > > > > 
> > > > > Fair point.
> > > > >   
> > > > > > Of course, I can copy/paste sn65dsi83_reset_pipeline() to a core helper
> > > > > > function. Is drm_atomic_helper_reset_all() could be a good candidate?  
> > > > > 
> > > > > The helper should operate on a single output, unrelated outputs should
> > > > > not be affected.  
> > > > 
> > > > Also, you don't want to reset anything, you just want the last commit to
> > > > be replayed.  
> > > 
> > > I'm not sure about that. If the last commit is just a page flip, that
> > > won't help, will it ?  
> > 
> > The alternative would be that you start anew with a blank state, which
> > effectively drops every configuration that has been done by userspace.
> > This is terrible.
> > 
> > And a page flip wouldn't have affected the connector and
> > connector->state would still be to the last state that affected it, so
> > it would work.  
> 
> Ah right, you didn't mean replaying the last commit then, but first
> disabling the output and then restoring the current state ? That should
> work.
> 

Thanks for the feedback.

If I understand correctly, I should try to disable the output.
What is the 'output' exactly, the connector?
How can I disable it? Can you give me some pointers?

Further more, is disabling the "output" disable the whole path where the
bridge is located?
I mean, I need to power off/on the bridge and re-init it with its input DSI
lines in LP11.

Best regards,
Hervé
