Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E18FFB95B2E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 13:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508C010E5F2;
	Tue, 23 Sep 2025 11:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uvliaHz8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8C710E5F2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 11:41:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5EE966DC;
 Tue, 23 Sep 2025 13:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1758627625;
 bh=2TVL9Sc/X4bVnYDmBM6l6vC9ZDyohx7FZWUjeOUIgfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uvliaHz8JxZneD2zaKdoa+OVPOvr8h5MfAJN2b6MKqt94vR9iCwVcc9Ji4Cy/ZQG6
 Plz6oOWkIcAfS3KuTPqPNTzyLiNoXJK6vYx2x6sRLpzzoSA4OklUqXLTids9DJS7g7
 VYwPCU7XkXiC0ZOybN+Yud6GcSNPBDa5YgTYM0LA=
Date: Tue, 23 Sep 2025 14:41:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/29] drm/atomic: Add atomic_state_readout infrastructure
Message-ID: <20250923114116.GC20765@pendragon.ideasonboard.com>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
 <03240fae-544f-4753-96c5-a116b4b5a318@suse.de>
 <20250915-active-placid-bustard-6e1faa@penduick>
 <2ry3txigq3jyivtyz7i4c76g74vdgvlozsjkeswxalhu2vs5yx@jqswyjle632h>
 <20250923-debonair-earwig-of-abracadabra-940fa8@penduick>
 <osdt4teotc6qvja734dyo7be35nzy5lo4sw4dcniaqicqb3o5l@gabq5adeliha>
 <20250923103223.GA15509@pendragon.ideasonboard.com>
 <6s3tqwwpb4syypxo4hic4mgchdexjxvfvzmk3eordn3fpvoqw5@6pj24rhxhyls>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6s3tqwwpb4syypxo4hic4mgchdexjxvfvzmk3eordn3fpvoqw5@6pj24rhxhyls>
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

