Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8FC437CB2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 20:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6566E530;
	Fri, 22 Oct 2021 18:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DCC6E530
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 18:42:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E42D51D;
 Fri, 22 Oct 2021 20:42:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634928177;
 bh=9b75vpvnNzR2RS5hMlZLa4f5UwudSSS5cCdLc7IPG4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mfIu+fWrA5jTPxZpcl4BuyndzDKwWirndooXR7dpKtJusgVGipDKhNUZQEsBRw5LU
 uvEmCzaQKD6pweNyf+wAlGqsMbEFRJ7yOBvNiXPhoi5zkf2qqcx/23zK5I5ap03oha
 Dllc8IqmfNcPCXc05kXfCdqa+36ieFa/PtbSLO8A=
Date: Fri, 22 Oct 2021 21:42:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
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
Message-ID: <YXMGHYY40+aPuDm7@pendragon.ideasonboard.com>
References: <20211020181901.2114645-1-sam@ravnborg.org>
 <20211020181901.2114645-2-sam@ravnborg.org>
 <YXLHlaLfPD4wI7R7@pendragon.ideasonboard.com>
 <YXLsbp+IwiRYfY2a@ravnborg.org> <YXLxVoA133IEes6p@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YXLxVoA133IEes6p@ravnborg.org>
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

Hi Sam,

On Fri, Oct 22, 2021 at 07:13:58PM +0200, Sam Ravnborg wrote:
> Hi Laurent,
> 
> > From a quick look only cadence/cdns-mhdp8546 subclass
> > drm_bridge_state and I wonder if the right thing to do would be to
> > implement fallback to the helpers if the bridge driver do not set
> > any of the .atomic_duplicate_state(), .atomic_destroy_state(), or .atomic_reset().
> > 
> > That would drop the following from a few bridges:
> >         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> >         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> >         .atomic_reset = drm_atomic_helper_bridge_reset,
> 
> To answer myself here. This would create a dependency from the core to
> the helpers which is not OK so idea dropped again.

I agree it would be nicer, but the dependency is likely a problem. That
being said, we have multiple types of helpers. The first set is the
modeset helpers, which were designed as one implementation of KMS
operations, with an opt-in API for drivers. The core should not depend
on those. There are however other helpers that are only default
implementations of some operations, without any dependency on other
components. The atomic state helpers fall in this category, they
implement .atomic_* operations of the drm_*_funcs structures, not
drm_*_helper_funcs. It could make sense to move them to the DRM core.

-- 
Regards,

Laurent Pinchart
