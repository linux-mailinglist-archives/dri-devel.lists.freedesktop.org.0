Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC8437EB1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 21:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC49A6EDB4;
	Fri, 22 Oct 2021 19:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EF16EDB4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 19:33:42 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id f90b2a83-336e-11ec-9c3f-0050568c148b;
 Fri, 22 Oct 2021 19:33:45 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 65D59194B23;
 Fri, 22 Oct 2021 21:33:39 +0200 (CEST)
Date: Fri, 22 Oct 2021 21:33:38 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philip Chen <philipchen@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 3/7] drm/bridge: Add
 drm_atomic_get_new_crtc_for_bridge() helper
Message-ID: <YXMSEqUKJwyu6nqT@ravnborg.org>
References: <20211020181901.2114645-1-sam@ravnborg.org>
 <20211020181901.2114645-4-sam@ravnborg.org>
 <20211022110355.3q2yhlaygz4lgzhe@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022110355.3q2yhlaygz4lgzhe@gilmour>
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

On Fri, Oct 22, 2021 at 01:03:55PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Oct 20, 2021 at 08:18:57PM +0200, Sam Ravnborg wrote:
> > drm_atomic_get_new_crtc_for_bridge() will be used by bridge
> > drivers to provide easy access to the mode from the
> > drm_bridge_funcs operations.
> > 
> > The helper will be useful in the conversion to the atomic
> > operations of struct drm_bridge_funcs.
> > 
> > v2:
> >   - Renamed to drm_atomic_get_new_crtc_for_bridge (Maxime)
> >   - Use atomic_state, not bridge_State (Maxime)
> >   - Drop WARN on crtc_state as it is a valid case (Maxime)
> >   - Added small code snip to help readers
> >   - Updated description, fixed kernel-doc and exported the symbol
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/drm_atomic.c | 42 ++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_atomic.h     |  3 +++
> >  2 files changed, 45 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index ff1416cd609a..8b107194b157 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -1134,6 +1134,48 @@ drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
> >  }
> >  EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
> >  
> > +/**
> > + * drm_atomic_get_new_crtc_for_bridge - get new crtc_state for the bridge
> > + * @state: state of the bridge
> > + * @bridge: bridge object
> 
> I appreciate that the function name is fairly long already, but given
> its name I'd expect it to return a drm_crtc, not drm_crtc_state.
> 
> All the other state related functions are named using the pattern
> drm_atomic_get_(old|new)_$object_state.
> 
> Moreover, we already have a drm_atomic_get_new_connector_for_encoder
> function that does return a drm_connector, so I think we should make it
> consistent there and call it drm_atomic_get_new_crtc_state_for_bridge

That's a better name - thanks! I will fix it in v3.

	Sam
