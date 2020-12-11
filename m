Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D242D7636
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC3F6EDE0;
	Fri, 11 Dec 2020 13:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF486EDE0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 13:06:22 +0000 (UTC)
Date: Fri, 11 Dec 2020 13:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607691980;
 bh=JO817r3UkRGbVh3+bjWe7bzowlSvKcQJY1dDhxr7m6Y=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=Jh4zk+YCs2CpMIiKt6WYwhOzL+x5rb2O4Oagg9yrerT1rxg7RP5CMNIL4Lnw/qsra
 iQSGclh3WeE9OUO0ZQCWuWqZKolRyoRQtj6ojr9JjaFFiIhGt1Ms4ugPOsNICxnzM8
 VK8UX5drQoudSNj79+gOpCTPpQRC5VOxHO5+4MrYQOzce39hJSMRZQJpwxRcrSPczT
 555Ll7Lj+lcCoHKurngRrELiMNE8Flmo2ia9inGciQNvwdQMPI7/hypyHMNAMxTrsI
 j+KL6JyAdeiYzuVAZxPx5GaPjioqSSa1HRM1tC12Z5sKP7Ih3RAAHU+hI/g/bjO+3g
 janyEJuY7eAMg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 3/4] drm: require a non_NULL drm_crtc.primary
Message-ID: <58PfXYcauKFOHng9tchsfVjjt4XptOkdImbAxKpDwD8@cp7-web-041.plabs.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
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