On Tue, Sep 23, 2025 at 01:43:29PM +0300, Dmitry Baryshkov wrote:
> On Tue, Sep 23, 2025 at 01:32:23PM +0300, Laurent Pinchart wrote:
> > On Tue, Sep 23, 2025 at 01:28:57PM +0300, Dmitry Baryshkov wrote:
> > > On Tue, Sep 23, 2025 at 11:38:17AM +0200, Maxime Ripard wrote:
> > > > On Mon, Sep 15, 2025 at 09:38:44PM +0300, Dmitry Baryshkov wrote:
> > > > > On Mon, Sep 15, 2025 at 10:42:22AM +0200, Maxime Ripard wrote:
> > > > > > On Tue, Sep 02, 2025 at 03:44:54PM +0200, Thomas Zimmermann wrote:
> > > > > > > > +/**
> > > > > > > > + * drm_atomic_build_readout_state - Creates an initial state from the hardware
> > > > > > > > + * @dev: DRM device to build the state for
> > > > > > > > + *
> > > > > > > > + * This function allocates a &struct drm_atomic_state, calls the
> > > > > > > > + * atomic_readout_state callbacks, and fills the global state old states
> > > > > > > > + * by what the callbacks returned.
> > > > > > > > + *
> > > > > > > > + * Returns:
> > > > > > > > + *
> > > > > > > > + * A partially initialized &struct drm_atomic_state on success, an error
> > > > > > > > + * pointer otherwise.
> > > > > > > > + */
> > > > > > > > +static struct drm_atomic_state *
> > > > > > > > +drm_atomic_build_readout_state(struct drm_device *dev)
> > > > > > > > +{
> > > > > > > > +	struct drm_connector_list_iter conn_iter;
> > > > > > > > +	struct drm_atomic_state *state;
> > > > > > > > +	struct drm_mode_config *config =
> > > > > > > > +		&dev->mode_config;
> > > > > > > > +	struct drm_connector *connector;
> > > > > > > > +	struct drm_printer p =
> > > > > > > > +		drm_info_printer(dev->dev);
> > > > > > > > +	struct drm_encoder *encoder;
> > > > > > > > +	struct drm_plane *plane;
> > > > > > > > +	struct drm_crtc *crtc;
> > > > > > > > +	int ret;
> > > > > > > > +
> > > > > > > > +	drm_dbg_kms(dev, "Starting to build atomic state from hardware state.\n");
> > > > > > > > +
> > > > > > > > +	state = drm_atomic_state_alloc(dev);
> > > > > > > > +	if (WARN_ON(!state))
> > > > > > > > +		return ERR_PTR(-ENOMEM);
> > > > > > > > +
> > > > > > > > +	state->connectors = kcalloc(config->num_connector, sizeof(*state->connectors), GFP_KERNEL);
> > > > > > > > +	if (WARN_ON(!state->connectors)) {
> > > > > > > > +		ret = -ENOMEM;
> > > > > > > > +		goto err_state_put;
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > > +	state->private_objs = kcalloc(count_private_obj(dev), sizeof(*state->private_objs), GFP_KERNEL);
> > > > > > > > +	if (WARN_ON(!state->private_objs)) {
> > > > > > > > +		ret = -ENOMEM;
> > > > > > > > +		goto err_state_put;
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > > +	drm_for_each_crtc(crtc, dev) {
> > > > > > > > +		const struct drm_crtc_funcs *crtc_funcs =
> > > > > > > > +			crtc->funcs;
> > > > > > > > +		struct drm_crtc_state *crtc_state;
> > > > > > > > +
> > > > > > > > +		drm_dbg_kms(dev, "Initializing CRTC %s state.\n", crtc->name);
> > > > > > > > +
> > > > > > > > +		if (crtc_funcs->atomic_readout_state) {
> > > > > > > > +			crtc_state = crtc_funcs->atomic_readout_state(crtc);
> > > > > > > > +		} else if (crtc_funcs->reset) {
> > > > > > > > +			crtc_funcs->reset(crtc);
> > > > > > > > +
> > > > > > > > +			/*
> > > > > > > > +			 * We don't want to set crtc->state field yet. Let's save and clear it up.
> > > > > > > > +			 */
> > > > > > > > +			crtc_state = crtc->state;
> > > > > > > > +			crtc->state = NULL;
> > > > > > > 
> > > > > > > Chancing the crtc->state pointer behind the back of the reset callback seems
> > > > > > > fragile. We never how if some other piece of the driver refers to it
> > > > > > > (although illegally).
> > > > > > 
> > > > > > I agree that it's clunky. I'm not sure who would use it at this point
> > > > > > though: we're in the middle of the drm_mode_config_reset(), so the
> > > > > > drivers' involvement is pretty minimal.
> > > > > > 
> > > > > > I did wonder if changing reset to return the object instead of setting
> > > > > > $OBJECT->state would be a better interface?
> > > > > > 
> > > > > > > For now, wouldn't it be better to require a read-out helper for all elements
> > > > > > > of the driver's mode-setting pipeline?  The trivial implementation would
> > > > > > > copy the existing reset function and keep crtc->state to NULL.
> > > > > > 
> > > > > > I also considered that, but I'm not sure we can expect bridges to have
> > > > > > readout hooks filled for every configuration in the wild.
> > > > > > 
> > > > > > But maybe we can look during drm_mode_config_reset() at whether all the
> > > > > > objects have their hook filled, and if not fall back on reset for
> > > > > > everything.
> > > > > > 
> > > > > > It would make the implementation easier, but missing bridges
> > > > > > implementations would trigger a mode change when it might actually work
> > > > > > just fine since bridge state is pretty minimal.
> > > > > 
> > > > > DP bridge drivers have a pretty big state (DPCD and all the features).
> > > > 
> > > > I meant drm_bridge_state. Subclasses would have their own implementation
> > > > anyway.
> > > > 
> > > > > Other bridge drivers randomly leak state to the non-state structs.
> > > > 
> > > > I'm not sure what you mean by that though. Can you expand?
> > > 
> > > I think I've seen bridge drivers which stored subclassed drm_bridge
> > > instead of drm_bridge_state or stored the data in the long-living data
> > > structures. YEs, that's a bug, which should be fixed on its own.
> > 
> > There's one exception to the "all state in state structure" rules if I
> > understand things correctly (and I'm mentioning it here partly to be
> > corrected if my understanding is wrong). Active state data that needs to
> > be accessed from a non-sleepable context need to be copied to the
> > device-specific structure when the state is applied, as we can't take
> > the mutex protecting state access there.
> 
> I'd even relax this slightly (please correct me if I'm wrong here): the
> state can be extracted to the device-specific structure in
> atomic_pre_enable() and cleared in atomic_post_disable().

Overall I agree. I think this should be minimized when reasonably
possible to avoid data duplication though.

> Likewise it's generally fine to store non-state changing data in the
> private data (e.g. hw params or infoframe from the HDMI codec data).

Most hardware parameters are a translation of the software state. I
would store them in the state when possible (e.g. when they need to be
computed at atomic check time, and when the computation is expensive
enough to make caching useful), and store in private data only the data
that needs to also be accessed from a location where state access is not
easily possible.

> > I'd expect that to be uncommon
> > for bridges.

-- 
Regards,

Laurent Pinchart
