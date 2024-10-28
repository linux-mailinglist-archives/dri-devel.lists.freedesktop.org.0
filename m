Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAF79B2A08
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 09:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1084A10E367;
	Mon, 28 Oct 2024 08:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Vd3Deyy8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 669 seconds by postgrey-1.36 at gabe;
 Mon, 28 Oct 2024 08:13:34 UTC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A201C10E367
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 08:13:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EDF01BF203;
 Mon, 28 Oct 2024 08:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730103213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftAOobpcZtzREeqCUhcS3Bfuff8MNGFDmOerJINyz3M=;
 b=Vd3Deyy840DvizNWpyDBvqibEFEkpd4AH+xicihGDAQA60P8hMm0HHdtxC6zbGcY+186/d
 aNMY/TrPzeMgXvQEova4qJvpmyMrP7DRpIzcenWvcZSEaJNbcrEf8aZDFl0gYdRgu6mFGZ
 zFCSOuswcdp5zB6nMvRaDHQfW5jbzzD1b8ji10pPbpcljnsuvTAIiwzjM+7+TpcOugDW3r
 hj+8aloU7gBSbVilWF2AbDd3V4epwnhjmkdNdnw+CEPN7cwL111wBjEgdW5uR6a2yt0pYR
 TeRYFFnXQt8nZjuPMQluPrb6TpjTIK7UZUxGn00pX1QSk55TNCfK7URTRvOWUw==
Date: Mon, 28 Oct 2024 09:13:31 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20241028091331.6f67e29e@bootlin.com>
In-Reply-To: <20241027162350.GA15853@pendragon.ideasonboard.com>
References: <20241024095539.1637280-1-herve.codina@bootlin.com>
 <20241024095539.1637280-3-herve.codina@bootlin.com>
 <20241027162350.GA15853@pendragon.ideasonboard.com>
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

Hi Laurent,

On Sun, 27 Oct 2024 18:23:50 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

[...]
> > +static int sn65dsi83_reset_pipeline(struct sn65dsi83 *sn65dsi83)
> > +{
> > +	struct drm_device *dev = sn65dsi83->bridge.dev;
> > +	struct drm_modeset_acquire_ctx ctx;
> > +	struct drm_atomic_state *state;
> > +	int err;
> > +
> > +	/* Use operation done in drm_atomic_helper_suspend() followed by
> > +	 * operation done in drm_atomic_helper_resume() but without releasing
> > +	 * the lock between suspend()/resume()
> > +	 */
> > +
> > +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> > +
> > +	state = drm_atomic_helper_duplicate_state(dev, &ctx);
> > +	if (IS_ERR(state)) {
> > +		err = PTR_ERR(state);
> > +		goto unlock;
> > +	}
> > +
> > +	err = drm_atomic_helper_disable_all(dev, &ctx);
> > +	if (err < 0)
> > +		goto unlock;
> > +
> > +	drm_mode_config_reset(dev);
> > +
> > +	err = drm_atomic_helper_commit_duplicated_state(state, &ctx);  
> 
> Committing a full atomic state from a bridge driver in an asynchronous
> way seems quite uncharted territory, and it worries me. It's also a very
> heavyweight, you disable all outputs here, instead of focussing on the
> output connected to the bridge. Can you either implement something more
> local, resetting the bridge only, or create a core helper to handle this
> kind of situation, on a per-output basis ?

A full restart of the bridge (power off/on) is needed and so we need to
redo the initialization sequence. This initialization sequence has to be
done with the DSI data lanes (bridge inputs) driven in LP11 state and so
without any video stream. Only focussing on bridge outputs will not be
sufficient. That's why I brought the pipeline down and restarted it.

Of course, I can copy/paste sn65dsi83_reset_pipeline() to a core helper
function. Is drm_atomic_helper_reset_all() could be a good candidate?

Best regards,
Hervé
