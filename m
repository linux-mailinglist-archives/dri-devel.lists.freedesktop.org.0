Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7232D6063
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA306EA90;
	Thu, 10 Dec 2020 15:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B1E6EA90
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:50:43 +0000 (UTC)
Date: Thu, 10 Dec 2020 15:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607615441;
 bh=B1+xPAuBDsXYb2x/z69Z6BTcE5TGOXAA7b1lkaQgV6Q=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=WRB7WVeqprJnySXmeJh8yXcC7ASJy5DAzKyFNk4nWxzghHBraAex1VT9XVSYFNrX7
 MP0Qtvck6L89Ec5V+u9CIV81WQMChmqP9AOKAYz+2hsdyTlJrpzj4QUrGFyZEhdhIE
 x1eL859Xe54YNLEpOrytcL95YfkHyJgNMwUalOUSAFJ+ckeU2eXIgQ3/3/nE8f2f5u
 GiQ3kqulozCE5Fz3HCB1AzRl2IjzQHwOmmDZnIukYPwyzWtK3VLeo47gu8gbitS1cZ
 iQ2VBj6DAbgOilTVfQH/oHKOUApd4ab3dDLuTfDrUA+8Ctfkg2AX6w4BXjIybv5W4Z
 ur0U+LoccKdRQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 3/3] drm: require a non_NULL drm_crtc.primary
Message-ID: <kW7vylF0J6Nbh0g1bvYEuG1DgaYRFH0ovsnD0c0SeU@cp3-web-024.plabs.ch>
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
Cc: Daniel Vetter <daniel@ffwll.ch>
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
