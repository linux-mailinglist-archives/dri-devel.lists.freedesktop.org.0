Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 401A42D7EE6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 19:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08766EA0C;
	Fri, 11 Dec 2020 18:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12CA6E1F8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 18:56:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 7101C3B4AF3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 18:46:59 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4B30DE000D;
 Fri, 11 Dec 2020 18:46:37 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/4] drm: require a non_NULL drm_crtc.primary
Date: Fri, 11 Dec 2020 19:46:33 +0100
Message-Id: <20201211184634.74534-3-contact@emersion.fr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211184634.74534-1-contact@emersion.fr>
References: <20201211184634.74534-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
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
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 drivers/gpu/drm/drm_mode_config.c | 3 +++
 drivers/gpu/drm/drm_plane.c       | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 1628c8b60d9a..1e5da83fd2a8 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -639,6 +639,9 @@ void drm_mode_config_validate(struct drm_device *dev)
 	}
 
 	drm_for_each_crtc(crtc, dev) {
+		WARN(!crtc->primary, "Missing primary plane on [CRTC:%d:%s]\n",
+		     crtc->base.id, crtc->name);
+
 		if (crtc->primary) {
 			WARN(!(crtc->primary->possible_crtcs & drm_crtc_mask(crtc)),
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
