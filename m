Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE014A93F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 18:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7AE6E506;
	Mon, 27 Jan 2020 17:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61B66E506;
 Mon, 27 Jan 2020 17:49:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B25BB28C174;
 Mon, 27 Jan 2020 17:49:21 +0000 (GMT)
Date: Mon, 27 Jan 2020 18:49:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v9 01/12] drm/bridge: Add a drm_bridge_state object
Message-ID: <20200127184918.60b3cdf3@collabora.com>
In-Reply-To: <20200127172652.GB43062@phenom.ffwll.local>
References: <20200127110043.2731697-1-boris.brezillon@collabora.com>
 <20200127110043.2731697-2-boris.brezillon@collabora.com>
 <20200127172652.GB43062@phenom.ffwll.local>
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
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Jan 2020 18:26:52 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, Jan 27, 2020 at 12:00:32PM +0100, Boris Brezillon wrote:
> > One of the last remaining objects to not have its atomic state.
> > 
> > This is being motivated by our attempt to support runtime bus-format
> > negotiation between elements of the bridge chain.
> > This patch just paves the road for such a feature by adding a new
> > drm_bridge_state object inheriting from drm_private_obj so we can
> > re-use some of the existing state initialization/tracking logic.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> > Changes in v9:
> > * Clarify the fact that the bridge->atomic_reset() and
> >   {connector,plane,crtc,...}->reset() semantics are different
> > * Move the drm_atomic_private_obj_init() call back to
> >   drm_bridge_attach()
> > * Check the presence of ->atomic_duplicate_state instead of  
> >   ->atomic_reset in drm_atomic_add_encoder_bridges()  
> > * Fix copy&paste errors in the atomic bridge state helpers doc
> > * Add A-b/R-b tags
> > 
> > Changes in v8:
> > * Move bridge state helpers out of the CONFIG_DEBUGFS section
> > 
> > Changes in v7:
> > * Move helpers, struct-defs, ... to atomic helper files to avoid the
> >   drm -> drm_kms_helper -> drm circular dep
> > * Stop providing default implementation for atomic state reset,
> >   duplicate and destroy hooks (has to do with the helper/core split)
> > * Drop all R-b/T-b as helpers have now be moved to other places  
> 
> ^^ we generally keep the changelog when committing in drm, since it
> contains useful stuff.

Alright (I tend to forget that drm does things differently). I find it a
bit redundant given the final commit also contains a patchwork link
which contains all revisions + the discussion that happened on each
version.

> If you don't want to do that, then at least update
> the commit message to make sure all the design discussion is reflected in
> there somewhere. Which atm it definitely isn't.

I'll update the commit messages to add those changelogs.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
