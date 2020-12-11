Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB442D740F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 11:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789BD6ED8A;
	Fri, 11 Dec 2020 10:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6086ED8A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 10:39:27 +0000 (UTC)
Date: Fri, 11 Dec 2020 10:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607683165;
 bh=JO817r3UkRGbVh3+bjWe7bzowlSvKcQJY1dDhxr7m6Y=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=V4T57hptmaJvX8zj/0NomVE5UJNBe7HiJuK0VsGCGFGb15abTUXrTy7yFquPFmXGf
 B5wVmx5noBdelmEyu0ZamyvTVRu8XMXFCZlPvqlgk9sCriqXoz3TaSkMpgKbnctiH4
 Nd7dtiWDrJ04r0Z2udIukPnYlpSW+pgC1QZjgeG2RBuY2DXsY9BRWDLzzhcrXudKG+
 KR70L3cc0LF/AQB313P6Jf+YyepgnAaKWV9h7LjAgl7bxbIycTcFdp/xsOZgel4I05
 eDOezn0BvVg3fRV4eEO1RXfzLRnAE45+hyfJy7d1qnLOYeoOdigRwvil4nLTf3UUNc
 2r9PHhp7LoG0g==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 3/4] drm: require a non_NULL drm_crtc.primary
Message-ID: <IfV2dUMBW6frioBx30kUI3KZst4f2vxLvvhz5n6FGI@cp3-web-020.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a CRTC is missing a legacy primary plane pointer, a lot of things
will be broken for user-space: fbdev stops working and the entire legacy
uAPI stops working.

Require all drivers to populate drm_crtc.primary to prevent these
issues. Warn if it's NULL.

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 drivers/gpu/drm/drm_mode_config.c | 3 +++
 drivers/gpu/drm/drm_plane.c       | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 2c73a60e8765..fbe680035129 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -639,6 +639,9 @@ void drm_mode_config_validate(struct drm_device *dev)
 	}
 
 	drm_for_each_crtc(crtc, dev) {
+		WARN(!crtc->primary, "Missing primary plane on [CRTC:%d:%s]\n",
+		     crtc->base.id, crtc->name);
+
 		if (crtc->primary) {
 			WARN(!(crtc->primary->possible_crtcs & BIT(crtc->index)),
 			     "Bogus primary plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 5d33ca9f0032..49b0a8b9ac02 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -57,7 +57,7 @@
  * Legacy uAPI doesn't expose the primary and cursor planes directly. DRM core
  * relies on the driver to set the primary and optionally the cursor plane used
  * for legacy IOCTLs. This is done by calling drm_crtc_init_with_planes(). All
- * drivers should provide one primary plane per CRTC to avoid surprising legacy
+ * drivers must provide one primary plane per CRTC to avoid surprising legacy
  * userspace too much.
  */
 
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
