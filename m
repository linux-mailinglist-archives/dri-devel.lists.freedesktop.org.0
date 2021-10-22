Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1247437B23
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 18:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF216E7EA;
	Fri, 22 Oct 2021 16:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521906E7EA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 16:53:11 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 8aef5764-3358-11ec-9c3f-0050568c148b;
 Fri, 22 Oct 2021 16:53:12 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 18998194B9C;
 Fri, 22 Oct 2021 18:53:04 +0200 (CEST)
Date: Fri, 22 Oct 2021 18:53:02 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philip Chen <philipchen@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 1/7] drm/bridge: ps8640: Use atomic variants of
 drm_bridge_funcs
Message-ID: <YXLsbp+IwiRYfY2a@ravnborg.org>
References: <20211020181901.2114645-1-sam@ravnborg.org>
 <20211020181901.2114645-2-sam@ravnborg.org>
 <YXLHlaLfPD4wI7R7@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXLHlaLfPD4wI7R7@pendragon.ideasonboard.com>
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

> > @@ -508,8 +510,8 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
> >  	.attach = ps8640_bridge_attach,
> >  	.detach = ps8640_bridge_detach,
> >  	.get_edid = ps8640_bridge_get_edid,
> > -	.post_disable = ps8640_post_disable,
> > -	.pre_enable = ps8640_pre_enable,
> > +	.atomic_post_disable = ps8640_atomic_post_disable,
> > +	.atomic_pre_enable = ps8640_atomic_pre_enable,
> 
> Don't you also need to implement .atomic_duplicate_state(),
> .atomic_destroy_state() and .atomic_reset() to use the atomic API ?

What I think happens is that the atomic drivers uses the bridges and
the implementation in drm_bridge has fall-backs to the non-atomic
variants.

So for example drm_atomic_bridge_chain_pre_enable() will call
atomic_pre_enable() if it exists, and if not it will call pre_enable()
if it exists.

With this patch-set I show that the non-atomic versions of several of
the drm_bridge helper functions are almost not used and easy to drop.
So based on this I concluded that the bridge drivers were used
in a way so we only would need to implement the atomic variants
of the functions.

That said I did not consider .atomic_duplicate_state(),
.atomic_destroy_state(), or .atomic_reset().

From a quick look only cadence/cdns-mhdp8546 subclass
drm_bridge_state and I wonder if the right thing to do would be to
implement fallback to the helpers if the bridge driver do not set
any of the .atomic_duplicate_state(), .atomic_destroy_state(), or .atomic_reset().

That would drop the following from a few bridges:
        .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
        .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
        .atomic_reset = drm_atomic_helper_bridge_reset,

And new bridges (or bridges we convert to use the atomic operations)
would not have to specify them.

I would prefer implementing the fallback - rather than adding the above
to this driver.

	Sam
