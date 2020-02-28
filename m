Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA17174626
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 11:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7EF6E30E;
	Sat, 29 Feb 2020 10:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73CA06E0F8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 20:05:38 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 5ED0C806C;
 Fri, 28 Feb 2020 20:06:22 +0000 (UTC)
Date: Fri, 28 Feb 2020 12:05:34 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [RFC] drm/omap: Create only one primary plane for CRTC
Message-ID: <20200228200534.GO37466@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Sat, 29 Feb 2020 10:13:17 +0000
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
Cc: Merlijn Wajer <merlijn@wizzup.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, ruleh <ruleh@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Looks like sway and wlroots won't work with omaprdrm because of
the following error:

backend/drm/drm.c:86: add_plane: Assertion
!(type == DRM_PLANE_TYPE_PRIMARY &&  crtc->primary)

Looks like there should only be one primary plane per CRTC?

There's some discussion about that for a wlroots bug at:

https://github.com/swaywm/wlroots/issues/1943

And there's a link pointing to the kms docs:

https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-kms.html#plane-abstraction

Below is a quick hack fix I used to get sway started.

Not sure how the primary plane should be picked? I just
used 0 as the primary plane to get things working :)

I can start xterm on sway, but so far no fonts only the
borders.

Regards,

Tony

8< ----------------------
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index d2750f60f519..122f8c4cf45b 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -268,7 +268,7 @@ static int omap_modeset_init(struct drm_device *dev)
 	plane_crtc_mask = (1 << priv->num_pipes) - 1;
 
 	for (i = 0; i < num_ovls; i++) {
-		enum drm_plane_type type = i < priv->num_pipes
+		enum drm_plane_type type = i == 0
 					 ? DRM_PLANE_TYPE_PRIMARY
 					 : DRM_PLANE_TYPE_OVERLAY;
 		struct drm_plane *plane;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
