Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C8A437EAD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 21:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67806EDA6;
	Fri, 22 Oct 2021 19:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4656A6EDA6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 19:32:14 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id c44089ca-336e-11ec-9c3f-0050568c148b;
 Fri, 22 Oct 2021 19:32:17 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2C439194B23;
 Fri, 22 Oct 2021 21:32:09 +0200 (CEST)
Date: Fri, 22 Oct 2021 21:32:08 +0200
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
Message-ID: <YXMRuKkWyF9tGhG3@ravnborg.org>
References: <20211020181901.2114645-1-sam@ravnborg.org>
 <20211020181901.2114645-2-sam@ravnborg.org>
 <YXLHlaLfPD4wI7R7@pendragon.ideasonboard.com>
 <YXLsbp+IwiRYfY2a@ravnborg.org> <YXLxVoA133IEes6p@ravnborg.org>
 <YXMGHYY40+aPuDm7@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXMGHYY40+aPuDm7@pendragon.ideasonboard.com>
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

On Fri, Oct 22, 2021 at 09:42:37PM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> On Fri, Oct 22, 2021 at 07:13:58PM +0200, Sam Ravnborg wrote:
> > Hi Laurent,
> > 
> > > From a quick look only cadence/cdns-mhdp8546 subclass
> > > drm_bridge_state and I wonder if the right thing to do would be to
> > > implement fallback to the helpers if the bridge driver do not set
> > > any of the .atomic_duplicate_state(), .atomic_destroy_state(), or .atomic_reset().
> > > 
> > > That would drop the following from a few bridges:
> > >         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > >         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > >         .atomic_reset = drm_atomic_helper_bridge_reset,
> > 
> > To answer myself here. This would create a dependency from the core to
> > the helpers which is not OK so idea dropped again.
> 
> I agree it would be nicer, but the dependency is likely a problem. That
> being said, we have multiple types of helpers. The first set is the
> modeset helpers, which were designed as one implementation of KMS
> operations, with an opt-in API for drivers. The core should not depend
> on those. There are however other helpers that are only default
> implementations of some operations, without any dependency on other
> components. The atomic state helpers fall in this category, they
> implement .atomic_* operations of the drm_*_funcs structures, not
> drm_*_helper_funcs. It could make sense to move them to the DRM core.

For now I went with a simple macro:

+/**
+ * DRM_BRIDGE_STATE_OPS - Default drm_bridge state funcs
+ *
+ * Bridge driver that do not subclass &drm_bridge_state can use the helpers
+ * for reset, duplicate, and destroy. This macro provides a shortcut for
+ * setting the helpers in the &drm_bridge_funcs structure.
+ */
+#define DRM_BRIDGE_STATE_OPS \
+       .atomic_reset = drm_atomic_helper_bridge_reset,                         \
+       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,     \
+       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state
+

Thomas Z. is trying to make the core smaller so pulling in these helpers
would be counterproductive to that. So I took the simpler approach here
which we have already done in several places.
It will be part of v3 when I post it.

Drop a note if you (or any other reader) have better ideas.

	Sam
