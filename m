Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 099C786B43B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 17:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE4710E61E;
	Wed, 28 Feb 2024 16:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A7LOt25J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964E110E61E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:10:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D94F6B3;
 Wed, 28 Feb 2024 17:09:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709136589;
 bh=0m8gNxas4C7HlPBjHxGORwNSO+eueqaAOKJKBhTr8D8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A7LOt25JgCvBw449xk6EQWBXfplKYynur1DmdBihGgx43rT2hHitQm/IScJBW6Sf0
 BL1aXherRxbVQg2uHr13QVxmkzKMJMUXyQ6A7BWWQXzD8VZWZZfKpKXbgssXkCPo1w
 0yhRt5G/ZkNURKnWs1xgQjp00Ftn52Epdcqqc10o=
Date: Wed, 28 Feb 2024 18:10:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] drm/atomic-helper: Add select_output_bus_format
 callback
Message-ID: <20240228161004.GE9863@pendragon.ideasonboard.com>
References: <20240226-dp-live-fmt-v1-0-b78c3f69c9d8@amd.com>
 <20240226-dp-live-fmt-v1-4-b78c3f69c9d8@amd.com>
 <20240228-nifty-flashy-shrew-905edc@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240228-nifty-flashy-shrew-905edc@houat>
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

On Wed, Feb 28, 2024 at 04:29:33PM +0100, Maxime Ripard wrote:
> On Mon, Feb 26, 2024 at 08:44:45PM -0800, Anatoliy Klymenko wrote:
> > Add select_output_bus_format to CRTC atomic helpers callbacks. This
> > callback Will allow CRTC to participate in media bus format negotiation
> > over connected DRM bridge chain and impose CRTC-specific restrictions.
> > A good example is CRTC implemented as FPGA soft IP. This kind of CRTC will
> > most certainly support a single output media bus format, as supporting
> > multiple runtime options consumes extra FPGA resources. A variety of
> > options for FPGA are usually achieved by synthesizing IP with different
> > parameters.
> > 
> > Incorporate select_output_bus_format callback into the format negotiation
> > stage to fix the input bus format of the first DRM bridge in the chain.
> > 
> > Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> > ---
> >  drivers/gpu/drm/drm_bridge.c             | 19 +++++++++++++++++--
> >  include/drm/drm_modeset_helper_vtables.h | 31 +++++++++++++++++++++++++++++++
> >  2 files changed, 48 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 521a71c61b16..453ae3d174b4 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -32,6 +32,7 @@
> >  #include <drm/drm_edid.h>
> >  #include <drm/drm_encoder.h>
> >  #include <drm/drm_file.h>
> > +#include <drm/drm_modeset_helper_vtables.h>
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_print.h>
> >  
> > @@ -879,7 +880,8 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
> >  	unsigned int i, num_in_bus_fmts = 0;
> >  	struct drm_bridge_state *cur_state;
> >  	struct drm_bridge *prev_bridge;
> > -	u32 *in_bus_fmts;
> > +	struct drm_crtc *crtc = crtc_state->crtc;
> > +	u32 *in_bus_fmts, in_fmt;
> >  	int ret;
> >  
> >  	prev_bridge = drm_bridge_get_prev_bridge(cur_bridge);
> > @@ -933,7 +935,20 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
> >  		return -ENOMEM;
> >  
> >  	if (first_bridge == cur_bridge) {
> > -		cur_state->input_bus_cfg.format = in_bus_fmts[0];
> > +		in_fmt = in_bus_fmts[0];
> > +		if (crtc->helper_private &&
> > +		    crtc->helper_private->select_output_bus_format) {
> > +			in_fmt = crtc->helper_private->select_output_bus_format(
> > +							crtc,
> > +							crtc->state,
> > +							in_bus_fmts,
> > +							num_in_bus_fmts);
> > +			if (!in_fmt) {
> > +				kfree(in_bus_fmts);
> > +				return -ENOTSUPP;
> > +			}
> > +		}
> > +		cur_state->input_bus_cfg.format = in_fmt;
> 
> I don't think we should start poking at the CRTC internals, but we
> should rather provide a helper here.

It would probably look cleaner, yes.

> >  		cur_state->output_bus_cfg.format = out_bus_fmt;
> >  		kfree(in_bus_fmts);
> >  		return 0;
> > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > index 881b03e4dc28..7c21ae1fe3ad 100644
> > --- a/include/drm/drm_modeset_helper_vtables.h
> > +++ b/include/drm/drm_modeset_helper_vtables.h
> > @@ -489,6 +489,37 @@ struct drm_crtc_helper_funcs {
> >  				     bool in_vblank_irq, int *vpos, int *hpos,
> >  				     ktime_t *stime, ktime_t *etime,
> >  				     const struct drm_display_mode *mode);
> > +
> > +	/**
> > +	 * @select_output_bus_format
> > +	 *
> > +	 * Called by the first connected DRM bridge to negotiate input media
> > +	 * bus format. CRTC is expected to pick preferable media formats from
> > +	 * the list supported by the DRM bridge chain.
> 
> There's nothing restricting it to bridges here. Please rephrase this to
> remove the bridge mention. The user is typically going to be the
> encoder, and bridges are just an automagic implementation of an encoder.
> 
> And generally speaking, I'd really like to have an implementation
> available before merging this.

There's a downstream implementation in the Xilinx kernel, which would
indeed be nice to upstream. This shouldn't block patches 1/4 to 3/4
though, those can be merged once review comments are taken into account.

-- 
Regards,

Laurent Pinchart
