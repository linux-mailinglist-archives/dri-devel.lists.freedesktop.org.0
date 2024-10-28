Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3BF9B2EE0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 12:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EC410E478;
	Mon, 28 Oct 2024 11:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HzpyWrqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FE010E478
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:29:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 487231A7D;
 Mon, 28 Oct 2024 12:29:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730114942;
 bh=DCtJ5HW9wfc2GrhVDWw44uFxf+d5EMOaqW910++IUbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HzpyWrqPopJ2t02+Kjy5R1wCQtBEhlazs51FpL4fwy+ifQai+4Tn+0+2U9yBPPpjG
 noE7Rxom/stFgPdM0uP+EgQmmOfgPbL8fyyhQ1a0fXcAM2Jc6vvvl7NM4JcnSZXq8U
 T8OMTb2hr/8KDzDys2XDcmQf0q4La34FGgNCBOHI=
Date: Mon, 28 Oct 2024 13:28:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20241028112857.GF24052@pendragon.ideasonboard.com>
References: <20241024095539.1637280-1-herve.codina@bootlin.com>
 <20241024095539.1637280-3-herve.codina@bootlin.com>
 <20241027162350.GA15853@pendragon.ideasonboard.com>
 <20241028091331.6f67e29e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028091331.6f67e29e@bootlin.com>
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

On Mon, Oct 28, 2024 at 09:13:31AM +0100, Herve Codina wrote:
> Hi Laurent,
> 
> On Sun, 27 Oct 2024 18:23:50 +0200
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> 
> [...]
> > > +static int sn65dsi83_reset_pipeline(struct sn65dsi83 *sn65dsi83)
> > > +{
> > > +	struct drm_device *dev = sn65dsi83->bridge.dev;
> > > +	struct drm_modeset_acquire_ctx ctx;
> > > +	struct drm_atomic_state *state;
> > > +	int err;
> > > +
> > > +	/* Use operation done in drm_atomic_helper_suspend() followed by
> > > +	 * operation done in drm_atomic_helper_resume() but without releasing
> > > +	 * the lock between suspend()/resume()
> > > +	 */
> > > +
> > > +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> > > +
> > > +	state = drm_atomic_helper_duplicate_state(dev, &ctx);
> > > +	if (IS_ERR(state)) {
> > > +		err = PTR_ERR(state);
> > > +		goto unlock;
> > > +	}
> > > +
> > > +	err = drm_atomic_helper_disable_all(dev, &ctx);
> > > +	if (err < 0)
> > > +		goto unlock;
> > > +
> > > +	drm_mode_config_reset(dev);
> > > +
> > > +	err = drm_atomic_helper_commit_duplicated_state(state, &ctx);  
> > 
> > Committing a full atomic state from a bridge driver in an asynchronous
> > way seems quite uncharted territory, and it worries me. It's also a very
> > heavyweight, you disable all outputs here, instead of focussing on the
> > output connected to the bridge. Can you either implement something more
> > local, resetting the bridge only, or create a core helper to handle this
> > kind of situation, on a per-output basis ?
> 
> A full restart of the bridge (power off/on) is needed and so we need to
> redo the initialization sequence. This initialization sequence has to be
> done with the DSI data lanes (bridge inputs) driven in LP11 state and so
> without any video stream. Only focussing on bridge outputs will not be
> sufficient. That's why I brought the pipeline down and restarted it.

Fair point.

> Of course, I can copy/paste sn65dsi83_reset_pipeline() to a core helper
> function. Is drm_atomic_helper_reset_all() could be a good candidate?

The helper should operate on a single output, unrelated outputs should
not be affected.

-- 
Regards,

Laurent Pinchart
