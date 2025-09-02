Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A01EB40E87
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 22:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9C910E02A;
	Tue,  2 Sep 2025 20:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hBkpiwO/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D9410E02A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 20:22:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DE083B63;
 Tue,  2 Sep 2025 22:21:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1756844485;
 bh=KHA3OTYDrxohM+F5nBqSD1koWav84WhhtxYj8tGqRLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hBkpiwO/WE/7uKBGJ0uPvqn2BWlR0kQGt9VKcqI22pYOVr7TFhum2lSMa5CoaqOym
 EPAWs+FZfsrV8d8WFdEOgAnUujqQoTaFjIYjvYYjC79c3ZtCIwDR6BTyt1Q/d4ZRLX
 VO7BaWfDyIaGPuAXLkRnNrtKzMqX3OajnjNL23EM=
Date: Tue, 2 Sep 2025 22:22:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/29] drm/bridge: Implement atomic_print_state
Message-ID: <20250902202212.GU13448@pendragon.ideasonboard.com>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-6-14ad5315da3f@kernel.org>
 <056b0335-f104-4b67-9882-6beaecd21c76@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <056b0335-f104-4b67-9882-6beaecd21c76@suse.de>
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

On Tue, Sep 02, 2025 at 03:22:40PM +0200, Thomas Zimmermann wrote:
> Am 02.09.25 um 10:32 schrieb Maxime Ripard:
> > Bridges have some fields in their state worth printing, but we don't
> > provide an atomic_print_state implementation to show those fields.
> >
> > Let's do so.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/gpu/drm/drm_bridge.c | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index dd439d55177a867acb7ab73c02182bada44d93c9..e803dfd8fd5aae9c16931445213df04d8715b9f6 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -370,13 +370,31 @@ drm_bridge_atomic_destroy_priv_state(struct drm_private_obj *obj,
> >   	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
> >   
> >   	bridge->funcs->atomic_destroy_state(bridge, state);
> >   }
> >   
> > +static void
> > +drm_bridge_atomic_print_priv_state(struct drm_printer *p,
> > +				   const struct drm_private_state *s)
> > +{
> > +	const struct drm_bridge_state *state =
> > +		container_of_const(s, struct drm_bridge_state, base);
> 
> Maybe adopt drm_priv_to_bridge_state() to accept const pointers?
> 
> https://elixir.bootlin.com/linux/v6.16.4/source/include/drm/drm_atomic.h#L1236

container_of_const() can helper, but drm_priv_to_bridge_state() will
need to be turned into a macro.

> > +	struct drm_bridge *bridge = drm_priv_to_bridge(s->obj);
> > +
> > +	drm_printf(p, "bridge: %s", drm_get_connector_type_name(bridge->type));

It would be nice to identify the bridge more precisely, but bridges have
no object ID :-/ The raw pointer may not be very useful. I wonder if we
should give an object ID to drm_private_obj instances, even if we don't
expose them to userspace. That's not a topic for this series of course.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > +	drm_printf(p, "\tinput bus configuration:");
> > +	drm_printf(p, "\t\tcode: %04x", state->input_bus_cfg.format);
> > +	drm_printf(p, "\t\tflags: %08x", state->input_bus_cfg.flags);
> > +	drm_printf(p, "\toutput bus configuration:");
> > +	drm_printf(p, "\t\tcode: %04x", state->output_bus_cfg.format);
> > +	drm_printf(p, "\t\tflags: %08x", state->output_bus_cfg.flags);
> > +}
> > +
> >   static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
> >   	.atomic_duplicate_state = drm_bridge_atomic_duplicate_priv_state,
> >   	.atomic_destroy_state = drm_bridge_atomic_destroy_priv_state,
> > +	.atomic_print_state = drm_bridge_atomic_print_priv_state,
> >   };
> >   
> >   static bool drm_bridge_is_atomic(struct drm_bridge *bridge)
> >   {
> >   	return bridge->funcs->atomic_reset != NULL;
> >

-- 
Regards,

Laurent Pinchart
