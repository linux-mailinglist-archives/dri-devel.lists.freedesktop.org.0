Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3929B31AC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 14:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF5510E4AA;
	Mon, 28 Oct 2024 13:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B6w6wwQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9D910E4AA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:29:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEE4A10C4;
 Mon, 28 Oct 2024 14:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730122145;
 bh=DMmxlKMEdktOdfKpfuiQaifeYi5aarkRCjz9qJVIe9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B6w6wwQLc0E4rqMCWKkKZ7Dca5bKw8TjNqztrfipdQMc54WB1levWCjgVTV3ySv8l
 6BBx19QErgZeCCOlrIXHBRPqUL+ibZBMqwsX50P0H84nSGF3s3KrhKeJCqAhJ5DNAH
 5yJoELKr+vtw6pW8WLP/pgor+D0mO6cSuTH4DjNM=
Date: Mon, 28 Oct 2024 15:28:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20241028132858.GE6081@pendragon.ideasonboard.com>
References: <20241024095539.1637280-1-herve.codina@bootlin.com>
 <20241024095539.1637280-3-herve.codina@bootlin.com>
 <20241027162350.GA15853@pendragon.ideasonboard.com>
 <20241028091331.6f67e29e@bootlin.com>
 <20241028112857.GF24052@pendragon.ideasonboard.com>
 <20241028-nebulous-yellow-dragon-2cfb5f@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028-nebulous-yellow-dragon-2cfb5f@houat>
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

On Mon, Oct 28, 2024 at 01:21:45PM +0100, Maxime Ripard wrote:
> On Mon, Oct 28, 2024 at 01:28:57PM +0200, Laurent Pinchart wrote:
> > On Mon, Oct 28, 2024 at 09:13:31AM +0100, Herve Codina wrote:
> > > On Sun, 27 Oct 2024 18:23:50 +0200 Laurent Pinchart wrote:
> > > 
> > > [...]
> > > > > +static int sn65dsi83_reset_pipeline(struct sn65dsi83 *sn65dsi83)
> > > > > +{
> > > > > +	struct drm_device *dev = sn65dsi83->bridge.dev;
> > > > > +	struct drm_modeset_acquire_ctx ctx;
> > > > > +	struct drm_atomic_state *state;
> > > > > +	int err;
> > > > > +
> > > > > +	/* Use operation done in drm_atomic_helper_suspend() followed by
> > > > > +	 * operation done in drm_atomic_helper_resume() but without releasing
> > > > > +	 * the lock between suspend()/resume()
> > > > > +	 */
> > > > > +
> > > > > +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> > > > > +
> > > > > +	state = drm_atomic_helper_duplicate_state(dev, &ctx);
> > > > > +	if (IS_ERR(state)) {
> > > > > +		err = PTR_ERR(state);
> > > > > +		goto unlock;
> > > > > +	}
> > > > > +
> > > > > +	err = drm_atomic_helper_disable_all(dev, &ctx);
> > > > > +	if (err < 0)
> > > > > +		goto unlock;
> > > > > +
> > > > > +	drm_mode_config_reset(dev);
> > > > > +
> > > > > +	err = drm_atomic_helper_commit_duplicated_state(state, &ctx);  
> > > > 
> > > > Committing a full atomic state from a bridge driver in an asynchronous
> > > > way seems quite uncharted territory, and it worries me. It's also a very
> > > > heavyweight, you disable all outputs here, instead of focussing on the
> > > > output connected to the bridge. Can you either implement something more
> > > > local, resetting the bridge only, or create a core helper to handle this
> > > > kind of situation, on a per-output basis ?
> > > 
> > > A full restart of the bridge (power off/on) is needed and so we need to
> > > redo the initialization sequence. This initialization sequence has to be
> > > done with the DSI data lanes (bridge inputs) driven in LP11 state and so
> > > without any video stream. Only focussing on bridge outputs will not be
> > > sufficient. That's why I brought the pipeline down and restarted it.
> > 
> > Fair point.
> > 
> > > Of course, I can copy/paste sn65dsi83_reset_pipeline() to a core helper
> > > function. Is drm_atomic_helper_reset_all() could be a good candidate?
> > 
> > The helper should operate on a single output, unrelated outputs should
> > not be affected.
> 
> Also, you don't want to reset anything, you just want the last commit to
> be replayed.

I'm not sure about that. If the last commit is just a page flip, that
won't help, will it ?

-- 
Regards,

Laurent Pinchart
