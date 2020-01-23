Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00C01462BE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 08:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3236F9B9;
	Thu, 23 Jan 2020 07:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D7C6F9B9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 07:39:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5D7DF28CE86;
 Thu, 23 Jan 2020 07:39:36 +0000 (GMT)
Date: Thu, 23 Jan 2020 08:39:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v7 06/12] drm/bridge: Add the necessary bits to support
 bus format negotiation
Message-ID: <20200123083933.64fc98be@collabora.com>
In-Reply-To: <5a15dda1-0791-c1b6-94aa-4fed25bbcca9@kwiboo.se>
References: <20200122111700.1924960-1-boris.brezillon@collabora.com>
 <20200122111700.1924960-7-boris.brezillon@collabora.com>
 <5a15dda1-0791-c1b6-94aa-4fed25bbcca9@kwiboo.se>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Jan 2020 23:44:28 +0000 (UTC)
Jonas Karlman <jonas@kwiboo.se> wrote:

> > +static int
> > +drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
> > +					struct drm_crtc_state *crtc_state,
> > +					struct drm_connector_state *conn_state)
> > +{
> > +	struct drm_connector *conn = conn_state->connector;
> > +	struct drm_encoder *encoder = bridge->encoder;
> > +	struct drm_bridge_state *last_bridge_state;
> > +	unsigned int i, num_out_bus_fmts;
> > +	struct drm_bridge *last_bridge;
> > +	u32 *out_bus_fmts;
> > +	int ret = 0;
> > +
> > +	last_bridge = list_last_entry(&encoder->bridge_chain,
> > +				      struct drm_bridge, chain_node);
> > +	last_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> > +							    last_bridge);
> > +
> > +	if (last_bridge->funcs->atomic_get_output_bus_fmts) {
> > +		const struct drm_bridge_funcs *funcs = last_bridge->funcs;
> > +
> > +		/*
> > +		 * If the driver implements ->atomic_get_output_bus_fmts() it
> > +		 * should also implement the atomic state hooks.
> > +		 */
> > +		if (WARN_ON(last_bridge_state))  
> 
> This looks wrong, with this changed to WARN_ON(!last_bridge_state)
> my RK3328 HDMI2.0/YUV444/YUV420/10-bit branch at [1] starts working.
> 
> With WARN_ON(last_bridge_state) I get:
> 
> [    6.606658] WARNING: CPU: 0 PID: 167 at drivers/gpu/drm/drm_bridge.c:746 drm_atomic_bridge_chain_check+0x2b8/0x308
> [    6.606673] Hardware name: Pine64 Rock64 (DT)
> 
> [    6.606754] Call trace:
> [    6.606759]  drm_atomic_bridge_chain_check+0x2b8/0x308
> [    6.606764]  drm_atomic_helper_check_modeset+0x89c/0xab8
> [    6.606768]  drm_atomic_helper_check+0x1c/0xa0
> [    6.606772]  drm_atomic_check_only+0x464/0x708
> [    6.606777]  drm_atomic_commit+0x18/0x58

Add

const drm_bridge_funcs ... = {
	...
	.atomic_reset = drm_atomic_helper_bridge_reset,
	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
	...
};

and that should work.

> 
> [1] https://github.com/Kwiboo/linux-rockchip/commits/next-20200122-bus-format
> 
> Regards,
> Jonas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
