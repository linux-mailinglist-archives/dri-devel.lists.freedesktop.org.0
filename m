Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324251E227C
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 14:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CFA6E029;
	Tue, 26 May 2020 12:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE836E029
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 12:59:19 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 176592A2CE4;
 Tue, 26 May 2020 13:59:17 +0100 (BST)
Date: Tue, 26 May 2020 14:59:13 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 10/27] drm: bridge: Pass drm_display_info to
 drm_bridge_funcs .mode_valid()
Message-ID: <20200526145913.3b13b0ee@collabora.com>
In-Reply-To: <20200526011505.31884-11-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-11-laurent.pinchart+renesas@ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Guido =?UTF-8?B?R8O8bnRoZXI=?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Chris Zhong <zyw@rock-chips.com>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Icenowy Zheng <icenowy@aosc.io>,
 Tomasz Stanislawski <t.stanislaws@samsung.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Jyri Sarha <jsarha@ti.com>,
 Maciej Purski <m.purski@samsung.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Philippe Cornu <philippe.cornu@st.com>, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 May 2020 04:14:48 +0300
Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:

> When validating a mode, bridges may need to do so in the context of a
> display, as specified by drm_display_info. An example is the meson
> dw-hdmi bridge that needs to consider the YUV 4:2:0 output format to
> perform clock calculations.
> 
> Bridges that need the display info currently retrieve it from the
> drm_connector created by the bridge. This gets in the way of moving
> connector creation out of bridge drivers. To make this possible, pass
> the drm_display_info to drm_bridge_funcs .mode_valid().
> 
> Changes to the bridge drivers have been performed with the following
> coccinelle semantic patch and have been compile-tested.
> 
> @ rule1 @
> identifier funcs;
> identifier fn;
> @@
>  struct drm_bridge_funcs funcs = {
>  	...,
>  	.mode_valid = fn
>  };
> 
> @ depends on rule1 @
> identifier rule1.fn;
> identifier bridge;
> identifier mode;
> @@
>  enum drm_mode_status fn(
>  	struct drm_bridge *bridge,
> +	const struct drm_display_info *info,
>  	const struct drm_display_mode *mode
>  )
>  {
>  	...
>  }
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
